

Rebooting...
ets Jul 29 2019 12:21:46

rst:0xc (SW_CPU_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:6380
ho 0 tail 12 room 4
load:0x40078000,len:15916
load:0x40080400,len:3860
--- 0x40080400: _invalid_pc_placeholder at C:/Users/15768/esp/v5.5/esp-idf/components/xtensa/xtensa_vectors.S:2235
entry 0x40080638
I (29) boot: ESP-IDF v5.5 2nd stage bootloader
I (29) boot: compile time Dec 14 2025 23:58:50
I (29) boot: Multicore bootloader
I (30) boot: chip revision: v3.1
I (33) boot.esp32: SPI Speed      : 40MHz
I (37) boot.esp32: SPI Mode       : DIO
I (40) boot.esp32: SPI Flash Size : 2MB
I (44) boot: Enabling RNG early entropy source...
I (48) boot: Partition Table:
I (51) boot: ## Label            Usage          Type ST Offset   Length
I (57) boot:  0 nvs              WiFi data        01 02 00009000 00006000
I (64) boot:  1 phy_init         RF data          01 01 0000f000 00001000
I (70) boot:  2 factory          factory app      00 00 00010000 00100000
I (77) boot: End of partition table
I (80) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=15324h ( 86820) map
I (117) esp_image: segment 1: paddr=0002534c vaddr=3ff80000 size=00020h (    32) load
I (118) esp_image: segment 2: paddr=00025374 vaddr=3ffb0000 size=04e34h ( 20020) load
I (129) esp_image: segment 3: paddr=0002a1b0 vaddr=40080000 size=05e68h ( 24168) load
I (138) esp_image: segment 4: paddr=00030020 vaddr=400d0020 size=2bb4ch (179020) map
I (200) esp_image: segment 5: paddr=0005bb74 vaddr=40085e68 size=0dee4h ( 57060) load
I (232) boot: Loaded app from partition at offset 0x10000
I (232) boot: Disabling RNG early entropy source...
I (243) quad_psram: This chip is ESP32-D0WD
I (244) esp_psram: Found 8MB PSRAM device
I (245) esp_psram: Speed: 40MHz
I (245) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
W (250) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
I (258) cpu_start: Multicore app
I (1167) esp_psram: SPI SRAM memory test OK
I (1175) cpu_start: Pro cpu start user code
I (1175) cpu_start: cpu freq: 160000000 Hz
I (1175) app_init: Application information:
I (1175) app_init: Project name:     cam-demo
I (1179) app_init: App version:      90b0a67-dirty
I (1184) app_init: Compile time:     Dec 15 2025 00:08:57
I (1189) app_init: ELF file SHA256:  736d5c3c3...
I (1193) app_init: ESP-IDF:          v5.5
I (1197) efuse_init: Min chip rev:     v0.0
I (1201) efuse_init: Max chip rev:     v3.99
I (1205) efuse_init: Chip rev:         v3.1
I (1209) heap_init: Initializing. RAM available for dynamic allocation:
I (1215) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (1220) heap_init: At 3FFB6098 len 00029F68 (167 KiB): DRAM
I (1226) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
I (1231) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
I (1237) heap_init: At 40093D4C len 0000C2B4 (48 KiB): IRAM
I (1243) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
W (1250) spi_flash: boya detected but related driver is not linked, please check option `SPI_FLASH_SUPPORT_BOYA_CHIP`
I (1259) spi_flash: detected chip: generic
I (1263) spi_flash: flash io: dio
W (1266) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
I (1279) main_task: Started on CPU0
I (1289) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
I (1289) main_task: Calling app_main()
I (1289) cam_hal: cam init ok
I (1289) sccb-ng: pin_sda 26 pin_scl 27
I (1299) sccb-ng: sccb_i2c_port=1
I (1329) ov3660: Mismatch PID=0x5640
I (1329) camera: Camera PID=0x5640 VER=0x00 MIDL=0x00 MIDH=0x00
I (1329) camera: Detected OV5640 camera
I (1329) camera: Detected camera at address=0x3c
I (2009) cam_hal: PSRAM DMA mode disabled
I (2009) esp32 ll_cam: node_size: 2560, nodes_per_line: 1, lines_per_node: 1, dma_half_buffer_min:  2560, dma_half_buffer: 15360,lines_per_half_buffer:  6, dma_buffer_size: 30720, image_size: 153600
I (2019) cam_hal: buffer_size: 30720, half_buffer_size: 15360, node_buffer_size: 2560, node_cnt: 12, total_cnt: 10
I (2029) cam_hal: Allocating 153600 Byte frame buffer in OnBoard RAM
I (2029) cam_hal: cam config ok
I (2049) ov5640: Set PLL: bypass: 0, multiplier: 8, sys_div: 1, pre_div: 1, root_2x: 0, pclk_root_div: 1, pclk_manual: 1, pclk_div: 4
I (2049) ov5640: Calculated XVCLK: 40000000 Hz, REFIN: 40000000 Hz, VCO: 320000000 Hz, PLL_CLK: 128000000 Hz, SYSCLK: 32000000 Hz, PCLK: 16000000 Hz
I (2079) example: Turn off LCD backlight
I (2079) example: Initialize SPI bus
I (2079) example: Install panel IO
I (2079) example: Install ST7789 panel driver
I (2209) example: Turn on LCD backlight
I (2209) example:take_picture: Taking picture...
W (6209) cam_hal: Failed to get frame: timeout
Guru Meditation Error: Core  0 panic'ed (LoadProhibited). Exception was unhandled.

Core  0 register dump:
PC      : 0x400dabbb  PS      : 0x00060130  A0      : 0x800fb0db  A1      : 0x3ffb7370
--- 0x400dabbb: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
A2      : 0x00000003  A3      : 0x3f402370  A4      : 0x3f402424  A5      : 0x00000003
A6      : 0x3f4075c4  A7      : 0x00000000  A8      : 0x800dabbb  A9      : 0x3ffb7350
A10     : 0x00001841  A11     : 0x3f4075c4  A12     : 0x3f4075fc  A13     : 0x000008a1
A14     : 0x3f4075c4  A15     : 0x3ffb7334  SAR     : 0x00000004  EXCCAUSE: 0x0000001c
EXCVADDR: 0x00000004  LBEG    : 0x40088da1  LEND    : 0x40088db1  LCOUNT  : 0xfffffffd
--- 0x40088da1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:84
--- 0x40088db1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:96


Backtrace: 0x400dabb8:0x3ffb7370 0x400fb0d8:0x3ffb7390 0x4008b8a1:0x3ffb73c0
--- 0x400dabb8: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
--- 0x400fb0d8: main_task at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/app_startup.c:208
--- 0x4008b8a1: vPortTaskWrapper at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/port.c:139




ELF file SHA256: 736d5c3c3

Rebooting...
ets Jul 29 2019 12:21:46

rst:0xc (SW_CPU_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:6380
ho 0 tail 12 room 4
load:0x40078000,len:15916
load:0x40080400,len:3860
--- 0x40080400: _invalid_pc_placeholder at C:/Users/15768/esp/v5.5/esp-idf/components/xtensa/xtensa_vectors.S:2235
entry 0x40080638
I (29) boot: ESP-IDF v5.5 2nd stage bootloader
I (29) boot: compile time Dec 14 2025 23:58:50
I (29) boot: Multicore bootloader
I (30) boot: chip revision: v3.1
I (33) boot.esp32: SPI Speed      : 40MHz
I (37) boot.esp32: SPI Mode       : DIO
I (40) boot.esp32: SPI Flash Size : 2MB
I (44) boot: Enabling RNG early entropy source...
I (48) boot: Partition Table:
I (51) boot: ## Label            Usage          Type ST Offset   Length
I (57) boot:  0 nvs              WiFi data        01 02 00009000 00006000
I (64) boot:  1 phy_init         RF data          01 01 0000f000 00001000
I (70) boot:  2 factory          factory app      00 00 00010000 00100000
I (77) boot: End of partition table
I (80) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=15324h ( 86820) map
I (117) esp_image: segment 1: paddr=0002534c vaddr=3ff80000 size=00020h (    32) load
I (118) esp_image: segment 2: paddr=00025374 vaddr=3ffb0000 size=04e34h ( 20020) load
I (129) esp_image: segment 3: paddr=0002a1b0 vaddr=40080000 size=05e68h ( 24168) load
I (138) esp_image: segment 4: paddr=00030020 vaddr=400d0020 size=2bb4ch (179020) map
I (200) esp_image: segment 5: paddr=0005bb74 vaddr=40085e68 size=0dee4h ( 57060) load
I (232) boot: Loaded app from partition at offset 0x10000
I (232) boot: Disabling RNG early entropy source...
I (243) quad_psram: This chip is ESP32-D0WD
I (244) esp_psram: Found 8MB PSRAM device
I (245) esp_psram: Speed: 40MHz
I (245) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
W (250) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
I (258) cpu_start: Multicore app
I (1167) esp_psram: SPI SRAM memory test OK
I (1175) cpu_start: Pro cpu start user code
I (1175) cpu_start: cpu freq: 160000000 Hz
I (1175) app_init: Application information:
I (1175) app_init: Project name:     cam-demo
I (1179) app_init: App version:      90b0a67-dirty
I (1184) app_init: Compile time:     Dec 15 2025 00:08:57
I (1189) app_init: ELF file SHA256:  736d5c3c3...
I (1193) app_init: ESP-IDF:          v5.5
I (1197) efuse_init: Min chip rev:     v0.0
I (1201) efuse_init: Max chip rev:     v3.99
I (1205) efuse_init: Chip rev:         v3.1
I (1209) heap_init: Initializing. RAM available for dynamic allocation:
I (1215) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (1220) heap_init: At 3FFB6098 len 00029F68 (167 KiB): DRAM
I (1226) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
I (1231) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
I (1237) heap_init: At 40093D4C len 0000C2B4 (48 KiB): IRAM
I (1243) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
W (1250) spi_flash: boya detected but related driver is not linked, please check option `SPI_FLASH_SUPPORT_BOYA_CHIP`
I (1259) spi_flash: detected chip: generic
I (1263) spi_flash: flash io: dio
W (1266) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
I (1279) main_task: Started on CPU0
I (1289) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
I (1289) main_task: Calling app_main()
I (1289) cam_hal: cam init ok
I (1289) sccb-ng: pin_sda 26 pin_scl 27
I (1299) sccb-ng: sccb_i2c_port=1
I (1329) ov3660: Mismatch PID=0x5640
I (1329) camera: Camera PID=0x5640 VER=0x00 MIDL=0x00 MIDH=0x00
I (1329) camera: Detected OV5640 camera
I (1329) camera: Detected camera at address=0x3c
I (2009) cam_hal: PSRAM DMA mode disabled
I (2009) esp32 ll_cam: node_size: 2560, nodes_per_line: 1, lines_per_node: 1, dma_half_buffer_min:  2560, dma_half_buffer: 15360,lines_per_half_buffer:  6, dma_buffer_size: 30720, image_size: 153600
I (2019) cam_hal: buffer_size: 30720, half_buffer_size: 15360, node_buffer_size: 2560, node_cnt: 12, total_cnt: 10
I (2029) cam_hal: Allocating 153600 Byte frame buffer in OnBoard RAM
I (2029) cam_hal: cam config ok
I (2049) ov5640: Set PLL: bypass: 0, multiplier: 8, sys_div: 1, pre_div: 1, root_2x: 0, pclk_root_div: 1, pclk_manual: 1, pclk_div: 4
I (2049) ov5640: Calculated XVCLK: 40000000 Hz, REFIN: 40000000 Hz, VCO: 320000000 Hz, PLL_CLK: 128000000 Hz, SYSCLK: 32000000 Hz, PCLK: 16000000 Hz
I (2079) example: Turn off LCD backlight
I (2079) example: Initialize SPI bus
I (2079) example: Install panel IO
I (2079) example: Install ST7789 panel driver
I (2209) example: Turn on LCD backlight
I (2209) example:take_picture: Taking picture...
W (6209) cam_hal: Failed to get frame: timeout
Guru Meditation Error: Core  0 panic'ed (LoadProhibited). Exception was unhandled.

Core  0 register dump:
PC      : 0x400dabbb  PS      : 0x00060130  A0      : 0x800fb0db  A1      : 0x3ffb7370
--- 0x400dabbb: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
A2      : 0x00000003  A3      : 0x3f402370  A4      : 0x3f402424  A5      : 0x00000003
A6      : 0x3f4075c4  A7      : 0x00000000  A8      : 0x800dabbb  A9      : 0x3ffb7350
A10     : 0x00001841  A11     : 0x3f4075c4  A12     : 0x3f4075fc  A13     : 0x000008a1
A14     : 0x3f4075c4  A15     : 0x3ffb7334  SAR     : 0x00000004  EXCCAUSE: 0x0000001c
EXCVADDR: 0x00000004  LBEG    : 0x40088da1  LEND    : 0x40088db1  LCOUNT  : 0xfffffffd
--- 0x40088da1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:84
--- 0x40088db1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:96


Backtrace: 0x400dabb8:0x3ffb7370 0x400fb0d8:0x3ffb7390 0x4008b8a1:0x3ffb73c0
--- 0x400dabb8: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
--- 0x400fb0d8: main_task at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/app_startup.c:208
--- 0x4008b8a1: vPortTaskWrapper at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/port.c:139




ELF file SHA256: 736d5c3c3

Rebooting...
ets Jul 29 2019 12:21:46

rst:0xc (SW_CPU_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee
clk_drv:0x00,q_drv:0x00,d_drv:0x00,cs0_drv:0x00,hd_drv:0x00,wp_drv:0x00
mode:DIO, clock div:2
load:0x3fff0030,len:6380
ho 0 tail 12 room 4
load:0x40078000,len:15916
load:0x40080400,len:3860
--- 0x40080400: _invalid_pc_placeholder at C:/Users/15768/esp/v5.5/esp-idf/components/xtensa/xtensa_vectors.S:2235
entry 0x40080638
I (29) boot: ESP-IDF v5.5 2nd stage bootloader
I (29) boot: compile time Dec 14 2025 23:58:50
I (29) boot: Multicore bootloader
I (30) boot: chip revision: v3.1
I (33) boot.esp32: SPI Speed      : 40MHz
I (37) boot.esp32: SPI Mode       : DIO
I (40) boot.esp32: SPI Flash Size : 2MB
I (44) boot: Enabling RNG early entropy source...
I (48) boot: Partition Table:
I (51) boot: ## Label            Usage          Type ST Offset   Length
I (57) boot:  0 nvs              WiFi data        01 02 00009000 00006000
I (64) boot:  1 phy_init         RF data          01 01 0000f000 00001000
I (70) boot:  2 factory          factory app      00 00 00010000 00100000
I (77) boot: End of partition table
I (80) esp_image: segment 0: paddr=00010020 vaddr=3f400020 size=15324h ( 86820) map
I (117) esp_image: segment 1: paddr=0002534c vaddr=3ff80000 size=00020h (    32) load
I (118) esp_image: segment 2: paddr=00025374 vaddr=3ffb0000 size=04e34h ( 20020) load
I (129) esp_image: segment 3: paddr=0002a1b0 vaddr=40080000 size=05e68h ( 24168) load
I (138) esp_image: segment 4: paddr=00030020 vaddr=400d0020 size=2bb4ch (179020) map
I (200) esp_image: segment 5: paddr=0005bb74 vaddr=40085e68 size=0dee4h ( 57060) load
I (232) boot: Loaded app from partition at offset 0x10000
I (232) boot: Disabling RNG early entropy source...
I (243) quad_psram: This chip is ESP32-D0WD
I (244) esp_psram: Found 8MB PSRAM device
I (245) esp_psram: Speed: 40MHz
I (245) esp_psram: PSRAM initialized, cache is in low/high (2-core) mode.
W (250) esp_psram: Virtual address not enough for PSRAM, map as much as we can. 4MB is mapped
I (258) cpu_start: Multicore app
I (1167) esp_psram: SPI SRAM memory test OK
I (1175) cpu_start: Pro cpu start user code
I (1175) cpu_start: cpu freq: 160000000 Hz
I (1175) app_init: Application information:
I (1175) app_init: Project name:     cam-demo
I (1179) app_init: App version:      90b0a67-dirty
I (1184) app_init: Compile time:     Dec 15 2025 00:08:57
I (1189) app_init: ELF file SHA256:  736d5c3c3...
I (1193) app_init: ESP-IDF:          v5.5
I (1197) efuse_init: Min chip rev:     v0.0
I (1201) efuse_init: Max chip rev:     v3.99 
I (1205) efuse_init: Chip rev:         v3.1
I (1209) heap_init: Initializing. RAM available for dynamic allocation:
I (1215) heap_init: At 3FFAE6E0 len 00001920 (6 KiB): DRAM
I (1220) heap_init: At 3FFB6098 len 00029F68 (167 KiB): DRAM
I (1226) heap_init: At 3FFE0440 len 00003AE0 (14 KiB): D/IRAM
I (1231) heap_init: At 3FFE4350 len 0001BCB0 (111 KiB): D/IRAM
I (1237) heap_init: At 40093D4C len 0000C2B4 (48 KiB): IRAM
I (1243) esp_psram: Adding pool of 4096K of PSRAM memory to heap allocator
W (1250) spi_flash: boya detected but related driver is not linked, please check option `SPI_FLASH_SUPPORT_BOYA_CHIP`
I (1259) spi_flash: detected chip: generic
I (1263) spi_flash: flash io: dio
W (1266) spi_flash: Detected size(4096k) larger than the size in the binary image header(2048k). Using the size in the binary image header.
I (1279) main_task: Started on CPU0
I (1289) esp_psram: Reserving pool of 32K of internal memory for DMA/internal allocations
I (1289) main_task: Calling app_main()
I (1289) cam_hal: cam init ok
I (1289) sccb-ng: pin_sda 26 pin_scl 27
I (1299) sccb-ng: sccb_i2c_port=1
I (1329) ov3660: Mismatch PID=0x5640
I (1329) camera: Camera PID=0x5640 VER=0x00 MIDL=0x00 MIDH=0x00
I (1329) camera: Detected OV5640 camera
I (1329) camera: Detected camera at address=0x3c
I (2009) cam_hal: PSRAM DMA mode disabled
I (2009) esp32 ll_cam: node_size: 2560, nodes_per_line: 1, lines_per_node: 1, dma_half_buffer_min:  2560, dma_half_buffer: 15360,lines_per_half_buffer:  6, dma_buffer_size: 30720, image_size: 153600
I (2019) cam_hal: buffer_size: 30720, half_buffer_size: 15360, node_buffer_size: 2560, node_cnt: 12, total_cnt: 10
I (2029) cam_hal: Allocating 153600 Byte frame buffer in OnBoard RAM
I (2029) cam_hal: cam config ok
I (2049) ov5640: Set PLL: bypass: 0, multiplier: 8, sys_div: 1, pre_div: 1, root_2x: 0, pclk_root_div: 1, pclk_manual: 1, pclk_div: 4
I (2049) ov5640: Calculated XVCLK: 40000000 Hz, REFIN: 40000000 Hz, VCO: 320000000 Hz, PLL_CLK: 128000000 Hz, SYSCLK: 32000000 Hz, PCLK: 16000000 Hz
I (2079) example: Turn off LCD backlight
I (2079) example: Initialize SPI bus
I (2079) example: Install panel IO
I (2079) example: Install ST7789 panel driver
I (2209) example: Turn on LCD backlight
I (2209) example:take_picture: Taking picture...
W (6209) cam_hal: Failed to get frame: timeout
Guru Meditation Error: Core  0 panic'ed (LoadProhibited). Exception was unhandled.

Core  0 register dump:
PC      : 0x400dabbb  PS      : 0x00060130  A0      : 0x800fb0db  A1      : 0x3ffb7370
--- 0x400dabbb: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
A2      : 0x00000003  A3      : 0x3f402370  A4      : 0x3f402424  A5      : 0x00000003
A6      : 0x3f4075c4  A7      : 0x00000000  A8      : 0x800dabbb  A9      : 0x3ffb7350
A10     : 0x00001841  A11     : 0x3f4075c4  A12     : 0x3f4075fc  A13     : 0x000008a1
A14     : 0x3f4075c4  A15     : 0x3ffb7334  SAR     : 0x00000004  EXCCAUSE: 0x0000001c
EXCVADDR: 0x00000004  LBEG    : 0x40088da1  LEND    : 0x40088db1  LCOUNT  : 0xfffffffd
--- 0x40088da1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:84
--- 0x40088db1: strlen at /builds/idf/crosstool-NG/.build/xtensa-esp-elf/src/newlib/newlib/libc/machine/xtensa/strlen.S:96


Backtrace: 0x400dabb8:0x3ffb7370 0x400fb0d8:0x3ffb7390 0x4008b8a1:0x3ffb73c0
--- 0x400dabb8: app_main at C:/Users/15768/Desktop/cam_proj/cam-demo/main/main.c:172
--- 0x400fb0d8: main_task at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/app_startup.c:208
--- 0x4008b8a1: vPortTaskWrapper at C:/Users/15768/esp/v5.5/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/port.c:139




ELF file SHA256: 736d5c3c3

Rebooting...
ets Jul 29 2019 12:21:46

rst:0xc (SW_CPU_RESET),boot:0x12 (SPI_FAST_FLASH_BOOT)
configsip: 0, SPIWP:0xee