# Device tree TWRP - Vivo V5s (PD1612DF), kernel prebuilt

Dibuat dari `recovery.img` yang diunggah (SHA-256 `2d240e3b...13ea`, TWRP 3.7.0_9 by Team Hovatek).
**Belum pernah di-build atau diuji di HP.** Jangan flash hasil build sebelum dites.

## Isi
- `prebuilt/Image.gz-dtb` : kernel + DTB, diambil apa adanya dari image asli (ARM64).
- `recovery.fstab`        : dari `etc/twrp.flags` di image (path `mtk-msdc.0/11230000.msdc0/by-name/...`).
- `recovery/root/`        : `init.recovery.mt6755.rc`, `ueventd.mt6755.rc` dari image.
- `BoardConfig.mk`        : arsitektur ARM64, base/offset/page size/cmdline dari header image.
- `omni_PD1612DF.mk` / `twrp_PD1612DF.mk` : dipilih otomatis oleh `AndroidProducts.mk`
  (omni untuk manifest 7.1/8.1, twrp untuk 9.0+).

## Yang WAJIB kamu isi sebelum build
Ukuran partisi `recovery` (dan `boot`) dari scatter file firmware, lalu hapus tanda `#` pada
`BOARD_RECOVERYIMAGE_PARTITION_SIZE` di `BoardConfig.mk`. Nilainya tidak ada di image dan tidak boleh ditebak.

## Cara pakai di GitHub Actions
1. Buat repo baru (mis. `android_device_vivo_PD1612DF`), unggah SELURUH isi folder ini ke root repo.
2. Fork repo workflow builder yang mendukung manifest lama (7.1/8.1). Cek dulu branch yang didukung.
3. Isi parameter:
   - Manifest: `https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git`
     branch `twrp-8.1` (nama repo/branch ini dari ingatan saya, cek dulu di GitHub minimal-manifest-twrp)
   - Device tree URL: URL repomu, branch `main`
   - Device path: `device/vivo/PD1612DF`
   - Nama produk: `PD1612DF` (prefix `omni`), target: `recovery`
4. Unduh hasilnya, bandingkan dengan `recovery.img` asli, uji dulu.

## Kalau ada gejala
| Gejala | Coba |
|---|---|
| Warna layar aneh / layar kosong | aktifkan `TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"` |
| Layar terlalu gelap | aktifkan `TW_BRIGHTNESS_PATH` dan `TW_MAX_BRIGHTNESS` |
| `/data` tidak bisa dibuka (terenkripsi) | aktifkan `TW_INCLUDE_CRYPTO := true` |
| Build gagal soal ukuran image | cek ukuran partisi di scatter file |

Cadangkan recovery stok sebelum flash apa pun.
