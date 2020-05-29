-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 02:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_updated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2020-05-29 11:04:13',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enquiries`
--

CREATE TABLE `enquiries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_solved` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 => Solved or 0 => Unsolved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiries`
--

INSERT INTO `enquiries` (`id`, `unique_id`, `user_id`, `title`, `name`, `type`, `email`, `phone`, `description`, `status`, `is_solved`, `created_at`, `updated_at`) VALUES
(1, '036f2d2e-50d8-4c58-80cb-e35315d626e1', 4, 'Modi officia amet voluptas culpa minima corporis quis.', 'Miss Estella Brakus I', 2, 'alexane.ankunding@bednar.com', '204.700.0495', 'Impedit voluptas qui voluptate ut pariatur accusantium ipsum. Earum repellendus natus voluptas ut quis quo. Fugit voluptatem et doloremque vero hic. Facilis voluptatem blanditiis quisquam et quod.', 1, 1, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(2, '615843e1-6c66-4e2b-b1d8-bdbd7c1863bf', 4, 'Voluptatem esse consequuntur labore.', 'Miss Estella Brakus I', 4, 'alvina74@waelchi.net', '832-310-1976 x3988', 'Ea et dolorem nulla totam blanditiis inventore. Et iste culpa laborum enim minus. Blanditiis sed ut blanditiis aperiam quasi eligendi aut. Non a occaecati cupiditate soluta.', 1, 1, '2020-05-29 01:08:26', '2020-05-29 01:40:36'),
(3, 'ed29bc63-0a25-42d1-bd0b-fa54a549c62d', 4, 'Rerum officiis natus minus eius quod.', 'Miss Estella Brakus I', 1, 'itzel.krajcik@yahoo.com', '938-377-3035 x5990', 'Cupiditate dolores accusantium ut iure. Impedit eligendi sed quis sapiente non odit amet aspernatur. Architecto fuga id suscipit saepe perferendis dolores neque.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(4, '52033742-ac41-42a0-8f88-cc8267dd8007', 4, 'Architecto et et repudiandae voluptatem tempora reprehenderit velit.', 'Miss Estella Brakus I', 1, 'jacobson.malachi@simonis.com', '(945) 650-4021 x96793', 'Odit possimus atque voluptatem eligendi itaque cupiditate. Voluptates quis minus aut quam hic voluptates voluptates eos.', 1, 1, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(5, '0b0b0c1d-c4b1-474a-9b58-409b0ab5cf3b', 4, 'Distinctio at et maxime harum ut.', 'Miss Estella Brakus I', 2, 'wilderman.jackie@carter.com', '(261) 743-3237', 'Voluptatem porro voluptatem magni hic. Et maiores est quos voluptates ut hic nostrum. Vel alias fugiat et. Sed nihil esse sunt.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(6, '883d545a-e9ea-4824-8af6-643ab54a04b0', 4, 'Aliquid sapiente nemo alias repellendus et natus ut commodi.', 'Miss Estella Brakus I', 2, 'hand.constance@stokes.info', '536-485-8170 x42481', 'Tempore necessitatibus molestias et amet aspernatur. Nostrum ducimus quod deleniti animi et et. Et est natus autem eligendi dicta.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(7, '04846e52-56e0-40c1-9951-ff794840a14d', 4, 'Rerum voluptas illo aut molestias odio.', 'Miss Estella Brakus I', 3, 'keeling.sim@gmail.com', '1-861-296-3673', 'Nihil ipsa iure dolorem totam enim. Earum error ratione molestiae quam qui rerum. Sunt id aspernatur unde aut asperiores dolor laudantium laboriosam.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(8, 'd1203fed-377d-48ca-a728-cb6a57f20de2', 5, 'Voluptatibus cumque adipisci eos et eveniet et.', 'Wilford Walker', 2, 'upton.eda@roob.com', '1-691-461-6077', 'Minus ut praesentium dolor aliquid rerum. Ut et id sapiente tenetur. Ullam velit illo rerum eum quia.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:36:25'),
(9, '5cc677b8-fffe-49d0-ab4b-7ae65564bce1', 5, 'Qui id eius qui aut numquam dolorem.', 'Wilford Walker', 4, 'johathan32@wuckert.com', '+1 (819) 637-4830', 'Dolores dignissimos fugit error eaque quam et autem expedita. Pariatur sint vitae doloremque sed magni. Et eius repellat eum ipsum illum architecto tempore.', 1, 1, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(10, 'd630192b-88f4-4b56-aba3-ff584c78a937', 5, 'A et sit cupiditate inventore non alias dolores.', 'Wilford Walker', 4, 'ashlee.mueller@haag.com', '(285) 740-3569 x47373', 'Aut eligendi ut ipsum rem quo. Sint ad molestiae eius totam doloremque ex. Voluptatem sint molestias quasi saepe ut suscipit quidem. Repudiandae aliquam nostrum sint inventore dignissimos facere dicta.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(11, '3d4424ce-ce89-4ba6-9b65-51e35fa27214', 5, 'Iusto assumenda porro dolor qui sit vel.', 'Wilford Walker', 4, 'joesph60@koelpin.net', '(549) 906-1478 x693', 'Quos eum dolorum rerum quos voluptas aperiam. Qui nostrum officia sunt iste eos quasi atque. Consequatur veritatis quasi molestias consequatur.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(12, 'b709e23b-ff5e-4e0d-ba74-230202739f22', 5, 'Recusandae facilis quibusdam adipisci odit omnis.', 'Wilford Walker', 3, 'grimes.bernadette@christiansen.com', '720.772.7452', 'Quam incidunt non eius in. Facere dolores omnis aut voluptatem veritatis non. Minima aut aliquam non nemo quo recusandae. Reiciendis nesciunt quas animi veniam.', 1, 1, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(13, '9185e9d4-3a6e-4f7f-8228-b45ddc6ba93a', 5, 'Eos quas similique enim aliquam dicta animi veritatis.', 'Wilford Walker', 2, 'stella.hagenes@volkman.org', '1-551-300-6338 x72550', 'Ea aut sit eos est. Rem officia nemo eveniet omnis aperiam. Doloremque adipisci architecto est qui doloremque vero earum cum. Quis consequatur eligendi voluptatibus iusto et et placeat non.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(14, 'cf485742-f035-4789-b83a-4efc47d2eaa8', 5, 'Est sunt ipsa facilis rem hic consequatur non.', 'Wilford Walker', 4, 'cassandre.ruecker@buckridge.com', '1-578-347-2353', 'Omnis sed maiores aut ut et earum accusamus. Odit sit rem quos excepturi dolorum autem recusandae. Omnis occaecati qui ea aliquid possimus enim dolor. Odit odio dolores qui. Ut dolores et quae quisquam et ab fugit.', 1, 0, '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(15, '9a66ed78-c7a6-4104-87e9-8e02035274f8', 6, 'Iste libero non quaerat voluptas enim consequatur.', 'Dr. Toni Bins III', 1, 'carroll.harber@moen.com', '930-458-3804 x184', 'Odit adipisci nihil velit ut error voluptatibus facilis. Voluptas nobis qui sed officiis nemo in et. Quia facilis est ipsam veniam. Aut in est sint. Numquam tempora aspernatur repellat itaque dolorum qui et.', 1, 0, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(16, 'e763ce7a-b93a-4679-817b-ceec1b8d0e66', 6, 'Non quaerat quidem tempore vero aut.', 'Dr. Toni Bins III', 4, 'dario79@runte.com', '(342) 467-7869 x96671', 'Perferendis in expedita et. Enim quia suscipit ullam. Eum et voluptatum dolore aut commodi quibusdam et.', 1, 1, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(17, '653262f9-0218-4db7-8e2e-f1d407296079', 6, 'Omnis est sint placeat eos eum voluptatem dignissimos.', 'Dr. Toni Bins III', 2, 'troy.witting@yahoo.com', '+1-970-622-5370', 'Fugiat id in ut autem voluptatum. Eligendi deserunt tenetur id iusto voluptatem ipsa consequatur. Voluptate iusto laudantium officiis voluptate debitis maxime cum. Laudantium magnam libero ipsum quidem beatae sit.', 1, 0, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(18, '279dec8a-77d3-4546-95cc-e3019d037dbc', 6, 'Ipsum illum blanditiis ex dolor aut nemo.', 'Dr. Toni Bins III', 3, 'bennie44@hotmail.com', '(361) 553-4022', 'Voluptas est excepturi excepturi ipsum et quisquam autem. Mollitia in distinctio et excepturi. Autem minima exercitationem et deserunt odit consectetur. Velit id totam quo et repellendus quidem. Aut modi animi sed.', 1, 1, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(19, 'e7ddfa2e-a40d-4aa6-8311-35f561e0a557', 6, 'Modi quia quia aut molestiae molestias sit.', 'Dr. Toni Bins III', 3, 'ppadberg@miller.info', '307.460.3267', 'Vel blanditiis laboriosam cumque maxime qui. Maxime eos odit non quisquam adipisci sint. Non tempora non esse dignissimos consequatur totam possimus. Doloribus accusamus facere voluptatem saepe repellendus repudiandae atque.', 1, 0, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(20, 'cfd9ea1e-c431-40a9-9d6f-3f6704cf67ed', 6, 'Qui totam et autem sunt repudiandae.', 'Dr. Toni Bins III', 3, 'isidro39@hotmail.com', '1-408-685-7431', 'Error dolor et voluptatum assumenda reiciendis eaque. Aut rerum mollitia beatae quibusdam. Quibusdam nulla qui ullam est omnis delectus est. Iusto nesciunt quis aut.', 1, 1, '2020-05-29 01:08:27', '2020-05-29 01:08:27'),
(21, 'c291562f-e5a5-484d-843e-2cac79c6b5bc', 6, 'Laboriosam incidunt optio laboriosam.', 'Dr. Toni Bins III', 4, 'ethan.yost@gmail.com', '1-397-288-9971', 'Quis et consequatur amet. Ea itaque omnis nulla accusantium ad ut. Praesentium illo in quaerat dignissimos rerum et placeat officiis.', 1, 0, '2020-05-29 01:08:27', '2020-05-29 01:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_types`
--

CREATE TABLE `enquiry_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enquiry_types`
--

INSERT INTO `enquiry_types` (`id`, `name`) VALUES
(1, 'Product Enquiry'),
(2, 'Livestock Enquiry'),
(3, 'Warranty'),
(4, 'Others');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_04_02_022549_create_contacts_table', 1),
(6, '2020_04_17_051034_create_roles_table', 1),
(7, '2020_04_17_051315_create_role_user_table', 1),
(8, '2020_05_21_130240_create_enquiries_table', 1),
(9, '2020_05_21_130303_create_enquiry_types_table', 1),
(10, '2020_05_27_092914_add_is_solved_column_enquiries_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'api_token', '497dc642f8eba3c5088203530c1a1b54996d4b0d61ffca8af1e207eb61234306', '[\"*\"]', '2020-05-29 01:37:32', '2020-05-29 01:09:40', '2020-05-29 01:37:32'),
(2, 'App\\User', 1, 'api_token', '4cb128adcf61ad04981ee05c0f868e011c4380063de53852db28abad9c40280e', '[\"*\"]', '2020-05-29 01:41:23', '2020-05-29 01:37:31', '2020-05-29 01:41:23'),
(3, 'App\\User', 7, 'api_token', 'cc7e7204cf45ce61d4854367e4125e3ce64787f60ccb48fce2121e64c887588d', '[\"*\"]', '2020-05-29 02:19:40', '2020-05-29 02:19:32', '2020-05-29 02:19:40');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'user', '2020-05-29 01:08:25', '2020-05-29 01:08:25'),
(2, 'admin', '2020-05-29 01:08:25', '2020-05-29 01:08:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 2),
(2, 1),
(2, 3),
(1, 4),
(1, 5),
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jon-Ross', 'jrmoffett1@gmail.com', '2020-05-29 01:08:24', '$2y$10$BTqWzQmKXLGiy.F7kqtZ.eqTrSgOOdMOuFgHu.Ts/eITsXaaz6eZu', 'gUbbGDFTYNlR8ziJpYffouCRjfvRxvDB', 'ied3S3C3BLkREIaUyfHwJYzbvmbm7aqENXprOo4EQks4tTbL4ys8yhlSjwqW', '2020-05-29 01:08:24', '2020-05-29 01:08:24'),
(2, 'user', 'user@gmail.com', '2020-05-29 01:08:24', '$2y$10$q0FR30F3tc4eUXUKK/.WZuTAqXy04UTjcgghdbX.wjYeBvazogDBe', 'Js3lrgy2oswVXHgHdamq70aaYv3IUxLP', NULL, '2020-05-29 01:08:24', '2020-05-29 01:08:24'),
(3, 'Nia Doyle', 'admin@streamview.com', '2020-05-29 01:08:24', '$2y$10$q0FR30F3tc4eUXUKK/.WZuTAqXy04UTjcgghdbX.wjYeBvazogDBe', 'Q2BW5ls44oUMoHXl8tQ9y09jMQl27fhG', 'HCuKZJ8Eq4WLsNj6Y3MlcINFQTI0LOvWyr76irt9LtI57IS68nlzM0rzkqni', '2020-05-29 01:08:24', '2020-05-29 01:08:24'),
(4, 'Miss Estella Brakus I', 'trenton.mccullough@example.net', '2020-05-29 01:08:25', '$2y$10$d6tuSFbpbx7TmkFm1puF1e/cvjOkmXIn6hm9ahXK1PeOk5rZH0ddm', 'S2Nt6Agt9Cd2xQJaW5L7tspC8NYCRDlI', '3Hl8x9FbB4', '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(5, 'Wilford Walker', 'ruby.doyle@example.org', '2020-05-29 01:08:26', '$2y$10$wzhrbSz5rAHXpnsOmIhDL.jAIE3DU4ukmPzDIogboRhHWQnylAFCC', 'jxkVw2Bml5XsD7p559GiN6iTKGru0F1s', '7tRKys61yd', '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(6, 'Dr. Toni Bins III', 'waelchi.clinton@example.org', '2020-05-29 01:08:26', '$2y$10$x4PrlIhfn57A.uyN2BEapuNpTOyCdi6v3t2EbjW4kh33xG7AVQSMi', 'uiHIvaLjeUcE5N6dYfpe71DSqxZq6lxi', 'vdxxo9PecZ', '2020-05-29 01:08:26', '2020-05-29 01:08:26'),
(7, 'Albertha Russel', 'test@gmail.com', '2020-05-29 02:18:59', '$2y$10$1cDo8Ch0XHWMipYsYJhFZeMvGci4o3u9yEPHgml0Jmda.vVlVrJPS', 'jPGII5XjRPKVjLiHrjvuKoDkdmJFipPn', 'YzrL33EFBt', '2020-05-29 02:18:59', '2020-05-29 02:18:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiries`
--
ALTER TABLE `enquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enquiries`
--
ALTER TABLE `enquiries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `enquiry_types`
--
ALTER TABLE `enquiry_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
