-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 25, 2021 lúc 12:36 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `fts`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', '123', 'admin@gmail.com', 1),
(2, 'trainer', '123', 'trainer@gmail.com', 2),
(3, 'trainee', '1234', 'trainee@gmail.com', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'JAVA'),
(2, 'C#'),
(3, 'test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`id`, `name`) VALUES
(1, 'BH-AF-2005-2.1'),
(2, 'BHAF-1900-2.1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'trainer'),
(3, 'trainee');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `topic`
--

INSERT INTO `topic` (`id`, `name`, `cate_id`) VALUES
(1, 'FOR WHILE', 2),
(2, 'Design Pattern', 1),
(5, 'test', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topic_class`
--

CREATE TABLE `topic_class` (
  `topic_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `topic_class`
--

INSERT INTO `topic_class` (`topic_id`, `class_id`) VALUES
(2, 1),
(1, 2),
(1, 1),
(1, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topic_trainer`
--

CREATE TABLE `topic_trainer` (
  `trainer_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `topic_trainer`
--

INSERT INTO `topic_trainer` (`trainer_id`, `topic_id`) VALUES
(1, 2),
(2, 1),
(12346, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trainee`
--

CREATE TABLE `trainee` (
  `maSV` int(11) NOT NULL,
  `tenSV` varchar(50) NOT NULL,
  `diaChi` varchar(255) NOT NULL,
  `sdt` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `maLop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `trainee`
--

INSERT INTO `trainee` (`maSV`, `tenSV`, `diaChi`, `sdt`, `email`, `maLop`) VALUES
(1, 'admin', 'HN', 123, 'admin@gmail.com', 1),
(2, 'admin1', 'HN', 123, 'admin1@gmail.com', 2),
(3, 'testedit', 'Ha Noi', 382407247, 'bietdoichibi@gmail.com', 2),
(4, 'trainee', 'Ha Noi', 382407247, 'trainee@gmail.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trainer`
--

CREATE TABLE `trainer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sdt` int(11) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `trainer`
--

INSERT INTO `trainer` (`id`, `name`, `address`, `sdt`, `email`) VALUES
(1, 'quan', 'HN', 123, 'quan@gmail.com'),
(2, 'Bui Manh Quan', 'Ha Noi', 382407247, 'quanbmbhaf190013@fpt.edu.vn'),
(12346, 'parttime', 'hn', 1, 'trainer@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Chỉ mục cho bảng `topic_class`
--
ALTER TABLE `topic_class`
  ADD KEY `topic_id` (`topic_id`) USING BTREE,
  ADD KEY `class_Id` (`class_id`) USING BTREE;

--
-- Chỉ mục cho bảng `topic_trainer`
--
ALTER TABLE `topic_trainer`
  ADD KEY `account_ibfk_3` (`trainer_id`),
  ADD KEY `topic_id` (`topic_id`) USING BTREE;

--
-- Chỉ mục cho bảng `trainee`
--
ALTER TABLE `trainee`
  ADD PRIMARY KEY (`maSV`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `maLop` (`maLop`);

--
-- Chỉ mục cho bảng `trainer`
--
ALTER TABLE `trainer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `trainee`
--
ALTER TABLE `trainee`
  MODIFY `maSV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `trainer`
--
ALTER TABLE `trainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12347;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `topic_class`
--
ALTER TABLE `topic_class`
  ADD CONSTRAINT `class-topic` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  ADD CONSTRAINT `topic-class` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Các ràng buộc cho bảng `topic_trainer`
--
ALTER TABLE `topic_trainer`
  ADD CONSTRAINT `account_ibfk_3` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`),
  ADD CONSTRAINT `topic_trainer_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`),
  ADD CONSTRAINT `topic_trainer_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`id`);

--
-- Các ràng buộc cho bảng `trainee`
--
ALTER TABLE `trainee`
  ADD CONSTRAINT `trainee_ibfk_1` FOREIGN KEY (`maLop`) REFERENCES `class` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
