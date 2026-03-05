# 🎟️ Event Registration App (CRUD + State Management)

Aplikasi pendaftaran event modern yang dibangun dengan **Flutter**. Proyek ini mendemonstrasikan implementasi sistem **CRUD (Create, Read, Update, Delete)** yang lengkap dengan manajemen state menggunakan **Provider**.



## 🌟 Fitur Unggulan
* **Manajemen Peserta Lengkap**: Tambah baru, lihat daftar, ubah data (Edit), dan hapus peserta.
* **Pencarian Real-time**: Filter daftar peserta secara instan berdasarkan Nama atau Program Studi.
* **Statistik Dashboard**: Header dinamis yang menampilkan total pendaftar, jumlah laki-laki, dan jumlah perempuan.
* **Identitas Unik (UUID)**: Menjamin integritas data menggunakan `uuid` package untuk setiap pendaftar.
* **UI/UX Modern**:
    * **Swipe to Delete**: Hapus data dengan menggeser kartu peserta.
    * **Detail Profile**: Halaman profil yang bersih untuk melihat informasi lengkap peserta.
    * **Form Validation**: Validasi input email dan kolom wajib untuk mencegah data kosong.

---

## 🏗️ Arsitektur Proyek
Proyek ini mengikuti pola pemisahan tanggung jawab (Separation of Concerns):

1. **Models (`lib/models/`)**: Berisi `Registrant` class yang menyimpan data dan logika umur.
2. **Providers (`lib/providers/`)**: Jantung aplikasi yang mengelola data di memori dan memberitahu UI saat ada perubahan.
3. **Pages (`lib/pages/`)**: Antarmuka pengguna yang reaktif terhadap perubahan state.



---

## 🛠️ Tech Stack & Dependencies
* **Flutter & Dart**
* **Provider**: Library utama untuk pengelolaan State.
* **UUID**: Digunakan untuk generate ID unik pendaftar secara runtime.

---

## 💡 Catatan Teknis (Troubleshooting)
Dalam pengembangan ini, terdapat penanganan khusus untuk **ID Initialization**:
Awalnya terjadi error pada penggunaan `const` saat memanggil `Uuid().v4()`. Hal ini dikarenakan UUID bersifat dinamis (dibuat saat aplikasi berjalan), sehingga keyword `const` harus dihapus agar objek dapat dibuat secara runtime melalui *Constructor Initializer List*.

```dart
// Solusi pada model
Registrant({ ... }) : id = id ?? Uuid().v4();
```
Gemini said
Tentu, ini adalah format lengkap file README.md yang sangat profesional untuk repositori GitHub Anda. Penjelasan ini mencakup semua fitur canggih yang telah kita buat (CRUD, Searching, Statistik) serta solusi teknis untuk masalah UUID yang sempat kita hadapi.

Silakan buat file baru bernama README.md di folder utama proyek Anda, lalu salin kode di bawah ini:

Markdown
# 🎟️ Event Registration App (CRUD + State Management)

Aplikasi pendaftaran event modern yang dibangun dengan **Flutter**. Proyek ini mendemonstrasikan implementasi sistem **CRUD (Create, Read, Update, Delete)** yang lengkap dengan manajemen state menggunakan **Provider**.



## 🌟 Fitur Unggulan
* **Manajemen Peserta Lengkap**: Tambah baru, lihat daftar, ubah data (Edit), dan hapus peserta.
* **Pencarian Real-time**: Filter daftar peserta secara instan berdasarkan Nama atau Program Studi.
* **Statistik Dashboard**: Header dinamis yang menampilkan total pendaftar, jumlah laki-laki, dan jumlah perempuan.
* **Identitas Unik (UUID)**: Menjamin integritas data menggunakan `uuid` package untuk setiap pendaftar.
* **UI/UX Modern**:
    * **Swipe to Delete**: Hapus data dengan menggeser kartu peserta.
    * **Detail Profile**: Halaman profil yang bersih untuk melihat informasi lengkap peserta.
    * **Form Validation**: Validasi input email dan kolom wajib untuk mencegah data kosong.

---

## 🏗️ Arsitektur Proyek
Proyek ini mengikuti pola pemisahan tanggung jawab (Separation of Concerns):

1. **Models (`lib/models/`)**: Berisi `Registrant` class yang menyimpan data dan logika umur.
2. **Providers (`lib/providers/`)**: Jantung aplikasi yang mengelola data di memori dan memberitahu UI saat ada perubahan.
3. **Pages (`lib/pages/`)**: Antarmuka pengguna yang reaktif terhadap perubahan state.



---

## 🛠️ Tech Stack & Dependencies
* **Flutter & Dart**
* **Provider**: Library utama untuk pengelolaan State.
* **UUID**: Digunakan untuk generate ID unik pendaftar secara runtime.

---

## 💡 Catatan Teknis (Troubleshooting)
Dalam pengembangan ini, terdapat penanganan khusus untuk **ID Initialization**:
Awalnya terjadi error pada penggunaan `const` saat memanggil `Uuid().v4()`. Hal ini dikarenakan UUID bersifat dinamis (dibuat saat aplikasi berjalan), sehingga keyword `const` harus dihapus agar objek dapat dibuat secara runtime melalui *Constructor Initializer List*.

```dart
// Solusi pada model
Registrant({ ... }) : id = id ?? Uuid().v4();
```

## 🚀 Cara Menjalankan Proyek
1. Clone Repositori
```bash
git clone [https://github.com/USERNAME-ANDA/NAMA-REPO.git](https://github.com/USERNAME-ANDA/NAMA-REPO.git)
```

2. Masuk ke Direktori Proyek
```bash
cd pert5_part5
```

3. Instal Dependensi
```bash
flutter pub get
```
4. Jalankan Aplikasi
```bash
Jalankan Aplikasi
```

   ---

### Langkah Terakhir untuk Mengunggah ke GitHub:

Jika Anda belum pernah mengunggahnya, jalankan perintah ini di terminal VS Code Anda:

1.  **Inisialisasi Git:**
    `git init`
2.  **Tambahkan file:**
    `git add .`
3.  **Simpan perubahan:**
    `git commit -m "Final: Event Registration App with CRUD and Statistics"`
4.  **Hubungkan ke GitHub:** (Ganti URL dengan URL repositori yang Anda buat di website GitHub)
    `git remote add origin https://github.com/USERNAME/REPO.git`
5.  **Kirim:**
    `git push -u origin main`

Apakah Anda ingin saya bantu membuatkan file **`.gitignore`** juga agar folder "sampah" (seperti `build` dan `.dart_tool`) tidak ikut terunggah dan membuat repositori Anda kotor?

## Lampiran
1. Tampilan Awal
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f0994f4d-8585-412b-ab06-ef82e58dc267" />

---

2. Tampilan pengisian data:
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0db704d3-7321-4975-8d09-7dd8b55210af" />

---

3. Tampilan Setelah isi data:
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/be14578f-f1f6-489b-ab1b-70d1c9d4f22d" />
