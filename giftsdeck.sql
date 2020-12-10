-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 03:27 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giftsdeck`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `Admin_Id` int(11) NOT NULL,
  `Admin_Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email_Id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`Admin_Id`, `Admin_Name`, `Password`, `Email_Id`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `Cart_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `Category_Id` int(11) NOT NULL,
  `Category_Name` varchar(50) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`Category_Id`, `Category_Name`, `Description`) VALUES
(1, 'Home Decor', 'All types of Home Decor Material.'),
(2, 'Cards', 'all types of cards');

-- --------------------------------------------------------

--
-- Table structure for table `citys`
--

CREATE TABLE `citys` (
  `City_Id` int(11) NOT NULL,
  `City_Name` varchar(50) NOT NULL,
  `State_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citys`
--

INSERT INTO `citys` (`City_Id`, `City_Name`, `State_Id`) VALUES
(1, 'Ahmedabad', 1),
(2, 'Surat', 1),
(3, 'Vadodara', 1),
(4, 'Rajkot', 1),
(5, 'Mumbai', 2),
(6, 'Pune', 2),
(7, 'Nagpur', 2),
(8, 'Nashik', 2),
(9, 'Kolhapur', 2),
(10, 'Jaipur', 3),
(11, 'Jodhpur', 3),
(12, 'Kota', 3);

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `Feedback_Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email_Id` varchar(50) NOT NULL,
  `Message` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Order_Date` datetime NOT NULL DEFAULT current_timestamp(),
  `Total` int(11) NOT NULL,
  `Transaction_Code` varchar(50) NOT NULL,
  `Shipping_Address` varchar(250) NOT NULL,
  `Tax` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `Photo_Id` int(11) NOT NULL,
  `Photo_Title` varchar(50) NOT NULL,
  `Photo_Detail` varchar(50) NOT NULL,
  `Image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(200) NOT NULL,
  `Category_Id` int(11) NOT NULL,
  `Sub-Category_Id` int(11) NOT NULL,
  `Description` varchar(1500) NOT NULL,
  `Price` int(11) NOT NULL,
  `Offer` int(11) NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `Image1` varchar(150) NOT NULL,
  `Image2` varchar(150) NOT NULL,
  `Image3` varchar(150) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_Id`, `Product_Name`, `Category_Id`, `Sub-Category_Id`, `Description`, `Price`, `Offer`, `Total_Price`, `Image1`, `Image2`, `Image3`, `Quantity`) VALUES
(1, 'test', 2, 1, 'test', 20, 5, 15, 'nature-wallpaper-hd-1 - 1607610378863.jpg', 'unnamed - 1607610378930.jpg', 'Wild-Waters-Lodge-678x381 - 1607610378940.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `secret_ques`
--

CREATE TABLE `secret_ques` (
  `Secret_Id` int(11) NOT NULL,
  `Secret_Que` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `State_Id` int(11) NOT NULL,
  `State_Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`State_Id`, `State_Name`) VALUES
(1, 'Gujarat'),
(2, 'Maharashtra'),
(3, 'Rajasthan');

-- --------------------------------------------------------

--
-- Table structure for table `sub-categorys`
--

CREATE TABLE `sub-categorys` (
  `Subcategory_Id` int(11) NOT NULL,
  `Subcategory_Name` varchar(50) NOT NULL,
  `Category_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub-categorys`
--

INSERT INTO `sub-categorys` (`Subcategory_Id`, `Subcategory_Name`, `Category_Id`) VALUES
(1, 'Wedding Card', 2),
(2, 'Birthday Card', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_Id` int(11) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email_Id` varchar(50) NOT NULL,
  `Secret_Id` int(11) NOT NULL,
  `Answer` varchar(50) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Contact_No` int(11) NOT NULL,
  `City_Id` int(11) NOT NULL,
  `State_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`Admin_Id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`Cart_Id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`Category_Id`);

--
-- Indexes for table `citys`
--
ALTER TABLE `citys`
  ADD PRIMARY KEY (`City_Id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`Feedback_Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_Id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`Photo_Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_Id`);

--
-- Indexes for table `secret_ques`
--
ALTER TABLE `secret_ques`
  ADD PRIMARY KEY (`Secret_Id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`State_Id`);

--
-- Indexes for table `sub-categorys`
--
ALTER TABLE `sub-categorys`
  ADD PRIMARY KEY (`Subcategory_Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Admin_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `Cart_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `Category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `citys`
--
ALTER TABLE `citys`
  MODIFY `City_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `Feedback_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `Photo_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Product_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `secret_ques`
--
ALTER TABLE `secret_ques`
  MODIFY `Secret_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `State_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub-categorys`
--
ALTER TABLE `sub-categorys`
  MODIFY `Subcategory_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
