-- Table for KRS (Study Plan Card)
CREATE TABLE krs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    semester VARCHAR(10) NOT NULL,
    mata_kuliah_id INT NOT NULL,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id),
    FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id)
);

-- Table for Absen Kuliah (Attendance)
CREATE TABLE absen_kuliah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    mata_kuliah_id INT NOT NULL,
    tanggal DATE NOT NULL,
    status ENUM('hadir', 'izin', 'sakit', 'alpha') DEFAULT 'alpha',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id),
    FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id)
);

-- Table for Nilai Kuliah (Grades)
CREATE TABLE nilai_kuliah (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    mata_kuliah_id INT NOT NULL,
    nilai DECIMAL(5,2) NOT NULL,
    semester VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id),
    FOREIGN KEY (mata_kuliah_id) REFERENCES mata_kuliah(id)
);

-- Table for KHS Semester Input (Semester Grade Card)
CREATE TABLE khs_semester (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    semester VARCHAR(10) NOT NULL,
    ipk DECIMAL(4,2) DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
);

-- Table for Pembayaran (Payments)
CREATE TABLE pembayaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal DATE NOT NULL,
    metode VARCHAR(50),
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
);

-- Table for Tagihan VA (Virtual Account Billing)
CREATE TABLE tagihan_va (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mahasiswa_id INT NOT NULL,
    nomor_va VARCHAR(50) NOT NULL UNIQUE,
    jumlah_tagihan DECIMAL(10,2) NOT NULL,
    status ENUM('belum_bayar', 'lunas', 'batal') DEFAULT 'belum_bayar',
    jatuh_tempo DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (mahasiswa_id) REFERENCES mahasiswa(id)
);

-- Table for Pembayaran Tagihan (Bill Payments)
CREATE TABLE pembayaran_tagihan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tagihan_va_id INT NOT NULL,
    jumlah_bayar DECIMAL(10,2) NOT NULL,
    tanggal_bayar DATE NOT NULL,
    metode VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tagihan_va_id) REFERENCES tagihan_va(id)
);

-- Table for Pemasukan Lain (Other Income)
CREATE TABLE pemasukan_lain (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sumber VARCHAR(100) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal DATE NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Pengeluaran Kampus (Campus Expenses)
CREATE TABLE pengeluaran_kampus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jenis_pengeluaran VARCHAR(100) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal DATE NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table for Pengeluaran Yayasan (Foundation Expenses)
CREATE TABLE pengeluaran_yayasan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jenis_pengeluaran VARCHAR(100) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal DATE NOT NULL,
    keterangan TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
