idf_component_register(SRCS "my_fs.c" "main.c" "lcd_driver.c" "lvgl_demo_ui.c"
 PRIV_REQUIRES nvs_flash esp_psram  esp_lcd esp_driver_jpeg fatfs 
                    INCLUDE_DIRS ".")