# 🎟️ Event Registration App (CRUD + State Management)

Aplikasi pendaftaran event modern yang dibangun dengan **Flutter**. Proyek ini mendemonstrasikan implementasi sistem **CRUD (Create, Read, Update, Delete)** yang lengkap dengan manajemen state menggunakan **Provider** serta fitur pencarian data secara real-time.



## 🌟 Fitur Unggulan
* **Manajemen Peserta Lengkap**: Tambah baru, lihat daftar peserta, ubah data (Edit), dan hapus peserta.
* **Pencarian Real-time**: Filter daftar peserta secara instan berdasarkan **Nama** atau **Program Studi** melalui bar pencarian di halaman list.
* **Manajemen State (Provider)**: Sinkronisasi data yang efisien antar halaman tanpa perlu reload manual.
* **UI/UX Modern**:
    * **Dynamic Routing**: Navigasi antar halaman menggunakan `Named Routes`.
    * **Data Integrity**: Validasi email unik untuk mencegah pendaftaran ganda.
    * **Detail Profile**: Menampilkan informasi lengkap termasuk penghitungan umur otomatis dari tanggal lahir.

---

## 🏗️ Arsitektur Proyek (Logic Breakdown)
Proyek ini mengikuti pola pemisahan tanggung jawab (*Separation of Concerns*):

1.  **Models (`lib/models/`)**: Berisi class `Registrant` untuk struktur data dan logika bisnis (seperti hitung umur).
2.  **Providers (`lib/providers/`)**: Pusat pengelolaan data yang menangani List peserta, fungsi pencarian, dan update data.
3.  **Pages (`lib/pages/`)**: Antarmuka pengguna yang reaktif terhadap perubahan data di Provider.



---

## 🛠️ Tech Stack & Dependencies
* **Flutter & Dart**
* **Provider**: Library utama untuk pengelolaan State.

---

## 💡 Penjelasan Kode Baru (Search & Edit Logic)

Berikut adalah penjelasan teknis mengenai bagian kode yang baru saja ditambahkan untuk mengaktifkan fitur Pencarian dan Pengubahan data:

### 1. Logika Pencarian (Real-time Filtering)
Di dalam `RegistrationProvider`, data difilter secara dinamis sebelum dikirim ke UI.

### Logika pada Getter registrants:
#### 1. Mengecek apakah _searchQuery kosong.
#### 2. Jika tidak, lakukan filter menggunakan .where()
#### 3. Bandingkan input user dengan Nama atau Program Studi (Lowercase)

kode:
```bash
registrants => _registrants.where((r) => 
    r.name.toLowerCase().contains(_searchQuery.toLowerCase()) || 
    r.programStudi.toLowerCase().contains(_searchQuery.toLowerCase())
).toList();
```
### 2. Logika Update Data (Edit Function)
Fungsi ini memungkinkan perubahan data pada peserta yang sudah ada berdasarkan ID unik mereka.
##### Logika pada updateRegistrant:
#### 1. Mencari index data lama berdasarkan ID.
#### 2. Mengganti data pada index tersebut dengan data baru.
#### 3. Memanggil notifyListeners() untuk memperbarui tampilan List.

```bash
final index = _registrants.indexWhere((r) => r.id == updatedData.id);
if (index != -1) { _registrants[index] = updatedData; }
```

### 3. Integrasi UI Search & Navigation
Pada RegistrantListPage, ditambahkan TextField yang terhubung langsung ke Provider.
#### Mekanisme Sinkronisasi:
```bash
onChanged pada TextField memicu setSearchQuery()
```
Tombol Edit pada ListTile mengirimkan ID melalui Navigator arguments:
```bash
Navigator.pushNamed(context, '/', arguments: registrant.id)
```

---
## 📸 Lampiran Tampilan
1. Tampilan Awal
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/99dbabd7-a55b-4109-a5a1-c20936979bcf" />

---
2. Tampilan setelah registrasi
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/e31bc19b-76d3-4694-a2b0-f23c40b55247" />

---
3. Tampilan daftar peserta
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fc796737-93f7-4d70-b8c5-47c83d482aeb" />

