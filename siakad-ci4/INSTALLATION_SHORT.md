# Panduan Singkat Instalasi SIAKAD CI4 (Bahasa Indonesia)

1. Clone atau download proyek:
```
git clone <repository-url> siakad-ci4
cd siakad-ci4
```

2. Install dependensi:
```
composer install
```

3. Salin file environment:
```
cp env.example .env
```
Edit `.env` sesuaikan konfigurasi database.

4. Buat database MySQL:
```
CREATE DATABASE siakad_db;
```

5. Import skema database:
```
mysql -u root -p siakad_db < database/master_schema.sql
mysql -u root -p siakad_db < database/schema_additions.sql
```

6. Set izin folder writable:
```
chmod -R 777 writable
```

7. Jalankan aplikasi:
```
php spark serve
```

8. Buka browser ke:
```
http://localhost:8080
```

Selesai! Aplikasi siap digunakan.

---
