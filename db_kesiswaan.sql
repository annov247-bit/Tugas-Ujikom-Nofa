-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 20 Nov 2025 pada 07.46
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kesiswaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `backup_data`
--

CREATE TABLE `backup_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filepath` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('daily','weekly','monthly') COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) NOT NULL,
  `backup_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `backup_data`
--

INSERT INTO `backup_data` (`id`, `filename`, `filepath`, `type`, `size`, `backup_date`, `created_at`, `updated_at`) VALUES
(6, 'backup_daily_20251119_015859.sql.gz', '/Applications/XAMPP/xamppfiles/htdocs/Ujikom_Nf/Kesiswaan_Nf/storage/app/backups/backup_daily_20251119_015859.sql.gz', 'daily', 8317, '2025-11-18 18:58:59', '2025-11-18 18:58:59', '2025-11-18 18:58:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bimbingan_konseling`
--

CREATE TABLE `bimbingan_konseling` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `bk_id` bigint(20) UNSIGNED NOT NULL,
  `pelanggaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tindakan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('terdaftar','diproses','selesai','tindak_lanjut') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'terdaftar',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bimbingan_konseling`
--

INSERT INTO `bimbingan_konseling` (`id`, `siswa_id`, `bk_id`, `pelanggaran_id`, `tindakan`, `status`, `created_at`, `updated_at`) VALUES
(2, 3, 4, 5, 'Masi terdaftar', 'terdaftar', '2025-11-18 23:54:04', '2025-11-18 23:54:04'),
(3, 4, 4, 3, 'di telem', 'terdaftar', '2025-11-19 00:21:50', '2025-11-19 00:21:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_guru` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bidang_studi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `guru`
--

INSERT INTO `guru` (`id`, `nip`, `nama_guru`, `bidang_studi`, `status`, `created_at`, `updated_at`) VALUES
(1, '1111', 'Pak Aji', 'Bahasa Indonesia', 'aktif', '2025-11-13 00:00:13', '2025-11-13 00:00:13'),
(2, '2111', 'Pak Handi', 'Bahasa Sunda', 'aktif', '2025-11-14 00:30:09', '2025-11-14 00:30:09'),
(3, '3111', 'Pa Suhe', 'PAI', 'aktif', '2025-11-14 00:30:26', '2025-11-14 00:30:26'),
(5, '4111', 'Pak Soni', '3D', 'aktif', '2025-11-16 18:00:26', '2025-11-16 18:00:34'),
(6, '5111', 'Mrs. Dini', 'Bahasa Inggris', 'aktif', '2025-11-16 18:01:38', '2025-11-16 18:01:38'),
(7, '6111', 'Pak Ridwan', 'BK', 'aktif', '2025-11-17 19:56:18', '2025-11-17 19:56:18'),
(8, '7111', 'Pak Danis', 'Matematika', 'aktif', '2025-11-17 19:56:55', '2025-11-17 19:56:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_pelanggaran`
--

CREATE TABLE `jenis_pelanggaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pelanggaran` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poin` int(11) NOT NULL,
  `kategori` enum('Ringan','Sedang','Berat') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_pelanggaran`
--

INSERT INTO `jenis_pelanggaran` (`id`, `nama_pelanggaran`, `poin`, `kategori`, `created_at`, `updated_at`) VALUES
(1, 'Mengotori (mencorat-coret) barang milik sekolah, guru, karyawan atau teman', 10, 'Ringan', NULL, NULL),
(2, 'Merusak atau menghilangkan barang milik sekolah, guru, karyawan atau teman', 25, 'Sedang', NULL, NULL),
(3, 'Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 50, 'Berat', NULL, NULL),
(4, 'Makan dan minum di dalam kelas saat berlangsungnya pelajaran', 5, 'Ringan', NULL, NULL),
(5, 'Mengaktifkan alat komunikasi didalam kelas pada saat pelajaran berlangsung', 5, 'Ringan', NULL, NULL),
(6, 'Membuang sampah tidak pada tempatnya', 5, 'Ringan', NULL, NULL),
(7, 'Membawa teman selain siswa SMK BN maupun dengan siswa sekolah lain atau pihak lain', 5, 'Ringan', NULL, NULL),
(8, 'Membawa benda yang tidak ada kaitannya dengan proses belajar mengajar', 10, 'Ringan', NULL, NULL),
(9, 'Bertengkar / bertentangan dengan teman di lingkungan sekolah', 15, 'Sedang', NULL, NULL),
(10, 'Memalsu tandatangan guru, walikelas, kepala sekolah', 40, 'Berat', NULL, NULL),
(11, 'Menggunakan/menggelapkan SPP dari orang tua', 40, 'Berat', NULL, NULL),
(12, 'Membentuk organisasi selain OSIS maupun kegiatan lainnya tanpa seijin Kepala Sekolah', 15, 'Sedang', NULL, NULL),
(13, 'Menyalahgunakan Uang SPP', 40, 'Berat', NULL, NULL),
(14, 'Berbuat asusila', 100, 'Berat', NULL, NULL),
(15, 'Membawa rokok', 25, 'Sedang', NULL, NULL),
(16, 'Merokok / menghisap rokok di sekolah', 40, 'Berat', NULL, NULL),
(17, 'Merokok/ menghisap rokok di luar sekolah memakai seragam sekolah', 40, 'Berat', NULL, NULL),
(18, 'Membawa buku, majalah, kaset terlarang atau HP berisi gambar dan film porno', 25, 'Sedang', NULL, NULL),
(19, 'Memperjual belikan buku, majalah atau kaset terlarang', 75, 'Berat', NULL, NULL),
(20, 'Membawa senjata tajam tanpa ijin', 40, 'Berat', NULL, NULL),
(21, 'Memperjual belikan senjata tajam di sekolah', 40, 'Berat', NULL, NULL),
(22, 'Menggunakan senjata tajam untuk mengancam', 75, 'Berat', NULL, NULL),
(23, 'Menggunakan senjata tajam untuk melukai', 75, 'Berat', NULL, NULL),
(24, 'Membawa obat terlarang / minuman terlarang', 75, 'Berat', NULL, '2025-11-12 23:27:36'),
(25, 'Menggunakan obat / minuman terlarang di dalam lingkungan sekolah', 100, 'Berat', NULL, NULL),
(26, 'Memperjual belikan obat / minuman terlarang di dalam / di luar sekolah', 100, 'Berat', NULL, NULL),
(27, 'Disebabkan oleh siswa di dalam sekolah (intern)', 75, 'Berat', NULL, '2025-11-12 23:27:21'),
(28, 'Disebabkan oleh sekolah lain', 25, 'Sedang', NULL, NULL),
(29, 'Antar siswa SMK BN 666', 75, 'Berat', NULL, '2025-11-12 23:27:08'),
(30, 'Disertai ancaman', 75, 'Berat', NULL, '2025-11-12 23:26:51'),
(31, 'Disertai pemukulan', 100, 'Berat', NULL, NULL),
(32, 'Terlambat masuk sekolah lebih dari 15 menit - Satu kali', 2, 'Ringan', NULL, NULL),
(33, 'Terlambat masuk sekolah lebih dari 15 menit - Dua kali', 3, 'Ringan', NULL, NULL),
(34, 'Terlambat masuk sekolah lebih dari 15 menit - Tiga kali dan selebihnya', 5, 'Ringan', NULL, NULL),
(35, 'Terlambat masuk karena izin', 3, 'Ringan', NULL, NULL),
(36, 'Terlambat masuk karena diberi tugas guru', 2, 'Ringan', NULL, NULL),
(37, 'Terlambat masuk karena alasan yang dibuat-buat', 5, 'Ringan', NULL, NULL),
(38, 'Izin keluar saat proses belajar berlangsung dan tidak kembali', 10, 'Ringan', NULL, NULL),
(39, 'Pulang tanpa izin', 10, 'Ringan', NULL, NULL),
(40, 'Sakit tanpa keterangan (surat)', 2, 'Ringan', NULL, NULL),
(41, 'Izin tanpa keterangan (surat)', 2, 'Ringan', NULL, NULL),
(42, 'Alpa', 5, 'Ringan', NULL, NULL),
(43, 'Tidak mengikuti kegiatan belajar (membolos)', 10, 'Ringan', NULL, NULL),
(44, 'Siswa tidak masuk dengan membuat keterangan (surat) Palsu', 10, 'Ringan', NULL, NULL),
(45, 'Siswa keluar kelas saat proses belajar mengajar berlangsung tanpa izin', 5, 'Ringan', NULL, NULL),
(46, 'Memakai seragam tidak rapi / tidak dimasukkan', 5, 'Ringan', NULL, NULL),
(47, 'Siswa putri memakai seragam yang ketat / rok pendek', 5, 'Ringan', NULL, NULL),
(48, 'Tidak memakai perlengkapan upacara bendera (topi)', 5, 'Ringan', NULL, NULL),
(49, 'Salah memakai baju, rok atau celana', 5, 'Ringan', NULL, NULL),
(50, 'Salah atau tidak memakai ikat pinggang', 5, 'Ringan', NULL, NULL),
(51, 'Salah memakai sepatu (tidak sesuai ketentuan)', 5, 'Ringan', NULL, NULL),
(52, 'Tidak memakai kaos kaki', 5, 'Ringan', NULL, NULL),
(53, 'Salah / tidak memakai kaos dalam', 5, 'Ringan', NULL, NULL),
(54, 'Memakai topi yang bukan topi sekolah di lingkungan sekolah', 5, 'Ringan', NULL, NULL),
(55, 'Siswa putri memakai perhiasan perlebihan', 5, 'Ringan', NULL, NULL),
(56, 'Siswa putra memakai perhiasan atau aksesories (kalung, gelang, dll)', 5, 'Ringan', NULL, NULL),
(57, 'Potongan rambut putra tidak sesuai dengan ketentuan sekolah', 15, 'Sedang', NULL, NULL),
(58, 'Dicat / diwarna-warnai (putra-putri)', 15, 'Sedang', NULL, NULL),
(59, 'Bertato', 100, 'Berat', NULL, NULL),
(60, 'Kuku di cat', 20, 'Sedang', NULL, NULL),
(61, 'Membuat keributan/kegaduhan dalam kelas pada saat berlangsungnya pelajaran', 10, 'Sedang', '2025-11-12 23:21:02', '2025-11-12 23:21:02'),
(62, 'Masuk/Keluar lingkungan sekolah tanpa melewati gerbang sekolah', 20, 'Berat', '2025-11-12 23:21:42', '2025-11-12 23:21:42'),
(63, 'Berkata tidak jujur, tidak sopan/kasar', 10, 'Sedang', '2025-11-12 23:21:57', '2025-11-12 23:21:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_prestasi`
--

CREATE TABLE `jenis_prestasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_prestasi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poin` int(11) NOT NULL,
  `kategori` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penghargaan` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_prestasi`
--

INSERT INTO `jenis_prestasi` (`id`, `nama_prestasi`, `poin`, `kategori`, `penghargaan`, `created_at`, `updated_at`) VALUES
(1, 'Juara Nasional', 75, 'Akademik', 'Piala', '2025-11-13 01:17:09', '2025-11-13 01:19:48'),
(2, 'Juara Nasional', 75, 'Non-Akademik', 'Piala', '2025-11-13 01:17:36', '2025-11-13 01:19:43'),
(3, 'Juara Nasional', 75, 'Akademik', 'Piagam', '2025-11-13 01:18:37', '2025-11-13 01:19:37'),
(4, 'Juara Nasional', 75, 'Non-Akademik', 'Piagam', '2025-11-13 01:18:48', '2025-11-13 01:19:32'),
(5, 'Juara Nasional', 75, 'Akademik', 'Medali', '2025-11-13 01:19:25', '2025-11-13 01:19:25'),
(6, 'Juara Nasional', 75, 'Non-Akademik', 'Medali', '2025-11-13 01:20:04', '2025-11-13 01:20:04'),
(7, 'Juara Provinsi', 50, 'Akademik', 'Piala', '2025-11-13 01:20:30', '2025-11-13 01:20:30'),
(8, 'Juara Provinsi', 50, 'Non-Akademik', 'Piala', '2025-11-13 01:20:41', '2025-11-13 01:20:41'),
(9, 'Juara Provinsi', 50, 'Akademik', 'Piagam', '2025-11-13 01:20:52', '2025-11-13 01:20:52'),
(10, 'Juara Provinsi', 50, 'Non-Akademik', 'Piagam', '2025-11-13 01:21:13', '2025-11-13 01:21:13'),
(11, 'Juara Provinsi', 50, 'Akademik', 'Medali', '2025-11-13 01:21:26', '2025-11-13 01:21:26'),
(12, 'Juara Provinsi', 50, 'Non-Akademik', 'Medali', '2025-11-13 01:22:15', '2025-11-13 01:22:15'),
(13, 'Juara Internasional', 100, 'Akademik', 'Piala', '2025-11-13 01:22:43', '2025-11-13 01:22:43'),
(14, 'Juara Internasional', 100, 'Non-Akademik', 'Piala', '2025-11-13 01:22:51', '2025-11-13 01:22:51'),
(15, 'Juara Internasional', 100, 'Akademik', 'Piagam', '2025-11-13 01:23:05', '2025-11-13 01:23:05'),
(16, 'Juara Internasional', 100, 'Non-Akademik', 'Piagam', '2025-11-13 01:23:19', '2025-11-13 01:23:19'),
(17, 'Juara Internasional', 100, 'Akademik', 'Medali', '2025-11-13 01:23:30', '2025-11-13 01:23:30'),
(18, 'Juara Internasional', 100, 'Non-Akademik', 'Medali', '2025-11-13 01:23:42', '2025-11-13 01:23:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_sanksi`
--

CREATE TABLE `jenis_sanksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_sanksi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_sanksi`
--

INSERT INTO `jenis_sanksi` (`id`, `nama_sanksi`, `kategori`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Dicatat dan Konseling', 'Ringan', 'Apabila skor pelanggaran mencapai 1 s/d 5 maka dikategorikan ringan berupa dicatat dan konseling', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(2, '6-10 Peringatan Lisan', 'Ringan', '6-10 peringatan lisan', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(3, '11-15 Peringatan Tertulis dengan Perjanjian', 'Sedang', '11-15 peringatan tertulis dengan perjanjian', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(4, '16-20 Panggilan Orang Tua dengan Perjanjian Siswa Diatas Materai', 'Sedang', '16-20 panggilan orang tua dengan perjanjian siswa diatas materai', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(5, '21-25 Perjanjian Orang Tua dengan Perjanjian Diatas Materai', 'Sedang', '21-25 perjanjian orang tua dengan perjanjian diatas materai', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(6, '26-30 Diskors Selama 3 Hari', 'Berat', '26-30 diskors selama 3 hari', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(7, '31-35 Diskors Selama 7 Hari', 'Berat', '31-35 diskors selama 7 hari', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(8, '36-40 Diserahkan kepada Orang Tua untuk Dibina dalam Jangka Waktu Dua (2) Minggu', 'Berat', '36-40 diserahkan kepada orang tua untuk dibina dalam jangka waktu dua (2) minggu', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(9, 'Dikeluarkan dari Sekolah', 'Sangat Berat', 'Perjanjian diatas materai. Skors diserahkan kepada orang tua dan apabila sudah mencapai 100 dikeluarkan dari sekolah', '2025-11-18 02:44:10', '2025-11-18 02:44:10'),
(10, 'Dicatat dan Konseling', 'Ringan', 'Apabila skor pelanggaran mencapai 1 s/d 5 maka dikategorikan ringan berupa dicatat dan konseling', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(11, '6-10 Peringatan Lisan', 'Ringan', '6-10 peringatan lisan', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(12, '11-15 Peringatan Tertulis dengan Perjanjian', 'Sedang', '11-15 peringatan tertulis dengan perjanjian', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(13, '16-20 Panggilan Orang Tua dengan Perjanjian Siswa Diatas Materai', 'Sedang', '16-20 panggilan orang tua dengan perjanjian siswa diatas materai', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(14, '21-25 Perjanjian Orang Tua dengan Perjanjian Diatas Materai', 'Sedang', '21-25 perjanjian orang tua dengan perjanjian diatas materai', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(15, '26-30 Diskors Selama 3 Hari', 'Berat', '26-30 diskors selama 3 hari', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(16, '31-35 Diskors Selama 7 Hari', 'Berat', '31-35 diskors selama 7 hari', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(17, '36-40 Diserahkan kepada Orang Tua untuk Dibina dalam Jangka Waktu Dua (2) Minggu', 'Berat', '36-40 diserahkan kepada orang tua untuk dibina dalam jangka waktu dua (2) minggu', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(18, 'Dikeluarkan dari Sekolah', 'Sangat Berat', 'Perjanjian diatas materai. Skors diserahkan kepada orang tua dan apabila sudah mencapai 100 dikeluarkan dari sekolah', '2025-11-18 02:46:40', '2025-11-18 02:46:40'),
(19, 'Dicatat dan Konseling', 'Ringan', 'Apabila skor pelanggaran mencapai 1 s/d 5 maka dikategorikan ringan berupa dicatat dan konseling', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(20, '6-10 Peringatan Lisan', 'Ringan', '6-10 peringatan lisan', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(21, '11-15 Peringatan Tertulis dengan Perjanjian', 'Sedang', '11-15 peringatan tertulis dengan perjanjian', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(22, '16-20 Panggilan Orang Tua dengan Perjanjian Siswa Diatas Materai', 'Sedang', '16-20 panggilan orang tua dengan perjanjian siswa diatas materai', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(23, '21-25 Perjanjian Orang Tua dengan Perjanjian Diatas Materai', 'Sedang', '21-25 perjanjian orang tua dengan perjanjian diatas materai', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(24, '26-30 Diskors Selama 3 Hari', 'Berat', '26-30 diskors selama 3 hari', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(25, '31-35 Diskors Selama 7 Hari', 'Berat', '31-35 diskors selama 7 hari', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(26, '36-40 Diserahkan kepada Orang Tua untuk Dibina dalam Jangka Waktu Dua (2) Minggu', 'Berat', '36-40 diserahkan kepada orang tua untuk dibina dalam jangka waktu dua (2) minggu', '2025-11-18 17:49:01', '2025-11-18 17:49:01'),
(27, 'Dikeluarkan dari Sekolah', 'Sangat Berat', 'Perjanjian diatas materai. Skors diserahkan kepada orang tua dan apabila sudah mencapai 100 dikeluarkan dari sekolah', '2025-11-18 17:49:01', '2025-11-18 17:49:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `jurusan`, `guru_id`, `created_at`, `updated_at`) VALUES
(1, 'XII PPLG 2', 'PPLG', 1, '2025-11-13 00:00:25', '2025-11-13 00:00:25'),
(2, 'XII PPLG 1', 'PPLG', 3, '2025-11-14 00:30:39', '2025-11-14 00:30:39'),
(3, 'XII PPLG 3', 'PPLG', 2, '2025-11-14 00:30:48', '2025-11-14 00:30:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_guru_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000001_create_users_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_11_10_065724_create_tahun_ajaran_table', 1),
(6, '2025_11_10_065800_create_kelas_table', 1),
(7, '2025_11_10_074422_create_siswa_table', 1),
(8, '2025_11_10_074700_create_jenis_prestasi_table', 1),
(9, '2025_11_10_074701_create_jenis_pelanggaran_table', 1),
(10, '2025_11_10_074800_create_prestasi_table', 1),
(11, '2025_11_10_074801_create_pelanggaran_table', 1),
(12, '2025_11_10_074802_create_sanksi_table', 1),
(13, '2025_11_10_074803_create_pelaksanaan_sanksi_table', 1),
(15, '2025_11_10_074900_create_monitoring_pelanggaran_table', 1),
(16, '2025_11_11_064339_create_verifikasi_data_table', 1),
(17, '2025_11_13_024932_make_pelanggaran_id_nullable_in_sanksi_table', 1),
(18, '2025_11_13_025323_change_sanksi_rekomendasi_to_sanksi_id_in_jenis_pelanggaran', 1),
(19, '2025_11_13_035216_change_kategori_to_enum_in_jenis_pelanggaran_table', 1),
(20, '2025_11_13_071739_rename_user_id_to_siswa_id_in_pelanggaran_table', 2),
(21, '2025_11_13_074810_update_verifikasi_data_status_enum', 3),
(22, '2025_11_13_091854_update_bimbingan_konseling_data', 4),
(23, '2025_11_14_063058_modify_verifikasi_data_relations', 5),
(24, '2025_11_14_150820_add_bukti_columns_to_sanksi_table', 6),
(25, '2025_11_14_162625_rename_bukti_foto_to_bukti_in_sanksi_table', 7),
(26, '2025_11_15_031415_update_prestasi_verification_field', 8),
(27, '2025_11_15_032319_add_prestasi_id_to_verifikasi_data_table', 9),
(28, '2025_11_15_052225_add_pelanggaran_id_to_bimbingan_konseling_table', 10),
(30, '2025_11_10_074804_create_bimbingan_konseling_table', 11),
(31, '2025_11_15_073118_add_siswa_id_to_users_table', 12),
(32, '2025_11_15_074319_create_activity_logs_table', 13),
(34, '2024_create_backup_data_table', 14),
(35, '2025_11_17_004454_add_tanggal_and_fix_guru_id_columns', 14),
(36, '2025_11_17_020503_update_pelaksanaan_sanksi_table_add_columns', 15),
(37, '2025_01_18_000000_alter_backup_data_table', 16),
(38, '2025_11_17_095541_create_orangtua_table', 17),
(39, '2025_11_17_100307_add_ortu_id_to_users_table', 18),
(40, '2025_11_17_101215_make_user_id_nullable_in_orangtua_table', 19),
(41, '2025_11_18_015611_create_notifications_table', 20),
(42, '2025_01_20_000001_create_jenis_sanksi_table', 21),
(43, '2025_01_20_000002_modify_sanksi_table', 22),
(44, '2025_01_20_000004_remove_sanksi_id_from_jenis_pelanggaran', 23),
(46, '2025_11_19_021735_update_pelaksanaan_sanksi_status_default', 24),
(47, '2025_11_19_023806_update_sanksi_status_enum', 25),
(48, '2025_11_20_000001_drop_tanggal_pelaksanaan_column', 26),
(49, '2025_11_19_070653_update_bimbingan_konseling_default_status', 27),
(50, '2025_11_20_000002_add_soft_deletes_to_tables', 27),
(51, '2025_11_19_070851_remove_soft_deletes_from_tables', 28);

-- --------------------------------------------------------

--
-- Struktur dari tabel `monitoring_pelanggaran`
--

CREATE TABLE `monitoring_pelanggaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelanggaran_id` bigint(20) UNSIGNED NOT NULL,
  `kepsek_id` bigint(20) UNSIGNED DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `monitoring_pelanggaran`
--

INSERT INTO `monitoring_pelanggaran` (`id`, `pelanggaran_id`, `kepsek_id`, `catatan`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Good', 'selesai', '2025-11-18 18:48:58', '2025-11-18 18:52:45'),
(2, 4, NULL, 'Pelanggaran baru dari guru: ', 'baru', '2025-11-18 19:58:44', '2025-11-18 19:58:44'),
(3, 5, 3, 'Well', 'selesai', '2025-11-18 20:00:36', '2025-11-19 02:49:05'),
(4, 6, NULL, 'Pelanggaran baru dari kesiswaan: ', 'baru', '2025-11-19 21:00:11', '2025-11-19 21:00:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `title`, `message`, `url`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 2, 'pelanggaran', 'Pelanggaran Baru Perlu Verifikasi', 'Siswa Baim melakukan Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 'http://127.0.0.1:8000/kesiswaan/verifikasi', 1, '2025-11-17 23:06:48', '2025-11-17 23:31:55'),
(2, 1, 'pelanggaran', 'Pelanggaran Baru', 'Siswa Baim melakukan Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 'http://127.0.0.1:8000/admin/pelanggaran', 1, '2025-11-17 23:06:48', '2025-11-17 23:07:42'),
(3, 3, 'pelanggaran', 'Pelanggaran Baru', 'Siswa Baim melakukan Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 'http://127.0.0.1:8000/kepsek/dashboard', 1, '2025-11-17 23:06:48', '2025-11-17 23:32:56'),
(4, 4, 'pelanggaran', 'Pelanggaran Baru - Perlu Konseling', 'Siswa Baim melakukan Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 'http://127.0.0.1:8000/bk/dashboard', 1, '2025-11-17 23:06:48', '2025-11-18 23:14:04'),
(5, 6, 'pelanggaran', 'Pelanggaran Siswa Kelas Anda', 'Siswa Baim melakukan Mengambil (mencuri) barang milik sekolah, guru, karyawan atau teman', 'http://127.0.0.1:8000/walas/pelanggaran', 1, '2025-11-17 23:06:48', '2025-11-18 02:58:17'),
(6, 5, 'verifikasi', 'Pelanggaran Ditolak', 'Pelanggaran siswa Baim telah ditolak', 'http://127.0.0.1:8000/guru/dashboard', 1, '2025-11-17 23:31:52', '2025-11-17 23:32:17'),
(7, 10, 'verifikasi', 'Pelanggaran Ditolak', 'Pelanggaran Anda telah ditolak', 'http://127.0.0.1:8000/siswa/dashboard', 1, '2025-11-17 23:31:52', '2025-11-18 20:51:53'),
(8, 6, 'sanksi', 'Sanksi Siswa Kelas Anda', 'Siswa Faisal mendapat sanksi: ', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 03:06:54', '2025-11-18 18:07:11'),
(9, 6, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Faisal telah disetujui', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 03:06:54', '2025-11-18 18:07:15'),
(10, 2, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Surya telah disetujui', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 03:22:33', '2025-11-18 17:40:19'),
(11, 9, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran Anda telah disetujui', 'http://127.0.0.1:8000/siswa/dashboard', 0, '2025-11-18 03:22:33', '2025-11-18 03:22:33'),
(12, 2, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Faisal telah disetujui', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 18:03:20', '2025-11-18 18:06:12'),
(13, 11, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran Anda telah disetujui', 'http://127.0.0.1:8000/siswa/dashboard', 1, '2025-11-18 18:03:20', '2025-11-18 18:39:20'),
(14, 2, '', 'Catatan Kepsek - Pelanggaran Siswa', 'Kepala sekolah memberikan catatan: Mantap', 'http://127.0.0.1:8000/guru/pelanggaran', 1, '2025-11-18 18:48:58', '2025-11-18 18:51:04'),
(15, 2, '', 'Catatan Kepsek - Monitoring Pelanggaran', 'Kepala sekolah memberikan catatan monitoring: Mantap', 'http://127.0.0.1:8000/kesiswaan/monitoring', 1, '2025-11-18 18:48:58', '2025-11-18 18:51:41'),
(16, 2, '', 'Catatan Kepsek - Pelanggaran Siswa', 'Kepala sekolah memberikan catatan: Good', 'http://127.0.0.1:8000/guru/pelanggaran', 1, '2025-11-18 18:52:45', '2025-11-18 19:21:51'),
(17, 2, '', 'Catatan Kepsek - Monitoring Pelanggaran', 'Kepala sekolah memberikan catatan monitoring: Good', 'http://127.0.0.1:8000/kesiswaan/monitoring', 1, '2025-11-18 18:52:45', '2025-11-18 19:22:52'),
(18, 2, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Faisal update status sanksi: tuntas', 'http://127.0.0.1:8000/kesiswaan/pelaksanaan-sanksi', 1, '2025-11-18 19:29:46', '2025-11-18 19:30:02'),
(19, 1, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Faisal update status sanksi: tuntas', 'http://127.0.0.1:8000/admin/sanksi', 1, '2025-11-18 19:29:46', '2025-11-18 19:30:21'),
(20, 2, 'pelanggaran', 'Pelanggaran Baru Perlu Verifikasi', 'Siswa Baim melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/kesiswaan/verifikasi', 1, '2025-11-18 19:58:44', '2025-11-18 20:01:05'),
(21, 1, 'pelanggaran', 'Pelanggaran Baru', 'Siswa Baim melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/admin/pelanggaran', 1, '2025-11-18 19:58:44', '2025-11-18 19:59:13'),
(22, 3, 'pelanggaran', 'Pelanggaran Baru', 'Siswa Baim melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/kepsek/dashboard', 0, '2025-11-18 19:58:44', '2025-11-18 19:58:44'),
(23, 4, 'pelanggaran', 'Pelanggaran Baru - Perlu Konseling', 'Siswa Baim melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/bk/dashboard', 1, '2025-11-18 19:58:44', '2025-11-18 23:07:40'),
(24, 5, 'pelanggaran', 'Pelanggaran Siswa Kelas Anda', 'Siswa Baim melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/walas/pelanggaran', 1, '2025-11-18 19:58:44', '2025-11-18 20:00:48'),
(25, 10, 'pelanggaran', 'Pelanggaran Tercatat', 'Anda tercatat melakukan Bertengkar / bertentangan dengan teman di lingkungan sekolah', 'http://127.0.0.1:8000/siswa/dashboard', 1, '2025-11-18 19:58:44', '2025-11-18 20:51:42'),
(26, 10, 'sanksi', 'Sanksi Baru', 'Anda mendapat sanksi: ', 'http://127.0.0.1:8000/siswa/pelaksanaan-sanksi', 1, '2025-11-18 19:59:55', '2025-11-18 20:51:39'),
(27, 5, 'sanksi', 'Sanksi Siswa Kelas Anda', 'Siswa Baim mendapat sanksi: ', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 19:59:55', '2025-11-18 20:00:41'),
(28, 14, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Baim telah disetujui', 'http://127.0.0.1:8000/guru/dashboard', 1, '2025-11-18 19:59:55', '2025-11-19 01:10:48'),
(29, 10, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran Anda telah disetujui', 'http://127.0.0.1:8000/siswa/dashboard', 1, '2025-11-18 19:59:55', '2025-11-18 20:51:50'),
(30, 10, 'sanksi', 'Sanksi Baru', 'Anda mendapat sanksi: ', 'http://127.0.0.1:8000/siswa/pelaksanaan-sanksi', 1, '2025-11-18 20:01:11', '2025-11-18 20:51:34'),
(31, 5, 'sanksi', 'Sanksi Siswa Kelas Anda', 'Siswa Baim mendapat sanksi: ', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 20:01:11', '2025-11-18 21:35:23'),
(32, 5, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Baim telah disetujui', 'http://127.0.0.1:8000/walas/dashboard', 1, '2025-11-18 20:01:11', '2025-11-18 21:35:25'),
(33, 10, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran Anda telah disetujui', 'http://127.0.0.1:8000/siswa/dashboard', 1, '2025-11-18 20:01:11', '2025-11-18 20:51:37'),
(34, 2, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Baim update status sanksi: tuntas', 'http://127.0.0.1:8000/kesiswaan/pelaksanaan-sanksi', 0, '2025-11-18 21:30:14', '2025-11-18 21:30:14'),
(35, 1, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Baim update status sanksi: tuntas', 'http://127.0.0.1:8000/admin/sanksi', 1, '2025-11-18 21:30:14', '2025-11-19 01:06:40'),
(36, 5, '', 'Catatan Kepsek - Pelanggaran Siswa', 'Kepala sekolah memberikan catatan: Well', 'http://127.0.0.1:8000/guru/pelanggaran', 0, '2025-11-19 02:49:05', '2025-11-19 02:49:05'),
(37, 2, '', 'Catatan Kepsek - Monitoring Pelanggaran', 'Kepala sekolah memberikan catatan monitoring: Well', 'http://127.0.0.1:8000/kesiswaan/monitoring', 0, '2025-11-19 02:49:05', '2025-11-19 02:49:05'),
(38, 2, 'verifikasi', 'Pelanggaran Ditolak', 'Pelanggaran siswa Nofa telah ditolak', 'http://127.0.0.1:8000/walas/dashboard', 0, '2025-11-19 21:02:00', '2025-11-19 21:02:00'),
(39, 7, 'verifikasi', 'Pelanggaran Ditolak', 'Pelanggaran Anda telah ditolak', 'http://127.0.0.1:8000/siswa/dashboard', 0, '2025-11-19 21:02:00', '2025-11-19 21:02:00'),
(40, 7, 'sanksi', 'Sanksi Baru', 'Anda mendapat sanksi: ', 'http://127.0.0.1:8000/siswa/pelaksanaan-sanksi', 0, '2025-11-19 21:02:16', '2025-11-19 21:02:16'),
(41, 2, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran siswa Nofa telah disetujui', 'http://127.0.0.1:8000/walas/dashboard', 0, '2025-11-19 21:02:16', '2025-11-19 21:02:16'),
(42, 7, 'verifikasi', 'Pelanggaran Disetujui', 'Pelanggaran Anda telah disetujui', 'http://127.0.0.1:8000/siswa/dashboard', 0, '2025-11-19 21:02:16', '2025-11-19 21:02:16'),
(43, 2, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Nofa update status sanksi: dikerjakan', 'http://127.0.0.1:8000/kesiswaan/pelaksanaan-sanksi', 0, '2025-11-19 21:07:54', '2025-11-19 21:07:54'),
(44, 1, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Nofa update status sanksi: dikerjakan', 'http://127.0.0.1:8000/admin/sanksi', 0, '2025-11-19 21:07:54', '2025-11-19 21:07:54'),
(45, 2, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Nofa update status sanksi: tuntas', 'http://127.0.0.1:8000/kesiswaan/pelaksanaan-sanksi', 0, '2025-11-19 21:08:16', '2025-11-19 21:08:16'),
(46, 1, 'sanksi', 'Update Pelaksanaan Sanksi', 'Siswa Nofa update status sanksi: tuntas', 'http://127.0.0.1:8000/admin/sanksi', 0, '2025-11-19 21:08:16', '2025-11-19 21:08:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orangtua`
--

CREATE TABLE `orangtua` (
  `orangtua_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `hubungan` enum('ayah','ibu','wali') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_orangtua` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orangtua`
--

INSERT INTO `orangtua` (`orangtua_id`, `user_id`, `siswa_id`, `hubungan`, `nama_orangtua`, `pekerjaan`, `pendidikan`, `no_telp`, `alamat`, `created_at`, `updated_at`) VALUES
(2, NULL, 1, 'ibu', 'Ortu Surya', 'Buruh Pabrik', 'S2 Informatika', '081208120331', 'Ciguruwik', '2025-11-17 03:15:09', '2025-11-18 00:24:09'),
(3, NULL, 2, 'ibu', 'Ibu Nofa', 'Perdana menteri keuangan', 'S3 Manajemen keuangan', '083341430978', 'Maelom', '2025-11-18 00:23:50', '2025-11-18 00:23:50'),
(4, NULL, 3, 'wali', 'Wali Baim', 'Dokter', 'S2 Farmasi', '081209808123', 'Rancaekek', '2025-11-18 00:25:15', '2025-11-18 00:25:15'),
(5, NULL, 4, 'ayah', 'Ayah Faisal', 'Dosen', 'S3 Ilmu Hukum', '082102175674', 'Panyaungan', '2025-11-18 00:30:22', '2025-11-18 00:30:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelaksanaan_sanksi`
--

CREATE TABLE `pelaksanaan_sanksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sanksi_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `bukti` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('terjadwal','dikerjakan','tuntas','terlambat','perpanjangan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'terjadwal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelaksanaan_sanksi`
--

INSERT INTO `pelaksanaan_sanksi` (`id`, `sanksi_id`, `tanggal_mulai`, `tanggal_selesai`, `bukti`, `catatan`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, '2025-11-19', '2025-11-27', 'uploads/bukti_sanksi/1763519386_Jepretan Layar 2025-11-11 pukul 08.20.28.png', 'Rispek', NULL, 'tuntas', '2025-11-18 18:04:51', '2025-11-18 19:29:46'),
(3, 4, '2025-11-19', '2025-11-19', 'uploads/bukti_sanksi/1763526614_Jepretan Layar 2025-11-12 pukul 07.41.26.png', 'beres', NULL, 'tuntas', '2025-11-18 20:49:48', '2025-11-18 21:30:14'),
(4, 5, '2025-11-20', '2025-11-25', 'uploads/bukti_sanksi/1763611696_Jepretan Layar 2025-11-13 pukul 11.01.27.png', 'Sanksi diubah status menjadi berjalan', NULL, 'tuntas', '2025-11-19 21:05:13', '2025-11-19 21:08:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggaran`
--

CREATE TABLE `pelanggaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jenis_pelanggaran_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pelanggaran` date DEFAULT NULL,
  `tahun_ajaran_id` bigint(20) UNSIGNED NOT NULL,
  `poin` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terverifikasi` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelanggaran`
--

INSERT INTO `pelanggaran` (`id`, `siswa_id`, `guru_id`, `jenis_pelanggaran_id`, `tanggal_pelanggaran`, `tahun_ajaran_id`, `poin`, `keterangan`, `terverifikasi`, `created_at`, `updated_at`) VALUES
(3, 4, 2, 1, NULL, 2, 10, 'Culangung', 1, '2025-11-18 18:03:15', '2025-11-18 18:03:20'),
(4, 3, 14, 9, NULL, 2, 15, 'Gelud pake monitor', 1, '2025-11-18 19:58:44', '2025-11-18 19:59:55'),
(5, 3, 5, 3, NULL, 2, 50, 'mailng', 1, '2025-11-18 20:00:36', '2025-11-18 20:01:11'),
(6, 2, 2, 6, NULL, 2, 5, 'p', 1, '2025-11-19 21:00:11', '2025-11-19 21:02:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prestasi`
--

CREATE TABLE `prestasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jenis_prestasi_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_prestasi` date DEFAULT NULL,
  `tahun_ajaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  `poin` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `terverifikasi` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `prestasi`
--

INSERT INTO `prestasi` (`id`, `siswa_id`, `guru_id`, `jenis_prestasi_id`, `tanggal_prestasi`, `tahun_ajaran_id`, `poin`, `keterangan`, `created_at`, `updated_at`, `terverifikasi`) VALUES
(1, 2, 2, 11, NULL, 1, 50, 'Hebatt', '2025-11-16 18:20:22', '2025-11-18 19:11:24', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sanksi`
--

CREATE TABLE `sanksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelanggaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jenis_sanksi_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('direncanakan','berjalan','selesai','ditunda','dibatalkan') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'direncanakan'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sanksi`
--

INSERT INTO `sanksi` (`id`, `pelanggaran_id`, `jenis_sanksi_id`, `tanggal_mulai`, `tanggal_selesai`, `bukti`, `catatan`, `created_at`, `updated_at`, `status`) VALUES
(2, 3, 2, '2025-11-19', '2025-11-26', NULL, 'Citak', '2025-11-18 18:04:51', '2025-11-18 20:50:51', 'selesai'),
(4, 5, 8, '2025-11-19', '2025-11-27', NULL, 'Sanksi otomatis berdasarkan total poin: 65', '2025-11-18 20:01:11', '2025-11-18 20:49:48', 'berjalan'),
(5, 6, 1, '2025-11-20', '2025-11-25', NULL, 'Sanksi otomatis berdasarkan total poin: 5', '2025-11-19 21:02:16', '2025-11-19 21:05:13', 'berjalan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('22KqNdt9O1BQrHDhBOORK8L4OiUFRJ8ZViBrSEvY', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzM5bkVSVVp0eHNBOWdwZkt2b1pwYVlNSHVVZFJHa0ZHQ1htMENIZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763599488),
('gNrh6ZuzimZ5T6gb1BHWX0PCnN69S8rhaa7nGjvH', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZmRaRXhyOVJRVWNHWlBOS2NXc0JaN2luZVBaNUdPT0JEeDRtSDZ3RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9iayI7czo1OiJyb3V0ZSI7czo4OiJhZG1pbi5iayI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1763546926),
('Jva64MmTHEQYLS8lr8aL85iPmSWPiIt5QyegNQbQ', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTDdva2xmenN5WkR0VUdWYjFqNVZpcFJ4UlZaN3BaNklGSEtxWDJCcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi91c2Vycy9jcmVhdGUiO3M6NToicm91dGUiO3M6MTg6ImFkbWluLnVzZXJzLmNyZWF0ZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1763611712);

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nis` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_siswa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nama_siswa`, `kelas_id`, `jenis_kelamin`, `created_at`, `updated_at`) VALUES
(1, '11111', 'Surya', 1, 'L', '2025-11-13 00:00:41', '2025-11-14 00:31:28'),
(2, '21111', 'Nofa', 1, 'L', '2025-11-14 00:07:19', '2025-11-14 00:07:19'),
(3, '31111', 'Baim', 2, 'L', '2025-11-14 00:31:22', '2025-11-18 00:13:55'),
(4, '41111', 'Faisal', 3, 'L', '2025-11-16 17:55:58', '2025-11-16 17:55:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun_ajaran` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_aktif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`id`, `tahun_ajaran`, `semester`, `status_aktif`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', 'Ganjil', 0, NULL, '2025-11-17 18:29:03'),
(2, '2025\\2026', '2', 1, NULL, '2025-11-17 18:29:03'),
(3, '2026/2027', 'Ganjil', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','guru','kepsek','siswa','ortu','bk','wali_kelas','kesiswaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `can_verify` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ortu_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `guru_id`, `username`, `password`, `level`, `can_verify`, `created_at`, `updated_at`, `siswa_id`, `ortu_id`) VALUES
(1, NULL, 'admin', '$2y$12$L82S0tbViVckcglRh0FAouDu2uODwPbAh0.TgQo7FNF8y4ooP0bpK', 'admin', 0, '2025-11-12 22:59:59', '2025-11-12 22:59:59', NULL, NULL),
(2, 6, 'kesiswaan', '$2y$12$dphXu2s8CeqCbnfP/pihquvkrXgfUMA07zHAjDU0M2apfLglVdIhS', 'kesiswaan', 1, '2025-11-13 00:02:21', '2025-11-16 18:02:12', NULL, NULL),
(3, 8, 'kepsek', '$2y$12$ugbOphwHEKuJGW/m9wsjf.8la7RnO2PJ3x3Tx1Lzv78fkstGs8jEK', 'kepsek', 1, '2025-11-13 00:02:48', '2025-11-17 19:57:09', NULL, NULL),
(4, 7, 'bk', '$2y$12$pdJovBPMXjrpx.l.vM1LiO2dAzGq1pqLcvS4/3MzXVbILsqJspGNe', 'bk', 1, '2025-11-13 00:03:09', '2025-11-17 19:56:32', NULL, NULL),
(5, 3, 'suhe', '$2y$12$pPITT7AGOt1DBDUKfMwvqOtxbX.smdPFbtUfGE1iErzjNfYJ/6PUG', 'wali_kelas', 0, '2025-11-13 00:03:37', '2025-11-18 00:07:22', NULL, NULL),
(6, 2, 'handi', '$2y$12$qECibpL/1ubTLaFhU6KMm.53avx2TFLdP9tTvir6VjtG.ghmfvafm', 'wali_kelas', 1, '2025-11-13 00:03:55', '2025-11-18 00:06:20', NULL, NULL),
(7, 1, 'nofa', '$2y$12$PSz328C8hTn6In2SFFmDtewikP5SB36VHjxzbHQnGOfgXkkFgFLQy', 'siswa', 1, '2025-11-13 00:04:23', '2025-11-16 23:16:14', 2, NULL),
(8, NULL, 'wali baim', '$2y$12$GFJxa82q1RsseTwMZcujc.WvtjtEuG4vVVA08XG3Di3C7SGmyCDXO', 'ortu', 0, '2025-11-13 00:04:45', '2025-11-18 19:09:12', NULL, 4),
(9, NULL, 'surya', '$2y$12$12EZQ6irZT2wa6CbmeQkN.dgn.HH3hxlOxFKaHVzBSCzNewxh/Ure', 'siswa', 0, '2025-11-16 23:17:05', '2025-11-16 23:17:05', 1, NULL),
(10, NULL, 'baim', '$2y$12$nzBQkM21VXKpiIsxWSYF9.XHRAndpwMt80Yd2ZWHXK/EFHkmr/8g6', 'siswa', 0, '2025-11-17 23:07:33', '2025-11-17 23:07:33', 3, NULL),
(11, NULL, 'faisal', '$2y$12$ezShp4YiBNGUctnGONOBuO0iCR0t4hgyZN4IWIE3MUkp.pjneJj4a', 'siswa', 0, '2025-11-18 03:13:53', '2025-11-18 03:13:53', 4, NULL),
(12, NULL, 'ortu surya', '$2y$12$kwVkmqWh0sKlLos3cc0bzushDdTd5ZCDKHzsUGlnLJAdgqVinFG7O', 'ortu', 0, '2025-11-18 19:09:49', '2025-11-18 19:09:49', NULL, 2),
(13, NULL, 'ayah faisal', '$2y$12$NV5yDikz23EXg.mLSlQ4N.Bj76xb5NiEVP4A5wshURjYEpxhIq22a', 'ortu', 0, '2025-11-18 19:10:18', '2025-11-18 19:10:18', NULL, 5),
(14, 5, 'soni', '$2y$12$yxCwnouoNrQ7lHfs7kWc9eE6WTK6DWGwD3dF.sEsM2QbbnH2LgFZ2', 'guru', 0, '2025-11-18 19:54:51', '2025-11-18 19:54:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `verifikasi_data`
--

CREATE TABLE `verifikasi_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pelanggaran_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prestasi_id` bigint(20) UNSIGNED DEFAULT NULL,
  `siswa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guru_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('menunggu','diverifikasi','ditolak','direvisi') COLLATE utf8mb4_unicode_ci DEFAULT 'menunggu',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `verifikasi_data`
--

INSERT INTO `verifikasi_data` (`id`, `pelanggaran_id`, `prestasi_id`, `siswa_id`, `guru_id`, `status`, `created_at`, `updated_at`) VALUES
(8, 3, NULL, 4, 2, 'diverifikasi', '2025-11-18 18:03:15', '2025-11-18 18:03:20'),
(9, 4, NULL, 3, 14, 'diverifikasi', '2025-11-18 19:58:44', '2025-11-18 19:59:55'),
(10, 5, NULL, 3, 5, 'diverifikasi', '2025-11-18 20:00:36', '2025-11-18 20:01:11'),
(11, 6, NULL, 2, 2, 'diverifikasi', '2025-11-19 21:00:11', '2025-11-19 21:02:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `backup_data`
--
ALTER TABLE `backup_data`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `bimbingan_konseling`
--
ALTER TABLE `bimbingan_konseling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bimbingan_konseling_siswa_id_foreign` (`siswa_id`),
  ADD KEY `bimbingan_konseling_bk_id_foreign` (`bk_id`),
  ADD KEY `bimbingan_konseling_pelanggaran_id_foreign` (`pelanggaran_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_pelanggaran`
--
ALTER TABLE `jenis_pelanggaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_prestasi`
--
ALTER TABLE `jenis_prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jenis_sanksi`
--
ALTER TABLE `jenis_sanksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_guru_id_foreign` (`guru_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `monitoring_pelanggaran`
--
ALTER TABLE `monitoring_pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `monitoring_pelanggaran_pelanggaran_id_foreign` (`pelanggaran_id`),
  ADD KEY `monitoring_pelanggaran_kepsek_id_foreign` (`kepsek_id`);

--
-- Indeks untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`orangtua_id`),
  ADD KEY `orangtua_siswa_id_foreign` (`siswa_id`),
  ADD KEY `orangtua_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pelaksanaan_sanksi`
--
ALTER TABLE `pelaksanaan_sanksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelaksanaan_sanksi_sanksi_id_foreign` (`sanksi_id`);

--
-- Indeks untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggaran_user_id_foreign` (`siswa_id`),
  ADD KEY `pelanggaran_guru_id_foreign` (`guru_id`),
  ADD KEY `pelanggaran_jenis_pelanggaran_id_foreign` (`jenis_pelanggaran_id`),
  ADD KEY `pelanggaran_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indeks untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prestasi_siswa_id_foreign` (`siswa_id`),
  ADD KEY `prestasi_guru_id_foreign` (`guru_id`),
  ADD KEY `prestasi_jenis_prestasi_id_foreign` (`jenis_prestasi_id`),
  ADD KEY `prestasi_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indeks untuk tabel `sanksi`
--
ALTER TABLE `sanksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sanksi_pelanggaran_id_foreign` (`pelanggaran_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `siswa_nis_unique` (`nis`),
  ADD KEY `siswa_kelas_id_foreign` (`kelas_id`);

--
-- Indeks untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_guru_id_foreign` (`guru_id`),
  ADD KEY `users_siswa_id_foreign` (`siswa_id`),
  ADD KEY `users_ortu_id_foreign` (`ortu_id`);

--
-- Indeks untuk tabel `verifikasi_data`
--
ALTER TABLE `verifikasi_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifikasi_data_guru_id_foreign` (`guru_id`),
  ADD KEY `verifikasi_data_pelanggaran_id_foreign` (`pelanggaran_id`),
  ADD KEY `verifikasi_data_siswa_id_foreign` (`siswa_id`),
  ADD KEY `verifikasi_data_prestasi_id_foreign` (`prestasi_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `backup_data`
--
ALTER TABLE `backup_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `bimbingan_konseling`
--
ALTER TABLE `bimbingan_konseling`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `jenis_pelanggaran`
--
ALTER TABLE `jenis_pelanggaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT untuk tabel `jenis_prestasi`
--
ALTER TABLE `jenis_prestasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `jenis_sanksi`
--
ALTER TABLE `jenis_sanksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `monitoring_pelanggaran`
--
ALTER TABLE `monitoring_pelanggaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  MODIFY `orangtua_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pelaksanaan_sanksi`
--
ALTER TABLE `pelaksanaan_sanksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `sanksi`
--
ALTER TABLE `sanksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `verifikasi_data`
--
ALTER TABLE `verifikasi_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `bimbingan_konseling`
--
ALTER TABLE `bimbingan_konseling`
  ADD CONSTRAINT `bimbingan_konseling_bk_id_foreign` FOREIGN KEY (`bk_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bimbingan_konseling_pelanggaran_id_foreign` FOREIGN KEY (`pelanggaran_id`) REFERENCES `pelanggaran` (`id`),
  ADD CONSTRAINT `bimbingan_konseling_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`);

--
-- Ketidakleluasaan untuk tabel `monitoring_pelanggaran`
--
ALTER TABLE `monitoring_pelanggaran`
  ADD CONSTRAINT `monitoring_pelanggaran_kepsek_id_foreign` FOREIGN KEY (`kepsek_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `monitoring_pelanggaran_pelanggaran_id_foreign` FOREIGN KEY (`pelanggaran_id`) REFERENCES `pelanggaran` (`id`);

--
-- Ketidakleluasaan untuk tabel `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orangtua`
--
ALTER TABLE `orangtua`
  ADD CONSTRAINT `orangtua_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orangtua_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `pelaksanaan_sanksi`
--
ALTER TABLE `pelaksanaan_sanksi`
  ADD CONSTRAINT `pelaksanaan_sanksi_sanksi_id_foreign` FOREIGN KEY (`sanksi_id`) REFERENCES `sanksi` (`id`);

--
-- Ketidakleluasaan untuk tabel `pelanggaran`
--
ALTER TABLE `pelanggaran`
  ADD CONSTRAINT `pelanggaran_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pelanggaran_jenis_pelanggaran_id_foreign` FOREIGN KEY (`jenis_pelanggaran_id`) REFERENCES `jenis_pelanggaran` (`id`),
  ADD CONSTRAINT `pelanggaran_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`id`),
  ADD CONSTRAINT `pelanggaran_user_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `prestasi`
--
ALTER TABLE `prestasi`
  ADD CONSTRAINT `prestasi_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `prestasi_jenis_prestasi_id_foreign` FOREIGN KEY (`jenis_prestasi_id`) REFERENCES `jenis_prestasi` (`id`),
  ADD CONSTRAINT `prestasi_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `prestasi_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`id`);

--
-- Ketidakleluasaan untuk tabel `sanksi`
--
ALTER TABLE `sanksi`
  ADD CONSTRAINT `sanksi_pelanggaran_id_foreign` FOREIGN KEY (`pelanggaran_id`) REFERENCES `pelanggaran` (`id`);

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`id`),
  ADD CONSTRAINT `users_ortu_id_foreign` FOREIGN KEY (`ortu_id`) REFERENCES `orangtua` (`orangtua_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `verifikasi_data`
--
ALTER TABLE `verifikasi_data`
  ADD CONSTRAINT `verifikasi_data_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `verifikasi_data_pelanggaran_id_foreign` FOREIGN KEY (`pelanggaran_id`) REFERENCES `pelanggaran` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `verifikasi_data_prestasi_id_foreign` FOREIGN KEY (`prestasi_id`) REFERENCES `prestasi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `verifikasi_data_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
