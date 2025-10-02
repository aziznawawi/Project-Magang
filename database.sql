SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stokbarang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kd_barang` bigint(20) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `satuan` varchar(50) DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `STATUS` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `jumlah`, `satuan`, `tanggal_masuk`, `STATUS`, `keterangan`) VALUES
(2025080901, 'Laptop Lenovo Thinkpad', 10, 'Unit', '2025-08-01', NULL, 'Kondisi baru'),
(2025080902, 'Proyektor Epson', 5, 'Unit', '2025-08-05', NULL, 'Butuh perawatan rutin'),
(2025080903, 'Kabel HDMI 2M', 50, 'Pcs', '2025-08-10', NULL, 'Stok gudang utama'),
(2025080904, 'Meja Kerja Kayu', 7, 'Unit', '2025-08-15', NULL, 'Stok ruang rapat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `NO` int(11) NOT NULL,
  `kd_barang` bigint(20) DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `nama_peminjam` varchar(100) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `univ_jurusan` varchar(50) DEFAULT NULL,
  `cabang` varchar(100) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `STATUS` enum('Dipinjam','Dikembalikan') DEFAULT 'Dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`NO`, `kd_barang`, `nama_barang`, `nama_peminjam`, `nip`, `kontak`, `jumlah`, `univ_jurusan`, `cabang`, `keterangan`, `tanggal_pinjam`, `tanggal_kembali`, `STATUS`) VALUES
(1, 2025080901, 'Laptop Lenovo Thinkpad', 'Rahma', '224101033', '812347985', 1, 'poltek', NULL, NULL, '2025-09-29', '2025-09-29', 'Dikembalikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `NO` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nip` varchar(50) DEFAULT NULL,
  `kontak` int(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `ROLE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`NO`, `nama`, `nip`, `kontak`, `email`, `PASSWORD`, `ROLE`) VALUES
(1, 'Admin Sistem', '123456', NULL, 'admin@stokbarang.com', '123456', 'admin'),
(5, 'Rahma', '224101033', 812347985, 'rahma@gmail.com', '$2y$10$dJpvZT14xvRh2zl0KgpPfO9Qor7WOTGxbk9VhFY7MS2i9RsYSNjaS', 'pegawai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_keluar`
--

CREATE TABLE `stok_keluar` (
  `NO` int(11) NOT NULL,
  `kd_barang` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id` int(11) NOT NULL,
  `kd_barang` bigint(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`NO`),
  ADD KEY `fk_peminjaman_barang` (`kd_barang`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`NO`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `stok_keluar`
--
ALTER TABLE `stok_keluar`
  ADD PRIMARY KEY (`NO`),
  ADD KEY `fk_stok_keluar_barang` (`kd_barang`);

--
-- Indeks untuk tabel `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stok_masuk_barang` (`kd_barang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `kd_barang` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2025080905;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `stok_keluar`
--
ALTER TABLE `stok_keluar`
  MODIFY `NO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stok_masuk`
--
ALTER TABLE `stok_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `fk_peminjaman_barang` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`);

--
-- Ketidakleluasaan untuk tabel `stok_keluar`
--
ALTER TABLE `stok_keluar`
  ADD CONSTRAINT `fk_stok_keluar_barang` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD CONSTRAINT `fk_stok_masuk_barang` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
