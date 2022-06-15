-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tokoamarjaya
CREATE DATABASE IF NOT EXISTS `tokoamarjaya` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tokoamarjaya`;

-- Dumping structure for table tokoamarjaya.barang
CREATE TABLE IF NOT EXISTS `barang` (
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(25) NOT NULL,
  `satuan` varchar(25) NOT NULL,
  `id_ktgr` int(11) DEFAULT NULL,
  `stok` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `idsuplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `FK_barang_kategori` (`id_ktgr`),
  KEY `FK_barang_suplier` (`idsuplier`),
  CONSTRAINT `FK_barang_kategori` FOREIGN KEY (`id_ktgr`) REFERENCES `kategori` (`id_kategori`) ON UPDATE CASCADE,
  CONSTRAINT `FK_barang_suplier` FOREIGN KEY (`idsuplier`) REFERENCES `suplier` (`id_suplier`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.barang: ~0 rows (approximately)
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.gaji_karyawan
CREATE TABLE IF NOT EXISTS `gaji_karyawan` (
  `no_penggajian` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `id_karyawan` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  `gaji` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_penggajian`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table tokoamarjaya.gaji_karyawan: ~0 rows (approximately)
/*!40000 ALTER TABLE `gaji_karyawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `gaji_karyawan` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.jabatan
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id_jabatan` int(7) NOT NULL,
  `jabatan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.jabatan: ~4 rows (approximately)
/*!40000 ALTER TABLE `jabatan` DISABLE KEYS */;
INSERT INTO `jabatan` (`id_jabatan`, `jabatan`) VALUES
	(1, 'Admin'),
	(2, 'Kasir'),
	(3, 'Stokker'),
	(4, 'HR');
/*!40000 ALTER TABLE `jabatan` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.karyawan
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_karyawan` varchar(50) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT 0,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` int(7) DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`),
  KEY `FK_karyawan_user` (`user`),
  KEY `FK_karyawan_jabatan` (`jabatan`),
  CONSTRAINT `FK_karyawan_jabatan` FOREIGN KEY (`jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_karyawan_user` FOREIGN KEY (`user`) REFERENCES `user` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.karyawan: ~2 rows (approximately)
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
INSERT INTO `karyawan` (`id_karyawan`, `user`, `nama`, `jabatan`, `agama`, `status`, `jenis_kelamin`, `alamat`) VALUES
	('11111', 1001, 'Putri Nurul Izza', NULL, 'Islam', 'belum menikah', 'perempuan', 'Lhokseumawe'),
	('11112', 1002, 'Rauzatul Jannah Fakma', NULL, 'Islam', 'belum menikah', 'perempuan', 'Puntet');
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int(11) NOT NULL DEFAULT 0,
  `nama_ktgr` varchar(10) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.kategori: ~1 rows (approximately)
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` (`id_kategori`, `nama_ktgr`) VALUES
	(1, 'makanan');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.pembelianbrg
CREATE TABLE IF NOT EXISTS `pembelianbrg` (
  `id_beli` int(11) NOT NULL,
  `id_barang` varchar(10) NOT NULL DEFAULT '0',
  `suplier` int(11) NOT NULL DEFAULT 0,
  `tgl_beli` date NOT NULL,
  `harga_satuan` int(6) NOT NULL DEFAULT 0,
  `jumlah_barang` int(4) NOT NULL DEFAULT 0,
  `total_harga` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_beli`),
  KEY `suplier` (`suplier`),
  KEY `barang` (`id_barang`),
  CONSTRAINT `FK_pembelianbrg_suplier` FOREIGN KEY (`suplier`) REFERENCES `suplier` (`id_suplier`) ON UPDATE CASCADE,
  CONSTRAINT `barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`kode_barang`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.pembelianbrg: ~0 rows (approximately)
/*!40000 ALTER TABLE `pembelianbrg` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembelianbrg` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.suplier
CREATE TABLE IF NOT EXISTS `suplier` (
  `id_suplier` int(11) NOT NULL DEFAULT 0,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telpon` varchar(12) NOT NULL,
  PRIMARY KEY (`id_suplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.suplier: ~1 rows (approximately)
/*!40000 ALTER TABLE `suplier` DISABLE KEYS */;
INSERT INTO `suplier` (`id_suplier`, `nama`, `alamat`, `telpon`) VALUES
	(12, 'll', 'gg', '005');
/*!40000 ALTER TABLE `suplier` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.transaksi
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` varchar(11) NOT NULL,
  `kasir` varchar(11) DEFAULT NULL,
  `tgl_transaksi` varchar(20) DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.transaksi: ~2 rows (approximately)
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` (`id_transaksi`, `kasir`, `tgl_transaksi`, `total_bayar`) VALUES
	('TR0001', 'Rauzatul', '09-06-2022', 476700),
	('TR0002', '', '15-06-2022', 254544);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.transaksi_rinci
CREATE TABLE IF NOT EXISTS `transaksi_rinci` (
  `id_transaksi` varchar(11) DEFAULT NULL,
  `kasir` varchar(30) DEFAULT NULL,
  `nama_barang` varchar(25) DEFAULT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  KEY `FK__transaksi` (`id_transaksi`),
  CONSTRAINT `FK__transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.transaksi_rinci: ~4 rows (approximately)
/*!40000 ALTER TABLE `transaksi_rinci` DISABLE KEYS */;
INSERT INTO `transaksi_rinci` (`id_transaksi`, `kasir`, `nama_barang`, `id_barang`, `qty`, `harga`, `total`) VALUES
	('TR0001', 'Rauzatul', 'gerry salut', '002', 12, 4000, 48000),
	('TR0001', 'Rauzatul', 'cimory', '004', 21, 6700, 140700),
	('TR0001', 'Rauzatul', 'samyang', '005', 12, 24000, 288000),
	('TR0002', '', 'sweat', '12', 12, 21212, 254544);
/*!40000 ALTER TABLE `transaksi_rinci` ENABLE KEYS */;

-- Dumping structure for table tokoamarjaya.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL DEFAULT 0,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `level` varchar(25) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table tokoamarjaya.user: ~5 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `username`, `password`, `level`) VALUES
	(1001, 'putri', 'admin123', 'Admin'),
	(1002, 'rauzatul', 'kasir123', 'Kasir'),
	(1003, 'tajul', 'stokker123', 'Stokker'),
	(1004, 'jihan', 'hr123', 'HR'),
	(1005, 'lala', 'owner123', 'Owner');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
