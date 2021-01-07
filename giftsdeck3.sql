-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2020 at 07:30 AM
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
  `Admin_Id` int(10) UNSIGNED NOT NULL,
  `Admin_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_Id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `Cart_Id` int(10) UNSIGNED NOT NULL,
  `User_Id` int(10) UNSIGNED NOT NULL,
  `Product_Id` int(10) UNSIGNED NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`Cart_Id`, `User_Id`, `Product_Id`, `Quantity`, `Price`, `Total`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 3, 190, 570, '2020-12-29 05:47:17', '2020-12-29 05:47:17'),
(2, 1, 1, 3, 15, 45, '2020-12-29 06:01:39', '2020-12-29 06:01:39');

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `Category_Id` int(10) UNSIGNED NOT NULL,
  `Category_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `City_Id` int(10) UNSIGNED NOT NULL,
  `City_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State_Id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `Feedback_Id` int(10) UNSIGNED NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_Id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2020_12_10_132508_create_admins_table', 1),
(18, '2020_12_10_132630_create_feedbacks_table', 1),
(19, '2020_12_10_132635_create_states_table', 1),
(20, '2020_12_10_132702_create_categorys_table', 1),
(21, '2020_12_10_140122_create_secret_ques_table', 1),
(22, '2020_12_10_140511_create_photos_table', 1),
(23, '2020_12_10_143002_create_sub-categorys_table', 1),
(24, '2020_12_10_143102_create_products_table', 1),
(25, '2020_12_10_152928_create_citys_table', 1),
(26, '2020_12_10_153234_create_users_table', 1),
(27, '2020_12_10_153534_create_carts_table', 1),
(28, '2020_12_10_153557_create_orders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_Id` int(10) UNSIGNED NOT NULL,
  `User_Id` int(10) UNSIGNED NOT NULL,
  `Product_Id` int(10) UNSIGNED NOT NULL,
  `Status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Order_Date` datetime NOT NULL,
  `Total` int(11) NOT NULL,
  `Transaction_Code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Shipping_Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Tax` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `Photo_Id` int(10) UNSIGNED NOT NULL,
  `Photo_Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Photo_Detail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Product_Id` int(10) UNSIGNED NOT NULL,
  `Product_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category_Id` int(10) UNSIGNED NOT NULL,
  `Sub-Category_Id` int(10) UNSIGNED NOT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `Offer` int(11) NOT NULL,
  `Total_Price` int(11) NOT NULL,
  `Image1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Product_Id`, `Product_Name`, `Category_Id`, `Sub-Category_Id`, `Description`, `Price`, `Offer`, `Total_Price`, `Image1`, `Image2`, `Image3`, `Quantity`) VALUES
(1, 'test', 2, 1, 'test', 20, 5, 15, 'nature-wallpaper-hd-1 - 1607610378863.jpg', 'unnamed - 1607610378930.jpg', 'Wild-Waters-Lodge-678x381 - 1607610378940.jpg', 4),
(2, 'test1', 2, 1, 'test', 200, 10, 190, '71WP-QZcAwL - 1608544674789.jpg', 'Amazing-Macro-Nature-HD-Wallpaper - 1608544674797.jpg', 'maxresdefault - 1608544674812.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `secret_ques`
--

CREATE TABLE `secret_ques` (
  `Secret_Id` int(10) UNSIGNED NOT NULL,
  `Secret_Que` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `secret_ques`
--

INSERT INTO `secret_ques` (`Secret_Id`, `Secret_Que`) VALUES
(1, 'What was your first pet?'),
(2, 'In what city were you born?'),
(3, 'What was your father\'s middle name?'),
(4, 'What was your childhood nickname?'),
(5, 'What is the name of your favorite childhood friend?');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `State_Id` int(10) UNSIGNED NOT NULL,
  `State_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `Subcategory_Id` int(10) UNSIGNED NOT NULL,
  `Subcategory_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Category_Id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `User_Id` int(10) UNSIGNED NOT NULL,
  `User_Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email_Id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Secret_Id` int(10) UNSIGNED NOT NULL,
  `Answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Contact_No` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City_Id` int(10) UNSIGNED NOT NULL,
  `State_Id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_Id`, `User_Name`, `Email_Id`, `password`, `Secret_Id`, `Answer`, `Address`, `Contact_No`, `City_Id`, `State_Id`, `created_at`, `updated_at`) VALUES
(1, 'vivekvr', 'vivekvr@gmail.com', '$2y$10$lusvSba3nPl8NZw4aPVB.eaxMDaNKrYeTY1yrs9JGB4pzQS0bvS4u', 1, 'fish', 'Jeevan Ganga Nagar', '7845120369', 2, 1, '2020-12-17 12:26:53', '2020-12-17 12:26:53');

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
  ADD PRIMARY KEY (`Cart_Id`),
  ADD KEY `carts_user_id_foreign` (`User_Id`),
  ADD KEY `carts_product_id_foreign` (`Product_Id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`Category_Id`);

--
-- Indexes for table `citys`
--
ALTER TABLE `citys`
  ADD PRIMARY KEY (`City_Id`),
  ADD KEY `citys_state_id_foreign` (`State_Id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`Feedback_Id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_Id`),
  ADD KEY `orders_user_id_foreign` (`User_Id`),
  ADD KEY `orders_product_id_foreign` (`Product_Id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`Photo_Id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`Product_Id`),
  ADD KEY `products_category_id_foreign` (`Category_Id`),
  ADD KEY `products_sub_category_id_foreign` (`Sub-Category_Id`);

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
  ADD PRIMARY KEY (`Subcategory_Id`),
  ADD KEY `sub_categorys_category_id_foreign` (`Category_Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_Id`),
  ADD UNIQUE KEY `users_user_name_unique` (`User_Name`),
  ADD KEY `users_city_id_foreign` (`City_Id`),
  ADD KEY `users_secret_id_foreign` (`Secret_Id`),
  ADD KEY `users_state_id_foreign` (`State_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `Admin_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `Cart_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `Category_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `citys`
--
ALTER TABLE `citys`
  MODIFY `City_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `Feedback_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `Photo_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `Product_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `secret_ques`
--
ALTER TABLE `secret_ques`
  MODIFY `Secret_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `State_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub-categorys`
--
ALTER TABLE `sub-categorys`
  MODIFY `Subcategory_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE;

--
-- Constraints for table `citys`
--
ALTER TABLE `citys`
  ADD CONSTRAINT `citys_state_id_foreign` FOREIGN KEY (`State_Id`) REFERENCES `states` (`State_Id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`Product_Id`) REFERENCES `products` (`Product_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`Category_Id`) REFERENCES `categorys` (`Category_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`Sub-Category_Id`) REFERENCES `sub-categorys` (`Subcategory_Id`) ON DELETE CASCADE;

--
-- Constraints for table `sub-categorys`
--
ALTER TABLE `sub-categorys`
  ADD CONSTRAINT `sub_categorys_category_id_foreign` FOREIGN KEY (`Category_Id`) REFERENCES `categorys` (`Category_Id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_id_foreign` FOREIGN KEY (`City_Id`) REFERENCES `citys` (`City_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_secret_id_foreign` FOREIGN KEY (`Secret_Id`) REFERENCES `secret_ques` (`Secret_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_state_id_foreign` FOREIGN KEY (`State_Id`) REFERENCES `states` (`State_Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
