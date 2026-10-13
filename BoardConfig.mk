# Vivo V5s (PD1612DF) - device tree TWRP dengan kernel prebuilt.
# Nilai [DARI IMAGE] diambil langsung dari recovery.img yang diunggah.
# Nilai [TEBAKAN/UJI] belum terbukti dan harus dicek di HP.

DEVICE_PATH := device/vivo/PD1612DF

# --- Arsitektur [DARI IMAGE: sbin/recovery dan kernel = aarch64] ---
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

# --- Platform [DARI IMAGE: nama fstab/init mt6755] ---
TARGET_BOARD_PLATFORM := mt6755
TARGET_BOOTLOADER_BOARD_NAME := PD1612DF
TARGET_NO_BOOTLOADER := true

# --- Kernel prebuilt [DARI IMAGE: gzip(Image ARM64) + DTB menempel] ---
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz-dtb
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 product.version=PD1612DF_EX_A_3.14.2 fingerprint.abbr=7.0/NRD90M buildvariant=eng
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00080000 --ramdisk_offset 0x05000000 --tags_offset 0x04000000 --second_offset 0x00f78000

# --- Ukuran partisi [WAJIB DIISI MANUAL dari scatter file firmware] ---
# Jangan ditebak. Tanpa nilai yang benar, image bisa terlalu besar untuk partisi.
# BOARD_BOOTIMAGE_PARTITION_SIZE := 0x????????
# (image asli = 22945792 byte)
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x????????

# --- Filesystem [DARI IMAGE: recovery.fstab] ---
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# --- TWRP ---
# [DARI IMAGE: tema 1080x1920]
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
BOARD_HAS_NO_SELECT_BUTTON := true
TW_INCLUDE_NTFS_3G := true
# [TEBAKAN/UJI] Aktifkan satu per satu hanya jika gejalanya muncul:
# warna layar salah / layar kosong:
# TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
# TW_MAX_BRIGHTNESS := 255
# decrypt /data (image asli menyertakan libkeymaster):
# TW_INCLUDE_CRYPTO := true
