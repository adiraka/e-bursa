/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.1.31-MariaDB : Database - dbbursa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `aktivasi` */

DROP TABLE IF EXISTS `aktivasi`;

CREATE TABLE `aktivasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_akun_id` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `aktivasi` */

insert  into `aktivasi`(`id`,`user_akun_id`,`token`,`status`) values (20,30,'d8f24be5044f434737a4d041c1ad6a',1);

/*Table structure for table `hak_akses` */

DROP TABLE IF EXISTS `hak_akses`;

CREATE TABLE `hak_akses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(10) NOT NULL,
  `nama_akses` varchar(20) NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `hak_akses` */

insert  into `hak_akses`(`id`,`slug`,`nama_akses`,`keterangan`,`dibuat_pada`) values (1,'admin','Administrator','-','2018-05-07'),(2,'pencaker','Pencari Kerja','-','2018-05-07'),(3,'perusahaan','Perusahaan','-','2018-05-07');

/*Table structure for table `info_berita` */

DROP TABLE IF EXISTS `info_berita`;

CREATE TABLE `info_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_admin_id` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `kategori` enum('Berita','Event','Info') NOT NULL,
  `konten` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_admin_id` (`profil_admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `info_berita` */

insert  into `info_berita`(`id`,`profil_admin_id`,`judul`,`tanggal`,`kategori`,`konten`,`status`) values (1,1,'Lorem Ipsum Dolor Sit Amet','2018-05-28','Berita','<p>Tattatata</p>\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\">\r\n<tbody>\r\n<tr>\r\n<td style=\"width: 33.3333%;\">asdasd</td>\r\n<td style=\"width: 33.3333%;\">&nbsp;</td>\r\n<td style=\"width: 33.3333%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 33.3333%;\">asd</td>\r\n<td style=\"width: 33.3333%;\">asd</td>\r\n<td style=\"width: 33.3333%;\">&nbsp;</td>\r\n</tr>\r\n<tr>\r\n<td style=\"width: 33.3333%;\">&nbsp;</td>\r\n<td style=\"width: 33.3333%;\">&nbsp;</td>\r\n<td style=\"width: 33.3333%;\">2</td>\r\n</tr>\r\n</tbody>\r\n</table>',1);

/*Table structure for table `lowongan` */

DROP TABLE IF EXISTS `lowongan`;

CREATE TABLE `lowongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_perusahaan_id` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `deskripsi_pekerjaan` text NOT NULL,
  `deskripsi_persyaratan` text NOT NULL,
  `gaji` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_perusahaan_id` (`profil_perusahaan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `lowongan` */

/*Table structure for table `pendidikan_formal` */

DROP TABLE IF EXISTS `pendidikan_formal`;

CREATE TABLE `pendidikan_formal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_pencaker_id` int(11) NOT NULL,
  `tingkat_pendidikan` enum('SD','SMP','SMA','SMK','D1','D3','S1','S2') NOT NULL,
  `nama_sekolah` varchar(50) NOT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `tahun_masuk` varchar(4) NOT NULL,
  `tahun_lulus` varchar(4) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_pencaker_id` (`profil_pencaker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pendidikan_formal` */

/*Table structure for table `pendidikan_nonformal` */

DROP TABLE IF EXISTS `pendidikan_nonformal`;

CREATE TABLE `pendidikan_nonformal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_pencaker_id` int(11) NOT NULL,
  `nama_kegiatan` varchar(100) NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `tempat_kegiatan` varchar(100) NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_pencaker_id` (`profil_pencaker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pendidikan_nonformal` */

/*Table structure for table `pengalaman_kerja` */

DROP TABLE IF EXISTS `pengalaman_kerja`;

CREATE TABLE `pengalaman_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_pencaker_id` int(11) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  `deskripsi_jabatan` text NOT NULL,
  `bidang_perusahaan` varchar(100) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profil_pencaker_id` (`profil_pencaker_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `pengalaman_kerja` */

/*Table structure for table `profil_admin` */

DROP TABLE IF EXISTS `profil_admin`;

CREATE TABLE `profil_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_akun_id` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `agama` enum('Islam','Katolik','Protestan','Hindu','Buddha','Lain-Lain') NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(12) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_akun_id` (`user_akun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `profil_admin` */

insert  into `profil_admin`(`id`,`user_akun_id`,`nip`,`nama`,`jenis_kelamin`,`tempat_lahir`,`tanggal_lahir`,`agama`,`alamat`,`telepon`,`foto`,`dibuat_pada`) values (1,1,'131400036','Adi Raka Siwi, S.Kom','Pria','Padang','1994-04-29','Islam','Komplek Filano Mandiri BLOK A1/1 Tabing','081268280648','8eaa1da94969e2e4a3eb.jpg','2018-05-12');

/*Table structure for table `profil_pencaker` */

DROP TABLE IF EXISTS `profil_pencaker`;

CREATE TABLE `profil_pencaker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_akun_id` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `agama` enum('Islam','Katolik','Protestan','Hindu','Buddha') DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(12) DEFAULT NULL,
  `quote` varchar(100) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_akun_id` (`user_akun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `profil_pencaker` */

insert  into `profil_pencaker`(`id`,`user_akun_id`,`nik`,`nama`,`jenis_kelamin`,`tempat_lahir`,`tanggal_lahir`,`agama`,`alamat`,`telepon`,`quote`,`email`,`photo`,`dibuat_pada`) values (4,30,'11221122222','Adi Raka Siwi','Pria',NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,'0000-00-00');

/*Table structure for table `profil_perusahaan` */

DROP TABLE IF EXISTS `profil_perusahaan`;

CREATE TABLE `profil_perusahaan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_akun_id` int(11) NOT NULL,
  `nama_perusahaan` varchar(50) NOT NULL,
  `no_siup` varchar(20) DEFAULT NULL,
  `no_situ` varchar(20) DEFAULT NULL,
  `bidang_usaha` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `deskripsi_perusahaan` text,
  `website` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo_perusahaan` varchar(100) DEFAULT NULL,
  `slogan` varchar(50) DEFAULT NULL,
  `tanggal_dibuat` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_akun_id` (`user_akun_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `profil_perusahaan` */

/*Table structure for table `user_akun` */

DROP TABLE IF EXISTS `user_akun`;

CREATE TABLE `user_akun` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hak_akses_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `aktivasi` tinyint(1) NOT NULL,
  `dibuat_pada` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `hak_akses_id` (`hak_akses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Data for the table `user_akun` */

insert  into `user_akun`(`id`,`hak_akses_id`,`username`,`password`,`status`,`aktivasi`,`dibuat_pada`) values (1,1,'admin','21232f297a57a5a743894a0e4a801fc3',1,1,'2018-05-11'),(2,2,'scrypto','21232f297a57a5a743894a0e4a801fc3',1,1,'2018-05-25'),(30,2,'zeddevil','0858dcffabb19cf27bcae1865f8530c5',1,1,'2018-06-05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;