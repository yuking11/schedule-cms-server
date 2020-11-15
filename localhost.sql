-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- ホスト: mysql:3306
-- 生成日時: 2020 年 11 月 15 日 15:07
-- サーバのバージョン： 5.7.32
-- PHP のバージョン: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `schedule_cms`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$216000$MKUKv71v08dq$L45+8P3+c/H6PZGnHJrjWPM2gXyxz9gfQvfy4dl7RmA=', '2020-11-15 04:57:53.097093', 1, 'yuking', '', '', 'ys11.works@gmail.com', 1, 1, '2020-11-03 16:55:50.982366');

-- --------------------------------------------------------

--
-- テーブルの構造 `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add schedule', 7, 'add_schedule'),
(26, 'Can change schedule', 7, 'change_schedule'),
(27, 'Can delete schedule', 7, 'delete_schedule'),
(28, 'Can view schedule', 7, 'view_schedule'),
(29, 'Can add Token', 8, 'add_token'),
(30, 'Can change Token', 8, 'change_token'),
(31, 'Can delete Token', 8, 'delete_token'),
(32, 'Can view Token', 8, 'view_token'),
(33, 'Can add token', 9, 'add_tokenproxy'),
(34, 'Can change token', 9, 'change_tokenproxy'),
(35, 'Can delete token', 9, 'delete_tokenproxy'),
(36, 'Can view token', 9, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- テーブルの構造 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-11-08 08:13:57.564773', '2', '2020年11月08日 u-12 全日本サッカー大会', 1, '[{\"added\": {}}]', 7, 2),
(2, '2020-11-08 08:14:40.515245', '2', '2020年11月08日 U-12 全日本サッカー大会', 2, '[{\"changed\": {\"fields\": [\"\\u5bfe\\u8c61\\u5b66\\u5e74\"]}}]', 7, 2),
(3, '2020-11-08 08:15:14.388002', '2', '2020年11月01日 U-12 全日本サッカー大会', 2, '[{\"changed\": {\"fields\": [\"\\u958b\\u50ac\\u65e5\"]}}]', 7, 2),
(4, '2020-11-15 04:27:58.522430', '3', '2020年11月30日 U-11 JAカップ', 1, '[{\"added\": {}}]', 7, 2),
(5, '2020-11-15 09:08:34.402079', '4', '2019年10月29日 U-10 4年生大会', 1, '[{\"added\": {}}]', 7, 2),
(6, '2020-11-15 09:11:30.191897', '5', '2020年04月07日 U-8 2年生大会', 1, '[{\"added\": {}}]', 7, 2),
(7, '2020-11-15 10:06:51.100135', '6', '2019年10月30日 ALL 親子サッカー大会', 1, '[{\"added\": {}}]', 7, 2),
(8, '2020-11-15 14:02:34.180713', '7', '2019年09月14日 U-9 3年生大会', 1, '[{\"added\": {}}]', 7, 2),
(9, '2020-11-15 14:21:01.242743', '8', '2020年04月30日 U-11 AOL CUP', 1, '[{\"added\": {}}]', 7, 2),
(10, '2020-11-15 14:34:12.628030', '9', '2020年10月10日 ALL 親子サッカー大会', 1, '[{\"added\": {}}]', 7, 2),
(11, '2020-11-15 14:40:02.968652', '10', '2020年11月21日 U-12 全日本サッカー大会', 1, '[{\"added\": {}}]', 7, 2),
(12, '2020-11-15 14:40:41.409552', '10', '2020年11月22日 U-12 全日本サッカー大会', 2, '[{\"changed\": {\"fields\": [\"\\u958b\\u50ac\\u65e5\"]}}]', 7, 2),
(13, '2020-11-15 14:40:59.082235', '10', '2020年11月22日 U-12 全日本サッカー大会', 2, '[]', 7, 2),
(14, '2020-11-15 14:41:15.734569', '10', '2020年11月22日 U-12 全日本サッカー大会', 2, '[{\"changed\": {\"fields\": [\"\\u958b\\u50ac\\u65e5\"]}}]', 7, 2);

-- --------------------------------------------------------

--
-- テーブルの構造 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(8, 'authtoken', 'token'),
(9, 'authtoken', 'tokenproxy'),
(4, 'contenttypes', 'contenttype'),
(7, 'schedule', 'schedule'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- テーブルの構造 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-11-03 16:43:31.661922'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-11-03 16:43:31.724230'),
(3, 'auth', '0001_initial', '2020-11-03 16:43:31.814131'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-11-03 16:43:31.983814'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-11-03 16:43:31.990856'),
(6, 'auth', '0004_alter_user_username_opts', '2020-11-03 16:43:31.997389'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-11-03 16:43:32.003924'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-11-03 16:43:32.006954'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-11-03 16:43:32.013387'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-11-03 16:43:32.020373'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-11-03 16:43:32.026815'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-11-03 16:43:32.047648'),
(13, 'auth', '0011_update_proxy_permissions', '2020-11-03 16:43:32.054846'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2020-11-03 16:43:32.061115'),
(15, 'accounts', '0001_initial', '2020-11-03 16:43:32.156772'),
(16, 'admin', '0001_initial', '2020-11-03 16:43:32.362907'),
(17, 'admin', '0002_logentry_remove_auto_add', '2020-11-03 16:43:32.444314'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2020-11-03 16:43:32.455052'),
(19, 'sessions', '0001_initial', '2020-11-03 16:43:32.490022'),
(20, 'schedule', '0001_initial', '2020-11-08 08:02:13.265250'),
(21, 'authtoken', '0001_initial', '2020-11-15 04:52:30.925910'),
(22, 'authtoken', '0002_auto_20160226_1747', '2020-11-15 04:52:31.111377'),
(23, 'authtoken', '0003_tokenproxy', '2020-11-15 04:52:31.127006');

-- --------------------------------------------------------

--
-- テーブルの構造 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ey0v6yrc2vq7q8kxciutpp1v9xpshxd7', '.eJxVjEEOwiAQRe_C2hBgkBaX7nsGMsyAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnERRpx-t4j0SHUHfMd6a5JaXZc5yl2RB-1yapye18P9OyjYy7fWCRyRjioqMAO5MTNzxCFrQBudQ9Y8Ap5NJjBkIQOR0Y68scp7b8X7A_54OBw:1keA6r:Wt75_Y5pDs6vwANVgsUp3dnWW1lL8cbQp3salch1fLg', '2020-11-29 04:57:53.100065');

-- --------------------------------------------------------

--
-- テーブルの構造 `schedule_schedule`
--

CREATE TABLE `schedule_schedule` (
  `id` int(11) NOT NULL,
  `event_date` datetime(6) NOT NULL,
  `category` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `schedule_schedule`
--

INSERT INTO `schedule_schedule` (`id`, `event_date`, `category`, `title`, `place`, `content`, `url`, `attach`, `sort_number`, `created_date`, `updated_date`) VALUES
(2, '2020-11-01 08:13:50.000000', 'U-12', '全日本サッカー大会', '味の素スタジアム', '10:00 vs ヴェルディ\r\n12:00 vs FC東京', 'http://www.jfa.jp/match/japan_u12_football_championship_2020/', 'uploads/2020/11/test_puI52tK.jpg', 0, '2020-11-08 08:13:50.000000', '2020-11-08 08:13:50.000000'),
(3, '2020-11-30 04:26:53.000000', 'U-11', 'JAカップ', '大泉希望ヶ丘運動場', '11:00 vs ABC', NULL, '', 0, '2020-11-15 04:26:43.000000', '2020-11-15 04:26:43.000000'),
(4, '2019-10-29 09:07:51.000000', 'U-10', '4年生大会', '練馬総合グラウンド', '13:45 vs FC KAISHIN', NULL, '', 0, '2020-11-15 09:07:51.000000', '2020-11-15 09:07:51.000000'),
(5, '2020-04-07 03:00:00.000000', 'U-8', '2年生大会', '大泉さくら運動公園', '14:00 vs JCJ', NULL, '', 0, '2020-11-15 09:10:22.000000', '2020-11-15 09:10:22.000000'),
(6, '2019-10-29 21:00:00.000000', 'ALL', '親子サッカー大会', '開二小', '', NULL, '', 0, '2020-11-15 10:06:25.000000', '2020-11-15 10:06:25.000000'),
(7, '2019-09-13 21:00:00.000000', 'U-9', '3年生大会', '練馬総合グラウンド', '', NULL, '', 0, '2020-11-15 14:01:58.000000', '2020-11-15 14:01:58.000000'),
(8, '2020-04-30 03:00:00.000000', 'U-11', 'AOL CUP', '西ヶ丘サッカー場', '', NULL, '', 0, '2020-11-15 14:20:24.000000', '2020-11-15 14:20:24.000000'),
(9, '2020-10-09 21:00:00.000000', 'ALL', '親子サッカー大会', '開二小', '', NULL, '', 0, '2020-11-15 14:33:51.000000', '2020-11-15 14:33:51.000000'),
(10, '2020-11-22 03:00:00.000000', 'U-12', '全日本サッカー大会', '大泉希望ヶ丘運動場', '', NULL, '', 0, '2020-11-15 14:39:24.000000', '2020-11-15 14:39:24.000000');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- テーブルのインデックス `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- テーブルのインデックス `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- テーブルのインデックス `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- テーブルのインデックス `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- テーブルのインデックス `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- テーブルのインデックス `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- テーブルのインデックス `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- テーブルのインデックス `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- テーブルのインデックス `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- テーブルのインデックス `schedule_schedule`
--
ALTER TABLE `schedule_schedule`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- テーブルの AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルの AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- テーブルの AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- テーブルの AUTO_INCREMENT `schedule_schedule`
--
ALTER TABLE `schedule_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- テーブルの制約 `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- テーブルの制約 `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- テーブルの制約 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- テーブルの制約 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- テーブルの制約 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
