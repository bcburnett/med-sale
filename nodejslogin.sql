-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 08, 2019 at 07:55 PM
-- Server version: 5.7.25-0ubuntu0.18.04.2
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodejslogin`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `privileges` json NOT NULL,
  `rank` varchar(11) NOT NULL,
  `infoGathered` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `userid`, `privileges`, `rank`, `infoGathered`) VALUES
(45, 23, '[\"read\", \"purchase\", \"comment\"]', 'user', 1),
(47, 25, '[\"read\", \"purchase\", \"comment\"]', 'vendor', 1),
(48, 26, '[\"read\", \"purchase\", \"comment\"]', 'user', 1),
(49, 27, '[\"read\", \"purchase\", \"comment\"]', 'user', 0),
(50, 28, '[\"read\", \"purchase\", \"comment\"]', 'user', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `customerNumber` int(11) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `contactLastName` varchar(50) NOT NULL,
  `contactFirstName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customerNumber`, `customerName`, `contactLastName`, `contactFirstName`, `email`, `phone`, `addressLine1`, `addressLine2`, `city`, `state`, `postalCode`) VALUES
(14, 23, 'brian', 'burnett', 'brian', 'bcburnett@gmail.com', '8605019828', '16 Benham Road', 'apt 2 first floor', 'Groton', 'CT', '06340'),
(15, 25, 'Patrick', 'santora', 'Patrick', 'Patrick.santora27@gmail.com', '8608572129', '175 Midway Oval', '-', 'Groton', 'CT', '06340'),
(16, 26, 'Patrick', 'santora', 'Patrick', 'Patrick.santora27@gmail.com', '8608572129', '175 Midway Oval', '-', 'Groton', 'CT', '06340'),
(17, 28, 'brian', 'burnett', 'brian', 'bcburnett@gmail.com', '8605019828', '16 Benham Road', 'apt 2 first floor', 'groton', 'CT', '06340');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderNumber` char(50) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(15) NOT NULL,
  `Product` varchar(50) DEFAULT NULL,
  `payment` json DEFAULT NULL,
  `keytext` varchar(255) NOT NULL,
  `customerNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderNumber`, `orderDate`, `status`, `Product`, `payment`, `keytext`, `customerNumber`) VALUES
(1, '474bc9e0-2bf2-11e9-8771-395a6b6d6abb', '2019-02-08 22:38:38', 'complete', 'med-line software key', '{\"id\": \"PAYID-LRPAJYQ8HR804176N1901334\", \"cart\": \"8V3506737T426511M\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPAJYQ8HR804176N1901334\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-08T22:38:38Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"17\", \"name\": \"med-line software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-line software key\", \"related_resources\": [{\"sale\": {\"id\": \"6T291835GC938612W\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/6T291835GC938612W\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/6T291835GC938612W/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPAJYQ8HR804176N1901334\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-08T22:38:38Z\", \"update_time\": \"2019-02-08T22:38:38Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRPAJYQ8HR804176N1901334\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 23),
(2, '597412d0-2bf2-11e9-8771-395a6b6d6abb', '2019-02-08 22:39:09', 'complete', 'med-tech software key', '{\"id\": \"PAYID-LRPAJ7Y176314010W1212358\", \"cart\": \"4FP64962LM5228028\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPAJ7Y176314010W1212358\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-08T22:39:09Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"9\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"7DW536277Y205903N\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/7DW536277Y205903N\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/7DW536277Y205903N/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPAJ7Y176314010W1212358\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-08T22:39:08Z\", \"update_time\": \"2019-02-08T22:39:08Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRPAJ7Y176314010W1212358\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}', '81dc-2c27d72d0f1e', 23),
(3, 'cb5276d0-2bf2-11e9-9fe3-dfc41f79e891', '2019-02-08 22:42:20', 'complete', 'med-tech software key', '{\"id\": \"PAYID-LRPALPQ15216289BA909735E\", \"cart\": \"9UL411615J546890T\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPALPQ15216289BA909735E\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-08T22:42:20Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"10\", \"name\": \"med-tech software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-tech software key\", \"related_resources\": [{\"sale\": {\"id\": \"1YX78135VU674291F\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/1YX78135VU674291F\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/1YX78135VU674291F/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPALPQ15216289BA909735E\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-08T22:42:19Z\", \"update_time\": \"2019-02-08T22:42:19Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRPALPQ15216289BA909735E\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 23),
(4, 'c94c7e90-2bfb-11e9-a91c-6fab3b4e36b5', '2019-02-08 23:46:42', 'complete', 'med-line software key', '{\"id\": \"PAYID-LRPBJKI80T04868PS682944W\", \"cart\": \"9PS48904170464004\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPBJKI80T04868PS682944W\", \"method\": \"GET\"}], \"payer\": {\"status\": \"VERIFIED\", \"payer_info\": {\"email\": \"bcburnett@gmail.com\", \"payer_id\": \"M7MY3RW647FGE\", \"last_name\": \"burnett\", \"first_name\": \"brian\", \"country_code\": \"US\", \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"payment_method\": \"paypal\"}, \"state\": \"approved\", \"intent\": \"sale\", \"create_time\": \"2019-02-08T23:46:42Z\", \"transactions\": [{\"payee\": {\"email\": \"bcburnett@email.com\", \"merchant_id\": \"R3VQZWKJ89FAL\"}, \"amount\": {\"total\": \"25.00\", \"details\": {}, \"currency\": \"USD\"}, \"item_list\": {\"items\": [{\"sku\": \"18\", \"name\": \"med-line software key\", \"price\": \"25.00\", \"currency\": \"USD\", \"quantity\": 1}], \"shipping_address\": {\"city\": \"San Jose\", \"line1\": \"1 Main St\", \"state\": \"CA\", \"postal_code\": \"95131\", \"country_code\": \"US\", \"recipient_name\": \"brian burnett\"}}, \"description\": \"med-line software key\", \"related_resources\": [{\"sale\": {\"id\": \"58T45938J71801900\", \"links\": [{\"rel\": \"self\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/58T45938J71801900\", \"method\": \"GET\"}, {\"rel\": \"refund\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/sale/58T45938J71801900/refund\", \"method\": \"POST\"}, {\"rel\": \"parent_payment\", \"href\": \"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-LRPBJKI80T04868PS682944W\", \"method\": \"GET\"}], \"state\": \"completed\", \"amount\": {\"total\": \"25.00\", \"details\": {\"subtotal\": \"25.00\"}, \"currency\": \"USD\"}, \"create_time\": \"2019-02-08T23:46:41Z\", \"update_time\": \"2019-02-08T23:46:41Z\", \"payment_mode\": \"INSTANT_TRANSFER\", \"parent_payment\": \"PAYID-LRPBJKI80T04868PS682944W\", \"transaction_fee\": {\"value\": \"1.03\", \"currency\": \"USD\"}, \"protection_eligibility\": \"ELIGIBLE\", \"protection_eligibility_type\": \"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\"}}]}], \"httpStatusCode\": 200}', '81dc-2c27d72d0f1e', 28);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productCode` int(11) NOT NULL,
  `productName` varchar(70) NOT NULL,
  `productKey` varchar(255) NOT NULL,
  `productVendor` int(11) NOT NULL,
  `productDescription` text NOT NULL,
  `buyPrice` decimal(10,2) NOT NULL,
  `salesOrder` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productCode`, `productName`, `productKey`, `productVendor`, `productDescription`, `buyPrice`, `salesOrder`) VALUES
(9, 'med-tech software key', '81dc-2c27d72d0f1e', 25, 'med-tech software key', '25.00', '597412d0-2bf2-11e9-8771-395a6b6d6abb'),
(10, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-tech software key', '25.00', 'cb5276d0-2bf2-11e9-9fe3-dfc41f79e891'),
(11, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81', 25, 'med-tech software key', '25.00', 'null'),
(12, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-tech software key', '25.00', 'null'),
(13, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-tech software key', '25.00', 'null'),
(14, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d727d72d0f1e72d0f1e81', 25, 'med-tech software key', '25.00', 'null'),
(15, 'med-tech software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-tech software key', '25.00', 'null'),
(16, 'med-tech software key', '81dc-2c27d72d0f1e', 25, 'med-tech software key', '25.00', 'null'),
(17, 'med-line software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-line software key', '25.00', '474bc9e0-2bf2-11e9-8771-395a6b6d6abb'),
(18, 'med-line software key', '81dc-2c27d72d0f1e', 25, 'med-line software key', '25.00', 'c94c7e90-2bfb-11e9-a91c-6fab3b4e36b5'),
(19, 'med-line software key', '81dc-2c27d72d0f1e81dc-2c27d72d0f1e72d0f1e81dc-2c27d7', 25, 'med-line software key', '50.00', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(23, 'brian', '$2a$10$cQaff7wHdIUYsqBNSXokdOIUjYZly22R595Q2.lR.anAGRzL9SneG'),
(25, 'bcburnett', '$2a$10$XX3swrCwf.s26LdBUChPwOOV/7gEhrLJqszHEpv4tbF9dqCVu1i3m'),
(26, 'someone', '$2a$10$arvxXPG7yuJpSFHZ8iru/OrVgJsx7fdhU7.WbGMRI3HiQqwqKae9i'),
(27, 'newlondo@newlondonweb.com', '$2a$10$djHNn2V4CdpvY70zVJumUeMyTkCR3fpGoZbqugNoJyeZDO7oPQfsm'),
(28, 'taz', '$2a$10$.cRUMFnX7HDHk4KDtZ1PseFUYg/P/vRIYMxXQfnZ9aZpOvOPzZXA.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attributes_ibfk_1` (`userid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_ibfk_1` (`customerNumber`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerNumber` (`customerNumber`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productCode`),
  ADD KEY `productVendor` (`productVendor`),
  ADD KEY `products_ibfk_2` (`salesOrder`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productCode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerNumber`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productVendor`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
