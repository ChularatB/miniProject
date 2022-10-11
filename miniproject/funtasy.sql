-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2022 at 05:58 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funtasy`
--

-- --------------------------------------------------------

--
-- Table structure for table `การบันทึกข้อมูล`
--

CREATE TABLE `การบันทึกข้อมูล` (
  `รหัสประเภททันตกรรม` char(2) NOT NULL,
  `รหัสใบนัด` char(5) NOT NULL,
  `รหัสคนไข้` char(4) NOT NULL,
  `สถานะการบันทึกข้อมูล` tinyint(1) NOT NULL,
  `วันที่ออกใบนัด` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `การบันทึกข้อมูล`
--

INSERT INTO `การบันทึกข้อมูล` (`รหัสประเภททันตกรรม`, `รหัสใบนัด`, `รหัสคนไข้`, `สถานะการบันทึกข้อมูล`, `วันที่ออกใบนัด`) VALUES
('TB', 'BD024', 'A002', 1, '2565-08-15'),
('TE', 'BD023', 'A001', 1, '2565-09-01'),
('TF', 'BD026', 'A004', 1, '2565-08-31'),
('TI', 'BD023', 'A005', 1, '2565-09-22'),
('TS', 'BD025', 'A003', 1, '2565-09-10');

-- --------------------------------------------------------

--
-- Table structure for table `การตรวจสอบ`
--

CREATE TABLE `การตรวจสอบ` (
  `รหัสทันตแพทย์` char(5) NOT NULL,
  `รหัสคนไข้` char(4) NOT NULL,
  `ชื่อผู้ช่วยทันตแพทย์` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `การตรวจสอบ`
--

INSERT INTO `การตรวจสอบ` (`รหัสทันตแพทย์`, `รหัสคนไข้`, `ชื่อผู้ช่วยทันตแพทย์`) VALUES
('EF459', 'A001', 'สมหญิง บุญมี'),
('EF259', 'A002', 'น้ำใส เสียงดี'),
('EF823', 'A003', 'สมหวัง  เงินหมด'),
('EF459', 'A004', 'สมหญิง บุญมี'),
('EF259', 'A005', 'น้ำใส เสียงดี');

-- --------------------------------------------------------

--
-- Table structure for table `คนไข้`
--

CREATE TABLE `คนไข้` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(8) NOT NULL,
  `รหัสบัตรประชาชนคนไข้` varchar(13) NOT NULL,
  `ชื่อ-สกุลคนไข้` varchar(50) NOT NULL,
  `วันเดือนปีเกิด` date NOT NULL,
  `เบอร์โทรคนไข้` varchar(13) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `คนไข้`
--

INSERT INTO `คนไข้` (`Username`, `Password`, `รหัสบัตรประชาชนคนไข้`, `ชื่อ-สกุลคนไข้`, `วันเดือนปีเกิด`, `เบอร์โทรคนไข้`, `Email`) VALUES
('kiangkai', 'kklogic1', '1106161554936', 'เกรียงไกร ทองคำ', '2546-07-06', '063-448-1036', 'kiangkai_kk@email.com'),
('rosa', 'rosiebp1', '1061213512601', 'โรซ่า แมคเคอเรลำ', '2544-11-08', '080-591-6554', 'rosa_blackpink@gmail.com'),
('suchat', 'sc12345', '1032555289130', 'สุชาติ คำโต', '2513-12-12', '0870116340', 'suchat123@email.com'),
('wantong', 'wt2jai', '1105691384308', 'วันทอง สอนใจ', '2525-10-25', '091-380-1579', 'wantong_456@email.com'),
('yingyong', 'yy00666', '1001361311249', 'ยิ่งยง ยั่งยืน', '2549-02-01', '088-153-4467', 'yingyong_3@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ตารางนัดทันตแพทย์`
--

CREATE TABLE `ตารางนัดทันตแพทย์` (
  `รหัสคนไข้` varchar(4) NOT NULL,
  `วันที่ทันตแพทย์เข้าเวร` text NOT NULL,
  `เวลาที่ทันตแพทย์เข้าเวร` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ตารางนัดทันตแพทย์`
--

INSERT INTO `ตารางนัดทันตแพทย์` (`รหัสคนไข้`, `วันที่ทันตแพทย์เข้าเวร`, `เวลาที่ทันตแพทย์เข้าเวร`) VALUES
('A001', '20/09/2022 - 30/09/2022', '13.30 - 20.00 น.'),
('A002', '15/09/2022 - 24/09/2022', '9.00 - 16.00  น.'),
('A003', '1/09/2022 - 28/09/2022', '12.00 - 18.00 น.'),
('A004', '20/09/2022 - 30/09/2022', '14.30 - 20.00 น.'),
('A005', '1/09/2022 - 28/09/2022', '12.00 - 18.00 น.');

-- --------------------------------------------------------

--
-- Table structure for table `ทันตแพทย์`
--

CREATE TABLE `ทันตแพทย์` (
  `รหัสทันตแพทย์` char(5) NOT NULL,
  `ชื่อ_สกุลทันตแพทย์` varchar(50) NOT NULL,
  `ด้านเฉพาะทาง` varchar(20) NOT NULL,
  `สังกัดโรงพยาบาล` varchar(20) NOT NULL,
  `เบอร์โทรศัพท์ทันตแพทย์` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ทันตแพทย์`
--

INSERT INTO `ทันตแพทย์` (`รหัสทันตแพทย์`, `ชื่อ_สกุลทันตแพทย์`, `ด้านเฉพาะทาง`, `สังกัดโรงพยาบาล`, `เบอร์โทรศัพท์ทันตแพทย์`) VALUES
('EF259', 'นพ.สมยุกต์  ไม่ไปไหน', 'ขูดหินปูน,รากเทียม', 'รพ.มิตรทุกคน', '064-999-9999'),
('EF459', 'พญ.ปอยอ เป็นใย', 'จัดฟัน', 'รพ.รักษาใจ', '098-888-8888'),
('EF823', 'พญ.บัวสี ดงใจ', 'อุดฟัน , ถอนฟัน', 'รพ.ประสานสัมพันธ์', '083-222-2222');

-- --------------------------------------------------------

--
-- Table structure for table `ประเภทการทำทันตกรรม`
--

CREATE TABLE `ประเภทการทำทันตกรรม` (
  `username` varchar(20) NOT NULL,
  `ถอนฟัน` tinyint(1) NOT NULL,
  `จัดฟัน` tinyint(1) NOT NULL,
  `ขูดหินปูน` tinyint(1) NOT NULL,
  `อุดฟัน` tinyint(1) NOT NULL,
  `รากเทียม` tinyint(1) NOT NULL,
  `รหัสประเภททันตกรรม` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ประเภทการทำทันตกรรม`
--

INSERT INTO `ประเภทการทำทันตกรรม` (`username`, `ถอนฟัน`, `จัดฟัน`, `ขูดหินปูน`, `อุดฟัน`, `รากเทียม`, `รหัสประเภททันตกรรม`) VALUES
('kiangkai', 0, 0, 1, 0, 0, 'TF'),
('rosa', 0, 1, 0, 0, 0, 'TI'),
('suchat', 0, 0, 0, 0, 1, 'TE'),
('wantong', 1, 0, 0, 0, 0, 'TS'),
('yingyong', 0, 0, 0, 1, 0, 'TB');

-- --------------------------------------------------------

--
-- Table structure for table `ใบนัด`
--

CREATE TABLE `ใบนัด` (
  `รหัสใบนัด` varchar(5) NOT NULL,
  `วันที่นัด` date NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ใบนัด`
--

INSERT INTO `ใบนัด` (`รหัสใบนัด`, `วันที่นัด`, `username`) VALUES
('BD023', '2565-09-19', 'suchat'),
('BD024', '2565-09-13', 'yingyong'),
('BD025', '2565-09-20', 'wantong'),
('BD026', '2565-09-30', 'kiangkai'),
('BD027', '2565-09-02', 'rosa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `การบันทึกข้อมูล`
--
ALTER TABLE `การบันทึกข้อมูล`
  ADD PRIMARY KEY (`รหัสประเภททันตกรรม`);

--
-- Indexes for table `การตรวจสอบ`
--
ALTER TABLE `การตรวจสอบ`
  ADD PRIMARY KEY (`รหัสคนไข้`);

--
-- Indexes for table `คนไข้`
--
ALTER TABLE `คนไข้`
  ADD PRIMARY KEY (`Username`);

--
-- Indexes for table `ตารางนัดทันตแพทย์`
--
ALTER TABLE `ตารางนัดทันตแพทย์`
  ADD PRIMARY KEY (`รหัสคนไข้`);

--
-- Indexes for table `ทันตแพทย์`
--
ALTER TABLE `ทันตแพทย์`
  ADD PRIMARY KEY (`รหัสทันตแพทย์`);

--
-- Indexes for table `ประเภทการทำทันตกรรม`
--
ALTER TABLE `ประเภทการทำทันตกรรม`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `ใบนัด`
--
ALTER TABLE `ใบนัด`
  ADD PRIMARY KEY (`รหัสใบนัด`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
