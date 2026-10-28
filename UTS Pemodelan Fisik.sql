CREATE TABLE admin (
  id_admin INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama     VARCHAR(100) NOT NULL,
  email    VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  UNIQUE KEY uq_admin_email (email)
);

CREATE TABLE pengguna (
  id_pengguna INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_alamat   INT NULL,
  nama        VARCHAR(100) NOT NULL,
  no_telepon  VARCHAR(20) NULL,
  email       VARCHAR(100) NOT NULL,
  password    VARCHAR(255) NOT NULL,
  UNIQUE KEY uq_pengguna_email (email)
);

CREATE TABLE kategori_sampah (
  id_kategori   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL,
  deskripsi     TEXT NULL,
  PRIMARY KEY (id_kategori)
);

CREATE TABLE jenis_sampah (
  id_jenis    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_kategori INT NOT NULL,
  nama_jenis  VARCHAR(100) NOT NULL,
  harga       DECIMAL(12,2) NOT NULL DEFAULT 0,
  stock       DECIMAL(12,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (id_jenis),
  CONSTRAINT chk_jenis_harga CHECK (harga >= 0 AND stock >= 0),
  CONSTRAINT fk_jenis_kategori FOREIGN KEY (id_kategori)
    REFERENCES kategori_sampah (id_kategori) ON UPDATE CASCADE
);

CREATE TABLE setoran (
  id_setoran      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pengguna     INT NOT NULL,
  id_admin        INT NULL,
  id_jenis        INT NOT NULL,
  tanggal_setoran DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status_setoran  VARCHAR(30) NOT NULL DEFAULT 'menunggu',
  foto_bukti      VARCHAR(255) NULL,
  jumlah          DECIMAL(12,2) NOT NULL,
  harga_setor     DECIMAL(12,2) NOT NULL,
  subtotal_setor  DECIMAL(14,2) NOT NULL,
  PRIMARY KEY (id_setoran),
  CONSTRAINT chk_setoran_jumlah CHECK (jumlah > 0),
  CONSTRAINT chk_setoran_status CHECK (status_setoran IN ('menunggu','ditolak','selesai')),
  CONSTRAINT fk_setoran_pengguna FOREIGN KEY (id_pengguna)
    REFERENCES pengguna (id_pengguna) ON UPDATE CASCADE,
  CONSTRAINT fk_setoran_admin FOREIGN KEY (id_admin)
    REFERENCES admin (id_admin) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_setoran_jenis FOREIGN KEY (id_jenis)
    REFERENCES jenis_sampah (id_jenis) ON UPDATE CASCADE
);

CREATE TABLE rekap_setoran (
  id_rekap        INT NOT NULL AUTO_INCREMENT,
  id_pengguna     INT NOT NULL,
  id_admin        INT NOT NULL,
  periode         DATE NOT NULL,
  jumlah_setoran  INT NOT NULL DEFAULT 0,
  total_jumlah    DECIMAL(12,2) NOT NULL DEFAULT 0,
  total_nilai     DECIMAL(14,2) NOT NULL DEFAULT 0,
  tanggal_dicatat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id_rekap),
  UNIQUE KEY uq_rekap_pengguna_periode (id_pengguna, periode),
  CONSTRAINT chk_rekap_periode CHECK (DAY(periode) = 1),
  CONSTRAINT chk_rekap_nilai CHECK (jumlah_setoran >= 0 AND total_jumlah >= 0 AND total_nilai >= 0),
  CONSTRAINT fk_rekap_pengguna FOREIGN KEY (id_pengguna)
    REFERENCES pengguna (id_pengguna) ON UPDATE CASCADE,
  CONSTRAINT fk_rekap_admin FOREIGN KEY (id_admin)
    REFERENCES admin (id_admin) ON UPDATE CASCADE
);
