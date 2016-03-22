-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 28, 2016 at 10:11 AM
-- Server version: 5.5.47-cll
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flagsrus_live`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `available` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `native` enum('Yes','No') NOT NULL DEFAULT 'No',
  `tax_available` enum('Yes','No') NOT NULL DEFAULT 'No',
  `shipping_taxable` enum('Yes','No') NOT NULL DEFAULT 'No',
  `tax` decimal(20,5) unsigned NOT NULL DEFAULT '0.00000',
  `country_priority` int(10) NOT NULL DEFAULT '0',
  `iso_a2` char(2) NOT NULL DEFAULT '',
  `iso_a3` char(3) NOT NULL DEFAULT '',
  `iso_number` varchar(4) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`coid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=277 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`coid`, `available`, `native`, `tax_available`, `shipping_taxable`, `tax`, `country_priority`, `iso_a2`, `iso_a3`, `iso_number`, `name`) VALUES
(1, 'Yes', 'Yes', 'Yes', 'No', '0.00000', 3, 'US', 'USA', '840', 'United States'),
(2, 'Yes', 'No', 'No', 'No', '0.00000', 2, 'CA', 'CAN', '124', 'Canada'),
(3, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AL', 'ALB', '008', 'Albania'),
(4, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DZ', 'DZA', '012', 'Algeria'),
(5, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AS', 'ASM', '016', 'American Samoa'),
(6, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AD', 'AND', '020', 'Andorra'),
(7, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AI', 'AIA', '660', 'Anguilla'),
(8, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AG', 'ATG', '028', 'Antigua and Barbuda'),
(9, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AR', 'ARG', '032', 'Argentina'),
(10, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AM', 'ARM', '051', 'Armenia'),
(11, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AW', 'ABW', '533', 'Aruba'),
(12, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AU', 'AUS', '036', 'Australia'),
(13, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AT', 'AUT', '040', 'Austria'),
(14, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AZ', 'AZE', '031', 'Azerbaijan'),
(15, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AP', '', '', 'Azores'),
(16, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BS', 'BHS', '044', 'Bahamas'),
(17, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BH', 'BHR', '048', 'Bahrain'),
(18, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BD', 'BGD', '050', 'Bangladesh'),
(19, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BB', 'BRB', '052', 'Barbados'),
(20, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BC', '', '', 'Barbuda'),
(21, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BE', 'BEL', '056', 'Belgium'),
(22, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BZ', 'BLZ', '084', 'Belize'),
(23, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BY', 'BLR', '112', 'Belarus'),
(24, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BJ', 'BEN', '204', 'Benin'),
(25, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BM', 'BMU', '060', 'Bermuda'),
(26, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BO', 'BOL', '068', 'Bolivia'),
(27, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BL', '', '', 'Bonaire'),
(28, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BA', 'BIH', '070', 'Bosnia and Herzegowina'),
(29, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BW', 'BWA', '072', 'Botswana'),
(30, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BR', 'BRA', '076', 'Brazil'),
(31, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VG', 'VGB', '092', 'Virgin Islands (British)'),
(32, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BN', 'BRN', '096', 'Brunei Darussalam'),
(33, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BG', 'BGR', '100', 'Bulgaria'),
(34, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BF', 'BFA', '854', 'Burkina Faso'),
(35, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BI', 'BDI', '108', 'Burundi'),
(36, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KH', 'KHM', '116', 'Cambodia'),
(37, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CM', 'CMR', '120', 'Cameroon'),
(38, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CE', '', '', 'Canary Islands'),
(39, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CV', 'CPV', '132', 'Cape Verde'),
(40, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CF', 'CAF', '140', 'Central African Republic'),
(41, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TD', 'TCD', '148', 'Chad'),
(42, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NN', '', '', 'Channel Islands'),
(43, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CL', 'CHL', '152', 'Chile'),
(44, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CN', 'CHN', '156', 'China'),
(45, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CX', 'CXR', '162', 'Christmas Island'),
(46, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CC', 'CCK', '166', 'Cocos (Keeling) Islands'),
(47, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KY', 'CYM', '136', 'Cayman Islands'),
(48, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CO', 'COL', '170', 'Colombia'),
(49, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CG', 'COG', '178', 'Congo, People''s Republic Of'),
(50, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CK', 'COK', '184', 'Cook Islands'),
(51, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CR', 'CRI', '188', 'Costa Rica'),
(52, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HR', 'HRV', '191', 'Croatia (Hrvatska)'),
(53, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CB', '', '', 'Curacao'),
(54, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CY', 'CYP', '196', 'Cyprus'),
(55, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CZ', 'CZE', '203', 'Czech Republic'),
(56, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DK', 'DNK', '208', 'Denmark'),
(57, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DJ', 'DJI', '262', 'Djibouti'),
(58, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DM', 'DMA', '212', 'Dominica'),
(59, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DO', 'DOM', '214', 'Dominican Republic'),
(60, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EC', 'ECU', '218', 'Ecuador'),
(61, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EG', 'EGY', '818', 'Egypt'),
(62, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SV', 'SLV', '222', 'El Salvador'),
(63, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EN', '', '', 'England'),
(64, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GQ', 'GNQ', '226', 'Equatorial Guinea'),
(65, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ER', 'ERI', '232', 'Eritrea'),
(66, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EE', 'EST', '233', 'Estonia'),
(67, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ET', 'ETH', '231', 'Ethiopia'),
(68, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FO', 'FRO', '234', 'Faroe Islands'),
(69, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FJ', 'FJI', '242', 'Fiji'),
(70, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FI', 'FIN', '246', 'Finland'),
(71, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FR', 'FRA', '250', 'France'),
(72, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GF', 'GUF', '254', 'French Guiana'),
(73, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PF', 'PYF', '258', 'French Polynesia'),
(74, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GA', 'GAB', '266', 'Gabon'),
(75, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GM', 'GMB', '270', 'Gambia'),
(76, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GE', 'GEO', '268', 'Georgia'),
(77, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'DE', 'DEU', '276', 'Germany'),
(78, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GH', 'GHA', '288', 'Ghana'),
(79, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GI', 'GIB', '292', 'Gibraltar'),
(80, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GR', 'GRC', '300', 'Greece'),
(81, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GL', 'GRL', '304', 'Greenland'),
(82, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GD', 'GRD', '308', 'Grenada'),
(83, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GP', 'GLP', '312', 'Guadeloupe'),
(84, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GU', 'GUM', '316', 'Guam'),
(85, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GT', 'GTM', '320', 'Guatemala'),
(86, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GN', 'GIN', '324', 'Guinea'),
(87, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GW', 'GNB', '624', 'Guinea-Bissau'),
(88, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GY', 'GUY', '328', 'Guyana'),
(89, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HT', 'HTI', '332', 'Haiti'),
(91, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HN', 'HND', '340', 'Honduras'),
(92, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HK', 'HKG', '344', 'Hong Kong'),
(93, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HU', 'HUN', '348', 'Hungary'),
(94, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IS', 'ISL', '352', 'Iceland'),
(95, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IN', 'IND', '356', 'India'),
(96, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ID', 'IDN', '360', 'Indonesia'),
(97, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IR', 'IRN', '364', 'Iran (Islamic Republic Of)'),
(98, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IE', 'IRL', '372', 'Ireland'),
(99, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IL', 'ISR', '376', 'Israel'),
(100, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IT', 'ITA', '380', 'Italy'),
(101, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CI', 'CIV', '384', 'Cote D''Ivoire'),
(102, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'JM', 'JAM', '388', 'Jamaica'),
(103, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'JP', 'JPN', '392', 'Japan'),
(104, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'JO', 'JOR', '400', 'Jordan'),
(105, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KZ', 'KAZ', '398', 'Kazakhstan'),
(106, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KE', 'KEN', '404', 'Kenya'),
(107, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KI', 'KIR', '296', 'Kiribati'),
(108, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KR', 'KOR', '410', 'Korea, Republic Of'),
(109, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KO', '', '', 'Kosrae'),
(110, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KW', 'KWT', '414', 'Kuwait'),
(111, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KG', 'KGZ', '417', 'Kyrgyzstan'),
(112, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LA', 'LAO', '418', 'Lao People''s Democratic Republic'),
(113, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LV', 'LVA', '428', 'Latvia'),
(114, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LB', 'LBN', '422', 'Lebanon'),
(115, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LS', 'LSO', '426', 'Lesotho'),
(116, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LR', 'LBR', '430', 'Liberia'),
(117, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LI', 'LIE', '438', 'Liechtenstein'),
(118, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LT', 'LTU', '440', 'Lithuania'),
(119, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LU', 'LUX', '442', 'Luxembourg'),
(120, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MO', 'MAC', '446', 'Macau'),
(121, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MK', 'MKD', '807', 'Macedonia, The Former Yugoslav Republic Of'),
(122, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MG', 'MDG', '450', 'Madagascar'),
(123, 'Yes', 'No', 'No', 'No', '0.00000', 0, '', '', '', 'Madeira'),
(124, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MW', 'MWI', '454', 'Malawi'),
(125, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MY', 'MYS', '458', 'Malaysia'),
(126, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MV', 'MDV', '462', 'Maldives'),
(127, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ML', 'MLI', '466', 'Mali'),
(128, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MT', 'MLT', '470', 'Malta'),
(129, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MH', 'MHL', '584', 'Marshall Islands'),
(130, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MQ', 'MTQ', '474', 'Martinique'),
(131, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MR', 'MRT', '478', 'Mauritania'),
(132, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MU', 'MUS', '480', 'Mauritius'),
(133, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MX', 'MEX', '484', 'Mexico'),
(134, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FM', 'FSM', '583', 'Micronesia, Federated States Of'),
(135, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MC', 'MCO', '492', 'Monaco'),
(136, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MS', 'MSR', '500', 'Montserrat'),
(137, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MA', 'MAR', '504', 'Morocco'),
(138, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MZ', 'MOZ', '508', 'Mozambique'),
(139, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MM', 'MMR', '104', 'Myanmar'),
(140, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NA', 'NAM', '516', 'Namibia'),
(141, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NP', 'NPL', '524', 'Nepal'),
(142, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NL', 'NLD', '528', 'Netherlands'),
(143, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AN', 'ANT', '530', 'Netherlands Antilles'),
(144, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NV', '', '', 'Nevis'),
(145, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NC', 'NCL', '540', 'New Caledonia'),
(146, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NZ', 'NZL', '554', 'New Zealand'),
(147, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NI', 'NIC', '558', 'Nicaragua'),
(148, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NE', 'NER', '562', 'Niger'),
(149, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NG', 'NGA', '566', 'Nigeria'),
(150, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NU', 'NIU', '570', 'Niue'),
(151, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NF', 'NFK', '574', 'Norfolk Island'),
(152, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NB', '', '', 'Northern Ireland'),
(153, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MP', 'MNP', '580', 'Northern Mariana Islands'),
(154, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NO', 'NOR', '578', 'Norway'),
(155, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'OM', 'OMN', '512', 'Oman'),
(156, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PK', 'PAK', '586', 'Pakistan'),
(157, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PW', 'PLW', '585', 'Palau'),
(158, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PA', 'PAN', '591', 'Panama'),
(159, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PG', 'PNG', '598', 'Papua New Guinea'),
(160, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PY', 'PRY', '600', 'Paraguay'),
(161, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PE', 'PER', '604', 'Peru'),
(162, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PH', 'PHL', '608', 'Philippines'),
(163, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PL', 'POL', '616', 'Poland'),
(164, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PO', '', '', 'Ponape'),
(165, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PT', 'PRT', '620', 'Portugal'),
(167, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'QA', 'QAT', '634', 'Qatar'),
(168, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RE', 'REU', '638', 'Reunion'),
(169, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RO', 'ROU', '642', 'Romania'),
(170, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RT', '', '', 'Rota'),
(171, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RU', 'RUS', '643', 'Russian Federation'),
(172, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RW', 'RWA', '646', 'Rwanda'),
(173, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SS', '', '', 'Saba'),
(174, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SP', '', '', 'Saipan'),
(175, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SM', 'SMR', '674', 'San Marino'),
(176, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SA', 'SAU', '682', 'Saudi Arabia'),
(177, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SF', '', '', 'Scotland'),
(178, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SN', 'SEN', '686', 'Senegal'),
(179, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SC', 'SYC', '690', 'Seychelles'),
(180, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SL', 'SLE', '694', 'Sierra Leone'),
(181, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SG', 'SGP', '702', 'Singapore'),
(182, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SK', 'SVK', '703', 'Slovakia (Slovak Republic)'),
(183, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SI', 'SVN', '705', 'Slovenia'),
(184, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SB', 'SLB', '090', 'Solomon Islands'),
(185, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ZA', 'ZAF', '710', 'South Africa'),
(186, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ES', 'ESP', '724', 'Spain'),
(187, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LK', 'LKA', '144', 'Sri Lanka'),
(188, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NT', '', '', 'St. Barthelemy'),
(189, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SW', '', '', 'St. Christopher'),
(190, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SX', '', '', 'St. Croix'),
(191, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EU', '', '', 'St. Eustatius'),
(192, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UV', '', '', 'St. John'),
(193, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KN', 'KNA', '659', 'Saint Kitts and Nevis'),
(194, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LC', 'LCA', '662', 'Saint Lucia'),
(195, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MB', '', '', 'St. Maarten'),
(196, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TB', '', '', 'St. Martin'),
(197, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VL', '', '', 'St. Thomas'),
(198, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VC', 'VCT', '670', 'Saint Vincent and The Grenadines'),
(199, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SD', 'SDN', '736', 'Sudan'),
(200, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SR', 'SUR', '740', 'Suriname'),
(201, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SZ', 'SWZ', '748', 'Swaziland'),
(202, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SE', 'SWE', '752', 'Sweden'),
(203, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CH', 'CHE', '756', 'Switzerland'),
(204, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SY', 'SYR', '760', 'Syrian Arab Republic'),
(205, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TA', '', '', 'Tahiti'),
(206, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TW', 'TWN', '158', 'Taiwan'),
(207, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TJ', 'TJK', '762', 'Tajikistan'),
(208, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TZ', 'TZA', '834', 'Tanzania, United Republic Of'),
(209, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TH', 'THA', '764', 'Thailand'),
(210, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TI', '', '', 'Tinian'),
(211, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TG', 'TGO', '768', 'Togo'),
(212, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TO', 'TON', '776', 'Tonga'),
(213, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TL', 'TLS', '626', 'East Timor'),
(214, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TT', 'TTO', '780', 'Trinidad and Tobago'),
(215, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TU', '', '', 'Truk'),
(216, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TN', 'TUN', '788', 'Tunisia'),
(217, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TR', 'TUR', '792', 'Turkey'),
(218, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TM', 'TKM', '795', 'Turkmenistan'),
(219, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TC', 'TCA', '796', 'Turks and Caicos Islands'),
(220, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TV', 'TUV', '798', 'Tuvalu'),
(221, 'No', 'No', 'No', 'No', '0.00000', 0, 'VI', 'VIR', '850', 'Virgin Islands (U.S.)'),
(222, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UG', 'UGA', '800', 'Uganda'),
(223, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UA', 'UKR', '804', 'Ukraine'),
(224, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UI', '', '', 'Union Island'),
(225, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AE', 'ARE', '784', 'United Arab Emirates'),
(226, 'Yes', 'No', 'No', 'No', '0.00000', 1, 'GB', 'GBR', '826', 'United Kingdom'),
(227, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UY', 'URY', '858', 'Uruguay'),
(228, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UZ', 'UZB', '860', 'Uzbekistan'),
(229, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VU', 'VUT', '548', 'Vanuatu'),
(230, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VE', 'VEN', '862', 'Venezuela'),
(231, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VN', 'VNM', '704', 'Viet Nam'),
(232, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VR', '', '', 'Virgin Gorda'),
(233, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'WK', '', '', 'Wake Island'),
(234, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'WL', '', '', 'Wales'),
(235, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'WF', 'WLF', '876', 'Wallis and Futuna Islands'),
(236, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'WS', 'WSM', '882', 'Samoa'),
(237, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'YA', '', '', 'Yap'),
(238, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'YE', 'YEM', '887', 'Yemen'),
(239, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'YU', 'YUG', '891', 'Yugoslavia'),
(240, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ZR', '', '', 'Zaire'),
(241, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ZM', 'ZMB', '894', 'Zambia'),
(242, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ZW', 'ZWE', '716', 'Zimbabwe'),
(243, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AF', 'AFG', '004', 'Afghanistan'),
(244, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AO', 'AGO', '024', 'Angola'),
(245, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'AQ', 'ATA', '010', 'Antarctica'),
(246, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BT', 'BTN', '064', 'Bhutan'),
(247, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'BV', 'BVT', '074', 'Bouvet Island'),
(248, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IO', 'IOT', '086', 'British Indian Ocean Territory'),
(249, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KM', 'COM', '174', 'Comoros'),
(250, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CD', 'COD', '180', 'Congo, Democratic Republic Of (Was Zaire)'),
(251, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'CU', 'CUB', '192', 'Cuba'),
(252, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FK', 'FLK', '238', 'Falkland Islands (Malvinas)'),
(253, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'FX', 'FXX', '249', 'France, Metropolitan'),
(254, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TF', 'ATF', '260', 'French Southern Territories'),
(255, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'HM', 'HMD', '334', 'Heard and Mc Donald Islands'),
(256, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'IQ', 'IRQ', '368', 'Iraq'),
(257, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'KP', 'PRK', '408', 'Korea, Democratic People''s Republic Of'),
(258, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'LY', 'LBY', '434', 'Libyan Arab Jamahiriya'),
(259, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'YT', 'MYT', '175', 'Mayotte'),
(260, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MD', 'MDA', '498', 'Moldova, Republic Of'),
(261, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'MN', 'MNG', '496', 'Mongolia'),
(262, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'NR', 'NRU', '520', 'Nauru'),
(263, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PS', 'PSE', '275', 'Palestinian Territory, Occupied'),
(264, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PN', 'PCN', '612', 'Pitcairn'),
(265, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ST', 'STP', '678', 'Sao Tome and Principe'),
(266, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SO', 'SOM', '706', 'Somalia'),
(267, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'GS', 'SGS', '239', 'South Georgia and The South Sandwich Islands'),
(268, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SH', 'SHN', '654', 'St. Helena'),
(269, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'PM', 'SPM', '666', 'St. Pierre and Miquelon'),
(270, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'SJ', 'SJM', '744', 'Svalbard and Jan Mayen Islands'),
(271, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'TK', 'TKL', '772', 'Tokelau'),
(272, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'UM', 'UMI', '581', 'United States Minor Outlying Islands'),
(273, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'VA', 'VAT', '336', 'Vatican City State (Holy See)'),
(274, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'EH', 'ESH', '732', 'Western Sahara'),
(275, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'ME', 'MNE', '499', 'Republic of Montenegro'),
(276, 'Yes', 'No', 'No', 'No', '0.00000', 0, 'RS', 'SRB', '688', 'Republic of Serbia');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;