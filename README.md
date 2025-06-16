# Script Penghapus Bloatware untuk Xiaomi (MIUI)

Script ini dirancang untuk membantu pengguna menghapus aplikasi bawaan (bloatware) yang tidak diinginkan dari perangkat Xiaomi secara otomatis, aman, dan efisien menggunakan ADB (Android Debug Bridge).

Script ini hanya menyertakan daftar aplikasi yang telah terbukti aman untuk dihapus dan tidak akan menyebabkan `bootloop` pada penggunaan normal.

---

## ⚠️ Peringatan Penting

- **Gunakan dengan Risiko Anda Sendiri:** Meskipun script ini dirancang seaman mungkin, selalu ada risiko kecil saat memodifikasi sistem. Penulis tidak bertanggung jawab atas kerusakan apa pun yang mungkin terjadi pada perangkat Anda.
- **Backup Data Anda:** Sangat disarankan untuk mencadangkan data penting Anda sebelum menjalankan script ini.
- **Hanya untuk MIUI:** Script ini dikhususkan untuk perangkat Xiaomi yang menjalankan MIUI. Mungkin tidak cocok untuk Custom ROM.
- **Tidak Memerlukan Root:** Proses ini tidak memerlukan akses root.

---

## ✨ Fitur

- **Aman:** Hanya menargetkan aplikasi bloatware yang tidak krusial. Aplikasi sistem inti yang berisiko menyebabkan bootloop (seperti Theme Manager, Mi Account, Xiaomi Service Framework) sengaja tidak disertakan.
- **Otomatis:** Menghapus banyak aplikasi sekaligus hanya dengan satu perintah.
- **Informatif:** Memberikan laporan `Success` atau `Failure` untuk setiap aplikasi yang diproses.
- **Cross-Platform:** Dapat dijalankan di macOS dan Linux.

---

## 📋 Persyaratan

1.  **Komputer:** macOS, Linux, dan Windows.
2.  **ADB:** Android Platform-Tools harus sudah terpasang di komputer Anda.
    - _Instalasi di Windows:_ Unduh [Android Platform Tools](https://developer.android.com/studio/releases/platform-tools) dan ekstrak ke folder yang mudah diakses.
    - _Instalasi di Mac via Homebrew:_ `brew install --cask android-platform-tools`
    - _Instalasi di Linux via Pacman:_ `sudo pacman -S android-sdk-platform-tools`
3.  **Ponsel Xiaomi:**
    - **USB Debugging** harus sudah diaktifkan di **Opsi Pengembang (Developer Options)**.

---

## 🚀 Cara Penggunaan

1.  **Simpan Script:** Download/Clone file script ini.

2.  **Berikan Izin Eksekusi:** Buka Terminal, navigasikan ke folder tempat Anda menyimpan script, lalu jalankan perintah berikut:
    ```sh
    chmod +x delete-bloatware-xiaomi.sh
    ```

3.  **Sambungkan Ponsel:** Hubungkan ponsel Xiaomi Anda ke komputer menggunakan kabel USB. Setujui prompt **"Allow USB Debugging?"** yang muncul di layar ponsel.

4.  **Jalankan Script:** Dari jendela Terminal yang sama, jalankan script dengan perintah:
    ```sh
    ./delete-bloatware-xiaomi.sh
    ```

5.  **Selesai:** Script akan berjalan secara otomatis. Setelah selesai, disarankan untuk me-restart ponsel Anda.

---

## 📦 Daftar Aplikasi yang Dihapus oleh Script

Berikut adalah daftar aplikasi yang akan dihapus secara otomatis oleh script ini:

| Aplikasi                   | Nama Paket (`package name`)           |
| -------------------------- | ------------------------------------- |
| Mi Video                   | `com.miui.videoplayer`                |
| Mi Music                   | `com.miui.player`                     |
| FM Radio                   | `com.miui.fm`                         |
| MSA (Iklan Sistem)         | `com.miui.msa.global`                 |
| Analytics                  | `com.miui.analytics`                  |
| GetApps                    | `com.xiaomi.mipicks`                  |
| Mi Browser                 | `com.android.browser`                 |
| App Vault                  | `com.miui.personalassistant`          |
| Services & Feedback        | `com.miui.miservice`                  |
| Compass                    | `com.miui.compass`                    |
| Mi Health                  | `com.mi.health`                       |
| Mi Credit / Pay            | `com.xiaomi.payment`                  |
| ShareMe (Mi Drop)          | `com.xiaomi.midrop`                   |
| Yellow Pages               | `com.miui.yellowpage`                 |
| Mi Doc Viewer (WPS)        | `cn.wps.xiaomi.abroad.lite`           |
| Mi Calendar                | `com.xiaomi.calendar`                 |
| Scanner                    | `com.xiaomi.scanner`                  |
| Facemoji Keyboard          | `com.facemoji.lite.xiaomi`            |
| Perekam Suara (Recorder)   | `com.android.soundrecorder`           |

---

## 🛑 Aplikasi yang TIDAK Dihapus (Sengaja Ditinggalkan)

Aplikasi berikut **tidak** dimasukkan ke dalam script karena sangat penting untuk stabilitas sistem atau berisiko tinggi menyebabkan `bootloop`:

- `com.android.thememanager` (Theme Manager)
- `com.mi.android.globalFileexplorer` (File Manager)
- `com.xiaomi.account` (Mi Account)
- `com.xiaomi.xmsf` (Xiaomi Service Framework)
- `com.xiaomi.finddevice` (Find Device)
- Dan aplikasi inti sistem lainnya.

---

## ↩️ Cara Mengembalikan Aplikasi

Metode penghapusan `pm uninstall --user 0` tidak menghapus file APK dari partisi sistem. Cara termudah dan paling pasti untuk mengembalikan semua aplikasi yang telah dihapus adalah dengan melakukan **Factory Reset (Setel Ulang Pabrik)** dari menu Pengaturan atau Recovery.

