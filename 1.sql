-- Tabel Master 1
CREATE TABLE pengguna (
  id_pengguna INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama        VARCHAR(100) NOT NULL,
  no_telepon  VARCHAR(20) NULL,
  email       VARCHAR(100) UNIQUE NOT NULL,
  password    VARCHAR(255) NOT NULL,
  kota        VARCHAR(100) NULL,
  KEY idx_setoran_pengguna (id_pengguna)
);
-- Tabel Master 2
CREATE TABLE admin (
  id_admin INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nama     VARCHAR(100) NOT NULL,
  email    VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  KEY idx_setoran_admin (id_admin)
);
-- Tabel Induk 3
 CREATE TABLE setoran (
  id_setoran      INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pengguna     INT NOT NULL, 
  CONSTRAINT fk_setoran_pengguna
    FOREIGN KEY (id_pengguna) REFERENCES pengguna (id_pengguna)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  id_admin        INT NULL,
  CONSTRAINT fk_setoran_admin
    FOREIGN KEY (id_admin) REFERENCES admin (id_admin)
    ON UPDATE CASCADE ON DELETE SET NULL,
  tanggal_setoran DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status_setoran  ENUM('menunggu','diproses', 'disetujui', 'ditolak') NOT NULL DEFAULT 'menunggu',
  foto_bukti      VARCHAR(255) NULL
);
