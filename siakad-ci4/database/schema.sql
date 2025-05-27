-- Database schema for SIAKAD mahasiswa table
CREATE TABLE mahasiswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nipd VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    prodi VARCHAR(50) NOT NULL,
    alamat TEXT,
    periode VARCHAR(20),
    referensi VARCHAR(50),
    status_ujian ENUM('belum', 'lulus', 'gagal') DEFAULT 'belum',
    status_wawancara ENUM('belum', 'lulus', 'gagal') DEFAULT 'belum',
    email VARCHAR(100),
    tagihan DECIMAL(10,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
