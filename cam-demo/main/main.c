/**
 * This example takes a picture every 5s and print its size on serial monitor.
 */

// =============================== SETUP ======================================

// 1. Board setup (Uncomment):
// #define BOARD_WROVER_KIT
// #define BOARD_ESP32CAM_AITHINKER
// #define BOARD_ESP32S3_WROOM
// #define BOARD_ESP32S3_XIAO
// #define BOARD_ESP32S3_GOOUUU
// #define BOARD_ESP32S3_XIAO

/**
 * 2. Kconfig setup
 *
 * If you have a Kconfig file, copy the content from
 *  https://github.com/espressif/esp32-camera/blob/master/Kconfig into it.
 * In case you haven't, copy and paste this Kconfig file inside the src directory.
 * This Kconfig file has definitions that allows more control over the camera and
 * how it will be initialized.
 */

/**
 * 3. Enable PSRAM on sdkconfig:
 *
 * CONFIG_ESP32_SPIRAM_SUPPORT=y
 *
 * More info on
 * https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/kconfig.html#config-esp32-spiram-support
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

#define BOARD_ESP32CAM_AITHINKER 1


#include "esp_lcd_panel_ops.h"


static QueueHandle_t xQueueLCDFrame = NULL; 


esp_lcd_panel_handle_t panel_handle = NULL ; 



#include "camera_pinout.h"
#include "lcd_driver.h"

#include "freertos/queue.h"


static const char *TAG = "example:take_picture";

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

    //XCLK 20MHz or 10MHz for OV2640 double FPS (Experimental)
    .xclk_freq_hz = 40000000,
    .ledc_timer = LEDC_TIMER_0,
    .ledc_channel = LEDC_CHANNEL_0,

    .pixel_format = PIXFORMAT_RGB565, //YUV422,GRAYSCALE,RGB565,JPEG
    .frame_size = FRAMESIZE_QVGA,    //QQVGA-UXGA, For ESP32, do not use sizes above QVGA when not JPEG. The performance of the ESP32-S series has improved a lot, but JPEG mode always gives better frame rates.

    .jpeg_quality = 12, //0-63, for OV series camera sensors, lower number means higher quality
    .fb_count = 1,       //When jpeg mode is used, if fb_count more than one, the driver will work in continuous mode.
    .fb_location = CAMERA_FB_IN_PSRAM,
    .grab_mode = CAMERA_GRAB_WHEN_EMPTY,
};

static esp_err_t init_camera(void)
{
    //initialize the camera
    esp_err_t err = esp_camera_init(&camera_config);
    if (err != ESP_OK)
    {
        ESP_LOGE(TAG, "Camera Init Failed");
        return err;
    }

    return ESP_OK;
}
#endif






// // lcd处理任务
// static void task_process_lcd(void *arg)
// {
//     camera_fb_t *frame = NULL;

//     while (true)
//     {
//         if (xQueueReceive(xQueueLCDFrame, &frame, portMAX_DELAY))
//         {
//             esp_lcd_panel_draw_bitmap(panel_handle, 0, 0, frame->width, frame->height, (uint16_t *)frame->buf);
//             esp_camera_fb_return(frame);

//         }
//     }
// }

// // 摄像头处理任务
// static void task_process_camera(void *arg)
// {
//     while (true)
//     {
//         camera_fb_t *frame = esp_camera_fb_get();
//         if (frame){
//             xQueueSend(xQueueLCDFrame, &frame, portMAX_DELAY);
//         }else {
//             // **关键点：如果获取帧失败 (返回 NULL)**，必须调用 vTaskDelay
//             // 以让出 CPU 周期，确保 WDT 被重置，避免重启。
//             ESP_LOGE(TAG, "Camera capture failed, retrying...");
//             vTaskDelay(pdMS_TO_TICKS(10)); // 让出 CPU 10ms
//         }

            
//     }
// }


void app_main(void)
{


    esp_lcd_panel_handle_t panel_handle = init_lcd() ; 


// #if ESP_CAMERA_SUPPORTED
    if(ESP_OK != init_camera()) {
        return;
    }

        
    // xQueueLCDFrame = xQueueCreate(2, sizeof(camera_fb_t *));
    // xTaskCreatePinnedToCore(task_process_camera, "task_process_camera", 5 * 1024, NULL, 5, NULL, 1);
    // xTaskCreatePinnedToCore(task_process_lcd, "task_process_lcd", 5 * 1024, NULL, 5, NULL, 0);





    while (1)
    {
        ESP_LOGI(TAG, "Taking picture...");
        camera_fb_t *pic = esp_camera_fb_get();


         esp_lcd_panel_draw_bitmap(panel_handle, 0, 0, pic->width ,pic->height, pic->buf);

        // use pic->buf to access the image
        ESP_LOGI(TAG, "Picture taken! Its size was: %zu bytes", pic->len);
        
        esp_camera_fb_return(pic);

        // vTaskDelay(5000 / portTICK_RATE_MS);
    }
// #else
//     ESP_LOGE(TAG, "Camera support is not available for this chip");
//     return;
// #endif


}