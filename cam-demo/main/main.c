/**
 * This example takes a picture and displays the preview on LCD.
 * High resolution photo saving is triggered by a button press.
 */

// ================================ CODE ======================================

#include <esp_log.h>
#include <esp_system.h>
#include <nvs_flash.h>
#include <sys/param.h>
#include <string.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

// support IDF 5.x
#ifndef portTICK_RATE_MS
#define portTICK_RATE_MS portTICK_PERIOD_MS
#endif

#include "esp_camera.h"
#include "iot_button.h"

// 假设这些头文件存在于您的项目中
#define CAMERA_MODEL_ESP32S3_EYE 1
#include "button_gpio.h"
#include "esp_lcd_panel_ops.h"
#include "esp_vfs_fat.h"
#include "sdmmc_cmd.h"
#include "driver/sdmmc_host.h"
#include "esp_timer.h"
#include "camera_pinout.h"
#include "lcd_driver.h"
#include "my_fs.h"


#define FUNC_SHOT 1


static const char *TAG = "example:take_picture";


button_handle_t gpio_btn = NULL;

static volatile bool g_take_photo = false;


#if ESP_CAMERA_SUPPORTED
static camera_config_t camera_config = {
  .pin_pwdn = CAM_PIN_PWDN,
  .pin_reset = CAM_PIN_RESET,
  .pin_xclk = CAM_PIN_XCLK,
  .pin_sccb_sda = CAM_PIN_SIOD,
  .pin_sccb_scl = CAM_PIN_SIOC,

  .pin_d7 = CAM_PIN_D7,
  .pin_d6 = CAM_PIN_D6,
  .pin_d5 = CAM_PIN_D5,
  .pin_d4 = CAM_PIN_D4,
  .pin_d3 = CAM_PIN_D3,
  .pin_d2 = CAM_PIN_D2,
  .pin_d1 = CAM_PIN_D1,
  .pin_d0 = CAM_PIN_D0,
  .pin_vsync = CAM_PIN_VSYNC,
  .pin_href = CAM_PIN_HREF,
  .pin_pclk = CAM_PIN_PCLK,

  .xclk_freq_hz = 40000000,
  .ledc_timer = LEDC_TIMER_0,
  .ledc_channel = LEDC_CHANNEL_0,

  .pixel_format = PIXFORMAT_JPEG, 
  .frame_size = FRAMESIZE_QVGA,  
  .jpeg_quality = 12, 
  .fb_count = 1,   
  .fb_location = CAMERA_FB_IN_PSRAM,
  .grab_mode = CAMERA_GRAB_WHEN_EMPTY,
};

static esp_err_t init_camera(void)
{
  esp_err_t err = esp_camera_init(&camera_config);
  if (err != ESP_OK)
  {
    ESP_LOGE(TAG, "Camera Init Failed");
    return err;
  }
  return ESP_OK;
}
#endif


/**
 * @brief 快门按下回调函数
 * 仅设置一个标志位，让拍照任务去处理后续逻辑。
 */
static void button_shot(void *arg,void *usr_data)
{
  ESP_LOGI(TAG, "快门按下，触发拍照");
  g_take_photo = true; 
}


/**
 * @brief 初始化快门按钮
 * 修复了按钮创建和回调注册的逻辑错误。
 */
void init_shot_button(){
    const button_config_t btn_cfg = {0};
    const button_gpio_config_t btn_gpio_cfg = {
        .gpio_num = 0,
        .active_level = 0, // 假设按钮按下时拉低
    };

    esp_err_t ret = iot_button_new_gpio_device(&btn_cfg, &btn_gpio_cfg, &gpio_btn);
    
    // **修复: 确保创建成功才注册回调**
    if(NULL == gpio_btn) {
        ESP_LOGE(TAG, "Button create failed: %s", esp_err_to_name(ret));
    }
}


static void get_uptime_hhmmss(char *out, size_t len)
{
  int64_t sec = esp_timer_get_time() / 1000000;
  int hh = (sec / 3600) % 24;
  int mm = (sec / 60) % 60;
  int ss = sec % 60;
  snprintf(out, len, "%02d%02d%02d", hh, mm, ss);
}




void app_main(void)
{






  #if FUNC_SHOT 
      sdmmc_card_t* card = init_sdcard() ; 
  #endif


    // --- 1. 初始化和硬件检查 ---

    // 初始化相机
    if (ESP_OK != init_camera())
    {
        return;
    }
    
 

    // 初始化 LCD 
   esp_lcd_panel_handle_t  panel_handle = init_lcd();
    if (panel_handle == NULL) {
        ESP_LOGE(TAG, "LCD initialisation failed.");
        // 不退出，但 run 任务会检查它
    }

 
    
    
    // 初始化按钮 (创建 gpio_btn 句柄)
    init_shot_button() ;
    
    // 注册按钮回调
    if (gpio_btn != NULL) {
        iot_button_register_cb(gpio_btn, BUTTON_SINGLE_CLICK, NULL, button_shot, NULL);
        ESP_LOGI(TAG, "Button callback registered.");
    } else {
         ESP_LOGE(TAG, "Failed to register button callback (gpio_btn is NULL).");
    }



    // 检查必要的句柄
    if (panel_handle == NULL) {
        ESP_LOGE(TAG, "LCD handle is NULL. Task exiting.");
        vTaskDelete(NULL); 
        return;
    }

    while(1){
         uint16_t *rgb565_buffer = NULL;

          #if FUNC_SHOT 

        if(g_take_photo){
        g_take_photo = false ;

        camera_fb_t *pic2 = esp_camera_fb_get();
    
        ESP_LOGI(TAG,"开始保存照片了") ; 

        char ts[16];
        char filename[64];
        get_uptime_hhmmss(ts, sizeof(ts));
        snprintf(filename, sizeof(filename), "/sdcard/IMG_%s.jpg", ts);


        ESP_LOGI(TAG,"文件名字是%s",filename) ; 

        FILE *f = fopen(filename, "wb");
        if (f) {
          fwrite(pic2->buf, 1, pic2->len, f);
          fflush(f); 
          fclose(f);
          ESP_LOGI(TAG,"照片保存完成了") ; 
        }else{
                ESP_LOGI(TAG,"文件打开失败") ; 
        }


        esp_camera_fb_return(pic2);
 


         


        // esp_vfs_fat_sdcard_unmount("/sdcard", card);

        // ESP_LOGI(TAG,"卡已经卸载") ; 

        }

        #endif

        // 注意：拍照逻辑已移至 task_take_photo，此处只留预览逻辑

        // 2. JPEG 解码和内存分配 (使用 MALLOC_CAP_INTERNAL for fast internal RAM)


          // 1. 获取预览帧
        camera_fb_t *pic = esp_camera_fb_get();
        if (pic == NULL) {
            ESP_LOGE(TAG, "Failed to get camera preview frame, retrying.");
            vTaskDelay(pdMS_TO_TICKS(10));
            continue;
        }


        size_t out_w = pic->width/1; 
        size_t out_h = pic->height/1; 
        size_t rgb565_buf_size = out_w * out_h * 2;

        rgb565_buffer = (uint16_t *)heap_caps_malloc(rgb565_buf_size, MALLOC_CAP_8BIT | CAMERA_FB_IN_PSRAM);

        if (!rgb565_buffer) {
            ESP_LOGE(TAG, "Failed to allocate RGB565 buffer");
            esp_camera_fb_return(pic);
            continue;
        }

        if (!jpg2rgb565(pic->buf, pic->len, (uint8_t *)(rgb565_buffer), JPG_SCALE_NONE)) {
            ESP_LOGE(TAG, "JPEG to RGB565 conversion failed");
            heap_caps_free(rgb565_buffer);
            esp_camera_fb_return(pic);
            continue;
        }




        // 3. 刷新 LCD
        esp_lcd_panel_draw_bitmap(panel_handle, 0, 0, pic->width, pic->height, (uint16_t *)(rgb565_buffer));
        
        // 4. 释放资源
         heap_caps_free(rgb565_buffer);
        esp_camera_fb_return(pic);

        ESP_LOGI(TAG,"running");

    // vTaskDelay(pdMS_TO_TICKS(50)); // 控制预览帧率
  }

}