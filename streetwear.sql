-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 03:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `streetwear`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `isCreated` date NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isUpdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` varchar(36) NOT NULL,
  `user_1` varchar(36) NOT NULL,
  `user_2` varchar(36) NOT NULL,
  `text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliverdetails`
--

CREATE TABLE `deliverdetails` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `cart_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zipCode` varchar(255) NOT NULL,
  `paymentMethod` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `rating` int(5) NOT NULL,
  `isCreated` date NOT NULL,
  `isUpdated` date NOT NULL,
  `isDeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `product_id`, `user_id`, `message`, `rating`, `isCreated`, `isUpdated`, `isDeleted`) VALUES
('4a824cec-e138-48a9-aaf2-20a01c9690c4', '2d374187-1456-49b9-aa53-f0aa315a62c1', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'Hello world, please accept me', 1, '2024-10-27', '0000-00-00', 1),
('805b37e4-da74-49aa-8baf-f5dc5b8d351b', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'Thank you seller', 5, '2024-11-14', '0000-00-00', 1),
('c544a309-593f-41d2-8879-83fe74f48cc2', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'It is nice and durable!', 5, '2024-11-12', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `checkoutSessionId` varchar(255) NOT NULL,
  `paymentIntentId` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `price` int(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `isCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isApproved` tinyint(1) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isCostumerDeleted` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uid`, `pid`, `checkoutSessionId`, `paymentIntentId`, `uname`, `pname`, `price`, `size`, `quantity`, `location`, `isCreated`, `isApproved`, `isDeleted`, `isCostumerDeleted`, `status`) VALUES
('0031d2eb-e485-4361-a687-08dfff6093a5', '27c0d479-a8e6-4c55-8a31-6723edf14cf2', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Kurt', 'Short', 100, 'S', 3, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-12-08 14:36:02', 0, 0, 0, 0),
('00d932b3-712b-40be-b1b5-6cc3015b8615', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:54:56', 0, 0, 1, 0),
('0438d6b5-706e-49b8-9ad9-0792f6986266', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '00e7b4b7-ea1a-4e23-a4bf-2051cfbee268', 'cs_DpnJfbqbK1zSjGmHh32NMu9m', 'pi_nUQnWJz9WQjcr4GhTzjahtu2', 'Clifford', 'short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 12:35:14', 1, 1, 0, 0),
('2b938603-544d-46a0-9d54-503d1b819c87', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:19', 0, 0, 1, 0),
('36c75331-e991-4e95-925a-005a3a273672', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'f89dc6f5-fb7c-4c12-ae7a-c728bb7858bd', '', '', 'Clifford', 'short', 100, 'M', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 07:03:04', 0, 0, 1, 0),
('40c15b8f-8286-499e-8ddf-874dc582cd1c', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', '', '', 'Clifford', 'Gym Shorts', 100, 'M', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-13 06:22:47', 0, 0, 1, 0),
('4405ed5e-2015-43cc-8a2e-b884ee981ebd', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:20', 0, 0, 1, 0),
('4b133abe-46bd-4132-b1c7-23339eaf1411', 'd166c564-f7d5-4dbf-8d9e-aaefa9df5a4a', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', '', '', 'judepaul', 'Gym Shorts', 100, 'L', 3, ', , ', '2024-11-26 02:00:49', 1, 1, 0, 0),
('5f0501fd-1d7c-4a47-b29c-4986e04a2c88', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'M', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:21', 0, 0, 1, 0),
('7af1dec6-9ca9-49b4-a3dd-9639cc81029d', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:08', 0, 0, 1, 0),
('8461f91d-c564-4840-99c0-73d669d7d2f9', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:10', 0, 0, 1, 0),
('84848fa8-ae46-44f7-aa88-03dd3d40d165', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 3, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:54:50', 0, 0, 1, 0),
('92b81228-9984-4cb6-b348-3d69a100cd5c', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 3, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:54:48', 0, 0, 1, 0),
('97ecb1b1-e396-4628-9a10-f3ac7e915d5b', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', '', '', 'Clifford', 'Gym Shorts', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-13 06:22:49', 0, 0, 1, 0),
('9ad80174-d99a-49fe-b9e6-d548fa83c99e', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:16', 0, 0, 1, 0),
('a00cae53-ba7f-4117-81f0-afef98eddfd1', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', '', '', 'Clifford', 'Gym Shorts', 100, 'S', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 07:02:28', 1, 1, 1, 1),
('a9a9f040-839f-41f5-90bb-fdaa7b8c813b', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:13', 0, 0, 1, 0),
('b2c340a3-69b8-439b-bbb3-9d0496b1ddba', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:15', 0, 0, 1, 0),
('b64764b3-90a8-4bc2-8107-21636114bc12', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:54:53', 0, 0, 1, 0),
('bfb4d34a-8f82-4771-992f-82a52d4d530d', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', 'cs_r6Kqryu4n1poNnQmQv4iBQw8', 'pi_AVq3uivQVuWNDEfDEhMciGQo', 'Clifford', 'Short', 100, 'M', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:24', 0, 0, 1, 0),
('c4acc421-b918-493b-b149-a8d0792f8ead', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 2, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:54:55', 0, 0, 1, 0),
('c66644f7-03ee-450f-be50-ecb7d93b4ebb', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:12', 0, 0, 1, 0),
('c747419c-d6c0-4ce1-ae69-596f7136bcf4', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'f89dc6f5-fb7c-4c12-ae7a-c728bb7858bd', '', '', 'Clifford', 'short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 12:35:16', 0, 1, 0, 0),
('cd726c62-9ae5-4ffd-8fa6-2a21d9f03c8e', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '5cf35045-dec1-4caa-9cb5-6140854149f9', 'cs_rBa3cAHD9x3h7o2Ey7b7Wbg2', 'pi_kvSp6atVq5zZuEzgobJe7jgY', 'Clifford', 'Short', 100, 'M', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:01', 0, 0, 1, 0),
('d527e49e-146b-41ea-91a4-54ed5fed9e73', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'f89dc6f5-fb7c-4c12-ae7a-c728bb7858bd', '', '', 'Clifford', 'short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 07:03:01', 0, 0, 1, 0),
('d53605b2-7bf0-4e67-a9da-356746a75a16', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'ede94ea8-cf69-430b-972b-b962d3c55e87', '', '', 'Clifford', 'Short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-27 09:55:06', 0, 0, 1, 0),
('e2a05cb3-285c-4993-88e6-5e28e8251c66', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'f89dc6f5-fb7c-4c12-ae7a-c728bb7858bd', '', '', 'Clifford', 'short', 100, 'S', 1, 'Sitio Hikasig, Marigondon, Lapu-Lapu, Cebu', '2024-11-26 07:02:58', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(255) NOT NULL,
  `otpnum` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `expirationTimestamp` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `otpnum`, `email`, `expirationTimestamp`) VALUES
(182, 387743, 'c.iyac123@gmail.com', 2024),
(183, 962637, 'c.iyac123@gmail.com', 2024),
(184, 694274, 'c.iyac123@gmail.com', 2024),
(185, 809005, 'c.iyac123@gmail.com', 2024),
(186, 813934, 'c.iyac123@gmail.com', 2024),
(187, 558531, 'seller@gmail.com', 2024),
(188, 464303, 'seller@gmail.com', 2024),
(189, 401934, 'seller@gmail.com', 2024),
(190, 120226, 'boced33224@gianes.com', 2024),
(191, 177564, 'admin@gmail.com', 2024),
(192, 171477, 'c.iyac123@gmail.com', 2024),
(193, 847302, 'judepaulaguilar@gmail.com', 2024),
(194, 351509, 'judepaulaguilar@gmail.com', 2024),
(195, 161374, 'judepaulaguilar@gmail.com', 2024),
(196, 192631, 'inspectus838@gmail.com', 2024),
(197, 750377, 'judepaulaguilar@gmail.com', 2024),
(198, 148354, 'admin@gmail.com', 2024),
(199, 534698, 'secih72261@nozamas.com', 2024),
(200, 201182, 'fexovo2976@kazvi.com', 2024),
(201, 422504, 'markangeloujamandre@gmail.com', 2024);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` varchar(255) NOT NULL,
  `costumerFeedback_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `size_id` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `seller_id` varchar(36) NOT NULL,
  `isCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isUpdated` timestamp NOT NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL,
  `isApproved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `costumerFeedback_id`, `name`, `size_id`, `images`, `seller_id`, `isCreated`, `isUpdated`, `isDeleted`, `isApproved`) VALUES
('222bbba8-91fa-470c-963c-cae3618f24cd', 'da67af02-ce25-46d1-b314-0f81f5f3be1b', 'Men\'s Apparel', 'bc612fd7-14eb-4485-b64d-a119abdaa73f', '945650175.jpg', '57abc971-63e3-48e6-bef5-df3d93ad9fc3', '2024-12-08 12:49:19', '2024-12-08 12:48:34', 0, 1),
('5a187cd6-e91a-4201-b491-ad648736ed91', '43720e1d-311d-4b6d-95a6-94ad9ea57c06', 'Men\'s Apparel 2', '1a59df8b-b832-4ac8-9efc-aed6dcf1fc3d', '742031817.jpg,658998885.jpg', '57abc971-63e3-48e6-bef5-df3d93ad9fc3', '2024-12-08 13:26:42', '2024-12-08 13:26:14', 0, 1),
('71d09cf4-8f5e-4af9-9aac-03d9290151db', 'bf56d2af-6b8e-4eb7-86a7-e72dd77bb231', 'Anime Lover', 'c44bc4ff-7603-4381-becc-31a72e74aadf', '272274771.jpg', '57abc971-63e3-48e6-bef5-df3d93ad9fc3', '2024-12-08 12:49:22', '2024-12-08 12:49:04', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isUpdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productsizes`
--

CREATE TABLE `productsizes` (
  `id` varchar(36) NOT NULL,
  `small` int(255) NOT NULL,
  `medium` int(255) NOT NULL,
  `large` int(255) NOT NULL,
  `x_large` int(255) NOT NULL,
  `price` int(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `stockOut` int(255) NOT NULL,
  `isCreated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productsizes`
--

INSERT INTO `productsizes` (`id`, `small`, `medium`, `large`, `x_large`, `price`, `category`, `stockOut`, `isCreated`, `isDeleted`) VALUES
('1a59df8b-b832-4ac8-9efc-aed6dcf1fc3d', 12, 12, 12, 12, 300, 'tshirt', 0, '2024-12-08 13:26:14', 0),
('59ad2343-a7a7-4863-83ad-e5df651294bf', 100, 100, 100, 100, 100, 'shorts', 0, '2024-11-23 01:49:31', 0),
('5a75133a-d380-43e8-bea1-4833b2fd761c', 100, 100, 100, 100, 100, 'shorts', 0, '2024-11-26 02:01:42', 0),
('759c63d8-bfe2-4727-9013-0d732d5060cd', 10, 10, 10, 10, 100, 'shorts', 0, '2024-11-26 06:27:04', 0),
('bc612fd7-14eb-4485-b64d-a119abdaa73f', 12, 12, 12, 12, 100, 'tshirt', 0, '2024-12-08 12:48:34', 0),
('c00d459f-85a7-433f-b881-1302d88ac543', 12, 12, 12, 0, 100, 'tshirt', 0, '2024-12-08 12:28:58', 0),
('c44bc4ff-7603-4381-becc-31a72e74aadf', 12, 12, 12, 12, 2000, 'tshirt', 0, '2024-12-08 13:23:17', 0),
('c6350971-47ad-4b93-879e-483a57128588', 12, 12, 12, 12, 100, 'shorts', 0, '2024-12-08 12:04:58', 0),
('ede94ea8-cf69-430b-972b-b962d3c55e87', 124, 99, 100, 100, 100, 'shorts', 0, '2024-11-27 09:55:24', 0),
('f89dc6f5-fb7c-4c12-ae7a-c728bb7858bd', 101, 101, 100, 100, 100, 'shorts', 0, '2024-11-26 07:31:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` varchar(200) NOT NULL,
  `pid` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `isCreated` timestamp NOT NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `pid`, `uid`, `message`, `images`, `isCreated`, `isDeleted`) VALUES
('0093a976-cb89-4f98-bc95-e04b81767522', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'boss bati kaayu', '420081635.png,149034957.png,848650525.png,61333768.png,234012476.png', '2024-11-19 06:32:34', 1),
('e934961d-9a21-4b56-b445-434ea09416ef', 'e2c9bdf6-3913-40de-9269-fcfbad8ce902', 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'boss bati kaayu nga products', '413693630.png,339275868.png,413125198.png,351607131.png,759500616.png', '2024-11-19 07:42:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sellerinfo`
--

CREATE TABLE `sellerinfo` (
  `id` varchar(255) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(1) NOT NULL,
  `isApproved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellerinfo`
--

INSERT INTO `sellerinfo` (`id`, `sid`, `name`, `email`, `street`, `city`, `province`, `createdAt`, `isDeleted`, `isApproved`) VALUES
('[value-1]', '57abc971-63e3-48e6-bef5-df3d93ad9fc3', '[value-3]', '[value-4]', '[value-5]', '[value-6]', '[value-7]', '2024-11-04 17:05:17', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `role` varchar(6) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isCreated` date NOT NULL,
  `isUpdated` date NOT NULL,
  `order_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `role`, `image`, `name`, `password`, `email`, `birthdate`, `isDeleted`, `isCreated`, `isUpdated`, `order_id`) VALUES
('27c0d479-a8e6-4c55-8a31-6723edf14cf2', 'buyer', '', 'Kurt', '$2a$10$Z5NVa0Bi7FvDrdO4ld6TAuOLwhhahlv5xPZL9kvUCZRkj0DedUpzi', 'markangeloujamandre@gmail.com', '2001-01-30', 0, '2024-12-08', '0000-00-00', '27c0d479-a8e6-4c55-8a31-6723edf14cf2'),
('57abc971-63e3-48e6-bef5-df3d93ad9fc3', 'seller', '', 'seller', '$2a$10$wXr2QQuyrUCFVFv.YPc7nOJa8osLPj.EMnt9tW6qStRfMEUQEjEiC', 'seller@gmail.com', '2001-11-16', 0, '2024-10-27', '0000-00-00', '57abc971-63e3-48e6-bef5-df3d93ad9fc3'),
('60ec8c88-e0af-4c4f-b9a8-946ed143f786', 'seller', '', 'Seller', '$2a$10$xQ7sq5shi/YDwHcJhgachOF8x4fkvJk/hj6kRlWqJgkDNpZN5TGni', 'secih72261@nozamas.com', '2000-07-14', 1, '2024-11-26', '0000-00-00', '60ec8c88-e0af-4c4f-b9a8-946ed143f786'),
('773b062b-1d25-499b-8956-033a126d4441', 'admin', '', 'admin', '$2a$10$Z5NVa0Bi7FvDrdO4ld6TAuOLwhhahlv5xPZL9kvUCZRkj0DedUpzi', 'admin@gmail.com', '2001-11-16', 0, '2024-10-27', '0000-00-00', '773b062b-1d25-499b-8956-033a126d4441'),
('7b1da830-ad9c-417d-8894-3e0065ac0069', 'seller', '', 'jude', '$2a$10$dif14d4o8aTWSxxEQMvWa.IWtDTD3zHxt4M49szdZ9hYWWKUAnmZq', 'fexovo2976@kazvi.com', '2003-12-11', 1, '2024-11-26', '0000-00-00', '7b1da830-ad9c-417d-8894-3e0065ac0069'),
('8f729204-d4b2-4ab7-8e44-fee8b13888a7', 'buyer', '', '12345678', '$2a$10$TBkDa.p5wWZ3Mvs0A7x1VuMQD6Kq8wqkJSIQxa8JkzTwZEWXXw4zy', 'c@yahoo.com', '2001-11-30', 1, '2024-11-01', '0000-00-00', '8f729204-d4b2-4ab7-8e44-fee8b13888a7'),
('988a9991-578e-48ba-a487-a8515fc31621', 'buyer', '', 'Lenni', '$2a$10$qf2u.roOsLakV3yGqJtsiOCsooRw5PNkg17a4dzohPG5SnK/z9JMa', 'ma.elenatampus31@gmail.com', '2002-05-31', 0, '2024-11-02', '0000-00-00', '988a9991-578e-48ba-a487-a8515fc31621'),
('d0b09592-ec4a-4429-8002-e1de365b6c59', 'buyer', '', 'clifford iyac', '$2a$10$CB8sRLPV83I0vN/5UhFspuyt77KT.NqzieTZgY39bV6KBbQQ3txeG', 'c.iyac123@gmail.com', '2001-11-16', 0, '2024-10-27', '0000-00-00', 'd0b09592-ec4a-4429-8002-e1de365b6c59'),
('d166c564-f7d5-4dbf-8d9e-aaefa9df5a4a', 'buyer', '', 'judepaul', '$2a$10$iBbca8OcphxkT4dldfn9Je5liWZc7uAbqugZLDaAJ6yAWzDlbr9Li', 'judepaulaguilar@gmail.com', '2000-05-02', 0, '2024-11-16', '0000-00-00', 'd166c564-f7d5-4dbf-8d9e-aaefa9df5a4a'),
('f1cc194a-5181-4fe6-9bc7-ae62372d727b', 'seller', '', 'boced', '$2a$10$BVj4r.fYpE.BtTIPS5EQGOZsyi6FENoCOne12bZzsZwjZZn1C0rDK', 'boced33224@gianes.com', '2001-11-01', 1, '2024-11-11', '0000-00-00', 'f1cc194a-5181-4fe6-9bc7-ae62372d727b');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpnum` int(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `createdAt` date NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isApproved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `uid`, `fullname`, `email`, `cpnum`, `gender`, `street`, `city`, `province`, `createdAt`, `isDeleted`, `isApproved`) VALUES
(3, '57abc971-63e3-48e6-bef5-df3d93ad9fc3', 'seller', 'seller@gmail.com', 2147483647, 'male', 'Sitio Hikasig, Marigondon', 'Lapu-Lapu', 'Cebu', '2024-10-27', 0, 0),
(4, '773b062b-1d25-499b-8956-033a126d4441', 'seller', 'seller123@gmail.com', 0, '', '', '', '', '2024-10-27', 0, 0),
(6, 'd0b09592-ec4a-4429-8002-e1de365b6c59', 'Clifford', 'c.iyac@gmail.com', 2147483647, 'male', 'Sitio Hikasig, Marigondon', 'Lapu-Lapu', 'Cebu', '2024-11-01', 0, 0),
(7, '988a9991-578e-48ba-a487-a8515fc31621', 'Lenni', 'ma.elenatampus31@gmail.com', 0, '', '', '', '', '2024-11-02', 0, 0),
(8, 'f1cc194a-5181-4fe6-9bc7-ae62372d727b', 'The Shirt Master', 'boced33224@gianes.com', 2147483647, 'male', 'Sitio Hikasig, Marigondon', 'Lapu-Lapu', 'Cebu', '2024-11-11', 0, 0),
(9, 'd166c564-f7d5-4dbf-8d9e-aaefa9df5a4a', 'judepaul', 'judepaulaguilar@gmail.com', 0, '', '', '', '', '2024-11-16', 0, 0),
(10, '60ec8c88-e0af-4c4f-b9a8-946ed143f786', 'Seller', 'secih72261@nozamas.com', 0, '', '', '', '', '2024-11-26', 0, 0),
(11, '7b1da830-ad9c-417d-8894-3e0065ac0069', 'jude paul', 'fexovo2976@kazvi.com', 912345678, 'female', 'marigondon', 'lapu lapu', 'cebu', '2024-11-26', 0, 0),
(12, '27c0d479-a8e6-4c55-8a31-6723edf14cf2', 'Kurt', 'markangeloujamandre@gmail.com', 0, '', '', '', '', '2024-12-08', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userprofile`
--

CREATE TABLE `userprofile` (
  `id` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  `isUpdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofile`
--

INSERT INTO `userprofile` (`id`, `uid`, `image`, `isDeleted`, `isUpdated`) VALUES
('072f359a-1373-41d0-af9f-5477ce369acb', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '97982862.jpg', 0, '0000-00-00 00:00:00'),
('204a1505-03fd-42bb-8c1f-3408e3137d48', 'f1cc194a-5181-4fe6-9bc7-ae62372d727b', '891648615.jpg', 0, '0000-00-00 00:00:00'),
('7e835cf5-e6aa-46a8-abcb-892155c96a92', '7b1da830-ad9c-417d-8894-3e0065ac0069', '847178233.jpg', 0, '0000-00-00 00:00:00'),
('b19fa6e1-2daf-42fc-9c76-ec2bef5fb3d6', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '406046988.jpg', 0, '0000-00-00 00:00:00'),
('b7db3c6f-4f1f-411e-9baa-71a5669cb054', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '226116813.jpg', 0, '0000-00-00 00:00:00'),
('d75b4cd6-2a65-4b4d-bb48-fc4ec4798d84', 'd0b09592-ec4a-4429-8002-e1de365b6c59', '491304631.jpg', 0, '0000-00-00 00:00:00'),
('e940bfc5-191b-4248-b3e1-4961171df6f1', '27c0d479-a8e6-4c55-8a31-6723edf14cf2', '714538221.webp', 0, '0000-00-00 00:00:00'),
('fa498698-388e-4c5d-ae81-11eb8ccc634c', '57abc971-63e3-48e6-bef5-df3d93ad9fc3', '514871519.png', 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverdetails`
--
ALTER TABLE `deliverdetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `cart_id` (`cart_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `costumerFeedbakc_id` (`costumerFeedback_id`),
  ADD KEY `costumerFeedback_id` (`costumerFeedback_id`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productsizes`
--
ALTER TABLE `productsizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellerinfo`
--
ALTER TABLE `sellerinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
