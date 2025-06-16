#!/bin/bash

# ==============================================================================
# Skrip Penghapus Bloatware Aman untuk Perangkat Xiaomi (MIUI)
# Dibuat untuk dijalankan di macOS atau Linux, Windows.
#
# PERINGATAN:
# - Skrip ini hanya menghapus aplikasi yang tergolong AMAN.
# - Aplikasi krusial yang dapat menyebabkan bootloop (seperti Theme Manager)
#   TIDAK dimasukkan ke dalam skrip ini.
# - Jalankan dengan risiko Anda sendiri. Factory reset adalah solusi jika
#   terjadi masalah.
# ===============================================================================

print_info() {
    echo -e "\033[0;34m$1\033[0m"
}

print_success() {
    echo -e "\033[0;32m$1\033[0m"
}

print_error() {
    echo -e "\033[0;31m$1\033[0m"
}

print_warning() {
    echo -e "\033[0;33m$1\033[0m"
}


SAFE_TO_REMOVE=(
    # --- Aplikasi Media & Hiburan ---
    "com.miui.videoplayer"      # Mi Video
    "com.miui.player"           # Mi Music
    "com.miui.fm"               # FM Radio

    # --- Layanan & Iklan Sistem ---
    "com.miui.msa.global"       # MIUI System Ads (MSA)
    "com.miui.analytics"        # Analytics

    # --- Aplikasi Bawaan Xiaomi ---
    "com.xiaomi.mipicks"        # GetApps
    "com.android.browser"       # Mi Browser
    "com.mi.globalbrowser"      # Mi Browser
    "com.micredit.in"           # Mi credit
    "com.miui.personalassistant" # App Vault
    "com.miui.miservice"        # Services & Feedback
    "com.miui.compass"          # Compass
    "com.mi.health"             # Mi Health
    "com.xiaomi.payment"        # Mi Credit / Mi Pay
    "com.xiaomi.midrop"         # ShareMe (Mi Drop)
    "com.miui.yellowpage"       # Yellow Pages
    "cn.wps.xiaomi.abroad.lite" # Mi Doc Viewer (WPS)
    "com.xiaomi.calendar"       # Mi Calendar
    "com.xiaomi.scanner"        # Scanner
    "com.facemoji.lite.xiaomi"  # Facemoji Keyboard
    "com.android.soundrecorder" # Perekam Suara (Recorder)
)


print_info "Memeriksa koneksi perangkat ADB..."
if ! adb devices | grep -q "device$"; then
    print_error "Perangkat tidak ditemukan atau belum diotorisasi."
    print_error "Pastikan USB Debugging aktif dan setujui prompt di layar ponsel Anda."
    exit 1
fi
print_success "Perangkat terdeteksi. Memulai proses penghapusan..."
echo ""


for package in "${SAFE_TO_REMOVE[@]}"; do
    echo "Menghapus paket: $package"
    
    output=$(adb shell pm uninstall --user 0 "$package" 2>&1)
    
    if [[ "$output" == *"Success"* ]]; then
        print_success "  -> Berhasil."
    else
        print_warning "  -> Gagal atau aplikasi tidak ditemukan. Pesan: $output"
    fi
done

echo ""
print_success "==================================="
print_success "Proses penghapusan selesai!"
print_warning "CATATAN: Jika Anda ingin mengembalikan aplikasi ini, lakukan Factory Reset atau Install manual via adb."
print_success "==================================="

