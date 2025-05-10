-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 01:45 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `oliver_rein`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `id` bigint(20) NOT NULL,
  `pub` tinyint(1) DEFAULT 1,
  `position` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`id`, `pub`, `position`, `name`, `description`, `modul`, `created_at`, `published_at`, `updated_at`) VALUES
(1, 1, 0, 'admin_table', 'This Table', NULL, '2024-10-25 21:14:34', '2024-10-25 21:18:17', '2025-01-11 13:16:36'),
(2, 1, 1, 'blog_categories', 'Kategorien der Blogeintr&auml;ge', NULL, '2025-03-08 07:53:56', '2025-03-08 07:55:38', '2025-03-08 07:59:54'),
(3, 1, 2, 'blogs', 'Blog Posts', 'TesTModul', '2025-03-02 00:28:59', '2025-03-02 00:29:04', '2025-03-02 00:29:17'),
(4, 1, 3, 'camera', 'Kameras', NULL, '2024-12-06 03:35:33', '2025-03-02 20:47:41', '2025-03-02 20:51:24'),
(5, 1, 4, 'comments', 'Kommentare', NULL, '2025-02-03 06:34:12', '2025-02-03 06:34:57', '2025-02-03 06:36:18'),
(6, 1, 5, 'didyouknow', 'Wussten Sie Schon....?', NULL, '2025-03-15 01:01:54', '2025-03-15 01:06:18', '2025-03-15 01:10:52'),
(7, 1, 6, 'image_categories', 'Kategorien der Bilder', NULL, '2025-01-12 18:33:56', '2025-01-12 18:34:09', '2025-01-12 18:34:28'),
(8, 1, 7, 'images', 'Bilder', NULL, '2024-12-17 10:46:49', '2024-12-17 10:50:50', '2025-01-28 15:21:25'),
(9, 1, 8, 'privacy', 'Datenschutzerkl&auml;rung', NULL, '2025-03-12 10:54:14', '2025-03-12 10:57:05', '2025-03-12 10:57:36'),
(10, 1, 9, 'shortpoems', 'Kurzgeschichten', NULL, '2025-02-26 15:12:06', '2025-02-26 15:13:03', '2025-02-26 15:16:49'),
(11, 1, 10, 'testfield', 'Test Tabelle', NULL, '2024-12-20 02:07:26', '2024-12-20 02:11:25', '2025-02-11 16:45:58'),
(12, 1, 11, 'texts', 'Texte f&uuml;r alle m&ouml;glichen Seiten', NULL, '2024-11-17 15:12:22', '2024-11-17 15:17:09', '2025-02-22 04:55:49'),
(13, 1, 12, 'users', 'Benutzer', NULL, '2024-11-04 05:40:03', '2024-12-14 06:09:42', '2024-12-14 06:12:26'),
(14, 1, 13, 'users_rights', 'Benutzerrechte', 'UserRights', '2024-11-03 09:10:28', '2025-01-11 21:58:51', '2025-03-07 17:36:17');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pub` tinyint(2) NOT NULL DEFAULT 1,
  `blog_date` timestamp NULL DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `blog_categories_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `blog_authors_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `content` text DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `autoslug` varchar(200) DEFAULT NULL,
  `reading_time` int(11) DEFAULT 1,
  `markdown_on` tinyint(1) DEFAULT 1,
  `xis_aiImage` tinyint(1) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT '''''',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `pub`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `autoslug`, `reading_time`, `markdown_on`, `xis_aiImage`, `image_path`, `created_at`, `updated_at`) VALUES
(2, 1, '2006-09-21 19:00:00', 'Wir Feiern Wir Feiern', 1, 1, '<p>Heute ist der Grosse Tag der Tag der erÃƒÂ¶ffnung von <strong>asario.marblefx.de</strong>, meinem PersÃƒÂ¶nlichen Blog.<br /><br />\nMit allem was von mir ist oder mit mir zu tun hat.</p>\n', '<p>Heute ist der Grosse Tag der Tag der erÃƒÂ¶ffnung von <strong>asario.marblefx.de</strong>, meinem PersÃƒÂ¶nlichen Blog.<br /><br />\nMit allem was von mir ist oder mit mir zu tun hat.</p>\n', 'ywvf', 1, 1, 0, '008.jpg', '2006-09-21 17:00:00', '2025-02-25 15:00:24'),
(3, 1, '2006-09-27 21:28:00', 'MCS 1.58 angefangen', 2, 1, '<p>Wie bei jeder neuen Version fallen Fehler auf.<br><br>\nSo auch bei dieser Version.<br><br>\nNun Ideen sind auch neue dazugekommen und ich denke mir fällt auch noch was ein.</p><p><strong>Todolist:</strong><br>\n<br></p><p><a href=\"index.php?page=infos&amp;action=details&amp;id=24\">Hier</a>&nbsp;&nbsp;</p><p><br></p><p><strong>Buglist:</strong></p>\n<ul><br>\n <li><br>\n     Beim Hochladen von Dateien kann es bei Doppelklick zu Fehlern kommen. <blockquote><br>\n       Edit: lag am FILE SIZE Limit<br>\n    </blockquote><br>\n</li><br>\n <li><br>\n     Date funktion Funktioniert manchmal nicht, d.h. Datum wird nicht eingestellt obwohl es eine Datumsspalte gibt. <blockquote><br>\n       Edit:Bug gefunden lag am mangelndem Update in der Preview Funktion<br>\n    </blockquote><br>\n  </li><br>\n</ul><br>', '<p>Wie bei jeder neuen Version fallen Fehler auf.<br><br>\nSo auch bei dieser Version.<br><br>\nNun Ideen sind auch neue dazugekommen und ich denke mir fällt auch noch was ein.</p><p><strong>Todolist:</strong></p><p><b><br></b>\n<a href=\"index.php?page=infos&amp;action=details&amp;id=24\">Hier</a></p><p><br></p><p><strong>Buglist:</strong></p>\n<ul><br>\n <li><br>\n     Beim Hochladen von Dateien kann es bei …<br>\n</li></ul>', 'yltf', 1, 1, 0, '008.jpg', '2025-03-14 18:39:01', '2025-05-10 10:35:18'),
(4, 1, '2007-06-04 17:32:00', 'Neue Fineliner Galerie', 1, 1, '<p>Unter <a href=\"index.php?page=images&amp;action=fineliner3\">Images-&gt;Fineliner3</a> sind neue Bilder gesichtet worden ...<br /><br />\nhave a look ;)</p>\n', '<p>Unter <a href=\"index.php?page=images&amp;action=fineliner3\">Images-&gt;Fineliner3</a> sind neue Bilder gesichtet worden ...<br /><br />\nhave a look ;)</p>\n', 'ys93', 1, 1, 0, '008.jpg', '2007-06-04 15:32:00', '2025-02-25 15:00:24'),
(5, 1, '2008-01-07 22:16:00', 'MCS 1.59 workin', 2, 1, '<p>Wir sind am Arbeiten was MCS 1.59 angeht.<br /><br />\neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie<br /><br />\nPrivate Messages kommen alle noch in dieses Release mit rein</p><p>fieser Bug in der Welcome gefunden und gel&ouml;st</p>\n', '<p>Wir sind am Arbeiten was MCS 1.59 angeht.<br /><br />\neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie<br /><br />\nPrivate Messages kommen alle noch in dieses Release mit rein</p><p>fieser Bug in der Welcome gefunden und gel&ouml;st</p>\n', 'ylpb', 1, 1, 0, '008.jpg', '2008-01-07 21:16:00', '2025-02-25 15:00:24'),
(6, 1, '2008-01-14 10:02:00', 'PalivaRedesign', 3, 1, '<p>Schon wieder ne durchzechte Nacht wegen ner Website,<br /><br />\nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren w&auml;hrend andere Schlummern.<br /><br />\naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate<br /><br />\nund das &uuml;ber Nacht.</p><p>Und wann kommt endlich mein c\'T Abo an ?</p>\n', '<p>Schon wieder ne durchzechte Nacht wegen ner Website,<br /><br />\nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren w&auml;hrend andere Schlummern.<br /><br />\naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate<br /><br />\nund das &uuml;ber Nacht.</p><p>Und wann kommt endlich mein c\'T Abo an ? …</p>\n', 'y4p5', 1, 1, 0, '008.jpg', '2008-01-14 09:02:00', '2025-02-25 15:00:24'),
(7, 1, '2008-01-15 09:48:00', 'Weiteres Projekt bei mederius', 3, 1, '<p>Nun solls ne Zeitung werden<br /><br />\nlayout 1 steht</p>\n', '<p>Nun solls ne Zeitung werden<br /><br />\nlayout 1 steht</p>\n', 'yunz', 1, 1, 0, '008.jpg', '2008-01-15 08:48:00', '2025-02-25 15:00:24'),
(8, 0, '2008-01-27 09:00:00', 'Rotten Psychos Redesign', 3, 1, '<p>Bin am &Uuml;berlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....<br /><br />\nRotten-Psychos ist bzw war ein Clan aus meiner &quot;Beben 3 Arena&quot; Zeit.</p><p><em>edit:</em><br /><br />\nClanpage is zu 90% fertig</p>\n', '<p>Bin am &Uuml;berlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....<br /><br />\nRotten-Psychos ist bzw war ein Clan aus meiner &quot;Beben 3 Arena&quot; Zeit.</p><p><em>edit:</em><br /><br />\nClanpage is zu 90% fertig</p>\n', 'yt70', 1, 1, 0, '008.jpg', '2008-01-27 08:00:00', '2025-02-25 15:00:24'),
(9, 1, '2008-02-17 11:56:00', 'Is schon irre was man so macht', 3, 1, '<p>Rotten Psychos ist für mich eine der besten Zeiten gewesen die ich hatte.<br /><br />\nDamals war DSL noch Teuer und man freute sich über jedes 1on1<br /><br />\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut</p>\n', '<p>Rotten Psychos ist für mich eine der besten Zeiten gewesen die ich hatte.<br /><br />\nDamals war DSL noch Teuer und man freute sich über jedes 1on1<br /><br />\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut</p>\n', 'yvfb', 1, 1, 0, '008.jpg', '2008-02-17 10:56:00', '2025-02-25 15:00:24'),
(10, 0, '2008-11-28 11:27:00', 'How Tough - Rotten-Psychos online', 1, 1, '<p>Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.<br /><br />\nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.<br /><br />\nZur Zeit feile ich an der Neuen &lt;a target=\"rotte\" href=\"http://www.rotten-psychos.de\"&gt;Rotten Psychos Seite&lt;/a&gt; und das RP-Forum ist fast fertig.<br /><br />\nDas Forum ist eine Eigenentwicklung auf MCS Basis.<br /><br />\nHat mich ne menge Zeit gekostet bis alles so funktionierte wie gedacht.<br /><br />\nAber ich habs geschafft die Fehler die sich versteckt hatten zu finden.</p>\n', '<p>Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.<br /><br />\nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.<br /><br />\nZur Zeit feile ich an der Neuen &lt;a target=\"rotte\" href=\"http://www.rotten-psychos.de\"&gt;Rotten Psychos Seite&lt;/a&gt; und das RP-Forum ist fast fertig.<br /><br />\nDas Forum …</p>\n', 'y2in', 1, 1, 0, '008.jpg', '2008-11-28 10:27:00', '2025-02-25 15:00:24'),
(11, 1, '2010-01-10 10:41:00', 'How Real', 1, 1, '<p>Es ist mal wieder eine neue Seite fertig geworden.<br /><br />\nunter <a href=\"http://www.freundeskreis-spiegelbild.de\">www.freundeskreis-spiegelbild.de</a> findet ihr alles zum F&ouml;rderverein Freundeskreis Spiegelbild</p>\n', '<p>Es ist mal wieder eine neue Seite fertig geworden.<br /><br />\nunter <a href=\"http://www.freundeskreis-spiegelbild.de\">www.freundeskreis-spiegelbild.de</a> findet ihr alles zum F&ouml;rderverein Freundeskreis Spiegelbild</p>\n', 'ytsi', 1, 1, 0, '008.jpg', '2010-01-10 09:41:00', '2025-02-25 15:00:24'),
(12, 1, '2010-01-12 17:09:00', 'MCS 1.61 workin', 2, 1, '<p>Marble Content System ist in version 1.61 erschienen.<br /><br />\nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.</p><p>weitere infos zu MCS und dem aktuellen Status auf &lt;a target=\"marbl\" href=\"http://www.marblefx.de\"&gt;www.marblefx.de&lt;/a&gt;</p>\n', '<p>Marble Content System ist in version 1.61 erschienen.<br /><br />\nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.</p><p>weitere infos zu MCS und dem aktuellen Status auf &lt;a target=\"marbl\" href=\"http://www.marblefx.de\"&gt;www.marblefx.de&lt;/a&gt;</p>\n', 'ypse', 1, 1, 0, '008.jpg', '2010-01-12 16:09:00', '2025-02-25 15:00:24'),
(13, 1, '2010-06-19 20:31:00', 'Happy Birthday Asario', 1, 1, '<p>Herzlichen Gl&uuml;ckwunsch Lieber Asario zum 27. Geburtstag.<br /><br />\nDer Tag war sch&ouml;n und das Wetter ging auch in Ordnung.<br /><br />\nFreue mich schon auf den Sommer.<br /><br />\nHabe nette Sachen geschenk bekommen und demn&auml;chst lad ich noch 1-2 Fineliner-Bilder hoch.<br /><br />\nHabt Spass, in liebe euer Asario.</p>\n', '<p>Herzlichen Gl&uuml;ckwunsch Lieber Asario zum 27. Geburtstag.<br /><br />\nDer Tag war sch&ouml;n und das Wetter ging auch in Ordnung.<br /><br />\nFreue mich schon auf den Sommer.<br /><br />\nHabe nette Sachen geschenk bekommen und demn&auml;chst lad ich noch 1-2 Fineliner-Bilder hoch.<br /><br />\nHabt Spass, in liebe euer Asario. …</p>\n', 'yu51', 1, 1, 0, '008.jpg', '2010-06-19 18:31:00', '2025-02-25 15:00:24'),
(14, 1, '2010-08-14 20:31:00', 'Neue Bilder', 1, 1, '<p>Habe 1 neues Wallpaper unter <a href=\"index.php?pae=images&amp;action=digital\">Digital Art</a> und 2 Fineliner Artworks unter <a href=\"index.php?pae=images&amp;action=fineliner4\">Fineliner 4</a> hochgeladen.</p><p>W&uuml;nsche euch viel spass mit den Bildern.</p>\n', '<p>Habe 1 neues Wallpaper unter <a href=\"index.php?pae=images&amp;action=digital\">Digital Art</a> und 2 Fineliner Artworks unter <a href=\"index.php?pae=images&amp;action=fineliner4\">Fineliner 4</a> hochgeladen.</p><p>W&uuml;nsche euch viel spass mit den Bildern.</p>\n', 'ygvk', 1, 1, 0, '008.jpg', '2010-08-14 18:31:00', '2025-02-25 15:00:24'),
(15, 1, '2010-12-26 14:35:00', 'Merry X-Mas and a happy  new Year', 1, 1, '<p>Hiermit w&uuml;nsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.</p><p>habt Spass, bis bald, euer Asario</p>\n', '<p>Hiermit w&uuml;nsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.</p><p>habt Spass, bis bald, euer Asario</p>\n', 'ykq8', 1, 1, 0, '008.jpg', '2010-12-26 13:35:00', '2025-02-25 15:00:24'),
(16, 1, '2011-06-27 17:33:00', 'MCS 1.63 Workin', 2, 1, '<p>MCS 1.63 ist nun verf&uuml;gbar.<br /><br />\neinige nette Gimmicks wurden hinzugef&uuml;gt, und die Liste f&uuml;r 1.65 ist schon lang.</p><p>W&uuml;nsche viel spass mit meinem Blog.</p>\n', '<p>MCS 1.63 ist nun verf&uuml;gbar.<br /><br />\neinige nette Gimmicks wurden hinzugef&uuml;gt, und die Liste f&uuml;r 1.65 ist schon lang.</p><p>W&uuml;nsche viel spass mit meinem Blog.</p>\n', 'yz4r', 1, 1, 0, '008.jpg', '2011-06-27 15:33:00', '2025-02-25 15:00:24'),
(17, 1, '2011-06-27 17:35:00', 'Neue (alte) Bilder unter Fineliner4', 1, 1, '<p>Hier ein paar neue Fineliner Artworks.<br /><br />\nBei der Scanqualit&auml;t musste ich leider etwas nachbearbeiten.<br /><br />\nHoffe sie gefallen euch.<br /><br />\nAuf Bald euer Asario</p>\n', '<p>Hier ein paar neue Fineliner Artworks.<br /><br />\nBei der Scanqualit&auml;t musste ich leider etwas nachbearbeiten.<br /><br />\nHoffe sie gefallen euch.<br /><br />\nAuf Bald euer Asario</p>\n', 'y8tv', 1, 1, 0, '008.jpg', '2011-06-27 15:35:00', '2025-02-25 15:00:24'),
(18, 1, '2011-06-27 17:49:00', 'Bin wieder Online....', 3, 1, '<p>Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,<br /><br />\nd.h. ich bin wieder dabei.</p>\n', '<p>Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,<br /><br />\nd.h. ich bin wieder dabei.</p>\n', 'yi8e', 1, 1, 0, '008.jpg', '2011-06-27 15:49:00', '2025-02-25 15:00:24'),
(19, 1, '2011-07-29 16:30:00', 'MCS Update steht bevor....', 2, 1, '<p>Also hier mal wieder ein paar News aus der Devlog Ecke.<br /><br />\nDie Entwicklung von MCS 1.64 ist angelaufen....<br /><br />\nGeplant sind einige nette Features zwecks Private Messaging.<br /><br />\nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.<br /><br />\nweitere Infos demn&auml;chst Hier...</p>\n', '<p>Also hier mal wieder ein paar News aus der Devlog Ecke.<br /><br />\nDie Entwicklung von MCS 1.64 ist angelaufen....<br /><br />\nGeplant sind einige nette Features zwecks Private Messaging.<br /><br />\nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.<br /><br />\nweitere Infos demn&auml;chst Hier... …</p>\n', 'ykf1', 1, 1, 0, '008.jpg', '2011-07-29 14:30:00', '2025-02-25 15:00:24'),
(20, 1, '2011-08-11 17:38:00', 'news from MCS', 2, 1, '<p>Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,<br /><br />\nso das niemand eine PM verpasst.<br /><br />\nDas Einstellungstool sowie das Profilwerkzeug werden ab demn&auml;chst zusammengefasst<br /><br />\nund in Asarios Blog implementiert.<br /><br />\n(ich arbeite noch dran)...</p>\n', '<p>Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,<br /><br />\nso das niemand eine PM verpasst.<br /><br />\nDas Einstellungstool sowie das Profilwerkzeug werden ab demn&auml;chst zusammengefasst<br /><br />\nund in Asarios Blog implementiert.<br /><br />\n(ich arbeite noch dran)... …</p>\n', 'yuvo', 1, 1, 0, '008.jpg', '2011-08-11 15:38:00', '2025-02-25 15:00:24'),
(21, 1, '2011-08-11 17:38:00', 'MCS version 1.67 Released', 2, 1, '<p>Viele neue Features und Funktionen kommen zum Major Release von MCS.<br /><br />\nNun ist es endlich mÃƒÂ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.</p><p>Module basierendes Admincenter gehÃƒÂ¶rt ebenso dazu wie eine Semantic Web Funktion.</p><p>MCS ist jetzt Multilanguage f&auml;hig.</p><p>Vieles Neues kam dazu, altes wurde verbessert.</p>\n', '<p>Viele neue Features und Funktionen kommen zum Major Release von MCS.<br /><br />\nNun ist es endlich mÃƒÂ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.</p><p>Module basierendes Admincenter gehÃƒÂ¶rt ebenso dazu wie eine Semantic Web Funktion.</p><p>MCS ist jetzt Multilanguage f&auml;hig.</p><p>Vieles Neues kam dazu, altes …</p>\n', 'y8gh', 1, 1, 0, '008.jpg', '2011-08-11 15:38:00', '2025-02-25 15:00:24'),
(22, 1, '2011-09-25 14:54:00', 'Neue Shortstorie gesichtet & 2 neue Photos', 1, 1, '<p>Hab ma wieder <a href=\"%5C\'index.php?page=shortstories%5C\">was geschrieben</a> und <a href=\"%5C\'index.php?page=images&amp;action=photos%5C\">2 Photos</a> hochgeladen.<br /><br />\nHabt Spass, euer Asario</p>\n', '<p>Hab ma wieder <a href=\"%5C\'index.php?page=shortstories%5C\">was geschrieben</a> und <a href=\"%5C\'index.php?page=images&amp;action=photos%5C\">2 Photos</a> hochgeladen.<br /><br />\nHabt Spass, euer Asario</p>\n', 'yg0s', 1, 1, 0, '008.jpg', '2011-09-25 12:54:00', '2025-02-25 15:00:24'),
(23, 1, '2011-10-28 18:43:00', 'neue Fineliner Artworks', 1, 1, '<p>Ich habe ein paar <a href=\"%5C\'index.php?page=images&amp;action=fineliner4%5C\'\">Artworks von 2011</a> hochgeladen.<br /><br />\nW&uuml;nsche viel Spass, Asario.</p>\n', '<p>Ich habe ein paar <a href=\"%5C\'index.php?page=images&amp;action=fineliner4%5C\'\">Artworks von 2011</a> hochgeladen.<br /><br />\nW&uuml;nsche viel Spass, Asario.</p>\n', 'y94i', 1, 1, 0, '008.jpg', '2011-10-28 16:43:00', '2025-02-25 15:00:24'),
(24, 1, '2011-12-04 18:58:00', 'Neues Fineliner Pic', 1, 1, '<p>Hab mal wieder nen Bild gefunden und hochgeladen.<br /><br />\nHabt Spa&szlig;, euer Asario</p>\n', '<p>Hab mal wieder nen Bild gefunden und hochgeladen.<br /><br />\nHabt Spa&szlig;, euer Asario</p>\n', 'yjfv', 1, 1, 0, '008.jpg', '2011-12-04 17:58:00', '2025-02-25 15:00:24'),
(25, 1, '2012-01-01 18:54:00', 'Happy New Year !', 1, 1, '<p>Allen Besuchern und Freunden w&uuml;nsche ich ein sch&ouml;nes neues Jahr.</p><p>Habt Spa&szlig;, auch in 2012.</p><p>In Liebe, euer Asario</p>\n', '<p>Allen Besuchern und Freunden w&uuml;nsche ich ein sch&ouml;nes neues Jahr.</p><p>Habt Spa&szlig;, auch in 2012.</p><p>In Liebe, euer Asario</p>\n', 'ybp3', 1, 1, 0, '008.jpg', '2012-01-01 17:54:00', '2025-02-25 15:00:24'),
(26, 1, '2012-02-12 19:23:00', 'Neues bei mir.', 1, 1, '<p>Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.</p><p>W&uuml;nsche viel Spa&szlig; damit, euer Asario.</p>\n', '<p>Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.</p><p>W&uuml;nsche viel Spa&szlig; damit, euer Asario.</p>\n', 'ygsa', 1, 1, 0, '008.jpg', '2012-02-12 18:23:00', '2025-02-25 15:00:24'),
(27, 1, '2012-08-21 13:43:00', 'Alles Neue macht der August', 1, 1, '<p>Also wir haben jetzt das Update zu Version 1.67 vollzogen.<br /><br />\nviele kleine neuen Sachen sind jetzt dabei.<br /><br />\nich w&uuml;nsch euch viel Spa&szlig; in Asarios Blog</p>\n', '<p>Also wir haben jetzt das Update zu Version 1.67 vollzogen.<br /><br />\nviele kleine neuen Sachen sind jetzt dabei.<br /><br />\nich w&uuml;nsch euch viel Spa&szlig; in Asarios Blog</p>\n', 'yzuf', 1, 1, 0, '008.jpg', '2012-08-21 11:43:00', '2025-02-25 15:00:24'),
(28, 1, '2012-09-09 17:46:00', 'Neues Design, neue Funktionen, neue Innovationen', 1, 1, '<p>Habe in meiner Schublade noch Bilder gefunden und hochgeladen.<br /><br />\nHoffe Sie gefallen euch.</p><p>viel Spass Asario</p>\n', '<p>Habe in meiner Schublade noch Bilder gefunden und hochgeladen.<br /><br />\nHoffe Sie gefallen euch.</p><p>viel Spass Asario</p>\n', 'yf0e', 1, 1, 0, '008.jpg', '2012-09-09 15:46:00', '2025-02-25 15:00:24'),
(29, 1, '2012-11-22 19:50:00', 'Neue Funktion in Asarios Blog', 1, 1, '<p>Newsfeeds sind jetzt im Abo erh&auml;ltlich,<br /><br />\nzu finden Rechts unter Benutzerliste.</p><p>W&uuml;nsch euch viel Spa&szlig; mit den Feeds</p>\n', '<p>Newsfeeds sind jetzt im Abo erh&auml;ltlich,<br /><br />\nzu finden Rechts unter Benutzerliste.</p><p>W&uuml;nsch euch viel Spa&szlig; mit den Feeds</p>\n', 'y58e', 1, 1, 0, '008.jpg', '2012-11-22 18:50:00', '2025-02-25 15:00:24'),
(30, 1, '2012-12-02 19:17:00', 'Neue Bilder gesichtet.', 1, 1, '<p>unter Images-&gt;Digital und unter Images-&gt;Acryl sind neue Bilder gesichtet worden,<br /><br />\nhabt Spa&szlig;, Asario</p>\n', '<p>unter Images-&gt;Digital und unter Images-&gt;Acryl sind neue Bilder gesichtet worden,<br /><br />\nhabt Spa&szlig;, Asario</p>\n', 'y2gt', 1, 1, 0, '008.jpg', '2012-12-02 18:17:00', '2025-02-25 15:00:24'),
(31, 1, '2013-01-06 19:31:00', 'Hab noch mal gekramt....', 1, 1, '<p>... und neue Bilder gefunden.<br /><br />\nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.</p><p>Ach ja, ein schÃƒÂ¶nes neues Jahr an alle.</p>\n', '<p>... und neue Bilder gefunden.<br /><br />\nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.</p><p>Ach ja, ein schÃƒÂ¶nes neues Jahr an alle.</p>\n', 'ygw4', 1, 1, 0, '008.jpg', '2013-01-06 18:31:00', '2025-02-25 15:00:24'),
(32, 1, '2013-01-27 19:06:00', 'Wieder was von der Bilderfront.', 1, 1, '<p>Unter Images-&gt;Photos2 ist eine neue Galerie entstanden.<br /><br />\nUnter Images-&gt;Acryl ist ein neues Bild.<br /><br />\nUnter Images-&gt;Sketches ist eine neue Skizze.<br /><br />\nUnter Images-&gt;Digital ist ein neues Wallpaper.</p><p>Viel Spass mit den Bildern, Asario</p>\n', '<p>Unter Images-&gt;Photos2 ist eine neue Galerie entstanden.<br /><br />\nUnter Images-&gt;Acryl ist ein neues Bild.<br /><br />\nUnter Images-&gt;Sketches ist eine neue Skizze.<br /><br />\nUnter Images-&gt;Digital ist ein neues Wallpaper.</p><p>Viel Spass mit den Bildern, Asario</p>\n', 'ylas', 1, 1, 0, 'jquery.jpg', '2013-01-27 18:06:00', '2025-02-25 15:00:24'),
(33, 1, '2013-05-20 17:26:00', 'Wie man aus 4 Leinw&auml;nden 1 Lichtobjekt macht....', 1, 1, '<p>... Seht ihr unter Images-&gt;Lampen<br /><br />\nUns kam die Idee aus einem &quot;neverending Paul&quot; Bild eine Lampe zu fertigen.<br /><br />\nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.</p><p>edit: Die Winkel haben wir jetzt, die m&uuml;ssen nur noch gebohrt und montiert werden.</p><p>W&uuml;nsche viel Spass damit, euer Asario</p>\n', '<p>... Seht ihr unter Images-&gt;Lampen<br /><br />\nUns kam die Idee aus einem &quot;neverending Paul&quot; Bild eine Lampe zu fertigen.<br /><br />\nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.</p><p>edit: Die Winkel haben wir jetzt, die m&uuml;ssen nur noch gebohrt und montiert werden.</p><p>W&uuml;nsche viel Spass damit, …</p>\n', 'ygfe', 1, 1, 0, 'auriel.jpg', '2013-05-20 15:26:00', '2025-02-25 15:00:24'),
(34, 1, '2013-05-20 17:52:00', 'Neuer Fernseher in Asarios Home Office.', 3, 1, '<p>Ich habe mir mal was gegÃƒÂ¶nnt und mir einen neuen Fernseher gekauft.<br /><br />\nDaten:<br /><br />\nGrÃƒÂ¶sse: 47\' (119cm)<br /><br />\nLAN, 3D, FullHD, Smart TV Funktionen</p><p>Jetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.<br /><br />\nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich mal mein Herz aussch&uuml;tten</p>\n', '<p>Ich habe mir mal was gegÃƒÂ¶nnt und mir einen neuen Fernseher gekauft.<br /><br />\nDaten:<br /><br />\nGrÃƒÂ¶sse: 47\' (119cm)<br /><br />\nLAN, 3D, FullHD, Smart TV Funktionen</p><p>Jetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.<br /><br />\nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich …</p>\n', 'yh62', 1, 1, 0, 'bigtv.jpg', '2013-05-20 15:52:00', '2025-02-25 15:00:24'),
(35, 1, '2013-06-23 19:37:00', 'MCS v. 1.68 released', 2, 1, '<p>Willkommen in Asarios Blog, meinem Blog auf MCS Basis.<br /><br />\nMCS version 1.68 (Honkey Donkey) wurde installiert.</p><p>Zu den Features z&auml;hlen:<br /><br />\n-Neue Icons im Admincenter<br /><br />\n-Benutzerinhalte Funktionen<br /><br />\nsowie mehrere kleine eliminierte Fehler</p><p>Mehr Informationen im Changelog auf www.marblefx.de</p>\n', '<p>Willkommen in Asarios Blog, meinem Blog auf MCS Basis.<br /><br />\nMCS version 1.68 (Honkey Donkey) wurde installiert.</p><p>Zu den Features z&auml;hlen:<br /><br />\n-Neue Icons im Admincenter<br /><br />\n-Benutzerinhalte Funktionen<br /><br />\nsowie mehrere kleine eliminierte Fehler</p><p>Mehr Informationen im Changelog auf www.marblefx.de …</p>\n', 'ybzf', 1, 1, 0, '008.jpg', '2013-06-23 17:37:00', '2025-02-25 15:00:24'),
(36, 1, '2013-06-23 19:38:00', 'Smilies all over the World', 1, 1, '<p>Ab jetzt seht ihr &uuml;berall Smilies wo auch immer sie geschrieben wurden.<br /><br />\nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)</p>\n', '<p>Ab jetzt seht ihr &uuml;berall Smilies wo auch immer sie geschrieben wurden.<br /><br />\nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)</p>\n', 'yue3', 1, 1, 0, 'smilies.jpg', '2013-06-23 17:38:00', '2025-02-25 15:00:24'),
(37, 1, '2013-07-14 17:55:00', 'Alles Neue Macht der Juli.', 1, 1, '<p>In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.<br /><br />\nIhr findet Sie unter Images-&gt;Photos2</p>\n', '<p>In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.<br /><br />\nIhr findet Sie unter Images-&gt;Photos2</p>\n', 'ynqo', 1, 1, 0, 'juli.jpg', '2013-07-14 15:55:00', '2025-02-25 15:00:24'),
(38, 1, '2013-08-11 18:00:00', 'Der Fernseher h&auml;ngt an der Wand ;)', 3, 1, '<p>Ja er h&auml;ngt noch, er h&auml;ngt noch f&uuml;r mich....<br /><br />\nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)<br /><br />\nUnd mein neuer 3D-BluRay Player rockt auch derbst.<br /><br />\nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.<br /><br />\nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.</p><p>gl&amp;hf Paul</p>\n', '<p>Ja er h&auml;ngt noch, er h&auml;ngt noch f&uuml;r mich....<br /><br />\nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)<br /><br />\nUnd mein neuer 3D-BluRay Player rockt auch derbst.<br /><br />\nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.<br /><br />\nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.</p><p>gl&amp;hf Paul …</p>\n', 'yknv', 1, 1, 0, 'tvset.jpg', '2013-08-11 16:00:00', '2025-02-25 15:00:24'),
(39, 1, '2014-01-05 18:14:00', 'Frohes Neues - 2014 - ein Gl&uuml;cksjahr', 1, 1, '<p>Ich habe unter Images-&gt;Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,<br /><br />\nIch hoffe bei euch war der Weihnachtsmann auch so flei&szlig;ig wie bei mir.<br /><br />\nAllen Besuchern meiner Seite w&uuml;nsche ich gut reingerutscht zu sein und ein schÃƒÂ¶nes neues Jahr.</p><p>Viele Gr&uuml;&szlig;e aus BimÃƒÂ¶hlen, euer Asario.</p><p>Viele Gr&uuml;sse auch von &quot;the cat&quot; Elke aus Potsdam ;)</p>\n', '<p>Ich habe unter Images-&gt;Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,<br /><br />\nIch hoffe bei euch war der Weihnachtsmann auch so flei&szlig;ig wie bei mir.<br /><br />\nAllen Besuchern meiner Seite w&uuml;nsche ich gut reingerutscht zu sein und ein schÃƒÂ¶nes neues Jahr.</p><p>Viele Gr&uuml;&szlig;e aus BimÃƒÂ¶hlen, euer Asario.</p><p>Viele Gr&uuml;sse auch von …</p>\n', 'yz5d', 1, 1, 0, 'NEW_YEAR2.jpg', '2014-01-05 17:14:00', '2025-02-25 15:00:24'),
(40, 1, '2014-02-10 19:02:00', 'Neues Layout !', 1, 1, '<p>Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylem&auml;ssig erneuert.<br /><br />\nUnd eine Neue Galerie hat sich angefunden.<br /><br />\nMehr unter Images-&gt;Lampen</p>\n', '<p>Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylem&auml;ssig erneuert.<br /><br />\nUnd eine Neue Galerie hat sich angefunden.<br /><br />\nMehr unter Images-&gt;Lampen</p>\n', 'y4bd', 1, 1, 0, 'lampen.jpg', '2014-02-10 18:02:00', '2025-02-25 15:00:24'),
(41, 1, '2014-03-02 19:04:00', 'MCS v. 1.69 Online', 2, 1, '<p>Marble Content System wurde auf Version 1.69 aktualisiert.<br /><br />\nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen<br /><br />\nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugef&uuml;gt.<br /><br />\nAu&szlig;erdem wurde das Suchindex Script &uuml;berarbeitet sowie einige kleine Funktionen fanden den Weg ins 1.69er Release.<br /><br />\nWenn euch was auff&auml;llt schreibt mir auf www.mfx.marblefx.de/index.php?page=contact<br /><br />\nIch w&uuml;nsche euch viel Spass auf meinen Seiten.</p><p>Asario</p>\n', '<p>Marble Content System wurde auf Version 1.69 aktualisiert.<br /><br />\nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen<br /><br />\nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugef&uuml;gt.<br /><br />\nAu&szlig;erdem wurde das Suchindex Script &uuml;berarbeitet sowie einige kleine …</p>\n', 'y4ri', 1, 1, 0, '008.jpg', '2014-03-02 18:04:00', '2025-02-25 15:00:24'),
(42, 1, '2014-03-31 17:07:00', 'Ausstellung in Kaltenkirchen', 1, 1, '<p>Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃƒÂ¶ffnet. Bei ca. 40 geladenen G&auml;sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde &uuml;ber Kunst in der Psychatrie gesprochen sowie auf einzelne K&uuml;nstler eingegangen.</p><p>Die Ausstellung l&auml;uft noch 6 Wochen und es sind etliche K&uuml;nstler des Malerateliers zu sehen und auch zu Kaufen was &quot;wir&quot; alles so gemalt und kreiert haben.<br /><br />\nÃƒ-ffnungszeiten sind montags bis donnerstags von 8:30 Uhr bis 18 Uhr sowie freitags von 8:30 Uhr bis 16:00 Uhr</p><p>Von mir sind 3 Kunstwerke ausgestellt welche das sind seht Ihr wenn ihr da seid ;)<br /><br />\nVon Hier aus noch mal Danke an Chris die das alles mÃƒÂ¶glich gemacht hat.;)</p>\n', '<p>Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃƒÂ¶ffnet. Bei ca. 40 geladenen G&auml;sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde &uuml;ber Kunst in der Psychatrie gesprochen sowie auf einzelne K&uuml;nstler eingegangen.</p><p>Die Ausstellung l&auml;uft noch 6 Wochen und es sind …</p>\n', 'yayq', 1, 1, 0, 'ausstellung.png', '2014-03-31 15:07:00', '2025-02-25 15:00:24'),
(43, 1, '2014-04-13 17:35:00', 'Misteri&ouml;se Schatten werfen Ihr Licht auf uns....', 2, 1, '<p>Ich plane demn&auml;chst den n&auml;chsten großen Schritt auf meiner Website, so stay in Tuned and look out for new functions...</p><p>Alles geheim was ich hier mache...</p><p>Aber Ihr h&ouml;rt von mir wenn ich aus dem Urlaub zur&uuml;ck bin.</p>\n', '<p>Ich plane demn&auml;chst den n&auml;chsten großen Schritt auf meiner Website, so stay in Tuned and look out for new functions...</p><p>Alles geheim was ich hier mache...</p><p>Aber Ihr h&ouml;rt von mir wenn ich aus dem Urlaub zur&uuml;ck bin.</p>\n', 'yq29', 1, 1, 0, '008.jpg', '2014-04-13 15:35:00', '2025-02-25 15:00:24'),
(44, 1, '2014-04-27 17:36:00', 'Frohe Ostern... Der Osterhase war da!', 1, 1, '<p>Allen Besuchern w&uuml;nsche ich, frohe<br /><br />\nOstern gehabt zu haben, Ich habe 2<br /><br />\nneue Photos Hochgeladen.... viel<br /><br />\nSpa&szlig; damit euer Asario</p>\n', '<p>Allen Besuchern w&uuml;nsche ich, frohe<br /><br />\nOstern gehabt zu haben, Ich habe 2<br /><br />\nneue Photos Hochgeladen.... viel<br /><br />\nSpa&szlig; damit euer Asario</p>\n', 'y748', 1, 1, 0, 'easter.png', '2014-04-27 15:36:00', '2025-02-25 15:00:24'),
(45, 1, '2014-06-17 17:31:00', '3 neue Galerien', 1, 1, '<p>Ich erÃƒÂ¶ffne Hiermit die Galerien <strong>Alphabet</strong>, <strong>Monstarz</strong> und <strong>Photos3</strong><br /><br />\nhab eine Menge neuer Bilder hochgeladen, viel Spa&szlig; damit euer Asario.</p>\n', '<p>Ich erÃƒÂ¶ffne Hiermit die Galerien <strong>Alphabet</strong>, <strong>Monstarz</strong> und <strong>Photos3</strong><br /><br />\nhab eine Menge neuer Bilder hochgeladen, viel Spa&szlig; damit euer Asario.</p>\n', 'y8pt', 1, 1, 0, 'newgal.jpg', '2014-06-17 15:31:00', '2025-02-25 15:00:24'),
(46, 1, '2014-08-25 17:49:00', 'Bewertungsfunktion f&uuml;r Bilder.', 1, 1, '<p>Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.<br /><br />\nAlle Meine Bilder kÃƒÂ¶nnt Ihr bewerten und sehen wie Sie ankommen.<br /><br />\nViel Spa&szlig; damit, euer Asario</p>\n', '<p>Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.<br /><br />\nAlle Meine Bilder kÃƒÂ¶nnt Ihr bewerten und sehen wie Sie ankommen.<br /><br />\nViel Spa&szlig; damit, euer Asario</p>\n', 'ypqx', 1, 1, 0, 'starz.jpg', '2014-08-25 15:49:00', '2025-02-25 15:00:24'),
(47, 1, '2014-10-19 17:29:00', 'Mein neues Bike', 3, 1, '<p>Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.<br /><br />\nEs f&auml;hrt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gep&auml;cktr&auml;ger und Kunststoffschutzbleche sowie jede Menge Fahrspa&szlig; inklusive.</p><p>Ich bin Stolz auf dieses tolle Teil.</p>\n', '<p>Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.<br /><br />\nEs f&auml;hrt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gep&auml;cktr&auml;ger und Kunststoffschutzbleche sowie jede Menge Fahrspa&szlig; …</p>\n', 'y2v8', 1, 1, 0, 'Hubertus.JPG', '2014-10-19 15:29:00', '2025-02-25 15:00:24'),
(48, 1, '2014-10-25 16:14:00', 'MCS v. 1.70 released', 2, 1, '<p>Die Neueste MCS Version ist Nr. 1.70.<br /><br />\nIn diesem Release wurde einiges neu gemacht.<br /><br />\nDas File Upload Center hat ein gro&szlig;es Update erfahren, so das sich Uploads parallel ansto&szlig;en lassen.<br /><br />\nAusserdem hat man im File Upload Center die MÃƒÂ¶glichkeit den Fortschritt des Uploads zu sehen.<br /><br />\nMehr infos siehe Changelog<br /><br />\nIch hoffe Ihr habt eure Freude an diesem Release.</p>\n', '<p>Die Neueste MCS Version ist Nr. 1.70.<br /><br />\nIn diesem Release wurde einiges neu gemacht.<br /><br />\nDas File Upload Center hat ein gro&szlig;es Update erfahren, so das sich Uploads parallel ansto&szlig;en lassen.<br /><br />\nAusserdem hat man im File Upload Center die MÃƒÂ¶glichkeit den Fortschritt des Uploads zu sehen.<br /><br />\nMehr infos siehe Changelog  …</p>\n', 'yj58', 1, 1, 0, '008.jpg', '2014-10-25 14:14:00', '2025-02-25 15:00:24'),
(49, 1, '2014-11-02 14:33:00', 'New Images', 1, 1, '<p>Unter Images sind neue Bilder gesichtet worden,<br /><br />\nund eine neue Galerie wurde erÃƒÂ¶ffnet.<br /><br />\nDie Monstarnational Galerie mit Bildern vom Monstar in der gro&szlig;en weiten Welt.<br /><br />\nHoffe Ihr habt Spa&szlig; damit, Asario</p>\n', '<p>Unter Images sind neue Bilder gesichtet worden,<br /><br />\nund eine neue Galerie wurde erÃƒÂ¶ffnet.<br /><br />\nDie Monstarnational Galerie mit Bildern vom Monstar in der gro&szlig;en weiten Welt.<br /><br />\nHoffe Ihr habt Spa&szlig; damit, Asario</p>\n', 'yha7', 1, 1, 0, 'saurier.jpg', '2014-11-02 13:33:00', '2025-02-25 15:00:24'),
(50, 1, '2014-11-16 17:49:00', 'Mein erster Ritt...', 3, 1, '<p>In meinem Urlaub war ich das erste mal in meinem Leben &quot;selbst&auml;ndig&quot; Reiten,<br /><br />\nEs macht Irre Spa&szlig;, ist aber doch gewÃƒÂ¶hnungsbed&uuml;rftig sprich ich habe Respekt vor dem Tier.</p><p>Rispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃƒÂ¶rperspannung muss ich noch arbeiten.</p><p>PS: Reiten ist Geil ;)</p>\n', '<p>In meinem Urlaub war ich das erste mal in meinem Leben &quot;selbst&auml;ndig&quot; Reiten,<br /><br />\nEs macht Irre Spa&szlig;, ist aber doch gewÃƒÂ¶hnungsbed&uuml;rftig sprich ich habe Respekt vor dem Tier.</p><p>Rispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃƒÂ¶rperspannung muss ich noch arbeiten.</p><p>PS: Reiten ist Geil ;) …</p>\n', 'y57i', 1, 1, 0, 'Horseriding.jpg', '2014-11-16 16:49:00', '2025-02-25 15:00:24'),
(51, 1, '2014-12-05 18:30:00', 'Frohe Weihnachten und einen...', 1, 1, '<p>guten Rutsch ins neue Jahr.<br /><br />\nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.<br /><br />\nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein gro&szlig;es Event und viel Spa&szlig; f&uuml;r uns.<br /><br />\nIch w&uuml;nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.<br /><br />\nViele Gr&uuml;&szlig;e aus Bad Segeberg, BimÃƒÂ¶hlen und Potsdam, Asario</p>\n', '<p>guten Rutsch ins neue Jahr.<br /><br />\nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.<br /><br />\nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein gro&szlig;es Event und viel Spa&szlig; f&uuml;r uns.<br /><br />\nIch w&uuml;nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.<br /><br />\nViele Gr&uuml;&szlig;e aus Bad …</p>\n', 'yr0n', 1, 1, 0, 'coca2.jpg', '2014-12-05 17:30:00', '2025-02-25 15:00:24'),
(52, 1, '2015-03-20 17:49:00', 'Der Fr&uuml;hling kommt.', 1, 1, '<p>Wie Ihr auf dem Bild seht ist schon wieder alles Gr&uuml;n.<br /><br />\nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.<br /><br />\nIhr findet Sie wie immer &uuml;ber den Roten Button rechts oben auf dieser Seite.<br /><br />\nIch hoffe Ihr genie&szlig;t das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.</p><p>Ach ja, unter Mindblog gibt es ne Geschichte &uuml;ber mich und mein Leben.<br /><br />\nPart I ist Online, Part II kommt demn&auml;chst<br /><br />\nViele Gr&uuml;&szlig;e aus dem sonnigen BimÃƒÂ¶hlen, euer Asario</p>\n', '<p>Wie Ihr auf dem Bild seht ist schon wieder alles Gr&uuml;n.<br /><br />\nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.<br /><br />\nIhr findet Sie wie immer &uuml;ber den Roten Button rechts oben auf dieser Seite.<br /><br />\nIch hoffe Ihr genie&szlig;t das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.</p><p>Ach ja, unter …</p>\n', 'yle5', 1, 1, 0, 'spring2015.jpg', '2015-03-20 16:49:00', '2025-02-25 15:00:24'),
(53, 1, '2015-03-20 17:51:00', 'Asario\'s Geschichte Part I', 0, 1, '<p>Alles fing mit einem verkorksten 16. Geburtstag an.<br /><br />\nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.<br /><br />\nEs waren die Punks vom See mit Ihren Hunden.<br /><br />\nIch spielte mit den Hunden und kam ins Gespr&auml;ch-<br /><br />\nWir redeten &uuml;ber meinen Geburtstag und Sie fragten mich ob ich nicht mit in Ihre Kneipe kommen w&uuml;rde.<br /><br />\nIch sagte zu. Von da an war ich ÃƒÂ¶fter in der Kneipe. Es waren verst&auml;ndnisvolle Menschen die vÃƒÂ¶llig nat&uuml;rlich und nett waren. Ich f&uuml;hlte mich geborgen bei Ihnen.</p><p>Nicht so wie bei meinen Eltern, wo nur Ehe-Krach und Scheidungsstreitigkeiten an der Tagesordnung waren.<br /><br />\nWenn ein Mensch Geborgenheit sucht und nichts ausser zerr&uuml;tteter Verh&auml;ltnisse bekommt sucht man sich immer einen Ruhepol.<br /><br />\nDen hatte ich in dieser besagten Kneipe gefunden. Viele Hunde, nette Menschen und Party Party Party war das was ich da hatte.</p><p>Die Partys waren eine gute MÃƒÂ¶glichkeit mich abzulenken. Ich trank ein Paar Bier und schon ging es mir viel Besser.<br /><br />\nZwar war das Gef&uuml;hl nur f&uuml;r einen Moment vorhanden aber ich hatte meinen Spa&szlig;.</p><p>Meine Leistungen in der Schule gingen rapide Bergab. Ich hatte einfach keine Lust es meinen Eltern Recht zu machen und in der Schule aufzupassen.<br /><br />\nIch entwickelte mich immer mehr von einem guten Sch&uuml;ler zu einen Klassenclown.<br /><br />\nWIeso sollte ich meinem Traum vom Meeresbiologen denn weiter Tr&auml;umen wenn meine Eltern es nicht mal schaffen zusammenzuhalten ?</p><p>Ich war frustriert und Lustlos von all dem ganzen Zeug.<br /><br />\nNur meine Punkerfreunde waren f&uuml;r mich da und machten mir Mut das irgendwann Licht am Ende des Tunnels sei.</p><p>Ich hatte eine Zweite Familie gefunden.</p><p>to be continued</p>\n', '<p>Alles fing mit einem verkorksten 16. Geburtstag an.<br /><br />\nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.<br /><br />\nEs waren die Punks vom See mit Ihren Hunden.<br /><br />\nIch spielte mit den Hunden und kam ins Gespr&auml;ch-<br /><br />\nWir redeten &uuml;ber meinen Geburtstag und Sie fragten mich ob ich nicht mit …</p>\n', 'yjwu', 2, 1, 0, '008.jpg', '2015-03-20 16:51:00', '2025-02-25 15:00:24'),
(54, 1, '2015-03-20 17:55:00', 'MCS v. 1.72 Ver&ouml;fentlicht', 2, 1, '<p>Joa, hab mal wieder ne neue Version released.<br /><br />\nhinzugekommen sind:</p>\n<ul><br />\n<li>ein neues Anti Spam Modul</li>\n<li>Sicherheitsfunktionen die bei Erh&ouml;htem Aufkommen die Seite sperren.</li>\n<li>Signatureinstellungen automatisiert.</li>\n</ul><p>Au&szlig;erdem habe ich Fehler beseitigt im</p>\n<ul><br />\n<li>Benutzerprofil</li>\n<li>Meta Tags Scripts</li>\n<li>Searching Scripts</li>\n</ul><p>sowie mehrere kleine Bugs im System.</p>\n', '<p>Joa, hab mal wieder ne neue Version released.<br /><br />\nhinzugekommen sind:</p>\n<ul><br />\n<li>ein neues Anti Spam Modul</li>\n<li>Sicherheitsfunktionen die bei Erh&ouml;htem Aufkommen die Seite sperren.</li>\n<li>Signatureinstellungen automatisiert.</li>\n</ul><p>Au&szlig;erdem habe ich Fehler beseitigt im</p>\n<ul><br />\n<li>Benutzerprofil</li>\n<li>Meta Tags Scripts</li>\n<li>Searching …</li>\n</ul><br />\n', 'yo0x', 1, 1, 0, '008.jpg', '2015-03-20 16:55:00', '2025-02-25 15:00:24'),
(55, 1, '2015-05-05 16:16:00', 'Elke ist tod. :(', 1, 1, '<p>Leider mussten wir Elke unsere Admin Katze einschl&auml;fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.<br /><br />\nSie hatte schon immer einen leichten Schaden, nur weil es nicht besser wurde und meine Mutter mit Entz&uuml;ndingen schon des ÃƒÂ¶fteren bei Ãƒâ€žrzten war, lie&szlig;en wir Sie Einschl&auml;fern...<br /><br />\nR.I.P. Elke, wir denken an dich.</p>\n', '<p>Leider mussten wir Elke unsere Admin Katze einschl&auml;fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.<br /><br />\nSie hatte schon immer einen leichten Schaden, nur weil …</p>\n', 'yy7a', 1, 1, 0, 'elke_history.jpg', '2015-05-05 14:16:00', '2025-02-25 15:00:24'),
(56, 1, '2015-05-05 16:18:00', 'Neue BilderÃ‚Â²', 1, 1, '<p>Here we goooo.<br /><br />\nSind mal wieder 4 Bilder Hochgeladen worden...<br /><br />\nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).<br /><br />\nBei uns ist zur Zeit gutes Wetter was f&uuml;r mich hei&szlig;t Fahrradfahren.<br /><br />\nWerd mal zum Spa&szlig; meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme...<br /><br />\nW&uuml;nsche viel Spa&szlig; mit den Bildern...</p>\n', '<p>Here we goooo.<br /><br />\nSind mal wieder 4 Bilder Hochgeladen worden...<br /><br />\nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).<br /><br />\nBei uns ist zur Zeit gutes Wetter was f&uuml;r mich hei&szlig;t Fahrradfahren.<br /><br />\nWerd mal zum Spa&szlig; meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme... …</p>\n', 'ytq4', 1, 1, 0, 'easter_2015.jpg', '2015-05-05 14:18:00', '2025-02-25 15:00:24'),
(57, 1, '2015-07-05 16:19:00', 'Neue Fineliner Bilder gesichtet...', 1, 1, '<p>Unter Images-&gt;Fineliner7 wurden neue Bilder gesichtet.<br /><br />\nHope you enjoy the Ride ;)</p>\n', '<p>Unter Images-&gt;Fineliner7 wurden neue Bilder gesichtet.<br /><br />\nHope you enjoy the Ride ;)</p>\n', 'yph0', 1, 1, 0, 'dragon.jpg', '2015-07-05 14:19:00', '2025-02-25 15:00:24'),
(58, 1, '2015-07-19 17:21:00', 'Shopping Tour in Neum&uuml;nster', 3, 1, '<p>waren am Samstag Shoppen in der Innenstadt von Neum&uuml;nster und ich hab mir ein Paar neue Sneakers gekauft.<br /><br />\nL&auml;uft sich gut in den Schuhen...</p><p>Anbei ein Photo der Schuhe.<br /><br />\nstay in tuned, Asario</p>\n', '<p>waren am Samstag Shoppen in der Innenstadt von Neum&uuml;nster und ich hab mir ein Paar neue Sneakers gekauft.<br /><br />\nL&auml;uft sich gut in den Schuhen...</p><p>Anbei ein Photo der Schuhe.<br /><br />\nstay in tuned, Asario</p>\n', 'ypew', 1, 1, 0, 'new_shoes.jpg', '2015-07-19 15:21:00', '2025-02-25 15:00:24'),
(59, 1, '2015-08-04 16:13:00', 'Haare AB!', 3, 1, '<p>Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.<br /><br />\nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.</p><p>Endlich wieder ohne Schmerzen k&auml;mmen und mehr Substanz.<br /><br />\nNaja, muss man sich noch dran gewÃƒÂ¶hnen... ;)<br /><br />\nAber es sieht schon besser aus.</p>\n', '<p>Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.<br /><br />\nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.</p><p>Endlich wieder ohne Schmerzen k&auml;mmen und mehr Substanz.<br /><br />\nNaja, muss man sich noch dran gewÃƒÂ¶hnen... ;)<br /><br />\nAber es sieht schon besser aus. …</p>\n', 'ycvp', 1, 1, 0, 'haircut.jpg', '2015-08-04 14:13:00', '2025-02-25 15:00:24'),
(60, 1, '2015-08-30 18:26:00', 'Ricklinger Jahresfest 2015', 1, 1, '<p>Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.<br /><br />\nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.<br /><br />\nW&uuml;nsche viel Spa&szlig; mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.</p><p>also bis Sonntag, euer Asario</p>\n', '<p>Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.<br /><br />\nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.<br /><br />\nW&uuml;nsche viel Spa&szlig; mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.</p><p>also bis Sonntag, euer Asario …</p>\n', 'yjgd', 1, 1, 0, 'jahresfest.jpg', '2015-08-30 16:26:00', '2025-02-25 15:00:24'),
(61, 1, '2015-09-06 17:29:00', 'MCS v. 1.85 ist eingetroffen....', 2, 1, '<p>Mal wieder wurde MCS erneuert.<br /><br />\nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.<br /><br />\nEinige Formularelemente wurden mit Material Design aktualisiert.<br /><br />\nDazu kommen noch etliche Bugfixes in mehreren Komponenten.</p><p>Hinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien zum Hochladen in die Update Ordner zu schieben.</p><p>Au&szlig;erdem ist ein interner Chat entstanden.</p><p>w&uuml;nsche viel Spa&szlig; mit MCS v. 1.85 ;)<br /><br />\nPS.: Momentan arbeite ich an der Integration von JQuery UI Elementen in das Admin Center.<br /><br />\nsee you soon, Paule aka Asario</p>\n', '<p>Mal wieder wurde MCS erneuert.<br /><br />\nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.<br /><br />\nEinige Formularelemente wurden mit Material Design aktualisiert.<br /><br />\nDazu kommen noch etliche Bugfixes in mehreren Komponenten.</p><p>Hinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien …</p>\n', 'ym1n', 1, 1, 0, '008.jpg', '2015-09-06 15:29:00', '2025-02-25 15:00:24'),
(62, 1, '2015-09-15 16:44:00', 'Neue Shortstories', 1, 1, '<p>Hab mal wieder nen paar Shortstories<br /><br />\nhochgeladen. Ich will mal hoffen das<br /><br />\neuch die gefallen.<br /><br />\nPS: JQuery UI h&auml;lt Einzug in MCS. weitere Infos demn&auml;chst im Devlog.</p>\n', '<p>Hab mal wieder nen paar Shortstories<br /><br />\nhochgeladen. Ich will mal hoffen das<br /><br />\neuch die gefallen.<br /><br />\nPS: JQuery UI h&auml;lt Einzug in MCS. weitere Infos demn&auml;chst im Devlog.</p>\n', 'yd8i', 1, 1, 0, 'short_st.jpg', '2015-09-15 14:44:00', '2025-02-25 15:00:24'),
(63, 1, '2015-10-04 18:03:00', 'Neuerungen dank JQuery UI', 2, 1, '<p>JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.</p><p>Ist irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz sch&ouml;ner Krampf die Tabs einzubauen.<br /><br />\nIch musste alles was auf einzelnen extra Seiten war auf eine Seite reduzieren und die Verlinkung anpassen.</p><p>Aber alles in allem hat es sich gelohnt. Sieht Jetzt Stylischer aus und geht alles sehr viel schneller.<br /><br />\nHab nat&uuml;rlich beim proggen etliche Bugs verursacht die ich m&uuml;hsam finden und beseitigen musste.</p><p>Ein nettes Schmankerl ist auch die neue Shortstories Seite.</p><p>aber jetzt m&uuml;sste eigentlich alles funken. wenn euch noch was auff&auml;llt schreibt mir ne PM oder mailt mir einfach &uuml;ber das Mailformular.</p><p>Ach ja, Die Hilfe Seite hab ich komplett neu geschrieben und dabei ca. 80 Zeilen Code eingespart. Klingt nicht nach viel aber bei einem Vergleichsweise kleinem Script ist das schon ne Menge.</p><p>PS: In den Privaten Nachrichten sind Smilies mit dabei.</p><p>Bis Bald Asario.</p>\n', '<p>JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.</p><p>Ist irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz sch&ouml;ner Krampf die Tabs einzubauen.<br /><br />\nIch musste alles was auf einzelnen extra Seiten war auf …</p>\n', 'y5hp', 1, 1, 0, '008.jpg', '2015-10-04 16:03:00', '2025-02-25 15:00:24'),
(64, 1, '2015-10-13 16:50:00', 'JQuery UI integrated', 1, 1, '<p>Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.<br /><br />\nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.<br /><br />\nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.<br /><br />\nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.<br /><br />\nAnsonsten ist noch alles Banane in Big Bad Bottermilk BimÃƒÂ¶hlen.</p>\n', '<p>Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.<br /><br />\nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.<br /><br />\nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.<br /><br />\nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.<br /><br />\nAnsonsten …</p>\n', 'ymq1', 1, 1, 0, 'jquery.jpg', '2015-10-13 14:50:00', '2025-02-25 15:00:24'),
(65, 1, '2015-10-27 17:00:00', 'Die Kundenzufriedenheitsumfrage ;)', 3, 1, '<p>Ich will von euch wissen was euch auf meiner Seite fehlt.<br /><br />\nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?<br /><br />\nHabt ihr ne Idee f&uuml;r meine Seite ?<br /><br />\nSoll ich einen Chat programmieren oder doch nen G&auml;stebuch integrieren ?<br /><br />\nIhr entscheidend was ich einbaue.<br /><br />\nOder solls vielleicht ne Shoutbox sein ?</p><p>IDEEN RAN, ABER FLOTT ;)</p>\n', '<p>Ich will von euch wissen was euch auf meiner Seite fehlt.<br /><br />\nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?<br /><br />\nHabt ihr ne Idee f&uuml;r meine Seite ?<br /><br />\nSoll ich einen Chat programmieren oder doch nen G&auml;stebuch integrieren ?<br /><br />\nIhr entscheidend was ich einbaue.<br /><br />\nOder solls …</p>\n', 'yfo5', 1, 1, 0, '008.jpg', '2015-10-27 16:00:00', '2025-02-25 15:00:24'),
(66, 1, '2015-10-27 17:02:00', 'Neues Kleid f&uuml;r alte Ger&uuml;ste.', 1, 1, '<p>Jetzt erstrahlt auch die Startseite in freundlichen Orange.<br /><br />\nIch habe einen &uuml;blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.<br /><br />\nIch hoffe alles funktioniert jetzt so wie gew&uuml;nscht.<br /><br />\nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.<br /><br />\nIch hoffe Ihr genie&szlig;t den &quot;Ritt&quot; auf der AB Welle ;)<br /><br />\nSincerly Yours Asario</p>\n', '<p>Jetzt erstrahlt auch die Startseite in freundlichen Orange.<br /><br />\nIch habe einen &uuml;blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.<br /><br />\nIch hoffe alles funktioniert jetzt so wie gew&uuml;nscht.<br /><br />\nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.<br /><br />\nIch hoffe Ihr genie&szlig;t den …</p>\n', 'y452', 1, 1, 0, 'sar.jpg', '2015-10-27 16:02:00', '2025-02-25 15:00:24');
INSERT INTO `blogs` (`id`, `pub`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `autoslug`, `reading_time`, `markdown_on`, `xis_aiImage`, `image_path`, `created_at`, `updated_at`) VALUES
(67, 1, '2015-11-24 18:37:00', 'Meine Karriere zum freiwilligen Webdesigner und die Zunkunft...', 3, 1, '<p>Alles fing im Informatikunterricht in der 9./10. Klasse an.<br /><br />\nWir lernten das Erstellen von Websites mit Microsoft Frontpage.<br /><br />\nIch war sofort begeistert wie einfach man Websites erstellen kann.<br /><br />\nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.<br /><br />\nPHP ist eine einfach zu erlernende Scriptsprache die meine Ideen aufsog wie ein nasser Schwamm.</p><p>Nach einigen Jahren Programmiererfahrung entstand MCS, mein noch heute im Einsatz befindliches System, das <strong>Marble Content System</strong><br /><br />\nEine Vorlagen Engine sowie eine umfangreiche Administration entstanden in den darauffolgenden Jahren.<br /><br />\nMittlerweile ist alles vom Portal bis zur Web-Visitenkarte machbar.<br /><br />\nIch integrierte etliches n&uuml;tzliches aus meiner C\'t und bin immer noch am Arbeiten, neue Module zu erfinden bzw. alte zu verbessern</p><p>Im Admin Center geht es los. Inhalte Einpflegen, Tabelleneinstellungen, Vorlagen Einstellungen, Benutzerprofile, Benutzerinhalte, Benutzergruppen und Rechte,<br /><br />\nNewsletter, Kontakte, Kalender, Private Nachrichten uvm.</p><p>Momentan habe ich 3 Javascript Frameworks installiert, die Entweder aufh&uuml;bschen oder Funktionen nachr&uuml;sten.<br /><br />\nJQuery UI, Foundation, Material Framework sind bei mir auf der ein oder anderen MCS-Seite installiert.</p><p>Momentan l&auml;uft MCS auf 8 Webseiten in meinem Webspace.</p><p>Viele fragen sich, warum das Rad neu erfinden? Ich meine Wordpress, Typo3 oder Drupal k&ouml;nnen doch auch alles.<br /><br />\nDoch selbst ein &auml;lteres Mambo hat 60% Mehr Code als MCS<br /><br />\nEngines wie Smarty die mal eben 6000 Zeilen Code fressen wollte ich nicht integrieren.<br /><br />\nmeine Vorlagen Engine hat mit 474 Zeilen weniger Gewicht als Hochgez&uuml;chtete CMS\'es und ist dennoch funktional.</p><p>Der Vorteil an MCS ist dass man die HTML Vorlagen mit einem Wysiwyg Editor komplett erstellen kann weil sie reines HTML sind.<br /><br />\nAngereichert mit in PHP geschriebenen Modulen und Funktionen sind sie hochdynamisch und schnell.<br /><br />\nWollt Ihr/ Willst du schon immer eine eigene Website haben wo du dich &uuml;ber dein Hobby oder dein Lieblingsthema auslassen willst so schreib mir doch &uuml;ber das <a href=\"kontakt\">Kontaktformular</a> falls du eine interessante Idee f&uuml;r eine Homepage hast. Ich freue mich &uuml;ber jede Anregung oder Idee.</p><p>Forum, Chat, Shoutbox, Kommentare, G&auml;steb&uuml;cher sowie Bildergalerien, Texte, Fotos, Suchfunktion, RSS Stream, Smartphone Unterst&uuml;tzung uvm, wurden bereits Entwickelt und in MCS integriert. Wenn dir auch f&uuml;r meine Seite eine Idee einf&auml;llt schreib mir &uuml;ber das <a href=\"kontakt\">Kontakformular</a></p><p>MCS is ready to Launch.</p>\n', '<p>Alles fing im Informatikunterricht in der 9./10. Klasse an.<br /><br />\nWir lernten das Erstellen von Websites mit Microsoft Frontpage.<br /><br />\nIch war sofort begeistert wie einfach man Websites erstellen kann.<br /><br />\nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.<br /><br />\nPHP ist eine einfach zu …</p>\n', 'yhlm', 2, 1, 0, '008.jpg', '2015-11-24 17:37:00', '2025-02-25 15:00:24'),
(68, 1, '2015-12-18 19:17:00', 'Neue Galerie und einige nette Details', 1, 1, '<p>Habe eine neue Galerie mit Zentangles erstellt.<br /><br />\nDa findet Ihr meine Fortschritte beim Tanglen.<br /><br />\nAu&szlig;erdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.<br /><br />\nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gek&uuml;rzt aufgezeichnet werden.<br /><br />\nPiwik ist ein Statistiktool zum Auswerten der Besuche auf dem Server.<br /><br />\nIhr kÃƒÂ¶nnt jederzeit &uuml;ber die fx_lxk(index.php?page=datenschutz|||Datenschutz) Einstellungen das Tracking deaktivieren.<br /><br />\nDie Statistischen Daten dienen der Verbesserung des Angebotes und sind Indikatoren f&uuml;r BesucherstrÃƒÂ¶me.<br /><br />\nW&uuml;nsche viel Spa&szlig; mit meinen Seiten, In Liebe, Asario</p>\n', '<p>Habe eine neue Galerie mit Zentangles erstellt.<br /><br />\nDa findet Ihr meine Fortschritte beim Tanglen.<br /><br />\nAu&szlig;erdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.<br /><br />\nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gek&uuml;rzt aufgezeichnet werden.  …</p>\n', 'yusr', 1, 1, 0, 'daimkon.jpg', '2015-12-18 18:17:00', '2025-02-25 15:00:24'),
(69, 1, '2016-01-03 17:15:00', 'Happy New Year', 1, 1, '<p>Ich w&uuml;nsche allen Besuchern gut reingerutscht zu sein.<br /><br />\nIch hoffe Ihr habt nicht zu viel Zugenommen &uuml;ber die Feiertage und seit gut reingerutscht<br /><br />\nNat&uuml;rlich hoffen wir das wir alle Gesund bleiben,<br /><br />\nund Erfolg im Beruf haben sowie das dieses ein gl&uuml;ckliches Jahr wird</p>\n', '<p>Ich w&uuml;nsche allen Besuchern gut reingerutscht zu sein.<br /><br />\nIch hoffe Ihr habt nicht zu viel Zugenommen &uuml;ber die Feiertage und seit gut reingerutscht<br /><br />\nNat&uuml;rlich hoffen wir das wir alle Gesund bleiben,<br /><br />\nund Erfolg im Beruf haben sowie das dieses ein gl&uuml;ckliches Jahr wird</p>\n', 'yl6i', 1, 1, 0, 'sylv_2015_2016.jpg', '2016-01-03 16:15:00', '2025-02-25 15:00:24'),
(70, 1, '2016-01-15 18:10:00', '2 neue Galerien gefunden', 1, 1, '<p>Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃƒÂ¶ffentlicht.<br /><br />\nIn der Galerie Photos4 findet Ihr meine neusten Fotos.<br /><br />\nBei der 2ten Galerie dreht sich alles um Fasermalerbilder<br /><br />\nStÃƒÂ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich f&uuml;ge demn&auml;chst neue Bilder hinzu.<br /><br />\nIch mÃƒÂ¶chte noch mal auf Mindblog hinweisen wo Ihr Mitspracherecht bekommt was Ihr euch f&uuml;r 2016 von mir W&uuml;nscht.</p><p>Also bis bald, Asario</p>\n', '<p>Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃƒÂ¶ffentlicht.<br /><br />\nIn der Galerie Photos4 findet Ihr meine neusten Fotos.<br /><br />\nBei der 2ten Galerie dreht sich alles um Fasermalerbilder<br /><br />\nStÃƒÂ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich f&uuml;ge demn&auml;chst neue Bilder hinzu.<br /><br />\nIch mÃƒÂ¶chte …</p>\n', 'ypwl', 1, 1, 0, '07new_noname.jpg', '2016-01-15 17:10:00', '2025-02-25 15:00:24'),
(71, 1, '2016-02-09 18:55:00', 'Neue Domain Verf&uuml;gbar.', 1, 1, '<p>An alle Fans hier der Tipp des Jahres:<br /><br />\nwww.asario.de statt ab.marblefx.de.<br /><br />\nAlso noch mal zum Mitschreiben www.asario.de ist Online ......</p><p>W&uuml;nsche viel Spa&szlig; auf meiner Seite.</p>\n', '<p>An alle Fans hier der Tipp des Jahres:<br /><br />\nwww.asario.de statt ab.marblefx.de.<br /><br />\nAlso noch mal zum Mitschreiben www.asario.de ist Online ......</p><p>W&uuml;nsche viel Spa&szlig; auf meiner Seite.</p>\n', 'y68o', 1, 1, 0, '05new_noname.jpg', '2016-02-09 17:55:00', '2025-02-25 15:00:24'),
(72, 1, '2016-04-01 16:43:00', 'Ich habe 4 neue Bilder gemalt', 1, 1, '<p>Ihr findet Sie unter <a href=\"index.php?page=images&amp;action=cat&amp;id=21\">Images-&gt;Fasermaler</a> sowie unter <a href=\"index.php?page=images&amp;action=cat&amp;id=17\">Images-&gt;Fineliner7</a>.<br /><br />\nW&uuml;nsche viel Spa&szlig; mit den Bildern.<br /><br />\nmfg Asario</p>\n', '<p>Ihr findet Sie unter <a href=\"index.php?page=images&amp;action=cat&amp;id=21\">Images-&gt;Fasermaler</a> sowie unter <a href=\"index.php?page=images&amp;action=cat&amp;id=17\">Images-&gt;Fineliner7</a>.<br /><br />\nW&uuml;nsche viel Spa&szlig; mit den Bildern.<br /><br />\nmfg Asario</p>\n', 'ysql', 1, 1, 0, 'faser2.jpg', '2016-04-01 14:43:00', '2025-02-25 15:00:24'),
(73, 1, '2016-05-17 16:16:00', 'Neues Wallpaper', 1, 1, '<p>Ein neues Wallpaper wurde unter Images-&gt;Digital gesichtet.<br /><br />\nAusserdem wurde das Upload Script &uuml;berarbeitet.<br /><br />\nMehr dazu demn&auml;chst im Changelog und unter Devlog.</p>\n', '<p>Ein neues Wallpaper wurde unter Images-&gt;Digital gesichtet.<br /><br />\nAusserdem wurde das Upload Script &uuml;berarbeitet.<br /><br />\nMehr dazu demn&auml;chst im Changelog und unter Devlog.</p>\n', 'yv0i', 1, 1, 0, 'asario.de.jpg', '2016-05-17 14:16:00', '2025-02-25 15:00:24'),
(74, 1, '2016-05-24 16:50:00', 'MCS Version 1.98 erschienen', 2, 1, '<p>Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.</p>\n<ol><br />\n<li>Semantische Tags wurden eingef&uuml;hrt, basierend auf dem Suchindex.</li>\n<li>Countpixel zur Besucheranalyse wurden integriert.</li>\n<li>Sitemap wurde eingebaut und auf einigen Seiten aktiviert.</li>\n<li>Bilderupload Script wurde um StandardgrÃƒÂ¶&szlig;en f&uuml;r einzelne Galerien erweitert,<br /><br />\nd.h. je nach gew&auml;hlter Galerie sind unterschiedliche StandardgrÃƒÂ¶&szlig;en einstellbar</li>\n</ol><br />\n', '<p>Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.</p>\n<ol><br />\n<li>Semantische Tags wurden eingef&uuml;hrt, basierend auf dem Suchindex.</li>\n<li>Countpixel zur Besucheranalyse wurden integriert.</li>\n<li>Sitemap wurde eingebaut und auf einigen Seiten aktiviert.</li>\n<li>Bilderupload Script wurde um StandardgrÃƒÂ¶&szlig;en f&uuml;r …</li>\n</ol><br />\n', 'y5qo', 1, 1, 0, '008.jpg', '2016-05-24 14:50:00', '2025-02-25 15:00:24'),
(75, 1, '2016-06-14 17:04:00', 'Diverse neue Bilder', 1, 1, '<p>Ich habe mal wieder Bilder hochgeladen.<br /><br />\nIhr findet die Objekte unter <a href=\"index.php?page=images\">Images</a><br /><br />\nIch w&uuml;nsche euch viel Spa&szlig; damit.<br /><br />\nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.<br /><br />\nIch w&uuml;nsche euch viel Spa&szlig; auf meiner Seite.<br /><br />\nBis bald, Asario.</p>\n', '<p>Ich habe mal wieder Bilder hochgeladen.<br /><br />\nIhr findet die Objekte unter <a href=\"index.php?page=images\">Images</a><br /><br />\nIch w&uuml;nsche euch viel Spa&szlig; damit.<br /><br />\nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.<br /><br />\nIch w&uuml;nsche euch viel Spa&szlig; …</p>\n', 'ykp0', 1, 1, 0, 'dune2016.jpg', '2016-06-14 15:04:00', '2025-02-25 15:00:24'),
(76, 1, '2016-06-28 16:57:00', 'MCS Version 2.01', 2, 1, '<p>Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,<br /><br />\nAlles im Sinne von 2.01 ;)<br /><br />\nW&uuml;nsche viel Spass, Asario</p>\n', '<p>Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,<br /><br />\nAlles im Sinne von 2.01 ;)<br /><br />\nW&uuml;nsche viel Spass, Asario …</p>\n', 'yhpt', 1, 1, 0, '11new_noname.jpg', '2016-06-28 14:57:00', '2025-02-25 15:00:24'),
(77, 1, '2016-07-04 15:12:00', 'Neuerungen in MCS 2.01', 2, 1, '<p>Es ist mal wieder was von der MCS Front zu berichten.<br /><br />\nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,<br /><br />\nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.<br /><br />\nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die Verkn&uuml;pfung<br /><br />\nder Bilder erneuern/reparieren.<br /><br />\nEben ist mir bzw Mumbo ein Fehler beim PM Script aufgefallen den ich ebenso gefixt hab.<br /><br />\nSinn und zweck der Kanonischen URL\'s ist es den Seitennamen zu vereinfachen/zu verk&uuml;rzen.<br /><br />\nSo wird aus www.asario.de/index.php?page=news -&gt; www.asario.de/news was f&uuml;r Suchmaschinen<br /><br />\nideal ist und auch leichter zu merken ist.<br /><br />\nBin zwar noch nicht zufrieden mit den Kanonischen URL\'s aber da f&auml;llt mir auch noch was ein.<br /><br />\nHoffe Ihr habt Spa&szlig; auf meinen Seiten...<br /><br />\nin Love Asario</p>\n', '<p>Es ist mal wieder was von der MCS Front zu berichten.<br /><br />\nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,<br /><br />\nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.<br /><br />\nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die …</p>\n', 'y5nu', 1, 1, 0, '008.jpg', '2016-07-04 13:12:00', '2025-02-25 15:00:24'),
(78, 1, '2016-07-08 18:14:00', 'Burzeltach und seine Folgen...', 3, 1, '<p>Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.<br /><br />\nund habe mir selber ein gro&szlig;es Geschenk gemacht.<br /><br />\nIch habe eine nicht nennenswerte Summe Geld investiert und<br /><br />\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)<br /><br />\nAuf dem Foto ist hoffentlich mein 2tes gro&szlig;es Geschenk zu sehen.<br /><br />\nEin Pinsel-Set zum professionellem Malen im Maleratelier und bei mir zu Hause.<br /><br />\nDemn&auml;chst ist Mighty Crab Online (Unter <a href=\"ausgemaltes\">www.asario.de/ausgemaltes</a> bald zu sehen)<br /><br />\nDenn das Zen-Color Buch von meiner Schwester ist mit guten Motiven gespickt, so das ich hin und wieder mal was ausmale und unter <a href=\"ausgemaltes\">Images-&gt;Ausgemaltes</a> ver&ouml;ffentliche.</p>\n', '<p>Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.<br /><br />\nund habe mir selber ein gro&szlig;es Geschenk gemacht.<br /><br />\nIch habe eine nicht nennenswerte Summe Geld investiert und<br /><br />\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)<br /><br />\nAuf dem Foto ist hoffentlich mein 2tes gro&szlig;es Geschenk zu …</p>\n', 'yho5', 1, 1, 0, 'Desk-Star-Painter.jpg', '2016-07-08 16:14:00', '2025-02-25 15:00:24'),
(79, 1, '2016-07-08 18:16:00', 'Asario\'s Geschichte Part II', 0, 1, '<p>So da wÃƒÆ’Ã‚Â¤ren wir nun.<br /><br />\nWir haben eine zerÃƒÆ’Ã‚Â¼ttet Familie, ein Haufen Chaoten und jede Menge Party.<br /><br />\nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.<br /><br />\nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.</p><p>Ich fing eine Ausbildung zum Kaufmann fÃƒÆ’Ã‚Â¼r Audiovisuelle Medien an und nach 1,5 Jahren ging ich nicht mehr hin, weil mir alles zu viel wurde.<br /><br />\nIrgendwann quartierte mich meine Mutter aus und ich zog in ein Neubauviertel in Potsdam.</p><p>Nach anderthalb Jahren im &quot;RattenkÃƒÆ’Ã‚Â¤fig&quot; fing bei mir alles an sich zu ÃƒÆ’Ã‚Â¤ndern. Ich bekam komische Nachrichten per Telepathie und zog mich immer weiter ZurÃƒÆ’Ã‚Â¼ck.<br /><br />\nIn Wahrheit bekam ich eine Psychose und wurde Psychisch Krank.</p><p>Schizophrenie die Diagnose der ÃƒÆ’Ã¢â‚¬Å¾rzte schockte mich schon ganz schÃƒÆ’Ã‚Â¶n.<br /><br />\nDie ersten Jahre mit der Krankheit dachte ich ich wÃƒÆ’Ã‚Â¤hr gesund nur irgendwann wurde mir klar das man diese Krankheit zwar beherrschen aber nicht heilen kann.</p><p>So nun bin ich halt krank, na und ?<br /><br />\nIch versuche das Beste draus zu machen und bin seit ein paar Jahren ziemlich stabil.</p><p>to be continued...</p>\n', '<p>So da wÃƒÆ’Ã‚Â¤ren wir nun.<br /><br />\nWir haben eine zerÃƒÆ’Ã‚Â¼ttet Familie, ein Haufen Chaoten und jede Menge Party.<br /><br />\nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.<br /><br />\nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.</p><p>Ich fing eine Ausbildung zum …</p>\n', 'yjeh', 1, 1, 0, '008.jpg', '2016-07-08 16:16:00', '2025-02-25 15:00:24'),
(80, 1, '2016-08-24 08:20:00', 'Neue Galerie vorhanden.', 1, 1, '<p>Ich habe ja wie bereits erw&auml;hnt ein Ausmalbuch &quot;Zen Colour Ocean&quot; zum Geburtstag<br /><br />\nbekommen. Hier und jetzt kÃƒÂ¶nnt Ihr meine Werke bewundern.<br /><br />\nViel Spa&szlig;, Asario</p>\n', '<p>Ich habe ja wie bereits erw&auml;hnt ein Ausmalbuch &quot;Zen Colour Ocean&quot; zum Geburtstag<br /><br />\nbekommen. Hier und jetzt kÃƒÂ¶nnt Ihr meine Werke bewundern.<br /><br />\nViel Spa&szlig;, Asario</p>\n', 'y7s4', 1, 1, 0, 'Zen_Coloured.jpg', '2016-08-24 06:20:00', '2025-02-25 15:00:24'),
(81, 1, '2016-10-08 18:07:00', 'Neuerungen unter der Haube', 2, 1, '<p>Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.<br /><br />\nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.<br /><br />\nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte ver&auml;ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen Webspace.<br /><br />\nSomit muss ich mich nicht mit Datenbank Dumps rum&auml;rgern und habe alle Seiten immer aktuell. Momentan schraube ich noch am RSS-Feed, der irgendwie noch nicht mit dem Sync-Client kompatibel scheint.<br /><br />\nAber gut ding will Weile haben, oder wie man auch sagt: Was lange Wert, wird endlich gut.<br /><br />\nIn diesem Sinne, Have Fun Folks.</p>\n', '<p>Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.<br /><br />\nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.<br /><br />\nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte ver&auml;ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen …</p>\n', 'y1cm', 1, 1, 0, '17new_noname.jpg', '2016-10-08 16:07:00', '2025-02-25 15:00:24'),
(82, 1, '2016-12-19 17:24:00', 'Merry X-Mas', 1, 1, '<p>Ich w&uuml;nsche allen Fans ein besinnliches und schÃƒÂ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im n&auml;chsten Jahr alles Gl&uuml;ck der Welt haben und Fit sind wie im Letzten Jahr.</p><p>Viele Gr&uuml;&szlig;e aus BimÃƒÂ¶hlen, Berlin und Potsdam w&uuml;nscht euer Asario.</p>\n', '<p>Ich w&uuml;nsche allen Fans ein besinnliches und schÃƒÂ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im n&auml;chsten Jahr alles Gl&uuml;ck der Welt haben und Fit sind wie im Letzten Jahr.</p><p>Viele Gr&uuml;&szlig;e aus BimÃƒÂ¶hlen, Berlin und Potsdam w&uuml;nscht euer Asario. …</p>\n', 'y3ek', 1, 1, 0, 'xmas2k16._4.jpg', '2016-12-19 16:24:00', '2025-02-25 15:00:24'),
(83, 1, '2017-01-25 08:37:00', 'Big Exceptions', 1, 1, '<p>Die Erwartung ist gro&szlig;, ich hoffe sie entt&auml;uscht euch nicht.<br /><br />\nHab mal wieder was ausgemalt, zu finden unter Images-&gt;Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demn&auml;chst hier reinflattern wird.<br /><br />\nich hoffe Ihr mÃƒÂ¶gt Quallen, denn mein aktuellstes Werk hei&szlig;t Jellyfish, hat aber im Grunde genommen keine Ãƒâ€žhnlichkeit mit einer Qualle.<br /><br />\nAch ja, vielleicht ist es euch schon Aufgefallen, Ich habe ein paar Layout Ãƒâ€žnderungen unter <strong>Images</strong>, <strong>Devlog</strong>, <strong>Mindblog</strong> und <strong>Shortstories</strong> vorgenommen. Ich hoffe Ihr mÃƒÂ¶gt es..<br /><br />\nPS: Die Bewertung von Bildern habe ich etwas ver&auml;ndert, aber lasst euch davon nicht abschrecken zu Voten...<br /><br />\nAch ja, bevor ichs vergesse, MCS wurde auf Version 2.15 gepatcht.<br /><br />\nenjoy the ride, Asario</p>\n', '<p>Die Erwartung ist gro&szlig;, ich hoffe sie entt&auml;uscht euch nicht.<br /><br />\nHab mal wieder was ausgemalt, zu finden unter Images-&gt;Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demn&auml;chst hier reinflattern wird.<br /><br />\nich hoffe Ihr mÃƒÂ¶gt Quallen, denn mein aktuellstes Werk hei&szlig;t Jellyfish, hat aber im …</p>\n', 'yf80', 1, 1, 0, 'jelly.jpg', '2017-01-25 07:37:00', '2025-02-25 15:00:24'),
(84, 1, '2017-01-25 10:17:00', 'MCS Version 2.15', 2, 1, '<p>Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.<br /><br />\nMCS 2.15 wurde verÃƒÂ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.<br /><br />\nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.<br /><br />\nGoogle mein Freund ist flei&szlig;ig am Crawlen der Seiten. Au&szlig;erdem hab ich einige kleinere Updates vorgenommen. Unter anderem habe ich ein paar Bugs im Synchro-Tool beseitigt.<br /><br />\nIch muss demn&auml;chst noch die RSS-Feeds kontrollieren, hab dazu bis jetzt noch keine Zeit gehabt.<br /><br />\nAuch dieses mal w&uuml;nsche ich eine schÃƒÂ¶ne Zeit in meinem Blog.<br /><br />\nmfg Asario</p>\n', '<p>Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.<br /><br />\nMCS 2.15 wurde verÃƒÂ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.<br /><br />\nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.<br /><br />\nGoogle mein Freund ist flei&szlig;ig am Crawlen der Seiten. Au&szlig;erdem hab ich einige …</p>\n', 'y2co', 1, 1, 0, '008.jpg', '2017-01-25 09:17:00', '2025-02-25 15:00:24'),
(85, 1, '2017-01-29 14:48:00', 'MCS Points - die Smarte W&auml;hrung', 1, 1, '<p>Ab jetzt könnt ihr als registrierte Benutzer satte Prämien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. Für jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen könnt. Ihr erhaltet signierte original Kunstwerke für eure Butze oder zum Verschenken.</p><p>fx_premium_table()</p>\n', '<p>Ab jetzt könnt ihr als registrierte Benutzer satte Prämien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. Für jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen könnt. Ihr erhaltet signierte original Kunstwerke für …</p>\n', 'y80y', 1, 1, 0, '153new_noname.jpg', '2017-01-29 13:48:00', '2025-02-25 15:00:24'),
(86, 1, '2017-02-19 12:37:00', 'Meine Privaten News', 3, 1, '<p>Ich &uuml;berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / m&ouml;chte.<br /><br />\nMeine Grafikkarte r&ouml;hrt seit einigen Wochen, ich werde sie wohl ersetzen m&uuml;ssen.<br /><br />\nDiesmal wird es wohl eine karte von NVIDIA sein.<br /><br />\nschon falls ich es doch noch mal schaffe mich an Linux zu gew&ouml;hnen.<br /><br />\nAu&szlig;erdem sind die Nvidia Karten Sparsamer was den Energieverbrauch angeht.<br /><br />\nWird wohl ne GF1060 werden. Mein Kollege Mumbo hat mir die schon empfohlen.<br /><br />\nNun ja Eine neue Grafikkarte soll auch 4k-F&auml;hig sein, falls ich mir noch nen 4k Monitor holen will.<br /><br />\nDie sind zwar jetzt noch zu Teuer aber die Preise fallen mit der Zeit bekanntlich so dass sie bald erschwinglich sind.<br /><br />\nNun ja alles klar auf der Andrea Doria.<br /><br />\nEs ist schon Praktisch das die Dinger im Leerlauf die L&uuml;fter anhalten k&ouml;nnen.<br /><br />\nSo hab ich beim Programmieren von Websites immer einen leisen PC.<br /><br />\nSchade das AMD und Linux nicht so ganz Harmonieren, h&auml;tte mir gern ne AMD Karte geholt.<br /><br />\nAber man soll an die Zukunft denken.</p><p>Ach ja ich vergas doch glatt das ich mir ne Blu-Ray &uuml;ber Amy Winehouse gekauft habe.<br /><br />\nIst echt Irre, was die so erlebt hat.<br /><br />\nR.I.P. Amy.</p><p>in diesem Sinne, Viel Spa&szlig; Asario</p>\n', '<p>Ich &uuml;berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / m&ouml;chte.<br /><br />\nMeine Grafikkarte r&ouml;hrt seit einigen Wochen, ich werde sie wohl ersetzen m&uuml;ssen.<br /><br />\nDiesmal wird es wohl eine karte von NVIDIA sein.<br /><br />\nschon falls ich es doch noch mal schaffe mich an Linux zu gew&ouml;hnen.<br /><br />\nAu&szlig;erdem sind die Nvidia Karten …</p>\n', 'yya7', 2, 1, 0, '008.jpg', '2017-02-19 11:37:00', '2025-02-25 15:00:24'),
(87, 1, '2017-03-02 17:43:00', 'Jetzt aber...', 1, 1, '<p>Ich habe mal wieder was gebastelt. Unter <a href=\"user\">Benutzer</a> kÃƒÂ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.<br /><br />\nUnd damit kÃƒÂ¶nnt ihr &quot;eure Leistung&quot; mit der der anderen vergleichen.<br /><br />\nSoo, dann hab ich noch 2 neue Bilder Online gestellt zu finden unter <a href=\"images\">Images</a> in den Galerien Faser und Acryl. Siehe auch rechts oben auf dieser Seite.<br /><br />\nViel Spass beim Statistiken guggen, in Love Asario</p>\n', '<p>Ich habe mal wieder was gebastelt. Unter <a href=\"user\">Benutzer</a> kÃƒÂ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.<br /><br />\nUnd damit kÃƒÂ¶nnt ihr &quot;eure Leistung&quot; mit der der anderen vergleichen.<br /><br />\nSoo, dann hab ich noch 2 …</p>\n', 'y5a8', 1, 1, 0, '14new_noname.jpg', '2017-03-02 16:43:00', '2025-02-25 15:00:24'),
(88, 1, '2017-03-12 15:33:00', 'Neue Navigationsleiste', 1, 1, '<p>Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.<br /><br />\nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen <a href=\"kontakt\">meldet euch bei mir</a>.<br /><br />\nViel Spa&szlig; in meinem Blog, in Love, Asario</p>\n', '<p>Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.<br /><br />\nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen <a href=\"kontakt\">meldet euch bei mir</a>.<br /><br />\nViel Spa&szlig; in meinem Blog, in Love, Asario …</p>\n', 'ylep', 1, 1, 0, '03new_noname.jpg', '2017-03-12 14:33:00', '2025-02-25 15:00:24'),
(89, 1, '2017-03-24 17:50:00', 'MultiLanguageSupport', 1, 1, '<p>Ab jetzt kÃƒÂ¶nnt ihr einige der Seiten in Englischer Sprache sehen.<br /><br />\nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang f&auml;hig. Einstellen der Sprache kÃƒÂ¶nnt ihr in der Navigation oben rechts.</p><p>Ich habe grad einen &uuml;blen Bug im Dateihochladescript gefunden...<br /><br />\nm&uuml;sste jetzt wieder gehen.</p><p>W&uuml;nsche viel Spa&szlig; damit. falls euch noch was einf&auml;llt oder auff&auml;llt schreibt es mir.</p><p>Kommentare, E-Mails oder PMs sind willkommen...<br /><br />\nbis denne, Asario</p>\n', '<p>Ab jetzt kÃƒÂ¶nnt ihr einige der Seiten in Englischer Sprache sehen.<br /><br />\nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang f&auml;hig. Einstellen der Sprache kÃƒÂ¶nnt ihr in der Navigation oben rechts.</p><p>Ich habe grad einen &uuml;blen Bug im Dateihochladescript gefunden...<br /><br />\nm&uuml;sste …</p>\n', 'yezi', 1, 1, 0, '15new_noname.jpg', '2017-03-24 16:50:00', '2025-02-25 15:00:24'),
(90, 1, '2017-05-18 17:58:00', 'Das Warten hat ein Ende', 1, 1, '<p>Endlich habe ich mal wieder nen funzenden Web-Stick.<br /><br />\nwie Ihr seht bin ich wieder Online unterwegs.<br /><br />\nhabe ne l&auml;ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.<br /><br />\nHoffe Ihr habt Spa&szlig; mit meiner Seite.<br /><br />\nwww.asario.de your finest Art Place ;)</p>\n', '<p>Endlich habe ich mal wieder nen funzenden Web-Stick.<br /><br />\nwie Ihr seht bin ich wieder Online unterwegs.<br /><br />\nhabe ne l&auml;ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.<br /><br />\nHoffe Ihr habt Spa&szlig; mit meiner Seite.<br /><br />\nwww.asario.de your finest Art Place ;)</p>\n', 'y0o6', 1, 1, 0, '16new_noname.jpg', '2017-05-18 15:58:00', '2025-02-25 15:00:24'),
(91, 1, '2017-05-26 07:13:00', 'Die Version 2.35 von MCS wurde aktualisiert.', 2, 1, '<p>Mal wieder habe ich eine neue Version ver&ouml;ffentlicht.<br /><br />\nDie gr&ouml;&szlig;te &Auml;nderung betrifft die &Uuml;bersicht der Tabelle.<br /><br />\nHier kann man nun per Drag &amp; Drop Eintr&auml;ge sortieren.<br /><br />\nEinige Styles von www.marblefx.de wurden &uuml;berarbeitet, so dass alle R&auml;nder genau &uuml;bereinander liegen.<br /><br />\nAu&szlig;erdem habe ich diverse Bugs in einigen Modulen gestopft.<br /><br />\nEin &uuml;bler Bug im Kontaktformular wurde soeben gefixt.<br /><br />\nIhr k&ouml;nnt mir wieder Mails schreiben...<br /><br />\nmehr Infos wie immer im Changelog.</p>\n', '<p>Mal wieder habe ich eine neue Version ver&ouml;ffentlicht.<br /><br />\nDie gr&ouml;&szlig;te &Auml;nderung betrifft die &Uuml;bersicht der Tabelle.<br /><br />\nHier kann man nun per Drag &amp; Drop Eintr&auml;ge sortieren.<br /><br />\nEinige Styles von www.marblefx.de wurden &uuml;berarbeitet, so dass alle R&auml;nder genau &uuml;bereinander liegen.<br /><br />\nAu&szlig;erdem habe ich diverse Bugs in einigen …</p>\n', 'yyhr', 1, 1, 0, '008.jpg', '2017-05-26 05:13:00', '2025-02-25 15:00:24'),
(92, 1, '2017-05-28 17:09:00', 'Neue Galerie gesichtet', 1, 1, '<p>Ab jetzt kÃƒÂ¶nnt ihr getÃƒÂ¶pferte Kunstwerke von mir sehen.<br /><br />\nUnter <a href=\"ton\">http://www.asario.de/ton</a> findet ihr meine vorrangig Viereckigen Gegenst&auml;nden.<br /><br />\nHabe bis jetzt einen Aschenbecher in der Mache.</p>\n', '<p>Ab jetzt kÃƒÂ¶nnt ihr getÃƒÂ¶pferte Kunstwerke von mir sehen.<br /><br />\nUnter <a href=\"ton\">http://www.asario.de/ton</a> findet ihr meine vorrangig Viereckigen Gegenst&auml;nden.<br /><br />\nHabe bis jetzt einen Aschenbecher in der Mache.</p>\n', 'yren', 1, 1, 0, '19new_noname.jpg', '2017-05-28 15:09:00', '2025-02-25 15:00:24'),
(93, 1, '2017-06-17 15:56:00', 'Herzlichen Gl&uuml;ckwunsch', 1, 1, '<p>Mal wieder j&auml;hrt sich der Tag an dem ich &auml;lter werde.<br /><br />\nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.<br /><br />\nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.<br /><br />\nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.<br /><br />\nIch hoffe Ihr seid nicht Einsam.</p><p>In Love, Asario</p>\n', '<p>Mal wieder j&auml;hrt sich der Tag an dem ich &auml;lter werde.<br /><br />\nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.<br /><br />\nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.<br /><br />\nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.<br /><br />\nIch hoffe Ihr seid nicht …</p>\n', 'yivg', 1, 1, 0, '09new_noname.jpg', '2017-06-17 13:56:00', '2025-02-25 15:00:24'),
(94, 1, '2017-06-20 17:45:00', 'Meine Geschenke....', 3, 1, '<p>Ich bin jetzt Besitzer eines Schafes in Afghanistan.<br />\nIch hoffe das die Familie viel Milch und Wolle ernten kann.<br />\nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage.<br />\nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.<br />\nBestellt euch doch auch so ein Schaf.</p><p>Au&szlig;erdem habe ich noch ein Buch und einen neuen Rucksack geschenkt bekommen. Und jede Menge Tee war auch dabei.</p><p>Thx Ianosaurus &amp; Chinagirl</p>\n', '<p>Ich bin jetzt Besitzer eines Schafes in Afghanistan.<br />\nIch hoffe das die Familie viel Milch und Wolle ernten kann.<br />\nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage.<br />\nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.<br />\nBestellt euch doch auch so ein Schaf.</p><p>Au&szlig;erdem …</p>\n', 'yjs3', 1, 1, 0, '008.jpg', '2017-06-20 15:45:00', '2025-02-25 15:00:24'),
(95, 1, '2017-06-30 18:07:00', 'Internationalisierung vorangetrieben', 1, 1, '<p>Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.<br /><br />\nIch bin fleissig am &Uuml;bersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlie&szlig;lich auch noch nebenbei BrÃƒÂ¶tchen verdienen.<br /><br />\nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.</p><p>Da Google Translate nur Bullshit bringt muss ich alles von Hand &uuml;bersetzen was bei meinem Schulenglisch gar nicht so leicht ist...</p><p>Hoffe Ihr Muttersprachler verzeiht mir meine Faux Pas.</p><p>Neu dazugekommen ist der Englische Newsfeed unter <a href=\"http://www.feeds.marblefx.de/ab.en.xml\">http://www.feeds.marblefx.de/ab.en.xml</a><br /><br />\nin Love, Asario</p>\n', '<p>Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.<br /><br />\nIch bin fleissig am &Uuml;bersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlie&szlig;lich auch noch nebenbei BrÃƒÂ¶tchen verdienen.<br /><br />\nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.</p><p>Da …</p>\n', 'y645', 1, 1, 0, 'multilang_overall.jpg', '2017-06-30 16:07:00', '2025-02-25 15:00:24'),
(96, 1, '2017-07-07 16:26:00', 'Habe mal wieder geschraubt.', 1, 1, '<p>Ab Sofort kÃƒÂ¶nnt Ihr miteinander Chatten.<br /><br />\nSobald au&szlig;er euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.<br /><br />\nIch hoffe Ihr habt mal das Gl&uuml;ck jemand im Chat zu begegnen.<br /><br />\nW&uuml;nsche Viel Spa&szlig;, in Love Asario</p>\n', '<p>Ab Sofort kÃƒÂ¶nnt Ihr miteinander Chatten.<br /><br />\nSobald au&szlig;er euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.<br /><br />\nIch hoffe Ihr habt mal das Gl&uuml;ck jemand im Chat zu begegnen.<br /><br />\nW&uuml;nsche Viel Spa&szlig;, in Love Asario</p>\n', 'ygl8', 1, 1, 0, '18new_noname.jpg', '2017-07-07 14:26:00', '2025-02-25 15:00:24'),
(97, 1, '2017-07-11 16:44:00', 'Neue Version auf alten Gleisen', 2, 1, '<p>MCS Version 2.45 ist erschienen.<br /><br />\nzu den Herausragenden Features z&auml;hlen der Chat auf www.asario.de.<br /><br />\nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.<br /><br />\nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.<br /><br />\nAch ja, ich arbeite an den ersten Landingpages f&uuml;r Asarios Blog und musste deswegen an der Grundstruktur der Seiten arbeiten.<br /><br />\nViel Spa&szlig; damit, Asario</p>\n', '<p>MCS Version 2.45 ist erschienen.<br /><br />\nzu den Herausragenden Features z&auml;hlen der Chat auf www.asario.de.<br /><br />\nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.<br /><br />\nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.<br /><br />\nAch ja, ich …</p>\n', 'y76p', 1, 1, 0, '008.jpg', '2017-07-11 14:44:00', '2025-02-25 15:00:24'),
(98, 1, '2018-05-01 16:53:00', 'Layoutver&auml;nderung 2.0', 1, 1, '<p>Habe am Grundlayout von Asarios Blog gearbeitet.<br /><br />\nist auf Mobilger&auml;ten besser zu benutzen das neue Layout.<br /><br />\nHoffe Ihr habt Spa&szlig; damit.</p><p>W&uuml;nsche einen sch&ouml;nen Mai, Asario.</p>\n', '<p>Habe am Grundlayout von Asarios Blog gearbeitet.<br /><br />\nist auf Mobilger&auml;ten besser zu benutzen das neue Layout.<br /><br />\nHoffe Ihr habt Spa&szlig; damit.</p><p>W&uuml;nsche einen sch&ouml;nen Mai, Asario.</p>\n', 'y0t4', 1, 1, 0, '60new_moname.jpg', '2018-05-01 14:53:00', '2017-07-29 14:06:00'),
(99, 1, '2017-08-20 13:40:00', 'SSL &Uuml;berall', 1, 1, '<p>Herzlichen Gl&uuml;hstrumpf, wir haben SSL aktivieren kÃƒÂ¶nnen.<br /><br />\nDank Let\'s Encrypt ist jetzt alles sicher.<br /><br />\nVielen Dank an 1blu die Let\'s Encrypt integriert haben.<br /><br />\nW&uuml;nsche ein sicheres &quot;SURF&quot;, Asario</p>\n', '<p>Herzlichen Gl&uuml;hstrumpf, wir haben SSL aktivieren kÃƒÂ¶nnen.<br /><br />\nDank Let\'s Encrypt ist jetzt alles sicher.<br /><br />\nVielen Dank an 1blu die Let\'s Encrypt integriert haben.<br /><br />\nW&uuml;nsche ein sicheres &quot;SURF&quot;, Asario</p>\n', 'ysdn', 1, 1, 0, '33new_noname.jpg', '2017-08-20 11:40:00', '2025-02-25 15:00:24'),
(100, 1, '2017-09-10 10:48:00', 'Neues auf meinem Blog', 1, 1, '<p>Ein kleines Detail hat sich auf meiner Seite ver&auml;ndert.<br /><br />\nLinks vom Kommentar ist das Profilbild des Users zu finden.<br /><br />\nWar ne recht schnelle Nummer das Umzusetzen.<br /><br />\nSieht echt Schnieke aus so.</p>\n', '<p>Ein kleines Detail hat sich auf meiner Seite ver&auml;ndert.<br /><br />\nLinks vom Kommentar ist das Profilbild des Users zu finden.<br /><br />\nWar ne recht schnelle Nummer das Umzusetzen.<br /><br />\nSieht echt Schnieke aus so.</p>\n', 'yetg', 1, 1, 0, '35new_noname.jpg', '2017-09-10 08:48:00', '2025-02-25 15:00:24'),
(101, 1, '2017-09-17 17:16:00', 'Neue Bilder gefunden', 1, 1, '<p>Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich w&uuml;nsche viel Spa&szlig; damit, Asario</p>\n', '<p>Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich w&uuml;nsche viel Spa&szlig; damit, Asario</p>\n', 'yay6', 1, 1, 0, '34new_noname.jpg', '2017-09-17 15:16:00', '2025-02-25 15:00:24'),
(102, 1, '2017-10-14 17:08:00', 'Mein Praktikum', 1, 1, '<p>Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel Spa&szlig; und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.<br /><br />\nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich auf ein Wiedersehen mit dem Team von Elan Nord.</p>\n', '<p>Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel Spa&szlig; und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.<br /><br />\nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich …</p>\n', 'yvow', 1, 1, 0, '40new_noname.jpg', '2017-10-14 15:08:00', '2025-02-25 15:00:24'),
(103, 1, '2017-10-29 11:56:00', 'Neuer Ascher', 1, 1, '<p>Joa, Ich hab mal wieder getÃƒÂ¶pfert...<br /><br />\nEin Mederius Aschenbecher ist draus geworden.<br /><br />\nVielen Dank an Ivonne &amp; Ullrich, die das Teil f&uuml;r mich glasiert haben.<br /><br />\nDemn&auml;chst mach ich noch mal welche f&uuml;r die neue Aschenbecherlinie von Asario.</p>\n', '<p>Joa, Ich hab mal wieder getÃƒÂ¶pfert...<br /><br />\nEin Mederius Aschenbecher ist draus geworden.<br /><br />\nVielen Dank an Ivonne &amp; Ullrich, die das Teil f&uuml;r mich glasiert haben.<br /><br />\nDemn&auml;chst mach ich noch mal welche f&uuml;r die neue Aschenbecherlinie von Asario.</p>\n', 'ycu4', 1, 1, 0, '41new_noname.jpg', '2017-10-29 10:56:00', '2025-02-25 15:00:24'),
(104, 1, '2017-11-12 13:59:00', 'Ver&auml;ndertes Layout', 1, 1, '<p>Ich hab mal wieder am Design von www.asario.de geschraubt.<br /><br />\nHope you enjoy.<br /><br />\nKritiken bitte per Comment oder PM...<br /><br />\nBis bald, Asario</p>\n', '<p>Ich hab mal wieder am Design von www.asario.de geschraubt.<br /><br />\nHope you enjoy.<br /><br />\nKritiken bitte per Comment oder PM...<br /><br />\nBis bald, Asario</p>\n', 'yr96', 1, 1, 0, '20new_noname.jpg', '2017-11-12 12:59:00', '2025-02-25 15:00:24'),
(105, 1, '2017-11-19 08:18:00', 'Neue Galerie', 1, 1, '<p>Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)</p>\n', '<p>Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)</p>\n', 'y7nz', 1, 1, 0, '30new_noname.jpg', '2017-11-19 07:18:00', '2025-02-25 15:00:24'),
(106, 1, '2017-12-20 08:10:00', 'Endlich wieder Online', 1, 1, '<p>Endlich funktioniert mein Surf Stick wieder.<br /><br />\nWar ein paar Wochen Offline :(<br /><br />\nIch w&uuml;nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.<br /><br />\nHoffe 2018 wird noch besser als 2017.<br /><br />\nBis bald, Paul aka Asario</p>\n', '<p>Endlich funktioniert mein Surf Stick wieder.<br /><br />\nWar ein paar Wochen Offline :(<br /><br />\nIch w&uuml;nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.<br /><br />\nHoffe 2018 wird noch besser als 2017.<br /><br />\nBis bald, Paul aka Asario</p>\n', 'y3vj', 1, 1, 0, '21new_noname.jpg', '2017-12-20 07:10:00', '2025-02-25 15:00:24'),
(107, 1, '2018-01-28 08:17:00', 'Neue Monstar Pix', 1, 1, '<p>Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃƒÂ¶ffentlicht.<br /><br />\nVielen Dank an Chinagirl &amp; Ianosaurus.<br /><br />\nViel Spass w&uuml;nscht Asario</p>\n', '<p>Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃƒÂ¶ffentlicht.<br /><br />\nVielen Dank an Chinagirl &amp; Ianosaurus.<br /><br />\nViel Spass w&uuml;nscht Asario</p>\n', 'y7hf', 1, 1, 0, '42new_noname.jpg', '2018-01-28 07:17:00', '2025-02-25 15:00:24'),
(108, 1, '2018-03-02 16:55:00', 'Shortstories wird zu Shortpoems', 1, 1, '<p>Die Shortstorie Rubrik wurde in Shortpoems umbenannt.<br /><br />\nNach wie vor kÃƒÂ¶nnt Ihr mir WÃƒÂ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.</p><p>Freu mich schon auf eure Poem-Vorschl&auml;ge.</p>\n', '<p>Die Shortstorie Rubrik wurde in Shortpoems umbenannt.<br /><br />\nNach wie vor kÃƒÂ¶nnt Ihr mir WÃƒÂ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.</p><p>Freu mich schon auf eure Poem-Vorschl&auml;ge.</p>\n', 'y8ti', 1, 1, 0, '26new_noname.jpg', '2018-03-02 15:55:00', '2025-02-25 15:00:24'),
(109, 1, '2018-04-02 14:26:00', 'Neue Kamera', 1, 1, '<p>Ich habe mir zu Ostern eine neue Kamera geleistet.<br /><br />\nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.<br /><br />\nW&uuml;nsche euch einen schÃƒÂ¶nen Fr&uuml;hling.</p><p>In Liebe, Asario</p>\n', '<p>Ich habe mir zu Ostern eine neue Kamera geleistet.<br /><br />\nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.<br /><br />\nW&uuml;nsche euch einen schÃƒÂ¶nen Fr&uuml;hling.</p><p>In Liebe, Asario</p>\n', 'yls1', 1, 1, 0, '56new_noname.jpg', '2018-04-02 12:26:00', '2025-02-25 15:00:24'),
(110, 1, '2018-04-15 10:28:00', 'Neues Wallpaper @ Digital Galerie', 1, 1, '<p>Habe mal wieder ein Wallpaper kreiert. Ein gr&uuml;nes mal wieder, denn Gr&uuml;n ist die Hoffnung.<br /><br />\nStay tuned, Asario</p>\n', '<p>Habe mal wieder ein Wallpaper kreiert. Ein gr&uuml;nes mal wieder, denn Gr&uuml;n ist die Hoffnung.<br /><br />\nStay tuned, Asario</p>\n', 'yt63', 1, 1, 0, '63new_noname.jpg', '2018-04-15 08:28:00', '2025-02-25 15:00:24'),
(111, 1, '2018-04-18 17:32:00', 'Frickeleien am Code', 2, 1, '<p>Habe auch dieses mal einiges verbessert.<br /><br />\nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch ge&auml;nderte Seiten aktualisieren muss.<br /><br />\nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.</p><p>Aber es ist geschafft und ich bin Stolz auf meine Arbeit in die ich meine Feierabende investiert habe.</p><p>Hoffe Ihr genie&szlig;t das schÃƒÂ¶ne Wetter.<br /><br />\nIch geh jetzt raus mich sonnen.</p><p>GRTZ from BimÃƒÂ¶hlen, Asario</p>\n', '<p>Habe auch dieses mal einiges verbessert.<br /><br />\nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch ge&auml;nderte Seiten aktualisieren muss.<br /><br />\nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.</p><p>Aber es ist geschafft und ich bin Stolz …</p>\n', 'ybj2', 1, 1, 0, '008.jpg', '2018-04-18 15:32:00', '2025-02-25 15:00:24'),
(112, 1, '2018-04-20 16:20:00', 'Ein bisschen leer hier', 3, 1, '<p>Hab lange nix mehr hier rein geschrieben.<br /><br />\nIch genie&szlig;e das sch&ouml;ne Wetter in SH.<br /><br />\nSonne Satt und das im April, fast wie letztes Jahr.</p><p>Momentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschlo&szlig;en haben m&ouml;chte.</p><p>Ist nur Organisatorischer Kram, aber der muss auch sein.</p><p>Bin echt zufrieden mit meiner Neuanschaffung, einer LUMIX TZ-71.<br /><br />\ndas Studium des Handbuches steht auch noch auf meiner TODO-Liste.</p><p>Bin jetzt bei Seite 98 von 300. Aber ein paar Kamerafeatures sind echt gut.<br /><br />\nMit freundlichen Gr&uuml;&szlig;en, Asario</p>\n', '<p>Hab lange nix mehr hier rein geschrieben.<br /><br />\nIch genie&szlig;e das sch&ouml;ne Wetter in SH.<br /><br />\nSonne Satt und das im April, fast wie letztes Jahr.</p><p>Momentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschlo&szlig;en haben m&ouml;chte.</p><p>Ist nur Organisatorischer Kram, aber der muss auch sein.<br /><br />\n…</p>\n', 'y0p7', 1, 1, 0, '008.jpg', '2018-04-20 14:20:00', '2025-02-25 15:00:24'),
(113, 1, '2018-04-29 08:49:00', 'Mein Smartphone', 1, 1, '<p>Ich habe k&uuml;rzlich von einer netten Kollegin ein Smartphone f&uuml;r g&uuml;nstig ersteigert.<br /><br />\nMusste jetzt auf allen Seiten meine Telefonnummer &auml;ndern...<br /><br />\nAber bis jetzt funktioniert das Internet noch nicht :(.<br /><br />\nNaja, gut ding will Weile haben.</p>\n', '<p>Ich habe k&uuml;rzlich von einer netten Kollegin ein Smartphone f&uuml;r g&uuml;nstig ersteigert.<br /><br />\nMusste jetzt auf allen Seiten meine Telefonnummer &auml;ndern...<br /><br />\nAber bis jetzt funktioniert das Internet noch nicht :(.<br /><br />\nNaja, gut ding will Weile haben.</p>\n', 'y5rf', 1, 1, 0, '66new_noname.jpg', '2018-04-29 06:49:00', '2025-02-25 15:00:24'),
(114, 1, '2018-05-01 16:53:00', 'Layoutver&auml;nderung 2.0', 1, 1, '<p>Habe am Grundlayout von Asarios Blog gearbeitet.<br /><br />\nist auf Mobilger&auml;ten besser zu benutzen das neue Layout.<br /><br />\nHoffe Ihr habt Spa&szlig; damit.</p><p>W&uuml;nsche einen sch&ouml;nen Mai, Asario.</p>\n', '<p>Habe am Grundlayout von Asarios Blog gearbeitet.<br /><br />\nist auf Mobilger&auml;ten besser zu benutzen das neue Layout.<br /><br />\nHoffe Ihr habt Spa&szlig; damit.</p><p>W&uuml;nsche einen sch&ouml;nen Mai, Asario.</p>\n', 'yep9', 1, 1, 0, '60new_moname.jpg', '2018-05-01 14:53:00', '2018-05-01 14:53:00'),
(115, 1, '2018-05-06 09:01:00', 'Neue Rubrik', 1, 1, '<p>Habe eine neue Rubrik auf meiner Seite ver&ouml;ffentlicht, sie hei&szlig;t Did You Know und besch&auml;ftigt sich mit Unn&uuml;tzem Wissen.</p><p>Aber manchmal ist ne wissenswerte Info dabei.</p><p>W&uuml;nsche viel Spa&szlig; mit der Seite, Asario</p>\n', '<p>Habe eine neue Rubrik auf meiner Seite ver&ouml;ffentlicht, sie hei&szlig;t Did You Know und besch&auml;ftigt sich mit Unn&uuml;tzem Wissen.</p><p>Aber manchmal ist ne wissenswerte Info dabei.</p><p>W&uuml;nsche viel Spa&szlig; mit der Seite, Asario</p>\n', 'yn1u', 1, 1, 0, '61new_noname.jpg', '2018-05-06 07:01:00', '2025-02-25 15:00:24'),
(116, 1, '2018-05-13 08:02:00', 'Neue Wissensfragen auf DidYouKnow', 1, 1, '<p>Habe mal wieder ein paar Fragen online gestellt.<br /><br />\nHoffe die sind lehrreich.<br /><br />\nAu&szlig;erdem kann man im PM Schreiben Men&uuml; jetzt nach Benutzern suchen.</p><p>Bis denne Penne, ich liebe Nudeln und gut.<br /><br />\nAsario tut was er tut.</p>\n', '<p>Habe mal wieder ein paar Fragen online gestellt.<br /><br />\nHoffe die sind lehrreich.<br /><br />\nAu&szlig;erdem kann man im PM Schreiben Men&uuml; jetzt nach Benutzern suchen.</p><p>Bis denne Penne, ich liebe Nudeln und gut.<br /><br />\nAsario tut was er tut.</p>\n', 'yksr', 1, 1, 0, '69new_noname.jpg', '2018-05-13 06:02:00', '2025-02-25 15:00:24'),
(117, 1, '2018-06-17 07:29:00', 'Mein 35ter Geburtstag', 1, 1, '<p>Herzlichen Gl&uuml;hstrumpf Asario.<br /><br />\nWieder 1 Jahr &auml;lter geworden...<br /><br />\nHabe mich selber schon am Samstag beschenkt.<br /><br />\n1 Bluetooth Kopfh&ouml;rer hab ich mir geleistet (von Sony).<br /><br />\nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.</p><p>Kleine &Auml;nderung an der Seite...<br /><br />\nIch habe die Fineliner Galerien 1-7 in eine Fineliner Galerie verpackt.</p><p>In diesem Sinne, habt Spa&szlig;, Asario</p>\n', '<p>Herzlichen Gl&uuml;hstrumpf Asario.<br /><br />\nWieder 1 Jahr &auml;lter geworden...<br /><br />\nHabe mich selber schon am Samstag beschenkt.<br /><br />\n1 Bluetooth Kopfh&ouml;rer hab ich mir geleistet (von Sony).<br /><br />\nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.</p><p>Kleine &Auml;nderung an der Seite...<br /><br />\nIch habe die Fineliner Galerien 1-7 in …</p>\n', 'y3b9', 1, 1, 0, '70new_noname.jpg', '2018-06-17 05:29:00', '2025-02-25 15:00:24'),
(118, 1, '2018-06-30 06:38:00', 'Neuigkeiten auf Asarios Blog', 1, 1, '<p>Ab Jetzt habe ich die Photos Galerien in eine verpackt.<br /><br />\nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.<br /><br />\nAu&szlig;erdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.<br /><br />\nW&uuml;nsche euch viel Spa&szlig; auf meiner Seite.<br /><br />\nIn Love, Asario.</p>\n', '<p>Ab Jetzt habe ich die Photos Galerien in eine verpackt.<br /><br />\nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.<br /><br />\nAu&szlig;erdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.<br /><br />\nW&uuml;nsche euch viel Spa&szlig; auf meiner Seite.<br /><br />\nIn Love, Asario.</p>\n', 'yzgi', 1, 1, 0, '68new_noname.jpg', '2018-06-30 04:38:00', '2025-02-25 15:00:24');
INSERT INTO `blogs` (`id`, `pub`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `autoslug`, `reading_time`, `markdown_on`, `xis_aiImage`, `image_path`, `created_at`, `updated_at`) VALUES
(119, 1, '2018-08-10 09:13:00', 'MCS Version 2.87 Published', 2, 1, '<p>Just in diesem Moment habe ich ein neues Release fertiggestellt.<br /><br />\nVersion 2.87 enth&auml;lt einige neue Features und Verbesserungen.<br /><br />\nZu den Features geh&ouml;ren ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Eintr&auml;ge auf Seiten verteilt.</p><p>Desweiteren wurden etliche kleine Bugs beseitigt und es wurde ein Double Opt Out f&uuml;r meinen Asarios Blog Newsletter eingerichtet.</p><p>W&uuml;nsche viel Spa&szlig; mit diesem Release.</p><p>In Love, Asario</p>\n', '<p>Just in diesem Moment habe ich ein neues Release fertiggestellt.<br /><br />\nVersion 2.87 enth&auml;lt einige neue Features und Verbesserungen.<br /><br />\nZu den Features geh&ouml;ren ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Eintr&auml;ge auf Seiten verteilt.</p><p>Desweiteren wurden etliche kleine Bugs beseitigt und …</p>\n', 'yp1q', 1, 1, 0, '008.jpg', '2018-08-10 07:13:00', '2025-02-25 15:00:24'),
(120, 1, '2018-08-10 18:02:00', 'Neue Fotos und neue MCS Version', 1, 1, '<p>Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.<br /><br />\nIst ein grosses Release geworden, mit vielen Verbesserungen.<br /><br />\nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.<br /><br />\nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog</p>\n', '<p>Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.<br /><br />\nIst ein grosses Release geworden, mit vielen Verbesserungen.<br /><br />\nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.<br /><br />\nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog …</p>\n', 'yit8', 1, 1, 0, '71new_noname.jpg', '2018-08-10 16:02:00', '2025-02-25 15:00:24'),
(121, 1, '2018-08-23 15:11:00', 'Neues PM Layout, Stats und MCS-Newsletter', 2, 1, '<p>Habe am Layout der PM\'s in Asarios Blog gearbeitet.<br /><br />\nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled<br /><br />\nHat mich ne Menge Arbeit gekostet, f&uuml;gt sich jetzt aber besser ins Gesamtbild ein.</p><p>Der flei&szlig;ige Newsletterleser kommt jetzt zu Punkten.<br /><br />\nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort MCS-Points sammeln lassen.</p><p>Musste deswegen auch die Statistiken erweitern</p><p>Au&szlig;erdem hab ich seit den letzten news mal wieder ein paar Did You Know Fragen geupped.<br /><br />\nHope you enjoy it, Asario</p>\n', '<p>Habe am Layout der PM\'s in Asarios Blog gearbeitet.<br /><br />\nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled<br /><br />\nHat mich ne Menge Arbeit gekostet, f&uuml;gt sich jetzt aber besser ins Gesamtbild ein.</p><p>Der flei&szlig;ige Newsletterleser kommt jetzt zu Punkten.<br /><br />\nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort …</p>\n', 'yeub', 1, 1, 0, '72new_noname.jpg', '2018-08-23 13:11:00', '2025-02-25 15:00:24'),
(122, 1, '2018-09-15 18:23:00', 'Monstar in D&auml;nemark', 1, 1, '<p>Mein Monstar hat nach einem Trip durch D&auml;nemark mir seine Selfies geschickt.<br /><br />\nSind paar nette Bilder dabei. Vielen Dank an Nitropower f&uuml;r die &Uuml;bermittlung der Bilder.<br /><br />\nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.<br /><br />\nHope you enjoy, Asario</p>\n', '<p>Mein Monstar hat nach einem Trip durch D&auml;nemark mir seine Selfies geschickt.<br /><br />\nSind paar nette Bilder dabei. Vielen Dank an Nitropower f&uuml;r die &Uuml;bermittlung der Bilder.<br /><br />\nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.<br /><br />\nHope you enjoy, Asario</p>\n', 'ybcv', 1, 1, 0, '74new_noname.jpg', '2018-09-15 16:23:00', '2025-02-25 15:00:24'),
(123, 1, '2018-09-26 15:45:00', 'Kommentaren Folgen', 1, 1, '<p>Ab Jetzt k&ouml;nnt ihr bestimmten Kommentaren folgen.<br /><br />\nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.<br /><br />\nHoffe euch gef&auml;llt das Feature und nutzt es auch kr&auml;ftig.<br /><br />\nBis bald, Asario</p>\n', '<p>Ab Jetzt k&ouml;nnt ihr bestimmten Kommentaren folgen.<br /><br />\nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.<br /><br />\nHoffe euch gef&auml;llt das Feature und nutzt es auch kr&auml;ftig.<br /><br />\nBis bald, Asario</p>\n', 'y3kd', 1, 1, 0, '73new_noname.jpg', '2018-09-26 13:45:00', '2025-02-25 15:00:24'),
(124, 1, '2018-10-21 14:48:00', 'Neuer Button unter Images', 1, 1, '<p>Es ist ein neuer Button unter Images dazugekommen.<br /><br />\nunter Voter k&ouml;nnt Ihr nachsehen wer wie viel Punkte vergeben hat.<br /><br />\nAus der Blackbox ist eine Whitebox Anwendung geworden.</p>\n', '<p>Es ist ein neuer Button unter Images dazugekommen.<br /><br />\nunter Voter k&ouml;nnt Ihr nachsehen wer wie viel Punkte vergeben hat.<br /><br />\nAus der Blackbox ist eine Whitebox Anwendung geworden.</p>\n', 'ylb9', 1, 1, 0, '49new_noname.jpg', '2018-10-21 12:48:00', '2025-02-25 15:00:24'),
(125, 1, '2018-10-21 17:16:00', 'LCD, LED, OLED, Plasma - Inwiefern unterscheiden sich TV-Ger&auml;te?', 0, 1, '<p>Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen k&ouml;nnen, setzt sich aus unz&auml;hligen Pixeln zusammen. Der Unterschied besteht haupts&auml;chlich in der Erzeugung der Bildpunkte.</p><p>LCD, LED - Was bedeuten diese Abk&uuml;rzungen?</p><p>Alle diese Akronyme stammen aus dem Englischen. LCD bedeutet ausgeschrieben &quot;liquid crystal display&quot;, zu deutsch Fl&uuml;ssigkristallanzeige. In LC-Monitoren werden die namensgebenden, halbdurchsichtigen Fl&uuml;ssigkristalle daf&uuml;r eingesetzt, die Menge an durchgelassenem Licht zu kontrollieren. Daf&uuml;r &auml;ndern sie ihre Ausrichtung. Die Kristalle befinden sich zwischen zwei sogenannten Polarisationsfilter.</p><p>LED- und OLED-Fernseher nutzen ebenfalls Fl&uuml;ssigkristrallanzeigen. Hier bezieht sich die Abk&uuml;rzung auf die Art der Beleuchtung. TV-Ger&auml;te mit der &quot;light-emitting diode&quot;-Technologie sind heutzutage die Norm und sind flacher als LCD-Fernseher mit Leuchtstoffr&ouml;hren. LED bedeutet &uuml;bersetzt Leuchtdiode.</p><p>Plasmafernseher - eine Nummer teurer?</p><p>In einem Plasmafernseher wird das Bild durch Edelgase erzeugt, die in Kammern zwischen zwei Glasplatten liegen. Plasmen senden aufgrund von quantenhaften Emissionen Strahlung, unter anderem in Form von sichtbarem Licht, aus. Da das Licht vom Gas kommt, und keine Hintergrundbeleuchtung wie beim LCD eingesetzt wird, sind sowohl Schwarzwerte, als auch der Kontrast besser. Bisher galten sie au&szlig;erdem als reaktionsschneller. Sie sind allerdings deutlich teurer in der Anschaffung als LCD-Fernseher. Plasmafernseher verbrauchen desweiteren mehr Energie. Daher haben sie sich auf dem Markt kaum durchgesetzt.</p><p>OLED - die Zukunft?</p><p>OLED-Fernseher verwenden organische Leuchtdioden, die von selbst verschiedene Farben darstellen. Diese k&ouml;nnen sehr platzsparend verbaut werden und bieten eine bessere Bildqualit&auml;t und R&auml;umlichkeit. OLED-Ger&auml;te sind allerdings noch sehr teuer in der Herstellung. Langfristig wird sich diese Technologie aber durchsetzen k&ouml;nnen, da sie die Vorteile von herk&ouml;mmlichen LCDs und Plasmafernsehern vereint.</p><p>Bei der Kaufentscheidung sollten Sie sich genau &uuml;ber das gew&uuml;nschte Produkt informieren, beispielsweise <a href=\"http://www.fernseher24.com/\">auf www.fernseher24.com.</a> Vor allem Ihr Budget eine gro&szlig;e Rolle. Ob es der gebrauchte Samsung-Fernseher im Angebot aus der letzten Generation oder ein neuer ultra hochaufl&ouml;sender OLED-Fernseher wird, entscheidet auch Ihr Geldbeutel.<br /><br />\nvon Melanie Unger (www.fernseher24.com)</p>\n', '<p>Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen k&ouml;nnen, setzt sich aus unz&auml;hligen Pixeln zusammen. Der Unterschied besteht haupts&auml;chlich in der Erzeugung der Bildpunkte.</p><p>LCD, LED - Was bedeuten diese Abk&uuml;rzungen?<br /><br />\n…</p>\n', 'ydv3', 2, 1, 0, '008.jpg', '2018-10-21 15:16:00', '2025-02-25 15:00:24'),
(126, 1, '2018-11-25 08:16:00', 'Neuer Slider auf News Seite.', 1, 1, '<p>Wie Ihr seht, hab ich den Slider auf der Newsseite ver&auml;ndert.<br /><br />\nHope you enjoy, Asario</p>\n', '<p>Wie Ihr seht, hab ich den Slider auf der Newsseite ver&auml;ndert.<br /><br />\nHope you enjoy, Asario</p>\n', 'y9qe', 1, 1, 0, '75new_noname.jpg', '2018-11-25 07:16:00', '2025-02-25 15:00:24'),
(127, 1, '2018-12-02 08:55:00', 'Neues Feature auf Images Seite', 1, 1, '<p>Unter <a href=\"ausgemaltes\">Ausgemaltes</a> k&ouml;nnt Ihr ab jetzt den Fortschritt &uuml;ber Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.</p>\n', '<p>Unter <a href=\"ausgemaltes\">Ausgemaltes</a> k&ouml;nnt Ihr ab jetzt den Fortschritt &uuml;ber Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.</p>\n', 'ynqi', 1, 1, 0, '80new_noname.jpg', '2018-12-02 07:55:00', '2025-02-25 15:00:24'),
(128, 1, '2018-12-09 09:16:00', 'Neues unter DidYouKnow', 1, 1, '<p>Ich habe mal wieder ein paar Wissensh&auml;ppchen verteilt. Ich hoffe sie sind lehrreich.<br /><br />\nIhr findet sie unter <a href=\"didyouknow\">DidYouKnow</a>.<br /><br />\nAu&szlig;erdem ist ein neues Release von MCS ver&ouml;ffentlicht worden.<br /><br />\nViel Spa&szlig; damit, euer Asario.</p>\n', '<p>Ich habe mal wieder ein paar Wissensh&auml;ppchen verteilt. Ich hoffe sie sind lehrreich.<br /><br />\nIhr findet sie unter <a href=\"didyouknow\">DidYouKnow</a>.<br /><br />\nAu&szlig;erdem ist ein neues Release von MCS ver&ouml;ffentlicht worden.<br /><br />\nViel Spa&szlig; damit, euer Asario.</p>\n', 'yrjs', 1, 1, 0, '83new_noname.jpg', '2018-12-09 08:16:00', '2025-02-25 15:00:24'),
(129, 1, '2018-12-20 17:12:00', 'Merry Christmas Folks', 1, 1, '<p>Auch euch ein sch&ouml;nes Weihnachtsfest mit hoffentlich vielen Geschenken.<br /><br />\nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.<br /><br />\nAlles gute aus meiner Heimat, Asario.</p>\n', '<p>Auch euch ein sch&ouml;nes Weihnachtsfest mit hoffentlich vielen Geschenken.<br /><br />\nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.<br /><br />\nAlles gute aus meiner Heimat, Asario.</p>\n', 'yprz', 1, 1, 0, '84_new_noname.jpg', '2018-12-20 16:12:00', '2025-02-25 15:00:24'),
(130, 1, '2019-01-01 09:41:00', 'Frohes Neues Freunde', 1, 1, '<p>Ich w&uuml;nsche allen ein frohes Neues 2019.<br /><br />\nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.<br /><br />\nIch habe Sylvester in Bim&ouml;hlen verbracht, war ruhig so weit man das sagen kann...</p>\n', '<p>Ich w&uuml;nsche allen ein frohes Neues 2019.<br /><br />\nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.<br /><br />\nIch habe Sylvester in Bim&ouml;hlen verbracht, war ruhig so weit man das sagen kann...</p>\n', 'ymj2', 1, 1, 0, '85_new_noname.jpg', '2019-01-01 08:41:00', '2025-02-25 15:00:24'),
(131, 1, '2019-02-22 15:16:00', 'Neue Kunstwerke gesichtet', 1, 1, '<p>Ich habe unter &lt;a href=&quot;ausgemaltes&quot;&gt;Images-&gt;Ausgemaltes&lt;/a&gt; ein Bild fertiggestellt, sowie unter &lt;a href=&quot;acryl&quot;&gt;Images-&gt;Acryl&lt;/a&gt; ein neues Bild angefangen.</p><p>Hoffe Ihr m&ouml;gt die Motive, in love, Asario</p>\n', '<p>Ich habe unter &lt;a href=&quot;ausgemaltes&quot;&gt;Images-&gt;Ausgemaltes&lt;/a&gt; ein Bild fertiggestellt, sowie unter &lt;a href=&quot;acryl&quot;&gt;Images-&gt;Acryl&lt;/a&gt; ein neues Bild angefangen.</p><p>Hoffe Ihr m&ouml;gt die Motive, in love, Asario …</p>\n', 'ypia', 1, 1, 0, '96new_noname.jpg', '2019-02-22 14:16:00', '2025-02-25 15:00:24'),
(132, 1, '2019-03-24 14:19:00', 'F&uuml;r alle Apfel Nerds und 4K Nutzer', 1, 1, '<p>Dank einer kleineren &Auml;nderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgel&ouml;stes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.</p><p>Viel Spa&szlig; damit, euer Asario</p>\n', '<p>Dank einer kleineren &Auml;nderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgel&ouml;stes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.</p><p>Viel Spa&szlig; damit, euer Asario</p>\n', 'yoij', 1, 1, 0, '91new_noname.jpg', '2019-03-24 13:19:00', '2025-02-25 15:00:24'),
(133, 1, '2019-03-29 15:04:00', 'Monstarz United', 1, 1, '<p>Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz &uuml;berf&uuml;hrt worden.<br /><br />\nAnsonsten hat sich nix ver&auml;ndert. Hoffe euch gefallen die neuen alten Bilder.</p><p>In Love, Asario.</p>\n', '<p>Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz &uuml;berf&uuml;hrt worden.<br /><br />\nAnsonsten hat sich nix ver&auml;ndert. Hoffe euch gefallen die neuen alten Bilder.</p><p>In Love, Asario.</p>\n', 'y2fi', 1, 1, 0, '99new_noname.jpg', '2019-03-29 14:04:00', '2025-02-25 15:00:24'),
(134, 1, '2019-04-20 11:28:00', 'Frohe Ostern', 1, 1, '<p>Ich w&uuml;nsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).<br /><br />\nDie L&auml;mmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz gro&szlig;er Gefahr.</p><p>Ach ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points einstreichen, Viel Spa&szlig; beim suchen.<br /><br />\nDie Easter Egg Aktion gilt noch bis 30.4.2019.</p><p>Weiterhin viele gr&uuml;&szlig;e aus dem sonnigen Bim&ouml;hlen, Asario</p>\n', '<p>Ich w&uuml;nsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).<br /><br />\nDie L&auml;mmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz gro&szlig;er Gefahr.</p><p>Ach ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points …</p>\n', 'yxge', 1, 1, 0, '90_2new_noname.jpg', '2019-04-20 09:28:00', '2025-02-25 15:00:24'),
(135, 1, '2019-05-27 09:16:00', 'Besuch bei meinem kleinem Neffen', 1, 1, '<p>Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten k&ouml;nnen.<br /><br />\nEcht s&uuml;&szlig; der kleine Racker. Alfred, so hei&szlig;t er ist ein echt s&uuml;&szlig;es Baby.<br /><br />\nMit einem Kampfgewicht von 4290 g und einer K&ouml;rperl&auml;nge von 56 cm war das ein ganz sch&ouml;ner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.</p><p>Au&szlig;erdem habe ich ein Wallpaper mit Alfred versch&ouml;nert.<br /><br />\nUnd ich habe die Pr&auml;mien ver&auml;ndert. Viele Artworks sind jetzt mit noch weniger Punkten zu haben. Viel Spa&szlig; beim posten &amp; bewerten.</p>\n', '<p>Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten k&ouml;nnen.<br /><br />\nEcht s&uuml;&szlig; der kleine Racker. Alfred, so hei&szlig;t er ist ein echt s&uuml;&szlig;es Baby.<br /><br />\nMit einem Kampfgewicht von 4290 g und einer K&ouml;rperl&auml;nge von 56 cm war das ein ganz sch&ouml;ner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  …</p>\n', 'y0lx', 1, 1, 0, '100new_noname.jpg', '2019-05-27 07:16:00', '2025-02-25 15:00:24'),
(136, 1, '2019-06-23 06:40:00', 'Anubis fast fertig', 1, 1, '<p>Mein Gold Anubis ist auf der Zielgerade angekommen.<br /><br />\nEin paar Details an der Schnauze m&uuml;ssen noch gemacht werden, ansonsten ist er Fertig.<br /><br />\nMein bisher aufwendigstes Kunstwerk n&auml;hert sich der Fertigstellung.</p>\n', '<p>Mein Gold Anubis ist auf der Zielgerade angekommen.<br /><br />\nEin paar Details an der Schnauze m&uuml;ssen noch gemacht werden, ansonsten ist er Fertig.<br /><br />\nMein bisher aufwendigstes Kunstwerk n&auml;hert sich der Fertigstellung.</p>\n', 'y01w', 1, 1, 0, '103new_noname.jpg', '2019-06-23 04:40:00', '2025-02-25 15:00:24'),
(137, 1, '2019-06-30 11:22:00', 'MCS Doku Multi-Language', 2, 1, '<p>Ich &uuml;berarbeite zur Zeit die MCS Dokumentation.<br /><br />\nWenn ich alle Texte &uuml;bersetzt und alle Grafiken &uuml;berarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht wei&szlig;.<br /><br />\nIch hoffe meine Englischen Fans danken es mir.</p>\n', '<p>Ich &uuml;berarbeite zur Zeit die MCS Dokumentation.<br /><br />\nWenn ich alle Texte &uuml;bersetzt und alle Grafiken &uuml;berarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht wei&szlig;.<br /><br />\nIch hoffe meine Englischen Fans danken es mir.</p>\n', 'y39h', 1, 1, 0, '102new_noname.jpg', '2019-06-30 09:22:00', '2025-02-25 15:00:24'),
(138, 1, '2019-09-06 13:58:00', 'Anubis fertig', 1, 1, '<p>Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.<br /><br />\nVielen Dank noch mal an Sigi f&uuml;r die Hilfe bei diesem Bild. Ohne dich h&auml;tte ich das nie geschafft.</p><p>Wer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.</p>\n', '<p>Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.<br /><br />\nVielen Dank noch mal an Sigi f&uuml;r die Hilfe bei diesem Bild. Ohne dich h&auml;tte ich das nie geschafft.</p><p>Wer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.</p>\n', 'yc6u', 1, 1, 0, '106new_noname.jpg', '2019-09-06 11:58:00', '2025-02-25 15:00:24'),
(139, 1, '2019-09-15 08:34:00', 'Shariff Online', 1, 1, '<p>Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.<br /><br />\nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich w&uuml;nsche viel Spa&szlig; beim Teilen meiner Inhalte.</p>\n', '<p>Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.<br /><br />\nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich w&uuml;nsche viel Spa&szlig; beim Teilen meiner Inhalte.</p>\n', 'ywu0', 1, 1, 0, '97new_noname.jpg', '2019-09-15 06:34:00', '2025-02-25 15:00:24'),
(140, 1, '2019-10-03 07:08:00', 'Neue Folgen Funktion', 1, 1, '<p>Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.<br /><br />\nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.</p><p>Nach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie immer im Detail.</p><p>F&uuml;r alle Members, die Standard Einstellung beim folgen ist folgen per E-mail.</p>\n', '<p>Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.<br /><br />\nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.</p><p>Nach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie …</p>\n', 'y4hn', 1, 1, 0, '108new_noname.jpg', '2019-10-03 05:08:00', '2025-02-25 15:00:24'),
(141, 1, '2019-12-23 22:59:00', 'Merry Christmas and a happy New Year', 1, 1, '<p>Auch dieses Jahr geht zu ende und wir haben viel geschafft.<br /><br />\nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genie&szlig;en .</p><p>Ich w&uuml;nsche allen die dies Lesen ein frohes Fest zu Feiern.<br /><br />\nUnd rutscht gut rein....</p>\n', '<p>Auch dieses Jahr geht zu ende und wir haben viel geschafft.<br /><br />\nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genie&szlig;en .</p><p>Ich w&uuml;nsche allen die dies Lesen ein frohes Fest zu Feiern.<br /><br />\nUnd rutscht gut rein....</p>\n', 'yjqp', 1, 1, 0, 'xmas_2019.jpg', '2019-12-23 21:59:00', '2025-02-25 15:00:24'),
(142, 1, '2019-12-28 16:54:00', 'Gut reingerutscht?', 1, 1, '<p>Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.<br /><br />\nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario k&uuml;rzlich in einem Interview zum neuen Jahr.</p><p>Viel Gl&uuml;ck, Leute.</p>\n', '<p>Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.<br /><br />\nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario k&uuml;rzlich in einem Interview zum neuen Jahr.</p><p>Viel Gl&uuml;ck, Leute.</p>\n', 'yc1f', 1, 1, 0, '111new_noname.jpg', '2019-12-28 15:54:00', '2025-02-25 15:00:24'),
(143, 1, '2020-01-12 12:47:00', 'Zwei Faktor Authentifizierung auf Asarios Blog', 1, 1, '<p>Ab jetzt k&ouml;nnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.<br /><br />\nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.<br /><br />\nSicherheit ist f&uuml;r mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.</p><p>Hoffe Ihr genie&szlig;t den Komfort der 2 Faktor Authentifizierung.</p><p>Ehe ich\'s vergesse, hab mal wieder nen paar Wissenshappen unter DidYouKnow verteilt.</p>\n', '<p>Ab jetzt k&ouml;nnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.<br /><br />\nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.<br /><br />\nSicherheit ist f&uuml;r mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.</p><p>Hoffe Ihr genie&szlig;t den Komfort der 2 Faktor Authentifizierung. …</p>\n', 'y9sb', 1, 1, 0, '110new_noname.jpg', '2020-01-12 11:47:00', '2025-02-25 15:00:24'),
(144, 1, '2020-02-23 15:06:00', 'Ich verlasse Bim&ouml;hlen', 1, 1, '<p>N&auml;chste Woche ziehe ich aus Mederius in Bim&ouml;hlen aus.<br /><br />\nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen n&auml;chsten Schritt in Richtung Selbst&auml;ndigkeit. Ich ziehe in eine Teilstation&auml;re WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.</p><p>Ich Spare mir dann 2 Stunden pro Arbeitstag an Fahrerei.<br /><br />\nAllerdings muss ich trotzdem mehr machen, wie Kochen und Putzen.</p><p>Ich bin schon sehr aufgeregt und freue mich.</p>\n', '<p>N&auml;chste Woche ziehe ich aus Mederius in Bim&ouml;hlen aus.<br /><br />\nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen n&auml;chsten Schritt in Richtung Selbst&auml;ndigkeit. Ich ziehe in eine Teilstation&auml;re WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.</p><p>Ich Spare mir dann 2 Stunden pro Arbeitstag an …</p>\n', 'y8mc', 1, 1, 0, '112new_noname.jpg', '2020-02-23 14:06:00', '2025-02-25 15:00:24'),
(145, 1, '2020-03-04 14:47:00', 'Willkommen SE', 1, 1, '<p>Herzlich Willkommen in Bad Segeberg.<br /><br />\nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.<br /><br />\nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.<br /><br />\nIch habe die ersten N&auml;chte hinter mir und es schl&auml;ft sich gut im meinem neuem Bett.<br /><br />\nGr&uuml;&szlig;e aus meinem Homeoffice, Asario 8)</p>\n', '<p>Herzlich Willkommen in Bad Segeberg.<br /><br />\nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.<br /><br />\nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.<br /><br />\nIch habe die ersten N&auml;chte hinter mir und es schl&auml;ft sich gut im meinem neuem Bett.<br /><br />\nGr&uuml;&szlig;e aus meinem Homeoffice, Asario 8) …</p>\n', 'yevm', 1, 1, 0, '113new_noname.jpg', '2020-03-04 13:47:00', '2025-02-25 15:00:24'),
(146, 1, '2020-08-16 11:52:00', 'Neue Bilder gesichtet', 1, 1, '<p>Auch dieses mal hab ich mich kreativ bet&auml;tigt und 2 neue Fineliner Bilder gemalt.<br /><br />\nHoffe sie gefallen euch, in love, Asario</p>\n', '<p>Auch dieses mal hab ich mich kreativ bet&auml;tigt und 2 neue Fineliner Bilder gemalt.<br /><br />\nHoffe sie gefallen euch, in love, Asario</p>\n', 'ytyb', 1, 1, 0, '115new_noname.jpg', '2020-08-16 09:52:00', '2025-02-25 15:00:24'),
(147, 1, '2020-09-06 15:51:00', 'Neues Layout auf Asario.de', 1, 1, '<p>Herzlich willkommen im grey theme von Asarios Blog.<br /><br />\nHoffe ihr findet das Layout auch so gut wie ich.<br /><br />\nIst nur wenig anders aber doch anders.<br /><br />\nHabt Spa&szlig; und kommentiert flei&szlig;ig.<br /><br />\nIn Love, Asario</p>\n', '<p>Herzlich willkommen im grey theme von Asarios Blog.<br /><br />\nHoffe ihr findet das Layout auch so gut wie ich.<br /><br />\nIst nur wenig anders aber doch anders.<br /><br />\nHabt Spa&szlig; und kommentiert flei&szlig;ig.<br /><br />\nIn Love, Asario</p>\n', 'yuz5', 1, 1, 0, '116new_noname.jpg', '2020-09-06 13:51:00', '2025-02-25 15:00:24'),
(148, 1, '2020-12-31 23:32:00', 'Frohes Neues', 1, 1, '<p>An alle Freunde und Bekannte, Ich w&uuml;nsche ein frohes neues 2021.<br /><br />\nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genie&szlig;en k&ouml;nnen. Ich w&uuml;nsche euch allen das Ihr gesund und munter das neue Jahr verlebt.</p><p>Auf ein sch&ouml;nes, gesundes 2021, Asario</p>\n', '<p>An alle Freunde und Bekannte, Ich w&uuml;nsche ein frohes neues 2021.<br /><br />\nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genie&szlig;en k&ouml;nnen. Ich w&uuml;nsche euch allen das Ihr gesund und munter das neue Jahr verlebt.</p><p>Auf ein sch&ouml;nes, gesundes 2021, Asario …</p>\n', 'ymst', 1, 1, 0, '118new_noname.jpg', '2020-12-31 22:32:00', '2025-02-25 15:00:24'),
(149, 1, '2021-08-12 11:14:00', 'Back in town...', 1, 1, '<p>Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.<br /><br />\nHabe w&auml;hrend meines Aufenthalts viel gemalt wie man unter <a href=\"fineliner\">Images-&gt;Fineliner</a> erkennen kann.</p>\n', '<p>Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.<br /><br />\nHabe w&auml;hrend meines Aufenthalts viel gemalt wie man unter <a href=\"fineliner\">Images-&gt;Fineliner</a> erkennen kann.</p>\n', 'yu6s', 1, 1, 0, '119new_noname.jpg', '2021-08-12 09:14:00', '2025-02-25 15:00:24'),
(150, 1, '2021-10-09 18:19:00', 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', 1, 1, '<p>Bin wieder im Lande angekommen.<br /><br />\nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.<br /><br />\nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.</p>\n', '<p>Bin wieder im Lande angekommen.<br /><br />\nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.<br /><br />\nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.</p>\n', 'yxtv', 1, 1, 0, '120new_noname.jpg', '2021-10-09 16:19:00', '2025-02-25 15:00:24'),
(151, 1, '2021-10-09 21:14:00', 'Neues von MCS', 2, 1, '<p>Hallo und willkommen auf meinem Blog in der Rubrik Devlog.</p><p>MCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.</p><p>Wenn alles gut geht werde ich demn&auml;chst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.</p><p>War ne Zeit lang ohne Internet und konnte somit nichts Posten.</p><p>W&uuml;nsche viel Spa&szlig; auf <a href=\"https://www.asario.de\">www.asario.de</a></p>\n', '<p>Hallo und willkommen auf meinem Blog in der Rubrik Devlog.</p><p>MCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.</p><p>Wenn alles gut geht werde ich demn&auml;chst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.</p><p>War ne Zeit lang ohne Internet und konnte somit …</p>\n', 'yxil', 1, 1, 0, '008.jpg', '2021-10-09 19:14:00', '2025-02-25 15:00:24'),
(152, 1, '2021-12-25 09:42:00', 'Merry X-Mas 2021', 1, 1, '<p>Ich w&uuml;nsche euch ein Frohes Fest.<br /><br />\nHoffe es gab lecker Essen und Trinken zu Weihnachten.<br /><br />\nIch habe gestern die 3te von 9 Leinw&auml;nden f&uuml;r mein Gro&szlig;projekt fertig gestellt.<br /><br />\nEl Novem ist noch in Arbeit aber sieht relativ geil aus.</p>\n', '<p>Ich w&uuml;nsche euch ein Frohes Fest.<br /><br />\nHoffe es gab lecker Essen und Trinken zu Weihnachten.<br /><br />\nIch habe gestern die 3te von 9 Leinw&auml;nden f&uuml;r mein Gro&szlig;projekt fertig gestellt.<br /><br />\nEl Novem ist noch in Arbeit aber sieht relativ geil aus.</p>\n', 'y6n5', 1, 1, 0, '121new_noname.jpg', '2021-12-25 08:42:00', '2025-02-25 15:00:24'),
(153, 1, '2022-02-15 11:15:00', 'Neues Feature', 1, 1, '<p>Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.<br /><br />\nHoffe Ihr habt spa&szlig; mit den Sternen.<br /><br />\nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.</p>\n', '<p>Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.<br /><br />\nHoffe Ihr habt spa&szlig; mit den Sternen.<br /><br />\nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.</p>\n', 'ywm8', 1, 1, 0, '123new_noname.png', '2022-02-15 10:15:00', '2025-02-25 15:00:24'),
(154, 1, '2022-04-27 17:13:00', 'Solidarit&auml;t mit der Ukraine', 1, 1, '<p>Ich w&uuml;nsche allen UkrainerInnen da drau&szlig;en das der Krieg bald vor&uuml;ber geht.</p><p>Krieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,<br /><br />\nund wir hoffen das dieser Krieg bald endet.</p><p>In Frieden, Asario</p>\n', '<p>Ich w&uuml;nsche allen UkrainerInnen da drau&szlig;en das der Krieg bald vor&uuml;ber geht.</p><p>Krieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,<br /><br />\nund wir hoffen das dieser Krieg bald endet.</p><p>In Frieden, Asario</p>\n', 'yc6d', 1, 1, 0, '125new_noname.png', '2022-04-18 20:00:00', '2025-02-25 15:00:24'),
(155, 1, '2022-06-19 13:15:00', '3D Printer Objekte', 1, 1, '<p>Happy Birthday to me.<br /><br />\nHabe meinen 3D Drucker in Betrieb genommen und mal was K&uuml;nstlerisches gedruckt.<br /><br />\nEs ist ein Relief erstellt und mit PLA gedruckt worden.<br /><br />\nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.</p><p>Hope you enjoy, Asario</p>\n', '<p>Happy Birthday to me.<br /><br />\nHabe meinen 3D Drucker in Betrieb genommen und mal was K&uuml;nstlerisches gedruckt.<br /><br />\nEs ist ein Relief erstellt und mit PLA gedruckt worden.<br /><br />\nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.</p><p>Hope you enjoy, Asario …</p>\n', 'yhtg', 1, 1, 0, 'dragonbird.jpg', '2022-06-28 20:00:00', '2025-02-25 15:00:24'),
(156, 1, '2022-08-24 16:53:00', 'Neuerungen im System', 2, 1, '<p>habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.</p><p>Ab jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag &amp; Drop &auml;ndern.<br /><br />\nAu&szlig;erdem mal wieder etliche kleinere und gr&ouml;&szlig;ere Bugs behoben.<br /><br />\nW&uuml;nsche viel Spa&szlig; bei meinen Seiten.<br /><br />\nCincerly Paul Rieser aka. Asario</p>\n', '<p>habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.</p><p>Ab jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag &amp; Drop &auml;ndern.</p>\n', 'ybxk', 1, 1, 1, 'inno.jpg', '2024-06-27 14:53:00', '2022-10-09 07:14:00'),
(157, 1, '2022-11-05 14:56:00', 'Neues aus PLA', 1, 1, '<p>Mein 3D Drucker läuft warm und hat mir die Galerie <a href=\"3DPrinter\">3D Printer</a> ermöglicht. Hoffe euch gefallen die Drucke.</p>\n', '<p>Mein 3D Drucker läuft warm und hat mir die Galerie <a href=\"3DPrinter\">3D Printer</a> ermöglicht. Hoffe euch gefallen die Drucke.</p>\n', 'y65q', 1, 1, 0, '126new_noname.jpg', '2022-11-05 13:56:00', '2025-02-25 15:00:24'),
(158, 1, '2023-01-22 13:07:00', 'Happy 2023', 1, 1, '<p>Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten k&ouml;nnen.<br /><br />\nHabe mal wieder an der Sicherheit von MCS gearbeitet.<br /><br />\nW&uuml;nsche viel Spa&szlig; auf meinen Seiten / meiner Seite.</p>\n', '<p>Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten k&ouml;nnen.<br /><br />\nHabe mal wieder an der Sicherheit von MCS gearbeitet.<br /><br />\nW&uuml;nsche viel Spa&szlig; auf meinen Seiten / meiner Seite.</p>\n', 'yr54', 1, 1, 1, '127new_noname.jpg', '2023-01-22 12:07:00', '2025-02-25 15:00:24'),
(159, 1, '2023-01-27 18:03:00', 'Winter in town', 1, 1, '<p>Es ist kalt geworden und der Winter hat uns fest im Griff.<br /><br />\nIch hoffe, ihr müsst nicht raus, es ist  sehr  kalt.<br /><br />\nHabe wieder ein paar Bugs gefunden und beseitigt.<br /><br />\nCiao, Asario</p>\n', '<p>Es ist kalt geworden und der Winter hat uns fest im Griff.<br /><br />\nIch hoffe, ihr müsst nicht raus, es ist  sehr  kalt.<br /><br />\nHabe wieder ein paar Bugs gefunden und beseitigt.<br /><br />\nCiao, Asario</p>\n', 'ypb1', 1, 1, 1, '128new_noname.jpg', '2023-01-27 17:03:00', '2025-02-25 15:00:24'),
(160, 1, '2023-02-04 12:05:00', 'Winter Update', 2, 1, '<p>Auch in diesem Jahr war ich fleissig und habe einiges verbessert.<br /><br />\nDie Google Sitemap wurden &uuml;berarbeitet und versch&ouml;nert.<br /><br />\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.<br /><br />\nBugs waren auch einige dabei, alle behoben.<br /><br />\nHoffe ihr habt spass auf meinen Seiten.</p>\n', '<p>Auch in diesem Jahr war ich fleissig und habe einiges verbessert.<br /><br />\nDie Google Sitemap wurden &uuml;berarbeitet und versch&ouml;nert.<br /><br />\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.<br /><br />\nBugs waren auch einige dabei, alle behoben.<br /><br />\nHoffe ihr habt spass auf meinen Seiten. …</p>\n', 'yjrd', 1, 1, 1, '593f5288d12efe2bcbf95d3ce538d219.jpg', '2023-02-04 11:05:00', '2025-02-25 15:00:24'),
(161, 1, '2023-02-13 08:56:00', 'Frohe Ostern 2023', 1, 1, '<p>Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.<br /><br />\nIn diesem Sinne, Frohe Ostern, Asario</p>\n', '<p>Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.<br /><br />\nIn diesem Sinne, Frohe Ostern, Asario …</p>\n', 'y3yl', 1, 1, 1, '132new_noname.jpg', '2023-02-13 07:56:00', '2025-02-25 15:00:24'),
(162, 1, '2023-02-22 15:10:00', 'Fr&uuml;hling', 1, 1, '<p>Das Ende des Winters bringt eine Veränderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden wärmer und die Tage länger.<br /><br />\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort schön ist wenn die Sonne zu scheinen beginnt. Au&szlig;erdem ist Eekholdt gleich um die Ecke und immer einen Besuch wert.</p>\n', '<p>Das Ende des Winters bringt eine Veränderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden wärmer und die Tage länger.<br /><br />\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort schön ist wenn die Sonne zu scheinen beginnt. …</p>\n', 'y2wj', 1, 1, 1, '149new_noname.jpg', '2023-02-22 14:10:00', '2025-02-25 15:00:24'),
(163, 1, '2023-03-11 12:03:00', 'Verbesserte Feeds', 2, 1, '<p>Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed l&auml;dt jetzt schneller, und seit kurzem auch in Englisch verf&uuml;gbar.</p><p>Momentan arbeite ich noch an der Einbindung von Bildern in den Feeds.</p><p>Nichts desto trotz waren wieder ein paar kleinere Bugs zu beheben die ich k&uuml;rzlich gefixt habe.Und da alles gut l&auml;uft freue ich mich auf kommende Spannende Features die noch entwickelt werden wollen.</p>\n', '<p>Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed l&auml;dt jetzt schneller, und seit kurzem auch in Englisch verf&uuml;gbar.</p><p>Momentan arbeite ich noch an der Einbindung von Bildern in den Feeds.</p><p>Nichts desto trotz waren wieder ein paar …</p>\n', 'yc5u', 1, 1, 1, '473443f6cdb8473c5abbc5a206fbe4a4.jpg', '2023-03-11 11:03:00', '2025-02-25 15:00:24'),
(164, 1, '2023-05-07 08:42:00', 'Neue Sterne', 2, 1, '<p>Neue Sterne<br />\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.<br />\nMarkdown wurde auch aktiviert und ist zun&auml;chst zu Testzwecken auf www.asario.de installiert.<br />\nAlles in allem ist <strong>MCS</strong> wieder einen Schritt weiter gekommen und ich habe den einen oder anderen Bug behoben.<br />\nIch hoffe ihr habt Spa&szlig;, Asario</p>\n', '<p>Neue Sterne<br />\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.<br />\nMarkdown wurde auch aktiviert und ist zun&auml;chst zu Testzwecken auf www.asario.de installiert.<br />\nAlles in allem ist <strong>MCS</strong> …</p>\n', 'yq32', 1, 1, 1, 'c4d8434ed14487a864c344675e07b876.jpg', '2023-05-07 06:42:00', '2025-02-25 15:00:24'),
(165, 1, '2023-05-29 10:02:00', 'Sommer 2023', 2, 1, '<p>Auch in diesem Quartal habe ich wieder einige &Auml;nderungen vorgenommen.<br />\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde &uuml;berarbeitet.<br />\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was f&uuml;r welchen Zweck gesammelt wird.<br />\nDie Bildberbewertung auf asario.de habe ich etwas ver&auml;ndert.<br />\nWenn die Sterne halb gelb sind, hat man noch nicht bewertet, wenn sie ganz gelb sind, wurden schon Sterne vergeben.<br />\nAu&szlig;erdem habe ich wieder ein paar kleine Fehler behoben, die mir im Laufe der Zeit aufgefallen sind.</p><p>Ich w&uuml;nsche euch einen sonnigen Sommer, bis bald, Asario.</p>\n', '<p>Auch in diesem Quartal habe ich wieder einige &Auml;nderungen vorgenommen.<br />\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde &uuml;berarbeitet.<br />\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was f&uuml;r welchen Zweck gesammelt wird.<br />\nDie Bildberbewertung auf …</p>\n', 'yzmv', 1, 1, 1, '140new_noname.jpg', '2023-05-29 08:02:00', '2025-02-25 15:00:24'),
(166, 1, '2023-07-22 13:38:00', 'Sp&auml;tsommer 2023', 1, 1, '<p>ich möchte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu können, dass es wieder aufgetaucht ist und sich auf den Weg nach Berlin gemacht hat! Das ist wirklich aufregend und ich bin gespannt, welche Abenteuer ihn dort erwarten.</p><p>Ich habe in den letzten Tagen und Wochen hart gearbeitet, um einige kleinere Bugs zu beheben und Verbesserungen an meinen Seiten vorzunehmen. Es war eine Herausforderung, aber es hat sich definitiv gelohnt. Ich möchte, dass ihr als Besucher ein optimales Erlebnis habt und euch auf meinen Seiten wohlfühlt. Deshalb ist es mir wichtig, diese technischen Hürden aus dem Weg zu räumen und das Beste aus meinen Websites herauszuholen.</p><p>Ich freue mich auf die kommenden Wochen und Monate und hoffe, dass ihr weiterhin mit mir auf meiner Reise seid. Eure Unterstützung und Begeisterung bedeuten mir alles. Lasst uns gemeinsam diese aufregende Zeit genie&szlig;en und viele unvergessliche Momente teilen.</p><p>Hoffe Ihr habt Spa&szlig; auf meinen Seiten, in Love, Asario</p>\n', '<p>ich möchte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu können, dass es wieder aufgetaucht ist und sich …</p>\n', 'y1jr', 2, 1, 1, '143new_noname.jpg', '2023-07-22 11:38:00', '2025-02-25 15:00:24'),
(167, 1, '2023-08-21 13:27:00', 'Herbst 2023', 1, 1, '<p>Hallo zusammen!</p><p>Ich habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und l&auml;stige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verl&auml;uft. Die gem&uuml;tlichen Vibes des Herbstes begleiten nun eure Uploads.</p><p>Eine benutzerfreundliche Oberfl&auml;che erm&ouml;glicht es Nutzern, Inhalte schnell hochzuladen, zu organisieren und anzuzeigen, ohne technisches Fachwissen zu ben&ouml;tigen. Dies spart Zeit und M&uuml;he bei der Verwaltung von Dateien/Bildern und erleichtert die Fokussierung auf die eigentliche Inhaltsproduktion.</p><p>Insgesamt bietet das neu gestaltete Upload-Skript eine verbesserte Benutzererfahrung und tr&auml;gt dazu bei, den Arbeitsablauf bei der Erstellung und Verwaltung von Inhalten zu optimieren.</p><p>Ich w&uuml;nsche euch einen wundersch&ouml;nen Herbst voller W&auml;rme und Freude.</p>\n', '<p>Hallo zusammen!</p><p>Ich habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und l&auml;stige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verl&auml;uft. Die gem&uuml;tlichen Vibes des Herbstes begleiten nun eure Uploads.</p><p>Eine benutzerfreundliche Oberfl&auml;che erm&ouml;glicht es Nutzern, Inhalte schnell …</p>\n', 'y2vo', 1, 1, 1, '145new_noname.jpg', '2023-08-21 11:27:00', '2025-02-25 15:00:24'),
(168, 1, '2023-11-30 16:05:00', 'Winter & 2fa', 1, 1, '<p>Der Winter hüllte die Welt in ein schneeweißes Märchen. Schlittenfahrten und fröhliche Abenteuer auf den Hügeln lie&szlig;en uns den Zauber der kalten Tage spüren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige Wärme gemütliche Stunden bescherten.</p><p><strong>Natur und Gemeinschaft:</strong><br />\nDie verschneite Landschaft und klirrend kalte Nächte schufen eine bezaubernde Kulisse. Gleichzeitig lie&szlig;en Nachbarschaftshilfe und winterliche Aktivitäten eine wohltuende Gemeinschaft entstehen. Dieser Wintermonat wurde zu einer Zeit der inneren Einkehr, kulinarischer Freuden und Vorfreude auf das Erwachen der Natur im kommenden Frühling.</p><p><strong>Zwei-Faktor-Authentifizierung Update für Asario.de:</strong></p><p>Wir freuen uns, Ihnen mitteilen zu können, dass Asario.de jetzt OTP (One-Time Passwords) unterstützt, um Ihren Login noch sicherer zu gestalten. Diese Funktion finden Sie in den Profil-Einstellungen unter <strong>2FA aktivieren</strong>.</p><p>Zusätzlich haben wir die Möglichkeit integriert, Ihre Kontowiederherstellungscodes direkt in Ihrem Benutzerprofil zu verwalten. Diese zusätzliche Sicherheitsma&szlig;nahme gewährleistet ein hohes Sicherheitsniveau<br />\nBitte beachten Sie: Geben Sie die Codes niemals an andere weiter. Wir werden Sie niemals nach den 2fa-Codes fragen.<br />\nBei Fragen oder Anliegen stehen wir Ihnen jederzeit zur Verfügung.</p>\n', '<p>Der Winter hüllte die Welt in ein schneeweißes Märchen. Schlittenfahrten und fröhliche Abenteuer auf den Hügeln lie&szlig;en uns den Zauber der kalten Tage spüren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige Wärme …</p>\n', 'yjbp', 2, 1, 1, '150new_noname.jpg', '2023-11-30 14:05:00', '2025-02-25 15:00:24'),
(169, 1, '2023-10-31 20:02:00', 'Halloween 2023', 1, 1, '<p>Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verrücktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haustür sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. Also, schnapp dir dein Kostüm und mach dich bereit für eine unvergessliche Halloween-Nacht!</p>\n', '<p>Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verrücktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haustür sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. …</p>\n', 'yzif', 1, 1, 1, 'a677f351307d2071c97811e777145a05.jpg', '2023-10-31 19:02:00', '2025-02-25 15:00:24'),
(170, 1, '2023-11-22 15:01:00', 'Update zur Zwei-Faktor-Authentifizierung', 2, 1, '<p>ich freue mich, Ihnen mitteilen zu k&ouml;nnen, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine gro&szlig;artige Funktion zur Verf&uuml;gung: Wiederherstellungscodes! F&uuml;r den Fall, dass Ihr Handy einmal nicht verf&uuml;gbar ist, k&ouml;nnen Sie diese Codes nutzen, um sich einzuloggen.</p><p>Nach der Aktivierung der Zwei-Faktor-Authentifizierung zeigt Ihnen die Seite Ihre pers&ouml;nlichen Wiederherstellungscodes an. Sie finden diese in Ihrem Benutzerprofil unter Profil-Einstellungen au&szlig;erdem &uuml;ber dem &quot;Wiederherstellungscodes&quot;-Button.</p><p>F&uuml;r eventuelle Fragen oder Unterst&uuml;tzung stehen wir Ihnen gerne zur Verf&uuml;gung. Bitte beachten Sie: Geben Sie diese Codes niemals an andere weiter. Sicherheit hat bei uns oberste Priorit&auml;t!</p><p>Mit freundlichen Gr&uuml;&szlig;en, Asario</p>\n', '<p>ich freue mich, Ihnen mitteilen zu k&ouml;nnen, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine gro&szlig;artige Funktion zur Verf&uuml;gung: Wiederherstellungscodes! F&uuml;r den Fall, dass Ihr Handy einmal nicht verf&uuml;gbar ist, k&ouml;nnen Sie diese …</p>\n', 'ye1x', 1, 1, 1, '9a3f1215f2d676158f59b107dbf8325e.jpg', '2023-11-21 22:00:00', '2025-02-25 15:00:24'),
(171, 1, '2023-12-16 16:09:00', 'Frohe Weihnachten 2023', 1, 1, '<p>Die festliche Jahreszeit ist angebrochen, und mit jedem Tag wächst die Vorfreude auf das Weihnachtsfest. In den geschmückten Stra&szlig;en und liebevoll dekorierten Häusern spiegelt sich die warme Atmosphäre dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der Auswahl von Geschenken, dem Zubereiten köstlicher Mahlzeiten oder dem Teilen von Traditionen.</p><p>Weihnachten ist mehr als nur ein festlicher Anlass; es ist eine Zeit der Besinnung. Inmitten von Geselligkeit und Freude sollten wir auch innehalten, um das vergangene Jahr zu reflektieren. Möge die Magie von Weihnachten uns mit Liebe, Mitgefühl und Hoffnung erfüllen. Frohe Weihnachten an euch alle!</p>\n', '<p>Die festliche Jahreszeit ist angebrochen, und mit jedem Tag wächst die Vorfreude auf das Weihnachtsfest. In den geschmückten Stra&szlig;en und liebevoll dekorierten Häusern spiegelt sich die warme Atmosphäre dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der …</p>\n', 'ymvh', 1, 1, 1, 'd8b5586b1f97adedb44b92e51d6762b7.jpg', '2023-12-16 15:09:00', '2025-02-25 15:00:24'),
(172, 1, '2024-01-09 21:14:00', 'KI, Webdesign, Kunst und Fotografie', 3, 1, '<p>Als leidenschaftlicher Blogger erkunde ich in meinen Beiträgen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der Künstlichen Intelligenz über innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - ich möchte euch auf kurzweilige Weise inspirieren und ihre Neugier für diese spannenden Themen wecken. Begleite mich auf dieser Entdeckungsreise durch die faszinierende Fusion von Technologie und Kreativität!</p>\n', '<p>Als leidenschaftlicher Blogger erkunde ich in meinen Beiträgen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der Künstlichen Intelligenz über innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - …</p>\n', 'yo1x', 1, 1, 1, '96f9dbb805e3adc181299068c822bb9e.jpg', '2024-01-09 20:14:00', '2025-02-25 15:00:24');
INSERT INTO `blogs` (`id`, `pub`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `autoslug`, `reading_time`, `markdown_on`, `xis_aiImage`, `image_path`, `created_at`, `updated_at`) VALUES
(173, 1, '2024-03-14 15:10:00', 'Fr&uuml;hling', 1, 1, '<p>Ja, der Fr&uuml;hling steht vor der T&uuml;r, und mit ihm kommt auch Ostern n&auml;her. In vielen Teilen der Welt ist der Fr&uuml;hling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden l&auml;nger, die Blumen bl&uuml;hen, und die Temperaturen steigen langsam an.</p><p>Ostern ist ein festliches Ereignis, das in vielen Kulturen und Traditionen gefeiert wird. Es markiert die Auferstehung Jesu Christi und wird oft mit verschiedenen Br&auml;uchen und Feierlichkeiten begangen. Dazu geh&ouml;ren das F&auml;rben und Verstecken von Ostereiern, das Dekorieren von Osternestern, Osterm&auml;rkte, Osterfeuer und vieles mehr.</p><p>Es ist eine Zeit der Freude, des Zusammenseins mit Familie und Freunden und des Genie&szlig;ens der Fr&uuml;hlingsstimmung. Egal, ob man religi&ouml;se Rituale begeht oder einfach die Gelegenheit nutzt, um sich zu entspannen und das sch&ouml;ne Wetter zu genie&szlig;en, der Fr&uuml;hling und Ostern bieten eine willkommene Abwechslung nach den kalten Wintermonaten.</p>\n', '<p>Ja, der Fr&uuml;hling steht vor der T&uuml;r, und mit ihm kommt auch Ostern n&auml;her. In vielen Teilen der Welt ist der Fr&uuml;hling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden l&auml;nger, die Blumen bl&uuml;hen, und die Temperaturen steigen langsam …</p>\n', 'yfr1', 1, 1, 1, '7b3cd6e8c28cc9ee80b122d085f9ff79.jpg', '2024-03-13 22:00:00', '2025-02-25 15:00:24'),
(174, 1, '2024-04-21 13:54:00', 'Sommer 2024', 1, 1, '<p>Der Sommer steht vor der Tür und bringt warme Temperaturen, sonnige Tage und endlose Möglichkeiten für Outdoor-Aktivitäten mit sich. Es ist die perfekte Zeit, um die Natur zu genießen, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand entspannst, wandern gehst oder einfach nur die warmen Sommerabende genießt, diese Jahreszeit bietet für jeden etwas.</p><p>Nutze den Sommer, um neue Hobbys auszuprobieren, Freunde zu treffen und unvergessliche Momente zu schaffen. Es ist eine Zeit des Neubeginns, der Erholung und der Freude. Also pack die Sonnencreme ein, zieh deine Sommerschuhe an und mach dich bereit, den Sommer in vollen Zügen zu genießen!</p>\n', '<p>Der Sommer steht vor der Tür und bringt warme Temperaturen, sonnige Tage und endlose Möglichkeiten für Outdoor-Aktivitäten mit sich. Es ist die perfekte Zeit, um die Natur zu genießen, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand …</p>\n', 'yqyz', 1, 1, 1, '2cb4d6cdd6b5a3b3551824c54d9b3cc0.jpg', '2024-04-21 11:54:00', '2025-02-25 15:00:24'),
(175, 1, '2024-06-27 16:53:00', 'Neues Layout', 2, 1, '<p>Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgf&auml;ltig ausgew&auml;hlt.<br />\nIch hoffe, dass euch das neue Design genauso gut gef&auml;llt wie mir. Schaut euch um und lasst mich wissen, was Ihr  denkt!</p><p>Vielen Dank, dass ihr Teil unserer Community seid.</p><p>Euer Team</p>\n', '<p>Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgf&auml;ltig ausgew&auml;hlt.</p>\n', 'yh8m', 1, 1, 0, 'a72b888abc6d4430a697c77ff2adabf8.png', '2024-06-27 14:53:00', '2024-07-16 20:00:00'),
(176, 1, '2024-08-08 10:08:00', 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', 2, 1, '<p><strong>Einleitung:</strong><br />\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost m&ouml;chte ich meine Erfahrungen und die Schritte, die ich unternommen habe, mit euch teilen.</p><p><strong>Warum PHP 8.2?</strong><br />\nPHP 8.2 bringt viele neue Features und Verbesserungen, die sowohl die Performance als auch die Sicherheit betreffen. Besonders interessant fand ich die verbesserten Type Declarations und die optimierten Fehlerbehandlungsmechanismen. Allerdings bedeutet ein Versionssprung auch, dass bestehender Code &Uuml;berarbeitet werden muss.</p><p>Die Herausforderung: Variablen deklarieren<br />\nEin gro&szlig;es Problem, auf das ich stie&szlig;, war, dass PHP 8.2 strenger mit der Variablendeklaration umgeht. Das bedeutet, dass ich in meinem Code viele Variablen explizit deklarieren musste, bevor sie verwendet wurden. Das war zeitaufwendig, weil ich jeden einzelnen Fall durchgehen und sicherstellen musste, dass alle Variablen korrekt initialisiert sind.</p><p><strong>Die Testphase: Alles durchprobieren</strong><br />\nNachdem ich die Variablen angepasst hatte, begann die intensive Testphase. Ich musste alle Funktionen und Skripte durchprobieren, um sicherzustellen, dass sie unter PHP 8.2 wie gew&uuml;nscht funktionieren. Es war frustrierend, auf unerwartete Fehlermeldungen zu sto&szlig;en, aber nach und nach konnte ich alle Probleme beheben.</p><p>Das Ergebnis: Ein schnelleres und sichereres System<br />\nNach all der Arbeit kann ich stolz sagen, dass mein System nun unter PHP 8.2 l&auml;uft - und das schneller und sicherer als je zuvor. Die M&uuml;he hat sich gelohnt, und ich bin gespannt, wie sich diese Optimierungen langfristig auswirken werden.</p><p><strong>Fazit:</strong><br />\nDie Aktualisierung auf PHP 8.2 war eine Herausforderung, aber auch eine wertvolle Lernerfahrung. Wenn du ebenfalls dar&uuml;ber nachdenkst, PHP auf deinem Server zu aktualisieren, empfehle ich dir, gr&uuml;ndlich zu testen und dich auf einige Anpassungen im Code vorzubereiten. Es lohnt sich!</p>\n', '<p><strong>Einleitung:</strong><br />\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost m&ouml;chte ich meine Erfahrungen und die Schritte, die ich unternommen …</p>\n', 'ye4v', 2, 1, 1, '9443b4d9d13c07d1de2607cbc2b1f147.jpg', '2024-08-08 08:08:00', '2025-02-25 15:00:24'),
(177, 1, '2024-08-18 12:25:00', 'Laravel Erfahrungen', 2, 1, '<p>Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights geh&ouml;rt eine Blog-Komponente, die es den Nutzern erm&ouml;glicht, Beitr&auml;ge zu erstellen und zu verwalten.</p><p>Dar&uuml;ber hinaus habe ich eine sichere Login-/Logout-Funktion entwickelt, die durch OTP-Codes (Einmalpassw&ouml;rter) gesch&uuml;tzt ist. Dabei wird der OTP-Code via QR-Code eingelesen, was die Sicherheit und Benutzerfreundlichkeit weiter erh&ouml;ht.</p><p>Auch die Profileinstellungen sind umfangreich: Benutzer k&ouml;nnen ihre E-Mail-Adresse &auml;ndern und ihr Passwort erneuern. Diese Funktionen bieten eine solide Basis f&uuml;r die Verwaltung von Benutzerkonten und tragen zur Sicherheit der Plattform bei.</p><p>Ich freue mich darauf, meine Kenntnisse in Laravel weiter zu vertiefen und das Projekt kontinuierlich zu erweitern.</p>\n', '<p>Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights geh&ouml;rt eine Blog-Komponente, die es den Nutzern erm&ouml;glicht, Beitr&auml;ge zu erstellen und zu verwalten.</p><p>Dar&uuml;ber hinaus habe ich eine sichere …</p>\n', 'yp38', 1, 1, 1, '1f19113fd5e6d3034053946fa19216ce.jpg', '2024-08-18 10:25:00', '2025-02-25 15:00:24'),
(178, 1, '2024-10-31 09:35:00', 'Und schon wieder haben wir Halloween!', 1, 1, '<p>Halloween ist wieder da - die Stra&szlig;en f&uuml;llen sich mit K&uuml;rbislaternen, die Kinder schl&uuml;pfen in schaurige Kost&uuml;me, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativit&auml;t Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Br&auml;uchen hat, hat sich l&auml;ngst &uuml;ber die ganze Welt verbreitet und begeistert Jung und Alt. Ob gespenstische Deko, ausgeh&ouml;hlte K&uuml;rbisse oder einfach ein gem&uuml;tlicher Horrorfilmabend - Halloween bringt die Menschen auf eine unbeschwerte, magische Weise zusammen.</p><p>Doch Halloween ist mehr als nur ein Fest des Schreckens. Es ist auch ein Spiegel f&uuml;r unsere Fantasie und Kreativit&auml;t. Jedes Kost&uuml;m, jede verzierte Haust&uuml;r und jede handgemachte K&uuml;rbislaterne erz&auml;hlt eine eigene Geschichte. Vielleicht ist das der eigentliche Zauber von Halloween: einen Abend lang in eine andere Welt einzutauchen, zusammen mit Freunden und Familie die Nacht zu erobern und sich gemeinsam vor dem Spuk zu gruseln - nur um am n&auml;chsten Morgen mit einem Schmunzeln an das Abenteuer zur&uuml;ckzudenken.</p>\n', '<p>Halloween ist wieder da - die Stra&szlig;en f&uuml;llen sich mit K&uuml;rbislaternen, die Kinder schl&uuml;pfen in schaurige Kost&uuml;me, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativit&auml;t Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Br&auml;uchen hat, hat sich l&auml;ngst …</p>\n', 'ykgu', 1, 1, 1, '88d46e6c705129501bdd680082b4ff7e.jpg', '2024-10-31 08:35:00', '2025-02-25 15:00:24'),
(179, 1, '2024-12-07 14:36:00', 'X-Mas 2024', 1, 1, '<p>Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleicherma&szlig;en, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die k&uuml;hle Luft tr&auml;gt den Hauch von Winter, w&auml;hrend die Bewegung die Herzen erw&auml;rmt. Schlittschuhlaufen - ein schwebendes Gl&uuml;ck, das die Tage heller und die N&auml;chte leichter macht.</p><p>Am Rande der Bahnen str&ouml;mt der Duft von Gl&uuml;hwein und gebrannten Mandeln durch die kalte Luft, eine Einladung zum Verweilen. Der Gl&uuml;hwein, tiefrot und w&uuml;rzig, w&auml;rmt H&auml;nde und Seele, w&auml;hrend die s&uuml;&szlig;en Mandeln knuspernd Erinnerungen an vergangene Jahre heraufbeschw&ouml;ren. Inmitten des bunten Treibens auf den Weihnachtsm&auml;rkten entfaltet sich eine stille Harmonie - eine Feier des Augenblicks, voller Vertrautheit und leiser Freude.</p>\n', '<p>Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleicherma&szlig;en, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die k&uuml;hle Luft tr&auml;gt den Hauch von Winter, w&auml;hrend die …</p>\n', 'y619', 1, 1, 1, 'ae9cca18e24abc8d33617425f56ad5ad.jpg', '2024-12-07 13:36:00', '2025-02-25 15:00:24'),
(180, 1, '2025-02-02 20:49:01', 'Warum MCSL auf Laravel/Vue basiert - Die Technologie hinter diesem Blog', 2, 1, '<p>In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die <strong>Flexibilität</strong>, <strong>Skalierbarkeit</strong> und <strong>Benutzerfreundlichkeit</strong> von Laravel. Heute möchte ich ein wenig darüber sprechen, warum <strong>MCSL</strong> auf Laravel basiert und wie es gemeinsam mit <strong>Vue.js</strong> das <strong>Rückgrat</strong> unseres Blogs bildet.</p>\n<hr><h2>Warum Laravel?</h2><p>Laravel ist ein <strong>PHP-Framework</strong>, das für seine <strong>elegante Syntax</strong>, <strong>robusten Funktionen</strong> und <strong>entwicklerfreundlichen Tools</strong> bekannt ist. Es vereinfacht den Entwicklungsprozess und bietet gleichzeitig leistungsstarke Funktionen. Mit Features wie <strong>Authentifizierung</strong>, <strong>Routing</strong>, <strong>Sessions</strong> und <strong>Caching</strong> stellt Laravel alles zur Verfügung, was benötigt wird, um leistungsstarke Webanwendungen wie <strong>MCSL</strong> zu entwickeln.</p><h3><strong>Wichtige Gründe, warum Laravel die Basis von MCSL ist:</strong></h3>\n<ul><br>\n<li>\n<p><strong>Schnelle Entwicklungszeiten:</strong><br><br>\nLaravel\'s <strong>Artisan CLI</strong> automatisiert wiederkehrende Aufgaben und beschleunigt so den Entwicklungsprozess erheblich.</p>\n</li>\n<li>\n<p><strong>Modularität:</strong><br><br>\nLaravel\'s <strong>modulare Architektur</strong> ermöglicht es uns, Funktionen wie <strong>Benutzerverwaltung</strong>, <strong>API-Integrationen</strong> und <strong>Datenverwaltung</strong> einfach zu implementieren und zu erweitern.</p>\n</li>\n<li>\n<p><strong>Sicherheit:</strong><br><br>\nLaravel bietet integrierten Schutz vor gängigen Sicherheitslücken wie <strong>CSRF</strong>, <strong>SQL-Injektionen</strong> und <strong>XSS-Angriffen</strong>, wodurch MCSL von Anfang an sicher ist.</p>\n</li>\n</ul><br>\n<hr><h2><strong>Warum Vue.js?</strong></h2><p>Vue.js ist ein <strong>JavaScript-Framework</strong>, das speziell dafür entwickelt wurde, benutzerfreundliche und reaktive Benutzeroberflächen zu erstellen. Zusammen mit Laravel bildet es eine perfekte Kombination für moderne Webanwendungen.</p><h3><strong>Vorteile von Vue.js in MCSL:</strong></h3>\n<ul><br>\n<li>\n<p><strong>Echtzeit-Updates:</strong><br><br>\nVue.js ermöglicht es, <strong>Benutzerinteraktionen</strong> ohne komplette Seitenaktualisierungen zu verarbeiten, sodass Änderungen in Echtzeit angezeigt werden.</p>\n</li>\n<li>\n<p><strong>Komponentenstruktur:</strong><br><br>\nVue.js erlaubt es, verschiedene Teile der Anwendung als unabhängige, wiederverwendbare Komponenten zu erstellen. Das fördert eine <strong>saubere und modulare Codebasis</strong>.</p>\n</li>\n<li>\n<p><strong>Interaktive Benutzeroberflächen:</strong><br><br>\nVue.js ermöglicht es, <strong>dynamische und benutzerfreundliche Oberflächen</strong> zu entwickeln, die direkt mit Laravel\'s API kommunizieren.</p>\n</li>\n</ul><br>\n<hr><h2><strong>MCSL: Laravel und Vue.js im Zusammenspiel</strong></h2><p>MCSL ist mehr als nur ein <strong>Content-Management-System (CMS)</strong> â€” es ist eine moderne Webplattform, die von den <strong>Stärken von Laravel und Vue.js</strong> profitiert. Laravel fungiert dabei als <strong>starke Backend-Architektur</strong>, während Vue.js eine <strong>dynamische und reaktionsschnelle Benutzeroberfläche</strong> bereitstellt.</p><h3><strong>Kernkomponenten der MCSL-Architektur:</strong></h3>\n<ul><br>\n<li>\n<p><strong>Echtzeit-Datenverwaltung:</strong><br><br>\nLaravel und Vue.js ermöglichen es, Daten in Echtzeit zu aktualisieren und anzuzeigen.</p>\n</li>\n<li>\n<p><strong>Nahtlose API-Integration:</strong><br><br>\nLaravel bietet leistungsstarke APIs, die von Vue.js genutzt werden, um eine reibungslose Benutzererfahrung zu gewährleisten.</p>\n</li>\n<li>\n<p><strong>Dynamische Benutzeroberflächen:</strong><br><br>\nDank Vue.js kann MCSL interaktive Funktionen wie Drag-and-Drop, Inline-Bearbeitung und Live-Datenaktualisierungen bieten.</p>\n</li>\n</ul><br>', '<p>In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die <strong>Flexibilität</strong>, <strong>Skalierbarkeit</strong> und <strong>Benutzerfreundlichkeit</strong> von Laravel. Heute möchte ich ein wenig darüber sprechen, warum <strong>MCSL</strong> auf Laravel basiert und wie es gemeinsam mit <strong>Vue.js</strong> das <strong>Rückgrat</strong> unseres Blogs bildet. …</p>', 'ylpa', 2, 1, 1, 'ef4f0c6ab9ff165247738d00d9a5afad.jpg', '2025-03-14 18:39:01', '2025-05-10 08:42:26'),
(263, 1, '2024-12-31 23:00:00', 'Sylvester 2024-2025', 1, 1, '<div>Und schon wieder ist ein Jahr vergangen, und es f&uuml;hlt sich an, als h&auml;tten wir gerade erst die Korken f&uuml;r das neue Jahr knallen lassen. Ein Jahr voller H&ouml;hen und Tiefen, voller Herausforderungen, aber auch voller Chancen liegt hinter uns. W&auml;hrend die Welt nicht stillstand und sich die Technologie in rasantem Tempo weiterentwickelte, schrieb jeder von uns seine eigene Geschichte.</div><div><br></div><div>2024 war ein Jahr, in dem k&uuml;nstliche Intelligenz weiterhin f&uuml;r Schlagzeilen sorgte und unseren Alltag pr&auml;gte. ChatGPT, DALL-E und Co. wurden nicht nur besser, sondern auch pr&auml;senter in unserem Leben. Die Arbeitswelt, die Kreativwirtschaft und sogar unser soziales Miteinander wurden durch diese Technologien beeinflusst - und das nicht immer ohne Kontroversen. Doch eines bleibt klar: Wir stehen erst am Anfang einer Revolution, die unsere Welt grundlegend ver&auml;ndern wird.</div>', '<div>Und schon wieder ist ein Jahr vergangen, und es f&uuml;hlt sich an, als h&auml;tten wir gerade erst die Korken f&uuml;r das neue Jahr knallen lassen. Ein Jahr voller H&ouml;hen und Tiefen, voller Herausforderungen,...</div>', 'y7kh', 1, 0, 1, '/6d223211b939c554835b86a1f81ca2bb.jpg', '2024-12-31 23:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_authors`
--

DROP TABLE IF EXISTS `blog_authors`;
CREATE TABLE `blog_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `users_id` bigint(11) NOT NULL,
  `info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_authors`
--

INSERT INTO `blog_authors` (`id`, `name`, `users_id`, `info`, `created_at`, `updated_at`) VALUES
(1, 'Asario', 1, '<p>Seit &uuml;ber 20 Jahren PHP Developer, nun geht\'s an Laravel &amp; VUE</p>\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `summary`, `created_at`, `updated_at`) VALUES
(1, 'News', '<p>Neuigkeiten</p>\n', '2025-01-22 17:00:24', NULL),
(2, 'Devlog', '<p>Developer Log</p>\n', '2025-01-22 17:02:27', NULL),
(3, 'Mindblog', '<p>Meine Gedankenwelt, Alles was mich besch&auml;ftigt</p>\n', '2025-01-22 17:04:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_images`
--

DROP TABLE IF EXISTS `blog_images`;
CREATE TABLE `blog_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT 'http://localhost:8000/images/blog_empty.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_images`
--

INSERT INTO `blog_images` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Kein Bild vorhanden', '/images/blogs/008.jpg', '2025-01-18 20:37:03', '2025-01-18 20:37:03'),
(2, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2006-09-20 18:18:00', '2006-09-20 18:18:00'),
(3, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2006-09-21 19:00:00', '2006-09-21 19:00:00'),
(4, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2006-09-27 21:28:00', '2006-09-27 21:28:00'),
(5, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2007-06-04 17:32:00', '2007-06-04 17:32:00'),
(6, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-01-07 22:16:00', '2008-01-07 22:16:00'),
(7, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-01-14 10:02:00', '2008-01-14 10:02:00'),
(8, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-01-15 09:48:00', '2008-01-15 09:48:00'),
(9, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-01-27 09:00:00', '2008-01-27 09:00:00'),
(10, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-02-17 11:56:00', '2008-02-17 11:56:00'),
(11, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2008-11-28 11:27:00', '2008-11-28 11:27:00'),
(12, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2010-01-10 10:41:00', '2010-01-10 10:41:00'),
(13, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2010-01-12 17:09:00', '2010-01-12 17:09:00'),
(14, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2010-06-19 20:31:00', '2010-06-19 20:31:00'),
(15, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2010-08-14 20:31:00', '2010-08-14 20:31:00'),
(16, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2010-12-26 14:35:00', '2010-12-26 14:35:00'),
(17, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-06-27 17:33:00', '2011-06-27 17:33:00'),
(18, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-06-27 17:35:00', '2011-06-27 17:35:00'),
(19, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-06-27 17:49:00', '2011-06-27 17:49:00'),
(20, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-07-29 16:30:00', '2011-07-29 16:30:00'),
(21, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(22, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(23, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-09-25 14:54:00', '2011-09-25 14:54:00'),
(24, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-10-28 18:43:00', '2011-10-28 18:43:00'),
(25, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2011-12-04 18:58:00', '2011-12-04 18:58:00'),
(26, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-01-01 18:54:00', '2012-01-01 18:54:00'),
(27, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-02-12 19:23:00', '2012-02-12 19:23:00'),
(28, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-08-21 13:43:00', '2012-08-21 13:43:00'),
(29, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-09-09 17:46:00', '2012-09-09 17:46:00'),
(30, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-11-22 19:50:00', '2012-11-22 19:50:00'),
(31, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2012-12-02 19:17:00', '2012-12-02 19:17:00'),
(32, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2013-01-06 19:31:00', '2013-01-06 19:31:00'),
(33, 'Wieder was von der Bilderfront.', '/images/blogs/jquery.jpg', '2013-01-27 19:06:00', '2013-01-27 19:06:00'),
(34, 'Wie man aus 4 Leinw&auml;nden 1 Lichtobjekt macht....', '/images/blogs/auriel.jpg', '2013-05-20 17:26:00', '2013-05-20 17:26:00'),
(35, 'Neuer Fernseher in Asarios Home Office.', '/images/blogs/bigtv.jpg', '2013-05-20 17:52:00', '2013-05-20 17:52:00'),
(36, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2013-06-23 19:37:00', '2013-06-23 19:37:00'),
(37, 'Smilies all over the World', '/images/blogs/smilies.jpg', '2013-06-23 19:38:00', '2013-06-23 19:38:00'),
(38, 'Alles Neue Macht der Juli.', '/images/blogs/juli.jpg', '2013-07-14 17:55:00', '2013-07-14 17:55:00'),
(39, 'Der Fernseher h&auml;ngt an der Wand ;)', '/images/blogs/tvset.jpg', '2013-08-11 18:00:00', '2013-08-11 18:00:00'),
(40, 'Frohes Neues - 2014 - ein Gl&uuml;cksjahr', '/images/blogs/NEW_YEAR2.jpg', '2014-01-05 18:14:00', '2014-01-05 18:14:00'),
(41, 'Neues Layout !', '/images/blogs/lampen.jpg', '2014-02-10 19:02:00', '2014-02-10 19:02:00'),
(42, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-03-02 19:04:00', '2014-03-02 19:04:00'),
(43, 'Ausstellung in Kaltenkirchen', '/images/blogs/ausstellung.png', '2014-03-31 17:07:00', '2014-03-31 17:07:00'),
(44, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-04-13 17:35:00', '2014-04-13 17:35:00'),
(45, 'Frohe Ostern... Der Osterhase war da!', '/images/blogs/easter.png', '2014-04-27 17:36:00', '2014-04-27 17:36:00'),
(46, '3 neue Galerien', '/images/blogs/newgal.jpg', '2014-06-17 17:31:00', '2014-06-17 17:31:00'),
(47, 'Bewertungsfunktion f&uuml;r Bilder.', '/images/blogs/starz.jpg', '2014-08-25 17:49:00', '2014-08-25 17:49:00'),
(48, 'Mein neues Bike', '/images/blogs/Hubertus.JPG', '2014-10-19 17:29:00', '2014-10-19 17:29:00'),
(49, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-10-25 16:14:00', '2014-10-25 16:14:00'),
(50, 'New Images', '/images/blogs/saurier.jpg', '2014-11-02 14:33:00', '2014-11-02 14:33:00'),
(51, 'Mein erster Ritt...', '/images/blogs/Horseriding.jpg', '2014-11-16 17:49:00', '2014-11-16 17:49:00'),
(52, 'Frohe Weihnachten und einen...', '/images/blogs/coca2.jpg', '2014-12-05 18:30:00', '2014-12-05 18:30:00'),
(53, 'Der Fr&uuml;hling kommt.', '/images/blogs/spring2015.jpg', '2015-03-20 17:49:00', '2015-03-20 17:49:00'),
(54, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-03-20 17:51:00', '2015-03-20 17:51:00'),
(55, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-03-20 17:55:00', '2015-03-20 17:55:00'),
(56, 'Elke ist tod. :(', '/images/blogs/elke_history.jpg', '2015-05-05 16:16:00', '2015-05-05 16:16:00'),
(57, 'Neue BilderÃ‚Â²', '/images/blogs/easter_2015.jpg', '2015-05-05 16:18:00', '2015-05-05 16:18:00'),
(58, 'Neue Fineliner Bilder gesichtet...', '/images/blogs/dragon.jpg', '2015-07-05 16:19:00', '2015-07-05 16:19:00'),
(59, 'Shopping Tour in Neum&uuml;nster', '/images/blogs/new_shoes.jpg', '2015-07-19 17:21:00', '2015-07-19 17:21:00'),
(60, 'Haare AB!', '/images/blogs/haircut.jpg', '2015-08-04 16:13:00', '2015-08-04 16:13:00'),
(61, 'Ricklinger Jahresfest 2015', '/images/blogs/jahresfest.jpg', '2015-08-30 18:26:00', '2015-08-30 18:26:00'),
(62, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-09-06 17:29:00', '2015-09-06 17:29:00'),
(63, 'Neue Shortstories', '/images/blogs/short_st.jpg', '2015-09-15 16:44:00', '2015-09-15 16:44:00'),
(64, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-10-04 18:03:00', '2015-10-04 18:03:00'),
(65, 'JQuery UI integrated', '/images/blogs/jquery.jpg', '2015-10-13 16:50:00', '2015-10-13 16:50:00'),
(66, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-10-27 17:00:00', '2015-10-27 17:00:00'),
(67, 'Neues Kleid f&uuml;r alte Ger&uuml;ste.', '/images/blogs/sar.jpg', '2015-10-27 17:02:00', '2015-10-27 17:02:00'),
(68, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-11-24 18:37:00', '2015-11-24 18:37:00'),
(69, 'Neue Galerie und einige nette Details', '/images/blogs/daimkon.jpg', '2015-12-18 19:17:00', '2015-12-18 19:17:00'),
(70, 'Happy New Year', '/images/blogs/sylv_2015_2016.jpg', '2016-01-03 17:15:00', '2016-01-03 17:15:00'),
(71, '2 neue Galerien gefunden', '/images/blogs/07new_noname.jpg', '2016-01-15 18:10:00', '2016-01-15 18:10:00'),
(72, 'Neue Domain Verf&uuml;gbar.', '/images/blogs/05new_noname.jpg', '2016-02-09 18:55:00', '2016-02-09 18:55:00'),
(73, 'Ich habe 4 neue Bilder gemalt', '/images/blogs/faser2.jpg', '2016-04-01 16:43:00', '2016-04-01 16:43:00'),
(74, 'Neues Wallpaper', '/images/blogs/asario.de.jpg', '2016-05-17 16:16:00', '2016-05-17 16:16:00'),
(75, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2016-05-24 16:50:00', '2016-05-24 16:50:00'),
(76, 'Diverse neue Bilder', '/images/blogs/dune2016.jpg', '2016-06-14 17:04:00', '2016-06-14 17:04:00'),
(77, 'MCS Version 2.01', '/images/blogs/11new_noname.jpg', '2016-06-28 16:57:00', '2016-06-28 16:57:00'),
(78, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2016-07-04 15:12:00', '2016-07-04 15:12:00'),
(79, 'Burzeltach und seine Folgen...', '/images/blogs/Desk-Star-Painter.jpg', '2016-07-08 18:14:00', '2016-07-08 18:14:00'),
(80, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2016-07-08 18:16:00', '2016-07-08 18:16:00'),
(81, 'Neue Galerie vorhanden.', '/images/blogs/Zen_Coloured.jpg', '2016-08-24 08:20:00', '2016-08-24 08:20:00'),
(82, 'Neuerungen unter der Haube', '/images/blogs/17new_noname.jpg', '2016-10-08 18:07:00', '2016-10-08 18:07:00'),
(83, 'Merry X-Mas', '/images/blogs/xmas2k16._4.jpg', '2016-12-19 17:24:00', '2016-12-19 17:24:00'),
(84, 'Big Exceptions', '/images/blogs/jelly.jpg', '2017-01-25 08:37:00', '2017-01-25 08:37:00'),
(85, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-01-25 10:17:00', '2017-01-25 10:17:00'),
(86, 'MCS Points - die Smarte W&auml;hrung', '/images/blogs/153new_noname.jpg', '2017-01-29 14:48:00', '2017-01-29 14:48:00'),
(87, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-02-19 12:37:00', '2017-02-19 12:37:00'),
(88, 'Jetzt aber...', '/images/blogs/14new_noname.jpg', '2017-03-02 17:43:00', '2017-03-02 17:43:00'),
(89, 'Neue Navigationsleiste', '/images/blogs/03new_noname.jpg', '2017-03-12 15:33:00', '2017-03-12 15:33:00'),
(90, 'MultiLanguageSupport', '/images/blogs/15new_noname.jpg', '2017-03-24 17:50:00', '2017-03-24 17:50:00'),
(91, 'Das Warten hat ein Ende', '/images/blogs/16new_noname.jpg', '2017-05-18 17:58:00', '2017-05-18 17:58:00'),
(92, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-05-26 07:13:00', '2017-05-26 07:13:00'),
(93, 'Neue Galerie gesichtet', '/images/blogs/19new_noname.jpg', '2017-05-28 17:09:00', '2017-05-28 17:09:00'),
(94, 'Herzlichen Gl&uuml;ckwunsch', '/images/blogs/09new_noname.jpg', '2017-06-17 15:56:00', '2017-06-17 15:56:00'),
(95, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-06-20 17:45:00', '2017-06-20 17:45:00'),
(96, 'Internationalisierung vorangetrieben', '/images/blogs/multilang_overall.jpg', '2017-06-30 18:07:00', '2017-06-30 18:07:00'),
(97, 'Habe mal wieder geschraubt.', '/images/blogs/18new_noname.jpg', '2017-07-07 16:26:00', '2017-07-07 16:26:00'),
(98, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-07-11 16:44:00', '2017-07-11 16:44:00'),
(99, 'Neues Design', '/images/blogs/38new_noname.jpg', '2017-07-29 16:06:00', '2017-07-29 16:06:00'),
(100, 'SSL &Uuml;berall', '/images/blogs/33new_noname.jpg', '2017-08-20 13:40:00', '2017-08-20 13:40:00'),
(101, 'Neues auf meinem Blog', '/images/blogs/35new_noname.jpg', '2017-09-10 10:48:00', '2017-09-10 10:48:00'),
(102, 'Neue Bilder gefunden', '/images/blogs/34new_noname.jpg', '2017-09-17 17:16:00', '2017-09-17 17:16:00'),
(103, 'Mein Praktikum', '/images/blogs/40new_noname.jpg', '2017-10-14 17:08:00', '2017-10-14 17:08:00'),
(104, 'Neuer Ascher', '/images/blogs/41new_noname.jpg', '2017-10-29 11:56:00', '2017-10-29 11:56:00'),
(105, 'Ver&auml;ndertes Layout', '/images/blogs/20new_noname.jpg', '2017-11-12 13:59:00', '2017-11-12 13:59:00'),
(106, 'Neue Galerie', '/images/blogs/30new_noname.jpg', '2017-11-19 08:18:00', '2017-11-19 08:18:00'),
(107, 'Endlich wieder Online', '/images/blogs/21new_noname.jpg', '2017-12-20 08:10:00', '2017-12-20 08:10:00'),
(108, 'Neue Monstar Pix', '/images/blogs/42new_noname.jpg', '2018-01-28 08:17:00', '2018-01-28 08:17:00'),
(109, 'Shortstories wird zu Shortpoems', '/images/blogs/26new_noname.jpg', '2018-03-02 16:55:00', '2018-03-02 16:55:00'),
(110, 'Neue Kamera', '/images/blogs/56new_noname.jpg', '2018-04-02 14:26:00', '2018-04-02 14:26:00'),
(111, 'Neues Wallpaper @ Digital Galerie', '/images/blogs/63new_noname.jpg', '2018-04-15 10:28:00', '2018-04-15 10:28:00'),
(112, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-04-18 17:32:00', '2018-04-18 17:32:00'),
(113, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-04-20 16:20:00', '2018-04-20 16:20:00'),
(114, 'Mein Smartphone', '/images/blogs/66new_noname.jpg', '2018-04-29 08:49:00', '2018-04-29 08:49:00'),
(115, 'Layoutver&auml;nderung 2.0', '/images/blogs/60new_moname.jpg', '2018-05-01 16:53:00', '2018-05-01 16:53:00'),
(116, 'Neue Rubrik', '/images/blogs/61new_noname.jpg', '2018-05-06 09:01:00', '2018-05-06 09:01:00'),
(117, 'Neue Wissensfragen auf DidYouKnow', '/images/blogs/69new_noname.jpg', '2018-05-13 08:02:00', '2018-05-13 08:02:00'),
(118, 'Mein 35ter Geburtstag', '/images/blogs/70new_noname.jpg', '2018-06-17 07:29:00', '2018-06-17 07:29:00'),
(119, 'Neuigkeiten auf Asarios Blog', '/images/blogs/68new_noname.jpg', '2018-06-30 06:38:00', '2018-06-30 06:38:00'),
(120, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-08-10 09:13:00', '2018-08-10 09:13:00'),
(121, 'Neue Fotos und neue MCS Version', '/images/blogs/71new_noname.jpg', '2018-08-10 18:02:00', '2018-08-10 18:02:00'),
(122, 'Neues PM Layout, Stats und MCS-Newsletter', '/images/blogs/72new_noname.jpg', '2018-08-23 15:11:00', '2018-08-23 15:11:00'),
(123, 'Monstar in D&auml;nemark', '/images/blogs/74new_noname.jpg', '2018-09-15 18:23:00', '2018-09-15 18:23:00'),
(124, 'Kommentaren Folgen', '/images/blogs/73new_noname.jpg', '2018-09-26 15:45:00', '2018-09-26 15:45:00'),
(125, 'Neuer Button unter Images', '/images/blogs/49new_noname.jpg', '2018-10-21 14:48:00', '2018-10-21 14:48:00'),
(126, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-10-21 17:16:00', '2018-10-21 17:16:00'),
(127, 'Neuer Slider auf News Seite.', '/images/blogs/75new_noname.jpg', '2018-11-25 08:16:00', '2018-11-25 08:16:00'),
(128, 'Neues Feature auf Images Seite', '/images/blogs/80new_noname.jpg', '2018-12-02 08:55:00', '2018-12-02 08:55:00'),
(129, 'Neues unter DidYouKnow', '/images/blogs/83new_noname.jpg', '2018-12-09 09:16:00', '2018-12-09 09:16:00'),
(130, 'Merry Christmas Folks', '/images/blogs/84_new_noname.jpg', '2018-12-20 17:12:00', '2018-12-20 17:12:00'),
(131, 'Frohes Neues Freunde', '/images/blogs/85_new_noname.jpg', '2019-01-01 09:41:00', '2019-01-01 09:41:00'),
(132, 'Neue Kunstwerke gesichtet', '/images/blogs/96new_noname.jpg', '2019-02-22 15:16:00', '2019-02-22 15:16:00'),
(133, 'F&uuml;r alle Apfel Nerds und 4K Nutzer', '/images/blogs/91new_noname.jpg', '2019-03-24 14:19:00', '2019-03-24 14:19:00'),
(134, 'Monstarz United', '/images/blogs/99new_noname.jpg', '2019-03-29 15:04:00', '2019-03-29 15:04:00'),
(135, 'Frohe Ostern', '/images/blogs/90_2new_noname.jpg', '2019-04-20 11:28:00', '2019-04-20 11:28:00'),
(136, 'Besuch bei meinem kleinem Neffen', '/images/blogs/100new_noname.jpg', '2019-05-27 09:16:00', '2019-05-27 09:16:00'),
(137, 'Anubis fast fertig', '/images/blogs/103new_noname.jpg', '2019-06-23 06:40:00', '2019-06-23 06:40:00'),
(138, 'MCS Doku Multi-Language', '/images/blogs/102new_noname.jpg', '2019-06-30 11:22:00', '2019-06-30 11:22:00'),
(139, 'Anubis fertig', '/images/blogs/106new_noname.jpg', '2019-09-06 13:58:00', '2019-09-06 13:58:00'),
(140, 'Shariff Online', '/images/blogs/97new_noname.jpg', '2019-09-15 08:34:00', '2019-09-15 08:34:00'),
(141, 'Neue Folgen Funktion', '/images/blogs/108new_noname.jpg', '2019-10-03 07:08:00', '2019-10-03 07:08:00'),
(142, 'Merry Christmas and a happy New Year', '/images/blogs/xmas_2019.jpg', '2019-12-23 22:59:00', '2019-12-23 22:59:00'),
(143, 'Gut reingerutscht?', '/images/blogs/111new_noname.jpg', '2019-12-28 16:54:00', '2019-12-28 16:54:00'),
(144, 'Zwei Faktor Authentifizierung auf Asarios Blog', '/images/blogs/110new_noname.jpg', '2020-01-12 12:47:00', '2020-01-12 12:47:00'),
(145, 'Ich verlasse Bim&ouml;hlen', '/images/blogs/112new_noname.jpg', '2020-02-23 15:06:00', '2020-02-23 15:06:00'),
(146, 'Willkommen SE', '/images/blogs/113new_noname.jpg', '2020-03-04 14:47:00', '2020-03-04 14:47:00'),
(147, 'Neue Bilder gesichtet', '/images/blogs/115new_noname.jpg', '2020-08-16 11:52:00', '2020-08-16 11:52:00'),
(148, 'Neues Layout auf Asario.de', '/images/blogs/116new_noname.jpg', '2020-09-06 15:51:00', '2020-09-06 15:51:00'),
(149, 'Frohes Neues', '/images/blogs/118new_noname.jpg', '2020-12-31 23:32:00', '2020-12-31 23:32:00'),
(150, 'Back in town...', '/images/blogs/119new_noname.jpg', '2021-08-12 11:14:00', '2021-08-12 11:14:00'),
(151, 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', '/images/blogs/120new_noname.jpg', '2021-10-09 18:19:00', '2021-10-09 18:19:00'),
(152, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2021-10-09 21:14:00', '2021-10-09 21:14:00'),
(153, 'Merry X-Mas 2021', '/images/blogs/121new_noname.jpg', '2021-12-25 09:42:00', '2021-12-25 09:42:00'),
(154, 'Neues Feature', '/images/blogs/123new_noname.png', '2022-02-15 11:15:00', '2022-02-15 11:15:00'),
(155, 'Solidarit&auml;t mit der Ukraine', '/images/blogs/125new_noname.png', '2022-04-18 22:00:00', '2022-04-18 22:00:00'),
(156, '3D Printer Objekte', '/images/blogs/dragonbird.jpg', '2022-06-28 22:00:00', '2022-06-28 22:00:00'),
(157, 'Neuerungen im System', '/images/blogs/2868559b90a5a297f214f0cbb1c8ae4e.jpg', '2022-10-09 09:14:00', '2022-10-09 09:14:00'),
(158, 'Neues aus PLA', '/images/blogs/126new_noname.jpg', '2022-11-05 14:56:00', '2022-11-05 14:56:00'),
(159, 'Happy 2023', '/images/blogs/127new_noname.jpg', '2023-01-22 13:07:00', '2023-01-22 13:07:00'),
(160, 'Winter in town', '/images/blogs/128new_noname.jpg', '2023-01-27 18:03:00', '2023-01-27 18:03:00'),
(161, 'Winter Update', '/images/blogs/593f5288d12efe2bcbf95d3ce538d219.jpg', '2023-02-04 12:05:00', '2023-02-04 12:05:00'),
(162, 'Frohe Ostern 2023', '/images/blogs/132new_noname.jpg', '2023-02-13 08:56:00', '2023-02-13 08:56:00'),
(163, 'Fr&uuml;hling', '/images/blogs/149new_noname.jpg', '2023-02-22 15:10:00', '2023-02-22 15:10:00'),
(164, 'Verbesserte Feeds', '/images/blogs/473443f6cdb8473c5abbc5a206fbe4a4.jpg', '2023-03-11 12:03:00', '2023-03-11 12:03:00'),
(165, 'Neue Sterne', '/images/blogs/c4d8434ed14487a864c344675e07b876.jpg', '2023-05-07 08:42:00', '2023-05-07 08:42:00'),
(166, 'Sommer 2023', '/images/blogs/140new_noname.jpg', '2023-05-29 10:02:00', '2023-05-29 10:02:00'),
(167, 'Sp&auml;tsommer 2023', '/images/blogs/143new_noname.jpg', '2023-07-22 13:38:00', '2023-07-22 13:38:00'),
(168, 'Herbst 2023', '/images/blogs/145new_noname.jpg', '2023-08-21 13:27:00', '2023-08-21 13:27:00'),
(169, 'Winter & 2fa', '/images/blogs/150new_noname.jpg', '2023-09-30 15:05:00', '2023-09-30 15:05:00'),
(170, 'Halloween 2023', '/images/blogs/a677f351307d2071c97811e777145a05.jpg', '2023-10-31 20:02:00', '2023-10-31 20:02:00'),
(171, 'Update zur Zwei-Faktor-Authentifizierung', '/images/blogs/9a3f1215f2d676158f59b107dbf8325e.jpg', '2023-11-21 23:00:00', '2023-11-21 23:00:00'),
(172, 'Frohe Weihnachten 2023', '/images/blogs/d8b5586b1f97adedb44b92e51d6762b7.jpg', '2023-12-16 16:09:00', '2023-12-16 16:09:00'),
(173, 'KI, Webdesign, Kunst und Fotografie', '/images/blogs/96f9dbb805e3adc181299068c822bb9e.jpg', '2024-01-09 21:14:00', '2024-01-09 21:14:00'),
(174, 'Fr&uuml;hling', '/images/blogs/7b3cd6e8c28cc9ee80b122d085f9ff79.jpg', '2024-03-13 23:00:00', '2024-03-13 23:00:00'),
(175, 'Sommer 2024', '/images/blogs/2cb4d6cdd6b5a3b3551824c54d9b3cc0.jpg', '2024-04-21 13:54:00', '2024-04-21 13:54:00'),
(176, 'Neues Layout', '/images/blogs/a72b888abc6d4430a697c77ff2adabf8.png', '2024-07-16 22:00:00', '2024-07-16 22:00:00'),
(177, 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', '/images/blogs/9443b4d9d13c07d1de2607cbc2b1f147.jpg', '2024-08-08 10:08:00', '2024-08-08 10:08:00'),
(178, 'Laravel Experimente', '/images/blogs/1f19113fd5e6d3034053946fa19216ce.jpg', '2024-08-18 12:25:00', '2024-08-18 12:25:00'),
(179, 'Und schon wieder haben wir Halloween!', '/images/blogs/88d46e6c705129501bdd680082b4ff7e.jpg', '2024-10-31 09:35:00', '2024-10-31 09:35:00'),
(180, 'X-Mas 2024', '/images/blogs/ae9cca18e24abc8d33617425f56ad5ad.jpg', '2024-12-07 14:36:00', '2024-12-07 14:36:00'),
(181, 'Warum MCSL auf Laravel basiert - Die Technologie hinter diesem Blog', '/images/blogs/d1adb2203dbe352814a1271ee5df2962.jpg', '2025-01-26 23:00:00', '2025-01-26 23:00:00'),
(190, 'Neuerungen im System', '/images/blogs/inno.jpg', '2025-01-26 23:00:00', '2025-01-26 23:00:00'),
(191, 'undefined', '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-05 17:44:39', '2025-03-05 17:44:39'),
(192, 'undefined', '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-05 17:54:08', '2025-03-05 17:54:08'),
(193, 'undefined', '/images/blogs/751074f1c5403caf2ecba5da82c81744.jpg', '2025-03-05 18:24:27', '2025-03-05 18:24:27'),
(194, 'undefined', '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-06 13:54:49', '2025-03-06 13:54:49'),
(195, 'undefined', '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-07 15:43:48', '2025-03-07 15:43:48'),
(196, 'undefined', '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-07 15:58:49', '2025-03-07 15:58:49'),
(197, 'undefined', '/images/blogs/af8fa8b3c9127b5597d8f5800c0000cd.jpg', '2025-03-07 16:05:31', '2025-03-07 16:05:31'),
(198, 'undefined', '/images/blogs/d569c128e8974a9fdf184a282912bf07.jpg', '2025-03-09 13:10:09', '2025-03-09 13:10:09'),
(199, 'undefined', '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-09 13:12:46', '2025-03-09 13:12:46'),
(200, 'undefined', '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 13:29:16', '2025-03-09 13:29:16'),
(201, 'undefined', '/images/blogs/5a58039e532675fd74ce45f4ea7ef186.jpg', '2025-03-09 13:32:24', '2025-03-09 13:32:24'),
(202, 'undefined', '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 13:39:58', '2025-03-09 13:39:58'),
(203, 'undefined', '/images/blogs/5a58039e532675fd74ce45f4ea7ef186.jpg', '2025-03-09 13:41:55', '2025-03-09 13:41:55'),
(204, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 13:52:13', '2025-03-09 13:52:13'),
(205, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 13:53:15', '2025-03-09 13:53:15'),
(206, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:13:50', '2025-03-09 14:13:50'),
(207, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:18:21', '2025-03-09 14:18:21'),
(208, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:20:31', '2025-03-09 14:20:31'),
(209, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:24:58', '2025-03-09 14:24:58'),
(210, NULL, '/images/blogs/7440e9d578e68ada6e9c8771c79f1cba.jpg', '2025-03-09 14:27:11', '2025-03-09 14:27:11'),
(211, NULL, '/images/blogs/7440e9d578e68ada6e9c8771c79f1cba.jpg', '2025-03-09 14:27:14', '2025-03-09 14:27:14'),
(212, NULL, '/images/blogs/af8fa8b3c9127b5597d8f5800c0000cd.jpg', '2025-03-09 14:28:32', '2025-03-09 14:28:32'),
(213, NULL, '/images/blogs/af8fa8b3c9127b5597d8f5800c0000cd.jpg', '2025-03-09 14:28:32', '2025-03-09 14:28:32'),
(214, NULL, '/images/blogs/8555047987df512af0c5d67755649d9f.jpg', '2025-03-09 14:30:12', '2025-03-09 14:30:12'),
(215, NULL, '/images/blogs/8555047987df512af0c5d67755649d9f.jpg', '2025-03-09 14:30:12', '2025-03-09 14:30:12'),
(216, NULL, '/images/blogs/54d362bc1354804b1178fa412758df04.jpg', '2025-03-09 14:31:33', '2025-03-09 14:31:33'),
(217, NULL, '/images/blogs/54d362bc1354804b1178fa412758df04.jpg', '2025-03-09 14:31:36', '2025-03-09 14:31:36'),
(218, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:33:22', '2025-03-09 14:33:22'),
(219, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 14:33:22', '2025-03-09 14:33:22'),
(220, NULL, '/images/blogs/6118d31da0d547c39d3ba072005e365f.jpg', '2025-03-09 14:38:41', '2025-03-09 14:38:41'),
(221, NULL, '/images/blogs/6118d31da0d547c39d3ba072005e365f.jpg', '2025-03-09 14:38:44', '2025-03-09 14:38:44'),
(222, NULL, '/images/blogs/af8fa8b3c9127b5597d8f5800c0000cd.jpg', '2025-03-09 14:41:39', '2025-03-09 14:41:39'),
(223, NULL, '/images/blogs/af8fa8b3c9127b5597d8f5800c0000cd.jpg', '2025-03-09 14:41:40', '2025-03-09 14:41:40'),
(224, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:43:40', '2025-03-09 14:43:40'),
(225, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:43:42', '2025-03-09 14:43:42'),
(226, NULL, '/images/blogs/5f9e2f892c89ab39abd8cebad2958bfa.jpg', '2025-03-09 14:44:04', '2025-03-09 14:44:04'),
(227, NULL, '/images/blogs/5f9e2f892c89ab39abd8cebad2958bfa.jpg', '2025-03-09 14:44:07', '2025-03-09 14:44:07'),
(228, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:46:45', '2025-03-09 14:46:45'),
(229, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:46:50', '2025-03-09 14:46:50'),
(230, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:46:55', '2025-03-09 14:46:55'),
(231, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:47:01', '2025-03-09 14:47:01'),
(232, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:47:06', '2025-03-09 14:47:06'),
(233, NULL, '/images/blogs/85a91368d073bccf97994779387c5574.jpg', '2025-03-09 14:47:11', '2025-03-09 14:47:11'),
(234, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:52:37', '2025-03-09 14:52:37'),
(235, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:52:39', '2025-03-09 14:52:39'),
(236, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:57:55', '2025-03-09 14:57:55'),
(237, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 14:57:57', '2025-03-09 14:57:57'),
(238, NULL, '/images/blogs/4381af8b912d8eb05d1eb8f61db6df0f.jpg', '2025-03-09 15:00:15', '2025-03-09 15:00:15'),
(239, NULL, '/images/blogs/4381af8b912d8eb05d1eb8f61db6df0f.jpg', '2025-03-09 15:00:16', '2025-03-09 15:00:16'),
(240, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:10:24', '2025-03-09 15:10:24'),
(241, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:10:24', '2025-03-09 15:10:24'),
(242, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:16:47', '2025-03-09 15:16:47'),
(243, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:16:48', '2025-03-09 15:16:48'),
(244, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 15:19:01', '2025-03-09 15:19:01'),
(245, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 15:19:03', '2025-03-09 15:19:03'),
(246, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:21:38', '2025-03-09 15:21:38'),
(247, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:21:39', '2025-03-09 15:21:39'),
(248, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:42:12', '2025-03-09 15:42:12'),
(249, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-09 15:42:12', '2025-03-09 15:42:12'),
(250, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-09 15:48:08', '2025-03-09 15:48:08'),
(251, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-09 15:48:08', '2025-03-09 15:48:08'),
(252, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-09 15:48:30', '2025-03-09 15:48:30'),
(253, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-09 15:48:30', '2025-03-09 15:48:30'),
(254, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 16:02:54', '2025-03-09 16:02:54'),
(255, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 16:02:56', '2025-03-09 16:02:56'),
(256, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 16:03:24', '2025-03-09 16:03:24'),
(257, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-09 16:03:26', '2025-03-09 16:03:26'),
(258, NULL, '/images/blogs/d569c128e8974a9fdf184a282912bf07.jpg', '2025-03-10 14:24:23', '2025-03-10 14:24:23'),
(259, NULL, '/images/blogs/d569c128e8974a9fdf184a282912bf07.jpg', '2025-03-10 14:24:26', '2025-03-10 14:24:26'),
(260, NULL, '/images/blogs/cf429d114c050514a60d0775c01d8a8a.jpg', '2025-03-10 14:29:07', '2025-03-10 14:29:07'),
(261, NULL, '/images/blogs/cf429d114c050514a60d0775c01d8a8a.jpg', '2025-03-10 14:29:10', '2025-03-10 14:29:10'),
(262, NULL, '/images/blogs/ed7caf464a18297276657ea89fbc74a2.jpg', '2025-03-10 14:38:43', '2025-03-10 14:38:43'),
(263, NULL, '/images/blogs/ed7caf464a18297276657ea89fbc74a2.jpg', '2025-03-10 14:38:45', '2025-03-10 14:38:45'),
(264, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 14:58:13', '2025-03-10 14:58:13'),
(265, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 14:58:13', '2025-03-10 14:58:13'),
(266, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:00:13', '2025-03-10 15:00:13'),
(267, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:00:13', '2025-03-10 15:00:13'),
(268, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:04:41', '2025-03-10 15:04:41'),
(269, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:04:43', '2025-03-10 15:04:43'),
(270, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:08:09', '2025-03-10 15:08:09'),
(271, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:08:11', '2025-03-10 15:08:11'),
(272, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:10:02', '2025-03-10 15:10:02'),
(273, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:10:04', '2025-03-10 15:10:04'),
(274, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:11:16', '2025-03-10 15:11:16'),
(275, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:11:18', '2025-03-10 15:11:18'),
(276, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:13:57', '2025-03-10 15:13:57'),
(277, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:13:59', '2025-03-10 15:13:59'),
(278, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:16:51', '2025-03-10 15:16:51'),
(279, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:16:52', '2025-03-10 15:16:52'),
(280, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:19:09', '2025-03-10 15:19:09'),
(281, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:19:10', '2025-03-10 15:19:10'),
(282, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:20:05', '2025-03-10 15:20:05'),
(283, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:20:07', '2025-03-10 15:20:07'),
(284, NULL, '/images/blogs/87ac290c41f562b1fd799996069b31ed.jpg', '2025-03-10 15:20:31', '2025-03-10 15:20:31'),
(285, NULL, '/images/blogs/87ac290c41f562b1fd799996069b31ed.jpg', '2025-03-10 15:20:34', '2025-03-10 15:20:34'),
(286, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:21:10', '2025-03-10 15:21:10'),
(287, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:21:12', '2025-03-10 15:21:12'),
(288, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:23:47', '2025-03-10 15:23:47'),
(289, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:23:49', '2025-03-10 15:23:49'),
(290, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:25:26', '2025-03-10 15:25:26'),
(291, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:25:28', '2025-03-10 15:25:28'),
(292, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:26:49', '2025-03-10 15:26:49'),
(293, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:26:51', '2025-03-10 15:26:51'),
(294, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:27:35', '2025-03-10 15:27:35'),
(295, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:27:37', '2025-03-10 15:27:37'),
(296, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:35:26', '2025-03-10 15:35:26'),
(297, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:35:27', '2025-03-10 15:35:27'),
(298, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:37:22', '2025-03-10 15:37:22'),
(299, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:37:24', '2025-03-10 15:37:24'),
(300, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:38:42', '2025-03-10 15:38:42'),
(301, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:38:44', '2025-03-10 15:38:44'),
(302, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:45:02', '2025-03-10 15:45:02'),
(303, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:45:03', '2025-03-10 15:45:03'),
(304, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:50:47', '2025-03-10 15:50:47'),
(305, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:50:49', '2025-03-10 15:50:49'),
(306, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:52:04', '2025-03-10 15:52:04'),
(307, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:52:04', '2025-03-10 15:52:04'),
(308, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:52:39', '2025-03-10 15:52:39'),
(309, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:52:41', '2025-03-10 15:52:41'),
(310, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:53:13', '2025-03-10 15:53:13'),
(311, NULL, '/images/blogs/7af60bc378fb196c9d71f6fa90d68604.jpg', '2025-03-10 15:53:13', '2025-03-10 15:53:13'),
(312, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:53:59', '2025-03-10 15:53:59'),
(313, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:53:59', '2025-03-10 15:53:59'),
(314, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:56:16', '2025-03-10 15:56:16'),
(315, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 15:56:17', '2025-03-10 15:56:17'),
(316, NULL, '/images/blogs/54d362bc1354804b1178fa412758df04.jpg', '2025-03-10 15:58:41', '2025-03-10 15:58:41'),
(317, NULL, '/images/blogs/54d362bc1354804b1178fa412758df04.jpg', '2025-03-10 15:58:43', '2025-03-10 15:58:43'),
(318, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:59:18', '2025-03-10 15:59:18'),
(319, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 15:59:20', '2025-03-10 15:59:20'),
(320, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 16:03:25', '2025-03-10 16:03:25'),
(321, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 16:03:27', '2025-03-10 16:03:27'),
(322, NULL, '/images/blogs/5a58039e532675fd74ce45f4ea7ef186.jpg', '2025-03-10 16:08:31', '2025-03-10 16:08:31'),
(323, NULL, '/images/blogs/5a58039e532675fd74ce45f4ea7ef186.jpg', '2025-03-10 16:08:32', '2025-03-10 16:08:32'),
(324, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 16:28:10', '2025-03-10 16:28:10'),
(325, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 16:28:12', '2025-03-10 16:28:12'),
(326, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 17:32:05', '2025-03-10 17:32:05'),
(327, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 17:32:05', '2025-03-10 17:32:05'),
(328, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 17:39:40', '2025-03-10 17:39:40'),
(329, NULL, '/images/blogs/e32609521bb9e23dbe9fccde9d5f5840.jpg', '2025-03-10 17:39:42', '2025-03-10 17:39:42'),
(330, NULL, '/images/blogs/4ee21bcdcf45ff96e8c1a3490d094e65.jpg', '2025-03-10 17:50:25', '2025-03-10 17:50:25'),
(331, NULL, '/images/blogs/4ee21bcdcf45ff96e8c1a3490d094e65.jpg', '2025-03-10 17:50:25', '2025-03-10 17:50:25'),
(332, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 17:54:53', '2025-03-10 17:54:53'),
(333, NULL, '/images/blogs/7bc17c16dbc62aec719d7b372b19a678.jpg', '2025-03-10 17:54:54', '2025-03-10 17:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
CREATE TABLE `camera` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) DEFAULT NULL,
  `ordering` bigint(11) DEFAULT NULL,
  `Longname` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `Mpixel` varchar(10) DEFAULT NULL,
  `short_tag` varchar(20) DEFAULT NULL,
  `exif_copyright` varchar(255) DEFAULT NULL,
  `exif_comp` varchar(200) DEFAULT NULL,
  `exif_model` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `camera`
--

INSERT INTO `camera` (`id`, `pub`, `ordering`, `Longname`, `name`, `Mpixel`, `short_tag`, `exif_copyright`, `exif_comp`, `exif_model`) VALUES
(1, 1, 12, 'Pixel 7a (Pauleman)', 'Pixel 7a', '900', 'asario', 'Asario4', NULL, NULL),
(2, 1, 7, 'Kodak Easy Share C813 (Paul - ALT)', 'Kodak Easy Share C813', '8.12', 'asario', 'Asario', 'EASTMAN KODAK COMPANY', 'KODAK EASYSHARE C813 ZOOM DIGITAL CAMERA'),
(3, 1, 5, 'Olympus C595Z (Paul - ALT)', 'Olympus C595Z', '5,9', 'asario', 'Asario', 'OLYMPUS IMAGING CORP.', 'D595Z,C500Z'),
(4, 1, 2, 'Iphone (Lisa)', 'IPhone', '', 'liri', 'Lisa Rieser', '', ''),
(5, 1, 1, 'Samsung PL210 (Mutti)', 'Samsung PL210', '', 'mazi', 'Maria Zinckernagel', '', ''),
(6, 1, 3, 'Fujifilm X30 (Lisa)', 'Fujifilm X30', '', 'liri', 'Lisa Rieser', 'FUJIFILM', 'X30'),
(7, 1, 10, 'Panasonic Lumix DMC TZ-71 (Paul)', 'Panasonic Lumix DMC TZ-71', '12', 'asario', 'Asario', 'PANASONIC', 'DMC TZ-71'),
(8, 1, 9, 'Samsung Galaxy S4 (Paul - ALT)', 'Samsung Galaxy S4', '12', 'asario', 'Asario', 'SAMSUNG', 'Galaxy S4'),
(9, 1, 6, 'Panasonic DMC-FZ300 (Rob)', 'Panasonic DMC-FZ300', '12', 'rob', 'Rob Lawson', 'PANASONIC', 'DMC-FZ300'),
(10, 1, 4, 'Samsung Galaxy S5 (Angelique)', 'Samsung Galaxy S5', '12', 'nitro', 'Nitropower', 'PANASONIC', 'DMC TZ-71'),
(11, 1, 11, 'Google Pixel 3a', 'Pixel 3a', '', 'asario', 'Asario', 'GOOGLE', 'Pixel 3a');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_en`) VALUES
(1, 'Digitale & KI-generierte Kunstmedien', 'Digital & AI-Generated Art'),
(2, 'Zeichnung', 'Drawing'),
(3, 'Malerei', 'Painting'),
(4, 'Druckgrafik', 'Printmaking'),
(5, 'Skulptur/Bildhauerei', 'Sculpture'),
(6, 'Textilkunst', 'Textile Art');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL DEFAULT 1,
  `users_id` bigint(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `admin_table_id` bigint(11) DEFAULT NULL,
  `content` text NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xis_checked` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `pub`, `users_id`, `post_id`, `admin_table_id`, `content`, `email`, `created_at`, `updated_at`, `xis_checked`) VALUES
(2, 1, 2, 359, 8, '<p>111111111112222222</p>\n', 'a222@example.com', '2025-01-09 15:15:53', '2025-01-10 15:13:22', 0),
(6, 1, 2, 359, 8, '<p>asdddddddddddddddd</p>\n', 'kissyou@example.com', '2025-03-17 17:08:20', '2025-03-17 17:08:20', 0),
(24, 1, 1, 359, 8, '<p>HAllo Wel !</p>\n', 'parie@gmx.de', '2025-03-20 15:23:42', '2025-03-20 15:23:42', 0),
(31, 1, 1, 178, 3, '<p>test</p>\n', 'parie@gmx.de', '2025-03-23 10:11:51', '2025-03-23 10:11:51', 0),
(32, 1, 1, 359, 8, '<p>hallo</p>\n', 'parie@gmx.de', '2025-03-23 10:25:17', '2025-03-23 10:25:17', 0),
(33, 1, 1, 178, 3, '<p>hallo du da !</p>\n', 'parie@gmx.de', '2025-03-23 10:27:51', '2025-03-23 10:27:51', 0),
(34, 1, 1, 177, 3, '<p>hallo welt !</p>\n', 'parie@gmx.de', '2025-03-23 10:28:03', '2025-03-23 10:28:03', 0),
(36, 1, 1, 164, 3, '<p>test</p>\n', 'parie@gmx.de', '2025-03-23 21:51:59', '2025-03-23 21:51:59', 0),
(37, 1, 1, 180, 3, '<p>hallo welt !</p>\n', 'parie@gmx.de', '2025-03-24 19:16:28', '2025-03-24 19:16:28', 0),
(38, 1, 1, 165, 3, '<p>231122</p>\n', 'parie@gmx.de', '2025-03-24 19:19:57', '2025-03-24 19:19:57', 0),
(39, 1, 1, 180, 3, '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>\n', 'parie@gmx.de', '2025-03-24 19:55:33', '2025-03-24 19:55:33', 0),
(40, 1, 1, 165, 3, '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>\n', 'parie@gmx.de', '2025-03-24 19:58:03', '2025-03-24 19:58:03', 0),
(41, 1, 1, 430, NULL, '<p>hallo welt !</p>\n', 'parie@gmx.de', '2025-03-29 11:06:23', '2025-03-29 11:06:23', 0),
(42, 1, 10, 333, NULL, '<p>hallo du d&auml;&szlig;</p>\n', 'admin@example.com', '2025-03-30 13:21:57', '2025-03-30 13:21:57', 0),
(43, 1, 10, 428, NULL, '<p>hallo welt !</p>\n', 'admin@example.com', '2025-03-30 13:27:38', '2025-03-30 13:27:38', 0),
(45, 1, 1, 428, NULL, '<p>hey du da !</p>\n', 'parie@gmx.de', '2025-03-30 19:30:41', '2025-03-30 19:30:41', 0),
(47, 1, 1, 459, NULL, '<p>123456</p>\n', 'parie@gmx.de', '2025-04-26 15:25:22', '2025-04-26 15:25:22', 0),
(48, 1, 1, 459, NULL, '<p>456879</p>\n', 'parie@gmx.de', '2025-04-26 15:25:29', '2025-04-26 15:25:29', 0),
(49, 1, 1, 430, NULL, '<p>hallo welt ! was geht ab ? mir geht es gut soweit, hoffe ihr genie&szlig;t das sch&ouml;ne Wetter.</p>\n', 'parie@gmx.de', '2025-05-01 17:12:19', '2025-05-01 17:12:19', 0),
(50, 1, 1, 430, NULL, '<p>hallo du da !</p>\n', 'parie@gmx.de', '2025-05-01 17:12:41', '2025-05-01 17:12:41', 0),
(51, 1, 1, 430, NULL, '<p>welt!</p>\n', 'parie@gmx.de', '2025-05-01 17:13:17', '2025-05-01 17:13:17', 0),
(52, 1, 1, 430, NULL, '<p>hallo</p>\n', 'parie@gmx.de', '2025-05-01 17:19:33', '2025-05-01 17:19:33', 0),
(53, 1, 1, 420, NULL, '<p>hallo</p>\n', 'parie@gmx.de', '2025-05-01 17:23:09', '2025-05-01 17:23:09', 0),
(54, 1, 1, 420, NULL, '<p>hallo<br />\nwELT</p>\n', 'parie@gmx.de', '2025-05-01 17:23:18', '2025-05-01 17:23:18', 0),
(55, 1, 1, 118, 6, '<p>test!</p>\n', 'parie@gmx.de', '2025-05-04 13:08:22', '2025-05-04 13:08:22', 0),
(56, 1, 1, 71, 10, '<p>ein kommenntar</p>\n', 'parie@gmx.de', '2025-05-04 13:42:27', '2025-05-04 13:42:27', 0),
(57, 1, 1, 71, 10, '<p>hallo welt!</p>\n', 'parie@gmx.de', '2025-05-04 13:42:42', '2025-05-04 13:42:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `copyleft`
--

DROP TABLE IF EXISTS `copyleft`;
CREATE TABLE `copyleft` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `copyleft`
--

INSERT INTO `copyleft` (`id`, `pub`, `tag`, `name`) VALUES
(1, 1, 'c_asario', 'Asario'),
(2, 1, 'c_rob', 'Baxter the Dog'),
(3, 1, 'c_liri', 'Chinagirl'),
(4, 1, 'c_mazi', 'Maria Zinckernagel'),
(5, 1, 'c_nitro', 'Nitropower');

-- --------------------------------------------------------

--
-- Table structure for table `didyouknow`
--

DROP TABLE IF EXISTS `didyouknow`;
CREATE TABLE `didyouknow` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` int(11) NOT NULL,
  `users_id` bigint(11) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `answer` mediumtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `didyouknow`
--

INSERT INTO `didyouknow` (`id`, `pub`, `position`, `users_id`, `headline`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, ' dass am 4.5. Star Wars Tag ist', '<p>May the 4th will be with you,  &lt;br /&gt;<br />\nmay the force will be with you.</p>\n', '2018-05-05 20:21:26', '2018-05-05 13:38:52'),
(2, 1, 1, 1, ' dass In Schleswig Holstein die gl&uuml;cklichsten Menschen Deutschlands leben', '<p>Schleswig Holsteiner sind die gl&uuml;cklichsten im Bundesdurchschnitt.</p>\n', '2018-05-05 20:21:26', '2018-05-05 13:43:35'),
(3, 1, 2, 1, ' dass eine Hummel laut Gesetzen der Aerodynamik gar nicht fliegen kann.', '<p>Die Hummel wiegt 4,8<br />\nGramm. Sie hat eine<br />\nFl&uuml;gelfl&auml;che von<br />\n1,45 cmÂ² bei einem<br />\nFl&auml;chenwinkel von 6<br />\nGrad.<br /><br />\nNach den Gesetzen<br />\nder Aerodynamik kann die<br />\nHummel nicht fliegen.<br />\nAber die Hummel wei&szlig; das<br />\nnicht.<br /><br />\n(Wer h&auml;tte das<br />\ngedacht!)</p>\n', '2018-05-05 20:21:26', '2018-05-05 13:47:46'),
(4, 1, 3, 2, ' dass ein Saxophon ein Holzblasinstrument ist', '<p>Ja, da der Tonerzeuger (das Rohrblatt) aus Holz ist, geh&ouml;rt das Saxophon zu den Holzbl&auml;sern.</p>\n', '2024-09-22 20:21:26', '2018-05-05 13:57:37'),
(5, 1, 4, 2, ' dass man vom Kaffee Entzug Kopfschmerzen bekommen kann', '<p>Bei einigen Menschen sorgt der Kaffee Entzug f&uuml;r starke Kopfschmerzen.</p>\n', '2024-09-22 20:21:26', '2018-05-05 14:07:18'),
(6, 1, 5, 2, ' dass Heroin keine Psychosen ausl&ouml;st', '<p>Als einzige illegale Droge f&uuml;hrt Heroin nicht zu Psychosen.<br /><br />\nTrotzdem sollte man sowas nicht ausprobieren.</p>\n', '2018-05-05 20:21:26', '2018-05-05 14:09:09'),
(7, 1, 6, 2, ' dass Hunde ein gl&auml;nzendes Fell bekommen wenn man Sie mit Thunfisch f&uuml;ttert', '<p>Ja, Thunfisch in Ã–l sorgt f&uuml;r ein gl&auml;nzendes Fell bei Hunden.<br /><br />\nAchtung: wenn der Hund es nicht vertr&auml;gt kann es zu Durchfall kommen (wegen dem Ã–ll)</p>\n', '2018-05-05 20:21:26', '2018-05-05 14:39:20'),
(8, 1, 7, 2, ' dass auf einer Zahnb&uuml;rste mehr Keime zu finden sind als auf einer Klobrille', '<p>Die Keimbelastung einer Zahnb&uuml;ste ist h&ouml;her als auf einem Smartphone oder einer Klobrille. Die Keime sind aber wichtig um das Essen beim kauen vorzuverdauen.</p>\n', '2018-05-05 20:21:26', '2018-05-05 14:50:21'),
(9, 1, 8, 2, ' dass Erdbeeraroma nicht aus Erdbeeren sondern aus S&auml;gemehl hergestellt wird', '<p>Ja, Erdbeerarome wird aus Pilzkulturen gewonnen die auf Buchenholzsp&auml;nen wachsen.</p>\n', '2018-05-06 20:21:26', '2018-05-06 09:14:05'),
(10, 1, 9, 2, ' dass Urin je nach Verweildauer in der Blase dunkler gef&auml;rbt ist', '<p>Desto l&auml;nger der Urin in der Blase ist, desto dunkler ist er beim Pinkeln.</p>\n', '2018-05-07 20:21:26', '2018-05-07 16:11:03'),
(11, 1, 10, 2, ' dass die Armspannweite normalerweise der K&ouml;rpergr&ouml;&szlig;e entspricht', '<p>Bei den meisten Menschen betr&auml;gt die Armspannweite der K&ouml;rpergr&ouml;&szlig;e.</p>\n', '2018-05-07 20:21:26', '2018-05-07 16:14:25'),
(12, 1, 11, 2, ' dass Rollm&ouml;pse in Wirklichkeit Gurken essen', '<p>Sonst w&auml;hr ja keine Gurke drin :).</p>\n', '2018-05-07 20:21:26', '2018-05-07 16:15:37'),
(13, 1, 12, 2, ' dass Intelligente Menschen zu einer Sauklaue neigen', '<p>Laut Studien haben Intelligente Menschen eher eine unleserliche Handschrift als andere.</p>\n', '2018-05-07 20:21:26', '2018-05-07 16:17:22'),
(14, 1, 13, 2, ' dass reife Bananen Alkohol enthalten', '<p>Ja, reife Bananen enthalten bis zu 1.24 % Alkohol.</p>\n', '2018-05-07 20:21:26', '2018-05-07 16:20:48'),
(15, 1, 14, 2, ' dass Nat&uuml;rlich nur hei&szlig;t das es naturidentisch ist', '<p>Nat&uuml;rliche Zutaten m&uuml;ssen nicht aus der Natur stammen, Sie sind lediglich in der Natur in dieser Form vorhanden, m&uuml;ssen aber nicht aus Naturprodukten produziert worden sein.</p>\n', '2018-05-07 20:21:26', '2018-05-07 17:55:16'),
(16, 1, 15, 2, ' dass Teetrinker oft Halbblind sind', '<p>Sie vergessen n&auml;mlich den L&ouml;ffel rauszunehmen.</p>\n', '2018-05-11 20:21:26', '2018-05-11 08:20:31'),
(17, 1, 16, 2, ' dass Wiener Schnitzel immer aus Kalbsfleisch hergestellt wird', '<p>Lediglich das Schnitzel &quot;Wiener Art&quot; ist aus Schweinefleisch.</p>\n', '2018-05-11 20:21:26', '2018-05-11 08:22:01'),
(18, 1, 17, 2, ' dass ein Pferd heisst Pferd weil es lebt auf der Erd', '<p>Lebte es in der Luft hiess es Pfluft.</p>\n', '2018-05-12 20:21:26', '2018-05-12 11:27:22'),
(19, 1, 18, 2, ' dass im deutschem K&auml;sekuchen gar kein K&auml;se drin ist', '<p>Im Amerikanischem Cheesecake ist aber Frischk&auml;se mit drin.</p>\n', '2018-05-13 20:21:26', '2018-05-13 13:02:39'),
(20, 1, 19, 2, ' dass Die Taschenuhrtasche noch heute verbaut wird', '<p>Die kleine Tasche in Jeans in der rechten vorderen Tasche ist Urspr&uuml;nglich f&uuml;r Taschenuhren konzipiert. Aber noch heute passt eine Taschenuhr hinein.</p>\n', '2018-05-15 20:21:26', '2018-05-15 16:08:49'),
(21, 1, 20, 2, ' dass Salvator Dahl&iacute; das Logo von Chuppa Chups entworfen hat', '<p>Ja DahlÃ­ hat damals das Logo des spanischem Lolliproduzenten designt.</p>\n', '2018-05-16 20:21:26', '2018-05-16 15:15:08'),
(22, 1, 21, 2, ' dass die Zunge der st&auml;rkste Muskel im K&ouml;rper eines Menschen ist', '<p>Ja die Zunge ist starkt und wird nicht von einem Knochen gest&uuml;tzt.</p>\n', '2018-05-16 20:21:26', '2018-05-16 15:17:47'),
(23, 1, 22, 2, ' dass Schlittenhund im Winter Schuhe tragen', '<p>Ja, die empfindlichen Pfoten werden bei Schlittenhunden mit einer art Schuhe gesch&uuml;tzt.</p>\n', '2018-05-16 20:21:26', '2018-05-16 15:20:29'),
(24, 1, 23, 2, ' dass die Zeit schneller vergeht wenn einem etwas Spa&szlig; macht', '<p>Wenn wir Spa&szlig; an einer Sache haben kommt einem die Zeit k&uuml;rzer vor.  &lt;br /&gt;<br />\nMan nehme 2 Gruppen, eine Spielt Billiard mit Frauen in Bikini und eine Gruppe sch&auml;lt Kartoffeln. Gruppe 1 dachte das sie eine viertel Stunde gespielt hat, w&auml;hrend die Andere Gruppe glaubte eine Dreviertelstunde zu sch&auml;len. Beide Gruppen waren 30 Minuten besch&auml;ftigt.  &lt;br /&gt;<br />\nErgo, wenn eine Sache Spa&szlig; macht vergeht die Zeit schneller.+</p>\n', '2018-05-17 20:21:26', '2018-05-17 17:28:14'),
(25, 1, 24, 1, ' dass Wodka auf deutsch &uuml;bersetzt W&auml;sserchen heisst', '<p>Im Russischem steht das Wort Woda f&uuml;r Wasser, mit der verniedlichung &quot;ka&quot; am ende hei&szlig;t es W&auml;sserchen oder eben Wodka</p>\n', '2018-05-17 20:21:26', '2018-05-17 17:30:23'),
(26, 1, 25, 2, ' dass man Seine Wirbels&auml;ule knacken h&ouml;rt wenn man sein Ohr auf den Bauchnabel legt', '<p>Ja was soll man denn sonst h&ouml;ren :)</p>\n', '2018-05-17 20:21:26', '2018-05-17 17:32:40'),
(27, 1, 26, 2, ' dass Pferde nicht kotzen k&ouml;nnen', '<p>Pferde k&ouml;nnen nicht kotzen und deswegen ern&auml;hren Sie sich nur mit gesundem Futter.  &lt;br /&gt;<br />\nIm schlimmsten Fall bekommen Sie eine Schlundverstopfung die &Auml;rztlich behandelt werden muss.</p>\n', '2018-05-18 20:21:26', '2018-05-18 16:53:14'),
(28, 1, 27, 2, ' dass man schwangere Frauen immer auf die linke Seite bei einer stabilen Seitenlage legen soll', '<p>Die Vene die das Embryo ern&auml;hrt liegt auf der rechten Seite und sollte nicht abgeklemmt werden. Deswegen immer auf Links drehen.</p>\n', '2018-05-18 20:21:26', '2018-05-18 16:55:44'),
(29, 1, 28, 2, 'warum Vogelschei&szlig;e immer Wei&szlig; ist', '<p>Weil V&ouml;gel nicht Pinkeln k&ouml;nnen vermischt sich der Urin mit der Kacke und der Amoniak im Urin f&auml;rbt die Schei&szlig;e Wei&szlig;.</p>\n', '2018-06-03 20:21:26', '2018-06-03 06:17:30'),
(30, 1, 29, 2, 'was das gr&ouml;&szlig;te Organ im menschlichem K&ouml;rper ist', '<p>Die Haut ist das gr&ouml;&szlig;te Organ im menschlichem K&ouml;rper.</p>\n', '2018-06-03 20:21:26', '2018-06-03 06:20:17'),
(31, 1, 30, 2, 'woran man einen Staatswagen erkennt', '<p>Das Nummernschild hat nach dem - nur eine Zahl. z.B. SE-123456</p>\n', '2018-06-03 20:21:26', '2018-06-03 06:22:43'),
(32, 1, 31, 2, ' dass Wasser trinken t&ouml;dlich sein kann', '<p>Ja, wer zu viel Wasser trinkt kann davon sterben weil die gesamten Elektrolyte rausgespielt werden. Aber das ist erst ab 8 Liter pro Tag gef&auml;hrlich</p>\n', '2018-06-03 20:21:26', '2018-06-03 06:25:29'),
(33, 1, 32, 2, 'was der unterschied zwischen Moin und Moin Moin ist', '<p>Moin ist in Norddeutschland eine beliebte Begr&uuml;&szlig;ungsfloskel.  &lt;br /&gt;<br />\nMoin Moin hei&szlig;t im Prinzip das selbe wie Moin nur das der der Moin Moin sagt eher redselig ist.</p>\n', '2018-06-03 20:21:26', '2018-06-03 06:28:59'),
(34, 1, 33, 2, ' dass Espresso weniger Koffein enth&auml;lt als eine Tasse Kaffee', '<p>Robusta-Bohnen sind zwar etwas koffeinreicher als Arabica-Bohnen, aber insgesamt enth&auml;lt ein Espresso doch weniger Koffein als Filterkaffee. Das liegt schlicht daran, dass er sehr viel kleiner ist.</p>\n', '2018-06-10 20:21:26', '2018-06-10 13:49:23'),
(35, 1, 34, 2, ' dass Arbeitspferde auf kurzen Strecken mehr als 1 PS leisten', '<p>Bis zu 24 PS k&ouml;nnen Kaltbl&uuml;ter auf kurzen Strecken erreichen.  &lt;br /&gt;<br />\nSomit ist eine Pferdest&auml;rke nicht immer ein PS.</p>\n', '2018-06-23 20:21:26', '2018-06-23 14:00:18'),
(36, 1, 35, 2, ' dass Frauen sich seltener die H&auml;nde waschen als M&auml;nner', '<p>Eine Studie unter Medizinern besagt, das sich Frauen nach dem Toilettengang sich seltener die H&auml;nde waschen als M&auml;nner.</p>\n', '2018-06-23 20:21:26', '2018-06-23 14:03:46'),
(37, 1, 36, 2, 'was der unterschied zwischen einer richtigen Schlange und einer Autoschlange ist', '<p>Bei der richtigen Schlange ist das Arschloch hinten.</p>\n', '2018-06-23 20:21:26', '2018-06-23 14:27:19'),
(38, 1, 37, 2, 'was la cucaracha auf deutsch hei&szlig;t', '<p>Es hei&szlig;t, die Kakerlake.</p>\n', '2018-06-23 20:21:26', '2018-06-23 14:34:39'),
(39, 1, 38, 2, ' dass Aluminium nicht Rosten kann', '<p>Ja, Aluminium in reiner Form kann nicht rosten.</p>\n', '2018-07-02 20:21:26', '2018-07-02 16:35:12'),
(40, 1, 39, 2, ' dass Elefantenk&uuml;he 22 Monate tragen', '<p>Ja Elefantenk&uuml;he tragen 22 Monate bis sie ihr Kind geb&auml;ren.</p>\n', '2018-07-06 20:21:26', '2018-07-06 14:12:00'),
(41, 1, 40, 2, ' dass Pommes Frites nicht aus Frankreich stammen', '<p>Pommes Frites, was auf deutsch frittierter Apfel hei&szlig;t stammt tats&auml;chlich aus Belgien.</p>\n', '2018-07-15 20:21:26', '2018-07-15 06:57:14'),
(42, 1, 41, 2, 'wer die meisten Motoren baut', '<p>Honda baut die meisten Motoren auf der Welt.</p>\n', '2018-07-29 20:21:26', '2018-07-29 07:19:09'),
(43, 1, 42, 2, 'wonach Rubinienholz riecht wenn man es schleift', '<p>Es riecht nach Kekse.</p>\n', '2018-07-29 20:21:26', '2018-07-29 07:20:40'),
(44, 1, 43, 2, ' dass man f&uuml;r jedes Hubschraubermodell einen extra F&uuml;hrerschein ben&ouml;tigt', '<p>Ja, der Helikopterpilot ben&ouml;tigt f&uuml;r jedes Hubschraubermodell das er fliegen will einen extra F&uuml;hrerschein.</p>\n', '2018-08-11 20:21:26', '2018-08-11 07:58:35'),
(45, 1, 44, 2, ' dass Chilli Con Carne gar nicht aus Mexico stammt', '<p>Chilli Con Carne ist ein texanisches Gericht und stammt nicht aus Mexico.</p>\n', '2018-08-12 20:21:26', '2018-08-12 08:16:08'),
(46, 1, 45, 2, ' dass Disco im Plattdeutschen nicht Disco hei&szlig;t', '<p>Disco ist im Plattdeutsch &quot;Dance op de deel&quot;.</p>\n', '2018-08-17 20:21:26', '2018-08-17 15:15:09'),
(47, 1, 46, 2, ' dass Italiener gar nicht Spaghetti Bolognese bestellen', '<p>In Italien ist Spaghetti Bolognese Spaghetti a la Ragout.</p>\n', '2018-08-25 20:21:26', '2018-08-25 12:13:58'),
(48, 1, 47, 2, ' dass Truthahn und Pute das selbe ist', '<p>Truthahn ist eine m&auml;nnliche Pute, und Pute ist ein weiblicher Truthahn.</p>\n', '2018-09-16 20:21:26', '2018-09-16 06:58:20'),
(49, 1, 48, 2, ' dass Plastik aus Erd&ouml;l hergestellt wird', '<p>Kunststoff wird aus Erd&ouml;l hergestellt.</p>\n', '2018-09-22 20:21:26', '2018-09-22 11:49:32'),
(50, 1, 49, 2, 'warum Fahrbahnmarkierungen im dunkeln leuchten', '<p>Weil kleine Glasperlen aus Altglas in der Farbe enthalten sind.</p>\n', '2018-10-07 20:21:26', '2018-10-07 10:44:15'),
(51, 1, 50, 2, ' dass Erdbeeren in Wirklichkeit N&uuml;sse sind', '<p>Die Erdbeere geh&ouml;rt in Wahrheit zu den Sammelnussfr&uuml;chten.</p>\n', '2018-10-13 20:21:26', '2018-10-13 15:15:04'),
(52, 1, 51, 2, 'wof&uuml;r das A und O steht', '<p>A wie Alpha und O wie Omega sind der erste bzw. letzte Buchstabe im griechischem Alphabet.</p>\n', '2018-10-21 20:21:26', '2018-10-21 09:23:32'),
(53, 1, 52, 2, 'was zuerst erfunden wurde, Feuerzeug oder Streichholz', '<p>Benzinfeuerzeuge sind &auml;lter als Streichh&ouml;lzer.</p>\n', '2018-10-31 20:21:26', '2018-10-31 18:57:36'),
(54, 1, 53, 2, ' dass die Tage im Sommer k&uuml;rzer und im Winter l&auml;nger werden', '<p>Ja, ab der Sommersonnenwende werden die Tage um 5 Minuten k&uuml;rzer und um Winter wieder 5 Minuten l&auml;nger pro Tag.</p>\n', '2018-11-11 20:21:26', '2018-11-11 07:53:50'),
(55, 1, 54, 2, ' dass Bambus nur alle 80-130 Jahre bl&uuml;ht', '<p>Bambusse bl&uuml;hen in Intervallen von ca. 80 bis 130 Jahren.</p>\n', '2018-11-11 20:21:26', '2018-11-11 12:08:17'),
(60, 1, 55, 2, ' dass im Eiwei&szlig; gar kein Eiwei&szlig; enthalten ist', '<p>Eiwei&szlig; ist nur im Eigelb enthalten. Das Eiklar enth&auml;lt kein Eiwei&szlig;.</p>\n', '2018-11-20 20:21:26', '2018-11-20 19:47:40'),
(61, 1, 56, 2, ' dass Paprika mehr Vitamin C als Zitrusfr&uuml;chte enth&auml;lt', '<p>Ja die Paprika ist nach Hagebutte und Sanddorn die Vitaminreichste Frucht.</p>\n', '2018-11-24 20:21:26', '2018-11-24 14:55:11'),
(62, 1, 57, 2, ' dass harte Matratzen besser f&uuml;r den R&uuml;cken sind als weiche', '<p>Ja, eine harte Matratze ist besser f&uuml;r den R&uuml;cken.</p>\n', '2018-11-24 20:21:26', '2018-11-24 15:56:42'),
(63, 1, 58, 2, ' dass es nur eine Band gab in der jedes Mitglied einen Top-10 Hit schrieb', '<p>Ja es war Queen.</p>\n', '2018-12-02 20:21:26', '2018-12-02 09:09:34'),
(64, 1, 59, 2, ' dass man mit Cola Fliegendreck vom Auto bekommt', '<p>Einfach Cola in eine Sch&uuml;ssel, Lappen rein, Auto einmal nass machen und dann mit Cola einreiben oder Waschen.</p>\n', '2018-12-02 20:21:26', '2018-12-02 09:22:34'),
(65, 1, 60, 2, 'womit KrankenpflegerInnen rasieren &uuml;ben', '<p>Sie benutzen einen Luftballon. Rasierschaum rauf und vorsichtig abschaben.  &lt;br /&gt;<br />\nWenn der Ballon platzt h&auml;tten sie den Patienten geschnitten.</p>\n', '2018-12-04 20:21:26', '2018-12-04 17:47:18'),
(66, 1, 61, 2, 'warum Rehe einen wei&szlig;en Fleck am Hintern haben', '<p>Rehe sind Fluchttiere, und wenn sie hintereinander fliehen so finden sie den Vordermann in der D&auml;mmerung leichter durch den wei&szlig;en Fleck am Hinterteil.</p>\n', '2018-12-05 20:21:26', '2018-12-05 17:10:54'),
(67, 0, 62, 2, ' dass Neum&uuml;nster die gef&auml;hrlichste Stadt Deutschlands ist', '<p>Pro Kopf gerechnet sind die meisten Straftaten in Neum&uuml;nster registriert worden.  &lt;br /&gt;<br />\nSomit ist Neum&uuml;nster in Schleswig Holstein die gef&auml;hrlichste Stadt Deutschlands.</p>\n', '2018-12-05 20:21:26', '2018-12-05 17:16:42'),
(68, 1, 63, 2, ' dass Verbrennungen am schnellsten verheilen wenn man sich den verbrannten Finger ans Ohrl&auml;ppchen h&auml;lt', '<p>Das Ohrl&auml;ppchen ist immer lauwarm, was das beste bei leichten Verbrennungen ist.  &lt;br /&gt;<br />\nDeswegen Finger ans Ohrl&auml;ppchen und die Brandblase kommt gar nicht erst.  &lt;br /&gt;<br />\nZumindest meistens klappt das</p>\n', '2018-12-05 20:21:26', '2018-12-05 17:30:55'),
(69, 1, 64, 2, 'welche Marke hinter Subaru steht', '<p>Subaru ist die Allradmarke von Toyota.</p>\n', '2018-12-05 20:21:26', '2018-12-05 17:37:42'),
(70, 1, 65, 2, ' dass Tintenfische keine Fische sind', '<p>Ja, Tintenfische sind Weichtiere und keine Fische.</p>\n', '2018-12-20 20:21:26', '2018-12-20 09:36:27'),
(71, 1, 66, 2, 'welche Firma das SUV erfunden hat', '<p>Jeep, es war ein Jeep.</p>\n', '2019-01-03 20:21:26', '2019-01-03 16:55:26'),
(72, 1, 67, 2, 'was der Unterschied zwischen Sultaninen und Rosinen ist', '<p>Sultaninen werden aus kernlosen Trauben hergestellt und Rosinen aus solchen mit Kernen.</p>\n', '2019-01-03 20:21:26', '2019-01-03 16:58:04'),
(73, 1, 68, 2, ' dass klarer Apfelsaft nichts f&uuml;r Vegetarier ist', '<p>Beim kl&auml;ren von Apfelsaft wird Gelatine verwendet die wiederum aus Knochen hergestellt wird.</p>\n', '2019-01-03 20:21:26', '2019-01-03 17:00:19'),
(74, 1, 69, 2, 'woher der Name Bob stammt', '<p>Bob ist die Kurzform von Robert.</p>\n', '2019-01-03 20:21:26', '2019-01-03 17:02:07'),
(75, 1, 70, 2, 'wer die europaweit gr&ouml;sste IT-Redaktion hat', '<p>Der Heise Verlag in Hannover ist Heimat der gr&ouml;ssten IT-Redaktion Europas.</p>\n', '2019-01-03 20:21:26', '2019-01-03 17:04:20'),
(76, 1, 71, 2, 'wieviel Prozent Butter mehr Fett hat als Margarine', '<p>Butter hat nur 2 Prozent mehr Fett als Margarine.</p>\n', '2019-01-03 20:21:26', '2019-01-03 17:06:32'),
(77, 1, 72, 2, 'wie man Aufkleber von glatten Oberfl&auml;chen entfernt', '<p>Mit Essig einreiben, einwirken lassen, und schon l&ouml;sen sich die Aufkleber wie von selbst.</p>\n', '2019-01-10 20:21:26', '2019-01-10 16:55:29'),
(78, 1, 73, 2, 'dass die Wahrscheinlichkeit gr&ouml;&szlig;er ist von einer Kokosnuss erschlagen zu werden. als von einem Haifisch angefallen zu werden', '<p>Ja, es ist wahrscheinlicher von einer Kokosnuss erschlagen zu werden, als von einem Hai gebissen zu werden.</p>\n', '2019-01-27 20:21:26', '2019-01-27 11:11:19'),
(79, 1, 74, 2, 'warum der Thunfisch Thunfisch heisst', '<p>Taucht ein Taucher vor der K&uuml;ste nach Perlen und wird von einem Fisch gebissen, darauf der Taucher: &quot;Das kannst du doch nicht tun Fisch&quot;.</p>\n', '2019-02-04 20:21:26', '2019-02-04 17:07:39'),
(80, 1, 83, 2, 'welches Land in Europa die h&ouml;chste Selbstmordrate hat', '<p>Finnland</p>\n', '2019-02-06 20:21:26', '2019-02-06 17:08:34'),
(81, 1, 75, 2, 'woher der Name Sascha stammt', '<p>Sascha ist die russische Kurzform von Alexander.</p>\n', '2019-02-06 20:21:26', '2019-02-06 17:10:24'),
(82, 1, 76, 2, 'dass die Sonne im Winter 5 Minuten pro Tag l&auml;nger scheint', '<p>Im Winter betr&auml;gt die Dauer des Sonnenscheins immer 5 Minuten mehr pro Tag.  &lt;br /&gt;<br />\nIm Sommer betr&auml;gt die Dauer des Tages 5 Minuten weniger pro Tag.</p>\n', '2019-02-10 20:21:26', '2019-02-10 07:48:00'),
(83, 1, 77, 2, 'dass Schiedsrichter in Deutschland jedes Bundesligaspiel umsonst besuchen k&ouml;nnen', '<p>Als Besitzer eines Schiedsrichterscheins sind alle Bundesligaspiele umsonst.</p>\n', '2019-03-12 20:21:26', '2019-03-12 16:17:22'),
(84, 1, 78, 2, 'wie viele Sterne es im Universum gibt', '<p>Ungef&auml;hr genauso viele wie Sandk&ouml;rner auf der Erde.</p>\n', '2019-03-23 20:21:26', '2019-03-23 14:42:15'),
(85, 1, 79, 2, 'dass die Erfinder von Adidas und Puma verwand sind', '<p>Adi Dasler und sein Bruder erfanden die beiden Sportmarken.</p>\n', '2019-03-24 20:21:26', '2019-03-24 08:27:38'),
(86, 1, 80, 2, 'welches die Farbe ist die man als erstes sieht', '<p>Es ist Gelb, vermutlich wegen der gelben Sonne.</p>\n', '2019-03-24 20:21:26', '2019-03-24 10:55:24'),
(87, 1, 81, 2, 'dass Helmut Schmidt ausschlie&szlig;lich Menthol Zigaretten geraucht hat', '<p>Ja, er war ein Fan von Menthol Zigaretten, Gott hab Ihn selig.</p>\n', '2019-03-30 20:21:26', '2019-03-30 09:14:05'),
(88, 1, 82, 2, 'was Blinde an einer Ampel machen', '<p>Sie dr&uuml;cken einen kleinen Knopf an der Unterseite des Dr&uuml;ckers um die Ampel auf T&ouml;ne umzustellen. Ohne das bet&auml;tigen des Knopfes piept die Ampel nicht.</p>\n', '2019-03-30 20:21:26', '2019-03-30 09:16:51'),
(89, 1, 84, 2, 'wieviel ein M&uuml; ist', '<p>Wenn man eine M&uuml;nze zwischen den Fingern verreibt, das Geldst&uuml;ck noch riechen kann aber nicht mehr sehen kann dann ist die M&uuml;nze noch ein M&uuml; hoch.</p>\n', '2019-04-26 20:21:26', '2019-04-25 22:00:00'),
(90, 1, 85, 2, 'dass Farbige mehr kurzzuckende Muskeln haben', '<p>Farbige Menschen haben ca. 20% mehr kurzzuckende Muskeln was Ihre Bewegungen geschmeidiger macht. Selbst mit extremen Training sind die Bewegungen nie so geschmeidig wie bei einem Farbigen.</p>\n', '2019-04-06 20:21:26', '2019-04-06 09:56:40'),
(91, 1, 86, 2, 'wer den meisten Kaffee auf der Welt trinkt', '<p>Die Finnen trinken den meisten Kaffee auf der Welt.  &lt;br /&gt;<br />\nDas h&auml;ngt mit dem Alkoholverbot von fr&uuml;her zusammen,  &lt;br /&gt;<br />\nals Ersatzdroge wurde/wird Kaffee getrunken</p>\n', '2019-04-14 20:21:26', '2019-04-14 11:40:46'),
(92, 1, 87, 2, 'welches Volk die meisten K&uuml;hlschr&auml;nke pro Kopf besitzt', '<p>Es sind die Inuit, besser bekannt als Eskimos.  &lt;br /&gt;<br />\nBei den Inuit ist es so kalt dass alles einfrieren w&uuml;rde wenn es nicht &quot;gek&uuml;hlt&quot; werden w&uuml;rde.</p>\n', '2019-04-14 20:21:26', '2019-04-14 11:43:55'),
(93, 1, 88, 2, 'womit man Holzbretter desinfiziert', '<p>Mit Zitronensaft werden Holzbretter desinfiziert.</p>\n', '2019-04-20 20:21:26', '2019-04-20 18:38:08'),
(94, 1, 89, 2, 'was der Unterschied zwischen Nasi Goreng und Bami Goreng ist', '<p>Nasi Goreng ist mit Reis und Bami Goreng ist mit Nudeln.  &lt;br /&gt;<br />\nIch mag sie beide.</p>\n', '2019-04-21 20:21:26', '2019-04-21 07:23:42'),
(95, 1, 90, 2, 'wann Karfreitag ist', '<p>Karfreitag ist immer der Freitag nach dem letzten Vollmond im April.</p>\n', '2019-05-29 20:21:26', '2019-05-29 17:42:55'),
(96, 1, 91, 2, 'warum 4 Grad Celsius eine magische Temperatur ist', '<p>Ab 4 Grad Celsius ist die Anomalie des Wassers zu beobachten.  &lt;br /&gt;<br />\nWasser dehnt sich entgegen aller anderer Stoffe ab 4 Grad oder k&auml;lter weiter aus.  &lt;br /&gt;<br />\nDesweiteren W&auml;chst Gras bei bis zu 4 Grad oder w&auml;rmerA noch.  &lt;br /&gt;<br />\nUnd unser Atem wird ab 4 Grad oder k&auml;lter sichtbar</p>\n', '2019-05-30 20:21:26', '2019-05-30 15:21:27'),
(97, 1, 92, 2, 'dass nicht alle Whirlpools Yakuzis sind', '<p>Aber alle Yakuzis sind Whirlpools.  &lt;br /&gt;<br />\nYakuzi ist eine Whirlpool Marke.</p>\n', '2019-06-30 20:21:26', '2019-06-30 06:40:10'),
(98, 1, 93, 2, 'Mit welchem Tier man fr&uuml;her L&ouml;wen gejagt hat', '<p>Fr&uuml;her wurden L&ouml;wen mit Deutschen Doggen gejagt.</p>\n', '2019-07-21 20:21:26', '2019-07-21 11:51:17'),
(99, 1, 94, 2, 'wie viel Stunden ein Koala am Tag schl&auml;ft', '<p>Ganze 20 Stunden pro Tag verbringt der Koala damit zu schlafen.</p>\n', '2019-08-18 20:21:26', '2019-08-18 11:21:47'),
(100, 1, 95, 2, 'Woher eine Blasenentz&uuml;ndung kommt', '<p>Eine Blasenentz&uuml;ndung kommt von Bakterien und nicht vom im kalten Sitzen.</p>\n', '2019-11-03 20:21:26', '2019-11-03 13:00:18'),
(101, 1, 96, 2, 'Wieviel CO2 unser Fleischkonsum kostet', '<p>Ein drittel des CO2 Verbrauchs ist nur f&uuml;r die Produktion von Fleisch verantwortlich.</p>\n', '2019-11-03 20:21:26', '2019-11-03 13:03:42'),
(102, 1, 97, 2, 'wozu die kleine Tasche in einer Jeans da ist', '<p>Die kleine Tasche ist f&uuml;r eine Taschenuhr gemacht worden, und sie wird noch heute integriert, obwohl kaum einer sie daf&uuml;r noch nutzt</p>\n', '2019-11-03 20:21:26', '2019-11-03 13:06:54'),
(103, 1, 98, 2, 'Wozu Rippen da sind', '<p>Rippen sind gemacht zum Brechen.  &lt;br /&gt;<br />\nSo absorbieren sie die meiste Energie bei einer Kollision.</p>\n', '2019-11-03 20:21:26', '2019-11-03 13:09:11'),
(104, 1, 99, 2, 'wof&uuml;r Haribo steht', '<p>Haribo ist die Abkürzung von HAns RIegel BOnn.</p>\n', '2019-11-20 20:21:26', '2019-11-20 09:29:18'),
(105, 1, 100, 2, 'dass ein Rolltreppengel&auml;nder nicht die selbe Geschwindigkeit hat wie die Treppe', '<p>Das Gel&auml;nder l&auml;uft schneller als die Treppe damit man nicht so leicht nach hinten kippt.</p>\n', '2019-12-13 20:21:26', '2019-12-13 15:13:28'),
(106, 1, 101, 2, 'was die H&ouml;chststrafe f&uuml;r das Umfahren einer Kuh in Indien ist', '<p>In Indien kann man bis zu 7 Jahre Gef&auml;ngnis bekommen wenn man eine Kuh &uuml;berf&auml;hrt.</p>\n', '2020-01-12 20:21:26', '2020-01-12 15:09:07'),
(107, 1, 102, 2, 'Warum der Porsche 911, 911 hei&szlig;t', '<p>Urspr&uuml;nglich hie&szlig; der Porsche 911, Porsche 901 aber da hatten Sich die Zuffenhausener die Rechnung ohne Peugeot gemacht, die Mahnten an das die Zahl 901 mehr f&uuml;r Peugeot steht und sorgten daf&uuml;r das der Porsche nun 911 hie&szlig;.</p>\n', '2020-01-12 20:21:26', '2020-01-12 15:12:20'),
(108, 0, 103, 2, 'dass Obst schneller reift wenn man es mit &Auml;pfeln lagert', '<p>Obst wie z.B. Bananen reifen schneller wenn sie mit &Auml;pfeln in Kontakt kommen.</p>\n', '2020-01-17 20:21:26', '2020-01-17 19:08:38'),
(114, 1, 104, 2, 'wie lange Pandas pro Tag mit essen besch&auml;ftigt sind', '<p>Ganze 14 Stunden Pro Tag tun sie nichts anderes als fressen</p>\n', '2020-03-06 20:21:26', '2020-03-06 19:51:16'),
(115, 1, 105, 2, 'Welches die lautesten Tiere der Erde sind', '<p>Es sind Pottwale.  &lt;br /&gt;<br />\nNeben dem gr&ouml;ssten Hirn sind sie auch die lautesten.  &lt;br /&gt;<br />\nIhre Klicklaute k&ouml;nnen lauter als ein D&uuml;sentriebwerk sein.</p>\n', '2020-03-06 20:21:26', '2022-08-03 14:27:54'),
(116, 1, 106, 2, 'das Bananen schneller reifen wenn sie mit &Auml;pfeln gelagert werden', '<p>Ja, die &Auml;pfel sondern ein Reifegas aus was anderes Obst, wie Bananen schneller reifen lassen.</p>\n', '2020-09-05 20:21:26', '2022-08-03 14:27:28'),
(117, 1, 107, 2, 'wie oft man am Tag atmet', '<p>18000 x Atmen wir im Schnitt pro Tag</p>\n', '2023-02-10 20:21:26', '1970-01-01 00:00:00'),
(118, 1, 108, 2, 'Warum der Sonnenuntergang am Meer meist rot ist', '<p>Die Feuchtigkeit in der Luft wirkt wie ein Prisma das dass Licht bricht und den Himmel Rot erscheinen l&auml;sst</p>\n', '2024-09-29 20:21:26', '1970-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL DEFAULT 1,
  `position` bigint(11) DEFAULT NULL,
  `image_categories_id` bigint(11) NOT NULL DEFAULT 0,
  `headline` varchar(80) DEFAULT NULL,
  `headline_en` varchar(80) DEFAULT NULL,
  `status` enum('empty','sold','forsale','unsaleable','givenaway','lost','inwork') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `category_id` bigint(11) NOT NULL DEFAULT 0,
  `type_id` bigint(11) NOT NULL DEFAULT 0,
  `img_x` bigint(11) DEFAULT NULL,
  `img_y` bigint(11) DEFAULT NULL,
  `chg_date` bigint(11) NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `message_en` longtext DEFAULT NULL,
  `camera_id` bigint(11) NOT NULL DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `image_path` varchar(90) DEFAULT NULL,
  `Format` varchar(80) DEFAULT NULL,
  `preis` float(10,2) DEFAULT NULL,
  `users_id` bigint(11) NOT NULL DEFAULT 0,
  `xis_IsSaleable` tinyint(1) DEFAULT NULL,
  `xkis_Ticker` tinyint(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `pub`, `position`, `image_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `category_id`, `type_id`, `img_x`, `img_y`, `chg_date`, `message`, `message_en`, `camera_id`, `link`, `image_path`, `Format`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(435, 1, 1, 7, 'Rattlesnake House', 'Hamburger Menu', 'forsale', '2025-03-15 19:39:01', 2, 43, 1400, 1165, 0, '<p>Ein etwas neueres Kunstwerk</p>\n', '<p>A slightly more recent work of art</p>\n', 7, NULL, 'acefa8afe662c30ece5d84468eac298c.jpg', 'A4', 25.00, 1, 1, 1),
(6, 1, 299, 10, 'Die Schnecke', 'Die Schnecke', 'empty', '2006-08-23 19:39:01', 0, 0, 2560, 1920, 1156314000, '<p>Schnecke bei uns inner Laube.  &lt;br /&gt;<br />\nMan sieht sogar noch die Beschriftung annem Balken</p>\n', '<p>Schnecke bei uns inner Laube.  &lt;br /&gt;<br />\nMan sieht sogar noch die Beschriftung annem Balken</p>\n', 3, '', 'Die-Schnecke.jpg', '', 0.00, 1, 0, 1),
(10, 1, 298, 10, 'Bahnof Potsdamer Platz bei Nacht', 'Bahnof Potsdamer Platz bei Nacht', 'empty', '2006-09-27 19:39:01', 0, 0, 1680, 2240, 1159315800, '<p>Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  &lt;br /&gt;<br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.</p>\n', '<p>Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  &lt;br /&gt;<br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.</p>\n', 3, '', 'Potsdamer-Platz.jpg', '', 0.00, 1, 0, 1),
(15, 1, 297, 5, 'They Say Jump', 'They Say Jump', 'empty', '2002-04-11 19:39:01', 0, 0, 1024, 768, 1018541160, '<p>Ein etwas älteres Wallpaper von 2002</p>\n', '<p>Ein etwas älteres Wallpaper von 2002</p>\n', 0, '', 'jump.jpg', '1024x768 Pixel', 0.00, 1, 0, 1),
(16, 1, 296, 5, 'Where are you gone Now', 'Where are you gone Now', 'empty', '2002-05-16 19:39:01', 0, 0, 1024, 768, 1021565220, '<p>Wallpaper von 2002</p>\n', '<p>Wallpaper von 2002</p>\n', 0, '', 'where-are-u-gone-now.jpg', '1024x768 Pixel', 0.00, 1, 0, 1),
(17, 1, 295, 5, 'Smell the Roses', 'Smell the Roses', 'empty', '2002-07-12 19:39:01', 0, 0, 1024, 768, 1026490080, '<p>Wallpaper von 2002</p>\n', '<p>Wallpaper von 2002</p>\n', 0, '', 'smell-the-roses.jpg', '1024x768 Pixel', 0.00, 1, 0, 1),
(18, 1, 294, 5, 'RP- Wallpaper', 'RP- Wallpaper', 'empty', '2002-09-02 19:39:01', 0, 0, 1024, 768, 1030982880, '<p>Das Rotten-Psychos Wallpaper von 2002</p>\n', '<p>Das Rotten-Psychos Wallpaper von 2002</p>\n', 0, '', 'Rotten-Psychos.jpg', '1024x768 Pixel', 0.00, 1, 0, 1),
(21, 1, 293, 7, 'Edge Country', 'Edge Country', 'empty', '2003-04-11 19:39:01', 0, 0, 1600, 807, 1050082380, '', '', 0, '', 'P2062655.jpg', '', 0.00, 1, 0, 1),
(22, 1, 292, 7, 'Evil Bedtime', 'Evil Bedtime', 'empty', '2003-08-03 19:39:01', 0, 0, 1600, 1033, 1059932760, '', '', 0, '', 'P2062656.jpg', '', 0.00, 1, 0, 1),
(23, 1, 291, 7, 'Extreme Wounds', 'Extreme Wounds', 'forsale', '2004-06-01 19:39:01', 0, 0, 1400, 1050, 1086112080, NULL, NULL, 9, NULL, '8760297ebef73cdbe16ed8021f7f8187.JPG', NULL, 0.00, 1, 0, 1),
(25, 1, 290, 7, 'Rebeltown', 'Rebeltown', 'empty', '2003-12-28 19:39:01', 0, 0, 2000, 1500, 1072636440, NULL, NULL, 3, NULL, 'P2062660.jpg', NULL, 0.00, 1, 0, 1),
(28, 1, 289, 7, 'Hangtime', 'Hangtime', 'empty', '2004-10-02 19:39:01', 0, 0, 2000, 1500, 1096738140, '', '', 0, '', 'P2062662.jpg', '', 0.00, 1, 0, 1),
(30, 1, 288, 7, 'Blue Fontaine', 'Blue Fontaine', 'empty', '2004-11-08 19:39:01', 0, 0, 2560, 1920, 1099894200, '', '', 0, '', 'P2062665.jpg', '', 0.00, 1, 0, 1),
(31, 1, 287, 7, 'Circle Bang', 'Circle Bang', 'empty', '2004-11-30 19:39:01', 0, 0, 2000, 1500, 1101820320, '', '', 0, '', 'P2062664.jpg', '', 0.00, 1, 0, 1),
(33, 1, 286, 7, 'Neurotic Nurse', 'Neurotic Nurse', 'empty', '2004-12-03 19:39:01', 0, 0, 2000, 1500, 1102099620, '', '', 0, '', 'P2062666.jpg', '', 0.00, 1, 0, 1),
(36, 1, 285, 7, 'Lttle Kiwi', 'Lttle Kiwi', 'empty', '2005-04-05 19:39:01', 0, 0, 828, 688, 1112723460, '<p>Fineliner Artwork von 2005</p>\n', '<p>Fineliner Artwork von 2005</p>\n', 0, '', 'P2062671.jpg', '', 0.00, 1, 0, 1),
(37, 1, 284, 7, 'Spidermoon', 'Spidermoon', 'empty', '2005-08-05 19:39:01', 0, 0, 1600, 808, 1123264320, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062672.jpg', '', 0.00, 1, 0, 1),
(38, 1, 283, 7, 'Honeymoon', 'Honeymoon', 'empty', '2005-10-12 19:39:01', 0, 0, 2000, 1500, 1129139580, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062673.jpg', '', 0.00, 1, 0, 1),
(39, 1, 282, 7, 'Pole Position', 'Pole Position', 'unsaleable', '2006-02-02 19:39:01', 0, 0, 2000, 1500, 1138874040, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062675.jpg', '', 0.00, 1, 0, 1),
(41, 1, 281, 7, 'Goldfish', 'Goldfish', 'givenaway', '2006-05-13 19:39:01', 0, 0, 1600, 1298, 1147473360, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062680.jpg', '', 0.00, 1, 0, 1),
(42, 1, 280, 7, 'Disc Error', 'Disc Error', 'empty', '2006-05-15 19:39:01', 0, 0, 1600, 1041, 1147715760, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062685.jpg', '', 0.00, 1, 0, 1),
(43, 1, 279, 7, 'Cloud Spring', 'Cloud Spring', 'unsaleable', '2006-07-01 19:39:01', 0, 0, 2000, 1500, 1151757480, '<p>Fineliner Artwork von 2006</p>\n', '<p>Fineliner Artwork von 2006</p>\n', 0, '', 'P2062688.jpg', '', 0.00, 1, 0, 1),
(44, 1, 278, 7, 'Webmaster\'s Delight', 'Webmaster\'s Delight', 'unsaleable', '2006-12-08 19:39:01', 0, 0, 1600, 1237, 1165603320, '', '', 0, '', 'P2062692.jpg', '', 0.00, 1, 0, 1),
(46, 1, 277, 7, 'Damned Fleet', 'Damned Fleet', 'forsale', '2007-02-06 19:39:01', 0, 0, 1600, 1200, 1170788700, '', '', 0, '', 'P6023068.JPG', '', 25.00, 1, 1, 1),
(47, 1, 276, 7, 'Twisted Minds', 'Twisted Minds', 'forsale', '2007-04-27 19:39:01', 0, 0, 1600, 1200, 1177697160, '', '', 0, '', 'P6023067.JPG', '', 20.00, 1, 1, 1),
(48, 1, 275, 7, 'Known Bugs', 'Known Bugs', 'forsale', '2007-04-29 19:39:01', 0, 0, 1600, 1200, 1177835160, '', '', 0, '', 'P6023066.JPG', '', 20.00, 1, 1, 1),
(49, 1, 274, 7, 'Gullivers Adventures', 'Gullivers Adventures', 'forsale', '2007-05-01 19:39:01', 0, 0, 1600, 1200, 1178008020, '', '', 0, '', 'P6023065.JPG', '', 20.00, 1, 1, 1),
(50, 1, 273, 7, 'Chaotic Australia', 'Chaotic Australia', 'forsale', '2007-06-03 19:39:01', 2, 43, 2560, 1920, 1180859220, '<p>Chaotisches Australien</p>\n', '<p>Chaotisches Australien</p>\n', 0, NULL, 'P6023064.JPG', NULL, 20.00, 1, 1, 1),
(51, 1, 272, 7, 'Curved Spikes', 'Curved Spikes', 'forsale', '2007-08-05 19:39:01', 0, 0, 1600, 1200, 1186334880, '<p>2007er Fineliner Artwork</p>\n', '<p>2007er Fineliner Artwork</p>\n', 0, '', 'P6043079.JPG', '', 20.00, 1, 1, 1),
(53, 1, 271, 7, '? LionTree ?', '? LionTree ?', 'forsale', '2007-10-04 19:39:01', 0, 0, 1600, 1200, 1191518940, '<p>Der Löwe unter dem Baum</p>\n', '<p>Der Löwe unter dem Baum</p>\n', 0, '', 'P6043081.jpg', '', 25.00, 1, 1, 1),
(54, 2, 270, 7, 'Drachenvogel - Dragonbird', 'Drachenvogel - Dragonbird', 'lost', '2007-10-06 19:39:01', 0, 0, 2560, 1791, 1191691740, '<p>Fineliner Artwork 2007</p>\n', '<p>Fineliner Artwork 2007</p>\n', 0, '', 'dragonbird.jpg', '', 0.00, 1, 0, 1),
(62, 1, 269, 10, 'Verschneiter Tisch', 'Verschneiter Tisch', 'empty', '2010-01-22 19:39:01', 0, 0, 1600, 1200, 1264187669, '<p>Winter in Schleswig Holstein</p>\n', '<p>Winter in Schleswig Holstein</p>\n', 2, '', '100_0222.jpg', '', 0.00, 1, 0, 1),
(63, 1, 268, 5, 'Jugendhof Brandenburg Collage', 'Jugendhof Brandenburg Collage', 'empty', '2006-08-27 19:39:01', 0, 0, 1600, 1200, 1156683720, '<p>Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.</p>\n', '<p>Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.</p>\n', 0, '', 'JHBR-Wallpaper.jpg', '1600x1200 Pixel', 0.00, 1, 0, 1),
(65, 1, 267, 5, 'Worst Enemy', 'Worst Enemy', 'empty', '2010-06-27 19:39:01', 0, 0, 1600, 1050, 1277655109, '<p>Wallpaper von 2010</p>\n', '<p>Wallpaper von 2010</p>\n', 0, '', 'Worst-enemy.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(71, 1, 266, 10, 'Die grosse Eiche', 'Die grosse Eiche', 'empty', '2011-06-18 19:39:01', 0, 0, 1600, 1000, 1308424701, '<p>Eine Eiche bei uns in Bimöhlen im Sonnenuntergang</p>\n', '<p>Eine Eiche bei uns in Bimöhlen im Sonnenuntergang</p>\n', 2, '', 'baum_bimoehlen3.jpg', '', 0.00, 1, 0, 1),
(73, 1, 265, 7, 'Cool Livings', 'Cool Livings', 'givenaway', '2008-06-24 19:39:01', 0, 0, 1000, 683, 1214322660, '<p>Fineliner Artwork von 2008</p>\n', '<p>Fineliner Artwork von 2008</p>\n', 0, '', 'Cool-Livings.jpg', '', 20.00, 1, 0, 1),
(74, 1, 264, 7, 'Arthur Mac Donald', 'Arthur Mac Donald', 'forsale', '2008-09-28 19:39:01', 0, 0, 1000, 987, 1222617300, '<p>Fineliner Artwork von 2008</p>\n', '<p>Fineliner Artwork von 2008</p>\n', 0, '', 'arthus_mac-donald.jpg', '', 20.00, 1, 1, 1),
(75, 1, 263, 7, 'Evil Beast', 'Evil Beast', 'forsale', '2009-02-05 19:39:01', 0, 0, 1000, 915, 1233853320, '<p>Fineliner Artwork von 2009</p>\n', '<p>Fineliner Artwork von 2009</p>\n', 0, '', 'evil_beast.jpg', '', 20.00, 1, 1, 1),
(76, 1, 262, 7, 'Cumulative FIst', 'Cumulative FIst', 'forsale', '2009-06-24 19:39:01', 0, 0, 1000, 899, 1245859740, '<p>Cumulative Fist - Geballte Faust  &lt;br /&gt;<br />\nFineliner Artwork 2009</p>\n', '<p>Cumulative Fist - Geballte Faust  &lt;br /&gt;<br />\nFineliner Artwork 2009</p>\n', 0, '', 'cumulativ-fist.jpg', '', 20.00, 1, 1, 1),
(77, 1, 261, 7, 'Witch Chair', 'Witch Chair', 'forsale', '2009-09-24 19:39:01', 0, 0, 1000, 744, 1253809260, '<p>Fineliner Artwork von 2009</p>\n', '<p>Fineliner Artwork von 2009</p>\n', 0, '', 'Nollie-Flip.jpg', '', 20.00, 1, 1, 1),
(78, 1, 260, 7, 'Fool Garden', 'Fool Garden', 'forsale', '2011-06-24 19:39:01', 0, 0, 1000, 1080, 1308932755, '<p>Fineliner Artwork von 2011</p>\n', '<p>Fineliner Artwork von 2011</p>\n', 0, '', 'fool-garden.jpg', '', 20.00, 1, 1, 1),
(80, 1, 259, 7, 'Simple Minds', 'Simple Minds', 'forsale', '2011-06-24 19:39:01', 0, 0, 1600, 1243, 1308933108, '<p>Fineliner Artwork von 2011</p>\n', '<p>Fineliner Artwork von 2011</p>\n', 0, '', 'Simple_Minds.jpg', '', 20.00, 1, 1, 1),
(81, 1, 258, 10, 'Elke Live', 'Elke Live', 'empty', '2011-09-09 19:39:01', 0, 0, 1200, 1600, 1315594558, '<p>Das ist Elke, die Katze meiner Schwester.</p>\n', '<p>Das ist Elke, die Katze meiner Schwester.</p>\n', 2, '', 'thecat.jpg', '', 0.00, 1, 0, 1),
(82, 1, 257, 10, 'Papageno Nana', 'Papageno Nana', 'empty', '2011-09-10 19:39:01', 0, 0, 1196, 1600, 1315665074, '<p>Kunstfigur aus Pappmachee</p>\n', '<p>Kunstfigur aus Pappmachee</p>\n', 2, '', 'papageno_nana.jpg', '', 0.00, 1, 0, 1),
(83, 1, 256, 5, 'Asarios Blog', 'Asarios Blog', 'empty', '2012-02-10 19:39:01', 0, 0, 1680, 1050, 1328898251, '<p>Wallpaper von 2012</p>\n', '<p>Wallpaper von 2012</p>\n', 0, '', 'ab_bg.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(84, 1, 255, 7, 'Hawk-Eye - Falkenauge', 'Hawk-Eye - Falkenauge', 'lost', '2010-11-27 19:39:01', 0, 0, 990, 633, 1290883020, '<p>Fineliner Artwork 2010</p>\n', '<p>Fineliner Artwork 2010</p>\n', 0, '', 'Hawk-Eye.jpg', '', 0.00, 1, 0, 1),
(85, 1, 254, 7, 'Find-Layer - Gefundene Ebene', 'Find-Layer - Gefundene Ebene', 'forsale', '2010-05-05 19:39:01', 0, 0, 1260, 642, 1273081080, '<p>Fineliner Artwork von 2010</p>\n', '<p>Fineliner Artwork von 2010</p>\n', 0, '', 'Find-Layer.jpg', '', 20.00, 1, 1, 1),
(87, 1, 253, 7, 'Ginger Claw', 'Ginger Claw', 'unsaleable', '2012-02-26 19:39:01', 0, 0, 558, 500, 1692887694, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'ginger-claw.jpg', '', 0.00, 1, 0, 1),
(88, 1, 252, 10, 'Sonnenblume', 'Sonnenblume', 'empty', '2012-04-01 19:39:01', 0, 0, 1680, 1260, 1333313567, '<p>Ein Foto von 2012</p>\n', '<p>Ein Foto von 2012</p>\n', 2, '', 'Sunflowers.jpg', '', 0.00, 1, 0, 1),
(89, 0, 251, 2, 'Tri-Opterox I', 'Tri-Opterox I', 'forsale', '2012-06-23 19:39:01', 0, 0, 1613, 2000, 1340464748, '<p>3 Leinwände ein Bild.  &lt;br /&gt;<br />\nMein erstes &quot;großes Werk&quot; in Acryl auf Leinwand</p>\n', '<p>3 Leinwände ein Bild.  &lt;br /&gt;<br />\nMein erstes &quot;großes Werk&quot; in Acryl auf Leinwand</p>\n', 0, '', 'Tri-Opterox.jpg', '3x 80x20x3cm (BxHxT)', 115.00, 1, 1, 1),
(90, 1, 250, 10, 'Pf&uuml;tze', 'Pf&uuml;tze', 'empty', '2012-06-29 19:39:01', 0, 0, 1680, 1260, 1340994423, '<p>Eine Pfütze vor unserem Haus</p>\n', '<p>Eine Pfütze vor unserem Haus</p>\n', 2, '', 'hecke.jpg', '', 0.00, 1, 0, 1),
(94, 1, 249, 10, 'Boot im Hasengraben', 'Boot im Hasengraben', 'empty', '2012-07-12 19:39:01', 0, 0, 1680, 1260, 1342112889, '<p>Ein einzelnes Boot im Potsdamer Hasengraben</p>\n', '<p>Ein einzelnes Boot im Potsdamer Hasengraben</p>\n', 2, '', 'Boot_im_Hasengraben.jpg', '', 0.00, 1, 0, 1),
(95, 2, 248, 7, 'Bearhunt - B&auml;renjagd', 'Bearhunt - B&auml;renjagd', 'forsale', '2012-07-19 19:39:01', 0, 0, 1344, 1289, 1342719438, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'Bearhunt.jpg', '', 20.00, 1, 1, 1),
(96, 1, 247, 7, 'Wormholes', 'Wormholes', 'forsale', '2012-07-19 19:39:01', 0, 0, 1475, 1038, 1342719566, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'wormholes.jpg', '', 20.00, 1, 1, 1),
(97, 1, 246, 7, 'Sunny Valley', 'Sunny Valley', 'forsale', '2008-11-20 19:39:01', 0, 0, 1680, 1528, 1353420300, '<p>Fineliner Artwork von 2008</p>\n', '<p>Fineliner Artwork von 2008</p>\n', 0, '', 'IMG_2223.jpg', '', 20.00, 1, 1, 1),
(98, 1, 245, 7, 'Hallo Kittie', 'Hallo Kittie', 'forsale', '2007-12-18 19:39:01', 0, 0, 2000, 1500, 1197986820, '<p>Fineliner Artwork von 2008</p>\n', '<p>Fineliner Artwork von 2008</p>\n', 0, '', 'IMG_2224.jpg', '', 20.00, 1, 1, 1),
(99, 1, 244, 7, 'Snowie Time', 'Snowie Time', 'forsale', '2012-03-10 19:39:01', 0, 0, 2000, 1500, 1331388420, '', '', 0, '', 'IMG_2225.jpg', '', 20.00, 1, 1, 1),
(100, 1, 243, 7, 'Razorblade', 'Razorblade', 'forsale', '2012-04-22 19:39:01', 0, 0, 1680, 2311, 1335100020, '', '', 0, '', 'IMG_2226.jpg', '', 20.00, 1, 1, 1),
(101, 1, 242, 7, 'American Dream', 'American Dream', 'forsale', '2012-05-20 19:39:01', 0, 0, 2000, 1500, 1337520360, '', '', 0, '', 'IMG_2228.jpg', '', 20.00, 1, 1, 1),
(102, 1, 241, 7, 'Calculator Eye', 'Calculator Eye', 'unsaleable', '2012-06-12 19:39:01', 0, 0, 2000, 1500, 1339507680, '', '', 0, '', 'IMG_2227.jpg', '', 0.00, 1, 0, 1),
(103, 1, 240, 7, 'Rasputin Errors', 'Rasputin Errors', 'givenaway', '2012-11-20 19:39:01', 0, 0, 2000, 1500, 1353423420, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'IMG_2254.jpg', '', 0.00, 1, 0, 1),
(104, 1, 239, 7, 'Red Stone', 'Red Stone', 'unsaleable', '2012-06-19 19:39:01', 0, 0, 1680, 1497, 1340115060, '', '', 0, '', 'IMG_2236.jpg', '', 0.00, 1, 0, 1),
(105, 1, 238, 7, 'Knowledge 2000', 'Knowledge 2000', 'forsale', '2012-12-20 19:39:01', 0, 0, 2000, 1500, 1356016980, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'IMG_2242.jpg', '', 20.00, 1, 1, 1),
(106, 1, 237, 7, 'Supersonic', 'Supersonic', 'forsale', '2012-06-28 19:39:01', 0, 0, 2000, 1500, 1340893560, '', '', 0, '', 'IMG_2241.jpg', '', 20.00, 1, 1, 1),
(107, 1, 236, 7, 'Lucky Beggar', 'Lucky Beggar', 'forsale', '2008-01-01 19:39:01', 0, 0, 1680, 1938, 1199201220, '', '', 0, '', 'IMG_2247.jpg', '', 20.00, 1, 1, 1),
(108, 1, 235, 7, 'Long Time', 'Long Time', 'forsale', '2012-07-01 19:39:01', 0, 0, 2000, 1500, 1341153240, '', '', 0, '', 'IMG_2239.jpg', '', 20.00, 1, 1, 1),
(109, 1, 234, 11, 'Color Art', 'Color Art', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 2000, 1500, 1342795058, '', '', 0, '', 'IMG_2251.jpg', '', 0.00, 1, 0, 1),
(110, 1, 233, 11, 'Grey Shadow', 'Grey Shadow', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 2000, 1500, 1342795128, '', '', 0, '', 'IMG_2240.jpg', '', 0.00, 1, 0, 1),
(111, 1, 232, 7, 'Joker Face', 'Joker Face', 'forsale', '2008-03-02 19:39:01', 0, 0, 0, 0, 1204472400, '', '', 0, '', 'P2062665.jpg', '', 20.00, 1, 1, 1),
(112, 2, 231, 11, 'People of Joy', 'People of Joy', 'unsaleable', '2001-01-02 19:39:01', 0, 0, 1413, 2290, 1342795423, '', '', 0, '', '100_1436.jpg', '', 0.00, 1, 0, 1),
(113, 1, 230, 7, 'Unfinished Mask', 'Unfinished Mask', 'unsaleable', '2012-07-15 19:39:01', 0, 0, 1680, 2462, 1342363440, '', '', 0, '', 'IMG_2261.jpg', '', 0.00, 1, 0, 1),
(121, 1, 223, 7, 'Cruel Fool', 'Cruel Fool', 'forsale', '2012-07-20 19:39:01', 0, 0, 1680, 1533, 1342800564, '', '', 0, '', 'IMG_2287.jpg', '', 20.00, 1, 1, 1),
(114, 1, 229, 11, 'Composed Train', 'Composed Train', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1680, 1069, 1342798582, '', '', 0, '', 'IMG_2256.jpg', '', 0.00, 1, 0, 1),
(115, 1, 228, 11, 'Ocean Drift', 'Ocean Drift', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1680, 2000, 1342798600, '', '', 0, '', 'IMG_2258.jpg', '', 0.00, 1, 0, 1),
(116, 1, 227, 11, 'Horizontal Skip', 'Horizontal Skip', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1596, 1332, 1342798619, '', '', 0, '', 'IMG_2260.jpg', '', 0.00, 1, 0, 1),
(117, 1, 226, 11, 'My personal Injury', 'My personal Injury', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1680, 2087, 1342798638, '', '', 0, '', 'IMG_2259.jpg', '', 0.00, 1, 0, 1),
(118, 1, 225, 11, 'Simple Knife', 'Simple Knife', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1276, 1224, 1342798833, '', '', 0, '', 'IMG_2285.jpg', '', 0.00, 1, 0, 1),
(119, 1, 224, 11, 'Corner Mark', 'Corner Mark', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1552, 1132, 1342798849, '', '', 0, '', 'IMG_2286.jpg', '', 0.00, 1, 0, 1),
(122, 1, 222, 7, 'Easy Listenimg', 'Easy Listenimg', 'forsale', '2012-08-20 19:39:01', 0, 0, 2000, 1500, 1345486020, '', '', 0, '', 'IMG_2248.jpg', '', 20.00, 1, 1, 1),
(123, 1, 221, 11, 'Sunglasses', 'Sunglasses', 'unsaleable', '2012-07-20 19:39:01', 0, 0, 1284, 1560, 1342807935, '', '', 0, '', 'IMG_2276.jpg', '', 0.00, 1, 0, 1),
(124, 1, 220, 10, 'Potsdam @ Night', 'Potsdam @ Night', 'empty', '2012-07-20 19:39:01', 0, 0, 1680, 1057, 1342814348, '<p>Ein Sonnenuntergang in Brandenburgs Hauptstadt</p>\n', '<p>Ein Sonnenuntergang in Brandenburgs Hauptstadt</p>\n', 2, '', 'Potsdam-at-Night.jpg', '', 0.00, 1, 0, 1),
(125, 0, 219, 2, 'Auriel Mark IV', 'Auriel Mark IV', 'unsaleable', '2012-09-01 19:39:01', 0, 0, 888, 1080, 1346497423, '<p>4 Leinwände 1 Bild, diesmal etwas Breiter.</p>\n', '<p>4 Leinwände 1 Bild, diesmal etwas Breiter.</p>\n', 0, '', 'Auriel_Mark_IV.jpg', '', 0.00, 1, 0, 1),
(126, 1, 218, 10, 'Sky de Flugzeug', 'Sky de Flugzeug', 'empty', '2012-09-01 19:39:01', 0, 0, 1680, 1260, 1346512414, '<p>Der Himmel über uns</p>\n', '<p>Der Himmel über uns</p>\n', 2, '', '100_1054.jpg', '', 0.00, 1, 0, 1),
(127, 1, 217, 10, 'Car Shot', 'Car Shot', 'empty', '2012-09-04 19:39:01', 0, 0, 1680, 1680, 1346788034, '<p>Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling</p>\n', '<p>Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling</p>\n', 2, '', 'carshot2.jpg', '', 0.00, 1, 0, 1),
(128, 1, 216, 7, 'Nocturne', 'Nocturne', 'forsale', '2012-09-21 19:39:01', 0, 0, 0, 0, 1348238940, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, '', 'IMG_2212.jpg', '', 20.00, 1, 1, 1),
(129, 1, 215, 7, 'Blue Horizon', 'Blue Horizon', 'forsale', '2012-09-22 19:39:01', 0, 0, 1400, 1050, 1348325801, '<p>Fineliner Artwork von 2012</p>\n', '<p>Fineliner Artwork von 2012</p>\n', 0, NULL, 'fae27d6f5daa97abde939708d0f83b2e.JPG', NULL, 20.00, 1, 1, 1),
(130, 1, 214, 7, 'Stylish Bulldog', 'Stylish Bulldog', 'empty', '2010-09-23 19:39:01', 0, 0, 1680, 1110, 1285260000, '', '', 0, '', 'IMG_2255.jpg', '', 0.00, 1, 0, 1),
(131, 0, 213, 7, 'Black Jeans', 'Black Jeans', 'empty', '2010-09-23 19:39:01', 0, 0, 1680, 1354, 1285260120, '', '', 0, '', 'IMG_2257.jpg', '', 0.00, 1, 0, 1),
(132, 1, 212, 2, 'Green Valley', 'Green Valley', 'forsale', '2012-11-22 19:39:01', 0, 0, 1680, 1707, 1353614025, '<p>Leinwand und Acryl Zweifarbig</p>\n', '<p>Leinwand und Acryl Zweifarbig</p>\n', 0, '', 'Green_Valley.jpg', '60x60x3cm (BxHxT)', 80.00, 1, 1, 1),
(133, 1, 211, 5, 'Penguin Style', 'Penguin Style', 'empty', '2012-12-02 19:39:01', 0, 0, 1680, 1050, 1354475779, '<p>Wallpaper von 2012</p>\n', '<p>Wallpaper von 2012</p>\n', 0, '', 'penguin-style.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(134, 1, 210, 10, 'Elke 2k13', 'Elke 2k13', 'empty', '2013-01-06 19:39:01', 0, 0, 1680, 1260, 1357500081, '<p>Ein Foto von unserer Elke...</p>\n', '<p>Ein Foto von unserer Elke...</p>\n', 1, '', 'PC300151_01.jpg', '', 0.00, 1, 0, 1),
(135, 1, 209, 7, 'Colored Blur', 'Colored Blur', 'forsale', '2013-01-06 19:39:01', 0, 0, 1680, 616, 1357500421, '<p>Fineliner Artwork von 2013</p>\n', '<p>Fineliner Artwork von 2013</p>\n', 0, '', 'colored-blur.jpg', '', 20.00, 1, 1, 1),
(136, 1, 208, 7, 'Dadelix', 'Dadelix', 'givenaway', '2010-01-06 19:39:01', 0, 0, 1680, 1260, 1262806080, '<p>Fineliner Artwork von 2010</p>\n', '<p>Fineliner Artwork von 2010</p>\n', 0, '', 'dadelix.jpg', '', 0.00, 1, 0, 1),
(137, 1, 207, 2, 'Yellow Bomb', 'Yellow Bomb', 'forsale', '2013-01-20 19:39:01', 0, 0, 1400, 984, 1358710148, '<p>Zweifarbiges Werk aus Textilmalfarbe und Acryl</p>\n', '<p>Zweifarbiges Werk aus Textilmalfarbe und Acryl</p>\n', 0, NULL, '46e8ae558a4f91a72e6f8259b7c590b7.jpg', '70x50x3cm (BxHxT)', 80.00, 1, 1, 1),
(138, 1, 206, 10, 'Herzkartoffel', 'Herzkartoffel', 'empty', '2013-01-27 19:39:01', 0, 0, 1680, 1260, 1359312207, '<p>Eine Herzliche Angelegenheit, so ein Weihnachtsfest.</p>\n', '<p>Eine Herzliche Angelegenheit, so ein Weihnachtsfest.</p>\n', 1, '', 'PC310250.JPG', '', 0.00, 1, 0, 1),
(139, 1, 205, 10, 'Elke Playin', 'Elke Playin', 'empty', '2013-01-27 19:39:01', 0, 0, 1680, 1260, 1359312356, '<p>Elke mit Spielzeug am Schmusen</p>\n', '<p>Elke mit Spielzeug am Schmusen</p>\n', 1, '', 'P290111.JPG', '', 0.00, 1, 0, 1),
(140, 1, 204, 10, 'Elke Sleeping', 'Elke Sleeping', 'empty', '2013-01-27 19:39:01', 0, 0, 1680, 1260, 1359312601, '<p>Auch die größte Katze braucht Ihren Schlaf.</p>\n', '<p>Auch die größte Katze braucht Ihren Schlaf.</p>\n', 1, '', 'P280054.JPG', '', 0.00, 1, 0, 1),
(141, 1, 203, 5, 'Little Fugo Desktop', 'Little Fugo Desktop', 'empty', '2013-01-27 19:39:01', 0, 0, 1680, 1050, 1359313075, '<p>Mein Lieblingsfugo als Wallpaper</p>\n', '<p>Mein Lieblingsfugo als Wallpaper</p>\n', 0, '', 'lf9.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(142, 1, 202, 11, 'Little Fugo', 'Little Fugo', 'givenaway', '2013-01-27 19:39:01', 0, 0, 1680, 1200, 1359313392, '<p>Ein Kugelfisch mal anders..</p>\n', '<p>Ein Kugelfisch mal anders..</p>\n', 0, '', 'Little_Fugo.jpg', '', 0.00, 1, 0, 1),
(143, 1, 201, 2, 'Fishtank', 'Fishtank', 'sold', '2013-02-24 19:39:01', 0, 0, 4000, 1052, 1361731596, '<p>Acryl &amp; Edding auf Leinwand von 2013</p>\n', '<p>Acryl &amp; Edding auf Leinwand von 2013</p>\n', 0, '', 'fishtank2.jpg', '3x 30x20x3cm (BxHxT)', 52.96, 1, 0, 1),
(145, 1, 199, 2, 'Hedgehog Island', 'Hedgehog Island', 'forsale', '2013-06-18 19:39:01', 0, 0, 1438, 2000, 1371567481, '<p>Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.</p>\n', '<p>Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.</p>\n', 0, '', 'Hedgehog-Island.jpg', '50x70x3cm (BxHxT)', 80.00, 1, 1, 1),
(144, 2, 200, 8, 'Auriel Light Mark IV', 'Auriel Light Mark IV', 'unsaleable', '2013-05-20 19:39:01', 0, 0, 1500, 2000, 1369070650, '<p>4 Leinwände 1 Lichtobjekt.<br /><br />\nVielen dank an Chris die mich immer wieder Inspiriert hat und die Idee zum Lichtobjekt hatte.</p>\n', '<p>4 canvases 1 light object.<br /><br />\nMany thanks to Chris who inspired me again and again and had the idea for the light object.</p>\n', 0, '', 'auriel_light_mark_iv_new.jpg', '34x90x30cm (BxHxT)', 149.95, 1, 0, 1),
(146, 1, 198, 10, 'Birthday Balloon', 'Birthday Balloon', 'empty', '2013-06-23 19:39:01', 0, 0, 1680, 1260, 1372015255, '<p>Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  &lt;br /&gt;<br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)</p>\n', '<p>Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  &lt;br /&gt;<br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)</p>\n', 1, '', 'birthday-baloon.jpg', '', 0.00, 1, 0, 1),
(147, 1, 197, 2, 'Rebellion Days', 'Rebellion Days', 'forsale', '2013-09-01 19:39:01', 0, 0, 1000, 334, 1378058276, '<p>Acryl auf Leinwand, diesmal mit Ecken und Kanten.  &lt;br /&gt;<br />\nUnd zwar nur Ecken und Kanten</p>\n', '<p>Acryl auf Leinwand, diesmal mit Ecken und Kanten.  &lt;br /&gt;<br />\nUnd zwar nur Ecken und Kanten</p>\n', 0, '', 'rebellion_days_fin2.jpg', '30x90x3cm (BxHxT)', 80.00, 1, 1, 1),
(148, 1, 196, 10, 'Mein Lieblingswagen', 'Mein Lieblingswagen', 'empty', '2013-07-14 19:39:01', 0, 0, 1680, 1260, 1373822966, '<p>Ein Ford Focus der 1ten Generation.  &lt;br /&gt;<br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(</p>\n', '<p>Ein Ford Focus der 1ten Generation.  &lt;br /&gt;<br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(</p>\n', 2, '', 'ford_focus.jpg', '', 0.00, 1, 0, 1),
(149, 1, 195, 10, 'Fette Taube', 'Fette Taube', 'empty', '2013-07-14 19:39:01', 0, 0, 1400, 1050, 1373823466, '<p>Am Neumünsterer Bahnhof ist mir diese adipöse Taube begegnet.<br />\nUnd da hab ich Sie einfach mal Fotografiert.</p>\n', '<p>Am Neumünsterer Bahnhof ist mir diese adipöse Taube begegnet.<br />\nUnd da hab ich Sie einfach mal Fotografiert.</p>\n', 1, NULL, '66b405955a7235d6349fa2d021e18739.jpg', NULL, 0.00, 1, 0, 1),
(150, 1, 194, 10, 'BigBaggy', 'BigBaggy', 'empty', '2013-07-14 19:39:01', 0, 0, 1500, 2000, 1373824000, '<p>Ein Baggy Pants Rock getragen von meiner Schwester.</p>\n', '<p>Ein Baggy Pants Rock getragen von meiner Schwester.</p>\n', 1, '', 'bigbaggy.jpg', '', 0.00, 1, 0, 1),
(151, 1, 193, 10, 'Elke unsharp', 'Elke unsharp', 'empty', '2013-07-14 19:39:01', 0, 0, 1680, 1260, 1373824276, '<p>Unsere Elke im Garten</p>\n', '<p>Unsere Elke im Garten</p>\n', 1, '', 'elke-unsharp.jpg', '', 0.00, 1, 0, 1),
(152, 1, 192, 10, 'Newspaper', 'Newspaper', 'empty', '2013-07-14 19:39:01', 0, 0, 1680, 1260, 1373824357, '<p>Eine Zeitung aus einem etwas anderem Blickwinkel.</p>\n', '<p>Eine Zeitung aus einem etwas anderem Blickwinkel.</p>\n', 1, '', 'newspaper.jpg', '', 0.00, 1, 0, 1),
(153, 1, 191, 10, 'Elke M&uuml;de', 'Elke M&uuml;de', 'empty', '2014-01-05 19:39:01', 0, 0, 1680, 1260, 1388945843, '<p>Man ist schlafen Anstrengend...</p>\n', '<p>Man ist schlafen Anstrengend...</p>\n', 1, '', 'elke_sleepy.jpg', '', 0.00, 1, 0, 1),
(154, 1, 190, 10, 'Bibliothek am Heiligen See', 'Bibliothek am Heiligen See', 'empty', '2014-01-05 19:39:01', 0, 0, 1680, 1260, 1388945992, '<p>Die Alte Bibliothek am Nachmittag</p>\n', '<p>Die Alte Bibliothek am Nachmittag</p>\n', 1, '', 'park.jpg', '', 0.00, 1, 0, 1),
(155, 1, 189, 10, 'Elke Greeneye', 'Elke Greeneye', 'empty', '2014-01-05 19:39:01', 0, 0, 1680, 1260, 1388946100, '<p>Elke unsere Elke mit Blick ins Objektiv.  &lt;br /&gt;<br />\nMan ist das ein Grün...</p>\n', '<p>Elke unsere Elke mit Blick ins Objektiv.  &lt;br /&gt;<br />\nMan ist das ein Grün...</p>\n', 1, '', 'elke_greeneye.jpg', '', 0.00, 1, 0, 1),
(156, 0, 188, 10, 'Impressionen aus dem Bugapark', 'Impressionen aus dem Bugapark', 'empty', '2014-01-05 19:39:01', 0, 0, 0, 0, 1388946196, '<p>Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation</p>\n', '<p>Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation</p>\n', 1, '', 'buga_park.jpg', '', 0.00, 1, 0, 1),
(157, 1, 187, 2, 'Batman Bowling Birds', 'Batman Bowling Birds', 'lost', '2014-01-05 19:39:01', 0, 0, 3740, 1890, 1388946385, '<p>Ein Bild auf Leinwand in Schwarz / Wei&szlig;</p>\n', '<p>Ein Bild auf Leinwand in Schwarz / Wei&szlig;</p>\n', 0, '', 'batman_bowling_birds.jpg', '60x30x3cm (BxHxT)', 80.00, 1, 1, 1),
(158, 1, 186, 8, 'Orange Light 01', 'Orange Light 01', 'givenaway', '2014-02-10 19:39:01', 0, 0, 2244, 1908, 1392058458, '<p>Meine 2te Lampe.  &lt;br /&gt;<br />\nDiesmal mit Orangenem Hintergrund.</p>\n', '<p>Meine 2te Lampe.  &lt;br /&gt;<br />\nDiesmal mit Orangenem Hintergrund.</p>\n', 0, '', 'orange_glows_glowing2.jpg', '44x50x40cm (BxHxT)', 98.25, 1, 0, 1),
(159, 1, 185, 8, 'Groggy 3 Times', 'Groggy 3 Times', 'forsale', '2014-02-10 19:39:01', 0, 0, 1680, 4018, 1392058608, '<p>Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.</p>\n', '<p>Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.</p>\n', 0, '', 'groggy_3times_fin.jpg', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(160, 1, 184, 10, 'Gr&uuml;ne Idylle', 'Gr&uuml;ne Idylle', 'empty', '2014-04-27 19:39:01', 0, 0, 1680, 1260, 1398620032, '<p>Regen kann so schön sein.</p>\n', '<p>Regen kann so schön sein.</p>\n', 1, '', 'wet_leaf.png', '', 0.00, 1, 0, 1),
(161, 1, 183, 10, 'Eastereggs 2014', 'Eastereggs 2014', 'empty', '2014-04-27 19:39:01', 0, 0, 1680, 1260, 1398620118, '<p>Herzlichste Ostergrüße aus dem sonnigem Potsdam.</p>\n', '<p>Herzlichste Ostergrüße aus dem sonnigem Potsdam.</p>\n', 1, '', 'easter_eggs.jpg', '', 0.00, 1, 0, 1),
(162, 1, 182, 8, 'Giraffe Flower', 'Giraffe Flower', 'forsale', '2014-05-08 19:39:01', 0, 0, 1182, 3000, 1399565071, '<p>Eine Grüne Lampe mit schwarzem Blumenornamenten</p>\n', '<p>Eine Grüne Lampe mit schwarzem Blumenornamenten</p>\n', 0, '', 'giraffe-flower.jpg', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(163, 1, 181, 10, 'Klee in wei&szlig;', 'Klee in wei&szlig;', 'empty', '2014-06-11 19:39:01', 0, 0, 1680, 1260, 1402508071, '<p>Eine Blume halb verwelkt</p>\n', '<p>Eine Blume halb verwelkt</p>\n', 1, '', 'fadet_flower.jpg', '', 0.00, 1, 0, 1),
(164, 1, 180, 10, 'Stechpalme', 'Stechpalme', 'empty', '2014-06-11 19:39:01', 0, 0, 1680, 1260, 1402508288, '<p>Eine durchaus imposante Pflanze</p>\n', '<p>Eine durchaus imposante Pflanze</p>\n', 1, '', 'agarve.jpg', '', 0.00, 1, 0, 1),
(165, 1, 179, 10, 'Dinosaurier Auge', 'Dinosaurier Auge', 'empty', '2014-06-11 19:39:01', 0, 0, 1680, 1260, 1402508436, '<p>Dieses Holzstück erinnert mich an einen Dinosaurier</p>\n', '<p>Dieses Holzstück erinnert mich an einen Dinosaurier</p>\n', 1, '', 'dinosaur_eye.jpg', '', 0.00, 1, 0, 1),
(166, 1, 178, 10, 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'empty', '2014-06-11 19:39:01', 0, 0, 1680, 1260, 1402508839, '<p>Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.</p>\n', '<p>Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.</p>\n', 1, '', 'network.jpg', '', 0.00, 1, 0, 1),
(167, 1, 177, 10, 'Klee bei uns im Garten', 'Klee bei uns im Garten', 'empty', '2014-06-12 19:39:01', 0, 0, 1680, 1260, 1402590457, '<p>Gelber Klee</p>\n', '<p>Gelber Klee</p>\n', 1, '', 'unknown02.jpg', '', 0.00, 1, 0, 1),
(168, 1, 172, 3, 'Q', 'Q', 'empty', '2014-06-12 19:39:01', 0, 0, 1680, 1260, 1402592198, '<p>das Q</p>\n', '<p>the Q</p>\n', 1, '', 'Q.JPG', '', 0.00, 1, 0, 1),
(169, 1, 98, 3, 'C', 'C', 'empty', '2014-06-12 19:39:01', 0, 0, 1680, 2240, 1402592268, '<p>das C</p>\n', '<p>the C</p>\n', 1, '', 'C.JPG', '', 0.00, 1, 0, 1),
(170, 1, 96, 3, 'A', 'A', 'empty', '2014-06-12 19:39:01', 0, 0, 1680, 2239, 1402592329, '<p>das A</p>\n', '<p>the A</p>\n', 1, '', 'A_2.jpg', '', 0.00, 1, 0, 1),
(171, 1, 177, 3, 'Y', 'Y', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 1260, 1402665589, '<p>Das Y</p>\n', '<p>the Y</p>\n', 1, '', 'Y.jpg', '', 0.00, 1, 0, 1),
(172, 1, 150, 3, 'H', 'H', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 1260, 1402666864, '<p>Das H</p>\n', '<p>the H</p>\n', 1, '', 'H.JPG', '', 0.00, 1, 0, 1),
(183, 1, 175, 3, 'W', 'W', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 1260, 1402671709, '<p>Das W</p>\n', '<p>the W</p>\n', 1, '', 'W_clear.JPG', '', 0.00, 1, 0, 1),
(174, 1, 171, 9, 'Monstar 01', 'Monstar 01', 'empty', '2014-06-13 19:39:01', 0, 0, 2000, 1500, 1402667472, '<p>Das erste der Monstarz Serie</p>\n', '<p>Das erste der Monstarz Serie</p>\n', 1, '', 'Monster_wall_ashtray.jpg', '', 0.00, 1, 0, 1),
(175, 1, 170, 9, 'Monstar 02', 'Monstar 02', 'empty', '2014-06-13 19:39:01', 0, 0, 2000, 1500, 1402667587, '', '', 1, '', 'bush.jpg', '', 0.00, 1, 0, 1),
(177, 1, 169, 9, 'Monstar 03', 'Monstar 03', 'empty', '2014-06-13 19:39:01', 0, 0, 2000, 1500, 1402667718, '', '', 1, '', 'table.jpg', '', 0.00, 1, 0, 1),
(178, 1, 170, 3, 'M', 'M', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 1260, 1402668308, '<p>Das M</p>\n', '<p>the M</p>\n', 1, '', 'M.JPG', '', 0.00, 1, 0, 1),
(179, 1, 167, 10, 'Am Wegesrand', 'Am Wegesrand', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 2240, 1402669238, '<p>Kleine Details als Makroaufnahme</p>\n', '<p>Kleine Details als Makroaufnahme</p>\n', 1, '', 'garbage.jpg', '', 0.00, 1, 0, 1),
(182, 0, 166, 3, 'J', 'J', 'empty', '2014-06-13 19:39:01', 0, 0, 0, 0, 1402670110, '<p>Das J</p>\n', '<p>the J</p>\n', 1, '', 'J.jpg', '', 0.00, 1, 0, 1),
(184, 1, 97, 3, 'B', 'B', 'empty', '2014-06-13 19:39:01', 0, 0, 1680, 4378, 1402675949, '<p>Das B wie Buddha</p>\n', '<p>B for Buddha</p>\n', 1, '', 'B3.jpg', '', 0.00, 1, 0, 1),
(185, 1, 163, 9, 'Monstar 04', 'Monstar 04', 'empty', '2014-06-14 19:39:01', 0, 0, 1680, 1260, 1402753720, '', '', 1, '', 'P6141594.JPG', '', 0.00, 1, 0, 1),
(186, 1, 162, 9, 'Monstar 05', 'Monstar 05', 'empty', '2014-06-14 19:39:01', 0, 0, 1680, 1260, 1402753762, '<p>Monstar auf der Bank</p>\n', '<p>Monstar auf der Bank</p>\n', 1, '', 'P6141597.JPG', '', 0.00, 1, 0, 1),
(187, 1, 161, 10, 'Am Wegesrand 2', 'Am Wegesrand 2', 'empty', '2014-06-15 19:39:01', 0, 0, 1680, 1260, 1402841110, '<p>Nettes Detail der Pflanze</p>\n', '<p>Nettes Detail der Pflanze</p>\n', 1, '', 'wegesrand2.JPG', '', 0.00, 1, 0, 1),
(188, 1, 160, 10, 'Hairy Plant', 'Hairy Plant', 'empty', '2014-06-15 19:39:01', 0, 0, 1680, 1260, 1402843181, '<p>Spitzwegerich</p>\n', '<p>Spitzwegerich</p>\n', 1, '', 'Hairy_Plant.JPG', '', 0.00, 1, 0, 1),
(189, 1, 159, 10, 'Rinde', 'Rinde', 'empty', '2014-06-15 19:39:01', 0, 0, 1680, 1260, 1402848178, '<p>Eine Baumrinde von nah</p>\n', '<p>Eine Baumrinde von nah</p>\n', 1, '', 'bark.JPG', '', 0.00, 1, 0, 1),
(190, 1, 158, 2, 'Lionel Wall', 'Lionel Wall', 'forsale', '2014-07-19 19:39:01', 0, 0, 2000, 2050, 1405777542, '<p>A tribute to argentinia.</p>\n', '<p>A tribute to argentinia.</p>\n', 0, '', 'lionel_wall.jpg', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(191, 1, 157, 8, 'Link Teabag', 'Link Teabag', 'forsale', '2014-08-22 19:39:01', 0, 0, 876, 2844, 1408731988, '<p>Lila + Pink = Link  &lt;br /&gt;<br />\nNoch ohne Beleuchtung aber gut.</p>\n', '<p>Lila + Pink = Link  &lt;br /&gt;<br />\nNoch ohne Beleuchtung aber gut.</p>\n', 0, '', 'link_teabag.jpg', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(193, 1, 155, 9, 'Monstar 06', 'Monstar 06', 'empty', '2014-08-23 19:39:01', 0, 0, 2000, 1500, 1408815441, '<p>Diesmal Monstar auf Arbeit</p>\n', '<p>Diesmal Monstar auf Arbeit</p>\n', 1, '', 'monstar06.jpg', '', 0.00, 1, 0, 1),
(192, 1, 156, 10, 'Kn&ouml;terich Knospe', 'Kn&ouml;terich Knospe', 'empty', '2014-09-14 19:39:01', 0, 0, 1680, 1260, 1410720647, '<p>An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert</p>\n', '<p>An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert</p>\n', 1, '', 'knoeterich.JPG', '', 0.00, 1, 0, 1),
(194, 1, 154, 9, 'Monstar 07', 'Monstar 07', 'empty', '2014-09-21 19:39:01', 0, 0, 1500, 2000, 1411307901, '<p>Monstar im Badschrank</p>\n', '<p>Monstar im Badschrank</p>\n', 1, '', 'monster_bath.jpg', '', 0.00, 1, 0, 1),
(195, 1, 153, 10, 'Die M&ouml;we', 'Die M&ouml;we', 'empty', '2014-09-28 19:39:01', 0, 0, 1680, 1260, 1411910839, '<p>Eine Prachtvolle Silbermöwe auf einem Strandkorb.</p>\n', '<p>Eine Prachtvolle Silbermöwe auf einem Strandkorb.</p>\n', 1, '', 'Moewe.JPG', '', 0.00, 1, 0, 1),
(196, 1, 152, 5, 'Q3Face', 'Q3Face', 'empty', '2014-10-17 19:39:01', 0, 0, 2560, 1920, 1413574910, '<p>Nach etwas kramen fand ich dieses Bild...</p>\n', '<p>Nach etwas kramen fand ich dieses Bild...</p>\n', 0, '', 'q3face.jpg', '1024x768 Pixel', 0.00, 1, 0, 1),
(197, 1, 151, 2, 'Double Crunch Peanut', 'Double Crunch Peanut', 'forsale', '2014-10-17 19:39:01', 0, 0, 1680, 1677, 1413577218, '<p>Das Bild mit der Erdnuss.... ;)</p>\n', '<p>Das Bild mit der Erdnuss.... ;)</p>\n', 0, '', 'double_crunch_peanut.jpg', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(198, 1, 150, 9, 'Monstar Lennon Wall', 'Monstar Lennon Wall', 'empty', '2014-10-29 19:39:01', 0, 0, 960, 960, 1414605204, '<p>Monstar vor der &quot;John Lennon&quot; Wall in Hongkong.</p>\n', '<p>Monstar vor der &quot;John Lennon&quot; Wall in Hongkong.</p>\n', 4, '', 'IMG_5639.jpeg', '', 0.00, 1, 0, 1),
(199, 1, 149, 9, 'Monstar in the Tram', 'Monstar in the Tram', 'empty', '2014-10-29 19:39:01', 0, 0, 960, 960, 1414605264, '<p>Monstar vor der Skyline Hong-Kongs</p>\n', '<p>Monstar vor der Skyline Hong-Kongs</p>\n', 4, '', 'IMG_5635.jpeg', '', 0.00, 1, 0, 1),
(200, 1, 148, 7, 'Pteranodon', 'Pteranodon', 'givenaway', '2014-10-29 19:39:01', 0, 0, 1680, 898, 1414608180, '<p>Ein Ur-Saurier als Grafik</p>\n', '<p>Ein Ur-Saurier als Grafik</p>\n', 0, '', 'Pteranodon.jpg', '', 0.00, 1, 0, 1),
(202, 1, 176, 3, 'X', 'X', 'empty', '2014-10-30 19:39:01', 0, 0, 2000, 1498, 1414693159, '<p>Schilf am Strand</p>\n', '<p>reeds on the beach</p>\n', 8, '', 'X.jpg', '', 0.00, 1, 0, 1),
(203, 1, 146, 9, 'Freeclimbing Monstar', 'Freeclimbing Monstar', 'empty', '2014-11-18 19:39:01', 0, 0, 2000, 1500, 1416325411, '<p>Ein Monster am Fenster</p>\n', '<p>Ein Monster am Fenster</p>\n', 5, '', 'SAM_1378.JPG', '', 0.00, 1, 0, 1),
(204, 1, 145, 9, 'Monstar on Rails', 'Monstar on Rails', 'empty', '2014-11-18 19:39:01', 0, 0, 2000, 1500, 1416325500, '<p>Ein Monstar im Park</p>\n', '<p>Ein Monstar im Park</p>\n', 5, '', 'SAM_1380.JPG', '', 0.00, 1, 0, 1),
(205, 1, 144, 9, 'Monstar Tabledance', 'Monstar Tabledance', 'empty', '2014-11-18 19:39:01', 0, 0, 2000, 1500, 1416325553, '<p>Ein Monstar auf dem Tisch.</p>\n', '<p>Ein Monstar auf dem Tisch.</p>\n', 5, '', 'SAM_1387.JPG', '', 0.00, 1, 0, 1),
(206, 1, 143, 9, 'Monstar Temple', 'Monstar Temple', 'empty', '2014-11-18 19:39:01', 0, 0, 2000, 1500, 1416325743, '<p>Monstar im Freilufttempel</p>\n', '<p>Monstar im Freilufttempel</p>\n', 5, '', 'SAM_1397.JPG', '', 0.00, 1, 0, 1),
(207, 1, 142, 9, 'Monstar Child', 'Monstar Child', 'empty', '2014-11-18 19:39:01', 0, 0, 2000, 1500, 1416325793, '<p>Ein Kind mit meinem Monstar</p>\n', '<p>Ein Kind mit meinem Monstar</p>\n', 5, '', 'SAM_1394.JPG', '', 0.00, 1, 0, 1),
(209, 1, 174, 3, 'T', 'T', 'empty', '2015-01-18 19:39:01', 0, 0, 1680, 1288, 1421605380, '<p>Das T als Schatten</p>\n', '<p>The T as a shadow</p>\n', 1, '', 'T.jpg', '', 0.00, 1, 0, 1),
(210, 1, 168, 3, 'L', 'L', 'empty', '2015-01-18 19:39:01', 0, 0, 1400, 1167, 1421605708, '<p>Das L</p>\n', '<p>the L</p>\n', 5, NULL, 'f2daf321375010e693cd8643da09bded.jpg', NULL, 0.00, 1, 0, 1),
(211, 1, 171, 3, 'O', 'O', 'empty', '2015-01-31 19:39:01', 0, 0, 1996, 2000, 1422726510, '<p>Das O</p>\n', '<p>the O</p>\n', 1, '', 'o.jpg', '', 0.00, 1, 0, 1),
(212, 1, 138, 10, 'Sundown in Bim&ouml;hlen', 'Sundown in Bim&ouml;hlen', 'empty', '2015-02-27 19:39:01', 0, 0, 1680, 1260, 1425055816, '<p>Ein Sonnenuntergang bei uns im Dorf</p>\n', '<p>Ein Sonnenuntergang bei uns im Dorf</p>\n', 1, '', 'P2272172.JPG', '', 0.00, 1, 0, 1),
(213, 1, 137, 7, 'HorsePower', 'HorsePower', 'givenaway', '2015-03-01 19:39:01', 0, 0, 2000, 1516, 1425219186, '<p>Ein Pferdekopf (war nicht als solches gewollt)  &lt;br /&gt;<br />\nIst aber trotzdem Nett</p>\n', '<p>Ein Pferdekopf (war nicht als solches gewollt)  &lt;br /&gt;<br />\nIst aber trotzdem Nett</p>\n', 0, '', 'HorsePower.jpg', '', 0.00, 1, 0, 1),
(270, 0, 94, 10, 'Raindrop', 'Raindrop', 'empty', '2016-06-16 19:39:01', 0, 0, 0, 0, 1466090206, '<p>Taufrisch aus Rickling</p>\n', '<p>Taufrisch aus Rickling</p>\n', 1, '', 'raindrop.jpg', '', 0.00, 1, 0, 1),
(214, 1, 136, 8, 'Four Seasons', 'Four Seasons', 'forsale', '2015-03-12 19:39:01', 0, 0, 1142, 2000, 1426193204, '<p>Lichtobjekt aus 4 Leinwänden.  &lt;br /&gt;<br />\nJede Leinwand steht für eine Jahreszeit.  &lt;br /&gt;<br />\nFehlt nur noch das Licht... ;)</p>\n', '<p>Lichtobjekt aus 4 Leinwänden.  &lt;br /&gt;<br />\nJede Leinwand steht für eine Jahreszeit.  &lt;br /&gt;<br />\nFehlt nur noch das Licht... ;)</p>\n', 0, '', 'four_seasons.jpg', '30x34x90cm', 220.00, 1, 1, 1),
(215, 1, 135, 7, 'Cockroach', 'Cockroach', 'givenaway', '2015-03-13 19:39:01', 0, 0, 2406, 2904, 1426237021, '<p>Die Kakerlake ... ;)</p>\n', '<p>Die Kakerlake ... ;)</p>\n', 0, '', 'cockroach.jpg', '', 20.00, 1, 0, 1),
(216, 1, 134, 7, 'Killer Instinct', 'Killer Instinct', 'forsale', '2015-03-13 19:39:01', 0, 0, 1650, 2000, 1426237137, '<p>Fineliner Artwork von 2015</p>\n', '<p>Fineliner Artwork von 2015</p>\n', 0, '', 'killer_instinct.jpg', '', 20.00, 1, 1, 1),
(217, 1, 133, 7, 'Elbic Dream', 'Elbic Dream', 'forsale', '2015-03-13 19:39:01', 0, 0, 2000, 1606, 1426237317, '<p>kein Kommentar ;)</p>\n', '<p>kein Kommentar ;)</p>\n', 0, '', 'elbic-dream.jpg', '', 20.00, 1, 1, 1),
(218, 1, 132, 10, 'Osterglocken', 'Osterglocken', 'empty', '2015-03-21 19:39:01', 0, 0, 1680, 1260, 1426939066, '<p>Ein gelbes Osterglöckchen</p>\n', '<p>Ein gelbes Osterglöckchen</p>\n', 1, '', 'yellow_flowers.jpg', '', 0.00, 1, 0, 1),
(219, 1, 131, 2, 'Schimmelreiter 2015', 'Schimmelreiter 2015', 'sold', '2015-04-02 19:39:01', 0, 0, 1680, 1376, 1427990280, '<p>Ein Bild mit vielen Namen...  &lt;br /&gt;<br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015</p>\n', '<p>Ein Bild mit vielen Namen...  &lt;br /&gt;<br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015</p>\n', 0, '', 'schimmelreiter2015.jpg', '50x60x3cm', 80.00, 1, 0, 1),
(220, 1, 130, 10, 'Ostern 2015', 'Ostern 2015', 'empty', '2015-04-06 19:39:01', 0, 0, 1680, 1260, 1428328260, '<p>Ein kleiner Ostergruß von der Ostsee ;)</p>\n', '<p>Ein kleiner Ostergruß von der Ostsee ;)</p>\n', 1, '', 'easter_2015.jpg', '', 0.00, 1, 0, 1),
(221, 1, 129, 10, 'B&uuml;sumer Leuchtturm', 'B&uuml;sumer Leuchtturm', 'empty', '2015-04-06 19:39:01', 0, 0, 1680, 2240, 1428326778, '<p>Der Leuchtturm in Büsum an der windigen Nordsee</p>\n', '<p>Der Leuchtturm in Büsum an der windigen Nordsee</p>\n', 1, '', 'northsea.jpg', '', 0.00, 1, 0, 1),
(222, 1, 128, 10, 'Der Spatz im Hansapark', 'Der Spatz im Hansapark', 'empty', '2015-05-07 19:39:01', 0, 0, 3000, 2250, 1431012252, '<p>ganz schön zutraulig der Kleine.</p>\n', '<p>ganz schön Zutraulig der kleine.</p>\n', 1, '', 'sparrow.JPG', '', 0.00, 1, 0, 1),
(223, 1, 127, 10, 'Dandelion', 'Dandelion', 'empty', '2015-05-19 19:39:01', 0, 0, 1680, 1260, 1432050791, '<p>Ein verblühter Löwenzahn im Neuen Garten in Potsdam.</p>\n', '<p>Ein verblühter Löwenzahn im Neuen Garten in Potsdam.</p>\n', 1, '', 'dandelion.JPG', '', 0.00, 1, 0, 1),
(224, 1, 126, 7, 'Mystic Dragon', 'Mystic Dragon', 'forsale', '2015-06-19 19:39:01', 0, 0, 1680, 1554, 1434731544, '<p>Eins meiner neusten Werke.</p>\n', '<p>Eins meiner neusten Werke.</p>\n', 0, '', 'Mystic-Dragon.jpg', 'A4', 25.00, 1, 1, 1),
(225, 1, 125, 7, 'Kitchen Aid', 'Kitchen Aid', 'forsale', '2015-06-19 19:39:01', 0, 0, 1680, 1043, 1434731670, '<p>Die Tolle Knolle. ;)</p>\n', '<p>Die Tolle Knolle. ;)</p>\n', 0, '', 'kitchen-aid.jpg', '', 20.00, 1, 1, 1),
(226, 1, 124, 7, 'Club Rotation', 'Club Rotation', 'forsale', '2015-07-05 19:39:01', 0, 0, 2000, 1424, 1436075813, '<p>A fineliner Artwork from 2015</p>\n', '<p>A fineliner Artwork from 2015</p>\n', 0, '', 'club-rotation.jpg', 'A4', 20.00, 1, 1, 1),
(227, 1, 167, 3, 'K', 'K', 'empty', '2015-07-05 19:39:01', 0, 0, 1680, 1213, 1436075971, '<p>Das Gurken-K</p>\n', '<p>The cucumber-K</p>\n', 1, '', 'K.jpg', '', 0.00, 1, 0, 1),
(229, 1, 121, 7, 'Friends Letter', 'Friends Letter', 'forsale', '2015-07-18 19:39:01', 0, 0, 2274, 1902, 1437226294, '<p>Das Alphabet im Bild versteckt... ;)</p>\n', '<p>Das Alphabet im Bild versteckt... ;)</p>\n', 0, '', 'friends_letter.jpg', '', 20.00, 1, 1, 1),
(228, 1, 122, 7, 'Mr. Crab', 'Mr. Crab', 'forsale', '2015-07-12 19:39:01', 0, 0, 2082, 1590, 1436707048, '<p>Eine kleine Krabbe</p>\n', '<p>Eine kleine Krabbe</p>\n', 0, '', 'mr_crabs.jpg', '', 17.00, 1, 1, 1),
(230, 1, 120, 8, 'Buttercup', 'Buttercup', 'sold', '2015-08-03 19:39:01', 0, 0, 623, 1919, 1438625547, '<p>Eine neue Lampe mit weißen Linien.........  &lt;br /&gt;<br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  &lt;br /&gt;<br />\nAlso es fehlt noch das Entscheidende Licht.</p>\n', '<p>Eine neue Lampe mit weißen Linien.........  &lt;br /&gt;<br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  &lt;br /&gt;<br />\nAlso es fehlt noch das Entscheidende Licht.</p>\n', 0, '', 'buttercup5.jpg', '29x90x15cm (BxHxT)', 150.00, 1, 0, 1),
(231, 1, 119, 10, 'Orange Green MIX', 'Orange Green MIX', 'empty', '2015-08-04 19:39:01', 0, 0, 1680, 1260, 1438707002, '<p>Eine Blüte von größter Güte im Botanischen Garten in Kiel</p>\n', '<p>Eine Blüte von größter Güte im Botanischen Garten in Kiel</p>\n', 1, '', 'orange-cloud.jpg', '', 0.00, 1, 0, 1),
(232, 1, 118, 5, 'Crazy in love', 'Crazy in love', 'empty', '2015-09-19 19:39:01', 0, 0, 1920, 1080, 1442672097, '<p>Wallpaper von 2015</p>\n', '<p>Wallpaper von 2015</p>\n', 0, '', 'crazy-in-love4.jpg', '1920x1080 Pixel', 0.00, 1, 0, 1),
(243, 1, 117, 7, 'Pontius Pilatus', 'Pontius Pilatus', 'empty', '2015-10-07 19:39:01', 0, 0, 1449, 1920, 1444241923, '<p>Fineliner Pic von 2015</p>\n', '<p>Fineliner Pic von 2015</p>\n', 0, '', 'pontius-pilatus.jpg', '', 0.00, 1, 0, 1),
(244, 1, 116, 5, 'Red Obsession', 'Red Obsession', 'empty', '2015-11-30 19:39:01', 0, 0, 1920, 1080, 1448871172, '<p>Ein neueres Wallpaper von 2015</p>\n', '<p>Ein neueres Wallpaper von 2015</p>\n', 0, '', 'red19.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(245, 1, 115, 13, 'ZIA 01', 'ZIA 01', 'forsale', '2015-12-13 19:39:01', 0, 0, 1919, 1320, 1450036533, '<p>Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  &lt;br /&gt;<br />\nIndex: Crescent Moon, Static, Tipple, Florz</p>\n', '<p>Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  &lt;br /&gt;<br />\nIndex: Crescent Moon, Static, Tipple, Florz</p>\n', 0, '', 'ZIA-01.jpg', 'A4', 15.00, 1, 1, 1),
(246, 1, 114, 10, 'Sunrise in Bim&ouml;hlen', 'Sunrise in Bim&ouml;hlen', 'empty', '2015-12-21 19:39:01', 0, 0, 2000, 1500, 1450688651, '<p>Ein Sonnenaufgang im Dezember bei uns in Bimöhlen</p>\n', '<p>Ein Sonnenaufgang im Dezember bei uns in Bimöhlen</p>\n', 1, '', 'sonnenaufgang.jpg', '', 0.00, 1, 0, 1),
(247, 2, 113, 13, 'ZIA 02', 'ZIA 02', 'forsale', '2016-01-07 19:39:01', 0, 0, 1919, 1405, 1452192718, '<p>Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  &lt;br /&gt;<br />\nIndex: Poke Root, Hollibaugh, Msst, Zander</p>\n', '<p>Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  &lt;br /&gt;<br />\nIndex: Poke Root, Hollibaugh, Msst, Zander</p>\n', 0, '', 'ZIA-02.jpg', '', 15.00, 1, 1, 1),
(248, 1, 112, 13, 'ZIA 03', 'ZIA 03', 'forsale', '2016-01-07 19:39:01', 0, 0, 1919, 1346, 1452192761, '<p>Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  &lt;br /&gt;<br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox</p>\n', '<p>Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  &lt;br /&gt;<br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox</p>\n', 0, '', 'ZIA-03_2.jpg', '', 15.00, 1, 1, 1),
(249, 1, 111, 6, 'Crusty King', 'Crusty King', 'forsale', '2016-01-15 19:39:01', 0, 0, 1920, 1773, 1452863539, '<p>Filzstift auf einer Runden Leinwand-Pappe</p>\n', '<p>Filzstift auf einer Runden Leinwand-Pappe</p>\n', 0, '', 'Crusty-King-2.jpg', '', 22.00, 1, 1, 1),
(250, 1, 110, 13, 'ZIA 04', 'ZIA 04', 'forsale', '2016-01-21 19:39:01', 0, 0, 1919, 1398, 1453403531, '<p>Mein 4tes Zentangle Inspired Art Bild  &lt;br /&gt;<br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas</p>\n', '<p>Mein 4tes Zentangle Inspired Art Bild  &lt;br /&gt;<br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas</p>\n', 0, '', 'ZIA-04.jpg', '', 15.00, 1, 1, 1),
(251, 1, 109, 13, 'ZIA 05', 'ZIA 05', 'forsale', '2016-02-05 19:39:01', 0, 0, 1919, 1210, 1454687577, '<p>Zentangle Inspired Postcard 01  &lt;br /&gt;<br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,</p>\n', '<p>Zentangle Inspired Postcard 01  &lt;br /&gt;<br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,</p>\n', 0, '', 'ZIA-05.jpg', '10x15cm', 15.00, 1, 1, 1),
(252, 1, 108, 13, 'ZIA 06', 'ZIA 06', 'forsale', '2016-02-05 19:39:01', 0, 0, 1920, 1266, 1454687630, '<p>Zentangle Inspired Postcard 02  &lt;br /&gt;<br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,</p>\n', '<p>Zentangle Inspired Postcard 02  &lt;br /&gt;<br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,</p>\n', 0, '', 'ZIA-06.jpg', '10x15cm', 15.00, 1, 1, 1),
(253, 1, 107, 13, 'ZIA 07', 'ZIA 07', 'forsale', '2016-02-19 19:39:01', 0, 0, 1919, 1396, 1455888058, '<p>Printed Zentangle im Paspartout.  &lt;br /&gt;<br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling</p>\n', '<p>Printed Zentangle im Paspartout.  &lt;br /&gt;<br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling</p>\n', 0, '', 'ZIA-07.jpg', 'A5', 15.00, 1, 1, 1),
(254, 1, 106, 13, 'ZIA 08', 'ZIA 08', 'forsale', '2016-02-26 19:39:01', 0, 0, 1920, 1296, 1456509930, '<p>Zentangle Inspired Postcard No.3.  &lt;br /&gt;<br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon</p>\n', '<p>Zentangle Inspired Postcard No.3.  &lt;br /&gt;<br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon</p>\n', 0, '', 'ZIA-08.jpg', '', 15.00, 1, 1, 1);
INSERT INTO `images` (`id`, `pub`, `position`, `image_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `category_id`, `type_id`, `img_x`, `img_y`, `chg_date`, `message`, `message_en`, `camera_id`, `link`, `image_path`, `Format`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(255, 1, 105, 13, 'ZIA 09', 'ZIA 09', 'forsale', '2016-02-26 19:39:01', 0, 0, 1920, 1365, 1456510004, '<p>Zentangle Inspired Postcard No. 4.  &lt;br /&gt;<br />\nIndex: Hollibaugh, Fracas &quot;Reverse&quot;, W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz</p>\n', '<p>Zentangle Inspired Postcard No. 4.  &lt;br /&gt;<br />\nIndex: Hollibaugh, Fracas &quot;Reverse&quot;, W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz</p>\n', 0, '', 'ZIA-09.jpg', '', 15.00, 1, 1, 1),
(256, 1, 104, 6, 'RIP MUM', 'RIP MUM', 'empty', '2016-03-19 19:39:01', 0, 0, 1920, 1296, 1458402396, '<p>Rest in Peace Mum</p>\n', '<p>Rest in Peace Mum</p>\n', 0, '', 'RIP_MUM.jpg', 'A3', 0.00, 1, 0, 1),
(257, 1, 103, 6, 'Guilty Conscience', 'Guilty Conscience', 'forsale', '2016-03-19 19:39:01', 0, 0, 1919, 1347, 1458402472, '<p>Der Drachen der Drachen der Drachen der Drachen</p>\n', '<p>Der Drachen der Drachen der Drachen der Drachen</p>\n', 0, '', 'Guilty-Conscience.jpg', 'A3', 22.00, 1, 1, 1),
(258, 1, 102, 7, 'Butterfly Prison', 'Butterfly Prison', 'empty', '2016-03-19 19:39:01', 0, 0, 1919, 1364, 1458409564, '<p>Ein Schmetterling im Gefängnis in Postkartengröße</p>\n', '<p>Ein Schmetterling im Gefängnis in Postkartengröße</p>\n', 0, '', 'prison-butterfly.jpg', 'A6', 0.00, 1, 0, 1),
(259, 1, 101, 7, 'Sitting Bull', 'Sitting Bull', 'empty', '2016-03-31 19:39:01', 0, 0, 2000, 1421, 1459437576, '<p>Eine Postkarte im Indian Asario Style :)</p>\n', '<p>Eine Postkarte im Indian Asario Style :)</p>\n', 0, '', 'sitting_bull.jpg', 'A6', 0.00, 1, 0, 1),
(261, 1, 100, 5, 'asario.de', 'asario.de', 'empty', '2016-05-12 19:39:01', 0, 0, 1680, 1050, 1463078097, '<p>Das Wallpaper zur Domain www.asario.de</p>\n', '<p>Das Wallpaper zur Domain www.asario.de</p>\n', 0, '', 'ab_bluf.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(262, 1, 99, 2, 'Wandering Star', 'Wandering Star', 'givenaway', '2016-05-13 19:39:01', 0, 0, 1984, 2000, 1463155693, '<p>Der wandernde Stern in 3D</p>\n', '<p>Der wandernde Stern in 3D</p>\n', 0, '', 'wandering-star.jpg', '12x12cm', 0.00, 1, 0, 1),
(265, 0, 169, 3, 'L', 'L', 'empty', '2016-05-15 19:39:01', 0, 0, 832, 744, 1463306557, '<p>Das L</p>\n', '<p>the L</p>\n', 1, '', 'L.jpg', '', 0.00, 1, 0, 1),
(266, 1, 97, 10, 'BeachBall', 'BeachBall', 'empty', '2016-06-06 19:39:01', 0, 0, 2000, 1500, 1465199404, '<p>Ein Strandbild</p>\n', '<p>Ein Strandbild</p>\n', 1, '', 'beach_feeling.jpg', '', 0.00, 1, 0, 1),
(267, 1, 96, 5, 'Sunshine Feelings', 'Sunshine Feelings', 'empty', '2016-06-06 19:39:01', 0, 0, 2500, 1406, 1465199502, '<p>Eine Collage von 2016</p>\n', '<p>Eine Collage von 2016</p>\n', 0, '', 'sunshine.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(268, 1, 95, 10, 'Dune Wonder', 'Dune Wonder', 'empty', '2016-06-06 19:39:01', 0, 0, 2000, 1500, 1465203250, '<p>Eine Düne an der Ostsee.</p>\n', '<p>Eine Düne an der Ostsee.</p>\n', 1, '', 'dune.jpg', '', 0.00, 1, 0, 1),
(271, 1, 93, 8, 'Blue Cage', 'Blue Cage', 'forsale', '2016-06-24 19:39:01', 0, 0, 1072, 3000, 1466777579, '<p>Mal wieder eine Lampe Ohne Licht (noch)</p>\n', '<p>Mal wieder eine Lampe Ohne Licht (noch)</p>\n', 0, '', 'Blue-Cage.jpg', '29x90x15cm (BxHxT)', 150.00, 1, 1, 1),
(272, 1, 92, 4, 'Mighty Crab', 'Mighty Crab', 'forsale', '2016-07-17 19:39:01', 0, 0, 2241, 1908, 1468761406, '<p>Dieses Motiv ist aus dem Buch &quot;Zen Colouring Ocean&quot;.  &lt;br /&gt;<br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.</p>\n', '<p>Dieses Motiv ist aus dem Buch &quot;Zen Colouring Ocean&quot;.  &lt;br /&gt;<br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.</p>\n', 0, '', 'Mighty-Crab.jpg', 'A4', 20.00, 1, 1, 1),
(273, 1, 91, 4, 'Fishy Fishy', 'Fishy Fishy', 'forsale', '2016-08-18 19:39:01', 0, 0, 3020, 3208, 1471543985, '<p>Ein Großer Fisch im Netz ;)  &lt;br /&gt;<br />\nAus dem Buch &quot;Zen Colouring Ocean&quot;.</p>\n', '<p>Ein Großer Fisch im Netz ;)  &lt;br /&gt;<br />\nAus dem Buch &quot;Zen Colouring Ocean&quot;.</p>\n', 0, '', 'fishy-fishy.jpg', '', 20.00, 1, 1, 1),
(274, 0, 90, 10, 'Sunrise on Angelteich ;)', 'Sunrise on Angelteich ;)', 'empty', '2016-08-27 19:39:01', 0, 0, 2000, 1500, 1472307094, '<p>Stimmiges Bild vom Angelteich in Wittenborn</p>\n', '<p>Stimmiges Bild vom Angelteich in Wittenborn</p>\n', 1, '', 'Sonenaufgang-am-See.jpg', '', 0.00, 1, 0, 1),
(275, 1, 89, 7, 'Useless Bag', 'Useless Bag', 'givenaway', '2016-10-12 19:39:01', 0, 0, 1000, 1256, 1476290809, '<p>Ein älteres Bild was ich vor kurzem erst gefunden habe.  &lt;br /&gt;<br />\nLag ganz unten in der Kiste ;)</p>\n', '<p>Ein Älteres Bild was ich vor kurzem erst gefunden habe.  &lt;br /&gt;<br />\nLag ganz unten in der Kiste ;)</p>\n', 0, '', 'useless-bag.jpg', '', 0.00, 1, 0, 1),
(276, 1, 88, 4, 'Circle Ornament', 'Circle Ornament', 'forsale', '2016-10-14 19:39:01', 0, 0, 2944, 3018, 1476457436, '<p>Ein Motiv aus dem Buch &quot;Hypnose und Trance&quot; ausgemalt mit Stabilos.  &lt;br /&gt;<br />\nDie Kunst ist das man nicht Verrückt wird dabei,</p>\n', '<p>Ein Motiv aus dem Buch &quot;Hypnose und Trance&quot; ausgemalt mit Stabilos.  &lt;br /&gt;<br />\nDie Kunst ist das man nicht Verrückt wird dabei,</p>\n', 6, '', 'ornament.jpg', '', 30.00, 1, 1, 1),
(277, 1, 87, 4, 'Jellyfish', 'Jellyfish', 'forsale', '2017-02-09 19:39:01', 0, 0, 2922, 3000, 1486666841, '<p>Aus dem Buch &quot;Hypnose &amp; Trance&quot;</p>\n', '<p>Aus dem Buch &quot;Hypnose &amp; Trance&quot;</p>\n', 0, '', 'jelly_fish.jpg', '', 20.00, 1, 1, 1),
(278, 1, 86, 2, 'Buttermilk Diver', 'Buttermilk Diver', 'forsale', '2017-02-16 19:39:01', 0, 0, 2724, 2736, 1487261241, '<p>Schwarzes Acryl auf weißer Leinwand.</p>\n', '<p>Schwarzes Acryl auf weißer Leinwand.</p>\n', 0, '', 'buttermilk-diver.jpg', '', 80.00, 1, 1, 1),
(279, 1, 85, 6, 'Hells Kitchen', 'Hells Kitchen', 'forsale', '2017-03-02 19:39:01', 0, 0, 2850, 3996, 1488484898, '<p>Der Teufel in uns ;).</p>\n', '<p>Der Teufel in uns ;).</p>\n', 0, '', 'devils_kitchen.jpg', 'A3', 22.00, 1, 1, 1),
(280, 1, 84, 10, 'Vom Fernsehturm in Berlin - Gastbild', 'From television tower in Berlin - Guestimage', 'empty', '2017-05-23 19:39:01', 0, 0, 2000, 1500, 1495556271, '<p>Dieses nette Bild hat meine Schwester geschossen.  &lt;br /&gt;<br />\nEin Panorama vom Berliner Fernsehturm am Alex.</p>\n', '<p>This nice shot was made by my Sister.  &lt;br /&gt;<br />\nA panorama from Television Tower at the Alex in Berlin.</p>\n', 6, '', 'DSCF5931[1].jpg', '', 0.00, 1, 0, 1),
(281, 2, 83, 12, 'Mederius Aschenbecher[0]', 'Mederius Ashtray[0]', 'empty', '2017-05-28 19:39:01', 0, 0, 3408, 2208, 1692888560, '<p>Hier ein erster Entwurf des Mederius Aschenbechers.<br /><br />\nJetzt endlich in glasierter Form.<br /><br />\nIst erst der erste Grobentwurf</p>\n', '<p>The first draft of the Mederius Ashtray.<br /><br />\nNow it\'s glazed and fired.<br /><br />\nIt\'s just a concept of proof.</p>\n', 7, '', 'mederius_ashtray[0].jpg', '', 15.00, 1, 0, 1),
(283, 1, 82, 4, 'Womenizer', 'Womenizer', 'empty', '2017-07-09 19:39:01', 0, 0, 1862, 2000, 1692886897, '<p>Frauen an die Macht ;)<br /><br />\nAus dem Buch &quot;Hypnose &amp; Trance&quot;</p>\n', '<p>Womenpower ;)<br /><br />\nOut of the Book &quot;Hypnose &amp; Trance&quot;</p>\n', 0, '', 'womenizer.jpg', '17,5x17,5cm', 0.00, 1, 0, 1),
(284, 1, 81, 9, 'Monster in Neu Seeland', 'Monstar in New Zealand', 'empty', '2017-09-17 19:39:01', 0, 0, 2000, 1500, 1505645646, '<p>Mein Monster im Süden</p>\n', '<p>My Monstar in the South</p>\n', 6, '', 'monstar_newzealand.JPG', '', 0.00, 1, 0, 1),
(285, 0, 80, 12, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', '2017-10-08 19:39:01', 0, 0, 0, 0, 1507474862, '<p>Ungebrannt und Unglasiert</p>\n', '<p>Unglazed &amp; Unfired</p>\n', 0, '', 'ashtray[1].jpg', '', 0.00, 1, 0, 1),
(286, 1, 79, 12, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', '2017-10-24 19:39:01', 0, 0, 7680, 2850, 1692888409, '<p>Jetzt Aber...</p>\n', '<p>Here we go...</p>\n', 7, '', 'mederius_ashtray[1]_3.jpg', '', 25.00, 1, 1, 1),
(287, 1, 78, 9, 'Strand-Monstar', 'Beach-Monstar', 'empty', '2018-01-22 19:39:01', 0, 0, 2000, 1500, 1516637602, '<p>Monstar am Strand.</p>\n', '<p>Monstar at the beach.</p>\n', 6, '', 'beach-monstar.jpg', '', 0.00, 1, 0, 1),
(288, 1, 77, 9, 'Stein-Monstar', 'Stone-Monstar', 'empty', '2018-01-22 19:39:01', 0, 0, 2000, 1500, 1516637714, '<p>Monstar auf einem Felsen.</p>\n', '<p>Monstar on the rocks</p>\n', 6, '', 'stone-monstar.jpg', '', 0.00, 1, 0, 1),
(289, 1, 76, 9, 'Baxter &plus; Monstar', 'Baxter &plus; Monstar', 'empty', '2018-01-22 19:39:01', 0, 0, 2000, 1500, 1516637851, '<p>Baxter spielend mit dem Monstar</p>\n', '<p>Baxter playing with monstar</p>\n', 6, '', 'dog-star.jpg', '', 0.00, 1, 0, 1),
(290, 1, 75, 10, 'Ianosaurus & Masha - Gastbild', 'Ianosaurus & Masha - Guestimage', 'empty', '2018-01-22 19:39:01', 0, 0, 2000, 1500, 1516644415, '<p>Ianosaurus mit Masha</p>\n', '<p>Ianosaurus with Masha</p>\n', 6, '', 'DSCF7990[1].jpg', '', 0.00, 1, 0, 1),
(291, 1, 74, 10, 'Masha ist zur&uuml;ck', 'Masha is Back', 'empty', '2018-04-02 19:39:01', 0, 0, 3000, 2250, 1522677772, '<p>Mascha im Park.</p>\n', '<p>Masha in the park.</p>\n', 7, '', 'P1000148.JPG', '', 0.00, 1, 0, 1),
(292, 1, 73, 10, 'Balafon aus Afrika', 'Balafon from Africa', 'empty', '2018-04-02 19:39:01', 0, 0, 3000, 2250, 1522679859, '<p>Ein traditionelles afrikanisches Instrument</p>\n', '<p>A traditional African Instrument</p>\n', 7, '', 'P1000098.JPG', '', 0.00, 1, 0, 1),
(293, 1, 72, 10, 'Masha in the Face', 'Masha in the Face', 'empty', '2018-04-02 19:39:01', 0, 0, 3000, 2250, 1522680379, '<p>Masha in nah</p>\n', '<p>Masha zoomed in</p>\n', 7, '', 'P1000161.JPG', '', 0.00, 1, 0, 1),
(294, 1, 71, 5, 'Mixed Mash', 'Mixed Mash', 'empty', '2018-04-15 19:39:01', 0, 0, 3840, 2880, 1523785721, '<p>Eine Collage am Hamburger ZOB</p>\n', '<p>A collage from ZOB in Hamburg</p>\n', 0, '', 'mixed-mash.jpg', '1680x1050 Pixel', 0.00, 1, 0, 1),
(295, 1, 70, 2, 'Window Shopper', 'Window Shopper', 'forsale', '2018-04-19 19:39:01', 0, 0, 2382, 2400, 1524154537, '<p>Ein Acryl Kunstwerk</p>\n', '<p>A Acrylic Artwork</p>\n', 0, '', 'window-shopper.jpg', '50x50cm', 80.00, 1, 1, 1),
(297, 1, 69, 2, 'Blue Marswallow', 'Blue Marswallow', 'givenaway', '2018-06-30 19:39:01', 0, 0, 2916, 2136, 1530357177, '<p>Das Geschenk zur Hochzeit meiner Schwester</p>\n', '<p>The Wedding Gift for my Sister.</p>\n', 0, '', 'blue-marswallow.jpg', '70x50cm', 0.00, 1, 0, 1),
(298, 1, 68, 10, 'Wetterhahn', 'Weathercock', 'empty', '2018-08-09 19:39:01', 0, 0, 2800, 2100, 1533847116, '<p>Ein Wetterhahn im Abendhimmel</p>\n', '<p>A Weathercock in evening sky</p>\n', 7, '', 'sundown_cock.jpg', '', 0.00, 1, 0, 1),
(299, 1, 67, 10, 'Libelle am Fenster', 'Dragonfly on window', 'empty', '2018-08-09 19:39:01', 0, 0, 2800, 2100, 1533847358, '<p>Hier eine verirrte Libelle in unserem Feriendomizil</p>\n', '<p>A dragonfly in our holiday home</p>\n', 7, '', 'dragonfly.jpg', '', 0.00, 1, 0, 1),
(300, 1, 66, 9, 'Baxter am spielen mit dem Monstar', 'Baxter playing with the Monstar', 'empty', '2018-08-12 19:39:01', 0, 0, 1500, 2000, 1534065638, '<p>Baxter auf einem Felsen spielend mit dem Monstar.</p>\n', '<p>Baxter is playing with the monstar on the beach at New Zealand.</p>\n', 9, '', 'baxter_playing.JPG', '', 0.00, 1, 0, 1),
(302, 1, 65, 4, 'Italia', 'Italia', 'forsale', '2018-08-25 19:39:01', 0, 0, 2312, 2320, 1535209071, '<p>Aus dem Buch &quot;Dream Journey - Ausmalreise um die Welt&quot;.</p>\n', '<p>Out of the book &quot;Dream Journey - Ausmalreise um die Welt&quot;.</p>\n', 6, '', 'italia4.jpg', '20x20cm (BxH)', 30.00, 1, 1, 1),
(303, 1, 64, 9, 'Nitro   Monstar', 'Nitro   Monstar', 'empty', '2018-09-14 19:39:01', 0, 0, 1500, 2000, 1536935164, '<p>Nitro mit Monstar im Dänemark Urlaub</p>\n', '<p>Nitro and Monstar on a trip through Denmark.</p>\n', 10, '', 'Monstar-Nitro.jpg', '', 0.00, 1, 0, 1),
(304, 1, 63, 9, 'W&uuml;sten Operation', 'Desert Operations', 'empty', '2018-09-14 19:39:01', 0, 0, 2000, 1500, 1536935729, '<p>Nein, nicht in der Wüste, sondern am Strand</p>\n', '<p>No, not in desert, but on the beach.</p>\n', 10, '', 'Monstar-Sandwirbel.jpg', '', 0.00, 1, 0, 1),
(305, 1, 62, 9, 'Monstar Schild', 'Monstar Traffic Sign', 'empty', '2018-09-14 19:39:01', 0, 0, 2000, 1500, 1536947559, '<p>Mein Monstar an nem Schild</p>\n', '<p>My Monstar on a traffic sign</p>\n', 10, '', 'Monstar-Schild.jpg', '', 0.00, 1, 0, 1),
(306, 1, 61, 9, 'Rettungsring', 'Lifebelt', 'empty', '2018-09-14 19:39:01', 0, 0, 1500, 2000, 1536947792, '<p>Rettungsring Monstar</p>\n', '<p>Lifebelt Monstar</p>\n', 10, '', 'Monstar-Rettungsring.jpg', '', 0.00, 1, 0, 1),
(307, 1, 60, 4, 'Waldschrat', 'Wood Gnome', 'sold', '2018-10-27 19:39:01', 0, 0, 1602, 2463, 1540633852, '<p>Ein Ausmalbild mit Acrylfarbe ausgemalt mit Lederbandaufhängung.  &lt;br /&gt;<br />\nVielen Dank an Sigi für die Hilfe &amp; Geduld mit mir.  &lt;br /&gt;<br />\nAus dem Buch Mythomorphia von Kerby Rosanes.</p>\n', '<p>A colored pic colored with acrylic Colors on leather straps.  &lt;br /&gt;<br />\nLot of thanks to Sigi, who helped me with a lot of things.  &lt;br /&gt;<br />\nOut of the book Mythomorphia from Kerby Rosanes.</p>\n', 6, '', 'waldschrat_12.jpg', '29x29 cm', 0.00, 1, 0, 1),
(308, 1, 59, 10, 'Wintersegeberg', 'Wintersegeberg', 'empty', '2019-01-25 19:39:01', 0, 0, 3000, 2250, 1548432384, '<p>Ein Bild aus dem verschneitem Bad Segeberg</p>\n', '<p>An image from the snowily Bad Segeberg</p>\n', 7, '', 'P1010666.JPG', '', 0.00, 1, 0, 1),
(309, 1, 58, 2, 'Anubis', 'Anubis', 'forsale', '2019-02-07 19:39:01', 0, 0, 2652, 2718, 1549556220, '<p>Eine Bild des ägyptischen Gottes Anubis. Er ist in detaillierter, traditioneller Rüstung mit farbenfrohen Mustern dargestellt.</p><p>Vielen Dank an Siggi.</p>\n', '<p>An image of the Egyptian god Anubis. He is depicted in detailed, traditional armor with colourful patterns.</p><p>Many thanks to Siggi.</p>\n', 0, '', 'Anubis24.jpg', '60x60cm', 280.00, 1, 0, 1),
(310, 1, 57, 10, 'Wasserball', 'Waterpolo', 'empty', '2019-08-02 19:39:01', 1, 1, 1400, 1050, 1552725880, '<p>Bild vom Wasserballspiel zwischen OSC Potsdam und SSV Esslingen.&lt;br&gt;<br />\nIch war live dabei als Potsdam Esslingen mit 18:7 besiegte.</p>\n', '<p>Image of the Waterpolo game betwen OSC Potsdam &amp; SSV Esslingen.  &lt;br&gt;<br />\nI was live there when Potsdam beated Esslingen with 18:7.</p>\n', 7, NULL, '/5cfe201b7c02c6a972c599d99b017753.jpg', NULL, 0.00, 1, 0, 1),
(311, 1, 56, 5, 'Little Alfred', 'Little Alfred', 'empty', '2019-04-06 19:39:01', 0, 0, 2560, 1440, 1554564146, '<p>Mein erstes Wallpaper 2019.  &lt;br /&gt;<br />\nIm Hintergrund Klein Alfred  &lt;br /&gt;<br />\nJetzt in WQHD Auflösung</p>\n', '<p>My first Wallpaper in 2019.  &lt;br /&gt;<br />\nIn the Background little Alfred.  &lt;br /&gt;<br />\nNow in WQHD Resolution</p>\n', 0, '', 'little-alfred.jpg', '2560x1440 Pixel', 0.00, 1, 0, 1),
(312, 1, 55, 2, 'Bastet', 'Bastet', 'inwork', '2019-08-03 19:39:01', 0, 0, 2357, 4320, 1564829730, '<p>Eine Weitere Ägyptische Göttin hat sich in die Acryl Galerie geschlichen.  &lt;br /&gt;<br />\nDie ersten Vorarbeiten sind gemacht, ist aber noch im Pre-Alpha Modus.</p>\n', '<p>Another Goddess has arrived the Acrylic Gallery.  &lt;br /&gt;<br />\nIt\'s just a Pre-Alpha Version of Bastet.</p>\n', 0, '', 'bastet15.jpg', '50x90 cm', 380.00, 1, 0, 1),
(313, 1, 54, 2, 'Das Rangi Schweini', 'The Rangi Pig', 'givenaway', '2019-09-02 19:39:01', 0, 0, 940, 783, 1567435136, '<p>Anlässlich der Geburt meines Neffen Alfred, habe ich dieses Schweini Bild gemalt.  &lt;br /&gt;<br />\nThx to Fenja.</p>\n', '<p>To celebrate the birth of my nephew i made this picture.  &lt;br /&gt;<br />\nThx to Fenja.</p>\n', 0, '', 'schweini-finished.jpg', '29x20 cm', 0.00, 1, 0, 1),
(314, 1, 53, 5, 'Anubis Wallpaper', 'Anubis Wallpaper', 'empty', '2019-09-07 19:39:01', 0, 0, 2560, 1440, 1567860535, '<p>Eine kleine Collage mit Anubis</p>\n', '<p>A small collage with Anubis</p>\n', 0, '', 'anubus_wallpaper_png.png', '2560x1440 Pixel', 0.00, 1, 0, 1),
(315, 1, 52, 7, 'GRTZ FR NZ', 'GRTZ FR NZ', 'empty', '2020-01-31 19:39:01', 0, 0, 3636, 2556, 1580425200, '<p>Eine Postkarte die um die Welt ging....</p>\n', '<p>A Postcard all over the world...</p>\n', 0, '', 'GRTZ-NZ.jpg', '', 0.00, 1, 0, 1),
(316, 1, 51, 2, 'Rangi Goat', 'Rangi Goat', 'givenaway', '2020-01-10 19:39:01', 0, 0, 3243, 2589, 1578610800, '<p>Eine Ziege zu Alfies Geburtstag am 11.5.</p>\n', '<p>A goat to Alfies Birthday at 11.5.</p>\n', 0, '', 'goat04.jpg', '', 0.00, 1, 0, 1),
(317, 1, 50, 2, 'Tigah', 'Tigah', 'givenaway', '2020-02-16 19:39:01', 0, 0, 728, 546, 1581843240, '<p>Ein Tiger, wie man unscheinbar erkennen kann</p>\n', '<p>A Tiger, as you can see</p>\n', 7, '', 'tigah05.jpg', '', 80.00, 1, 1, 1),
(318, 1, 49, 7, 'Red Tiger', 'Red Tiger', 'empty', '2020-08-16 19:39:01', 0, 0, 3902, 1887, 1597578758, '<p>Ein neues Fineliner Artwork von 2020</p>\n', '<p>A new fineliner artwork from 2020</p>\n', 0, '', 'red-tiger.jpg', '', 0.00, 1, 0, 1),
(319, 1, 48, 7, 'Crop Drop', 'Crop Drop', 'empty', '2020-08-16 19:39:01', 0, 0, 2574, 2457, 1597578758, '<p>Mein neuestes Fineliner-Bild überhaupt</p>\n', '<p>My newest fineliner pic at all</p>\n', 0, '', 'crop-drop.jpg', '', 0.00, 1, 0, 1),
(321, 2, 46, 7, 'Bumble Bee', 'Bumble Bee', 'forsale', '2021-10-09 19:39:01', 0, 0, 615, 707, 1633790713, '', '', 11, '', 'Bumble-Bee.jpg', 'A4', 20.00, 1, 1, 1),
(322, 2, 45, 7, 'Dialogue-II', 'Dialogue-II', 'empty', '2021-10-09 19:39:01', 0, 0, 645, 626, 1633791612, '', '', 11, '', 'Dialoge-II.jpg', '', 0.00, 1, 0, 1),
(323, 1, 44, 7, 'Ill-Easy', 'Ill-Easy', 'forsale', '2021-10-09 19:39:01', 0, 0, 548, 648, 1633791849, '', '', 11, '', 'Ill-Easy.jpg', '', 20.00, 1, 1, 1),
(324, 1, 43, 7, 'Lost World', 'Lost World', 'empty', '2021-10-09 19:39:01', 0, 0, 1079, 486, 1633792076, '', '', 11, '', 'lost-world.jpg', '', 20.00, 1, 1, 1),
(325, 1, 42, 7, 'Notorious Small', 'Notorious Small', 'empty', '2021-10-09 19:39:01', 0, 0, 1121, 594, 1633792349, '', '', 11, '', 'Notorius-Small.jpg', '', 0.00, 1, 0, 1),
(326, 1, 41, 7, 'Operated Bullseye', 'Operated Bullseye', 'empty', '2021-10-09 19:39:01', 0, 0, 1103, 600, 1633792563, '', '', 11, '', 'Operated-Bullseye.jpg', '', 0.00, 1, 0, 1),
(327, 1, 40, 7, 'Selfaction', 'Selfaction', 'forsale', '2021-10-09 19:39:01', 0, 0, 591, 746, 1633792764, '', '', 11, '', 'Selfactions.jpg', '', 20.00, 1, 1, 1),
(328, 1, 39, 7, 'Trio Del', 'Trio Del', 'givenaway', '2021-10-09 19:39:01', 0, 0, 4032, 952, 1633793056, '', '', 11, '', 'trio-del.jpg', '', 0.00, 1, 0, 1),
(329, 1, 38, 2, 'El Novum', 'EL Novum', 'sold', '2021-12-25 19:39:01', 0, 0, 7680, 3376, 1659105444, '<p>Neun schmale, vertikale Leinwände mit Mustern in Orange, Rot und Schwarz. Die abstrakten, tribalartigen Muster bestehen aus geometrischen Formen, die sich über die einzelnen Leinwände hinweg fortsetzen.</p>\n', '<p>Nine narrow, vertical canvases with patterns in orange, red and black. The abstract, tribal-like patterns consist of geometric shapes that continue across the individual canvases.</p>\n', 7, '', 'El_Novum_Finiished.jpg', '9x 80cm x 20cm', 525.25, 1, 1, 1),
(333, 1, 35, 6, 'Alfies Traktor', 'Alfies Tractor', 'givenaway', '2023-11-08 19:39:01', 0, 0, 603, 596, 1692887867, '<p>Pünktlich zu Weihnachten habe ich meinem Neffen ein Geschenk gemacht.<br /><br />\nDa er voll auf Träcker steht habe ich dieses Bild auf Leinwand verewigt.</p><p>Es ist mit Filzern gemalt.</p>\n', '<p>Just in time for Christmas, I made a present for my nephew.<br /><br />\nSince he is really loving Tractors, I immortalised this picture on canvas.</p><p>It is painted with felt-tip-pens.</p>\n', 11, NULL, 'tractor_cut.jpg', NULL, 0.00, 1, 0, 1),
(330, 1, 37, 7, 'Cloud Founder', 'Cloud Founder', 'empty', '2021-12-26 19:39:01', 0, 0, 3660, 2400, 1640503258, '<p>Ein Geschenk an meine Lieblingscousine.</p>\n', '<p>A gift to my favorite cousin.</p>\n', 11, '', 'cloud-founder.jpg', '', 0.00, 1, 0, 1),
(335, 2, 34, 7, 'Jena Tower', 'Jena Tower', 'givenaway', '2022-03-28 19:39:01', 0, 0, 604, 875, 1648475469, '<p>Ein A4 Artwork in Grün.</p>\n', '<p>An A4 artwork in green.</p>\n', 11, '', 'jena tower.png', 'A4', 0.00, 1, 0, 1),
(336, 2, 33, 7, 'Spring Break', 'Spring Break', 'empty', '2022-05-05 19:39:01', 0, 0, 2471, 2658, 1651758600, '<p>Frühjahr 2022 Artwork</p>\n', '<p>Spring 2022 Artwork</p>\n', 7, '', 'spring-break.jpg', 'A4', 22.00, 1, 1, 1),
(337, 2, 32, 1, 'Dragonbird 3D', 'Dragonbird 3D', 'unsaleable', '2022-06-18 19:39:01', 0, 0, 4000, 3000, 1667572762, '<p>Mein erstes gedrucktes Relief mit meinem Renkforce Pro3.  &lt;br /&gt;<br />\nDer 3D-Drucker meines Vertrauens ermöglichte mir dieses Kunstwerk zu erschaffen.</p>\n', '<p>My first printed relief with my Renkforce Pro3.  &lt;br /&gt;<br />\nThe 3D printer I trust enabled me to create this work of art.</p>\n', 7, '', 'dragonbird 3D.jpg', '', 0.00, 1, 0, 1),
(338, 1, 31, 7, 'Lost Nature', 'Lost Nature', 'empty', '2022-08-21 19:39:01', 0, 0, 960, 1280, 1661529942, '<p>Ein Geburtstagsgeschenk für Ianosaurus</p>\n', '<p>The birthday present for Ianosaurus</p>\n', 7, '', 'lost nature.jpg', '', 0.00, 1, 0, 1),
(339, 1, 30, 12, 'Goldfish 3DP', 'Goldfish 3DP', 'empty', '2022-10-07 19:39:01', 0, 0, 545, 439, 1672312012, '<p>Ein Tonkunstwerk mit 3D Drucker Hilfe gestanzt.</p>\n', '<p>A piece of clay art punched with 3D printer help.</p>\n', 0, '', 'goldfish-3DP.jpg', '15x15cm', 12.00, 1, 1, 1),
(346, 1, 25, 1, 'Webmasters Delight 3D', 'Webmasters Delight 3D', 'empty', '2022-12-18 19:39:01', 5, 38, 1400, 1050, 1672327569, '<p>Ein weiteres PLA Objekt</p>\n', '<p>Another PLA Object</p>\n', 7, NULL, '/8db75ed75dd3b51a037a402b24d1e6f6.jpg', NULL, 0.00, 1, 0, 1),
(347, 1, 24, 1, 'Caustic Treble 3D', 'Caustic Treble 3D', 'empty', '2023-01-11 19:39:01', 0, 0, 3322, 2010, 1673451790, '<p>Das Design ist echt cool, wie ein modernes Kunstwerk aus dem 3D-Drucker. Die Linien und Formen sind richtig spannend, fast futuristisch. In Weiß wirkt das Ganze total clean und einzigartig - ein echter Hingucker!</p>\n', '<p>The design is really cool, like a modern work of art from a 3D printer. The lines and shapes are really exciting, almost futuristic. In white, the whole thing looks totally clean and unique - a real eye-catcher!</p>\n', 7, '', 'caustic-treble 3D.jpg', '', 0.00, 1, 0, 1),
(341, 1, 29, 12, 'Gullivers Adventures 3DP', 'Gullivers Adventures 3DP', 'empty', '2022-11-04 19:39:01', 0, 0, 696, 675, 1667571482, '<p>Gullivers Abenteuer in Ton gepresst (Form aus dem 3D-Drucker)</p>\n', '<p>Gulliver\'s Adventures pressed in clay (mould from the 3D printer)</p>\n', 0, '', 'Gullivers-3DP_2.jpg', '', 25.00, 1, 1, 1),
(342, 1, 28, 1, 'Supersonic 3D', 'Supersonic 3D', 'empty', '2022-11-04 19:39:01', 0, 0, 4000, 3000, 1667571557, '<p>Ein Relief vom Bild Supersonic.  &lt;br /&gt;<br />\n1.58h hat es gedauert bis es fertig wurde mit Drucken.</p>\n', '<p>A relief of the painting Supersonic.  &lt;br /&gt;<br />\nIt took 1.58h to finish printing.</p>\n', 0, '', 'Supersonic 3D.jpg', '', 25.00, 1, 1, 1),
(343, 1, 27, 1, 'Gullivers Adventures 3D', 'Gullivers Adventures 3D', 'empty', '2022-11-04 19:39:01', 0, 0, 3399, 2235, 1668784195, '<p>Das Relief von Gullivers Adventures in weißem PLA gedruckt.</p>\n', '<p>The relief of Gulliver\'s Adventures printed in white PLA.</p>\n', 7, '', 'Gulliverse-Adventure-3D.jpg', '', 25.00, 1, 1, 1),
(344, 1, 26, 1, 'Goldfish 3D', 'Goldfish 3D', 'empty', '2022-11-04 19:39:01', 0, 0, 3185, 2399, 1667572162, '<p>Ein weiters Relief von dem Bild Goldfish.</p>\n', '<p>Another relief from the picture Goldfish.</p>\n', 7, '', 'goldfish-3D.jpg', '', 0.00, 1, 0, 1),
(349, 2, 22, 7, 'Caustic Treble', 'Caustic Treble', 'empty', '2023-01-11 19:39:01', 0, 0, 2068, 2766, 1673452867, '<p>Ein kleines feines Fineliner Bild</p>\n', '<p>A fine little fineliner picture</p>\n', 7, '', 'caustic-treble.jpg', '', 0.00, 1, 0, 1),
(350, 0, 21, 12, 'HSV Raute', 'HSV Rhombus', 'empty', '2023-01-30 19:39:01', 0, 0, 2000, 1670, 0, '<p>Eine Kachel im HSV Design.</p>\n', '<p>A tile with the HSV design.</p>\n', 7, '', 'HSV.jpg', '', 0.00, 1, 0, 1),
(353, 0, 19, 12, 'Werder Bremen 3DP', 'Werder Bremen 3DP', 'empty', '2023-02-19 19:39:01', 0, 0, 3187, 4320, 1692886788, '<p>Ein Werder Bremen Logo aus Ton</p>\n', '<p>A Werder Bremen logo made of clay</p>\n', 7, '', 'Werder-Bremen-3DP.jpg', '', 0.00, 1, 0, 1),
(354, 0, 18, 12, 'St. Pauli Ashtray 3DP', 'St. Pauli Ashtray 3DP', 'sold', '2023-02-19 19:39:01', 0, 0, 2374, 2262, 1692884760, '<p>Ein St. Pauli Aschenbecher.</p>\n', '<p>A St. Pauli ashtray.</p>\n', 7, '', 'st_pauli_glased.jpg', '', 18.00, 1, 1, 1),
(355, 1, 17, 7, 'Holy Ground', 'Holy Ground', 'empty', '2023-03-13 19:39:01', 0, 0, 2673, 2305, 0, '<p>Ein Fineliner Artwork von 2023</p>\n', '<p>A Fineliner Artwork from 2023</p>\n', 7, '', 'Holy Ground02.jpg', '', 0.00, 1, 0, 1),
(356, 1, 16, 7, 'Fine Pix', 'Fine Pix', 'lost', '2023-05-19 19:39:01', 0, 0, 3712, 2148, 1692884225, '<p>Leider wurde mir dieses Bild gestohlen. Wer sachdienliche Hinweise hat bitte bei <a href=\"mailto:paul.rieser@marblefx.de\">paul.rieser[at]marblefx.de</a> melden.</p>\n', '<p>Unfortunately, this picture was stolen from me. If you have any relevant information, please contact <a href=\"mailto:paul.rieser@marblefx.de\">paul.rieser[at]marblefx.de</a>.</p>\n', 7, '', 'fine_pix.jpg', 'A5', 20.00, 1, 1, 1),
(357, 0, 15, 12, 'HSV Ascher', 'HSV Ashtrey', 'sold', '2023-05-19 19:39:01', 0, 0, 2119, 2198, 1692884138, '<p>Für meinen Fahrer der mich morgens schon seit 9 Jahren nach Segeberg fährt.</p>\n', '<p>For my driver who has been driving me to Segeberg in the morning for 9 years.</p>\n', 7, '', 'HSV-Ashtray.jpg', '', 25.00, 1, 1, 1),
(358, 1, 14, 7, 'Kirbys Dream', 'Kirbys Dream', 'forsale', '2023-07-06 19:39:01', 0, 0, 3040, 4320, 1693747812, '<p>A4 Blatt vollgekritzelt</p>\n', '<p>A4 sheet fully scribbled</p>\n', 7, '', 'kirbys_dream_fin.jpg', 'A4', 100.00, 1, 1, 1),
(359, 1, 13, 6, 'Winter Blues', 'Winter Blues', 'forsale', '2024-06-12 19:39:01', 0, 0, 3970, 3000, 0, '<p>Mal was mit Filzstift &amp; Fineliner.</p>\n', '<p>Something with felt-tip pen &amp; fineliner.</p>\n', 7, NULL, 'winter-blues.jpg', NULL, 58.00, 1, 1, 1),
(362, 0, 11, 12, 'Hertha BSC Ashtray 3DP', 'Hertha BSC Ashtray 3DP', 'givenaway', '2024-01-01 19:39:01', 0, 0, 2932, 2928, 0, '<p>Für meinen Stiefbruder</p>\n', '<p>For my Stepbrother</p>\n', 7, '', 'hbsc.jpg', '', 0.00, 1, 0, 1),
(361, 0, 12, 12, 'Carl Zeiss Jena Ashtray 3DP', 'Carl Zeiss Jena Ashtray 3DP', 'givenaway', '2024-01-01 19:39:01', 0, 0, 2940, 3244, 0, '<p>Für meinen Stiefvater</p>\n', '<p>For my Stepfather</p>\n', 7, '', 'czj.jpg', '', 0.00, 1, 0, 1),
(363, 0, 10, 2, 'Wonder Spring', 'Wonder Spring', 'forsale', '2024-02-04 19:39:01', 0, 0, 2482, 2424, 0, '<p>Eine abstraktes Kunstwerk in verschiedenen Grüntönen mit schwarzen, organischen Mustern.</p>\n', '<p>An abstract work of art in various shades of green with black, organic patterns.</p>\n', 7, '', 'wonder-spring.jpg', '60x60 cm', 180.00, 1, 1, 1),
(364, 0, 9, 12, 'Die Drei Ashtray 3DP', 'Die Drei Ashtray 3DP', 'empty', '2024-02-17 19:39:01', 0, 0, 2645, 2596, 0, '<p>Ein Die Drei Fragezeichen Ascher</p>\n', '<p>A The Three Question Marks ashtray</p>\n', 7, '', 'diedrei.jpg', '12x12cm', 50.00, 1, 1, 1),
(365, 1, 8, 2, 'Gepard', 'Cheetah', 'givenaway', '2024-05-17 19:39:01', 0, 0, 678, 560, 0, '<p>Ein Gepardenkopf mit goldbraunem Fell und ausdrucksstarken blauen Augen. Der Hintergrund ist oben grün wie Vegetation, unten beige wie die Savanne.</p><p>Es ist ein Geschenk für meinen Neffen.</p>\n', '<p>A cheetah head with golden-brown fur and expressive blue eyes. The background is green like vegetation at the top and beige like the savannah at the bottom.</p><p>It is a gift for my nephew.</p>\n', 11, '', 'gepard_cut.jpg', '', 0.00, 1, 0, 1),
(366, 1, 7, 11, 'Alfie No. 5', 'Alfie No. 5', 'givenaway', '2024-05-25 19:39:01', 0, 0, 3231, 2296, 0, '<p>Bleistiftzeichnung von meinem Neffen an seinem 5. Geburtstag</p>\n', '<p>Pencil drawing of my nephew on his 5th birthday</p>\n', 7, '', 'Alfie-No-5.jpg', 'A4', 0.00, 1, 0, 1),
(367, 0, 6, 7, 'Cucumber Shot', 'Cucumber Shot', 'empty', '2003-04-04 19:39:01', 0, 0, 2992, 2400, 0, '<p>Fineliner artwork auf karierten Papier</p>\n', '<p>Fineliner Artwork on checked paper.</p>\n', 7, '', 'cucumber_shot.jpg', '', 0.00, 1, 0, 1),
(368, 1, 5, 7, 'Liked Hiker', 'Liked Hiker', 'empty', '2008-01-02 19:39:01', 0, 0, 2566, 1776, 0, '<p>Fineliner Artwork von 2008</p>\n', '<p>Fineliner artwork from 2008</p>\n', 7, '', 'liked-hiker.jpg', '', 20.00, 1, 1, 1),
(369, 1, 4, 7, 'Crazy Frog', 'Crazy Frog', 'empty', '2012-10-28 19:39:01', 0, 0, 2482, 2064, 0, '<p>Fineliner Artwork von 10/12</p>\n', '<p>Fineliner artwork from 10/12</p>\n', 7, '', 'crazy-frog.jpg', '', 18.00, 1, 1, 1),
(370, 2, 3, 7, 'Eval Eye', 'Eval Eye', 'forsale', '2012-10-08 19:39:01', 0, 0, 2722, 1974, 0, '<p>Fineliner image from 10/12</p>\n', '<p>Fineliner Image from 10/12</p>\n', 7, '', 'Eval-Eye.jpg', '', 20.00, 1, 1, 1),
(371, 1, 2, 7, 'Rattlesnake', 'Rattlesnake', 'forsale', '2012-09-19 19:39:01', 0, 0, 3454, 2550, 0, '<p>Die Klapperschlange</p>\n', '<p>The rattlesnake</p>\n', 7, '', 'Rattlesnake.jpg', '', 20.00, 1, 1, 1),
(372, 1, 1, 7, 'Family Affair', 'Family Affair', 'empty', '2012-05-28 19:39:01', 0, 0, 3070, 2706, 0, '<p>2012er Fineliner Artwork</p>\n', '<p>2012 fineliner artwork</p>\n', 7, '', 'Family-Affair.jpg', 'A4', 20.00, 1, 1, 1),
(373, 1, 0, 7, 'Lotus Flower', 'Lotus Flower', 'forsale', '2012-06-18 19:39:01', 0, 0, 2441, 2640, 0, '<p>Fineliner Artwork von 06/12</p>\n', '<p>Fineliner artwork from 06/12</p>\n', 7, '', 'Lotus-Flower.jpg', 'A4', 20.00, 1, 1, 1),
(374, 1, 0, 7, 'The Bridge', 'The Bridge', 'forsale', '2012-05-01 19:39:01', 0, 0, 2722, 1758, 0, '<p>Fineliner Artwork von 05/12</p>\n', '<p>Fineliner artwork from 05/12</p>\n', 7, '', 'the-bridge.jpg', 'A4', 20.00, 1, 1, 1),
(375, 1, 0, 7, 'Lisas House', 'Lisas House', 'forsale', '2012-04-10 19:39:01', 0, 0, 2644, 2220, 0, '<p>Fineliner Artwork von 04/12</p>\n', '<p>Fineliner artwork from 04/12</p>\n', 7, '', 'lisas-house.jpg', 'A4', 20.00, 1, 1, 1),
(376, 1, 0, 7, 'Knock Knock', 'Knock Knock', 'forsale', '2024-03-28 19:39:01', 0, 0, 1961, 1956, 0, '', '', 7, '', 'knock-knock.jpg', 'A4', 18.00, 1, 1, 1),
(377, 1, 0, 7, 'Palm Wood', 'Palm Wood', 'forsale', '2024-05-28 19:39:01', 0, 0, 3160, 2760, 0, '', '', 7, '', 'palm-wood.jpg', 'A4', 20.00, 1, 1, 1),
(378, 1, 0, 7, 'Lens Share', 'Lens Share', 'forsale', '2020-05-19 19:39:01', 0, 0, 1787, 2568, 0, '', '', 7, '', 'lens-share.jpg', 'A4', 21.00, 1, 1, 1),
(379, 1, 0, 7, 'Robin Hood', 'Robin Hood', 'forsale', '2020-09-05 19:39:01', 0, 0, 2524, 2310, 0, '', '', 7, '', 'robin-hood.jpg', 'A4', 19.00, 1, 1, 1),
(380, 1, 0, 7, 'Cool Misa', 'Cool Misa', 'sold', '2024-06-04 19:39:01', 0, 0, 831, 1516, 0, '<p>Ein Fineliner Tryptichon</p>\n', '<p>Ein Fineliner Tryptichon</p>\n', 4, '', 'cool-misa.jpg', '3x A4', 50.00, 1, 0, 1),
(381, 1, 0, 10, 'Schwamm', 'Sponge', 'empty', '2024-06-15 19:39:01', 0, 0, 4000, 3000, 0, '<p>Ein Schwamm als Makroaufnahme</p>\n', '<p>A sponge as a macro image</p>\n', 7, '', 'P1000396.JPG', '', 0.00, 1, 0, 1),
(382, 1, 0, 10, 'Klavier', 'Piano', 'empty', '2024-06-15 19:39:01', 0, 0, 4000, 3000, 0, '<p>Rollen eines Flügels</p>\n', '<p>Rolling of a sash</p>\n', 7, '', 'P1000442.JPG', '', 0.00, 1, 0, 1),
(383, 1, 0, 12, 'Alfies Bowl', 'Alfies Bowl', 'givenaway', '2024-06-25 19:39:01', 0, 0, 1280, 960, 0, '<p>Ein Geschenk an meinen Neffen</p>\n', '<p>A present for my nephew</p>\n', 10, '', 'alfies-bowl.jpg', '', 0.00, 1, 0, 1),
(384, 1, 0, 12, 'Fine Pix 3DP', 'Fine Pix 3DP', 'forsale', '2024-07-16 19:39:01', 0, 0, 3556, 2160, 0, '<p>Fine Pix in Ton</p>\n', '<p>Fine Pix in clay</p>\n', 7, '', 'fine-pix-3DP.jpg', '', 20.00, 1, 1, 1),
(385, 1, 0, 12, 'Caustic Treble 3DP', 'Caustic Treble 3DP', 'forsale', '2024-07-16 19:39:01', 0, 0, 3670, 2433, 0, '<p>Caustic Treble in Ton</p>\n', '<p>Caustic Treble in clay</p>\n', 7, '', 'caustic-treble-3DP.jpg', '', 20.00, 1, 1, 1),
(386, 1, 0, 12, 'Salamander Vogeltränke', 'Salamander bird bath', 'givenaway', '2024-10-24 19:39:01', 0, 0, 720, 734, 0, '<p>Mit Glas als Premiere in meinen getöpferten Objekten</p>\n', '<p>With glass as a premiere in my pottery objects</p>\n', 11, '', 'salamander2.jpg', '', 0.00, 1, 0, 1),
(418, 1, 0, 5, 'Cewl Cow 2k', 'Cewl Cow 2k', 'empty', '2024-11-03 19:39:01', 1, 9, 1400, 788, 0, '<p>Habe mal wieder was wiedergefunden und hier veröffentlicht</p>\n', '<p>I found something again and published it here.</p>\n', 12, NULL, '40ac710f851df2a023dcfc2af3324b97.jpg', NULL, NULL, 1, NULL, 1),
(431, 1, 1, 7, '1000 Kilovolts', '1000 Kilovolts', 'givenaway', '2025-03-15 19:39:01', 0, 0, 1280, 961, 0, '<p>Kein Kommentar</p>\n', '<p>No comment</p>\n', 1, NULL, '571532b732a63c2395da7f7b1e772ef7.jpg', 'A4', NULL, 1, NULL, 1),
(420, 1, 0, 1, 'Dadelix 3D', 'Dadelix 3D', 'empty', '2024-11-30 19:39:01', 0, 0, 1400, 780, 0, '<p>Dadelix in 3D</p>\n', '<p>Dadelix in 3D</p>\n', 7, NULL, '0d27cd18090181a2a86a777d9cbe7944.jpg', NULL, NULL, 1, NULL, 1),
(428, 1, 5, 2, 'Mixed Smasher', 'Mixed Smasher', 'forsale', '2024-12-14 19:39:01', 0, 0, 1400, 1403, 0, '<p>Mit Pouring Technik erstellt.</p>\n', '<p>Created with pouring technique</p>\n', 7, NULL, 'd08cff7d676612d1c7a9851cd6ceb0a2.jpg', NULL, 101.00, 1, 1, 1),
(430, 1, 1, 1, 'Hello World', 'Hello World', 'unsaleable', '2025-03-14 19:40:03', 5, 38, 1400, 680, 0, '<p>Eine Kachelvorlage aus PLA</p>', '<p>A tile template made from PLA</p>', 7, NULL, 'bb5844791b3afd328dffe366fc9eedef.jpg', '18x8cm', 50.00, 1, 1, 1),
(453, 1, 1, 12, 'Hello World 3DP', 'Hello World 3DP', 'forsale', '2025-03-29 16:51:16', 5, 29, 1400, 668, 0, '<p>Halo</p>\n', NULL, 7, NULL, 'e1ea6abb156103a03ad54535be5fbfbb.jpg', NULL, NULL, 1, 1, NULL),
(459, 1, 1, 2, 'Strawberry Hearts', 'Strawberry Hearts', 'forsale', '2025-04-11 17:03:56', 3, 17, 1400, 1000, 0, '<p>Gespachtelter Acryl Hintergrund mit weißer Acrylfarbe/Stift auf Papier</p>\n', '<p>Spackled acrylic background with white acrylic paint/marker on paper</p>\n', 7, NULL, '/d2b6c3f003ff67d761cdf42ef1d7fdd9.jpg', 'A2', 100.00, 1, 1, 1),
(454, 1, 0, 12, 'Rattlesnake House 3DP', 'Rattlesnake House 3DP', 'forsale', '2025-03-29 16:55:15', 5, 29, 1400, 1040, 0, NULL, NULL, 0, NULL, '0da5e1cf1c64b6226c5a3e1dba4e33ba.jpg', NULL, 29.50, 1, 1, 1),
(461, 1, 0, 10, '12313', '23', 'unsaleable', '2025-04-13 13:46:58', 1, 39, 1400, 1400, 0, '<a href=\"https://www.google.com\" target=\"_blank\" rel=\"noopener noreferrer\">Ein Schaumkuss</a>&nbsp;<em>ist doch geil oder ?</em>', '<p>Choco Marshmallow</p>\n', 3, NULL, '/e32609521bb9e23dbe9fccde9d5f5840.jpg', NULL, 0.00, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `image_categories`
--

DROP TABLE IF EXISTS `image_categories`;
CREATE TABLE `image_categories` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` bigint(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_en` varchar(50) NOT NULL,
  `shortname` varchar(20) DEFAULT NULL,
  `heading_alt` varchar(255) NOT NULL,
  `heading_alt_en` varchar(255) NOT NULL,
  `category_id` bigint(11) DEFAULT NULL,
  `type_id` bigint(11) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `img_icon` varchar(80) DEFAULT NULL,
  `AscName` varchar(50) DEFAULT NULL,
  `AscName_en` varchar(50) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `description_en` mediumtext NOT NULL,
  `itemscope` enum('','Painting','Digital Art','Photograph','Sculpture') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xis_shopable` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `image_categories`
--

INSERT INTO `image_categories` (`id`, `pub`, `position`, `name`, `name_en`, `shortname`, `heading_alt`, `heading_alt_en`, `category_id`, `type_id`, `slug`, `img_icon`, `AscName`, `AscName_en`, `description`, `description_en`, `itemscope`, `created_at`, `updated_at`, `xis_shopable`) VALUES
(1, 1, 1, '3DDrucker', '3DPrinter', '3DPrinter', 'Frisch aus dem 3D Drucker', 'Fresh out of the 3D printer', 5, 38, '3DPrinter', '3dprinter.jpg', '3D Druck Bilder', '3D Print Images', '<p>Alles was man so mit einem 3D Drucker machen kann.</p>\n', '<p>Everything you can do with a 3D printer.</p>\n', 'Sculpture', '2022-01-05 10:51:56', '2023-01-15 17:15:43', 0),
(2, 1, 2, 'acryl', 'acrylic', 'acryl', 'Bilder mit Acrylfarbe auf Leinwand', 'Paintings with Acrylic Color on Canvas', 0, 0, 'Acryl', 'acryl_new.jpg', 'Acryl Bilder', 'Acrylic Images', '<p>All diese Bilder sind mit Acrylfarbe entstanden. Meist skizziere ich alles mit Bleistift, male dann mit Permanent Maker die Linien nach und male dann das Bild mit Acryl Farbe aus. Man muss sich ganz sch&ouml;n konzentrieren das man sich nicht vermalt. Die Arbeitszeit ist je nach Gr&ouml;&szlig;e unterschiedlich, da die Farbe teilweise erst trocknen muss.</p>\n', '<p>All of theese pictures are painted with Acrylic-Color. I often just sketch everything with a pencil. After that i just follow the lines with a permanent marker and fill out everything with Acrylic-Color. Sometimes it\'s hard to conzentrate on the image but it works mostly. I need different time to Create theese Artworks because the color must dry first until it\'s finished.</p>\n', 'Painting', '2016-11-30 18:49:02', '2016-11-30 18:49:02', 1),
(3, 1, 3, 'alphabet', 'alphabet', 'alphabet', 'Von A-Z - Eine Auswahl ausgew&auml;hlter Fotos', 'From A-Z - A selection of selected Photos', 1, 39, 'Alphabet', 'abc.jpg', 'Alphabetische Bilder', 'Alphabetic pictures', '<p>Ich suche nach Buchstaben in Photos, hier sind meine Schnappschüsse dazu zu finden. Es ist ganz schön knifflig passende Bilder zu finden. Aber man findet hin und wieder mal was passendes...</p>\n', '<p>I\'m just looking for letters in the nature. Here you can see my snapshots. It\'s sometime hard to find something, but in some cases you\'ll find some images.</p>\n', 'Photograph', '2016-11-30 19:54:48', '2016-11-30 19:54:48', 0),
(4, 1, 4, 'ausgemaltes', 'colored', 'ausgemaltes', 'Ausgemalte Bilder von Asario', 'Colored Pictures from Asario', 3, 41, 'Ausgemaltes', 'ausgemalt.jpg', 'Ausgemaltes', 'colored', '<p>Ausmalbilder f&uuml;r Erwachsene sind voll im kommen. Hier ein paar Werke die ich mit Fineliner bzw. Acrylfarbe ausgemalt habe. Das gr&ouml;&szlig;te Problem sind die feinen Strukturen in den Vorlagen. Momentan arbeite ich aus 4 B&uuml;chern heraus nette Grafiken. Ich erw&auml;hne in der Beschreibung das Quellbuch der Bilder.</p>\n', '<p>Paint-in Images for adults are up to date today. Here you can see some Artworks wich I coloured with fineliners ore acrylic colors. The biggest problem are the tiny Structures in the drafts. At the moment i just work out of 4 Books nice artworks. I mention the book in the Image Description.</p>\n', 'Painting', '2016-12-13 19:37:07', '2016-12-13 19:37:07', 1),
(5, 1, 5, 'digital', 'digital', 'digital', 'Meine Wallpaper', 'My Wallpaper', 0, 0, 'Digital', 'digital.jpg', 'Digitale Kunstwerke', 'Digitale Artworks', '<p>Hier findet Ihr ein paar Wallpaper von mir. Wallpaper entstehen bei mir oft als Zufallobjekt beim Spielen mit Grafiken. Alle Wallpaper k&ouml;nnt ihr in Originalgr&ouml;&szlig;e runterladen. Einfach aufs Thumbnail rechtsklicken und &quot;Bild Speichern&quot; oder so &auml;hnlich ausw&auml;hlen. Ich hoffe euch gefallen meine kleinen Experimente.</p>\n', '<p>Here you can see some of my Wallpapers i made in the last years. Wallpapers are often a random Product by Playing with images. All Wallpapers are available in full size. Just right click on the thumbnail and choose something like &quot;save image at&quot;. I hope you enjoy my experiments.</p>\n', 'Painting', '2017-02-03 19:52:03', '2017-02-03 19:52:03', 0),
(6, 1, 6, 'fasermaler', 'Felt-Tip-Pen', 'fasermaler', 'Mit Filzstift auf Pappe und Papier oder Leinwand', 'With felt-tip pen on cardboard and paper or canvas', 2, 14, 'Fasermaler', 'faser.jpg', 'Fasermaler Bilder', 'Felt Tip Images', '<p>Filzstift und Edding auf Karton / Pappe / Leinwand.<br />\ndiese Bilder sind so &Auml;hnlich wie Fineliner oder Acryl nur das sie auf Pappe bzw Papier oder Leinwand entstanden<br />\nsind und nur mit Filzstift und Edding ausgemalt worden.<br />\nDie Bilder sind doppelt so gro&szlig; wie Fineliner Pix und auch mit doppelt so dicken Stiften gemalt.</p>\n', '<p>Felt pen and sharpie on cardboard / paper / canvas.<br />\nthese pictures are similar to fineliner or acrylic only that they were created on cardboard or paper or canvas<br />\nand have only been colored with felt-tip pen and sharpie.<br />\nThe pictures are twice as big as Fineliner Pix and also painted with pens twice as thick.</p>\n', 'Painting', '2016-12-13 19:45:20', '2016-12-13 19:45:20', 1),
(7, 1, 7, 'fineliner', 'fineliner', 'fineliner', 'Meine Fineliner Kunstwerke', 'my fineliner artworks', 0, 0, 'Fineliner', 'fineliner.jpg', 'Fineliner Galerie', 'Fineliner Gallery', '<p>Fineliner Artworks von mir.<br />\nDas sind meine Fineliner Bilder von 2003-fx_year()<br />\nJa ich liebe meine Stabilo Fineliner ;)</p>\n', '<p>My Fineliner Artworks.<br />\nThis are Artworks from 2003-fx_year()<br />\nYes I love my Stabilo Fineliners ;),</p>\n', 'Painting', '2018-06-09 20:22:00', '2018-06-09 20:22:00', 1),
(8, 1, 8, 'lampen', 'lamps', 'lampen', 'Lampen aus Leinw&auml;nden...', 'Lamps from Canvases', 5, 42, 'Lampen', 'lampen.png', 'Lampen aus bemalten Leinw&auml;nden', 'Lamps created with painted Canvases', '<p>Vor einiger Zeit hatte Chris aus dem Maleratelier die Idee zu einem Lichtobkjekt. Die Lampen bestehen zum Teil aus fertig montierten Prismen-Leinw&auml;nden sowie verschraubten planen Leinw&auml;nden. In den Prismen steckt eine Leuchtstoffr&ouml;hre und in den Viereckigen eine normale Gl&uuml;hlampe. Die Lampen stehen zum gr&ouml;&szlig;tem Teil in Rickling im Maleratelier wo auch einige meiner Acryl-Werke h&auml;ngen. Schaut mal rein und schaut euch gl&uuml;cklich,</p>\n', '<p>Some time ago Chris from the &quot;Maleratelier&quot; had the idea to a Light-Object. Some of the Lamps are made of mounted Prism Canvases others of screwed Canvases. In the Prism Canvas is a fluorescent tube installed. The Others are filled with a Light Bulb. Most of the lamps are shown in Ricklink in the &quot;Maleratelier&quot; where also some of my acrylic Images are shown. Have a look and enjoy.</p>\n', 'Painting', '2017-02-03 20:08:59', '2017-02-03 20:08:59', 1),
(9, 1, 9, 'monstarz', 'monstarz', 'monstarz', 'Mein Monstar in der gro&szlig;en weiten Welt', 'My monstar in the big wide world', 0, 0, 'Montstarz', 'monstar.jpg', 'Mein Monstar', 'My Monstar', '<p>Ich habe vor Jahren ein Monstar-Kuscheltier bekommen, und habe es auf die Reise quer durch die Welt geschickt. Verwandte und Freunde haben das Tier in Szene gesetzt und Fotografiert. Mein Monster in der gro&szlig;en weiten Welt. Shots by Chinagirl, Baxter the dog, Nitropower, mir und Maria Zinckernagel Ich finde mein Monstar extrem Fotogen.</p>\n', '<p>Some years ago i recieved a Monstar as a gift from my Sister. Sometimes Monstar is traveling around the world and some of my friends and family members shot photos with it. Monstar in the whole wide world. Shots by Chinagirl, Baxter the dog, Nitropower, Maria Zinckernagel and me I think my monstar has a lot of Sex-Appeal.</p>\n', 'Photograph', '2017-02-03 20:10:18', '2017-02-03 20:10:18', 0),
(10, 1, 10, 'photos', 'photos', 'photos', 'Meine gemischten Photos', 'My mixed Photos', 1, 39, 'Photos', 'photos.jpg', 'Fotografien', 'Photographs', '<p>Fotos aufgenommen mit diversen Kameras an verschiedenen Orten. Ostsee, Berlin, Kreis Segeberg uvm.</p>\n', '<p>Photos shooted with different Cameras on different places. Baltic Sea, Berlin, Kreis Segeberg etc.</p>\n', 'Photograph', '2018-06-29 15:07:58', '2018-06-29 15:07:58', 0),
(11, 1, 11, 'sketches', 'sketches', 'sketches', 'Skizzen und Kritzeleien', 'Sketches and Scribbled ones', 0, 0, 'Sketches', 'sketches.jpg', 'Sketches Galerie', 'Sketches Gallery', '<p>Skizzen und Entw&uuml;rfe bzw. Konzeptzeichnungen sind hier. Haupts&auml;chlich sind es Entw&uuml;rfe die diese Galerie Pr&auml;gen. Unter anderem sind es kleinere Zeichnungen die zwar fertig aber nicht Formatf&uuml;llend sind. Auch kleinere Experimente findet Ihr hier Versammelt unter dem Dach Sketches.</p>\n', '<p>Sketches and schemes are in here. This gallery is characterized by schemes and drafts. Among others the pictures are very small but finished. Also smaller experiments you\'ll find here under the label Sketches.</p>\n', 'Painting', '2017-02-03 20:14:25', '2017-02-03 20:14:25', 1),
(12, 1, 12, 'keramik', 'pottered', 'keramik', 'Get&ouml;pferte Dinge', 'Pottered things', 5, 29, 'Keramik', 'clay.jpg', 'get&ouml;pfertes', 'pottered', '<p>Einige Werke sind in 3D. Ausgestellt sind get&ouml;pferte Kunstwerke von Asario. Alles ist von mir handgemacht, mit Hilfe meines 3D-Druckers</p>\n', '<p>Some works are in 3D. On display are pottery works of art by Asario. Everything is handmade by me, with the help of my 3D printer</p>\n', 'Sculpture', '2017-05-28 16:12:44', '2017-05-28 16:12:44', 1),
(13, 1, 13, 'zentangle', 'zentangle', 'zentangle', 'Meine Zentangle Galerie - Alles Handgetangelt', 'My Zentangle Gallery - All hand-tangled', 0, 0, 'Zentangles', 'zia_icon.jpg', 'Zentangle&reg;', 'Zentangle&reg;', '<p>Meine ersten Versuche mit Zentangle Inspired Art. Zentangles sind eigentlich Zeichnungen im Format 9x9cm, sind sie gr&ouml;&szlig;er hei&szlig;en sie offiziell &quot;Zentangle Inspired Art&quot;. Es gibt diverse Zentangle B&uuml;cher und Hefte in denen die verschiedenen Muster abgedruckt sind, Ich habe einige davon zu Papier gebracht und unter anderem Postkarten mit diesen Mustern bemalt. Zentangles sind zum entspannen gut und f&ouml;rdern die Kreativit&auml;t.</p>\n', '<p>My first attemps with Zentangle Inspired Art. Actually Zentangle are 9cmx9cm big. Bigger ore Smaller Artworks are called &quot;Zentangle Inspired Arrt&quot;. Their are plenty of books about Zentangles where different Patterns are printed in them. I Just made some Postcards and other Artworks with the patterns. You can relax while painting and it supports Creativity.</p>\n', 'Painting', '2017-02-03 20:15:43', '2017-02-03 20:15:43', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_19_072147_add_two_factor_columns_to_users_table', 2),
(5, '2024_03_19_072211_create_personal_access_tokens_table', 2),
(6, '2024_04_03_065304_create_blog_authors_table', 2),
(7, '2024_04_03_065320_create_blog_categories_table', 2),
(8, '2024_04_03_065328_create_blog_images_table', 2),
(9, '2024_04_03_065334_create_blogs_table', 2),
(10, '2024_04_05_063841_add_attributes_for_applicationsswitch_to_users', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author_name` varchar(255) DEFAULT NULL,
  `author_id` bigint(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `published_at` int(10) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` bigint(20) NOT NULL,
  `users_id` bigint(20) DEFAULT NULL,
  `image_id` bigint(20) NOT NULL,
  `table` varchar(200) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `users_id`, `image_id`, `table`, `rating`, `email`, `created_at`, `updated_at`) VALUES
(1, 1, 428, 'Acryl', 4, NULL, '2025-03-30 15:53:50', '2025-04-13 12:50:49'),
(5, 1, 359, 'Fasermaler', 4, NULL, '2025-03-30 16:41:05', '2025-04-29 17:23:06'),
(6, NULL, 359, 'Fasermaler', 3, NULL, '2025-03-30 16:41:47', '2025-03-30 17:19:45'),
(7, NULL, 428, 'Acryl', 5, NULL, '2025-03-30 17:23:03', '2025-03-30 19:09:52'),
(8, 1, 170, 'Alphabet', 5, NULL, '2025-04-29 16:02:53', '2025-04-29 16:36:05'),
(9, 1, 435, 'Fineliner', 5, NULL, '2025-04-29 17:24:23', '2025-05-02 12:07:58'),
(10, 1, 336, 'Fineliner', 4, NULL, '2025-04-29 18:06:27', '2025-04-29 18:06:27'),
(11, 1, 430, '3DPrinter', 5, NULL, '2025-05-01 18:36:40', '2025-05-01 18:36:40'),
(12, 1, 459, 'Acryl', 5, NULL, '2025-05-02 11:24:29', '2025-05-02 11:24:29'),
(13, 1, 431, 'Fineliner', 4, NULL, '2025-05-02 12:13:00', '2025-05-02 14:15:52'),
(14, 1, 85, 'shortpoems', 4, NULL, '2025-05-03 21:37:35', '2025-05-04 16:30:49'),
(15, 1, 118, 'didyouknow', 4, NULL, '2025-05-04 13:15:58', '2025-05-04 16:45:41'),
(16, 1, 71, 'shortpoems', 4, NULL, '2025-05-04 13:37:24', '2025-05-04 13:44:12'),
(17, 1, 454, 'Keramik', 5, NULL, '2025-05-04 14:34:18', '2025-05-04 14:34:18'),
(18, 1, 49, 'shortpoems', 5, NULL, '2025-05-04 16:31:02', '2025-05-04 16:31:02'),
(19, 1, 73, 'shortpoems', 5, NULL, '2025-05-04 16:31:47', '2025-05-04 16:31:47'),
(20, 1, 64, 'shortpoems', 5, NULL, '2025-05-04 16:33:20', '2025-05-04 16:33:20'),
(21, 1, 52, 'shortpoems', 5, NULL, '2025-05-04 16:34:57', '2025-05-04 16:34:57'),
(22, 1, 57, 'shortpoems', 5, NULL, '2025-05-04 16:37:21', '2025-05-04 16:37:21'),
(23, 1, 66, 'shortpoems', 5, NULL, '2025-05-04 16:38:35', '2025-05-04 16:38:35'),
(24, 1, 65, 'shortpoems', 5, NULL, '2025-05-04 16:40:46', '2025-05-04 16:40:46'),
(25, 1, 70, 'shortpoems', 5, NULL, '2025-05-04 16:42:52', '2025-05-04 16:42:52'),
(26, 1, 114, 'didyouknow', 4, NULL, '2025-05-04 16:46:44', '2025-05-04 16:46:58'),
(27, 1, 88, 'didyouknow', 5, NULL, '2025-05-04 16:47:37', '2025-05-04 16:47:37'),
(28, 1, 169, 'Alphabet', 5, NULL, '2025-05-04 18:15:31', '2025-05-04 18:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('GS1mOTcfOXXiFrTTdWmhNh4BirVsEEjACyjU1FBX', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoia1EzVERaYlVibVJIMGpLUDNrOUhveTdjMVNaeUhUbVJMSHMzU1RZOCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vbG9jYWxob3N0OjgwODEvR0VUVXNlcklEIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJyZW1lbWJlcl9xdWVyeV9zdHJpbmdzIjthOjE6e3M6NDoiaG9tZSI7YToxOntzOjQ6ImJsb2ciO2E6MTp7czo1OiJpbmRleCI7YToxOntzOjY6InNlYXJjaCI7czo0OiIxLjU4Ijt9fX19czo1OiJ0b2FzdCI7YTowOnt9czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo1OiJ0YWJsZSI7czo2OiJpbWFnZXMiO30=', 1746877139);

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

DROP TABLE IF EXISTS `texts`;
CREATE TABLE `texts` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` bigint(11) NOT NULL,
  `headline` varchar(80) DEFAULT NULL,
  `text` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `author_id` bigint(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `texts`
--

INSERT INTO `texts` (`id`, `pub`, `position`, `headline`, `text`, `type`, `author_id`, `created_at`) VALUES
(3, 1, 0, 'Willkommen', '<p>Liebe Musikfreunde,</p><p>mein Name ist Bj&ouml;rn Hannemann, besser bekannt als M66, und ich freue mich, euch auf meiner musikalischen Reise begr&uuml;&szlig;en zu d&uuml;rfen! Als DJ erkunde ich eine Vielzahl von Genres und Stilen, von Pop &uuml;ber Goa bis hin zu Hip-Hop und Techno.</p><p>Mein erster Auftritt fand am 03.11.2023 im Seh Sie in Bad Oldesloe statt, ein unvergessliches Erlebnis, das den Startschuss f&uuml;r viele weitere musikalische Abenteuer markierte.</p><p>Aktuell verbringe ich viel Zeit zuhause an meinem Numark NS4FX DJ-Pult und arbeite an neuen Mixen, die ich mit euch auf Plattformen wie Mixcloud, SoundCloud und YouTube teile. Es w&auml;re gro&szlig;artig, wenn ihr mal vorbeischaut, euch ein wenig Zeit nehmt, um reinzuh&ouml;ren und vielleicht sogar ein Follower zu werden.</p><p>Unter meinen K&uuml;nstlernamen wie Hannemuck (POP), Ghanuck66 (GOA), Grandpa Flash66 (HipHop) und BlackKNight0676 (Techno) findet ihr verschiedene Facetten meiner musikalischen Pers&ouml;nlichkeit, die ich gerne mit euch teile.</p><p>Vielen Dank f&uuml;r eure Unterst&uuml;tzung und die Zeit, die ihr meinen Mixen widmet. Ich freue mich darauf, euch auf meiner musikalischen Reise zu begleiten und gemeinsam mit euch die Welt der Musik zu erkunden.</p><p>Herzliche Gr&uuml;&szlig;e,</p><p>Bj&ouml;rn Hannemann (M66)</p>\n', 'start', 1, '2024-10-15 17:09:04'),
(6, 1, 1, 'Hannemucks Biografie', '<p>Mein Name ist Bj&ouml;rn (M66) Hannemann!<br />\nIch bin am 06.01.1976 in Neum&uuml;nster in einer Privatklinik geboren.<br />\nAufgewachsen und zur Schule gegangen bin ich in einem sch&ouml;nen Dorf in Schleswig Holstein-Trappenkamp. Das erste mal mit der Musik kam ich ca 1984 bei Klaus L. aus Trappenkamp.<br />\nDer war Dj auf Grill und Zeltfeten.</p><p>Da habe ich sowas wie Max Mix und Italo Boot Mix kennen gelernt.<br />\nNebenbei habe ich in dem Ortsans&auml;ssigen Club (TV Trappenkamp) Fu&szlig;ball gespielt.<br />\nMit ca 14 wollten ein paar Freunde aus Trappenkamp und Rickling in Rickling in der alten W&auml;scherei einen Club betreiben.(Da lief sowas wie SNAP-The Power und Dr Acid und Mr House)!<br />\nMit 15-16 bin ich dann zu Gangster RAP aus den USA gekommen.</p><p>Das ging bis zum 18. Lebensjahr,wobei ich da schon Angefangen habe mich Techno und Eurodance zu h&ouml;ren (sowas wie House Party 8, Thunderdome, Marusha,Westbam,Scooter,Masterboy,Odysee usw).<br />\nMein erster Disco besuch war ca mit 16 (Traffic-Kaltenkirchen (bis 22uhr Eintritt frei)!<br />\nAm 01.01.1995-31.12.1995 war ich als Wehrpflichtiger bei den Panzerbatallion 5/183 in Boostedt.<br />\nWo es sich dann ergab immer ins SKY nach Neum&uuml;nster zu gehen!</p><p>Nach meiner Bundeswehrzeit habe ich dann bei Becker Bau Bornh&ouml;ved angefangen zu Lehrnen.<br />\nDabei haben Freunde (the Chambers Â± x) angefangen zu Mixen (Dreher Riehmenantrieb) und nebenbei zu Zocken (PS1).<br />\nAb 1996 ist man auch auf Party gefahren.(erst Generationen Move HH und Loveparade Berlin).</p><p>Ab 1998 ist man dann in die Clubs und Privatpartys von Djâ€˜s (Box HH und Earthquake Party im Lindenhof und in Bornh&ouml;ved)!</p><p>In den Clubs wurde man erst Anfang bis Mitte 1999 Aktiv ( Tunnel HH, New Bambu Neustadt in Holstein und 1x Ziegelei Gro&szlig; Weeden)!<br />\nDann war eine K&uuml;nstlerische Pause bis auf Ortsans&auml;ssige Partys wie Der Streetmove (Aqualoop Records) und von Kevax and Friends die T-Club Party\'s und von Ivo and Friends die Fl&auml;chenbrand Partys!</p><p>Anfang-Mitte 2022 bin ich durch einen guten Freund (Maik V.) in der Behinderten Werkstatt Bad Segeberg auf Twitch aufmerksam gemacht worden. Dadurch wurde ich wieder Angefixt zu Mixen. Also habe ich mir Ende April ein DJ-Pult (Numark NS4FX) zu gelegt.</p><p>Musik hatte ich noch von meiner K&uuml;nstlerischen Pause.<br />\nDann habe ich einfach mal los gelegt!</p><p>Und seid ca 12/22-23 hei&szlig;e ich M66.</p><p>Der Name Hannemuck ist eine zusammenh&auml;ngender Begriff aus den Namen Hanne und Muck,wobei das Muck in den M von M66 versteckt ist!<br />\nSeid den 11/2023 habe ich auch schon meinen ersten Ã–ffentlichen Auftritt gehabt (Seh Sie-Bad Oldeslohe).<br />\nAber ich mache inmoment nur Mixe bei mir zuhause die ich bei Mixcloud und SoundCloud ver&ouml;ffentliche.</p><p>Die Links poste ich in allen m&ouml;glichen Social Medias. So das war es erstmal!!</p>\n', 'bio', 1, '2025-03-24 17:13:26'),
(8, 1, 2, 'Meine Musik', '<p>asd<br />\nsd<br />\nsd</p><p>ds<br />\nsd<br />\nds</p>\n', 'music', 1, '2024-10-18 13:16:05'),
(9, 1, 3, 'K&uuml;nstliche Intelligenz Bei Asario.de', '<p>Bildgenerierende KIs er&ouml;ffnen spannende M&ouml;glichkeiten, um kreative Prozesse zu unterst&uuml;tzen. Sie erzeugen beeindruckende Bilder basierend auf Textbeschreibungen oder Vorgaben und finden zunehmend Anwendung in Kunst, Design und Marketing. Es wurden alle mit <strong>&quot;AI&quot;</strong> markierten Bilder mithilfe von <strong><a href=\"https://www.nightcafe.studio\">NightCafe Studio</a></strong> erstellt. Entdecke, wie K&uuml;nstliche Intelligenz das Bilderschaffen neu definiert und neue kreative T&uuml;ren &ouml;ffnet!</p>\n', 'ai', 1, '2024-10-21 09:55:17'),
(12, 1, 4, 'Sie haben nicht die ben&ouml;tigten Rechte', '<p>Diese Seite wurde gesperrt.<br />\n&lt;br /&gt;&lt;br /&gt;<br />\nWenden Sie sich an den Administrator falls Sie diese Funktion ben&ouml;tigen</p>\n', 'no-rights', 1, '2024-10-21 12:29:42');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `name_en`, `category_id`) VALUES
(1, '3D-Rendering', '3D Rendering', 1),
(2, 'KI-generierte Kunst', 'AI-Generated Art', 1),
(3, 'Algorithmische Kunst', 'Algorithmic Art', 1),
(4, 'Digitale Malerei', 'Digital Painting', 1),
(5, 'Generative Kunst', 'Generative Art', 1),
(6, 'Glitch-Kunst', 'Glitch Art', 1),
(7, 'Mixed Media – Digital & Traditionell', 'Mixed Media', 1),
(8, 'Fotomanipulation', 'Photomanipulation', 1),
(9, 'Pixelkunst', 'Pixel Art', 1),
(10, 'Vektorgrafik', 'Vector Art', 1),
(11, 'Kohle', 'Charcoal', 2),
(12, 'Graphit', 'Graphite', 2),
(13, 'Tuschezeichnung', 'Ink Drawing', 2),
(14, 'Marker', 'Marker', 2),
(15, 'Pastell', 'Pastel', 2),
(16, 'Bleistift', 'Pencil', 2),
(17, 'Acryl', 'Acrylic', 3),
(18, 'Gouache', 'Gouache', 3),
(19, 'Tinte', 'Ink', 3),
(20, 'Öl auf Leinwand', 'Oil on Canvas', 3),
(21, 'Tempera', 'Tempera', 3),
(22, 'Aquarell', 'Watercolor', 3),
(23, 'Radierung', 'Etching', 4),
(24, 'Lithografie', 'Lithograph', 4),
(25, 'Siebdruck', 'Silkscreen', 4),
(26, 'Holzschnitt', 'Woodcut', 4),
(27, 'Bronze', 'Bronze', 5),
(28, 'Keramik', 'Ceramic', 5),
(29, 'Ton', 'Clay', 5),
(30, 'Glas', 'Glass', 5),
(31, 'Marmor', 'Marble', 5),
(32, 'Metallkunst', 'Metalwork', 5),
(33, 'Holz', 'Wood', 5),
(34, 'Stickerei', 'Embroidery', 6),
(35, 'Quilten', 'Quilting', 6),
(36, 'Wandteppich', 'Tapestry', 6),
(37, 'Webkunst', 'Weaving', 6),
(38, '3D Drucker Kunst', '3D Prints', 5),
(39, 'Fotografien', 'Photos', 1),
(40, 'Digitale Collage', 'Digital Collage', 1),
(41, 'Gemischte Materialien', 'Mixed materials', 3),
(42, 'Kunsthandwerk', 'Arts and crafts', 5),
(43, 'Fineliner', 'Fineliner', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(80) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `music` varchar(255) DEFAULT NULL,
  `interests` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `users_rights_id` bigint(11) NOT NULL DEFAULT 3,
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_employee` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` datetime DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_rights`
--

DROP TABLE IF EXISTS `users_rights`;
CREATE TABLE `users_rights` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL DEFAULT 1,
  `position` bigint(11) NOT NULL,
  `moderator_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(95) DEFAULT NULL,
  `shortname` varchar(50) NOT NULL,
  `view_table` text DEFAULT NULL,
  `add_table` text DEFAULT NULL,
  `edit_table` text DEFAULT NULL,
  `publish_table` text DEFAULT NULL,
  `date_table` text DEFAULT NULL,
  `delete_table` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `xkis_AdminPanel` tinyint(2) NOT NULL,
  `xkis_ChangePassword` tinyint(1) NOT NULL DEFAULT 0,
  `xkis_CommentsCenter` tinyint(1) NOT NULL DEFAULT 0,
  `xkis_DataBases` tinyint(1) NOT NULL,
  `xkis_LogViewer` tinyint(1) DEFAULT NULL,
  `xkis_SendMail` tinyint(1) NOT NULL DEFAULT 0,
  `xkis_UserRights` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_rights`
--

INSERT INTO `users_rights` (`id`, `pub`, `position`, `moderator_id`, `name`, `shortname`, `view_table`, `add_table`, `edit_table`, `publish_table`, `date_table`, `delete_table`, `updated_at`, `xkis_AdminPanel`, `xkis_ChangePassword`, `xkis_CommentsCenter`, `xkis_DataBases`, `xkis_LogViewer`, `xkis_SendMail`, `xkis_UserRights`) VALUES
(1, 1, 0, 1, 'Developer', 'dev', '11111111111111', '11110111111111', '11111111111111', '11111111111111', '11110111111111', '11111111111111', '2025-05-06 16:33:43', 1, 1, 1, 1, 1, 1, 1),
(2, 1, 1, 1, 'Administrator', 'adm', '01111111111110', '01110111111110', '01111111111110', '01111111111110', '01110111111110', '01111111111110', '2025-05-01 06:52:57', 1, 0, 1, 1, 0, 1, 0),
(3, 1, 2, 1, 'Moderator', 'mod', '00101101010100', '00100101010100', '00101101010100', '00101101010100', '00100101010100', '00101101010100', '2025-05-03 09:31:56', 1, 0, 1, 0, 0, 1, 0),
(4, 1, 3, 1, 'Trial', 'trial', '00000000001000', '00000000001000', '00000000001000', '00000000001000', '00000000001000', '00000000000000', '2025-04-27 08:54:19', 1, 0, 0, 1, 0, 0, 0),
(5, 1, 4, 1, 'Normal User', 'user', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '2025-04-17 14:32:16', 0, 0, 0, 0, NULL, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_images`
--
ALTER TABLE `blog_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `copyleft`
--
ALTER TABLE `copyleft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `didyouknow`
--
ALTER TABLE `didyouknow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image_categories`
--
ALTER TABLE `image_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artcat_Category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_rights`
--
ALTER TABLE `users_rights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `blog_authors`
--
ALTER TABLE `blog_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blog_images`
--
ALTER TABLE `blog_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=334;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `copyleft`
--
ALTER TABLE `copyleft`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `didyouknow`
--
ALTER TABLE `didyouknow`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `image_categories`
--
ALTER TABLE `image_categories`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `texts`
--
ALTER TABLE `texts`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_rights`
--
ALTER TABLE `users_rights`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `types`
--
ALTER TABLE `types`
  ADD CONSTRAINT `types_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;


INSERT INTO `users` (`id`, `first_name`, `nick_name`, `email`, `name`, `birthday`, `music`, `interests`, `occupation`, `email_verified_at`, `password`, `users_rights_id`, `profile_photo_path`, `is_admin`, `is_employee`, `is_customer`, `admin_id`, `company_id`, `customer_id`, `image_path`, `last_login_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `two_factor_enabled`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@example.com', 'Administrator', NULL, NULL, NULL, NULL, '2025-03-11 14:38:06', '$2y$12$tZaliTuKFNiFqhK/TTl7x.kKuAzj6dC.xVceEMWGJMa2TQRQ3uVnW', 1, NULL, 1, 0, 0, 1, NULL, NULL, NULL, '2025-04-10 16:47:35', NULL, NULL, NULL, 0, NULL, '2025-04-01 15:37:36', '2025-04-10 18:47:35');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
