-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2020 at 08:29 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystuff`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_admin` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `role` varchar(1) NOT NULL,
  `pertanyaan_rahasia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_admin`, `password`, `nama_admin`, `role`, `pertanyaan_rahasia`) VALUES
('ADMU01', 'ADMU111', 'Ardi', '1', 'SDN 1 REJOSARI'),
('ADMU02', 'admu', 'Bagas ', '1', 'SD N 1 REJOSARI'),
('ADPB01', 'ADPB222', 'Suci', '2', 'Kursi'),
('ADPJ01', 'ganteng', 'Sueb Sureeb', '3', 'Jonggol'),
('ADPJ03', 'ADPJ333', 'Anto', '3', 'Wisata Alam'),
('cnz7890@gmail.com', '12345', 'Jaka', '2', 'Kampung Baru');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(6) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `stok` int(3) NOT NULL,
  `harga` int(7) NOT NULL,
  `harga_rata` int(7) DEFAULT NULL,
  `jenis_barang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `harga`, `harga_rata`, `jenis_barang`) VALUES
('CHT003', 'Chitato Ayam Kampung 400 gr', 21, 12000, 11560, 'makanan'),
('MIN002', 'Fanta Orange 350Ml', 51, 5000, 3000, 'minuman'),
('MIN003', 'Sprite 150Ml', 20, 5000, 4500, 'minuman'),
('MIN004', 'Coca-Cola 350Ml', 50, 7500, 5000, 'minuman'),
('MIN005', 'Mizone Rasa Jeruk', 20, 6500, 6750, 'minuman'),
('MKN002', 'Lays Original Flavour 350gr', 51, 12000, 10000, 'makanan'),
('MKN003', 'Chitato Sapi Panggang 350gr', 35, 11000, 9000, 'makanan'),
('MKN005', 'Lays Original 500gr', 10, 15000, 13000, 'makanan'),
('MKN009', 'Qtela Barbeque 350gr', 15, 10000, 8900, 'makanan'),
('mkn010', 'Chiki Taro', 20, 11000, 10500, 'makanan'),
('PLP001', 'Pulpy Orange 350ml', 49, 6500, 6350, 'minuman'),
('RKK001', 'Gudang Garam 16 Batang', 90, 21000, 19800, 'Rokok'),
('RKK002', 'Sampurna Mild Filter 16Btg', 30, 20000, 19800, 'Rokok'),
('RKK003', 'Class Mild 16Btg', 25, 21000, 20000, 'Rokok'),
('RKK004', 'Rawit Kretek 16 Batang', 20, 13000, 12500, 'rokok');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_pembelian`
--

CREATE TABLE `transaksi_pembelian` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_barang` char(6) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah_stok` int(3) NOT NULL,
  `harga` int(7) DEFAULT NULL,
  `id_admin` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_penjualan`
--

CREATE TABLE `transaksi_penjualan` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_admin` char(6) NOT NULL,
  `id_barang` char(6) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `jumlah_stok` int(3) NOT NULL,
  `harga` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `transaksi_penjualan`
--
ALTER TABLE `transaksi_penjualan`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_admin` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_penjualan`
--
ALTER TABLE `transaksi_penjualan`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi_pembelian`
--
ALTER TABLE `transaksi_pembelian`
  ADD CONSTRAINT `transaksi_pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_pembelian_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `akun` (`id_admin`);

--
-- Constraints for table `transaksi_penjualan`
--
ALTER TABLE `transaksi_penjualan`
  ADD CONSTRAINT `transaksi_penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_penjualan_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `akun` (`id_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
