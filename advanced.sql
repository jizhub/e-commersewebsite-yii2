-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2023 at 08:26 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advanced`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(2) NOT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `product_id`, `quantity`, `created_by`) VALUES
(2, 4, 4, 1),
(3, 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1684986198),
('m130524_201442_init', 1684986202),
('m190124_110200_add_verification_token_column_to_user_table', 1684986202),
('m201124_064118_create_products_table', 1684988713),
('m201124_064518_create_user_addresses_table', 1684988713),
('m201124_064907_create_orders_table', 1684988713),
('m201124_065209_create_order_items_table', 1684988713),
('m201124_065518_create_order_addresses_table', 1684988713),
('m201124_066009_create_cart_items_table', 1684988714),
('m201212_081304_add_firstname_lastname_columns_to_user_table', 1684988714),
('m201217_061032_add_paypal_order_id_column_to_orders_table', 1684988714),
('m201226_063616_add_admin_column_to_user_table', 1684988714),
('m201226_071858_change_product_id_foreign_key_on_order_item_table', 1684988714);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `paypal_order_id` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_addresses`
--

CREATE TABLE `order_addresses` (
  `order_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(2000) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 'Apple Watch Ultra', '<p>Apple has now been making its Watch series for a good few years, most of which have followed roughly the same formula. The Apple Watch Ultra takes all of the good bits of previous designs, and piles as much as possible on top.</p>\r\n\r\n<p>While the result is a smartwatch that is by no means cheap, it has also resulted in the perfect device for athletes of all practices. Apple has kept divers, climbers, tennis players, martial artists and everyone in-between in mind.</p>\r\n\r\n<p>It is durable, water-resistant up to 100 metres, can deal with extreme low and high temperatures, has an impressive 36 hour battery life, and has detailed apps to track your fitness and health.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '/products/khHeUR9knSCi23X5k8ALr3Rt1lJ0SZIQ/Apple-Watch-Ultra-4930130.webp', '12650.00', 1, 1685016015, 1685016015, 2, 2),
(5, 'Garmin Instict Crossover', '<p>Garmin&rsquo;s new Instinct Crossover Solar fits a niche group of people who seem to be exercising every second of the day. It doesn&rsquo;t really matter what your chosen sport is, the never-ending menus on this watch will have a mode for you. It tracks everything from running power, to heart rate, effective recovery time, and even how smoothly you descended a mountain bike trail.</p>\r\n\r\n<p>When you eventually stop running, it can track your sleep and stress, and to fit even more exercise into your life, it uses solar power to stay on for an estimated 70 days without a charge.</p>\r\n', '/products/IYhw5PU7PFWrD4NaqoSHUtCl9xRffnXy/garmin-132bab8.webp', '5600.00', 1, 1685016077, 1685016077, 2, 2),
(6, 'Google Pixel 7', '<p>There are&nbsp;<em>a lot</em>&nbsp;of smartphones out there, but realistically Apple and Samsung steal most of the limelight. With its two latest devices, Google has managed to join those top two, offering a pair of serious contenders in the Google Pixel 7 and 7 Pro.</p>\r\n\r\n<p>In most of the obvious ways, these are great devices, dealing out solid battery performance, a strong processor, bright and colourful display, and even one of the best cameras we&#39;ve used.</p>\r\n\r\n<p>But in our&nbsp;<a href=\"https://www.sciencefocus.com/reviews/google-pixel-7-pro-review/\">Google Pixel 7 Pro review</a>, it was the device&#39;s software that we were most impressed by. Able to translate voice notes to text, cut photo-bombers out of your pictures, and even screen calls so you can see if it is spam or not, the device offers a huge variety of ways to make your phone experience better.</p>\r\n', '/products/ELAIIG3RErqwt-jtrXCaXlCI4x3fshlo/Google-Pixel-7-3eb37f3-e1671460331950.webp', '67000.00', 1, 1685016122, 1685016140, 2, 2),
(7, 'iRobot Roomba J7+', '<p>iRobot, not to be confused with the 2004 Will Smith classic, is the leading creator of robot vacuums with the Roomba range. Getting smarter each year, the new Roomba J7+ combines both vacuum and mop in one machine. This itself isn&rsquo;t new, but the company has introduced a new self-retracting mop feature.</p>\r\n\r\n<p>The mop lifts out of the way when it approaches carpet, only using the mop in the places you want it. In theory, this means a robot vacuum that can be fully independent and doesn&rsquo;t need to be assisted&hellip; so this is how the robot uprising starts?</p>\r\n', '/products/XDCiwCjVD1E29nbRTDnaDma7SWU-KKuU/iRobot Roomba J7+.webp', '23400.00', 1, 1685016246, 1685016246, 2, 2),
(8, 'Meta Quest Pro', '<p>Ah yes, the metaverse - the supposed future of our digital world. While this new virtual land hasn&#39;t exactly begun successfully, many tech leaders are still very much of the view that we&#39;ll soon be plugged in, enjoying our own digital house, job and life.</p>\r\n\r\n<p>If you want to get in now and enjoy the metaverse and virtual reality, the Meta Quest Pro 2 will likely be the best way to do this. Meta, previously known as Facebook, has poured money into this to offer the latest and most impressive specs available in the world of VR.</p>\r\n\r\n<p>With all of its fancy new features and functions, comes a massive price tag of &pound;1,499. It&#39;s the best VR can be right now, but the investment is only worthwhile for those who can&#39;t wait for the metaverse.</p>\r\n', '/products/vpSGPX6xy91HRBmVDdVJzivthAvG0OWQ/Meta-Quest-32f5cdf.webp', '17500.00', 1, 1685016330, 1685016330, 2, 2),
(9, 'Nothing Ear (Stick)', '<p>Making interesting earbuds can be a challenge. Most look, feel and act the same these days, so something a bit different is always a pleasure.</p>\r\n\r\n<p>Nothing is a brand known for innovation, trying to make products slightly different to the competition. With the Stick, it&#39;s the charging case that adds some variety. The case is a long tube that can easily fit in your pocket. The case twists open to reveal the headphones inside.</p>\r\n\r\n<p>Along with looking slightly different to competitors, these are good sounding headphones, offering a solid battery life and comfortable fit.</p>\r\n', '/products/j6o3MIryfG3uqKZSbK-e__jBkLGRVQd-/Nothing-Stick-edit-cfc087c.webp', '34222.00', 1, 1685016417, 1685016417, 2, 2),
(10, 'Apple Airpods Gen 2', '<p>For Apple fans, Airpods are likely the obvious choice for a new pair of in-ear headphones. If you are looking for the latest and best option, it will be the new Apple Airpods Pro 2nd generation.</p>\r\n\r\n<p>While they don&#39;t come cheap, they offer Apple&#39;s best active noise cancellation outside of the incredibly pricey AirPods Max, as well as upping the battery life to get you 6 hours on a single charge.</p>\r\n\r\n<p>The most important upgrade here is the new H2 chip. This aids the noise cancellation and allows the headphones to adapt songs to offer rich bass and clean high notes in real time.</p>\r\n', '/products/dTcO7AhEpfrc-dxBo0TbH44z8BBO0xtM/Apple-Airpods-gen-2-5172e60.webp', '43000.00', 1, 1685016462, 1685016462, 2, 2),
(11, 'Samsung Galaxy Fold 4', '<p>While everyone else quickly abandoned the idea, Samsung has been making real waves in the world of folding smartphones. Now on the fourth edition, the Samsung Galaxy Z Fold 4 is the most impressive folding smartphone to date.</p>\r\n\r\n<p>It is water-resistant, has been tested to fold and close up to 200,000 times, and despite the hinge, this features one of Samsung&#39;s best displays. Whether you want to use it in tablet form, or in its cover screen, both look sleek and feel responsive with a 120Hz refresh display.</p>\r\n\r\n<p>While its the best foldable device out there, that technology carries a hefty price tag.</p>\r\n', NULL, '21000.00', 1, 1685016527, 1685016527, 2, 2),
(12, 'DJI Osmo Mobile 6', '<p>When it comes to camera equipment, DJI has spread itself across the whole industry making a load of action cameras, drones and accessories. One of their latest devices is the DJI Osmo Mobile 6, a gimbal that you can use with your smartphone.</p>\r\n\r\n<p>This will balance out your movement when you are filming, allowing you to take smooth video even when you are running, driving or otherwise throwing yourself about.</p>\r\n\r\n<p>Through the use of DJI&#39;s ActiveTrack 5.0 software, you can track a subject smoothly, keeping them in frame, even when they are moving about.</p>\r\n\r\n<p>The gimbal also includes a host of buttons for zooming, cinematic blurs and other similar effects.</p>\r\n', '/products/dT9tK8x9BEsXXyN9KiTQxy8rPg8JjMJC/dji-osmo-mobile-6-1663872273-95387d0.webp', '35460.00', 1, 1685016577, 1685016577, 2, 2),
(13, 'Amazon Kindle Scribe', '<p>Amazon has come a long way since its first Kindle device, but a feature that they have been slow to take up is the stylus. Now, with the Kindle Scribe, you can scribble notes on the book you are reading, make handwritten notes, and generally get more out of your Kindle.</p>\r\n\r\n<p>The device also features one of Kindle&#39;s best displays, meaning you can continue to read in bright lighting. There is also a warm light setting for when you want to wind down and get ready for bed.</p>\r\n', '/products/GNg-_2PKYOis83rdnXKR-byA1Zv2b-9Y/Amazon-Kindle-Scribe-2847059.webp', '76000.00', 1, 1685016633, 1685016633, 2, 2),
(14, 'Nothing Phone 1', '<p>The brand Nothing (best known for headphones so far) has had the world of tech enthusiasts patiently waiting for the reveal of their new smartphone. They promised something a little bit different, and they delivered on that.</p>\r\n\r\n<p>The back of the device is transparent, allowing you to see the inner-workings of the device. On top of that, it features a number of LED lights that the company has called &#39;Glyphs&#39;.</p>\r\n', '/products/foeKrwUbrQI982aBlcxyJUaJXIy03GPJ/Nothing-phone-3541ab6-e1657786703693.webp', '74600.00', 0, 1685016681, 1685016681, 2, 2),
(15, 'HyperX Cloud Alpha', '<p>The HyperX Cloud Alpha are a pair of gaming headphones that offer one thing above all: a fantastic battery life. HyperX claims that these headphones offer 300 hours of battery life. That means you can use these headphones for just over 12 days straight without a charge, although we would really recommend a break in there somewhere!</p>\r\n\r\n<p>Other than how long they&#39;ll last, these headphones also feature a powerful crisp sound and a truly excellent microphone quality.</p>\r\n', '/products/gQ8aKarRbmGH8JkSZuI0zE4YOmTPPPGB/71-hkFn17zL.ACSL1428-cefe0d2-e1657789155467.webp', '12500.00', 1, 1685016720, 1685016720, 2, 2),
(16, 'MacBook Pro with M2 chip', '<p>Does Apple&#39;s new MacBook Pro reinvent the wheel? No. Does it feature ground-breaking new features and a revolutionary design...? Also no. What Apple&#39;s new MacBook Pro does is ramp up specs and improve on an already popular design.</p>\r\n\r\n<p>It continues to feature the touch bar (very much a love or hate feature), it offers more RAM allocation, the charging is faster and the Pro now features Spatial Audio.</p>\r\n\r\n<p>However, the biggest change here is the processor, now featuring Apple&#39;s M2 processor chip. This makes the 2022 MacBook Pro an incredibly powerful computer. Finally, we have an Apple laptop that can keep up with gaming alongside the demands of professional editing and creative software.</p>\r\n', '/products/tXBmFEIlIGKf5xcTLZFfzjPNem7k9Ft8/mbp-spacegray-select-202206-d982bf1.webp', '98000.00', 1, 1685016791, 1685016791, 2, 2),
(17, 'DJI Mini 3 Pro', '<p>Every year, DJI&rsquo;s Mini series gets smaller and yet more powerful, cramming high-end specs into a lightweight drone that you can chuck in your bag.</p>\r\n\r\n<p>But with all those improvements, comes an eye-watering price, and an increasing fear for your financial status if you crash it. It offers advanced obstacle avoidance features, a rotating lens so you can film portrait or landscape, 4K video, smart flying features like automatic tracking and the ability to follow a subject.</p>\r\n\r\n<p>Despite its higher price, this feels like the perfect drone for beginners, those who like to travel, or really anyone in the market for a light-weight, high tech drone.</p>\r\n', '/products/XijSixkdKa6cC5cwIE8z9G5D6c_Qa41i/9421412f8e83278b37b538744a0913b0ultra-01e0e5e-e1655112987410.webp', '31200.00', 1, 1685016844, 1685016844, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `admin` tinyint(1) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `admin`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'Jiezel', 'Camlian', 'camlianjiezel', 'znOGzzTwojstqrIfbG39-wOdYiZ-PnAt', '$2y$13$5djzF5okiFzWzIPrkW3wFejetNB2nooleJbrb6ggu.ESa9yl2m706', NULL, 'camlianjiezel@gmail.com', 10, 0, 1684986210, 1685071530, 's6qF8K9Vg7jgLgEFOpEGjiOBCp-Os4-G_1684986210'),
(2, 'Jiezel', 'Camlian', 'camlianj', 'qewrX_pkwfAUsMqyY87rtRbjy38Y4lCM', '$2y$13$Pl2hFsIoqgQgqPsRTsQc..ULHVg/mX9AV.KJWEGPjHDY.ksG7SnT6', NULL, 'camlianj@gmail.com', 10, 0, 1685000718, 1685000764, 'iomhPdxK8gK8oyQlrvsm68v_QCtBnmUc_1685000718');

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `address`, `city`, `state`, `country`, `zipcode`) VALUES
(1, 1, 'Kauswagan', 'asd', 'asdas', 'asdas', 'asdashhhhh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-cart_items-product_id` (`product_id`),
  ADD KEY `idx-cart_items-created_by` (`created_by`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-orders-created_by` (`created_by`);

--
-- Indexes for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx-order_addresses-order_id` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-order_items-product_id` (`product_id`),
  ADD KEY `idx-order_items-order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-products-created_by` (`created_by`),
  ADD KEY `idx-products-updated_by` (`updated_by`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-user_addresses-user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `fk-cart_items-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-cart_items-product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk-orders-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_addresses`
--
ALTER TABLE `order_addresses`
  ADD CONSTRAINT `fk-order_addresses-order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk-order_items-order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk-products-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-products-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `fk-user_addresses-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
