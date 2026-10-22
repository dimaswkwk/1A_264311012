-- QUERY Kompleks & Agregasi
select pengguna.nama,
	   admin.nama AS nama_admin,
       setoran.status_setoran,
	COUNT(setoran.id_setoran) AS total_setor_yg_diproses
FROM setoran
JOIN pengguna ON setoran.id_pengguna = pengguna.id_pengguna
JOIN admin ON setoran.id_admin = admin.id_admin
WHERE setoran.status_setoran = 'diproses'
GROUP BY pengguna.nama, nama_admin;
