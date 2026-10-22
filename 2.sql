-- INSERT 3 baris data dummy di setiap tabel
INSERT INTO pengguna (nama, no_telepon, email, password, kota) VALUES 
('Budiw', '0882939393', 'budiwkwk@gmail.com', '2$Sd$#d6#$', 'Lamongan'),
('Dimas', '08829334490', 'dimaspramodya@gmail.com', '2$Sd*#d%', 'Ponorogo'),
('Adly', '0882939393390', 'adlywwk@gmail.com', '2$Sd$#k$%$', 'Ponorogo');

INSERT INTO admin (nama, email, password) VALUES
('Dimas Pramodya', 'pramodyadimas@gmail.com', '3$#5d$L$'),
('Adly Sidiq', 'adlysidiq@gmail.com', '3$#5d#k#$'),
('Ridwan Hashim', 'ridwanhashim@gmail.com', '3$#5e3#d$');

INSERT INTO setoran (id_pengguna, id_admin, status_setoran, foto_bukti) VALUES
(1, NULL,'menunggu', 'buktisampah.jpg'),
(2, 1, 'diproses', 'buktisampah002.jpg'),
(3, 3, 'diproses', 'buktisampah00001.jpg');
-- READ
SELECT * FROM pengguna;
SELECT * FROM admin;
SELECT * FROM setoran;
-- UPDATE
UPDATE setoran
SET status_setoran = 'menunggu', id_admin = 1
WHERE id_setoran = 1;
-- DELETE  
DELETE FROM setoran WHERE id_setoran = 1;
