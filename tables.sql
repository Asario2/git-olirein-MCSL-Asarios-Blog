-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 02:26 PM
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
  `table_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `published_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`id`, `pub`, `position`, `table_name`, `description`, `modul`, `created_at`, `published_at`, `updated_at`) VALUES
(2, 1, 1, 'blogs', 'Blog Posts', 'TesTModul', 1728395816, 0, 1725711767),
(15, 1, 11, 'users', 'Benutzer', NULL, 1727856000, 0, 1725711767),
(18, 1, 12, 'users_rights', 'Benutzerrechte', 'UserRights', NULL, 0, 1725711767),
(19, 1, 8, 'didyouknow', 'Wussten Sie Schon....?', NULL, 1725988470, 0, 1725711767),
(30, 1, 0, 'admin_table', 'This Table', NULL, 1725286348, 0, 1726160214),
(37, 1, 9, 'privacy', 'Datenschutzerklärung', NULL, 1725258218, 1727612054, 1727612054),
(78, 1, 5, 'texts', 'Texte für alle möglichen Seiten', NULL, 1729345863, 1729345863, 1729345863),
(87, 1, 10, 'shortpoems', 'Kurzgeschichten', NULL, 1730280017, 1730280017, 1730280017),
(90, 1, 6, 'images_categories', 'Kategorien der Bilder', NULL, 1730295254, 1730295254, 1730295254),
(93, 1, 3, 'images', 'Bilder', NULL, 1730295288, 1730295288, 1730295288),
(96, 1, 4, 'comments', 'Kommentare', NULL, 1732545944, 1732545944, 1732545944),
(99, 1, 7, 'camera', 'Kameras', NULL, 1733239885, 1733239885, 1733239885),
(102, 1, 2, 'blog_categories', 'Kategorien der Blogeinträge', NULL, 1734191775, 1734191775, 1734191775);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `blog_author_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `blog_date` datetime DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `reading_time` int(11) DEFAULT 3,
  `audio_on` tinyint(1) DEFAULT 0,
  `audio_url` varchar(100) DEFAULT NULL,
  `audio_duration` int(11) DEFAULT 0,
  `markdown_on` tinyint(1) DEFAULT 1,
  `blog_image_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `content`, `summary`, `blog_author_id`, `blog_date`, `slug`, `reading_time`, `audio_on`, `audio_url`, `audio_duration`, `markdown_on`, `blog_image_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'MCS 1.57 Released', 'Marble Content System Version 1.57 (Crazy Joana)  \r\nwurde ver&ouml;ffentlicht und auf der Lowmaxx Seite zu testzwecken installiert.  \r\n  \r\nDieses Release ist das erste offizielle Release und hat mich viel Zeit gekostet.  \r\nViele Features wurden hinzugef&uuml;gt einiges neuprogrammiert und verbessert.  \r\n  \r\nEine umfangreiche Dokumentation ist jetzt auch dabei und einige Features vereinfachen die Arbeit mit MCS erheblich.  \r\n  \r\ngenauere Infos siehe Link.', 'Marble Content System Version 1.57 (Crazy Joana)  \r\nwurde ver&ouml;ffentlicht und auf der Lowmaxx Seite zu testzwecken installiert.  \r\n  \r\nDieses Release ist das erste offizielle Release und hat mich viel Zeit gekostet.  \r\nViele Features wurden hinzugef&uuml;gt einiges neuprogrammiert und verbessert.  \r\n  \r\nEine &hellip;', 1, '2006-09-20 20:18:00', '29c2033ea3282e8661b61e4b91187724', 3, 0, NULL, 0, 1, 1, '2006-09-20 18:18:00', '2006-09-20 18:18:00'),
(2, 1, 'Wir Feiern Wir Feiern', 'Heute ist der Grosse Tag der Tag der erÃ¶ffnung von **asario.marblefx.de**, meinem PersÃ¶nlichen Blog.  \nMit allem was von mir ist oder mit mir zu tun hat.', 'Heute ist der Grosse Tag der Tag der erÃ¶ffnung von **asario.marblefx.de**, meinem PersÃ¶nlichen Blog.  \nMit allem was von mir ist oder mit mir zu tun hat.    ', 1, '2006-09-21 21:00:00', 'f4ba6049e367dba7873d85a6b9f9789c', 3, 0, NULL, 0, 1, 1, '2006-09-21 19:00:00', '2006-09-21 19:00:00'),
(3, 2, 'MCS 1.58 angefangen', 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei Doppelklick zu Fehlern kommen. <blockquote>\r\n       Edit: lag am FILE SIZE Limit\r\n    </blockquote>\r\n</li>\r\n <li>\r\n     Date funktion Funktioniert manchmal nicht, d.h. Datum wird nicht eingestellt obwohl es eine Datumsspalte gibt. <blockquote>\r\n       Edit:Bug gefunden lag am mangelndem Update in der Preview Funktion\r\n    </blockquote>\r\n  </li>\r\n</ul>', 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei &hellip;', 1, '2006-09-27 23:28:00', 'ce490a4b1f733a9c32cbd601050927ff', 3, 0, NULL, 0, 1, 1, '2006-09-27 21:28:00', '2006-09-27 21:28:00'),
(4, 1, 'Neue Fineliner Galerie', 'Unter [Images->Fineliner3](index.php?page=images&action=fineliner3) sind neue Bilder gesichtet worden ...  \nhave a look ;)', 'Unter [Images->Fineliner3](index.php?page=images&action=fineliner3) sind neue Bilder gesichtet worden ...  \nhave a look ;)    ', 1, '2007-06-04 19:32:00', '819ef050fba2e8cb1db56c75fcbc84de', 3, 0, NULL, 0, 1, 1, '2007-06-04 17:32:00', '2007-06-04 17:32:00'),
(5, 2, 'MCS 1.59 workin', 'Wir sind am Arbeiten was MCS 1.59 angeht.  \neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  \nPrivate Messages kommen alle noch in dieses Release mit rein  \n  \nfieser Bug in der Welcome gefunden und gelöst', 'Wir sind am Arbeiten was MCS 1.59 angeht.  \neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  \nPrivate Messages kommen alle noch in dieses Release mit rein  \n  \nfieser Bug in der Welcome gefunden und gelöst  ', 1, '2008-01-07 23:16:00', '080c719b8e5492e6173077c3b0bf9719', 3, 0, NULL, 0, 1, 1, '2008-01-07 22:16:00', '2008-01-07 22:16:00'),
(6, 3, 'PalivaRedesign', 'Schon wieder ne durchzechte Nacht wegen ner Website,  \nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren während andere Schlummern.  \naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate  \nund das über Nacht.  \n  \nUnd wann kommt endlich mein c\'T Abo an ?', 'Schon wieder ne durchzechte Nacht wegen ner Website,  \nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren während andere Schlummern.  \naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate  \nund das über Nacht.  \n  \nUnd wann kommt endlich mein c\'T Abo an ? &hellip;', 1, '2008-01-14 11:02:00', '5224ccf4def072422ca732d7af2155b6', 3, 0, NULL, 0, 1, 1, '2008-01-14 10:02:00', '2008-01-14 10:02:00'),
(7, 3, 'Weiteres Projekt bei mederius', 'Nun solls ne Zeitung werden  \nlayout 1 steht', 'Nun solls ne Zeitung werden  \nlayout 1 steht      ', 1, '2008-01-15 10:48:00', 'cfad224967f73d33f4483d27fc36d090', 3, 0, NULL, 0, 1, 1, '2008-01-15 09:48:00', '2008-01-15 09:48:00'),
(8, 3, 'Rotten Psychos Redesign', 'Bin am Überlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....  \nRotten-Psychos ist bzw war ein Clan aus meiner \"Beben 3 Arena\" Zeit.  \n  \n_edit:_  \nClanpage is zu 90% fertig', 'Bin am Überlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....  \nRotten-Psychos ist bzw war ein Clan aus meiner \"Beben 3 Arena\" Zeit.  \n  \n_edit:_  \nClanpage is zu 90% fertig   ', 1, '2008-01-27 10:00:00', 'f1a651250f8a04a6befd6a7ebf8d51ec', 3, 0, NULL, 0, 1, 1, '2008-01-27 09:00:00', '2008-01-27 09:00:00'),
(9, 3, 'Is schon irre was man so macht', 'Rotten Psychos ist f&uuml;r mich eine der besten Zeiten gewesen die ich hatte.  \r\nDamals war DSL noch Teuer und man freute sich &uuml;ber jedes 1on1  \r\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut', 'Rotten Psychos ist f&uuml;r mich eine der besten Zeiten gewesen die ich hatte.  \r\nDamals war DSL noch Teuer und man freute sich &uuml;ber jedes 1on1  \r\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut  ', 1, '2008-02-17 12:56:00', 'a6aace2e58518a59116ebd8f6d605c32', 3, 0, NULL, 0, 1, 1, '2008-02-17 11:56:00', '2008-02-17 11:56:00'),
(10, 1, 'How Tough - Rotten-Psychos online', 'Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.  \nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.  \nZur Zeit feile ich an der Neuen <a target=\"rotte\" href=\"http://www.rotten-psychos.de\">Rotten Psychos Seite</a> und das RP-Forum ist fast fertig.  \nDas Forum ist eine Eigenentwicklung auf MCS Basis.  \nHat mich ne menge Zeit gekostet bis alles so funktionierte wie gedacht.  \nAber ich habs geschafft die Fehler die sich versteckt hatten zu finden.', 'Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.  \nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.  \nZur Zeit feile ich an der Neuen <a target=\"rotte\" href=\"http://www.rotten-psychos.de\">Rotten Psychos Seite</a> und das RP-Forum ist fast fertig.  \nDas Forum &hellip;', 1, '2008-11-28 12:27:00', 'e87fb57a53d4b1cbe19013ab0db1d4ae', 3, 0, NULL, 0, 1, 1, '2008-11-28 11:27:00', '2008-11-28 11:27:00'),
(11, 1, 'How Real', 'Es ist mal wieder eine neue Seite fertig geworden.  \nunter [www.freundeskreis-spiegelbild.de](http://www.freundeskreis-spiegelbild.de) findet ihr alles zum Förderverein Freundeskreis Spiegelbild', 'Es ist mal wieder eine neue Seite fertig geworden.  \nunter [www.freundeskreis-spiegelbild.de](http://www.freundeskreis-spiegelbild.de) findet ihr alles zum Förderverein Freundeskreis Spiegelbild  ', 1, '2010-01-10 11:41:00', '7071bbc1905f12d7b6d64f940df4bf1e', 3, 0, NULL, 0, 1, 1, '2010-01-10 10:41:00', '2010-01-10 10:41:00'),
(12, 2, 'MCS 1.61 workin', 'Marble Content System ist in version 1.61 erschienen.  \nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  \n  \nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>', 'Marble Content System ist in version 1.61 erschienen.  \nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  \n  \nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>  ', 1, '2010-01-12 18:09:00', '3e98b9fbcd5bc9d6cf6147773e4557fa', 3, 0, NULL, 0, 1, 1, '2010-01-12 17:09:00', '2010-01-12 17:09:00'),
(13, 1, 'Happy Birthday Asario', 'Herzlichen Glückwunsch Lieber Asario zum 27. Geburtstag.  \nDer Tag war schön und das Wetter ging auch in Ordnung.  \nFreue mich schon auf den Sommer.  \nHabe nette Sachen geschenk bekommen und demnächst lad ich noch 1-2 Fineliner-Bilder hoch.  \nHabt Spass, in liebe euer Asario.', 'Herzlichen Glückwunsch Lieber Asario zum 27. Geburtstag.  \nDer Tag war schön und das Wetter ging auch in Ordnung.  \nFreue mich schon auf den Sommer.  \nHabe nette Sachen geschenk bekommen und demnächst lad ich noch 1-2 Fineliner-Bilder hoch.  \nHabt Spass, in liebe euer Asario. &hellip;', 1, '2010-06-19 22:31:00', '99bd104be1eee60947dabcce6ad10727', 3, 0, NULL, 0, 1, 1, '2010-06-19 20:31:00', '2010-06-19 20:31:00'),
(14, 1, 'Neue Bilder', 'Habe 1 neues Wallpaper unter [Digital Art](index.php?pae=images&action=digital) und 2 Fineliner Artworks unter [Fineliner 4](index.php?pae=images&action=fineliner4) hochgeladen.  \n  \nWünsche euch viel spass mit den Bildern.', 'Habe 1 neues Wallpaper unter [Digital Art](index.php?pae=images&action=digital) und 2 Fineliner Artworks unter [Fineliner 4](index.php?pae=images&action=fineliner4) hochgeladen.  \n  \nWünsche euch viel spass mit den Bildern.  ', 1, '2010-08-14 22:31:00', '3402dede9d08dacbbe43c35407ad4afd', 3, 0, NULL, 0, 1, 1, '2010-08-14 20:31:00', '2010-08-14 20:31:00'),
(15, 1, 'Merry X-Mas and a happy  new Year', 'Hiermit wünsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.  \n  \nhabt Spass, bis bald, euer Asario', 'Hiermit wünsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.  \n  \nhabt Spass, bis bald, euer Asario    ', 1, '2010-12-26 15:35:00', 'a04fcfa3e53019b75561bb7fc28d67be', 3, 0, NULL, 0, 1, 1, '2010-12-26 14:35:00', '2010-12-26 14:35:00'),
(16, 2, 'MCS 1.63 Workin', 'MCS 1.63 ist nun verfügbar.  \neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  \n  \nWünsche viel spass mit meinem Blog.', 'MCS 1.63 ist nun verfügbar.  \neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  \n  \nWünsche viel spass mit meinem Blog.    ', 1, '2011-06-27 19:33:00', '8c858125470a24e05d189e62874c43f9', 3, 0, NULL, 0, 1, 1, '2011-06-27 17:33:00', '2011-06-27 17:33:00'),
(17, 1, 'Neue (alte) Bilder unter Fineliner4', 'Hier ein paar neue Fineliner Artworks.  \nBei der Scanqualität musste ich leider etwas nachbearbeiten.  \nHoffe sie gefallen euch.  \nAuf Bald euer Asario', 'Hier ein paar neue Fineliner Artworks.  \nBei der Scanqualität musste ich leider etwas nachbearbeiten.  \nHoffe sie gefallen euch.  \nAuf Bald euer Asario    ', 1, '2011-06-27 19:35:00', '7652bbbf46050a2c0e8d0894792c2aa0', 3, 0, NULL, 0, 1, 1, '2011-06-27 17:35:00', '2011-06-27 17:35:00'),
(18, 3, 'Bin wieder Online....', 'Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,  \nd.h. ich bin wieder dabei.', 'Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,  \nd.h. ich bin wieder dabei.     ', 1, '2011-06-27 19:49:00', '3206d174d66b122c35ad325b4ba49b87', 3, 0, NULL, 0, 1, 1, '2011-06-27 17:49:00', '2011-06-27 17:49:00'),
(19, 2, 'MCS Update steht bevor....', 'Also hier mal wieder ein paar News aus der Devlog Ecke.  \nDie Entwicklung von MCS 1.64 ist angelaufen....  \nGeplant sind einige nette Features zwecks Private Messaging.  \nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  \nweitere Infos demnächst Hier...', 'Also hier mal wieder ein paar News aus der Devlog Ecke.  \nDie Entwicklung von MCS 1.64 ist angelaufen....  \nGeplant sind einige nette Features zwecks Private Messaging.  \nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  \nweitere Infos demnächst Hier... &hellip;', 1, '2011-07-29 18:30:00', '2a0227a2585cb3889d54180b0b5601f0', 3, 0, NULL, 0, 1, 1, '2011-07-29 16:30:00', '2011-07-29 16:30:00'),
(20, 2, 'news from MCS', 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  \nso das niemand eine PM verpasst.  \nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  \nund in Asarios Blog implementiert.  \n(ich arbeite noch dran)...', 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  \nso das niemand eine PM verpasst.  \nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  \nund in Asarios Blog implementiert.  \n(ich arbeite noch dran)... &hellip;', 1, '2011-08-11 19:38:00', '1be8f91a62e9ed9ddbdd3bc825ba2322', 3, 0, NULL, 0, 1, 1, '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(21, 2, 'MCS version 1.67 Released', 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  \nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  \n  \nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  \n  \nMCS ist jetzt Multilanguage fÃ¤hig.  \n  \nVieles Neues kam dazu, altes wurde verbessert.', 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  \nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  \n  \nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  \n  \nMCS ist jetzt Multilanguage fÃ¤hig.  \n  \nVieles Neues kam dazu, altes &hellip;', 1, '2011-08-11 19:38:00', '10df6140be8b21472264b095912de0a4', 3, 0, NULL, 0, 1, 1, '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(22, 1, 'Neue Shortstorie gesichtet & 2 neue Photos', 'Hab ma wieder [was geschrieben](%5C\'index.php?page=shortstories%5C) und [2 Photos](%5C\'index.php?page=images&action=photos%5C) hochgeladen.  \nHabt Spass, euer Asario', 'Hab ma wieder [was geschrieben](%5C\'index.php?page=shortstories%5C) und [2 Photos](%5C\'index.php?page=images&action=photos%5C) hochgeladen.  \nHabt Spass, euer Asario   ', 1, '2011-09-25 16:54:00', 'fbac8ff9e350b045355eec28916176d9', 3, 0, NULL, 0, 1, 1, '2011-09-25 14:54:00', '2011-09-25 14:54:00'),
(23, 1, 'neue Fineliner Artworks', 'Ich habe ein paar [Artworks von 2011](%5C\'index.php?page=images&action=fineliner4%5C\') hochgeladen.  \nWünsche viel Spass, Asario.', 'Ich habe ein paar [Artworks von 2011](%5C\'index.php?page=images&action=fineliner4%5C\') hochgeladen.  \nWünsche viel Spass, Asario.    ', 1, '2011-10-28 20:43:00', '31f889ccae7aed4764b13b5c4f45ed78', 3, 0, NULL, 0, 1, 1, '2011-10-28 18:43:00', '2011-10-28 18:43:00'),
(24, 1, 'Neues Fineliner Pic', 'Hab mal wieder nen Bild gefunden und hochgeladen.  \nHabt Spaß, euer Asario', 'Hab mal wieder nen Bild gefunden und hochgeladen.  \nHabt Spaß, euer Asario     ', 1, '2011-12-04 19:58:00', '9e29031600cde17f027211af76b74092', 3, 0, NULL, 0, 1, 1, '2011-12-04 18:58:00', '2011-12-04 18:58:00'),
(25, 1, 'Happy New Year !', 'Allen Besuchern und Freunden wünsche ich ein schönes neues Jahr.  \n  \nHabt Spaß, auch in 2012.  \n  \nIn Liebe, euer Asario', 'Allen Besuchern und Freunden wünsche ich ein schönes neues Jahr.  \n  \nHabt Spaß, auch in 2012.  \n  \nIn Liebe, euer Asario    ', 1, '2012-01-01 19:54:00', 'f874ee878f4863a68a3e12f2a3a850bb', 3, 0, NULL, 0, 1, 1, '2012-01-01 18:54:00', '2012-01-01 18:54:00'),
(26, 1, 'Neues bei mir.', 'Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.  \n  \nWünsche viel Spaß damit, euer Asario.', 'Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.  \n  \nWünsche viel Spaß damit, euer Asario.     ', 1, '2012-02-12 20:23:00', '6e211e11d69e89e6740691bf9017d62f', 3, 0, NULL, 0, 1, 1, '2012-02-12 19:23:00', '2012-02-12 19:23:00'),
(27, 1, 'Alles Neue macht der August', 'Also wir haben jetzt das Update zu Version 1.67 vollzogen.  \nviele kleine neuen Sachen sind jetzt dabei.  \nich wÃ¼nsch euch viel SpaÃŸ in Asarios Blog', 'Also wir haben jetzt das Update zu Version 1.67 vollzogen.  \nviele kleine neuen Sachen sind jetzt dabei.  \nich wÃ¼nsch euch viel SpaÃŸ in Asarios Blog    ', 1, '2012-08-21 15:43:00', '23cd01309dd069a8b82992b975c7a8f3', 3, 0, NULL, 0, 1, 1, '2012-08-21 13:43:00', '2012-08-21 13:43:00'),
(28, 1, 'Neues Design, neue Funktionen, neue Innovationen', 'Habe in meiner Schublade noch Bilder gefunden und hochgeladen.  \nHoffe Sie gefallen euch.  \n  \nviel Spass Asario', 'Habe in meiner Schublade noch Bilder gefunden und hochgeladen.  \nHoffe Sie gefallen euch.  \n  \nviel Spass Asario    ', 1, '2012-09-09 19:46:00', '87d055aa557b17827914ca38c29dc475', 3, 0, NULL, 0, 1, 1, '2012-09-09 17:46:00', '2012-09-09 17:46:00'),
(29, 1, 'Neue Funktion in Asarios Blog', 'Newsfeeds sind jetzt im Abo erhÃ¤ltlich,  \nzu finden Rechts unter Benutzerliste.  \n  \nWÃ¼nsch euch viel SpaÃŸ mit den Feeds', 'Newsfeeds sind jetzt im Abo erhÃ¤ltlich,  \nzu finden Rechts unter Benutzerliste.  \n  \nWÃ¼nsch euch viel SpaÃŸ mit den Feeds    ', 1, '2012-11-22 20:50:00', 'a7e3648f062f3b72d664ac1331377391', 3, 0, NULL, 0, 1, 1, '2012-11-22 19:50:00', '2012-11-22 19:50:00'),
(30, 1, 'Neue Bilder gesichtet.', 'unter Images->Digital und unter Images->Acryl sind neue Bilder gesichtet worden,  \nhabt SpaÃŸ, Asario', 'unter Images->Digital und unter Images->Acryl sind neue Bilder gesichtet worden,  \nhabt SpaÃŸ, Asario     ', 1, '2012-12-02 20:17:00', '94c2b0b0fd97669d8e56938ed3fe7b81', 3, 0, NULL, 0, 1, 1, '2012-12-02 19:17:00', '2012-12-02 19:17:00'),
(31, 1, 'Hab noch mal gekramt....', '... und neue Bilder gefunden.  \nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.  \n  \nAch ja, ein schÃ¶nes neues Jahr an alle.', '... und neue Bilder gefunden.  \nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.  \n  \nAch ja, ein schÃ¶nes neues Jahr an alle.    ', 1, '2013-01-06 20:31:00', '940dbcf8951ebe1fa1585d479893774c', 3, 0, NULL, 0, 1, 1, '2013-01-06 19:31:00', '2013-01-06 19:31:00'),
(32, 1, 'Wieder was von der Bilderfront.', 'Unter Images->Photos2 ist eine neue Galerie entstanden.  \nUnter Images->Acryl ist ein neues Bild.  \nUnter Images->Sketches ist eine neue Skizze.  \nUnter Images->Digital ist ein neues Wallpaper.  \n  \nViel Spass mit den Bildern, Asario', 'Unter Images->Photos2 ist eine neue Galerie entstanden.  \nUnter Images->Acryl ist ein neues Bild.  \nUnter Images->Sketches ist eine neue Skizze.  \nUnter Images->Digital ist ein neues Wallpaper.  \n  \nViel Spass mit den Bildern, Asario  ', 1, '2013-01-27 20:06:00', '22530b8457ef0e9fc8c9acf79a986174', 3, 0, NULL, 0, 1, 33, '2013-01-27 19:06:00', '2013-01-27 19:06:00'),
(33, 1, 'Wie man aus 4 LeinwÃ¤nden 1 Lichtobjekt macht....', '... Seht ihr unter Images->Lampen  \nUns kam die Idee aus einem \"neverending Paul\" Bild eine Lampe zu fertigen.  \nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.  \n  \nedit: Die Winkel haben wir jetzt, die mÃ¼ssen nur noch gebohrt und montiert werden.  \n  \nWÃ¼nsche viel Spass damit, euer Asario', '... Seht ihr unter Images->Lampen  \nUns kam die Idee aus einem \"neverending Paul\" Bild eine Lampe zu fertigen.  \nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.  \n  \nedit: Die Winkel haben wir jetzt, die mÃ¼ssen nur noch gebohrt und montiert werden.  \n  \nWÃ¼nsche viel Spass damit, &hellip;', 1, '2013-05-20 19:26:00', 'bb838e8469ee288fb30cd0500fac64fc', 3, 0, NULL, 0, 1, 34, '2013-05-20 17:26:00', '2013-05-20 17:26:00'),
(34, 3, 'Neuer Fernseher in Asarios Home Office.', 'Ich habe mir mal was gegÃ¶nnt und mir einen neuen Fernseher gekauft.  \nDaten:  \nGrÃ¶sse: 47\' (119cm)  \nLAN, 3D, FullHD, Smart TV Funktionen  \n  \nJetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.  \nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich mal mein Herz ausschÃ¼tten', 'Ich habe mir mal was gegÃ¶nnt und mir einen neuen Fernseher gekauft.  \nDaten:  \nGrÃ¶sse: 47\' (119cm)  \nLAN, 3D, FullHD, Smart TV Funktionen  \n  \nJetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.  \nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich &hellip;', 1, '2013-05-20 19:52:00', '4ca5b52d88f022e441de09abdb8a6d5e', 3, 0, NULL, 0, 1, 35, '2013-05-20 17:52:00', '2013-05-20 17:52:00'),
(35, 2, 'MCS v. 1.68 released', 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  \nMCS version 1.68 (Honkey Donkey) wurde installiert.  \n  \nZu den Features zählen:  \n-Neue Icons im Admincenter  \n-Benutzerinhalte Funktionen  \nsowie mehrere kleine eliminierte Fehler  \n  \nMehr Informationen im Changelog auf www.marblefx.de', 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  \nMCS version 1.68 (Honkey Donkey) wurde installiert.  \n  \nZu den Features zählen:  \n-Neue Icons im Admincenter  \n-Benutzerinhalte Funktionen  \nsowie mehrere kleine eliminierte Fehler  \n  \nMehr Informationen im Changelog auf www.marblefx.de &hellip;', 1, '2013-06-23 21:37:00', '8b597627d1eeb5d893d150cecadd1494', 3, 0, NULL, 0, 1, 1, '2013-06-23 19:37:00', '2013-06-23 19:37:00'),
(36, 1, 'Smilies all over the World', 'Ab jetzt seht ihr Ã¼berall Smilies wo auch immer sie geschrieben wurden.  \nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)', 'Ab jetzt seht ihr Ã¼berall Smilies wo auch immer sie geschrieben wurden.  \nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)    ', 1, '2013-06-23 21:38:00', '7827de3fd2c40e016e33585d024382f5', 3, 0, NULL, 0, 1, 37, '2013-06-23 19:38:00', '2013-06-23 19:38:00'),
(37, 1, 'Alles Neue Macht der Juli.', 'In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.  \nIhr findet Sie unter Images->Photos2', 'In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.  \nIhr findet Sie unter Images->Photos2    ', 1, '2013-07-14 19:55:00', 'c7257ed3b6ce1859ad172640c3b372ef', 3, 0, NULL, 0, 1, 38, '2013-07-14 17:55:00', '2013-07-14 17:55:00'),
(38, 3, 'Der Fernseher h&auml;ngt an der Wand ;)', 'Ja er hängt noch, er hängt noch für mich....  \nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)  \nUnd mein neuer 3D-BluRay Player rockt auch derbst.  \nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.  \nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.  \n  \ngl&hf Paul', 'Ja er hängt noch, er hängt noch für mich....  \nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)  \nUnd mein neuer 3D-BluRay Player rockt auch derbst.  \nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.  \nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.  \n  \ngl&hf Paul &hellip;', 1, '2013-08-11 20:00:00', 'a7b8722e2506176851a0ef8fa97dcff3', 3, 0, NULL, 0, 1, 39, '2013-08-11 18:00:00', '2013-08-11 18:00:00'),
(39, 1, 'Frohes Neues - 2014 - ein GlÃ¼cksjahr', 'Ich habe unter Images->Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,  \nIch hoffe bei euch war der Weihnachtsmann auch so fleiÃŸig wie bei mir.  \nAllen Besuchern meiner Seite wÃ¼nsche ich gut reingerutscht zu sein und ein schÃ¶nes neues Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, euer Asario.  \n  \nViele GrÃ¼sse auch von \"the cat\" Elke aus Potsdam ;)', 'Ich habe unter Images->Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,  \nIch hoffe bei euch war der Weihnachtsmann auch so fleiÃŸig wie bei mir.  \nAllen Besuchern meiner Seite wÃ¼nsche ich gut reingerutscht zu sein und ein schÃ¶nes neues Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, euer Asario.  \n  \nViele GrÃ¼sse auch von &hellip;', 1, '2014-01-05 19:14:00', 'c6c6687abfd057fa7d752f23df3ae670', 3, 0, NULL, 0, 1, 40, '2014-01-05 18:14:00', '2014-01-05 18:14:00'),
(40, 1, 'Neues Layout !', 'Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylemÃ¤ssig erneuert.  \nUnd eine Neue Galerie hat sich angefunden.  \nMehr unter Images->Lampen', 'Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylemÃ¤ssig erneuert.  \nUnd eine Neue Galerie hat sich angefunden.  \nMehr unter Images->Lampen    ', 1, '2014-02-10 20:02:00', 'e6f376d84ac0f7a03f236a7c71871067', 3, 0, NULL, 0, 1, 41, '2014-02-10 19:02:00', '2014-02-10 19:02:00'),
(41, 2, 'MCS v. 1.69 Online', 'Marble Content System wurde auf Version 1.69 aktualisiert.  \nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  \nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  \nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine Funktionen fanden den Weg ins 1.69er Release.  \nWenn euch was auffÃ¤llt schreibt mir auf www.mfx.marblefx.de/index.php?page=contact  \nIch wÃ¼nsche euch viel Spass auf meinen Seiten.  \n  \nAsario', 'Marble Content System wurde auf Version 1.69 aktualisiert.  \nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  \nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  \nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine &hellip;', 1, '2014-03-02 20:04:00', 'bff93cc3f7057f6758e3c1474d9d8f1b', 3, 0, NULL, 0, 1, 1, '2014-03-02 19:04:00', '2014-03-02 19:04:00'),
(42, 1, 'Ausstellung in Kaltenkirchen', 'Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃ¶ffnet. Bei ca. 40 geladenen GÃ¤sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde Ã¼ber Kunst in der Psychatrie gesprochen sowie auf einzelne KÃ¼nstler eingegangen.  \n  \nDie Ausstellung lÃ¤uft noch 6 Wochen und es sind etliche KÃ¼nstler des Malerateliers zu sehen und auch zu Kaufen was \"wir\" alles so gemalt und kreiert haben.  \nÃ–ffnungszeiten sind montags bis donnerstags von 8:30 Uhr bis 18 Uhr sowie freitags von 8:30 Uhr bis 16:00 Uhr  \n  \nVon mir sind 3 Kunstwerke ausgestellt welche das sind seht Ihr wenn ihr da seid ;)  \nVon Hier aus noch mal Danke an Chris die das alles mÃ¶glich gemacht hat.;)', 'Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃ¶ffnet. Bei ca. 40 geladenen GÃ¤sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde Ã¼ber Kunst in der Psychatrie gesprochen sowie auf einzelne KÃ¼nstler eingegangen.  \n  \nDie Ausstellung lÃ¤uft noch 6 Wochen und es sind &hellip;', 1, '2014-03-31 19:07:00', '37061081d94b406a09b0bee3397f035b', 3, 0, NULL, 0, 1, 43, '2014-03-31 17:07:00', '2014-03-31 17:07:00'),
(43, 2, 'Misteri&ouml;se Schatten werfen Ihr Licht auf uns....', 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.', 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.  ', 1, '2014-04-13 19:35:00', '70c7cfef34f3922705d9a6d22c5c6e9b', 3, 0, NULL, 0, 1, 1, '2014-04-13 17:35:00', '2014-04-13 17:35:00'),
(44, 1, 'Frohe Ostern... Der Osterhase war da!', 'Allen Besuchern wÃ¼nsche ich, frohe  \nOstern gehabt zu haben, Ich habe 2  \nneue Photos Hochgeladen.... viel  \nSpaÃŸ damit euer Asarioâ€¦', 'Allen Besuchern wÃ¼nsche ich, frohe  \nOstern gehabt zu haben, Ich habe 2  \nneue Photos Hochgeladen.... viel  \nSpaÃŸ damit euer Asarioâ€¦    ', 1, '2014-04-27 19:36:00', '327c377574dd80904f59608c69b2d924', 3, 0, NULL, 0, 1, 45, '2014-04-27 17:36:00', '2014-04-27 17:36:00'),
(45, 1, '3 neue Galerien', 'Ich erÃ¶ffne Hiermit die Galerien **Alphabet**, **Monstarz** und **Photos3**  \nhab eine Menge neuer Bilder hochgeladen, viel SpaÃŸ damit euer Asario.', 'Ich erÃ¶ffne Hiermit die Galerien **Alphabet**, **Monstarz** und **Photos3**  \nhab eine Menge neuer Bilder hochgeladen, viel SpaÃŸ damit euer Asario.    ', 1, '2014-06-17 19:31:00', '85fe98376c4985096c1188bfa4920b0c', 3, 0, NULL, 0, 1, 46, '2014-06-17 17:31:00', '2014-06-17 17:31:00'),
(46, 1, 'Bewertungsfunktion fÃ¼r Bilder.', 'Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.  \nAlle Meine Bilder kÃ¶nnt Ihr bewerten und sehen wie Sie ankommen.  \nViel SpaÃŸ damit, euer Asario', 'Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.  \nAlle Meine Bilder kÃ¶nnt Ihr bewerten und sehen wie Sie ankommen.  \nViel SpaÃŸ damit, euer Asario   ', 1, '2014-08-25 19:49:00', 'c1c70865938aeccad492f69f5708d2eb', 3, 0, NULL, 0, 1, 47, '2014-08-25 17:49:00', '2014-08-25 17:49:00'),
(47, 3, 'Mein neues Bike', 'Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.  \nEs fährt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gepäckträger und Kunststoffschutzbleche sowie jede Menge Fahrspaß inklusive.  \n  \nIch bin Stolz auf dieses tolle Teil.', 'Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.  \nEs fährt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gepäckträger und Kunststoffschutzbleche sowie jede Menge Fahrspaß &hellip;', 1, '2014-10-19 19:29:00', '8afb6b96cad226351512649051b1448e', 3, 0, NULL, 0, 1, 48, '2014-10-19 17:29:00', '2014-10-19 17:29:00'),
(48, 2, 'MCS v. 1.70 released', 'Die Neueste MCS Version ist Nr. 1.70.  \nIn diesem Release wurde einiges neu gemacht.  \nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  \nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  \nMehr infos siehe Changelog  \nIch hoffe Ihr habt eure Freude an diesem Release.', 'Die Neueste MCS Version ist Nr. 1.70.  \nIn diesem Release wurde einiges neu gemacht.  \nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  \nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  \nMehr infos siehe Changelog  &hellip;', 1, '2014-10-25 18:14:00', 'eaeedee2d1ba00382633ef4238663272', 3, 0, NULL, 0, 1, 1, '2014-10-25 16:14:00', '2014-10-25 16:14:00'),
(49, 1, 'New Images', 'Unter Images sind neue Bilder gesichtet worden,  \nund eine neue Galerie wurde erÃ¶ffnet.  \nDie Monstarnational Galerie mit Bildern vom Monstar in der groÃŸen weiten Welt.  \nHoffe Ihr habt SpaÃŸ damit, Asario', 'Unter Images sind neue Bilder gesichtet worden,  \nund eine neue Galerie wurde erÃ¶ffnet.  \nDie Monstarnational Galerie mit Bildern vom Monstar in der groÃŸen weiten Welt.  \nHoffe Ihr habt SpaÃŸ damit, Asario  ', 1, '2014-11-02 15:33:00', 'fcea25b2d04b431ed53ec2531251a292', 3, 0, NULL, 0, 1, 50, '2014-11-02 14:33:00', '2014-11-02 14:33:00'),
(50, 3, 'Mein erster Ritt...', 'In meinem Urlaub war ich das erste mal in meinem Leben \"selbstÃ¤ndig\" Reiten,  \nEs macht Irre SpaÃŸ, ist aber doch gewÃ¶hnungsbedÃ¼rftig sprich ich habe Respekt vor dem Tier.  \n  \nRispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃ¶rperspannung muss ich noch arbeiten.  \n  \nPS: Reiten ist Geil ;)', 'In meinem Urlaub war ich das erste mal in meinem Leben \"selbstÃ¤ndig\" Reiten,  \nEs macht Irre SpaÃŸ, ist aber doch gewÃ¶hnungsbedÃ¼rftig sprich ich habe Respekt vor dem Tier.  \n  \nRispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃ¶rperspannung muss ich noch arbeiten.  \n  \nPS: Reiten ist Geil ;) &hellip;', 1, '2014-11-16 18:49:00', '110448b8e51065dd1566d30c78837ce1', 3, 0, NULL, 0, 1, 51, '2014-11-16 17:49:00', '2014-11-16 17:49:00'),
(51, 1, 'Frohe Weihnachten und einen...', 'guten Rutsch ins neue Jahr.  \nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.  \nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein groÃŸes Event und viel SpaÃŸ fÃ¼r uns.  \nIch wÃ¼nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.  \nViele GrÃ¼ÃŸe aus Bad Segeberg, BimÃ¶hlen und Potsdam, Asario', 'guten Rutsch ins neue Jahr.  \nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.  \nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein groÃŸes Event und viel SpaÃŸ fÃ¼r uns.  \nIch wÃ¼nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.  \nViele GrÃ¼ÃŸe aus Bad &hellip;', 1, '2014-12-05 19:30:00', 'dde11d6bd610a0588eef83c68f5f6ea7', 3, 0, NULL, 0, 1, 52, '2014-12-05 18:30:00', '2014-12-05 18:30:00'),
(52, 1, 'Der FrÃ¼hling kommt.', 'Wie Ihr auf dem Bild seht ist schon wieder alles GrÃ¼n.  \nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.  \nIhr findet Sie wie immer Ã¼ber den Roten Button rechts oben auf dieser Seite.  \nIch hoffe Ihr genieÃŸt das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.  \n  \nAch ja, unter Mindblog gibt es ne Geschichte Ã¼ber mich und mein Leben.  \nPart I ist Online, Part II kommt demnÃ¤chst  \nViele GrÃ¼ÃŸe aus dem sonnigen BimÃ¶hlen, euer Asario', 'Wie Ihr auf dem Bild seht ist schon wieder alles GrÃ¼n.  \nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.  \nIhr findet Sie wie immer Ã¼ber den Roten Button rechts oben auf dieser Seite.  \nIch hoffe Ihr genieÃŸt das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.  \n  \nAch ja, unter &hellip;', 1, '2015-03-20 18:49:00', '966ab1d63e82d3d47eba16e36e51a567', 3, 0, NULL, 0, 1, 53, '2015-03-20 17:49:00', '2015-03-20 17:49:00'),
(53, 0, 'Asario\'s Geschichte Part I', 'Alles fing mit einem verkorksten 16. Geburtstag an.  \nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.  \nEs waren die Punks vom See mit Ihren Hunden.  \nIch spielte mit den Hunden und kam ins GesprÃ¤ch-  \nWir redeten Ã¼ber meinen Geburtstag und Sie fragten mich ob ich nicht mit in Ihre Kneipe kommen wÃ¼rde.  \nIch sagte zu. Von da an war ich Ã¶fter in der Kneipe. Es waren verstÃ¤ndnisvolle Menschen die vÃ¶llig natÃ¼rlich und nett waren. Ich fÃ¼hlte mich geborgen bei Ihnen.  \n  \nNicht so wie bei meinen Eltern, wo nur Ehe-Krach und Scheidungsstreitigkeiten an der Tagesordnung waren.  \nWenn ein Mensch Geborgenheit sucht und nichts ausser zerrÃ¼tteter VerhÃ¤ltnisse bekommt sucht man sich immer einen Ruhepol.  \nDen hatte ich in dieser besagten Kneipe gefunden. Viele Hunde, nette Menschen und Party Party Party war das was ich da hatte.  \n  \nDie Partys waren eine gute MÃ¶glichkeit mich abzulenken. Ich trank ein Paar Bier und schon ging es mir viel Besser.  \nZwar war das GefÃ¼hl nur fÃ¼r einen Moment vorhanden aber ich hatte meinen SpaÃŸ.  \n  \nMeine Leistungen in der Schule gingen rapide Bergab. Ich hatte einfach keine Lust es meinen Eltern Recht zu machen und in der Schule aufzupassen.  \nIch entwickelte mich immer mehr von einem guten SchÃ¼ler zu einen Klassenclown.  \nWIeso sollte ich meinem Traum vom Meeresbiologen denn weiter TrÃ¤umen wenn meine Eltern es nicht mal schaffen zusammenzuhalten ?  \n  \nIch war frustriert und Lustlos von all dem ganzen Zeug.  \nNur meine Punkerfreunde waren fÃ¼r mich da und machten mir Mut das irgendwann Licht am Ende des Tunnels sei.  \n  \nIch hatte eine Zweite Familie gefunden.  \n  \nto be continued', 'Alles fing mit einem verkorksten 16. Geburtstag an.  \nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.  \nEs waren die Punks vom See mit Ihren Hunden.  \nIch spielte mit den Hunden und kam ins GesprÃ¤ch-  \nWir redeten Ã¼ber meinen Geburtstag und Sie fragten mich ob ich nicht mit &hellip;', 1, '2015-03-20 18:51:00', '5847fe96b9f3c8433ce7705adbf82199', 3, 0, NULL, 0, 1, 1, '2015-03-20 17:51:00', '2015-03-20 17:51:00'),
(54, 2, 'MCS v. 1.72 Ver&ouml;fentlicht', 'Joa, hab mal wieder ne neue Version released.  \nhinzugekommen sind:  \n- ein neues Anti Spam Modul  \n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  \n- Signatureinstellungen automatisiert.  \n  \nAußerdem habe ich Fehler beseitigt im  \n- Benutzerprofil  \n- Meta Tags Scripts  \n- Searching Scripts  \n  \nsowie mehrere kleine Bugs im System.', 'Joa, hab mal wieder ne neue Version released.  \nhinzugekommen sind:  \n- ein neues Anti Spam Modul  \n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  \n- Signatureinstellungen automatisiert.  \n  \nAußerdem habe ich Fehler beseitigt im  \n- Benutzerprofil  \n- Meta Tags Scripts  \n- Searching &hellip;', 1, '2015-03-20 18:55:00', '2876ef7ba5b3a95fb84fbe59724c592e', 3, 0, NULL, 0, 1, 1, '2015-03-20 17:55:00', '2015-03-20 17:55:00'),
(55, 1, 'Elke ist tod. :(', 'Leider mussten wir Elke unsere Admin Katze einschlÃ¤fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.  \nSie hatte schon immer einen leichten Schaden, nur weil es nicht besser wurde und meine Mutter mit EntzÃ¼ndingen schon des Ã¶fteren bei Ã„rzten war, lieÃŸen wir Sie EinschlÃ¤fern...  \nR.I.P. Elke, wir denken an dich.', 'Leider mussten wir Elke unsere Admin Katze einschlÃ¤fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.  \nSie hatte schon immer einen leichten Schaden, nur weil &hellip;', 1, '2015-05-05 18:16:00', '7e0b3aee964d4bce03ca4dccd5f3ee4a', 3, 0, NULL, 0, 1, 56, '2015-05-05 16:16:00', '2015-05-05 16:16:00'),
(56, 1, 'Neue BilderÂ²', 'Here we goooo.  \nSind mal wieder 4 Bilder Hochgeladen worden...  \nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).  \nBei uns ist zur Zeit gutes Wetter was fÃ¼r mich heiÃŸt Fahrradfahren.  \nWerd mal zum SpaÃŸ meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme...  \nWÃ¼nsche viel SpaÃŸ mit den Bildern...', 'Here we goooo.  \nSind mal wieder 4 Bilder Hochgeladen worden...  \nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).  \nBei uns ist zur Zeit gutes Wetter was fÃ¼r mich heiÃŸt Fahrradfahren.  \nWerd mal zum SpaÃŸ meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme... &hellip;', 1, '2015-05-05 18:18:00', 'd16045de8df8baa762a799e08060c092', 3, 0, NULL, 0, 1, 57, '2015-05-05 16:18:00', '2015-05-05 16:18:00'),
(57, 1, 'Neue Fineliner Bilder gesichtet...', 'Unter Images->Fineliner7 wurden neue Bilder gesichtet.  \nHope you enjoy the Ride ;)', 'Unter Images->Fineliner7 wurden neue Bilder gesichtet.  \nHope you enjoy the Ride ;)     ', 1, '2015-07-05 18:19:00', '63baa31298a1aaee60c28da6a2413da4', 3, 0, NULL, 0, 1, 58, '2015-07-05 16:19:00', '2015-07-05 16:19:00'),
(58, 3, 'Shopping Tour in NeumÃ¼nster', 'waren am Samstag Shoppen in der Innenstadt von NeumÃ¼nster und ich hab mir ein Paar neue Sneakers gekauft.  \nLÃ¤uft sich gut in den Schuhen...  \n  \nAnbei ein Photo der Schuhe.  \nstay in tuned, Asario', 'waren am Samstag Shoppen in der Innenstadt von NeumÃ¼nster und ich hab mir ein Paar neue Sneakers gekauft.  \nLÃ¤uft sich gut in den Schuhen...  \n  \nAnbei ein Photo der Schuhe.  \nstay in tuned, Asario   ', 1, '2015-07-19 19:21:00', '513db49bd8cf3759191db7ce7a2b9812', 3, 0, NULL, 0, 1, 59, '2015-07-19 17:21:00', '2015-07-19 17:21:00'),
(59, 3, 'Haare AB!', 'Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.  \nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.  \n  \nEndlich wieder ohne Schmerzen kÃ¤mmen und mehr Substanz.  \nNaja, muss man sich noch dran gewÃ¶hnen... ;)  \nAber es sieht schon besser aus.', 'Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.  \nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.  \n  \nEndlich wieder ohne Schmerzen kÃ¤mmen und mehr Substanz.  \nNaja, muss man sich noch dran gewÃ¶hnen... ;)  \nAber es sieht schon besser aus. &hellip;', 1, '2015-08-04 18:13:00', '6e2747bb90d1b11d251cc27118042f34', 3, 0, NULL, 0, 1, 60, '2015-08-04 16:13:00', '2015-08-04 16:13:00'),
(60, 1, 'Ricklinger Jahresfest 2015', 'Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.  \nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.  \nWÃ¼nsche viel SpaÃŸ mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.  \n  \nalso bis Sonntag, euer Asario', 'Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.  \nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.  \nWÃ¼nsche viel SpaÃŸ mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.  \n  \nalso bis Sonntag, euer Asario &hellip;', 1, '2015-08-30 20:26:00', '280555b8e500cbdca762d5d38203bd00', 3, 0, NULL, 0, 1, 61, '2015-08-30 18:26:00', '2015-08-30 18:26:00'),
(61, 2, 'MCS v. 1.85 ist eingetroffen....', 'Mal wieder wurde MCS erneuert.  \nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  \nEinige Formularelemente wurden mit Material Design aktualisiert.  \nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  \n  \nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien zum Hochladen in die Update Ordner zu schieben.  \n  \nAußerdem ist ein interner Chat entstanden.  \n  \nwünsche viel Spaß mit MCS v. 1.85 ;)  \nPS.: Momentan arbeite ich an der Integration von JQuery UI Elementen in das Admin Center.  \nsee you soon, Paule aka Asario', 'Mal wieder wurde MCS erneuert.  \nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  \nEinige Formularelemente wurden mit Material Design aktualisiert.  \nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  \n  \nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien &hellip;', 1, '2015-09-06 19:29:00', 'b014f7a6285afeefee08a0c737f7294e', 3, 0, NULL, 0, 1, 1, '2015-09-06 17:29:00', '2015-09-06 17:29:00'),
(62, 1, 'Neue Shortstories', 'Hab mal wieder nen paar Shortstories  \nhochgeladen. Ich will mal hoffen das  \neuch die gefallen.  \nPS: JQuery UI hÃ¤lt Einzug in MCS. weitere Infos demnÃ¤chst im Devlog.', 'Hab mal wieder nen paar Shortstories  \nhochgeladen. Ich will mal hoffen das  \neuch die gefallen.  \nPS: JQuery UI hÃ¤lt Einzug in MCS. weitere Infos demnÃ¤chst im Devlog.   ', 1, '2015-09-15 18:44:00', '3dd943a29233263cc87ef57fb718bb50', 3, 0, NULL, 0, 1, 63, '2015-09-15 16:44:00', '2015-09-15 16:44:00'),
(63, 2, 'Neuerungen dank JQuery UI', 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  \n  \nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  \nIch musste alles was auf einzelnen extra Seiten war auf eine Seite reduzieren und die Verlinkung anpassen.  \n  \nAber alles in allem hat es sich gelohnt. Sieht Jetzt Stylischer aus und geht alles sehr viel schneller.  \nHab natürlich beim proggen etliche Bugs verursacht die ich mühsam finden und beseitigen musste.  \n  \nEin nettes Schmankerl ist auch die neue Shortstories Seite.  \n  \naber jetzt müsste eigentlich alles funken. wenn euch noch was auffällt schreibt mir ne PM oder mailt mir einfach über das Mailformular.  \n  \nAch ja, Die Hilfe Seite hab ich komplett neu geschrieben und dabei ca. 80 Zeilen Code eingespart. Klingt nicht nach viel aber bei einem Vergleichsweise kleinem Script ist das schon ne Menge.  \n  \nPS: In den Privaten Nachrichten sind Smilies mit dabei.  \n  \nBis Bald Asario.', 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  \n  \nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  \nIch musste alles was auf einzelnen extra Seiten war auf &hellip;', 1, '2015-10-04 20:03:00', 'de8c2fd9afb6f1a198fcf049d2289cc1', 3, 0, NULL, 0, 1, 1, '2015-10-04 18:03:00', '2015-10-04 18:03:00'),
(64, 1, 'JQuery UI integrated', 'Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.  \nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.  \nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.  \nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.  \nAnsonsten ist noch alles Banane in Big Bad Bottermilk BimÃ¶hlen.', 'Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.  \nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.  \nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.  \nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.  \nAnsonsten &hellip;', 1, '2015-10-13 18:50:00', '3cc4f6f7cececc7848983b2a9e8c829a', 3, 0, NULL, 0, 1, 65, '2015-10-13 16:50:00', '2015-10-13 16:50:00'),
(65, 3, 'Die Kundenzufriedenheitsumfrage ;)', 'Ich will von euch wissen was euch auf meiner Seite fehlt.  \nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?  \nHabt ihr ne Idee fÃ¼r meine Seite ?  \nSoll ich einen Chat programmieren oder doch nen GÃ¤stebuch integrieren ?  \nIhr entscheidend was ich einbaue.  \nOder solls vielleicht ne Shoutbox sein ?  \n  \nIDEEN RAN, ABER FLOTT ;)', 'Ich will von euch wissen was euch auf meiner Seite fehlt.  \nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?  \nHabt ihr ne Idee fÃ¼r meine Seite ?  \nSoll ich einen Chat programmieren oder doch nen GÃ¤stebuch integrieren ?  \nIhr entscheidend was ich einbaue.  \nOder solls &hellip;', 1, '2015-10-27 18:00:00', '73c99e6563172cafad2a2d00291385c0', 3, 0, NULL, 0, 1, 1, '2015-10-27 17:00:00', '2015-10-27 17:00:00'),
(66, 1, 'Neues Kleid fÃ¼r alte GerÃ¼ste.', 'Jetzt erstrahlt auch die Startseite in freundlichen Orange.  \nIch habe einen Ã¼blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.  \nIch hoffe alles funktioniert jetzt so wie gewÃ¼nscht.  \nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.  \nIch hoffe Ihr genieÃŸt den \\\"Ritt\\\" auf der AB Welle ;)  \nSincerly Yours Asario', 'Jetzt erstrahlt auch die Startseite in freundlichen Orange.  \nIch habe einen Ã¼blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.  \nIch hoffe alles funktioniert jetzt so wie gewÃ¼nscht.  \nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.  \nIch hoffe Ihr genieÃŸt den &hellip;', 1, '2015-10-27 18:02:00', 'c0d653839c756e1d41512cb7f8fd1533', 3, 0, NULL, 0, 1, 67, '2015-10-27 17:02:00', '2015-10-27 17:02:00'),
(67, 3, 'Meine Karriere zum freiwilligen Webdesigner und die Zunkunft...', 'Alles fing im Informatikunterricht in der 9./10. Klasse an.  \nWir lernten das Erstellen von Websites mit Microsoft Frontpage.  \nIch war sofort begeistert wie einfach man Websites erstellen kann.  \nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.  \nPHP ist eine einfach zu erlernende Scriptsprache die meine Ideen aufsog wie ein nasser Schwamm.  \n  \nNach einigen Jahren Programmiererfahrung entstand MCS, mein noch heute im Einsatz befindliches System, das **Marble Content System**  \nEine Vorlagen Engine sowie eine umfangreiche Administration entstanden in den darauffolgenden Jahren.  \nMittlerweile ist alles vom Portal bis zur Web-Visitenkarte machbar.  \nIch integrierte etliches nützliches aus meiner C\'t und bin immer noch am Arbeiten, neue Module zu erfinden bzw. alte zu verbessern  \n  \nIm Admin Center geht es los. Inhalte Einpflegen, Tabelleneinstellungen, Vorlagen Einstellungen, Benutzerprofile, Benutzerinhalte, Benutzergruppen und Rechte,  \nNewsletter, Kontakte, Kalender, Private Nachrichten uvm.  \n  \nMomentan habe ich 3 Javascript Frameworks installiert, die Entweder aufhübschen oder Funktionen nachrüsten.  \nJQuery UI, Foundation, Material Framework sind bei mir auf der ein oder anderen MCS-Seite installiert.  \n  \nMomentan läuft MCS auf 8 Webseiten in meinem Webspace.  \n  \nViele fragen sich, warum das Rad neu erfinden? Ich meine Wordpress, Typo3 oder Drupal können doch auch alles.  \nDoch selbst ein älteres Mambo hat 60% Mehr Code als MCS  \nEngines wie Smarty die mal eben 6000 Zeilen Code fressen wollte ich nicht integrieren.  \nmeine Vorlagen Engine hat mit 474 Zeilen weniger Gewicht als Hochgezüchtete CMS\'es und ist dennoch funktional.  \n  \nDer Vorteil an MCS ist dass man die HTML Vorlagen mit einem Wysiwyg Editor komplett erstellen kann weil sie reines HTML sind.  \nAngereichert mit in PHP geschriebenen Modulen und Funktionen sind sie hochdynamisch und schnell.  \nWollt Ihr/ Willst du schon immer eine eigene Website haben wo du dich über dein Hobby oder dein Lieblingsthema auslassen willst so schreib mir doch über das [Kontaktformular](kontakt) falls du eine interessante Idee für eine Homepage hast. Ich freue mich über jede Anregung oder Idee.  \n  \nForum, Chat, Shoutbox, Kommentare, Gästebücher sowie Bildergalerien, Texte, Fotos, Suchfunktion, RSS Stream, Smartphone Unterstützung uvm, wurden bereits Entwickelt und in MCS integriert. Wenn dir auch für meine Seite eine Idee einfällt schreib mir über das [Kontakformular](kontakt)  \n  \nMCS is ready to Launch.', 'Alles fing im Informatikunterricht in der 9./10. Klasse an.  \nWir lernten das Erstellen von Websites mit Microsoft Frontpage.  \nIch war sofort begeistert wie einfach man Websites erstellen kann.  \nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.  \nPHP ist eine einfach zu &hellip;', 1, '2015-11-24 19:37:00', '7d1a12c9a210465499f9245cb03a0895', 3, 0, NULL, 0, 1, 1, '2015-11-24 18:37:00', '2015-11-24 18:37:00');
INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `content`, `summary`, `blog_author_id`, `blog_date`, `slug`, `reading_time`, `audio_on`, `audio_url`, `audio_duration`, `markdown_on`, `blog_image_id`, `created_at`, `updated_at`) VALUES
(68, 1, 'Neue Galerie und einige nette Details', 'Habe eine neue Galerie mit Zentangles erstellt.  \nDa findet Ihr meine Fortschritte beim Tanglen.  \nAuÃŸerdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.  \nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gekÃ¼rzt aufgezeichnet werden.  \nPiwik ist ein Statistiktool zum Auswerten der Besuche auf dem Server.  \nIhr kÃ¶nnt jederzeit Ã¼ber die fx_lxk(index.php?page=datenschutz|||Datenschutz) Einstellungen das Tracking deaktivieren.  \nDie Statistischen Daten dienen der Verbesserung des Angebotes und sind Indikatoren fÃ¼r BesucherstrÃ¶me.  \nWÃ¼nsche viel SpaÃŸ mit meinen Seiten, In Liebe, Asario', 'Habe eine neue Galerie mit Zentangles erstellt.  \nDa findet Ihr meine Fortschritte beim Tanglen.  \nAuÃŸerdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.  \nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gekÃ¼rzt aufgezeichnet werden.  &hellip;', 1, '2015-12-18 20:17:00', 'e60250a712dc052264ba132e72fa1466', 3, 0, NULL, 0, 1, 69, '2015-12-18 19:17:00', '2015-12-18 19:17:00'),
(69, 1, 'Happy New Year', 'Ich wÃ¼nsche allen Besuchern gut reingerutscht zu sein.  \nIch hoffe Ihr habt nicht zu viel Zugenommen Ã¼ber die Feiertage und seit gut reingerutscht  \nNatÃ¼rlich hoffen wir das wir alle Gesund bleiben,  \nund Erfolg im Beruf haben sowie das dieses ein glÃ¼ckliches Jahr wird', 'Ich wÃ¼nsche allen Besuchern gut reingerutscht zu sein.  \nIch hoffe Ihr habt nicht zu viel Zugenommen Ã¼ber die Feiertage und seit gut reingerutscht  \nNatÃ¼rlich hoffen wir das wir alle Gesund bleiben,  \nund Erfolg im Beruf haben sowie das dieses ein glÃ¼ckliches Jahr wird  ', 1, '2016-01-03 18:15:00', '6d713031cd29f69c679de72c234e45aa', 3, 0, NULL, 0, 1, 70, '2016-01-03 17:15:00', '2016-01-03 17:15:00'),
(70, 1, '2 neue Galerien gefunden', 'Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃ¶ffentlicht.  \nIn der Galerie Photos4 findet Ihr meine neusten Fotos.  \nBei der 2ten Galerie dreht sich alles um Fasermalerbilder  \nStÃ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich fÃ¼ge demnÃ¤chst neue Bilder hinzu.  \nIch mÃ¶chte noch mal auf Mindblog hinweisen wo Ihr Mitspracherecht bekommt was Ihr euch fÃ¼r 2016 von mir WÃ¼nscht.  \n  \nAlso bis bald, Asario', 'Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃ¶ffentlicht.  \nIn der Galerie Photos4 findet Ihr meine neusten Fotos.  \nBei der 2ten Galerie dreht sich alles um Fasermalerbilder  \nStÃ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich fÃ¼ge demnÃ¤chst neue Bilder hinzu.  \nIch mÃ¶chte &hellip;', 1, '2016-01-15 19:10:00', 'aee1c348eb7cf5136da764b9224a1bd1', 3, 0, NULL, 0, 1, 71, '2016-01-15 18:10:00', '2016-01-15 18:10:00'),
(71, 1, 'Neue Domain VerfÃ¼gbar.', 'An alle Fans hier der Tipp des Jahres:  \nwww.asario.de statt ab.marblefx.de.  \nAlso noch mal zum Mitschreiben www.asario.de ist Online ......  \n  \nWÃ¼nsche viel SpaÃŸ auf meiner Seite.', 'An alle Fans hier der Tipp des Jahres:  \nwww.asario.de statt ab.marblefx.de.  \nAlso noch mal zum Mitschreiben www.asario.de ist Online ......  \n  \nWÃ¼nsche viel SpaÃŸ auf meiner Seite.   ', 1, '2016-02-09 19:55:00', '880158f6c6cb1227f2d60352383197c0', 3, 0, NULL, 0, 1, 72, '2016-02-09 18:55:00', '2016-02-09 18:55:00'),
(72, 1, 'Ich habe 4 neue Bilder gemalt', 'Ihr findet Sie unter [Images->Fasermaler](index.php?page=images&action=cat&id=21) sowie unter [Images->Fineliner7](index.php?page=images&action=cat&id=17).  \nWÃ¼nsche viel SpaÃŸ mit den Bildern.  \nmfg Asario', 'Ihr findet Sie unter [Images->Fasermaler](index.php?page=images&action=cat&id=21) sowie unter [Images->Fineliner7](index.php?page=images&action=cat&id=17).  \nWÃ¼nsche viel SpaÃŸ mit den Bildern.  \nmfg Asario  ', 1, '2016-04-01 18:43:00', '57b3caff9a947fbc7cb256e5f243f269', 3, 0, NULL, 0, 1, 73, '2016-04-01 16:43:00', '2016-04-01 16:43:00'),
(73, 1, 'Neues Wallpaper', 'Ein neues Wallpaper wurde unter Images->Digital gesichtet.  \nAusserdem wurde das Upload Script Ã¼berarbeitet.  \nMehr dazu demnÃ¤chst im Changelog und unter Devlog.', 'Ein neues Wallpaper wurde unter Images->Digital gesichtet.  \nAusserdem wurde das Upload Script Ã¼berarbeitet.  \nMehr dazu demnÃ¤chst im Changelog und unter Devlog.   ', 1, '2016-05-17 18:16:00', '5d955a2a5671383fb26017fbe49b5408', 3, 0, NULL, 0, 1, 74, '2016-05-17 16:16:00', '2016-05-17 16:16:00'),
(74, 2, 'MCS Version 1.98 erschienen', 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  \n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  \n2. Countpixel zur Besucheranalyse wurden integriert.  \n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  \n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r einzelne Galerien erweitert,  \nd.h. je nach gewÃ¤hlter Galerie sind unterschiedliche StandardgrÃ¶ÃŸen einstellbar', 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  \n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  \n2. Countpixel zur Besucheranalyse wurden integriert.  \n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  \n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r &hellip;', 1, '2016-05-24 18:50:00', 'aaa52c8c69e17a2992bbf1ba928f6a67', 3, 0, NULL, 0, 1, 1, '2016-05-24 16:50:00', '2016-05-24 16:50:00'),
(75, 1, 'Diverse neue Bilder', 'Ich habe mal wieder Bilder hochgeladen.  \nIhr findet die Objekte unter [Images](index.php?page=images)  \nIch wÃ¼nsche euch viel SpaÃŸ damit.  \nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.  \nIch wÃ¼nsche euch viel SpaÃŸ auf meiner Seite.  \nBis bald, Asario.', 'Ich habe mal wieder Bilder hochgeladen.  \nIhr findet die Objekte unter [Images](index.php?page=images)  \nIch wÃ¼nsche euch viel SpaÃŸ damit.  \nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.  \nIch wÃ¼nsche euch viel SpaÃŸ &hellip;', 1, '2016-06-14 19:04:00', '232badc78c7d74110fbd0fc9d319a2c5', 3, 0, NULL, 0, 1, 76, '2016-06-14 17:04:00', '2016-06-14 17:04:00'),
(76, 1, 'MCS Version 2.01', 'Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,  \nAlles im Sinne von 2.01 ;)  \nWÃ¼nsche viel Spass, Asario', 'Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,  \nAlles im Sinne von 2.01 ;)  \nWÃ¼nsche viel Spass, Asario &hellip;', 1, '2016-06-28 18:57:00', 'efdee83d10af6f3429f05a19a518bfce', 3, 0, NULL, 0, 1, 77, '2016-06-28 16:57:00', '2016-06-28 16:57:00'),
(77, 2, 'Neuerungen in MCS 2.01', 'Es ist mal wieder was von der MCS Front zu berichten.  \nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  \nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  \nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die VerknÃ¼pfung  \nder Bilder erneuern/reparieren.  \nEben ist mir bzw Mumbo ein Fehler beim PM Script aufgefallen den ich ebenso gefixt hab.  \nSinn und zweck der Kanonischen URL\'s ist es den Seitennamen zu vereinfachen/zu verkÃ¼rzen.  \nSo wird aus www.asario.de/index.php?page=news -> www.asario.de/news was fÃ¼r Suchmaschinen  \nideal ist und auch leichter zu merken ist.  \nBin zwar noch nicht zufrieden mit den Kanonischen URL\'s aber da fÃ¤llt mir auch noch was ein.  \nHoffe Ihr habt SpaÃŸ auf meinen Seiten...  \nin Love Asario', 'Es ist mal wieder was von der MCS Front zu berichten.  \nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  \nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  \nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die &hellip;', 1, '2016-07-04 17:12:00', '852cded0f6d19bc7f59a0c6b983d21d2', 3, 0, NULL, 0, 1, 1, '2016-07-04 15:12:00', '2016-07-04 15:12:00'),
(78, 3, 'Burzeltach und seine Folgen...', 'Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.  \r\nund habe mir selber ein großes Geschenk gemacht.  \r\nIch habe eine nicht nennenswerte Summe Geld investiert und  \r\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)  \r\nAuf dem Foto ist hoffentlich mein 2tes großes Geschenk zu sehen.  \r\nEin Pinsel-Set zum professionellem Malen im Maleratelier und bei mir zu Hause.  \r\nDemnächst ist Mighty Crab Online (Unter [www.asario.de/ausgemaltes](ausgemaltes) bald zu sehen)  \r\nDenn das Zen-Color Buch von meiner Schwester ist mit guten Motiven gespickt, so das ich hin und wieder mal was ausmale und unter [Images->Ausgemaltes](ausgemaltes) veröffentliche.', 'Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.  \r\nund habe mir selber ein großes Geschenk gemacht.  \r\nIch habe eine nicht nennenswerte Summe Geld investiert und  \r\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)  \r\nAuf dem Foto ist hoffentlich mein 2tes großes Geschenk zu &hellip;', 1, '2016-07-08 20:14:00', '9b9518a9870c96e3f65d8c2e71802afe', 3, 0, NULL, 0, 1, 79, '2016-07-08 18:14:00', '2016-07-08 18:14:00'),
(79, 0, 'Asario\'s Geschichte Part II', 'So da wÃƒÂ¤ren wir nun.  \nWir haben eine zerÃƒÂ¼ttet Familie, ein Haufen Chaoten und jede Menge Party.  \nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.  \nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.  \n  \nIch fing eine Ausbildung zum Kaufmann fÃƒÂ¼r Audiovisuelle Medien an und nach 1,5 Jahren ging ich nicht mehr hin, weil mir alles zu viel wurde.  \nIrgendwann quartierte mich meine Mutter aus und ich zog in ein Neubauviertel in Potsdam.  \n  \nNach anderthalb Jahren im \"RattenkÃƒÂ¤fig\" fing bei mir alles an sich zu ÃƒÂ¤ndern. Ich bekam komische Nachrichten per Telepathie und zog mich immer weiter ZurÃƒÂ¼ck.  \nIn Wahrheit bekam ich eine Psychose und wurde Psychisch Krank.  \n  \nSchizophrenie die Diagnose der Ãƒâ€žrzte schockte mich schon ganz schÃƒÂ¶n.  \nDie ersten Jahre mit der Krankheit dachte ich ich wÃƒÂ¤hr gesund nur irgendwann wurde mir klar das man diese Krankheit zwar beherrschen aber nicht heilen kann.  \n  \nSo nun bin ich halt krank, na und ?  \nIch versuche das Beste draus zu machen und bin seit ein paar Jahren ziemlich stabil.  \n  \nto be continued...', 'So da wÃƒÂ¤ren wir nun.  \nWir haben eine zerÃƒÂ¼ttet Familie, ein Haufen Chaoten und jede Menge Party.  \nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.  \nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.  \n  \nIch fing eine Ausbildung zum &hellip;', 1, '2016-07-08 20:16:00', '31effc4d2d137ef6176b6520bccb3651', 3, 0, NULL, 0, 1, 1, '2016-07-08 18:16:00', '2016-07-08 18:16:00'),
(80, 1, 'Neue Galerie vorhanden.', 'Ich habe ja wie bereits erwÃ¤hnt ein Ausmalbuch \"Zen Colour Ocean\" zum Geburtstag  \nbekommen. Hier und jetzt kÃ¶nnt Ihr meine Werke bewundern.  \nViel SpaÃŸ, Asario', 'Ich habe ja wie bereits erwÃ¤hnt ein Ausmalbuch \"Zen Colour Ocean\" zum Geburtstag  \nbekommen. Hier und jetzt kÃ¶nnt Ihr meine Werke bewundern.  \nViel SpaÃŸ, Asario    ', 1, '2016-08-24 10:20:00', 'e34d1a4e246be87bd40ed9fef8063586', 3, 0, NULL, 0, 1, 81, '2016-08-24 08:20:00', '2016-08-24 08:20:00'),
(81, 1, 'Neuerungen unter der Haube', 'Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.  \nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.  \nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte verÃ¤ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen Webspace.  \nSomit muss ich mich nicht mit Datenbank Dumps rumÃ¤rgern und habe alle Seiten immer aktuell. Momentan schraube ich noch am RSS-Feed, der irgendwie noch nicht mit dem Sync-Client kompatibel scheint.  \nAber gut ding will Weile haben, oder wie man auch sagt: Was lange Wert, wird endlich gut.  \nIn diesem Sinne, Have Fun Folks.', 'Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.  \nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.  \nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte verÃ¤ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen &hellip;', 1, '2016-10-08 20:07:00', '295718e2c50a890aa96304e38ce208a9', 3, 0, NULL, 0, 1, 82, '2016-10-08 18:07:00', '2016-10-08 18:07:00'),
(82, 1, 'Merry X-Mas', 'Ich wÃ¼nsche allen Fans ein besinnliches und schÃ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im nÃ¤chsten Jahr alles GlÃ¼ck der Welt haben und Fit sind wie im Letzten Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, Berlin und Potsdam wÃ¼nscht euer Asario.', 'Ich wÃ¼nsche allen Fans ein besinnliches und schÃ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im nÃ¤chsten Jahr alles GlÃ¼ck der Welt haben und Fit sind wie im Letzten Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, Berlin und Potsdam wÃ¼nscht euer Asario. &hellip;', 1, '2016-12-19 18:24:00', 'ca4dacc573395b1d0f7364f113924e58', 3, 0, NULL, 0, 1, 83, '2016-12-19 17:24:00', '2016-12-19 17:24:00'),
(83, 1, 'Big Exceptions', 'Die Erwartung ist groÃŸ, ich hoffe sie enttÃ¤uscht euch nicht.  \nHab mal wieder was ausgemalt, zu finden unter Images->Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demnÃ¤chst hier reinflattern wird.  \nich hoffe Ihr mÃ¶gt Quallen, denn mein aktuellstes Werk heiÃŸt Jellyfish, hat aber im Grunde genommen keine Ã„hnlichkeit mit einer Qualle.  \nAch ja, vielleicht ist es euch schon Aufgefallen, Ich habe ein paar Layout Ã„nderungen unter **Images**, **Devlog**, **Mindblog** und **Shortstories** vorgenommen. Ich hoffe Ihr mÃ¶gt es..  \nPS: Die Bewertung von Bildern habe ich etwas verÃ¤ndert, aber lasst euch davon nicht abschrecken zu Voten...  \nAch ja, bevor ichs vergesse, MCS wurde auf Version 2.15 gepatcht.  \nenjoy the ride, Asario', 'Die Erwartung ist groÃŸ, ich hoffe sie enttÃ¤uscht euch nicht.  \nHab mal wieder was ausgemalt, zu finden unter Images->Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demnÃ¤chst hier reinflattern wird.  \nich hoffe Ihr mÃ¶gt Quallen, denn mein aktuellstes Werk heiÃŸt Jellyfish, hat aber im &hellip;', 1, '2017-01-25 09:37:00', 'f62d71e05eaaaeee1830e93de829bdfc', 3, 0, NULL, 0, 1, 84, '2017-01-25 08:37:00', '2017-01-25 08:37:00'),
(84, 2, 'MCS Version 2.15', 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  \nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  \nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  \nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige kleinere Updates vorgenommen. Unter anderem habe ich ein paar Bugs im Synchro-Tool beseitigt.  \nIch muss demnÃ¤chst noch die RSS-Feeds kontrollieren, hab dazu bis jetzt noch keine Zeit gehabt.  \nAuch dieses mal wÃ¼nsche ich eine schÃ¶ne Zeit in meinem Blog.  \nmfg Asario', 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  \nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  \nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  \nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige &hellip;', 1, '2017-01-25 11:17:00', '8a253c7421a6af37a39cc0a428921bb1', 3, 0, NULL, 0, 1, 1, '2017-01-25 10:17:00', '2017-01-25 10:17:00'),
(85, 1, 'MCS Points - die Smarte W&auml;hrung', 'Ab jetzt k&ouml;nnt ihr als registrierte Benutzer satte Pr&auml;mien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. F&uuml;r jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen k&ouml;nnt. Ihr erhaltet signierte original Kunstwerke f&uuml;r eure Butze oder zum Verschenken.\r\n\r\nfx_premium_table()', 'Ab jetzt k&ouml;nnt ihr als registrierte Benutzer satte Pr&auml;mien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. F&uuml;r jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen k&ouml;nnt. Ihr erhaltet signierte original Kunstwerke f&uuml;r &hellip;', 1, '2017-01-29 15:48:00', '365ffd79c810a577c4a11c9650f77fa0', 3, 0, NULL, 0, 1, 86, '2017-01-29 14:48:00', '2017-01-29 14:48:00'),
(86, 3, 'Meine Privaten News', 'Ich Ã¼berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / möchte.  \nMeine Grafikkarte röhrt seit einigen Wochen, ich werde sie wohl ersetzen mÃ¼ssen.  \nDiesmal wird es wohl eine karte von NVIDIA sein.  \nschon falls ich es doch noch mal schaffe mich an Linux zu gewöhnen.  \nAußerdem sind die Nvidia Karten Sparsamer was den Energieverbrauch angeht.  \nWird wohl ne GF1060 werden. Mein Kollege Mumbo hat mir die schon empfohlen.  \nNun ja Eine neue Grafikkarte soll auch 4k-FÃ¤hig sein, falls ich mir noch nen 4k Monitor holen will.  \nDie sind zwar jetzt noch zu Teuer aber die Preise fallen mit der Zeit bekanntlich so dass sie bald erschwinglich sind.  \nNun ja alles klar auf der Andrea Doria.  \nEs ist schon Praktisch das die Dinger im Leerlauf die Lüfter anhalten können.  \nSo hab ich beim Programmieren von Websites immer einen leisen PC.  \nSchade das AMD und Linux nicht so ganz Harmonieren, hätte mir gern ne AMD Karte geholt.  \nAber man soll an die Zukunft denken.  \n  \nAch ja ich vergas doch glatt das ich mir ne Blu-Ray über Amy Winehouse gekauft habe.  \nIst echt Irre, was die so erlebt hat.  \nR.I.P. Amy.  \n  \nin diesem Sinne, Viel Spaß Asario', 'Ich Ã¼berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / möchte.  \nMeine Grafikkarte röhrt seit einigen Wochen, ich werde sie wohl ersetzen mÃ¼ssen.  \nDiesmal wird es wohl eine karte von NVIDIA sein.  \nschon falls ich es doch noch mal schaffe mich an Linux zu gewöhnen.  \nAußerdem sind die Nvidia Karten &hellip;', 1, '2017-02-19 13:37:00', '5ff4c95c375b2a431736fe930943d7c9', 3, 0, NULL, 0, 1, 1, '2017-02-19 12:37:00', '2017-02-19 12:37:00'),
(87, 1, 'Jetzt aber...', 'Ich habe mal wieder was gebastelt. Unter [Benutzer](user) kÃ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.  \nUnd damit kÃ¶nnt ihr \"eure Leistung\" mit der der anderen vergleichen.  \nSoo, dann hab ich noch 2 neue Bilder Online gestellt zu finden unter [Images](images) in den Galerien Faser und Acryl. Siehe auch rechts oben auf dieser Seite.  \nViel Spass beim Statistiken guggen, in Love Asario', 'Ich habe mal wieder was gebastelt. Unter [Benutzer](user) kÃ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.  \nUnd damit kÃ¶nnt ihr \"eure Leistung\" mit der der anderen vergleichen.  \nSoo, dann hab ich noch 2 &hellip;', 1, '2017-03-02 18:43:00', '757bf20782851c75ecb8bd9dba444858', 3, 0, NULL, 0, 1, 88, '2017-03-02 17:43:00', '2017-03-02 17:43:00'),
(88, 1, 'Neue Navigationsleiste', 'Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.  \nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen [meldet euch bei mir](kontakt).  \nViel SpaÃŸ in meinem Blog, in Love, Asario', 'Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.  \nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen [meldet euch bei mir](kontakt).  \nViel SpaÃŸ in meinem Blog, in Love, Asario &hellip;', 1, '2017-03-12 16:33:00', '9cb937c35c7e5fdd10c5dc1909bf6839', 3, 0, NULL, 0, 1, 89, '2017-03-12 15:33:00', '2017-03-12 15:33:00'),
(89, 1, 'MultiLanguageSupport', 'Ab jetzt kÃ¶nnt ihr einige der Seiten in Englischer Sprache sehen.  \nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang fÃ¤hig. Einstellen der Sprache kÃ¶nnt ihr in der Navigation oben rechts.  \n  \nIch habe grad einen Ã¼blen Bug im Dateihochladescript gefunden...  \nmÃ¼sste jetzt wieder gehen.  \n  \nWÃ¼nsche viel SpaÃŸ damit. falls euch noch was einfÃ¤llt oder auffÃ¤llt schreibt es mir.  \n  \nKommentare, E-Mails oder PMs sind willkommen...  \nbis denne, Asario', 'Ab jetzt kÃ¶nnt ihr einige der Seiten in Englischer Sprache sehen.  \nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang fÃ¤hig. Einstellen der Sprache kÃ¶nnt ihr in der Navigation oben rechts.  \n  \nIch habe grad einen Ã¼blen Bug im Dateihochladescript gefunden...  \nmÃ¼sste &hellip;', 1, '2017-03-24 18:50:00', '6b0c4368312086bfd14351921e87e7d1', 3, 0, NULL, 0, 1, 90, '2017-03-24 17:50:00', '2017-03-24 17:50:00'),
(90, 1, 'Das Warten hat ein Ende', 'Endlich habe ich mal wieder nen funzenden Web-Stick.  \nwie Ihr seht bin ich wieder Online unterwegs.  \nhabe ne lÃ¤ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.  \nHoffe Ihr habt SpaÃŸ mit meiner Seite.  \nwww.asario.de your finest Art Place ;)', 'Endlich habe ich mal wieder nen funzenden Web-Stick.  \nwie Ihr seht bin ich wieder Online unterwegs.  \nhabe ne lÃ¤ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.  \nHoffe Ihr habt SpaÃŸ mit meiner Seite.  \nwww.asario.de your finest Art Place ;)  ', 1, '2017-05-18 19:58:00', '2393b4dce774f7208fbff4759e451cd2', 3, 0, NULL, 0, 1, 91, '2017-05-18 17:58:00', '2017-05-18 17:58:00'),
(91, 2, 'Die Version 2.35 von MCS wurde aktualisiert.', 'Mal wieder habe ich eine neue Version veröffentlicht.  \nDie größte Änderung betrifft die Übersicht der Tabelle.  \nHier kann man nun per Drag & Drop Einträge sortieren.  \nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  \nAußerdem habe ich diverse Bugs in einigen Modulen gestopft.  \nEin übler Bug im Kontaktformular wurde soeben gefixt.  \nIhr könnt mir wieder Mails schreiben...  \nmehr Infos wie immer im Changelog.', 'Mal wieder habe ich eine neue Version veröffentlicht.  \nDie größte Änderung betrifft die Übersicht der Tabelle.  \nHier kann man nun per Drag & Drop Einträge sortieren.  \nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  \nAußerdem habe ich diverse Bugs in einigen &hellip;', 1, '2017-05-26 09:13:00', '157ceb16f673cc1da07b675e2bdb6177', 3, 0, NULL, 0, 1, 1, '2017-05-26 07:13:00', '2017-05-26 07:13:00'),
(92, 1, 'Neue Galerie gesichtet', 'Ab jetzt kÃ¶nnt ihr getÃ¶pferte Kunstwerke von mir sehen.  \nUnter [http://www.asario.de/ton](ton) findet ihr meine vorrangig Viereckigen GegenstÃ¤nden.  \nHabe bis jetzt einen Aschenbecher in der Mache.', 'Ab jetzt kÃ¶nnt ihr getÃ¶pferte Kunstwerke von mir sehen.  \nUnter [http://www.asario.de/ton](ton) findet ihr meine vorrangig Viereckigen GegenstÃ¤nden.  \nHabe bis jetzt einen Aschenbecher in der Mache.   ', 1, '2017-05-28 19:09:00', '34c06f70c3165643804c25771252adaa', 3, 0, NULL, 0, 1, 93, '2017-05-28 17:09:00', '2017-05-28 17:09:00'),
(93, 1, 'Herzlichen GlÃ¼ckwunsch', 'Mal wieder jÃ¤hrt sich der Tag an dem ich Ã¤lter werde.  \nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.  \nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.  \nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.  \nIch hoffe Ihr seid nicht Einsam.  \n  \nIn Love, Asario', 'Mal wieder jÃ¤hrt sich der Tag an dem ich Ã¤lter werde.  \nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.  \nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.  \nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.  \nIch hoffe Ihr seid nicht &hellip;', 1, '2017-06-17 17:56:00', '76015a7c33e8df7d6a5c9b56f72cedea', 3, 0, NULL, 0, 1, 94, '2017-06-17 15:56:00', '2017-06-17 15:56:00'),
(94, 3, 'Meine Geschenke....', 'Ich bin jetzt Besitzer eines Schafes in Afghanistan.\nIch hoffe das die Familie viel Milch und Wolle ernten kann. \nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage. \nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.\nBestellt euch doch auch so ein Schaf.  \n\nAußerdem habe ich noch ein Buch und einen neuen Rucksack geschenkt bekommen. Und jede Menge Tee war auch dabei.  \n\nThx Ianosaurus & Chinagirl', 'Ich bin jetzt Besitzer eines Schafes in Afghanistan.\nIch hoffe das die Familie viel Milch und Wolle ernten kann. \nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage. \nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.\nBestellt euch doch auch so ein Schaf.  \n\nAußerdem &hellip;', 1, '2017-06-20 19:45:00', '5cd1f4137ac80edb6e2a1f27413b5c6b', 3, 0, NULL, 0, 1, 1, '2017-06-20 17:45:00', '2017-06-20 17:45:00'),
(95, 1, 'Internationalisierung vorangetrieben', 'Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.  \nIch bin fleissig am Ãœbersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlieÃŸlich auch noch nebenbei BrÃ¶tchen verdienen.  \nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.  \n  \nDa Google Translate nur Bullshit bringt muss ich alles von Hand Ã¼bersetzen was bei meinem Schulenglisch gar nicht so leicht ist...  \n  \nHoffe Ihr Muttersprachler verzeiht mir meine Faux Pas.  \n  \nNeu dazugekommen ist der Englische Newsfeed unter [http://www.feeds.marblefx.de/ab.en.xml](http://www.feeds.marblefx.de/ab.en.xml)  \nin Love, Asario', 'Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.  \nIch bin fleissig am Ãœbersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlieÃŸlich auch noch nebenbei BrÃ¶tchen verdienen.  \nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.  \n  \nDa &hellip;', 1, '2017-06-30 20:07:00', 'f2c79d61e9a4471ca1efa9b5a6b81439', 3, 0, NULL, 0, 1, 96, '2017-06-30 18:07:00', '2017-06-30 18:07:00'),
(96, 1, 'Habe mal wieder geschraubt.', 'Ab Sofort kÃ¶nnt Ihr miteinander Chatten.  \nSobald auÃŸer euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.  \nIch hoffe Ihr habt mal das GlÃ¼ck jemand im Chat zu begegnen.  \nWÃ¼nsche Viel SpaÃŸ, in Love Asario', 'Ab Sofort kÃ¶nnt Ihr miteinander Chatten.  \nSobald auÃŸer euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.  \nIch hoffe Ihr habt mal das GlÃ¼ck jemand im Chat zu begegnen.  \nWÃ¼nsche Viel SpaÃŸ, in Love Asario  ', 1, '2017-07-07 18:26:00', '06be608eb231652b0edb13f0a9cb6e71', 3, 0, NULL, 0, 1, 97, '2017-07-07 16:26:00', '2017-07-07 16:26:00'),
(97, 2, 'Neue Version auf alten Gleisen', 'MCS Version 2.45 ist erschienen.  \nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  \nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  \nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  \nAch ja, ich arbeite an den ersten Landingpages fÃ¼r Asarios Blog und musste deswegen an der Grundstruktur der Seiten arbeiten.  \nViel SpaÃŸ damit, Asario', 'MCS Version 2.45 ist erschienen.  \nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  \nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  \nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  \nAch ja, ich &hellip;', 1, '2017-07-11 18:44:00', '0967d62106eae0a8aac3b376810ecbfb', 3, 0, NULL, 0, 1, 1, '2017-07-11 16:44:00', '2017-07-11 16:44:00'),
(98, 1, 'Neues Design', 'Ich habe mal wieder an der Designschraube gestellt.  \nnun erscheint Asarios Blog in zartem TÃ¼rkis Blau.  \nHoffe euch gefÃ¤llt die neue Aufmachung gut.  \nKommentare immer willkommen... :)  \nbis dann Asario', 'Ich habe mal wieder an der Designschraube gestellt.  \nnun erscheint Asarios Blog in zartem TÃ¼rkis Blau.  \nHoffe euch gefÃ¤llt die neue Aufmachung gut.  \nKommentare immer willkommen... :)  \nbis dann Asario   ', 1, '2017-07-29 18:06:00', '0ddf497a26f18f55e6c9e418af02a820', 3, 0, NULL, 0, 1, 99, '2017-07-29 16:06:00', '2017-07-29 16:06:00'),
(99, 1, 'SSL Ãœberall', 'Herzlichen GlÃ¼hstrumpf, wir haben SSL aktivieren kÃ¶nnen.  \nDank Let\'s Encrypt ist jetzt alles sicher.  \nVielen Dank an 1blu die Let\'s Encrypt integriert haben.  \nWÃ¼nsche ein sicheres \"SURF\", Asario', 'Herzlichen GlÃ¼hstrumpf, wir haben SSL aktivieren kÃ¶nnen.  \nDank Let\'s Encrypt ist jetzt alles sicher.  \nVielen Dank an 1blu die Let\'s Encrypt integriert haben.  \nWÃ¼nsche ein sicheres \"SURF\", Asario   ', 1, '2017-08-20 15:40:00', '5e715ff71afe5cd48b4177fc66cde9e1', 3, 0, NULL, 0, 1, 100, '2017-08-20 13:40:00', '2017-08-20 13:40:00'),
(100, 1, 'Neues auf meinem Blog', 'Ein kleines Detail hat sich auf meiner Seite verÃ¤ndert.  \nLinks vom Kommentar ist das Profilbild des Users zu finden.  \nWar ne recht schnelle Nummer das Umzusetzen.  \nSieht echt Schnieke aus so.', 'Ein kleines Detail hat sich auf meiner Seite verÃ¤ndert.  \nLinks vom Kommentar ist das Profilbild des Users zu finden.  \nWar ne recht schnelle Nummer das Umzusetzen.  \nSieht echt Schnieke aus so.   ', 1, '2017-09-10 12:48:00', 'f6bd6c9ac0ba237b2dc86fb0e4b60ec2', 3, 0, NULL, 0, 1, 101, '2017-09-10 10:48:00', '2017-09-10 10:48:00'),
(101, 1, 'Neue Bilder gefunden', 'Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich wÃ¼nsche viel SpaÃŸ damit, Asario', 'Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich wÃ¼nsche viel SpaÃŸ damit, Asario    ', 1, '2017-09-17 19:16:00', '1f347f9fa9db5b4dcdb4b182be72e19c', 3, 0, NULL, 0, 1, 102, '2017-09-17 17:16:00', '2017-09-17 17:16:00'),
(102, 1, 'Mein Praktikum', 'Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel SpaÃŸ und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.  \nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich auf ein Wiedersehen mit dem Team von Elan Nord.', 'Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel SpaÃŸ und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.  \nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich &hellip;', 1, '2017-10-14 19:08:00', 'f5c2f68bbd34fa501bc97a0764a6d470', 3, 0, NULL, 0, 1, 103, '2017-10-14 17:08:00', '2017-10-14 17:08:00'),
(103, 1, 'Neuer Ascher', 'Joa, Ich hab mal wieder getÃ¶pfert...  \nEin Mederius Aschenbecher ist draus geworden.  \nVielen Dank an Ivonne & Ullrich, die das Teil fÃ¼r mich glasiert haben.  \nDemnÃ¤chst mach ich noch mal welche fÃ¼r die neue Aschenbecherlinie von Asario.', 'Joa, Ich hab mal wieder getÃ¶pfert...  \nEin Mederius Aschenbecher ist draus geworden.  \nVielen Dank an Ivonne & Ullrich, die das Teil fÃ¼r mich glasiert haben.  \nDemnÃ¤chst mach ich noch mal welche fÃ¼r die neue Aschenbecherlinie von Asario.  ', 1, '2017-10-29 12:56:00', 'a8c56dce57df4255ef82a377ef07e4c7', 3, 0, NULL, 0, 1, 104, '2017-10-29 11:56:00', '2017-10-29 11:56:00'),
(104, 1, 'VerÃ¤ndertes Layout', 'Ich hab mal wieder am Design von www.asario.de geschraubt.  \nHope you enjoy.  \nKritiken bitte per Comment oder PM...  \nBis bald, Asario', 'Ich hab mal wieder am Design von www.asario.de geschraubt.  \nHope you enjoy.  \nKritiken bitte per Comment oder PM...  \nBis bald, Asario    ', 1, '2017-11-12 14:59:00', '722c287fcb79e749b540cce686a657ed', 3, 0, NULL, 0, 1, 105, '2017-11-12 13:59:00', '2017-11-12 13:59:00'),
(105, 1, 'Neue Galerie', 'Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)', 'Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)  ', 1, '2017-11-19 09:18:00', '271e892310700e7c44193545e45d9782', 3, 0, NULL, 0, 1, 106, '2017-11-19 08:18:00', '2017-11-19 08:18:00'),
(106, 1, 'Endlich wieder Online', 'Endlich funktioniert mein Surf Stick wieder.  \nWar ein paar Wochen Offline :(  \nIch wÃ¼nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.  \nHoffe 2018 wird noch besser als 2017.  \nBis bald, Paul aka Asario', 'Endlich funktioniert mein Surf Stick wieder.  \nWar ein paar Wochen Offline :(  \nIch wÃ¼nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.  \nHoffe 2018 wird noch besser als 2017.  \nBis bald, Paul aka Asario  ', 1, '2017-12-20 09:10:00', '752146882b2582bc465b1d5dec1194b0', 3, 0, NULL, 0, 1, 107, '2017-12-20 08:10:00', '2017-12-20 08:10:00'),
(107, 1, 'Neue Monstar Pix', 'Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃ¶ffentlicht.  \nVielen Dank an Chinagirl & Ianosaurus.  \nViel Spass wÃ¼nscht Asario', 'Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃ¶ffentlicht.  \nVielen Dank an Chinagirl & Ianosaurus.  \nViel Spass wÃ¼nscht Asario    ', 1, '2018-01-28 09:17:00', '63f93c5648bc383ea5ff3cfc54a496b0', 3, 0, NULL, 0, 1, 108, '2018-01-28 08:17:00', '2018-01-28 08:17:00'),
(108, 1, 'Shortstories wird zu Shortpoems', 'Die Shortstorie Rubrik wurde in Shortpoems umbenannt.  \nNach wie vor kÃ¶nnt Ihr mir WÃ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.  \n  \nFreu mich schon auf eure Poem-VorschlÃ¤ge.', 'Die Shortstorie Rubrik wurde in Shortpoems umbenannt.  \nNach wie vor kÃ¶nnt Ihr mir WÃ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.  \n  \nFreu mich schon auf eure Poem-VorschlÃ¤ge.   ', 1, '2018-03-02 17:55:00', 'e470f64e50acb2bd485977186aacb81a', 3, 0, NULL, 0, 1, 109, '2018-03-02 16:55:00', '2018-03-02 16:55:00'),
(109, 1, 'Neue Kamera', 'Ich habe mir zu Ostern eine neue Kamera geleistet.  \nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.  \nWÃ¼nsche euch einen schÃ¶nen FrÃ¼hling.  \n  \nIn Liebe, Asario', 'Ich habe mir zu Ostern eine neue Kamera geleistet.  \nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.  \nWÃ¼nsche euch einen schÃ¶nen FrÃ¼hling.  \n  \nIn Liebe, Asario   ', 1, '2018-04-02 16:26:00', 'a4edab5841632ac7d0232fce7305e132', 3, 0, NULL, 0, 1, 110, '2018-04-02 14:26:00', '2018-04-02 14:26:00'),
(110, 1, 'Neues Wallpaper @ Digital Galerie', 'Habe mal wieder ein Wallpaper kreiert. Ein grÃ¼nes mal wieder, denn GrÃ¼n ist die Hoffnung.  \nStay tuned, Asario', 'Habe mal wieder ein Wallpaper kreiert. Ein grÃ¼nes mal wieder, denn GrÃ¼n ist die Hoffnung.  \nStay tuned, Asario    ', 1, '2018-04-15 12:28:00', '99680dec7d77de85e7d34499bb9cdf23', 3, 0, NULL, 0, 1, 111, '2018-04-15 10:28:00', '2018-04-15 10:28:00'),
(111, 2, 'Frickeleien am Code', 'Habe auch dieses mal einiges verbessert.  \nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  \nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  \n  \nAber es ist geschafft und ich bin Stolz auf meine Arbeit in die ich meine Feierabende investiert habe.  \n  \nHoffe Ihr genieÃŸt das schÃ¶ne Wetter.  \nIch geh jetzt raus mich sonnen.  \n  \nGRTZ from BimÃ¶hlen, Asario', 'Habe auch dieses mal einiges verbessert.  \nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  \nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  \n  \nAber es ist geschafft und ich bin Stolz &hellip;', 1, '2018-04-18 19:32:00', 'ef9f2aa1577c19ebae1c579ba70041dc', 3, 0, NULL, 0, 1, 1, '2018-04-18 17:32:00', '2018-04-18 17:32:00'),
(112, 3, 'Ein bisschen leer hier', 'Hab lange nix mehr hier rein geschrieben.  \nIch genieße das schöne Wetter in SH.  \nSonne Satt und das im April, fast wie letztes Jahr.  \n  \nMomentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschloßen haben möchte.  \n  \nIst nur Organisatorischer Kram, aber der muss auch sein.  \n  \nBin echt zufrieden mit meiner Neuanschaffung, einer LUMIX TZ-71.  \ndas Studium des Handbuches steht auch noch auf meiner TODO-Liste.  \n  \nBin jetzt bei Seite 98 von 300. Aber ein paar Kamerafeatures sind echt gut.  \nMit freundlichen Grüßen, Asario', 'Hab lange nix mehr hier rein geschrieben.  \nIch genieße das schöne Wetter in SH.  \nSonne Satt und das im April, fast wie letztes Jahr.  \n  \nMomentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschloßen haben möchte.  \n  \nIst nur Organisatorischer Kram, aber der muss auch sein.  \n  &hellip;', 1, '2018-04-20 18:20:00', 'b50f0b235bcc3e9f58dc6cfc619b13f6', 3, 0, NULL, 0, 1, 1, '2018-04-20 16:20:00', '2018-04-20 16:20:00'),
(113, 1, 'Mein Smartphone', 'Ich habe kÃ¼rzlich von einer netten Kollegin ein Smartphone fÃ¼r gÃ¼nstig ersteigert.  \nMusste jetzt auf allen Seiten meine Telefonnummer Ã¤ndern...  \nAber bis jetzt funktioniert das Internet noch nicht :(.  \nNaja, gut ding will Weile haben.', 'Ich habe kÃ¼rzlich von einer netten Kollegin ein Smartphone fÃ¼r gÃ¼nstig ersteigert.  \nMusste jetzt auf allen Seiten meine Telefonnummer Ã¤ndern...  \nAber bis jetzt funktioniert das Internet noch nicht :(.  \nNaja, gut ding will Weile haben.  ', 1, '2018-04-29 10:49:00', '88e3e5245514398413170b9e98d80e7a', 3, 0, NULL, 0, 1, 114, '2018-04-29 08:49:00', '2018-04-29 08:49:00'),
(114, 1, 'LayoutverÃ¤nderung 2.0', 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf MobilgerÃ¤ten besser zu benutzen das neue Layout.  \nHoffe Ihr habt SpaÃŸ damit.  \n  \nWÃ¼nsche einen schÃ¶nen Mai, Asario.', 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf MobilgerÃ¤ten besser zu benutzen das neue Layout.  \nHoffe Ihr habt SpaÃŸ damit.  \n  \nWÃ¼nsche einen schÃ¶nen Mai, Asario.   ', 1, '2018-05-01 18:53:00', '337b711b698013d837964f37152b0910', 3, 0, NULL, 0, 1, 115, '2018-05-01 16:53:00', '2018-05-01 16:53:00'),
(115, 1, 'Neue Rubrik', 'Habe eine neue Rubrik auf meiner Seite veröffentlicht, sie heißt Did You Know und beschäftigt sich mit Unnützem Wissen.  \n  \nAber manchmal ist ne wissenswerte Info dabei.  \n  \nWünsche viel Spaß mit der Seite, Asario', 'Habe eine neue Rubrik auf meiner Seite veröffentlicht, sie heißt Did You Know und beschäftigt sich mit Unnützem Wissen.  \n  \nAber manchmal ist ne wissenswerte Info dabei.  \n  \nWünsche viel Spaß mit der Seite, Asario  ', 1, '2018-05-06 11:01:00', 'f52abf24344d4436694cfbb0deace971', 3, 0, NULL, 0, 1, 116, '2018-05-06 09:01:00', '2018-05-06 09:01:00'),
(116, 1, 'Neue Wissensfragen auf DidYouKnow', 'Habe mal wieder ein paar Fragen online gestellt.  \nHoffe die sind lehrreich.  \nAußerdem kann man im PM Schreiben Menü jetzt nach Benutzern suchen.  \n  \nBis denne Penne, ich liebe Nudeln und gut.  \nAsario tut was er tut.', 'Habe mal wieder ein paar Fragen online gestellt.  \nHoffe die sind lehrreich.  \nAußerdem kann man im PM Schreiben Menü jetzt nach Benutzern suchen.  \n  \nBis denne Penne, ich liebe Nudeln und gut.  \nAsario tut was er tut.  ', 1, '2018-05-13 10:02:00', 'fe747d146c02918323e6d444aa836e0f', 3, 0, NULL, 0, 1, 117, '2018-05-13 08:02:00', '2018-05-13 08:02:00'),
(117, 1, 'Mein 35ter Geburtstag', 'Herzlichen Glühstrumpf Asario.  \nWieder 1 Jahr älter geworden...  \nHabe mich selber schon am Samstag beschenkt.  \n1 Bluetooth Kopfhörer hab ich mir geleistet (von Sony).  \nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.  \n  \nKleine Änderung an der Seite...  \nIch habe die Fineliner Galerien 1-7 in eine Fineliner Galerie verpackt.  \n  \nIn diesem Sinne, habt Spaß, Asario', 'Herzlichen Glühstrumpf Asario.  \nWieder 1 Jahr älter geworden...  \nHabe mich selber schon am Samstag beschenkt.  \n1 Bluetooth Kopfhörer hab ich mir geleistet (von Sony).  \nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.  \n  \nKleine Änderung an der Seite...  \nIch habe die Fineliner Galerien 1-7 in &hellip;', 1, '2018-06-17 09:29:00', '9a28e5a7b4fb278fc4044f15692e48ec', 3, 0, NULL, 0, 1, 118, '2018-06-17 07:29:00', '2018-06-17 07:29:00'),
(118, 1, 'Neuigkeiten auf Asarios Blog', 'Ab Jetzt habe ich die Photos Galerien in eine verpackt.  \nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.  \nAußerdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.  \nWünsche euch viel Spaß auf meiner Seite.  \nIn Love, Asario.', 'Ab Jetzt habe ich die Photos Galerien in eine verpackt.  \nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.  \nAußerdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.  \nWünsche euch viel Spaß auf meiner Seite.  \nIn Love, Asario.  ', 1, '2018-06-30 08:38:00', '7ddb9e70c9b0ad7bc147ddae330d86e8', 3, 0, NULL, 0, 1, 119, '2018-06-30 06:38:00', '2018-06-30 06:38:00'),
(119, 2, 'MCS Version 2.87 Published', 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  \nVersion 2.87 enthält einige neue Features und Verbesserungen.  \nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  \n  \nDesweiteren wurden etliche kleine Bugs beseitigt und es wurde ein Double Opt Out für meinen Asarios Blog Newsletter eingerichtet.  \n  \nWünsche viel Spaß mit diesem Release.  \n  \nIn Love, Asario', 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  \nVersion 2.87 enthält einige neue Features und Verbesserungen.  \nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  \n  \nDesweiteren wurden etliche kleine Bugs beseitigt und &hellip;', 1, '2018-08-10 11:13:00', 'e6ea04be6e874d0bb7d71985067f2407', 3, 0, NULL, 0, 1, 1, '2018-08-10 09:13:00', '2018-08-10 09:13:00'),
(120, 1, 'Neue Fotos und neue MCS Version', 'Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.  \nIst ein grosses Release geworden, mit vielen Verbesserungen.  \nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.  \nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog', 'Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.  \nIst ein grosses Release geworden, mit vielen Verbesserungen.  \nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.  \nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog &hellip;', 1, '2018-08-10 20:02:00', 'ac77fddb335d29a06684876f7451b9a0', 3, 0, NULL, 0, 1, 121, '2018-08-10 18:02:00', '2018-08-10 18:02:00'),
(121, 1, 'Neues PM Layout, Stats und MCS-Newsletter', 'Habe am Layout der PM\'s in Asarios Blog gearbeitet.  \nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled  \nHat mich ne Menge Arbeit gekostet, fügt sich jetzt aber besser ins Gesamtbild ein.  \n  \nDer fleißige Newsletterleser kommt jetzt zu Punkten.  \nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort MCS-Points sammeln lassen.  \n  \nMusste deswegen auch die Statistiken erweitern  \n  \nAußerdem hab ich seit den letzten news mal wieder ein paar Did You Know Fragen geupped.  \nHope you enjoy it, Asario', 'Habe am Layout der PM\'s in Asarios Blog gearbeitet.  \nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled  \nHat mich ne Menge Arbeit gekostet, fügt sich jetzt aber besser ins Gesamtbild ein.  \n  \nDer fleißige Newsletterleser kommt jetzt zu Punkten.  \nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort &hellip;', 1, '2018-08-23 17:11:00', '00cbba230337d3b8ddd0303a5f6a75b0', 3, 0, NULL, 0, 1, 122, '2018-08-23 15:11:00', '2018-08-23 15:11:00'),
(122, 1, 'Monstar in D&auml;nemark', 'Mein Monstar hat nach einem Trip durch Dänemark mir seine Selfies geschickt.  \nSind paar nette Bilder dabei. Vielen Dank an Nitropower für die Übermittlung der Bilder.  \nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.  \nHope you enjoy, Asario', 'Mein Monstar hat nach einem Trip durch Dänemark mir seine Selfies geschickt.  \nSind paar nette Bilder dabei. Vielen Dank an Nitropower für die Übermittlung der Bilder.  \nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.  \nHope you enjoy, Asario  ', 1, '2018-09-15 20:23:00', 'b9f3e5d0555ead13b76503ff8c1f0eb5', 3, 0, NULL, 0, 1, 123, '2018-09-15 18:23:00', '2018-09-15 18:23:00'),
(123, 1, 'Kommentaren Folgen', 'Ab Jetzt könnt ihr bestimmten Kommentaren folgen.  \nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.  \nHoffe euch gefällt das Feature und nutzt es auch kräftig.  \nBis bald, Asario', 'Ab Jetzt könnt ihr bestimmten Kommentaren folgen.  \nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.  \nHoffe euch gefällt das Feature und nutzt es auch kräftig.  \nBis bald, Asario   ', 1, '2018-09-26 17:45:00', '3c7646b4186294b8ee99e2c38af17b66', 3, 0, NULL, 0, 1, 124, '2018-09-26 15:45:00', '2018-09-26 15:45:00'),
(124, 1, 'Neuer Button unter Images', 'Es ist ein neuer Button unter Images dazugekommen.  \nunter Voter könnt Ihr nachsehen wer wie viel Punkte vergeben hat.  \nAus der Blackbox ist eine Whitebox Anwendung geworden.', 'Es ist ein neuer Button unter Images dazugekommen.  \nunter Voter könnt Ihr nachsehen wer wie viel Punkte vergeben hat.  \nAus der Blackbox ist eine Whitebox Anwendung geworden.   ', 1, '2018-10-21 16:48:00', 'dd5eaf548dded3190d8e25fcf1738c9b', 3, 0, NULL, 0, 1, 125, '2018-10-21 14:48:00', '2018-10-21 14:48:00'),
(125, 0, 'LCD, LED, OLED, Plasma - Inwiefern unterscheiden sich TV-Geräte?', 'Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen können, setzt sich aus unzähligen Pixeln zusammen. Der Unterschied besteht hauptsächlich in der Erzeugung der Bildpunkte.  \r\n  \r\nLCD, LED - Was bedeuten diese Abkürzungen?  \r\n  \r\nAlle diese Akronyme stammen aus dem Englischen. LCD bedeutet ausgeschrieben \"liquid crystal display\", zu deutsch Flüssigkristallanzeige. In LC-Monitoren werden die namensgebenden, halbdurchsichtigen Flüssigkristalle dafür eingesetzt, die Menge an durchgelassenem Licht zu kontrollieren. Dafür ändern sie ihre Ausrichtung. Die Kristalle befinden sich zwischen zwei sogenannten Polarisationsfilter.  \r\n  \r\nLED- und OLED-Fernseher nutzen ebenfalls Flüssigkristrallanzeigen. Hier bezieht sich die Abkürzung auf die Art der Beleuchtung. TV-Geräte mit der \"light-emitting diode\"-Technologie sind heutzutage die Norm und sind flacher als LCD-Fernseher mit Leuchtstoffröhren. LED bedeutet übersetzt Leuchtdiode.  \r\n  \r\nPlasmafernseher - eine Nummer teurer?  \r\n  \r\nIn einem Plasmafernseher wird das Bild durch Edelgase erzeugt, die in Kammern zwischen zwei Glasplatten liegen. Plasmen senden aufgrund von quantenhaften Emissionen Strahlung, unter anderem in Form von sichtbarem Licht, aus. Da das Licht vom Gas kommt, und keine Hintergrundbeleuchtung wie beim LCD eingesetzt wird, sind sowohl Schwarzwerte, als auch der Kontrast besser. Bisher galten sie außerdem als reaktionsschneller. Sie sind allerdings deutlich teurer in der Anschaffung als LCD-Fernseher. Plasmafernseher verbrauchen desweiteren mehr Energie. Daher haben sie sich auf dem Markt kaum durchgesetzt.  \r\n  \r\nOLED - die Zukunft?  \r\n  \r\nOLED-Fernseher verwenden organische Leuchtdioden, die von selbst verschiedene Farben darstellen. Diese können sehr platzsparend verbaut werden und bieten eine bessere Bildqualität und Räumlichkeit. OLED-Geräte sind allerdings noch sehr teuer in der Herstellung. Langfristig wird sich diese Technologie aber durchsetzen können, da sie die Vorteile von herkömmlichen LCDs und Plasmafernsehern vereint.  \r\n  \r\nBei der Kaufentscheidung sollten Sie sich genau über das gewünschte Produkt informieren, beispielsweise [auf www.fernseher24.com.](http://www.fernseher24.com/) Vor allem Ihr Budget eine große Rolle. Ob es der gebrauchte Samsung-Fernseher im Angebot aus der letzten Generation oder ein neuer ultra hochauflösender OLED-Fernseher wird, entscheidet auch Ihr Geldbeutel.  \r\nvon Melanie Unger (www.fernseher24.com)', 'Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen können, setzt sich aus unzähligen Pixeln zusammen. Der Unterschied besteht hauptsächlich in der Erzeugung der Bildpunkte.  \r\n  \r\nLCD, LED - Was bedeuten diese Abkürzungen?  \r\n  &hellip;', 1, '2018-10-21 19:16:00', 'c2f4a79d679c244ae1155f938c865b3c', 3, 0, NULL, 0, 1, 1, '2018-10-21 17:16:00', '2018-10-21 17:16:00');
INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `content`, `summary`, `blog_author_id`, `blog_date`, `slug`, `reading_time`, `audio_on`, `audio_url`, `audio_duration`, `markdown_on`, `blog_image_id`, `created_at`, `updated_at`) VALUES
(126, 1, 'Neuer Slider auf News Seite.', 'Wie Ihr seht, hab ich den Slider auf der Newsseite verändert.  \nHope you enjoy, Asario', 'Wie Ihr seht, hab ich den Slider auf der Newsseite verändert.  \nHope you enjoy, Asario     ', 1, '2018-11-25 09:16:00', 'fc9c4be033b4e19af0a6cd85b2577706', 3, 0, NULL, 0, 1, 127, '2018-11-25 08:16:00', '2018-11-25 08:16:00'),
(127, 1, 'Neues Feature auf Images Seite', 'Unter [Ausgemaltes](ausgemaltes) könnt Ihr ab jetzt den Fortschritt über Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.', 'Unter [Ausgemaltes](ausgemaltes) könnt Ihr ab jetzt den Fortschritt über Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.    ', 1, '2018-12-02 09:55:00', '7b76e2828b1d1d619d0167a90ef4f3d7', 3, 0, NULL, 0, 1, 128, '2018-12-02 08:55:00', '2018-12-02 08:55:00'),
(128, 1, 'Neues unter DidYouKnow', 'Ich habe mal wieder ein paar Wissenshäppchen verteilt. Ich hoffe sie sind lehrreich.  \nIhr findet sie unter [DidYouKnow](didyouknow).  \nAußerdem ist ein neues Release von MCS veröffentlicht worden.  \nViel Spaß damit, euer Asario.', 'Ich habe mal wieder ein paar Wissenshäppchen verteilt. Ich hoffe sie sind lehrreich.  \nIhr findet sie unter [DidYouKnow](didyouknow).  \nAußerdem ist ein neues Release von MCS veröffentlicht worden.  \nViel Spaß damit, euer Asario.  ', 1, '2018-12-09 10:16:00', '4be6840341103eb12c01f3130695d284', 3, 0, NULL, 0, 1, 129, '2018-12-09 09:16:00', '2018-12-09 09:16:00'),
(129, 1, 'Merry Christmas Folks', 'Auch euch ein schönes Weihnachtsfest mit hoffentlich vielen Geschenken.  \nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.  \nAlles gute aus meiner Heimat, Asario.', 'Auch euch ein schönes Weihnachtsfest mit hoffentlich vielen Geschenken.  \nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.  \nAlles gute aus meiner Heimat, Asario.   ', 1, '2018-12-20 18:12:00', 'dd6222bdf4f1b7291b280f446dbaa1b8', 3, 0, NULL, 0, 1, 130, '2018-12-20 17:12:00', '2018-12-20 17:12:00'),
(130, 1, 'Frohes Neues Freunde', 'Ich wünsche allen ein frohes Neues 2019.  \nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.  \nIch habe Sylvester in Bimöhlen verbracht, war ruhig so weit man das sagen kann...', 'Ich wünsche allen ein frohes Neues 2019.  \nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.  \nIch habe Sylvester in Bimöhlen verbracht, war ruhig so weit man das sagen kann...   ', 1, '2019-01-01 10:41:00', 'a30cf57967dbb91f215f4de33ab78cd0', 3, 0, NULL, 0, 1, 131, '2019-01-01 09:41:00', '2019-01-01 09:41:00'),
(131, 1, 'Neue Kunstwerke gesichtet', 'Ich habe unter <a href=\\\"ausgemaltes\\\">Images->Ausgemaltes</a> ein Bild fertiggestellt, sowie unter <a href=\\\"acryl\\\">Images->Acryl</a> ein neues Bild angefangen.  \n  \nHoffe Ihr mögt die Motive, in love, Asario', 'Ich habe unter <a href=\\\"ausgemaltes\\\">Images->Ausgemaltes</a> ein Bild fertiggestellt, sowie unter <a href=\\\"acryl\\\">Images->Acryl</a> ein neues Bild angefangen.  \n  \nHoffe Ihr mögt die Motive, in love, Asario &hellip;', 1, '2019-02-22 16:16:00', '8bd1c72fd7bc3c21cd829b1dc9dbe4da', 3, 0, NULL, 0, 1, 132, '2019-02-22 15:16:00', '2019-02-22 15:16:00'),
(132, 1, 'F&uuml;r alle Apfel Nerds und 4K Nutzer', 'Dank einer kleineren Änderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgelöstes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.  \n  \nViel Spaß damit, euer Asario', 'Dank einer kleineren Änderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgelöstes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.  \n  \nViel Spaß damit, euer Asario  ', 1, '2019-03-24 15:19:00', 'deb2c66a511e036ed8211185d55e14db', 3, 0, NULL, 0, 1, 133, '2019-03-24 14:19:00', '2019-03-24 14:19:00'),
(133, 1, 'Monstarz United', 'Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz überführt worden.  \nAnsonsten hat sich nix verändert. Hoffe euch gefallen die neuen alten Bilder.  \n  \nIn Love, Asario.', 'Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz überführt worden.  \nAnsonsten hat sich nix verändert. Hoffe euch gefallen die neuen alten Bilder.  \n  \nIn Love, Asario.   ', 1, '2019-03-29 16:04:00', '7e7c197b9e7cc31b1cb2b9c297d50478', 3, 0, NULL, 0, 1, 134, '2019-03-29 15:04:00', '2019-03-29 15:04:00'),
(134, 1, 'Frohe Ostern', 'Ich wünsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).  \nDie Lämmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz großer Gefahr.  \n  \nAch ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points einstreichen, Viel Spaß beim suchen.  \nDie Easter Egg Aktion gilt noch bis 30.4.2019.  \n  \nWeiterhin viele grüße aus dem sonnigen Bimöhlen, Asario', 'Ich wünsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).  \nDie Lämmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz großer Gefahr.  \n  \nAch ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points &hellip;', 1, '2019-04-20 13:28:00', '719c1f9efd8d6860cc962dbdb33ab7fb', 3, 0, NULL, 0, 1, 135, '2019-04-20 11:28:00', '2019-04-20 11:28:00'),
(135, 1, 'Besuch bei meinem kleinem Neffen', 'Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten können.  \nEcht süß der kleine Racker. Alfred, so heißt er ist ein echt süßes Baby.  \nMit einem Kampfgewicht von 4290 g und einer Körperlänge von 56 cm war das ein ganz schöner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  \n  \nAußerdem habe ich ein Wallpaper mit Alfred verschönert.  \nUnd ich habe die Prämien verändert. Viele Artworks sind jetzt mit noch weniger Punkten zu haben. Viel Spaß beim posten & bewerten.', 'Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten können.  \nEcht süß der kleine Racker. Alfred, so heißt er ist ein echt süßes Baby.  \nMit einem Kampfgewicht von 4290 g und einer Körperlänge von 56 cm war das ein ganz schöner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  &hellip;', 1, '2019-05-27 11:16:00', 'a583db1a6e4156a585a974b18f65bd2c', 3, 0, NULL, 0, 1, 136, '2019-05-27 09:16:00', '2019-05-27 09:16:00'),
(136, 1, 'Anubis fast fertig', 'Mein Gold Anubis ist auf der Zielgerade angekommen.  \nEin paar Details an der Schnauze müssen noch gemacht werden, ansonsten ist er Fertig.  \nMein bisher aufwendigstes Kunstwerk nähert sich der Fertigstellung.', 'Mein Gold Anubis ist auf der Zielgerade angekommen.  \nEin paar Details an der Schnauze müssen noch gemacht werden, ansonsten ist er Fertig.  \nMein bisher aufwendigstes Kunstwerk nähert sich der Fertigstellung.   ', 1, '2019-06-23 08:40:00', '2dfc67ff26995c266c186906d37ae551', 3, 0, NULL, 0, 1, 137, '2019-06-23 06:40:00', '2019-06-23 06:40:00'),
(137, 1, 'MCS Doku Multi-Language', 'Ich überarbeite zur Zeit die MCS Dokumentation.  \nWenn ich alle Texte übersetzt und alle Grafiken überarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht weiß.  \nIch hoffe meine Englischen Fans danken es mir.', 'Ich überarbeite zur Zeit die MCS Dokumentation.  \nWenn ich alle Texte übersetzt und alle Grafiken überarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht weiß.  \nIch hoffe meine Englischen Fans danken es mir.  ', 1, '2019-06-30 13:22:00', '3f9a576af20262fff4cf442ed6462a34', 3, 0, NULL, 0, 1, 138, '2019-06-30 11:22:00', '2019-06-30 11:22:00'),
(138, 1, 'Anubis fertig', 'Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.  \nVielen Dank noch mal an Sigi für die Hilfe bei diesem Bild. Ohne dich hätte ich das nie geschafft.  \n  \nWer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.', 'Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.  \nVielen Dank noch mal an Sigi für die Hilfe bei diesem Bild. Ohne dich hätte ich das nie geschafft.  \n  \nWer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.  ', 1, '2019-09-06 15:58:00', 'd3a3b70995252f0fccd0909c1add3a54', 3, 0, NULL, 0, 1, 139, '2019-09-06 13:58:00', '2019-09-06 13:58:00'),
(139, 1, 'Shariff Online', 'Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.  \nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich wünsche viel Spaß beim Teilen meiner Inhalte.', 'Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.  \nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich wünsche viel Spaß beim Teilen meiner Inhalte.  ', 1, '2019-09-15 10:34:00', '71df6806b35005213c0aa2b0e7090608', 3, 0, NULL, 0, 1, 140, '2019-09-15 08:34:00', '2019-09-15 08:34:00'),
(140, 1, 'Neue Folgen Funktion', 'Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.  \nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.  \n  \nNach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie immer im Detail.  \n  \nFür alle Members, die Standard Einstellung beim folgen ist folgen per E-mail.', 'Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.  \nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.  \n  \nNach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie &hellip;', 1, '2019-10-03 09:08:00', '43c936606434d512b27783522102fd00', 3, 0, NULL, 0, 1, 141, '2019-10-03 07:08:00', '2019-10-03 07:08:00'),
(141, 1, 'Merry Christmas and a happy New Year', 'Auch dieses Jahr geht zu ende und wir haben viel geschafft.  \nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genießen .  \n  \nIch wünsche allen die dies Lesen ein frohes Fest zu Feiern.  \nUnd rutscht gut rein....', 'Auch dieses Jahr geht zu ende und wir haben viel geschafft.  \nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genießen .  \n  \nIch wünsche allen die dies Lesen ein frohes Fest zu Feiern.  \nUnd rutscht gut rein....  ', 1, '2019-12-23 23:59:00', '537052b0ba7fa3d5392e93d23d94746d', 3, 0, NULL, 0, 1, 142, '2019-12-23 22:59:00', '2019-12-23 22:59:00'),
(142, 1, 'Gut reingerutscht?', 'Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.  \nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario kürzlich in einem Interview zum neuen Jahr.  \n  \nViel Glück, Leute.', 'Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.  \nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario kürzlich in einem Interview zum neuen Jahr.  \n  \nViel Glück, Leute.  ', 1, '2019-12-28 17:54:00', '76fd74bb02b9fec6554854d3b936947f', 3, 0, NULL, 0, 1, 143, '2019-12-28 16:54:00', '2019-12-28 16:54:00'),
(143, 1, 'Zwei Faktor Authentifizierung auf Asarios Blog', 'Ab jetzt könnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.  \nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.  \nSicherheit ist für mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.  \n  \nHoffe Ihr genießt den Komfort der 2 Faktor Authentifizierung.  \n  \nEhe ich\'s vergesse, hab mal wieder nen paar Wissenshappen unter DidYouKnow verteilt.', 'Ab jetzt könnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.  \nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.  \nSicherheit ist für mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.  \n  \nHoffe Ihr genießt den Komfort der 2 Faktor Authentifizierung. &hellip;', 1, '2020-01-12 13:47:00', '2f257a5010ba985bbda29f4cb10f9b57', 3, 0, NULL, 0, 1, 144, '2020-01-12 12:47:00', '2020-01-12 12:47:00'),
(144, 1, 'Ich verlasse Bim&ouml;hlen', 'Nächste Woche ziehe ich aus Mederius in Bimöhlen aus.  \nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen nächsten Schritt in Richtung Selbständigkeit. Ich ziehe in eine Teilstationäre WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.  \n  \nIch Spare mir dann 2 Stunden pro Arbeitstag an Fahrerei.  \nAllerdings muss ich trotzdem mehr machen, wie Kochen und Putzen.  \n  \nIch bin schon sehr aufgeregt und freue mich.', 'Nächste Woche ziehe ich aus Mederius in Bimöhlen aus.  \nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen nächsten Schritt in Richtung Selbständigkeit. Ich ziehe in eine Teilstationäre WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.  \n  \nIch Spare mir dann 2 Stunden pro Arbeitstag an &hellip;', 1, '2020-02-23 16:06:00', '7a204bda810b3297efae9c49f41003cd', 3, 0, NULL, 0, 1, 145, '2020-02-23 15:06:00', '2020-02-23 15:06:00'),
(145, 1, 'Willkommen SE', 'Herzlich Willkommen in Bad Segeberg.  \nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.  \nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.  \nIch habe die ersten Nächte hinter mir und es schläft sich gut im meinem neuem Bett.  \nGrüße aus meinem Homeoffice, Asario 8)', 'Herzlich Willkommen in Bad Segeberg.  \nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.  \nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.  \nIch habe die ersten Nächte hinter mir und es schläft sich gut im meinem neuem Bett.  \nGrüße aus meinem Homeoffice, Asario 8) &hellip;', 1, '2020-03-04 15:47:00', '0a9ee14fd007665e52cade00544814fd', 3, 0, NULL, 0, 1, 146, '2020-03-04 14:47:00', '2020-03-04 14:47:00'),
(146, 1, 'Neue Bilder gesichtet', 'Auch dieses mal hab ich mich kreativ betätigt und 2 neue Fineliner Bilder gemalt.  \nHoffe sie gefallen euch, in love, Asario', 'Auch dieses mal hab ich mich kreativ betätigt und 2 neue Fineliner Bilder gemalt.  \nHoffe sie gefallen euch, in love, Asario    ', 1, '2020-08-16 13:52:00', '34729c492112e67537b94732d6c69855', 3, 0, NULL, 0, 1, 147, '2020-08-16 11:52:00', '2020-08-16 11:52:00'),
(147, 1, 'Neues Layout auf Asario.de', 'Herzlich willkommen im grey theme von Asarios Blog.  \nHoffe ihr findet das Layout auch so gut wie ich.  \nIst nur wenig anders aber doch anders.  \nHabt Spaß und kommentiert fleißig.  \nIn Love, Asario', 'Herzlich willkommen im grey theme von Asarios Blog.  \nHoffe ihr findet das Layout auch so gut wie ich.  \nIst nur wenig anders aber doch anders.  \nHabt Spaß und kommentiert fleißig.  \nIn Love, Asario   ', 1, '2020-09-06 17:51:00', '52966411a2af8a861d7a3f9551a9a947', 3, 0, NULL, 0, 1, 148, '2020-09-06 15:51:00', '2020-09-06 15:51:00'),
(148, 1, 'Frohes Neues', 'An alle Freunde und Bekannte, Ich wünsche ein frohes neues 2021.  \nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genießen können. Ich wünsche euch allen das Ihr gesund und munter das neue Jahr verlebt.  \n  \nAuf ein schönes, gesundes 2021, Asario', 'An alle Freunde und Bekannte, Ich wünsche ein frohes neues 2021.  \nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genießen können. Ich wünsche euch allen das Ihr gesund und munter das neue Jahr verlebt.  \n  \nAuf ein schönes, gesundes 2021, Asario &hellip;', 1, '2021-01-01 00:32:00', '8c41d111895c4e9f89d9b8aa13bee64f', 3, 0, NULL, 0, 1, 149, '2020-12-31 23:32:00', '2020-12-31 23:32:00'),
(149, 1, 'Back in town...', 'Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.  \nHabe während meines Aufenthalts viel gemalt wie man unter [Images->Fineliner](fineliner) erkennen kann.', 'Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.  \nHabe während meines Aufenthalts viel gemalt wie man unter [Images->Fineliner](fineliner) erkennen kann.  ', 1, '2021-08-12 13:14:00', '7b120dc10519204a1c57d3adbbbc3644', 3, 0, NULL, 0, 1, 150, '2021-08-12 11:14:00', '2021-08-12 11:14:00'),
(150, 1, 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', 'Bin wieder im Lande angekommen.  \nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.  \nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.', 'Bin wieder im Lande angekommen.  \nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.  \nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.  ', 1, '2021-10-09 20:19:00', '10d2294dcd3030deb841507dcfe4379f', 3, 0, NULL, 0, 1, 151, '2021-10-09 18:19:00', '2021-10-09 18:19:00'),
(151, 2, 'Neues von MCS', 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  \n  \nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  \n  \nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  \n  \nWar ne Zeit lang ohne Internet und konnte somit nichts Posten.  \n  \nWünsche viel Spaß auf [www.asario.de](https://www.asario.de)', 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  \n  \nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  \n  \nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  \n  \nWar ne Zeit lang ohne Internet und konnte somit &hellip;', 1, '2021-10-09 23:14:00', '0f9bd3bf70db225eede993a53ec017ea', 3, 0, NULL, 0, 1, 1, '2021-10-09 21:14:00', '2021-10-09 21:14:00'),
(152, 1, 'Merry X-Mas 2021', 'Ich wünsche euch ein Frohes Fest.  \nHoffe es gab lecker Essen und Trinken zu Weihnachten.  \nIch habe gestern die 3te von 9 Leinwänden für mein Großprojekt fertig gestellt.  \nEl Novem ist noch in Arbeit aber sieht relativ geil aus.', 'Ich wünsche euch ein Frohes Fest.  \nHoffe es gab lecker Essen und Trinken zu Weihnachten.  \nIch habe gestern die 3te von 9 Leinwänden für mein Großprojekt fertig gestellt.  \nEl Novem ist noch in Arbeit aber sieht relativ geil aus.  ', 1, '2021-12-25 10:42:00', '086e03050016bca0cd0d9be2400914df', 3, 0, NULL, 0, 1, 153, '2021-12-25 09:42:00', '2021-12-25 09:42:00'),
(153, 1, 'Neues Feature', 'Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.  \nHoffe Ihr habt spaß mit den Sternen.  \nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.', 'Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.  \nHoffe Ihr habt spaß mit den Sternen.  \nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.  ', 1, '2022-02-15 12:15:00', '7714b1adf9b7f1df058e1dd0b9088712', 3, 0, NULL, 0, 1, 154, '2022-02-15 11:15:00', '2022-02-15 11:15:00'),
(154, 1, 'Solidarit&auml;t mit der Ukraine', 'Ich wünsche allen UkrainerInnen da draußen das der Krieg bald vorüber geht.  \n  \nKrieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,  \nund wir hoffen das dieser Krieg bald endet.  \n  \nIn Frieden, Asario', 'Ich wünsche allen UkrainerInnen da draußen das der Krieg bald vorüber geht.  \n  \nKrieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,  \nund wir hoffen das dieser Krieg bald endet.  \n  \nIn Frieden, Asario  ', 1, '2022-04-27 19:13:00', 'dc7ac065d0257e11a5aa53be5db029ae', 3, 0, NULL, 0, 1, 155, '2022-04-18 22:00:00', '2022-04-18 22:00:00'),
(155, 1, '3D Printer Objekte', 'Happy Birthday to me.  \nHabe meinen 3D Drucker in Betrieb genommen und mal was Künstlerisches gedruckt.  \nEs ist ein Relief erstellt und mit PLA gedruckt worden.  \nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.  \n  \nHope you enjoy, Asario', 'Happy Birthday to me.  \nHabe meinen 3D Drucker in Betrieb genommen und mal was Künstlerisches gedruckt.  \nEs ist ein Relief erstellt und mit PLA gedruckt worden.  \nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.  \n  \nHope you enjoy, Asario &hellip;', 1, '2022-06-19 15:15:00', '6cb3d83f7932ee548e834a91b05f575d', 3, 0, NULL, 0, 1, 156, '2022-06-28 22:00:00', '2022-06-28 22:00:00'),
(156, 2, 'Neuerungen im System', 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  \r\n  \r\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  \r\nAußerdem mal wieder etliche kleinere und größere Bugs behoben.  \r\nWünsche viel Spaß bei meinen Seiten.  \r\nCincerly Paul Rieser aka. Asario', 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  \r\n  \r\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  \r\nAußerdem mal wieder etliche kleinere und größere Bugs behoben.  \r\nWünsche viel Spaß bei meinen Seiten.  \r\nCincerly Paul Rieser aka. Asario &hellip;', 1, '2022-10-09 11:14:00', '23d8d902068b75b6edd789c20150ba0b', 3, 0, NULL, 0, 1, 157, '2022-10-09 09:14:00', '2022-10-09 09:14:00'),
(157, 1, 'Neues aus PLA', 'Mein 3D Drucker l&auml;uft warm und hat mir die Galerie [3D Printer](3DPrinter) erm&ouml;glicht. Hoffe euch gefallen die Drucke.', 'Mein 3D Drucker l&auml;uft warm und hat mir die Galerie [3D Printer](3DPrinter) erm&ouml;glicht. Hoffe euch gefallen die Drucke.    ', 1, '2022-11-05 15:56:00', '499bdd396496bfea2274ce8967c82b82', 3, 0, NULL, 0, 1, 158, '2022-11-05 14:56:00', '2022-11-05 14:56:00'),
(158, 1, 'Happy 2023', 'Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten können.  \nHabe mal wieder an der Sicherheit von MCS gearbeitet.  \nWünsche viel Spaß auf meinen Seiten / meiner Seite.', 'Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten können.  \nHabe mal wieder an der Sicherheit von MCS gearbeitet.  \nWünsche viel Spaß auf meinen Seiten / meiner Seite.   ', 1, '2023-01-22 14:07:00', 'a1850e2f0cea31839df888e3423db94e', 3, 0, NULL, 0, 1, 159, '2023-01-22 13:07:00', '2023-01-22 13:07:00'),
(159, 1, 'Winter in town', 'Es ist kalt geworden und der Winter hat uns fest im Griff.  \r\nIch hoffe, ihr m&uuml;sst nicht raus, es ist  sehr  kalt.  \r\nHabe wieder ein paar Bugs gefunden und beseitigt.  \r\nCiao, Asario', 'Es ist kalt geworden und der Winter hat uns fest im Griff.  \r\nIch hoffe, ihr m&uuml;sst nicht raus, es ist  sehr  kalt.  \r\nHabe wieder ein paar Bugs gefunden und beseitigt.  \r\nCiao, Asario   ', 1, '2023-01-27 19:03:00', 'ece1e0956e588978d5b71e28ca9db06e', 3, 0, NULL, 0, 1, 160, '2023-01-27 18:03:00', '2023-01-27 18:03:00'),
(160, 2, 'Winter Update', 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  \r\nDie Google Sitemap wurden überarbeitet und verschönert.  \r\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  \r\nBugs waren auch einige dabei, alle behoben.  \r\nHoffe ihr habt spass auf meinen Seiten.', 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  \r\nDie Google Sitemap wurden überarbeitet und verschönert.  \r\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  \r\nBugs waren auch einige dabei, alle behoben.  \r\nHoffe ihr habt spass auf meinen Seiten. &hellip;', 1, '2023-02-04 13:05:00', '898501c0f73954e48990b203c2fea3ae', 3, 0, NULL, 0, 1, 161, '2023-02-04 12:05:00', '2023-02-04 12:05:00'),
(161, 1, 'Frohe Ostern 2023', 'Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.  \nIn diesem Sinne, Frohe Ostern, Asario', 'Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.  \nIn diesem Sinne, Frohe Ostern, Asario &hellip;', 1, '2023-02-13 09:56:00', '9961534e2caf9e9240a0f1c9842ea13b', 3, 0, NULL, 0, 1, 162, '2023-02-13 08:56:00', '2023-02-13 08:56:00'),
(162, 1, 'Fr&uuml;hling', 'Das Ende des Winters bringt eine Ver&auml;nderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden w&auml;rmer und die Tage l&auml;nger.  \r\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort sch&ouml;n ist wenn die Sonne zu scheinen beginnt. AuÃ?erdem ist Eekholdt gleich um die Ecke und immer einen Besuch wert.', 'Das Ende des Winters bringt eine Ver&auml;nderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden w&auml;rmer und die Tage l&auml;nger.  \r\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort sch&ouml;n ist wenn die Sonne zu scheinen beginnt. &hellip;', 1, '2023-02-22 16:10:00', '4d152837df543a0524e94cb35dfd2bd7', 3, 0, NULL, 0, 1, 163, '2023-02-22 15:10:00', '2023-02-22 15:10:00'),
(163, 2, 'Verbesserte Feeds', 'Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed lädt jetzt schneller, und seit kurzem auch in Englisch verfügbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar kleinere Bugs zu beheben die ich kürzlich gefixt habe.Und da alles gut läuft freue ich mich auf kommende Spannende Features die noch entwickelt werden wollen.', 'Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed lädt jetzt schneller, und seit kurzem auch in Englisch verfügbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar &hellip;', 1, '2023-03-11 13:03:00', '93639873949f60a11ed5a1fc9d549859', 3, 0, NULL, 0, 1, 164, '2023-03-11 12:03:00', '2023-03-11 12:03:00'),
(164, 2, 'Neue Sterne', 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zunächst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** wieder einen Schritt weiter gekommen und ich habe den einen oder anderen Bug behoben.\r\nIch hoffe ihr habt Spaß, Asario', 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zunächst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** &hellip;', 1, '2023-05-07 10:42:00', '23ac16d033377889adc24dc8e1b6127b', 3, 0, NULL, 0, 1, 165, '2023-05-07 08:42:00', '2023-05-07 08:42:00'),
(165, 1, 'Sommer 2023', 'Auch in diesem Quartal habe ich wieder einige Änderungen vorgenommen.\r\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde überarbeitet.\r\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was für welchen Zweck gesammelt wird.\r\nDie Bildberbewertung auf asario.de habe ich etwas verändert.\r\nWenn die Sterne halb gelb sind, hat man noch nicht bewertet, wenn sie ganz gelb sind, wurden schon Sterne vergeben.\r\nAußerdem habe ich wieder ein paar kleine Fehler behoben, die mir im Laufe der Zeit aufgefallen sind.\r\n\r\n\r\nIch wünsche euch einen sonnigen Sommer, bis bald, Asario.', 'Auch in diesem Quartal habe ich wieder einige Änderungen vorgenommen.\r\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde überarbeitet.\r\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was für welchen Zweck gesammelt wird.\r\nDie Bildberbewertung auf &hellip;', 1, '2023-05-29 12:02:00', '43c622a37b1034cb87696d2f55ddd5c9', 3, 0, NULL, 0, 1, 166, '2023-05-29 10:02:00', '2023-05-29 10:02:00'),
(166, 1, 'Sp&auml;tsommer 2023', 'ich m&ouml;chte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu k&ouml;nnen, dass es wieder aufgetaucht ist und sich auf den Weg nach Berlin gemacht hat! Das ist wirklich aufregend und ich bin gespannt, welche Abenteuer ihn dort erwarten.\r\n\r\nIch habe in den letzten Tagen und Wochen hart gearbeitet, um einige kleinere Bugs zu beheben und Verbesserungen an meinen Seiten vorzunehmen. Es war eine Herausforderung, aber es hat sich definitiv gelohnt. Ich m&ouml;chte, dass ihr als Besucher ein optimales Erlebnis habt und euch auf meinen Seiten wohlf&uuml;hlt. Deshalb ist es mir wichtig, diese technischen H&uuml;rden aus dem Weg zu r&auml;umen und das Beste aus meinen Websites herauszuholen.\r\n\r\nIch freue mich auf die kommenden Wochen und Monate und hoffe, dass ihr weiterhin mit mir auf meiner Reise seid. Eure Unterst&uuml;tzung und Begeisterung bedeuten mir alles. Lasst uns gemeinsam diese aufregende Zeit genieÃ?en und viele unvergessliche Momente teilen.\r\n\r\nHoffe Ihr habt SpaÃ? auf meinen Seiten, in Love, Asario', 'ich m&ouml;chte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu k&ouml;nnen, dass es wieder aufgetaucht ist und sich &hellip;', 1, '2023-07-22 15:38:00', '67ae3b91baa34ba55cd22f2ba32dc8aa', 3, 0, NULL, 0, 1, 167, '2023-07-22 13:38:00', '2023-07-22 13:38:00'),
(167, 1, 'Herbst 2023', 'Hallo zusammen!\r\n\r\nIch habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und lästige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verläuft. Die gemütlichen Vibes des Herbstes begleiten nun eure Uploads.\r\n\r\nEine benutzerfreundliche Oberfläche ermöglicht es Nutzern, Inhalte schnell hochzuladen, zu organisieren und anzuzeigen, ohne technisches Fachwissen zu benötigen. Dies spart Zeit und Mühe bei der Verwaltung von Dateien/Bildern und erleichtert die Fokussierung auf die eigentliche Inhaltsproduktion.\r\n\r\nInsgesamt bietet das neu gestaltete Upload-Skript eine verbesserte Benutzererfahrung und trägt dazu bei, den Arbeitsablauf bei der Erstellung und Verwaltung von Inhalten zu optimieren.\r\n\r\n Ich wünsche euch einen wunderschönen Herbst voller Wärme und Freude.', 'Hallo zusammen!\r\n\r\nIch habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und lästige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verläuft. Die gemütlichen Vibes des Herbstes begleiten nun eure Uploads.\r\n\r\nEine benutzerfreundliche Oberfläche ermöglicht es Nutzern, Inhalte schnell &hellip;', 1, '2023-08-21 15:27:00', '11cc28c7b621586b96d21c518cebd3dc', 3, 0, NULL, 0, 1, 168, '2023-08-21 13:27:00', '2023-08-21 13:27:00'),
(168, 1, 'Winter & 2fa', 'Der Winter h&uuml;llte die Welt in ein schneewei&szlig;es M&auml;rchen. Schlittenfahrten und fr&ouml;hliche Abenteuer auf den H&uuml;geln lieÃ?en uns den Zauber der kalten Tage sp&uuml;ren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige W&auml;rme gem&uuml;tliche Stunden bescherten.\n\n**Natur und Gemeinschaft:**\nDie verschneite Landschaft und klirrend kalte N&auml;chte schufen eine bezaubernde Kulisse. Gleichzeitig lieÃ?en Nachbarschaftshilfe und winterliche Aktivit&auml;ten eine wohltuende Gemeinschaft entstehen. Dieser Wintermonat wurde zu einer Zeit der inneren Einkehr, kulinarischer Freuden und Vorfreude auf das Erwachen der Natur im kommenden Fr&uuml;hling.\n\n**Zwei-Faktor-Authentifizierung Update f&uuml;r Asario.de:**\n\nWir freuen uns, Ihnen mitteilen zu k&ouml;nnen, dass Asario.de jetzt OTP (One-Time Passwords) unterst&uuml;tzt, um Ihren Login noch sicherer zu gestalten. Diese Funktion finden Sie in den Profil-Einstellungen unter **2FA aktivieren**.\n\nZus&auml;tzlich haben wir die M&ouml;glichkeit integriert, Ihre Kontowiederherstellungscodes direkt in Ihrem Benutzerprofil zu verwalten. Diese zus&auml;tzliche SicherheitsmaÃ?nahme gew&auml;hrleistet ein hohes Sicherheitsniveau\nBitte beachten Sie: Geben Sie die Codes niemals an andere weiter. Wir werden Sie niemals nach den 2fa-Codes fragen.\nBei Fragen oder Anliegen stehen wir Ihnen jederzeit zur Verf&uuml;gung.', 'Der Winter h&uuml;llte die Welt in ein schneewei&szlig;es M&auml;rchen. Schlittenfahrten und fr&ouml;hliche Abenteuer auf den H&uuml;geln lieÃ?en uns den Zauber der kalten Tage sp&uuml;ren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige W&auml;rme &hellip;', 1, '2023-09-30 17:05:00', 'c8b89da4c750dc2aa5cbed6a63716d2f', 3, 0, NULL, 0, 1, 169, '2023-09-30 15:05:00', '2023-09-30 15:05:00'),
(169, 1, 'Halloween 2023', 'Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verr&uuml;cktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haust&uuml;r sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. Also, schnapp dir dein Kost&uuml;m und mach dich bereit f&uuml;r eine unvergessliche Halloween-Nacht!', 'Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verr&uuml;cktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haust&uuml;r sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. &hellip;', 1, '2023-10-31 21:02:00', '5643d9ac757fc1de84e09b32dff42961', 3, 0, NULL, 0, 1, 170, '2023-10-31 20:02:00', '2023-10-31 20:02:00'),
(170, 2, 'Update zur Zwei-Faktor-Authentifizierung', 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese Codes nutzen, um sich einzuloggen.\r\n\r\nNach der Aktivierung der Zwei-Faktor-Authentifizierung zeigt Ihnen die Seite Ihre persönlichen Wiederherstellungscodes an. Sie finden diese in Ihrem Benutzerprofil unter Profil-Einstellungen außerdem über dem \"Wiederherstellungscodes\"-Button.\r\n\r\nFür eventuelle Fragen oder Unterstützung stehen wir Ihnen gerne zur Verfügung. Bitte beachten Sie: Geben Sie diese Codes niemals an andere weiter. Sicherheit hat bei uns oberste Priorität!\r\n\r\nMit freundlichen Grüßen, Asario', 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese &hellip;', 1, '2023-11-22 16:01:00', 'b1810b700b5ebe9003314cd4b311693c', 3, 0, NULL, 0, 1, 171, '2023-11-21 23:00:00', '2023-11-21 23:00:00'),
(171, 1, 'Frohe Weihnachten 2023', 'Die festliche Jahreszeit ist angebrochen, und mit jedem Tag w&auml;chst die Vorfreude auf das Weihnachtsfest. In den geschm&uuml;ckten StraÃ?en und liebevoll dekorierten H&auml;usern spiegelt sich die warme Atmosph&auml;re dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der Auswahl von Geschenken, dem Zubereiten k&ouml;stlicher Mahlzeiten oder dem Teilen von Traditionen.\r\n\r\nWeihnachten ist mehr als nur ein festlicher Anlass; es ist eine Zeit der Besinnung. Inmitten von Geselligkeit und Freude sollten wir auch innehalten, um das vergangene Jahr zu reflektieren. M&ouml;ge die Magie von Weihnachten uns mit Liebe, Mitgef&uuml;hl und Hoffnung erf&uuml;llen. Frohe Weihnachten an euch alle!', 'Die festliche Jahreszeit ist angebrochen, und mit jedem Tag w&auml;chst die Vorfreude auf das Weihnachtsfest. In den geschm&uuml;ckten StraÃ?en und liebevoll dekorierten H&auml;usern spiegelt sich die warme Atmosph&auml;re dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der &hellip;', 1, '2023-12-16 17:09:00', 'f0b9bce219e7f868f33644fe128068df', 3, 0, NULL, 0, 1, 172, '2023-12-16 16:09:00', '2023-12-16 16:09:00'),
(172, 3, 'KI, Webdesign, Kunst und Fotografie', 'Als leidenschaftlicher Blogger erkunde ich in meinen Beitr&auml;gen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der K&uuml;nstlichen Intelligenz &uuml;ber innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - ich m&ouml;chte euch auf kurzweilige Weise inspirieren und ihre Neugier f&uuml;r diese spannenden Themen wecken. Begleite mich auf dieser Entdeckungsreise durch die faszinierende Fusion von Technologie und Kreativit&auml;t!', 'Als leidenschaftlicher Blogger erkunde ich in meinen Beitr&auml;gen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der K&uuml;nstlichen Intelligenz &uuml;ber innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - &hellip;', 1, '2024-01-09 22:14:00', '510745f9bb217d1e01521caddef90eaa', 3, 0, NULL, 0, 1, 173, '2024-01-09 21:14:00', '2024-01-09 21:14:00'),
(173, 1, 'Frühling', 'Ja, der Frühling steht vor der Tür, und mit ihm kommt auch Ostern näher. In vielen Teilen der Welt ist der Frühling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden länger, die Blumen blühen, und die Temperaturen steigen langsam an.\r\n\r\nOstern ist ein festliches Ereignis, das in vielen Kulturen und Traditionen gefeiert wird. Es markiert die Auferstehung Jesu Christi und wird oft mit verschiedenen Bräuchen und Feierlichkeiten begangen. Dazu gehören das Färben und Verstecken von Ostereiern, das Dekorieren von Osternestern, Ostermärkte, Osterfeuer und vieles mehr.\r\n\r\nEs ist eine Zeit der Freude, des Zusammenseins mit Familie und Freunden und des Genießens der Frühlingsstimmung. Egal, ob man religiöse Rituale begeht oder einfach die Gelegenheit nutzt, um sich zu entspannen und das schöne Wetter zu genießen, der Frühling und Ostern bieten eine willkommene Abwechslung nach den kalten Wintermonaten.', 'Ja, der Frühling steht vor der Tür, und mit ihm kommt auch Ostern näher. In vielen Teilen der Welt ist der Frühling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden länger, die Blumen blühen, und die Temperaturen steigen langsam &hellip;', 1, '2024-03-14 16:10:00', 'dde9b0f3364b6da067da3baa23272668', 3, 0, NULL, 0, 1, 174, '2024-03-13 23:00:00', '2024-03-13 23:00:00'),
(174, 1, 'Sommer 2024', 'Der Sommer steht vor der T&uuml;r und bringt warme Temperaturen, sonnige Tage und endlose M&ouml;glichkeiten f&uuml;r Outdoor-Aktivit&auml;ten mit sich. Es ist die perfekte Zeit, um die Natur zu genie&szlig;en, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand entspannst, wandern gehst oder einfach nur die warmen Sommerabende genie&szlig;t, diese Jahreszeit bietet f&uuml;r jeden etwas.\r\n\r\nNutze den Sommer, um neue Hobbys auszuprobieren, Freunde zu treffen und unvergessliche Momente zu schaffen. Es ist eine Zeit des Neubeginns, der Erholung und der Freude. Also pack die Sonnencreme ein, zieh deine Sommerschuhe an und mach dich bereit, den Sommer in vollen Z&uuml;gen zu genie&szlig;en!', 'Der Sommer steht vor der T&uuml;r und bringt warme Temperaturen, sonnige Tage und endlose M&ouml;glichkeiten f&uuml;r Outdoor-Aktivit&auml;ten mit sich. Es ist die perfekte Zeit, um die Natur zu genie&szlig;en, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand &hellip;', 1, '2024-04-21 15:54:00', '73ae0dd610479903b7f0829c363ce59d', 3, 0, NULL, 0, 1, 175, '2024-04-21 13:54:00', '2024-04-21 13:54:00'),
(175, 1, 'Neues Layout', 'Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgfältig ausgewählt.\r\nIch hoffe, dass euch das neue Design genauso gut gefällt wie mir. Schaut euch um und lasst mich wissen, was Ihr  denkt!\r\n\r\nVielen Dank, dass ihr Teil unserer Community seid.\r\n\r\nEuer Team', 'Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgfältig ausgewählt.\r\nIch hoffe, dass euch das neue Design genauso gut gefällt wie mir. Schaut euch um und lasst mich wissen, was Ihr  denkt!\r\n\r\nVielen Dank, dass ihr &hellip;', 1, '2024-07-17 00:00:00', 'f1482144111d39d3f807830d940211db', 3, 0, NULL, 0, 1, 176, '2024-07-16 22:00:00', '2024-07-16 22:00:00'),
(176, 2, 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen habe, mit euch teilen.\r\n\r\n**Warum PHP 8.2?**\r\nPHP 8.2 bringt viele neue Features und Verbesserungen, die sowohl die Performance als auch die Sicherheit betreffen. Besonders interessant fand ich die verbesserten Type Declarations und die optimierten Fehlerbehandlungsmechanismen. Allerdings bedeutet ein Versionssprung auch, dass bestehender Code Überarbeitet werden muss.\r\n\r\nDie Herausforderung: Variablen deklarieren\r\nEin großes Problem, auf das ich stieß, war, dass PHP 8.2 strenger mit der Variablendeklaration umgeht. Das bedeutet, dass ich in meinem Code viele Variablen explizit deklarieren musste, bevor sie verwendet wurden. Das war zeitaufwendig, weil ich jeden einzelnen Fall durchgehen und sicherstellen musste, dass alle Variablen korrekt initialisiert sind.\r\n\r\n**Die Testphase: Alles durchprobieren**\r\nNachdem ich die Variablen angepasst hatte, begann die intensive Testphase. Ich musste alle Funktionen und Skripte durchprobieren, um sicherzustellen, dass sie unter PHP 8.2 wie gewünscht funktionieren. Es war frustrierend, auf unerwartete Fehlermeldungen zu stoßen, aber nach und nach konnte ich alle Probleme beheben.\r\n\r\nDas Ergebnis: Ein schnelleres und sichereres System\r\nNach all der Arbeit kann ich stolz sagen, dass mein System nun unter PHP 8.2 läuft - und das schneller und sicherer als je zuvor. Die Mühe hat sich gelohnt, und ich bin gespannt, wie sich diese Optimierungen langfristig auswirken werden.\r\n\r\n**Fazit:**\r\nDie Aktualisierung auf PHP 8.2 war eine Herausforderung, aber auch eine wertvolle Lernerfahrung. Wenn du ebenfalls darüber nachdenkst, PHP auf deinem Server zu aktualisieren, empfehle ich dir, gründlich zu testen und dich auf einige Anpassungen im Code vorzubereiten. Es lohnt sich!', '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen &hellip;', 1, '2024-08-08 12:08:00', '3773943d9f6b912e9d5a5d70e04a3a1c', 3, 0, NULL, 0, 1, 177, '2024-08-08 10:08:00', '2024-08-08 10:08:00'),
(177, 2, 'Laravel Experimente', 'Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights gehört eine Blog-Komponente, die es den Nutzern ermöglicht, Beiträge zu erstellen und zu verwalten.\r\n\r\nDarüber hinaus habe ich eine sichere Login-/Logout-Funktion entwickelt, die durch OTP-Codes (Einmalpasswörter) geschützt ist. Dabei wird der OTP-Code via QR-Code eingelesen, was die Sicherheit und Benutzerfreundlichkeit weiter erhöht.\r\n\r\nAuch die Profileinstellungen sind umfangreich: Benutzer können ihre E-Mail-Adresse ändern und ihr Passwort erneuern. Diese Funktionen bieten eine solide Basis für die Verwaltung von Benutzerkonten und tragen zur Sicherheit der Plattform bei.\r\n\r\nIch freue mich darauf, meine Kenntnisse in Laravel weiter zu vertiefen und das Projekt kontinuierlich zu erweitern.', 'Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights gehört eine Blog-Komponente, die es den Nutzern ermöglicht, Beiträge zu erstellen und zu verwalten.\r\n\r\nDarüber hinaus habe ich eine sichere &hellip;', 1, '2024-08-18 14:25:00', '0954c969a702e73e43dbefd17de5ac4c', 3, 0, NULL, 0, 1, 178, '2024-08-18 12:25:00', '2024-08-18 12:25:00'),
(178, 1, 'Und schon wieder haben wir Halloween!', 'Halloween ist wieder da - die Straßen füllen sich mit Kürbislaternen, die Kinder schlüpfen in schaurige Kostüme, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativität Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Bräuchen hat, hat sich längst über die ganze Welt verbreitet und begeistert Jung und Alt. Ob gespenstische Deko, ausgehöhlte Kürbisse oder einfach ein gemütlicher Horrorfilmabend - Halloween bringt die Menschen auf eine unbeschwerte, magische Weise zusammen.\r\n\r\nDoch Halloween ist mehr als nur ein Fest des Schreckens. Es ist auch ein Spiegel für unsere Fantasie und Kreativität. Jedes Kostüm, jede verzierte Haustür und jede handgemachte Kürbislaterne erzählt eine eigene Geschichte. Vielleicht ist das der eigentliche Zauber von Halloween: einen Abend lang in eine andere Welt einzutauchen, zusammen mit Freunden und Familie die Nacht zu erobern und sich gemeinsam vor dem Spuk zu gruseln – nur um am nächsten Morgen mit einem Schmunzeln an das Abenteuer zurückzudenken.', 'Halloween ist wieder da - die Straßen füllen sich mit Kürbislaternen, die Kinder schlüpfen in schaurige Kostüme, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativität Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Bräuchen hat, hat sich längst &hellip;', 1, '2024-10-31 10:35:00', 'a691c59c0f5dd9d20e87dbc949785431', 3, 0, NULL, 0, 1, 179, '2024-10-31 09:35:00', '2024-10-31 09:35:00'),
(179, 1, 'X-Mas 2024', 'Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleichermaßen, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die kühle Luft trägt den Hauch von Winter, während die Bewegung die Herzen erwärmt. Schlittschuhlaufen - ein schwebendes Glück, das die Tage heller und die Nächte leichter macht.\r\n\r\nAm Rande der Bahnen strömt der Duft von Glühwein und gebrannten Mandeln durch die kalte Luft, eine Einladung zum Verweilen. Der Glühwein, tiefrot und würzig, wärmt Hände und Seele, während die süßen Mandeln knuspernd Erinnerungen an vergangene Jahre heraufbeschwören. Inmitten des bunten Treibens auf den Weihnachtsmärkten entfaltet sich eine stille Harmonie - eine Feier des Augenblicks, voller Vertrautheit und leiser Freude.', 'Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleichermaßen, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die kühle Luft trägt den Hauch von Winter, während die &hellip;', 1, '2024-12-07 15:36:00', '15311dd0d03d13f6cc6b26a95f2a1dd8', 3, 0, NULL, 0, 1, 180, '2024-12-07 14:36:00', '2024-12-07 14:36:00');
INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `content`, `summary`, `blog_author_id`, `blog_date`, `slug`, `reading_time`, `audio_on`, `audio_url`, `audio_duration`, `markdown_on`, `blog_image_id`, `created_at`, `updated_at`) VALUES
(180, 2, 'Warum MCSL auf Laravel/Vue basiert – Die Technologie hinter diesem Blog', 'In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die **Flexibilität**, **Skalierbarkeit** und **Benutzerfreundlichkeit** von Laravel. Heute möchte ich ein wenig darüber sprechen, warum **MCSL** auf Laravel basiert und wie es gemeinsam mit **Vue.js** das **Rückgrat** unseres Blogs bildet.\r\n--- \r\n ## **Warum Laravel?** \r\n\r\n\r\nLaravel ist ein **PHP-Framework**, das für seine **elegante Syntax**, **robusten Funktionen** und **entwicklerfreundlichen Tools** bekannt ist. Es vereinfacht den Entwicklungsprozess und bietet gleichzeitig leistungsstarke Funktionen. Mit Features wie **Authentifizierung**, **Routing**, **Sessions** und **Caching** stellt Laravel alles zur Verfügung, was benötigt wird, um leistungsstarke Webanwendungen wie **MCSL** zu entwickeln.\r\n\r\n### **Wichtige Gründe, warum Laravel die Basis von MCSL ist:**\r\n\r\n\r\n- **Schnelle Entwicklungszeiten:**  \r\n  Laravel’s **Artisan CLI** automatisiert wiederkehrende Aufgaben und beschleunigt so den Entwicklungsprozess erheblich.  \r\n\r\n- **Modularität:**  \r\n  Laravel’s **modulare Architektur** ermöglicht es uns, Funktionen wie **Benutzerverwaltung**, **API-Integrationen** und **Datenverwaltung** einfach zu implementieren und zu erweitern.  \r\n\r\n- **Sicherheit:**  \r\n  Laravel bietet integrierten Schutz vor gängigen Sicherheitslücken wie **CSRF**, **SQL-Injektionen** und **XSS-Angriffen**, wodurch MCSL von Anfang an sicher ist.\r\n--- \r\n## **Warum Vue.js?**\r\n\r\n\r\nVue.js ist ein **JavaScript-Framework**, das speziell dafür entwickelt wurde, benutzerfreundliche und reaktive Benutzeroberflächen zu erstellen. Zusammen mit Laravel bildet es eine perfekte Kombination für moderne Webanwendungen.\r\n\r\n### **Vorteile von Vue.js in MCSL:**\r\n\r\n\r\n- **Echtzeit-Updates:**  \r\n  Vue.js ermöglicht es, **Benutzerinteraktionen** ohne komplette Seitenaktualisierungen zu verarbeiten, sodass Änderungen in Echtzeit angezeigt werden.\r\n\r\n- **Komponentenstruktur:**  \r\n  Vue.js erlaubt es, verschiedene Teile der Anwendung als unabhängige, wiederverwendbare Komponenten zu erstellen. Das fördert eine **saubere und modulare Codebasis**.\r\n\r\n- **Interaktive Benutzeroberflächen:**  \r\n  Vue.js ermöglicht es, **dynamische und benutzerfreundliche Oberflächen** zu entwickeln, die direkt mit Laravel’s API kommunizieren.\r\n--- \r\n## **MCSL: Laravel und Vue.js im Zusammenspiel**\r\n\r\n\r\nMCSL ist mehr als nur ein **Content-Management-System (CMS)** — es ist eine moderne Webplattform, die von den **Stärken von Laravel und Vue.js** profitiert. Laravel fungiert dabei als **starke Backend-Architektur**, während Vue.js eine **dynamische und reaktionsschnelle Benutzeroberfläche** bereitstellt.\r\n\r\n### **Kernkomponenten der MCSL-Architektur:**\r\n\r\n\r\n- **Echtzeit-Datenverwaltung:**  \r\n  Laravel und Vue.js ermöglichen es, Daten in Echtzeit zu aktualisieren und anzuzeigen.\r\n\r\n- **Nahtlose API-Integration:**  \r\n  Laravel bietet leistungsstarke APIs, die von Vue.js genutzt werden, um eine reibungslose Benutzererfahrung zu gewährleisten.\r\n\r\n- **Dynamische Benutzeroberflächen:**  \r\n  Dank Vue.js kann MCSL interaktive Funktionen wie Drag-and-Drop, Inline-Bearbeitung und Live-Datenaktualisierungen bieten.', 'In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die **Flexibilität**, **Skalierbarkeit** und **Benutzerfreundlichkeit** von Laravel. Heute möchte ich ein wenig darüber sprechen, warum **MCSL** auf Laravel basiert und wie es das **Rückgrat** unseres &hellip;', 1, '2025-01-14 17:08:00', '9ca41db9fa5b35eac9dccad142e4bdd3', 3, 0, NULL, 0, 1, 181, '2025-01-26 23:00:00', '2025-01-26 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `blog_authors`
--

DROP TABLE IF EXISTS `blog_authors`;
CREATE TABLE `blog_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_authors`
--

INSERT INTO `blog_authors` (`id`, `name`, `info`, `created_at`, `updated_at`) VALUES
(1, 'Asario', 'Seit über 20 Jahren PHP Developer, nun geht\'s an Laravel & VUE\r\n', NULL, NULL);

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
(1, 'News', 'NEWSSTUFF', NULL, NULL),
(2, 'Devlog', 'short description of this one', '2025-01-22 08:02:27', NULL),
(3, 'Mindblog', 'My Mindblog', NULL, NULL);

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
(1, 'Kein Bild vorhanden', '/images/blog_posts/008.jpg', '2025-01-18 20:37:03', '2025-01-18 20:37:03'),
(2, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2006-09-20 18:18:00', '2006-09-20 18:18:00'),
(3, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2006-09-21 19:00:00', '2006-09-21 19:00:00'),
(4, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2006-09-27 21:28:00', '2006-09-27 21:28:00'),
(5, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2007-06-04 17:32:00', '2007-06-04 17:32:00'),
(6, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-01-07 22:16:00', '2008-01-07 22:16:00'),
(7, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-01-14 10:02:00', '2008-01-14 10:02:00'),
(8, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-01-15 09:48:00', '2008-01-15 09:48:00'),
(9, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-01-27 09:00:00', '2008-01-27 09:00:00'),
(10, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-02-17 11:56:00', '2008-02-17 11:56:00'),
(11, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2008-11-28 11:27:00', '2008-11-28 11:27:00'),
(12, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2010-01-10 10:41:00', '2010-01-10 10:41:00'),
(13, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2010-01-12 17:09:00', '2010-01-12 17:09:00'),
(14, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2010-06-19 20:31:00', '2010-06-19 20:31:00'),
(15, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2010-08-14 20:31:00', '2010-08-14 20:31:00'),
(16, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2010-12-26 14:35:00', '2010-12-26 14:35:00'),
(17, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-06-27 17:33:00', '2011-06-27 17:33:00'),
(18, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-06-27 17:35:00', '2011-06-27 17:35:00'),
(19, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-06-27 17:49:00', '2011-06-27 17:49:00'),
(20, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-07-29 16:30:00', '2011-07-29 16:30:00'),
(21, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(22, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(23, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-09-25 14:54:00', '2011-09-25 14:54:00'),
(24, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-10-28 18:43:00', '2011-10-28 18:43:00'),
(25, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2011-12-04 18:58:00', '2011-12-04 18:58:00'),
(26, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-01-01 18:54:00', '2012-01-01 18:54:00'),
(27, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-02-12 19:23:00', '2012-02-12 19:23:00'),
(28, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-08-21 13:43:00', '2012-08-21 13:43:00'),
(29, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-09-09 17:46:00', '2012-09-09 17:46:00'),
(30, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-11-22 19:50:00', '2012-11-22 19:50:00'),
(31, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2012-12-02 19:17:00', '2012-12-02 19:17:00'),
(32, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2013-01-06 19:31:00', '2013-01-06 19:31:00'),
(33, 'Wieder was von der Bilderfront.', '/images/blog_posts/jquery.jpg', '2013-01-27 19:06:00', '2013-01-27 19:06:00'),
(34, 'Wie man aus 4 LeinwÃ¤nden 1 Lichtobjekt macht....', '/images/blog_posts/auriel.jpg', '2013-05-20 17:26:00', '2013-05-20 17:26:00'),
(35, 'Neuer Fernseher in Asarios Home Office.', '/images/blog_posts/bigtv.jpg', '2013-05-20 17:52:00', '2013-05-20 17:52:00'),
(36, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2013-06-23 19:37:00', '2013-06-23 19:37:00'),
(37, 'Smilies all over the World', '/images/blog_posts/smilies.jpg', '2013-06-23 19:38:00', '2013-06-23 19:38:00'),
(38, 'Alles Neue Macht der Juli.', '/images/blog_posts/juli.jpg', '2013-07-14 17:55:00', '2013-07-14 17:55:00'),
(39, 'Der Fernseher h&auml;ngt an der Wand ;)', '/images/blog_posts/tvset.jpg', '2013-08-11 18:00:00', '2013-08-11 18:00:00'),
(40, 'Frohes Neues - 2014 - ein GlÃ¼cksjahr', '/images/blog_posts/NEW_YEAR2.jpg', '2014-01-05 18:14:00', '2014-01-05 18:14:00'),
(41, 'Neues Layout !', '/images/blog_posts/lampen.jpg', '2014-02-10 19:02:00', '2014-02-10 19:02:00'),
(42, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2014-03-02 19:04:00', '2014-03-02 19:04:00'),
(43, 'Ausstellung in Kaltenkirchen', '/images/blog_posts/ausstellung.png', '2014-03-31 17:07:00', '2014-03-31 17:07:00'),
(44, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2014-04-13 17:35:00', '2014-04-13 17:35:00'),
(45, 'Frohe Ostern... Der Osterhase war da!', '/images/blog_posts/easter.png', '2014-04-27 17:36:00', '2014-04-27 17:36:00'),
(46, '3 neue Galerien', '/images/blog_posts/newgal.jpg', '2014-06-17 17:31:00', '2014-06-17 17:31:00'),
(47, 'Bewertungsfunktion fÃ¼r Bilder.', '/images/blog_posts/starz.jpg', '2014-08-25 17:49:00', '2014-08-25 17:49:00'),
(48, 'Mein neues Bike', '/images/blog_posts/Hubertus.JPG', '2014-10-19 17:29:00', '2014-10-19 17:29:00'),
(49, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2014-10-25 16:14:00', '2014-10-25 16:14:00'),
(50, 'New Images', '/images/blog_posts/saurier.jpg', '2014-11-02 14:33:00', '2014-11-02 14:33:00'),
(51, 'Mein erster Ritt...', '/images/blog_posts/Horseriding.jpg', '2014-11-16 17:49:00', '2014-11-16 17:49:00'),
(52, 'Frohe Weihnachten und einen...', '/images/blog_posts/coca2.jpg', '2014-12-05 18:30:00', '2014-12-05 18:30:00'),
(53, 'Der FrÃ¼hling kommt.', '/images/blog_posts/spring2015.jpg', '2015-03-20 17:49:00', '2015-03-20 17:49:00'),
(54, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-03-20 17:51:00', '2015-03-20 17:51:00'),
(55, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-03-20 17:55:00', '2015-03-20 17:55:00'),
(56, 'Elke ist tod. :(', '/images/blog_posts/elke_history.jpg', '2015-05-05 16:16:00', '2015-05-05 16:16:00'),
(57, 'Neue BilderÂ²', '/images/blog_posts/easter_2015.jpg', '2015-05-05 16:18:00', '2015-05-05 16:18:00'),
(58, 'Neue Fineliner Bilder gesichtet...', '/images/blog_posts/dragon.jpg', '2015-07-05 16:19:00', '2015-07-05 16:19:00'),
(59, 'Shopping Tour in NeumÃ¼nster', '/images/blog_posts/new_shoes.jpg', '2015-07-19 17:21:00', '2015-07-19 17:21:00'),
(60, 'Haare AB!', '/images/blog_posts/haircut.jpg', '2015-08-04 16:13:00', '2015-08-04 16:13:00'),
(61, 'Ricklinger Jahresfest 2015', '/images/blog_posts/jahresfest.jpg', '2015-08-30 18:26:00', '2015-08-30 18:26:00'),
(62, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-09-06 17:29:00', '2015-09-06 17:29:00'),
(63, 'Neue Shortstories', '/images/blog_posts/short_st.jpg', '2015-09-15 16:44:00', '2015-09-15 16:44:00'),
(64, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-10-04 18:03:00', '2015-10-04 18:03:00'),
(65, 'JQuery UI integrated', '/images/blog_posts/jquery.jpg', '2015-10-13 16:50:00', '2015-10-13 16:50:00'),
(66, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-10-27 17:00:00', '2015-10-27 17:00:00'),
(67, 'Neues Kleid fÃ¼r alte GerÃ¼ste.', '/images/blog_posts/sar.jpg', '2015-10-27 17:02:00', '2015-10-27 17:02:00'),
(68, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2015-11-24 18:37:00', '2015-11-24 18:37:00'),
(69, 'Neue Galerie und einige nette Details', '/images/blog_posts/daimkon.jpg', '2015-12-18 19:17:00', '2015-12-18 19:17:00'),
(70, 'Happy New Year', '/images/blog_posts/sylv_2015_2016.jpg', '2016-01-03 17:15:00', '2016-01-03 17:15:00'),
(71, '2 neue Galerien gefunden', '/images/blog_posts/07new_noname.jpg', '2016-01-15 18:10:00', '2016-01-15 18:10:00'),
(72, 'Neue Domain VerfÃ¼gbar.', '/images/blog_posts/05new_noname.jpg', '2016-02-09 18:55:00', '2016-02-09 18:55:00'),
(73, 'Ich habe 4 neue Bilder gemalt', '/images/blog_posts/faser2.jpg', '2016-04-01 16:43:00', '2016-04-01 16:43:00'),
(74, 'Neues Wallpaper', '/images/blog_posts/asario.de.jpg', '2016-05-17 16:16:00', '2016-05-17 16:16:00'),
(75, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2016-05-24 16:50:00', '2016-05-24 16:50:00'),
(76, 'Diverse neue Bilder', '/images/blog_posts/dune2016.jpg', '2016-06-14 17:04:00', '2016-06-14 17:04:00'),
(77, 'MCS Version 2.01', '/images/blog_posts/11new_noname.jpg', '2016-06-28 16:57:00', '2016-06-28 16:57:00'),
(78, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2016-07-04 15:12:00', '2016-07-04 15:12:00'),
(79, 'Burzeltach und seine Folgen...', '/images/blog_posts/Desk-Star-Painter.jpg', '2016-07-08 18:14:00', '2016-07-08 18:14:00'),
(80, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2016-07-08 18:16:00', '2016-07-08 18:16:00'),
(81, 'Neue Galerie vorhanden.', '/images/blog_posts/Zen_Coloured.jpg', '2016-08-24 08:20:00', '2016-08-24 08:20:00'),
(82, 'Neuerungen unter der Haube', '/images/blog_posts/17new_noname.jpg', '2016-10-08 18:07:00', '2016-10-08 18:07:00'),
(83, 'Merry X-Mas', '/images/blog_posts/xmas2k16._4.jpg', '2016-12-19 17:24:00', '2016-12-19 17:24:00'),
(84, 'Big Exceptions', '/images/blog_posts/jelly.jpg', '2017-01-25 08:37:00', '2017-01-25 08:37:00'),
(85, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2017-01-25 10:17:00', '2017-01-25 10:17:00'),
(86, 'MCS Points - die Smarte W&auml;hrung', '/images/blog_posts/153new_noname.jpg', '2017-01-29 14:48:00', '2017-01-29 14:48:00'),
(87, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2017-02-19 12:37:00', '2017-02-19 12:37:00'),
(88, 'Jetzt aber...', '/images/blog_posts/14new_noname.jpg', '2017-03-02 17:43:00', '2017-03-02 17:43:00'),
(89, 'Neue Navigationsleiste', '/images/blog_posts/03new_noname.jpg', '2017-03-12 15:33:00', '2017-03-12 15:33:00'),
(90, 'MultiLanguageSupport', '/images/blog_posts/15new_noname.jpg', '2017-03-24 17:50:00', '2017-03-24 17:50:00'),
(91, 'Das Warten hat ein Ende', '/images/blog_posts/16new_noname.jpg', '2017-05-18 17:58:00', '2017-05-18 17:58:00'),
(92, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2017-05-26 07:13:00', '2017-05-26 07:13:00'),
(93, 'Neue Galerie gesichtet', '/images/blog_posts/19new_noname.jpg', '2017-05-28 17:09:00', '2017-05-28 17:09:00'),
(94, 'Herzlichen GlÃ¼ckwunsch', '/images/blog_posts/09new_noname.jpg', '2017-06-17 15:56:00', '2017-06-17 15:56:00'),
(95, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2017-06-20 17:45:00', '2017-06-20 17:45:00'),
(96, 'Internationalisierung vorangetrieben', '/images/blog_posts/multilang_overall.jpg', '2017-06-30 18:07:00', '2017-06-30 18:07:00'),
(97, 'Habe mal wieder geschraubt.', '/images/blog_posts/18new_noname.jpg', '2017-07-07 16:26:00', '2017-07-07 16:26:00'),
(98, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2017-07-11 16:44:00', '2017-07-11 16:44:00'),
(99, 'Neues Design', '/images/blog_posts/38new_noname.jpg', '2017-07-29 16:06:00', '2017-07-29 16:06:00'),
(100, 'SSL Ãœberall', '/images/blog_posts/33new_noname.jpg', '2017-08-20 13:40:00', '2017-08-20 13:40:00'),
(101, 'Neues auf meinem Blog', '/images/blog_posts/35new_noname.jpg', '2017-09-10 10:48:00', '2017-09-10 10:48:00'),
(102, 'Neue Bilder gefunden', '/images/blog_posts/34new_noname.jpg', '2017-09-17 17:16:00', '2017-09-17 17:16:00'),
(103, 'Mein Praktikum', '/images/blog_posts/40new_noname.jpg', '2017-10-14 17:08:00', '2017-10-14 17:08:00'),
(104, 'Neuer Ascher', '/images/blog_posts/41new_noname.jpg', '2017-10-29 11:56:00', '2017-10-29 11:56:00'),
(105, 'VerÃ¤ndertes Layout', '/images/blog_posts/20new_noname.jpg', '2017-11-12 13:59:00', '2017-11-12 13:59:00'),
(106, 'Neue Galerie', '/images/blog_posts/30new_noname.jpg', '2017-11-19 08:18:00', '2017-11-19 08:18:00'),
(107, 'Endlich wieder Online', '/images/blog_posts/21new_noname.jpg', '2017-12-20 08:10:00', '2017-12-20 08:10:00'),
(108, 'Neue Monstar Pix', '/images/blog_posts/42new_noname.jpg', '2018-01-28 08:17:00', '2018-01-28 08:17:00'),
(109, 'Shortstories wird zu Shortpoems', '/images/blog_posts/26new_noname.jpg', '2018-03-02 16:55:00', '2018-03-02 16:55:00'),
(110, 'Neue Kamera', '/images/blog_posts/56new_noname.jpg', '2018-04-02 14:26:00', '2018-04-02 14:26:00'),
(111, 'Neues Wallpaper @ Digital Galerie', '/images/blog_posts/63new_noname.jpg', '2018-04-15 10:28:00', '2018-04-15 10:28:00'),
(112, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2018-04-18 17:32:00', '2018-04-18 17:32:00'),
(113, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2018-04-20 16:20:00', '2018-04-20 16:20:00'),
(114, 'Mein Smartphone', '/images/blog_posts/66new_noname.jpg', '2018-04-29 08:49:00', '2018-04-29 08:49:00'),
(115, 'LayoutverÃ¤nderung 2.0', '/images/blog_posts/60new_moname.jpg', '2018-05-01 16:53:00', '2018-05-01 16:53:00'),
(116, 'Neue Rubrik', '/images/blog_posts/61new_noname.jpg', '2018-05-06 09:01:00', '2018-05-06 09:01:00'),
(117, 'Neue Wissensfragen auf DidYouKnow', '/images/blog_posts/69new_noname.jpg', '2018-05-13 08:02:00', '2018-05-13 08:02:00'),
(118, 'Mein 35ter Geburtstag', '/images/blog_posts/70new_noname.jpg', '2018-06-17 07:29:00', '2018-06-17 07:29:00'),
(119, 'Neuigkeiten auf Asarios Blog', '/images/blog_posts/68new_noname.jpg', '2018-06-30 06:38:00', '2018-06-30 06:38:00'),
(120, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2018-08-10 09:13:00', '2018-08-10 09:13:00'),
(121, 'Neue Fotos und neue MCS Version', '/images/blog_posts/71new_noname.jpg', '2018-08-10 18:02:00', '2018-08-10 18:02:00'),
(122, 'Neues PM Layout, Stats und MCS-Newsletter', '/images/blog_posts/72new_noname.jpg', '2018-08-23 15:11:00', '2018-08-23 15:11:00'),
(123, 'Monstar in D&auml;nemark', '/images/blog_posts/74new_noname.jpg', '2018-09-15 18:23:00', '2018-09-15 18:23:00'),
(124, 'Kommentaren Folgen', '/images/blog_posts/73new_noname.jpg', '2018-09-26 15:45:00', '2018-09-26 15:45:00'),
(125, 'Neuer Button unter Images', '/images/blog_posts/49new_noname.jpg', '2018-10-21 14:48:00', '2018-10-21 14:48:00'),
(126, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2018-10-21 17:16:00', '2018-10-21 17:16:00'),
(127, 'Neuer Slider auf News Seite.', '/images/blog_posts/75new_noname.jpg', '2018-11-25 08:16:00', '2018-11-25 08:16:00'),
(128, 'Neues Feature auf Images Seite', '/images/blog_posts/80new_noname.jpg', '2018-12-02 08:55:00', '2018-12-02 08:55:00'),
(129, 'Neues unter DidYouKnow', '/images/blog_posts/83new_noname.jpg', '2018-12-09 09:16:00', '2018-12-09 09:16:00'),
(130, 'Merry Christmas Folks', '/images/blog_posts/84_new_noname.jpg', '2018-12-20 17:12:00', '2018-12-20 17:12:00'),
(131, 'Frohes Neues Freunde', '/images/blog_posts/85_new_noname.jpg', '2019-01-01 09:41:00', '2019-01-01 09:41:00'),
(132, 'Neue Kunstwerke gesichtet', '/images/blog_posts/96new_noname.jpg', '2019-02-22 15:16:00', '2019-02-22 15:16:00'),
(133, 'F&uuml;r alle Apfel Nerds und 4K Nutzer', '/images/blog_posts/91new_noname.jpg', '2019-03-24 14:19:00', '2019-03-24 14:19:00'),
(134, 'Monstarz United', '/images/blog_posts/99new_noname.jpg', '2019-03-29 15:04:00', '2019-03-29 15:04:00'),
(135, 'Frohe Ostern', '/images/blog_posts/90_2new_noname.jpg', '2019-04-20 11:28:00', '2019-04-20 11:28:00'),
(136, 'Besuch bei meinem kleinem Neffen', '/images/blog_posts/100new_noname.jpg', '2019-05-27 09:16:00', '2019-05-27 09:16:00'),
(137, 'Anubis fast fertig', '/images/blog_posts/103new_noname.jpg', '2019-06-23 06:40:00', '2019-06-23 06:40:00'),
(138, 'MCS Doku Multi-Language', '/images/blog_posts/102new_noname.jpg', '2019-06-30 11:22:00', '2019-06-30 11:22:00'),
(139, 'Anubis fertig', '/images/blog_posts/106new_noname.jpg', '2019-09-06 13:58:00', '2019-09-06 13:58:00'),
(140, 'Shariff Online', '/images/blog_posts/97new_noname.jpg', '2019-09-15 08:34:00', '2019-09-15 08:34:00'),
(141, 'Neue Folgen Funktion', '/images/blog_posts/108new_noname.jpg', '2019-10-03 07:08:00', '2019-10-03 07:08:00'),
(142, 'Merry Christmas and a happy New Year', '/images/blog_posts/xmas_2019.jpg', '2019-12-23 22:59:00', '2019-12-23 22:59:00'),
(143, 'Gut reingerutscht?', '/images/blog_posts/111new_noname.jpg', '2019-12-28 16:54:00', '2019-12-28 16:54:00'),
(144, 'Zwei Faktor Authentifizierung auf Asarios Blog', '/images/blog_posts/110new_noname.jpg', '2020-01-12 12:47:00', '2020-01-12 12:47:00'),
(145, 'Ich verlasse Bim&ouml;hlen', '/images/blog_posts/112new_noname.jpg', '2020-02-23 15:06:00', '2020-02-23 15:06:00'),
(146, 'Willkommen SE', '/images/blog_posts/113new_noname.jpg', '2020-03-04 14:47:00', '2020-03-04 14:47:00'),
(147, 'Neue Bilder gesichtet', '/images/blog_posts/115new_noname.jpg', '2020-08-16 11:52:00', '2020-08-16 11:52:00'),
(148, 'Neues Layout auf Asario.de', '/images/blog_posts/116new_noname.jpg', '2020-09-06 15:51:00', '2020-09-06 15:51:00'),
(149, 'Frohes Neues', '/images/blog_posts/118new_noname.jpg', '2020-12-31 23:32:00', '2020-12-31 23:32:00'),
(150, 'Back in town...', '/images/blog_posts/119new_noname.jpg', '2021-08-12 11:14:00', '2021-08-12 11:14:00'),
(151, 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', '/images/blog_posts/120new_noname.jpg', '2021-10-09 18:19:00', '2021-10-09 18:19:00'),
(152, 'Kein Bild Vorhanden', '/images/blog_posts/008.jpg', '2021-10-09 21:14:00', '2021-10-09 21:14:00'),
(153, 'Merry X-Mas 2021', '/images/blog_posts/121new_noname.jpg', '2021-12-25 09:42:00', '2021-12-25 09:42:00'),
(154, 'Neues Feature', '/images/blog_posts/123new_noname.png', '2022-02-15 11:15:00', '2022-02-15 11:15:00'),
(155, 'Solidarit&auml;t mit der Ukraine', '/images/blog_posts/125new_noname.png', '2022-04-18 22:00:00', '2022-04-18 22:00:00'),
(156, '3D Printer Objekte', '/images/blog_posts/dragonbird.jpg', '2022-06-28 22:00:00', '2022-06-28 22:00:00'),
(157, 'Neuerungen im System', '/images/blog_posts/2868559b90a5a297f214f0cbb1c8ae4e.jpg', '2022-10-09 09:14:00', '2022-10-09 09:14:00'),
(158, 'Neues aus PLA', '/images/blog_posts/126new_noname.jpg', '2022-11-05 14:56:00', '2022-11-05 14:56:00'),
(159, 'Happy 2023', '/images/blog_posts/127new_noname.jpg', '2023-01-22 13:07:00', '2023-01-22 13:07:00'),
(160, 'Winter in town', '/images/blog_posts/128new_noname.jpg', '2023-01-27 18:03:00', '2023-01-27 18:03:00'),
(161, 'Winter Update', '/images/blog_posts/593f5288d12efe2bcbf95d3ce538d219.jpg', '2023-02-04 12:05:00', '2023-02-04 12:05:00'),
(162, 'Frohe Ostern 2023', '/images/blog_posts/132new_noname.jpg', '2023-02-13 08:56:00', '2023-02-13 08:56:00'),
(163, 'Fr&uuml;hling', '/images/blog_posts/149new_noname.jpg', '2023-02-22 15:10:00', '2023-02-22 15:10:00'),
(164, 'Verbesserte Feeds', '/images/blog_posts/473443f6cdb8473c5abbc5a206fbe4a4.jpg', '2023-03-11 12:03:00', '2023-03-11 12:03:00'),
(165, 'Neue Sterne', '/images/blog_posts/c4d8434ed14487a864c344675e07b876.jpg', '2023-05-07 08:42:00', '2023-05-07 08:42:00'),
(166, 'Sommer 2023', '/images/blog_posts/140new_noname.jpg', '2023-05-29 10:02:00', '2023-05-29 10:02:00'),
(167, 'Sp&auml;tsommer 2023', '/images/blog_posts/143new_noname.jpg', '2023-07-22 13:38:00', '2023-07-22 13:38:00'),
(168, 'Herbst 2023', '/images/blog_posts/145new_noname.jpg', '2023-08-21 13:27:00', '2023-08-21 13:27:00'),
(169, 'Winter & 2fa', '/images/blog_posts/150new_noname.jpg', '2023-09-30 15:05:00', '2023-09-30 15:05:00'),
(170, 'Halloween 2023', '/images/blog_posts/a677f351307d2071c97811e777145a05.jpg', '2023-10-31 20:02:00', '2023-10-31 20:02:00'),
(171, 'Update zur Zwei-Faktor-Authentifizierung', '/images/blog_posts/9a3f1215f2d676158f59b107dbf8325e.jpg', '2023-11-21 23:00:00', '2023-11-21 23:00:00'),
(172, 'Frohe Weihnachten 2023', '/images/blog_posts/d8b5586b1f97adedb44b92e51d6762b7.jpg', '2023-12-16 16:09:00', '2023-12-16 16:09:00'),
(173, 'KI, Webdesign, Kunst und Fotografie', '/images/blog_posts/96f9dbb805e3adc181299068c822bb9e.jpg', '2024-01-09 21:14:00', '2024-01-09 21:14:00'),
(174, 'Frühling', '/images/blog_posts/7b3cd6e8c28cc9ee80b122d085f9ff79.jpg', '2024-03-13 23:00:00', '2024-03-13 23:00:00'),
(175, 'Sommer 2024', '/images/blog_posts/2cb4d6cdd6b5a3b3551824c54d9b3cc0.jpg', '2024-04-21 13:54:00', '2024-04-21 13:54:00'),
(176, 'Neues Layout', '/images/blog_posts/a72b888abc6d4430a697c77ff2adabf8.png', '2024-07-16 22:00:00', '2024-07-16 22:00:00'),
(177, 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', '/images/blog_posts/9443b4d9d13c07d1de2607cbc2b1f147.jpg', '2024-08-08 10:08:00', '2024-08-08 10:08:00'),
(178, 'Laravel Experimente', '/images/blog_posts/1f19113fd5e6d3034053946fa19216ce.jpg', '2024-08-18 12:25:00', '2024-08-18 12:25:00'),
(179, 'Und schon wieder haben wir Halloween!', '/images/blog_posts/88d46e6c705129501bdd680082b4ff7e.jpg', '2024-10-31 09:35:00', '2024-10-31 09:35:00'),
(180, 'X-Mas 2024', '/images/blog_posts/ae9cca18e24abc8d33617425f56ad5ad.jpg', '2024-12-07 14:36:00', '2024-12-07 14:36:00'),
(181, 'Warum MCSL auf Laravel basiert – Die Technologie hinter diesem Blog', '/images/blog_posts/d1adb2203dbe352814a1271ee5df2962.jpg', '2025-01-26 23:00:00', '2025-01-26 23:00:00');

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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('3733defb58efe959a0d4ca2660b1809e', 'i:1;', 1738329416),
('3733defb58efe959a0d4ca2660b1809e:timer', 'i:1738329416;', 1738329416),
('58a529729abdfedf1f6a0f17c1ebdaf4', 'i:1;', 1737466785),
('58a529729abdfedf1f6a0f17c1ebdaf4:timer', 'i:1737466785;', 1737466785),
('9d2b9c28c3ecbbb2606c75afe5c5114d', 'i:1;', 1738254768),
('9d2b9c28c3ecbbb2606c75afe5c5114d:timer', 'i:1738254768;', 1738254768),
('fortify.2fa_codes.53fd994bce759e1f1139c84c4ac9a506', 'i:57913146;', 1737394457),
('fortify.2fa_codes.5936b7ec1942780fcae9766fcc53bcb1', 'i:57913157;', 1737394787);

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL DEFAULT 1,
  `users_id` bigint(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `tablename` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_at` bigint(11) NOT NULL,
  `updated_at` bigint(11) NOT NULL,
  `xis_checked` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `pub`, `users_id`, `post_id`, `tablename`, `content`, `email`, `created_at`, `updated_at`, `xis_checked`) VALUES
(1, 1, 1, 363, 'images', '133333333333', 'info@asario.de', 1732101818, 1732101818, 0),
(2, 1, 1, 365, 'images', 'pöolpü', 'info@asario.de', 1732106190, 1732106190, 0),
(3, 1, 1, 365, 'images', 'test 213', 'info@asario.de', 1732106202, 1732106202, 0),
(4, 1, 1, 363, 'images', '1321111111111111111', 'info@asario.de', 1732108616, 1732108616, 0),
(5, 1, 1, 365, 'images', 'oloooooooooooooool', 'info@asario.de', 1732179111, 1732179111, 0),
(6, 1, 1, 365, 'images', 'püloool', 'info@asario.de', 1732180612, 1732180612, 0),
(7, 1, 1, 363, 'images', 'hallo welt', 'info@asario.de', 1732199429, 1732199429, 0),
(8, 1, 1, 363, 'images', 'test 213', 'info@asario.de', 1732290488, 1732290488, 0),
(9, 1, 1, 363, 'images', 'test 123', 'info@asario.de', 1732353433, 1732353433, 0),
(10, 1, 1, 329, 'images', '123', 'info@asario.de', 1732353460, 1732353460, 0),
(11, 1, 1, 329, 'images', 'test 2331', 'info@asario.de', 1732353615, 1732353615, 0),
(12, 1, 1, 329, 'images', '123333333333333', 'info@asario.de', 1732353917, 1732353917, 0),
(14, 1, 1, 329, 'images', '123465789123456790012345678901233112\r\n213113', 'info@asario.de', 1732459203, 1732459203, 0),
(15, 1, 1, 363, 'images', 'klopapier', 'info@asario.de', 1732632572, 1732632572, 0),
(16, 1, 1, 365, 'images', 'hallo World', 'info@asario.de', 1732804840, 1732804840, 0),
(17, 1, 1, 182, 'blog_posts', 'ein etwas längerer', 'info@asario.de', 1732900970, 1732900970, 0),
(18, 1, 1, 182, 'blog_posts', 'asdsadasdasdasdasdasdasdasdasdadsdds', 'info@asario.de', 1732905003, 1732905003, 0),
(19, 1, 1, 182, 'blog_posts', 'hallo welt !', 'info@asario.de', 1732905098, 1732905098, 0),
(20, 1, 1, 180, 'blog_posts', '2132132', 'info@asario.de', 1732965892, 1732965892, 0),
(22, 1, 1, 365, 'images', 'test des redirect', 'info@asario.de', 1733043794, 1733043794, 0),
(23, 1, 1, 344, 'images', 'your commment', 'info@asario.de', 1734272336, 1734272336, 0),
(24, 1, 1, 182, 'blog_posts', 'Comment new Number 1', 'info@asario.de', 1735400478, 1735400478, 0),
(25, 1, 2, 182, 'blog_posts', 'Comment new Number 2', 'malte@example.com', 1735400478, 1735400478, 0),
(26, 1, 2, 182, 'blog_posts', 'Comment new Number 3', 'malte@example.com', 1735400478, 1735400478, 0),
(27, 1, 2, 182, 'blog_posts', 'Comment new Number 4', 'malte@example.com', 1735400478, 1735400478, 0),
(28, 1, 2, 182, 'blog_posts', 'Comment new Number 5', 'malte@example.com', 1735400478, 1735400478, 0),
(29, 1, 1, 182, 'blog_posts', 'Comment new Number 6', 'info@asario.de', 1735400478, 1735400478, 0),
(30, 1, 1, 182, 'blog_posts', 'Comment new Number 7', 'info@asario.de', 1735400478, 1735400478, 0),
(31, 1, 1, 182, 'blog_posts', 'Comment new Number 8', 'info@asario.de', 1735400478, 1735400478, 0),
(32, 1, 2, 182, 'blog_posts', 'Comment new Number 9', 'malte@example.com', 1735400478, 1735400478, 0),
(33, 1, 1, 182, 'blog_posts', 'Comment new Number 10', 'info@asario.de', 1735400478, 1735400478, 0),
(34, 1, 1, 182, 'blog_posts', 'Comment new Number 11', 'info@asario.de', 1735400478, 1735400478, 0),
(35, 1, 2, 182, 'blog_posts', 'Comment new Number 12', 'malte@example.com', 1735400478, 1735400478, 0),
(40, 1, 1, 182, 'blog_posts', 'Comment new Number 17', 'info@asario.de', 1735400478, 1735400478, 0),
(41, 1, 1, 182, 'blog_posts', 'Comment new Number 18', 'info@asario.de', 1735400478, 1735400478, 0),
(42, 1, 1, 182, 'blog_posts', 'Comment new Number 19', 'info@asario.de', 1735400478, 1735400478, 0),
(43, 1, 2, 182, 'blog_posts', 'Comment new Number 20', 'malte@example.com', 1735400478, 1735400478, 0),
(44, 1, 1, 182, 'blog_posts', 'Comment new Number 21', 'info@asario.de', 1735400478, 1735400478, 0),
(45, 1, 2, 182, 'blog_posts', 'Comment new Number 22', 'malte@example.com', 1735400478, 1735400478, 0),
(46, 1, 1, 182, 'blog_posts', 'Comment new Number 23', 'info@asario.de', 1735400478, 1735400478, 0),
(47, 1, 1, 182, 'blog_posts', 'Comment new Number 24', 'info@asario.de', 1735400478, 1735400478, 0),
(48, 1, 1, 182, 'blog_posts', 'Comment new Number 25', 'info@asario.de', 1735400478, 1735400478, 0),
(49, 1, 1, 182, 'blog_posts', 'Comment new Number 26', 'info@asario.de', 1735400478, 1735400478, 0),
(50, 1, 2, 182, 'blog_posts', 'Comment new Number 27', 'malte@example.com', 1735400478, 1735400478, 0),
(51, 1, 1, 182, 'blog_posts', 'Comment new Number 28', 'info@asario.de', 1735400478, 1735400478, 0),
(52, 1, 1, 182, 'blog_posts', 'Comment new Number 29', 'info@asario.de', 1735400478, 1735400478, 0),
(53, 1, 1, 182, 'blog_posts', 'Comment new Number 30', 'info@asario.de', 1735400478, 1735400478, 0),
(54, 1, 1, 182, 'blog_posts', 'Comment new Number 31', 'info@asario.de', 1735400478, 1735400478, 0),
(56, 1, 1, 182, 'blog_posts', 'Comment new Number 33', 'info@asario.de', 1735400478, 1735400478, 0),
(57, 1, 2, 182, 'blog_posts', 'Comment new Number 34', 'malte@example.com', 1735400478, 1735400478, 0),
(58, 1, 1, 182, 'blog_posts', 'Comment new Number 35', 'info@asario.de', 1735400478, 1735400478, 0),
(59, 1, 1, 182, 'blog_posts', 'Comment new Number 36', 'info@asario.de', 1735400478, 1735400478, 0),
(60, 1, 2, 182, 'blog_posts', 'Comment new Number 37', 'malte@example.com', 1735400478, 1735400478, 0),
(61, 1, 1, 182, 'blog_posts', 'Comment new Number 38', 'info@asario.de', 1735400478, 1735400478, 0),
(62, 1, 2, 182, 'blog_posts', 'Comment new Number 39', 'malte@example.com', 1735400478, 1735400478, 0),
(63, 1, 1, 182, 'blog_posts', 'Comment new Number 40', 'info@asario.de', 1735400478, 1735400478, 0),
(64, 1, 1, 182, 'blog_posts', 'Comment new Number 41', 'info@asario.de', 1735400478, 1735400478, 0),
(65, 1, 2, 182, 'blog_posts', 'Comment new Number 42', 'malte@example.com', 1735400478, 1735400478, 0),
(66, 1, 1, 182, 'blog_posts', 'Comment new Number 43', 'info@asario.de', 1735400478, 1735400478, 0),
(67, 1, 2, 182, 'blog_posts', 'Comment new Number 44', 'malte@example.com', 1735400478, 1735400478, 0),
(68, 1, 1, 182, 'blog_posts', 'Comment new Number 45', 'info@asario.de', 1735400478, 1735400478, 0),
(69, 1, 1, 182, 'blog_posts', 'Comment new Number 46', 'info@asario.de', 1735400478, 1735400478, 0),
(70, 1, 1, 182, 'blog_posts', 'Comment new Number 47', 'info@asario.de', 1735400478, 1735400478, 0),
(71, 1, 2, 182, 'blog_posts', 'Comment new Number 48', 'malte@example.com', 1735400478, 1735400478, 0),
(72, 1, 2, 182, 'blog_posts', 'Comment new Number 49', 'malte@example.com', 1735400478, 1735400478, 0),
(73, 1, 2, 182, 'blog_posts', 'Comment new Number 50', 'malte@example.com', 1735400478, 1735400478, 0),
(74, 1, 2, 427, 'images', 'Comment new Number 1', 'malte@example.com', 1735407248, 1735407248, 0),
(75, 1, 2, 427, 'images', 'Comment new Number 2', 'malte@example.com', 1735407248, 1735407248, 0),
(76, 1, 1, 427, 'images', 'Comment new Number 3', 'info@asario.de', 1735407248, 1735407248, 0),
(77, 1, 1, 427, 'images', 'Comment new Number 4', 'info@asario.de', 1735407248, 1735407248, 0),
(78, 1, 2, 427, 'images', 'Comment new Number 5', 'malte@example.com', 1735407248, 1735407248, 0),
(79, 1, 2, 427, 'images', 'Comment new Number 6', 'malte@example.com', 1735407248, 1735407248, 0),
(80, 1, 1, 427, 'images', 'Comment new Number 7', 'info@asario.de', 1735407248, 1735407248, 0),
(81, 1, 1, 427, 'images', 'Comment new Number 8', 'info@asario.de', 1735407248, 1735407248, 0),
(82, 1, 1, 427, 'images', 'Comment new Number 9', 'info@asario.de', 1735407248, 1735407248, 0),
(83, 1, 2, 427, 'images', 'Comment new Number 10', 'malte@example.com', 1735407248, 1735407248, 0),
(84, 1, 1, 427, 'images', 'Comment new Number 11', 'info@asario.de', 1735407248, 1735407248, 0),
(85, 1, 2, 427, 'images', 'Comment new Number 12', 'malte@example.com', 1735407248, 1735407248, 0),
(86, 1, 1, 427, 'images', 'Comment new Number 13', 'info@asario.de', 1735407248, 1735407248, 0),
(87, 1, 2, 427, 'images', 'Comment new Number 14', 'malte@example.com', 1735407248, 1735407248, 0),
(88, 1, 2, 427, 'images', 'Comment new Number 15', 'malte@example.com', 1735407248, 1735407248, 0),
(89, 1, 2, 427, 'images', 'Comment new Number 16', 'malte@example.com', 1735407248, 1735407248, 0),
(90, 1, 1, 427, 'images', 'Comment new Number 17', 'info@asario.de', 1735407248, 1735407248, 0),
(91, 1, 1, 427, 'images', 'Comment new Number 18', 'info@asario.de', 1735407248, 1735407248, 0),
(93, 1, 1, 427, 'images', 'Comment new Number 20', 'info@asario.de', 1735407248, 1735407248, 0),
(95, 1, 2, 427, 'images', 'Comment new Number 22', 'malte@example.com', 1735407248, 1735407248, 0),
(97, 1, 2, 427, 'images', 'Comment new Number 24', 'malte@example.com', 1735407248, 1735407248, 0),
(98, 1, 2, 427, 'images', 'Comment new Number 25', 'malte@example.com', 1735407248, 1735407248, 0),
(100, 1, 2, 427, 'images', 'Comment new Number 27', 'malte@example.com', 1735407248, 1735407248, 0),
(101, 1, 2, 427, 'images', 'Comment new Number 28', 'malte@example.com', 1735407248, 1735407248, 0),
(102, 1, 2, 427, 'images', 'Comment new Number 29', 'malte@example.com', 1735407248, 1735407248, 0),
(103, 1, 2, 427, 'images', 'Comment new Number 30', 'malte@example.com', 1735407248, 1735407248, 0),
(104, 1, 1, 427, 'images', 'Comment new Number 31', 'info@asario.de', 1735407248, 1735407248, 0),
(107, 1, 1, 427, 'images', 'Comment new Number 34', 'info@asario.de', 1735407248, 1735407248, 0),
(108, 1, 2, 427, 'images', 'Comment new Number 35', 'malte@example.com', 1735407248, 1735407248, 0),
(109, 1, 2, 427, 'images', 'Comment new Number 36', 'malte@example.com', 1735407248, 1735407248, 0),
(110, 1, 2, 427, 'images', 'Comment new Number 37', 'malte@example.com', 1735407248, 1735407248, 0),
(111, 1, 1, 427, 'images', 'Comment new Number 38', 'info@asario.de', 1735407248, 1735407248, 0),
(112, 1, 1, 427, 'images', 'Comment new Number 39', 'info@asario.de', 1735407248, 1735407248, 0),
(113, 1, 2, 427, 'images', 'Comment new Number 40', 'malte@example.com', 1735407248, 1735407248, 0),
(114, 1, 2, 427, 'images', 'Comment new Number 41', 'malte@example.com', 1735407248, 1735407248, 0),
(115, 1, 1, 427, 'images', 'Comment new Number 42', 'info@asario.de', 1735407248, 1735407248, 0),
(116, 1, 1, 427, 'images', 'Comment new Number 43', 'info@asario.de', 1735407248, 1735407248, 0),
(117, 1, 1, 427, 'images', 'Comment new Number 44', 'info@asario.de', 1735407248, 1735407248, 0),
(118, 1, 2, 427, 'images', 'Comment new Number 45', 'malte@example.com', 1735407248, 1735407248, 0),
(119, 1, 2, 427, 'images', 'Comment new Number 46', 'malte@example.com', 1735407248, 1735407248, 0),
(120, 1, 1, 427, 'images', 'Comment new Number 47', 'info@asario.de', 1735407248, 1735407248, 0),
(121, 1, 1, 427, 'images', 'Comment new Number 48', 'info@asario.de', 1735407248, 1735407248, 0),
(122, 1, 2, 427, 'images', 'Comment new Number 49', 'malte@example.com', 1735407248, 1735407248, 0),
(123, 1, 2, 427, 'images', 'Comment new Number 50', 'malte@example.com', 1735407248, 1735407248, 0),
(124, 1, 1, 180, 'blog_posts', 'test 213', 'info@asario.de', 1735411822, 1735411822, 0);

-- --------------------------------------------------------

--
-- Table structure for table `devlog`
--

DROP TABLE IF EXISTS `devlog`;
CREATE TABLE `devlog` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL DEFAULT 0,
  `typ` enum('website','MCS','Other') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` int(10) NOT NULL DEFAULT 0,
  `chg_date` bigint(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `xis_ai` tinyint(1) DEFAULT NULL,
  `xis_ai_text` tinyint(1) DEFAULT NULL,
  `LinkName` varchar(90) DEFAULT NULL,
  `LinkName_en` varchar(90) DEFAULT NULL,
  `clinks_idx` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_en` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `xis_transl` tinyint(1) DEFAULT NULL,
  `xkis_IsFeed` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `devlog`
--

INSERT INTO `devlog` (`id`, `pub`, `typ`, `title`, `created_at`, `chg_date`, `content`, `image_path`, `xis_ai`, `xis_ai_text`, `LinkName`, `LinkName_en`, `clinks_idx`, `url`, `url_en`, `author_id`, `xis_transl`, `xkis_IsFeed`) VALUES
(1, 1, 'MCS', 'MCS 1.57 Released', 1158776293, 1158776293, 'Marble Content System Version 1.57 (Crazy Joana)  \r\nwurde ver&ouml;ffentlicht und auf der Lowmaxx Seite zu testzwecken installiert.  \r\n  \r\nDieses Release ist das erste offizielle Release und hat mich viel Zeit gekostet.  \r\nViele Features wurden hinzugef&uuml;gt einiges neuprogrammiert und verbessert.  \r\n  \r\nEine umfangreiche Dokumentation ist jetzt auch dabei und einige Features vereinfachen die Arbeit mit MCS erheblich.  \r\n  \r\ngenauere Infos siehe Link.', '', 0, 0, '', '', '|27|', 'www.marblefx.de', 'www.marblefx.de', 1, 0, 1),
(11, 1, 'MCS', 'MCS 1.58 angefangen', 1159392500, 1159392500, 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei Doppelklick zu Fehlern kommen. <blockquote>\r\n       Edit: lag am FILE SIZE Limit\r\n    </blockquote>\r\n</li>\r\n <li>\r\n     Date funktion Funktioniert manchmal nicht, d.h. Datum wird nicht eingestellt obwohl es eine Datumsspalte gibt. <blockquote>\r\n       Edit:Bug gefunden lag am mangelndem Update in der Preview Funktion\r\n    </blockquote>\r\n  </li>\r\n</ul>', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(12, 1, 'MCS', 'MCS 1.59 workin', 1199744200, 1199744200, 'Wir sind am Arbeiten was MCS 1.59 angeht.  <br />\neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  <br />\nPrivate Messages kommen alle noch in dieses Release mit rein  <br />\n  <br />\nfieser Bug in der Welcome gefunden und gelöst', '', 0, 0, '', '', '', 'www.marblefx.de', 'www.marblefx.de', 1, 0, 1),
(13, 1, 'website', 'MCS 1.61 workin', 1263316154, 1263316154, 'Marble Content System ist in version 1.61 erschienen.  <br />\nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  <br />\n  <br />\nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>', '', 0, 0, '', '', '', 'www.marblefx.de', 'www.marblefx.de', 1, 0, 1),
(14, 1, 'MCS', 'MCS 1.63 Workin', 1309196023, 1309196023, 'MCS 1.63 ist nun verfügbar.  <br />\neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  <br />\n  <br />\nWünsche viel spass mit meinem Blog.', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(15, 1, 'website', 'MCS Update steht bevor....', 1311957047, 1311957047, 'Also hier mal wieder ein paar News aus der Devlog Ecke.  <br />\nDie Entwicklung von MCS 1.64 ist angelaufen....  <br />\nGeplant sind einige nette Features zwecks Private Messaging.  <br />\nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  <br />\nweitere Infos demnächst Hier...', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(16, 1, 'website', 'news from MCS', 1313084295, 1313084295, 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  <br />\nso das niemand eine PM verpasst.  <br />\nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  <br />\nund in Asarios Blog implementiert.  <br />\n(ich arbeite noch dran)...', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(18, 1, 'website', 'MCS version 1.67 Released', 1313084338, 1313084338, 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  <br />\nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  <br />\n  <br />\nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  <br />\n  <br />\nMCS ist jetzt Multilanguage fÃ¤hig.  <br />\n  <br />\nVieles Neues kam dazu, altes wurde verbessert.', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(19, 1, 'website', 'MCS v. 1.68 released', 1372016221, 1372016221, 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  <br />\nMCS version 1.68 (Honkey Donkey) wurde installiert.  <br />\n  <br />\nZu den Features zählen:  <br />\n-Neue Icons im Admincenter  <br />\n-Benutzerinhalte Funktionen  <br />\nsowie mehrere kleine eliminierte Fehler  <br />\n  <br />\nMehr Informationen im Changelog auf www.marblefx.de', '', 0, 0, 'MCS Changelog', 'MCS Changelog', '', 'http://www.mfx.marblefx.de/index.php?page=infos&action=details&id=16', 'http://www.mfx.marblefx.de/index.php?page=infos&action=details&id=16', 1, 0, 1),
(20, 1, 'website', 'MCS v. 1.69 Online', 1393787058, 1393787058, 'Marble Content System wurde auf Version 1.69 aktualisiert.  <br />\nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  <br />\nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  <br />\nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine Funktionen fanden den Weg ins 1.69er Release.  <br />\nWenn euch was auffÃ¤llt schreibt mir auf www.mfx.marblefx.de/index.php?page=contact  <br />\nIch wÃ¼nsche euch viel Spass auf meinen Seiten.  <br />\n  <br />\nAsario', '', 0, 0, 'MCS Changelog', 'MCS Changelog', '', 'http://www.mfx.marblefx.de/index.php?page=infos&amp;action=details&amp;id=16', 'http://www.mfx.marblefx.de/index.php?page=infos&action=details&id=16', 1, 0, 1),
(21, 1, 'website', 'Misteri&ouml;se Schatten werfen Ihr Licht auf uns....', 1397410501, 1397410501, 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(22, 1, 'website', 'MCS v. 1.70 released', 1414253644, 1414253644, 'Die Neueste MCS Version ist Nr. 1.70.  <br />\nIn diesem Release wurde einiges neu gemacht.  <br />\nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  <br />\nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  <br />\nMehr infos siehe Changelog  <br />\nIch hoffe Ihr habt eure Freude an diesem Release.', '', 0, 0, 'MCS Changelog', 'MCS Changelog', '', 'http://www.mfx.marblefx.de/index.php?page=infos&action=details&id=16', 'http://www.mfx.marblefx.de/index.php?page=infos&action=details&id=16', 1, 0, 1),
(24, 1, 'MCS', 'MCS v. 1.85 ist eingetroffen....', 1441560586, 1441560586, 'Mal wieder wurde MCS erneuert.  <br />\nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  <br />\nEinige Formularelemente wurden mit Material Design aktualisiert.  <br />\nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  <br />\n  <br />\nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien zum Hochladen in die Update Ordner zu schieben.  <br />\n  <br />\nAußerdem ist ein interner Chat entstanden.  <br />\n  <br />\nwünsche viel Spaß mit MCS v. 1.85 ;)  <br />\nPS.: Momentan arbeite ich an der Integration von JQuery UI Elementen in das Admin Center.  <br />\nsee you soon, Paule aka Asario', '', 0, 0, 'MCS Changelog', 'MCS Changelog', '', 'http://www.marblefx.de/index.php?page=infos&action=details&id=16', 'http://www.marblefx.de/index.php?page=infos&action=details&id=16', 1, 0, 1),
(23, 1, 'website', 'MCS v. 1.72 Ver&ouml;fentlicht', 1426874120, 1426874120, 'Joa, hab mal wieder ne neue Version released.  <br />\nhinzugekommen sind:  <br />\n- ein neues Anti Spam Modul  <br />\n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  <br />\n- Signatureinstellungen automatisiert.  <br />\n  <br />\nAußerdem habe ich Fehler beseitigt im  <br />\n- Benutzerprofil  <br />\n- Meta Tags Scripts  <br />\n- Searching Scripts  <br />\n  <br />\nsowie mehrere kleine Bugs im System.', '', 0, 0, 'MCS Changelog', 'MCS Changelog', '', 'http://www.marblefx.de/index.php?page=infos&action=details&id=16', 'http://www.marblefx.de/index.php?page=infos&action=details&id=16', 1, 0, 1),
(25, 1, 'MCS', 'Neuerungen dank JQuery UI', 1443981829, 1443981829, 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  <br />\n  <br />\nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  <br />\nIch musste alles was auf einzelnen extra Seiten war auf eine Seite reduzieren und die Verlinkung anpassen.  <br />\n  <br />\nAber alles in allem hat es sich gelohnt. Sieht Jetzt Stylischer aus und geht alles sehr viel schneller.  <br />\nHab natürlich beim proggen etliche Bugs verursacht die ich mühsam finden und beseitigen musste.  <br />\n  <br />\nEin nettes Schmankerl ist auch die neue Shortstories Seite.  <br />\n  <br />\naber jetzt müsste eigentlich alles funken. wenn euch noch was auffällt schreibt mir ne PM oder mailt mir einfach über das Mailformular.  <br />\n  <br />\nAch ja, Die Hilfe Seite hab ich komplett neu geschrieben und dabei ca. 80 Zeilen Code eingespart. Klingt nicht nach viel aber bei einem Vergleichsweise kleinem Script ist das schon ne Menge.  <br />\n  <br />\nPS: In den Privaten Nachrichten sind Smilies mit dabei.  <br />\n  <br />\nBis Bald Asario.', '', 0, 0, '', '', '', '', '', 1, 0, 1),
(26, 1, 'MCS', 'MCS Version 1.98 erschienen', 1464108612, 1464108612, 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  <br />\n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  <br />\n2. Countpixel zur Besucheranalyse wurden integriert.  <br />\n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  <br />\n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r einzelne Galerien erweitert,  <br />\nd.h. je nach gewÃ¤hlter Galerie sind unterschiedliche StandardgrÃ¶ÃŸen einstellbar', '', 0, 0, '', '', '|27|', '', '', 1, 0, 1),
(27, 1, 'MCS', 'Neuerungen in MCS 2.01', 1467645174, 1467645174, 'Es ist mal wieder was von der MCS Front zu berichten.  <br />\nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  <br />\nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  <br />\nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die VerknÃ¼pfung  <br />\nder Bilder erneuern/reparieren.  <br />\nEben ist mir bzw Mumbo ein Fehler beim PM Script aufgefallen den ich ebenso gefixt hab.  <br />\nSinn und zweck der Kanonischen URL\'s ist es den Seitennamen zu vereinfachen/zu verkÃ¼rzen.  <br />\nSo wird aus www.asario.de/index.php?page=news -> www.asario.de/news was fÃ¼r Suchmaschinen  <br />\nideal ist und auch leichter zu merken ist.  <br />\nBin zwar noch nicht zufrieden mit den Kanonischen URL\'s aber da fÃ¤llt mir auch noch was ein.  <br />\nHoffe Ihr habt SpaÃŸ auf meinen Seiten...  <br />\nin Love Asario', '', 0, 0, '', '', '|27|', '', '', 1, 1, 1),
(28, 1, 'MCS', 'MCS Version 2.15', 1485339449, 1485339449, 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  <br />\nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  <br />\nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  <br />\nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige kleinere Updates vorgenommen. Unter anderem habe ich ein paar Bugs im Synchro-Tool beseitigt.  <br />\nIch muss demnÃ¤chst noch die RSS-Feeds kontrollieren, hab dazu bis jetzt noch keine Zeit gehabt.  <br />\nAuch dieses mal wÃ¼nsche ich eine schÃ¶ne Zeit in meinem Blog.  <br />\nmfg Asario', '', 0, 0, '', '', '|27|', '', '', 1, 1, 1),
(29, 1, 'MCS', 'Die Version 2.35 von MCS wurde aktualisiert.', 1495782810, 1495782810, 'Mal wieder habe ich eine neue Version veröffentlicht.  <br />\nDie größte Änderung betrifft die Übersicht der Tabelle.  <br />\nHier kann man nun per Drag & Drop Einträge sortieren.  <br />\nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  <br />\nAußerdem habe ich diverse Bugs in einigen Modulen gestopft.  <br />\nEin übler Bug im Kontaktformular wurde soeben gefixt.  <br />\nIhr könnt mir wieder Mails schreiben...  <br />\nmehr Infos wie immer im Changelog.', '', 0, 0, '', '', '|27|', '', '', 1, 1, 1),
(30, 1, 'MCS', 'Neue Version auf alten Gleisen', 1499791492, 1499791492, 'MCS Version 2.45 ist erschienen.  <br />\nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  <br />\nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  <br />\nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  <br />\nAch ja, ich arbeite an den ersten Landingpages fÃ¼r Asarios Blog und musste deswegen an der Grundstruktur der Seiten arbeiten.  <br />\nViel SpaÃŸ damit, Asario', '', 0, 0, '', '', '|27|', '', '', 1, 1, 1),
(31, 1, 'website', 'Frickeleien am Code', 1524072768, 1524072768, 'Habe auch dieses mal einiges verbessert.  <br />\nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  <br />\nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  <br />\n  <br />\nAber es ist geschafft und ich bin Stolz auf meine Arbeit in die ich meine Feierabende investiert habe.  <br />\n  <br />\nHoffe Ihr genieÃŸt das schÃ¶ne Wetter.  <br />\nIch geh jetzt raus mich sonnen.  <br />\n  <br />\nGRTZ from BimÃ¶hlen, Asario', '', 0, 0, '', '', '', '', '', 1, 1, 1),
(32, 1, 'website', 'MCS Version 2.87 Published', 1533892380, 1533892380, 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  <br />\nVersion 2.87 enthält einige neue Features und Verbesserungen.  <br />\nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  <br />\n  <br />\nDesweiteren wurden etliche kleine Bugs beseitigt und es wurde ein Double Opt Out für meinen Asarios Blog Newsletter eingerichtet.  <br />\n  <br />\nWünsche viel Spaß mit diesem Release.  <br />\n  <br />\nIn Love, Asario', '', 0, 0, '', '', '|27|', '', '', 1, 1, 1),
(33, 1, 'website', 'Neues von MCS', 1633814040, 1633782202, 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  <br />\n  <br />\nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  <br />\n  <br />\nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  <br />\n  <br />\nWar ne Zeit lang ohne Internet und konnte somit nichts Posten.  <br />\n  <br />\nWünsche viel Spaß auf [www.asario.de](https://www.asario.de)', '', 0, 0, '', '', '|19|', '', '', 1, 1, 1),
(34, 1, 'website', 'Neuerungen im System', 1665306867, 1665308419, 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  <br />\n  <br />\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  <br />\nAußerdem mal wieder etliche kleinere und größere Bugs behoben.  <br />\nWünsche viel Spaß bei meinen Seiten.  <br />\nCincerly Paul Rieser aka. Asario', 'inno.jpg', 1, 0, '', '', '', '', '', 1, 1, 1),
(35, 1, 'website', 'Winter Update', 1675520282, NULL, 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  <br />\nDie Google Sitemap wurden überarbeitet und verschönert.  <br />\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  <br />\nBugs waren auch einige dabei, alle behoben.  <br />\nHoffe ihr habt spass auf meinen Seiten.', 'winter_update_02.jpg', 1, 0, '', '', '', '', '', 1, 1, 1),
(37, 1, 'website', 'Verbesserte Feeds', 1678536204, NULL, 'Ich habe Asarios Blog\\\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed l&auml;dt jetzt schneller, und seit kurzem auch in Englisch verf&uuml;gbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar kleinere Bugs zu beheben die ich k&uuml;rzlich gefixt habe.Und da alles gut l&auml;uft freue ich mich auf kommende Spannende Features die noch entwickelt werden wollen.', 'rocks-quader-cube.jpg', 1, 0, '', '', '', '', '', 1, 1, 1),
(38, 1, 'website', 'Neue Sterne', 1683448935, NULL, 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zun&auml;chst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** wieder einen Schritt weiter gekommen und ich habe den einen oder anderen Bug behoben.\r\nIch hoffe ihr habt Spa&szlig;, Asario', 'lamas_without_hats.jpg', 1, 0, '', '', '|27|', '', '', 1, 1, 1),
(39, 1, 'website', 'Update zur Zwei-Faktor-Authentifizierung', 1700770191, NULL, 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese Codes nutzen, um sich einzuloggen.\r\n\r\nNach der Aktivierung der Zwei-Faktor-Authentifizierung zeigt Ihnen die Seite Ihre persönlichen Wiederherstellungscodes an. Sie finden diese in Ihrem Benutzerprofil unter Profil-Einstellungen außerdem über dem \"Wiederherstellungscodes\"-Button.\r\n\r\nFür eventuelle Fragen oder Unterstützung stehen wir Ihnen gerne zur Verfügung. Bitte beachten Sie: Geben Sie diese Codes niemals an andere weiter. Sicherheit hat bei uns oberste Priorität!\r\n\r\nMit freundlichen Grüßen, Asario', '2fa3.jpg', 1, 1, '', '', '|27|', '', '', 1, 1, 1),
(40, 1, 'website', 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', 1723111737, NULL, '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen habe, mit euch teilen.\r\n\r\n**Warum PHP 8.2?**\r\nPHP 8.2 bringt viele neue Features und Verbesserungen, die sowohl die Performance als auch die Sicherheit betreffen. Besonders interessant fand ich die verbesserten Type Declarations und die optimierten Fehlerbehandlungsmechanismen. Allerdings bedeutet ein Versionssprung auch, dass bestehender Code Überarbeitet werden muss.\r\n\r\nDie Herausforderung: Variablen deklarieren\r\nEin großes Problem, auf das ich stieß, war, dass PHP 8.2 strenger mit der Variablendeklaration umgeht. Das bedeutet, dass ich in meinem Code viele Variablen explizit deklarieren musste, bevor sie verwendet wurden. Das war zeitaufwendig, weil ich jeden einzelnen Fall durchgehen und sicherstellen musste, dass alle Variablen korrekt initialisiert sind.\r\n\r\n**Die Testphase: Alles durchprobieren**\r\nNachdem ich die Variablen angepasst hatte, begann die intensive Testphase. Ich musste alle Funktionen und Skripte durchprobieren, um sicherzustellen, dass sie unter PHP 8.2 wie gewünscht funktionieren. Es war frustrierend, auf unerwartete Fehlermeldungen zu stoßen, aber nach und nach konnte ich alle Probleme beheben.\r\n\r\nDas Ergebnis: Ein schnelleres und sichereres System\r\nNach all der Arbeit kann ich stolz sagen, dass mein System nun unter PHP 8.2 läuft - und das schneller und sicherer als je zuvor. Die Mühe hat sich gelohnt, und ich bin gespannt, wie sich diese Optimierungen langfristig auswirken werden.\r\n\r\n**Fazit:**\r\nDie Aktualisierung auf PHP 8.2 war eine Herausforderung, aber auch eine wertvolle Lernerfahrung. Wenn du ebenfalls darüber nachdenkst, PHP auf deinem Server zu aktualisieren, empfehle ich dir, gründlich zu testen und dich auf einige Anpassungen im Code vorzubereiten. Es lohnt sich!', 'php82.jpg', 1, 1, '', '', '|27|', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `didyouknow`
--

DROP TABLE IF EXISTS `didyouknow`;
CREATE TABLE `didyouknow` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` int(11) NOT NULL,
  `author_id` bigint(11) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `answer` mediumtext NOT NULL,
  `created_at` int(11) NOT NULL,
  `chg_date` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `didyouknow`
--

INSERT INTO `didyouknow` (`id`, `pub`, `position`, `author_id`, `headline`, `answer`, `created_at`, `chg_date`) VALUES
(1, 1, 0, 1, ' dass am 4.5. Star Wars Tag ist', 'May the 4th will be with you,  <br />\nmay the force will be with you.', 1525527532, 1525527532),
(2, 1, 1, 1, ' dass In Schleswig Holstein die glücklichsten Menschen Deutschlands leben', 'Schleswig Holsteiner sind die glücklichsten im Bundesdurchschnitt.', 1525527815, 1525527815),
(3, 1, 2, 1, ' dass eine Hummel laut Gesetzen der Aerodynamik gar nicht fliegen kann.', 'Die Hummel wiegt 4,8\nGramm. Sie hat eine\nFlügelfläche von\n1,45 cm² bei einem\nFlächenwinkel von 6\nGrad.  \nNach den Gesetzen\nder Aerodynamik kann die\nHummel nicht fliegen.\nAber die Hummel weiß das\nnicht.  \n(Wer hätte das\ngedacht!)', 1525528066, 1525528066),
(4, 1, 3, 2, ' dass ein Saxophon ein Holzblasinstrument ist', 'Ja, da der Tonerzeuger (das Rohrblatt) aus Holz ist, gehört das Saxophon zu den Holzbläsern.', 1727008620, 1525528657),
(5, 1, 4, 2, ' dass man vom Kaffee Entzug Kopfschmerzen bekommen kann', 'Bei einigen Menschen sorgt der Kaffee Entzug für starke Kopfschmerzen.', 1727007840, 1525529238),
(6, 1, 5, 2, ' dass Heroin keine Psychosen auslöst', 'Als einzige illegale Droge führt Heroin nicht zu Psychosen.  \nTrotzdem sollte man sowas nicht ausprobieren.', 1525529349, 1525529349),
(7, 1, 6, 2, ' dass Hunde ein glänzendes Fell bekommen wenn man Sie mit Thunfisch füttert', 'Ja, Thunfisch in Öl sorgt für ein glänzendes Fell bei Hunden.  \nAchtung: wenn der Hund es nicht verträgt kann es zu Durchfall kommen (wegen dem Öll)', 1525531160, 1525531160),
(8, 1, 7, 2, ' dass auf einer Zahnbürste mehr Keime zu finden sind als auf einer Klobrille', 'Die Keimbelastung einer Zahnbüste ist höher als auf einem Smartphone oder einer Klobrille. Die Keime sind aber wichtig um das Essen beim kauen vorzuverdauen.', 1525531821, 1525531821),
(9, 1, 8, 2, ' dass Erdbeeraroma nicht aus Erdbeeren sondern aus Sägemehl hergestellt wird', 'Ja, Erdbeerarome wird aus Pilzkulturen gewonnen die auf BuchenholzspÃ¤nen wachsen.', 1525598045, 1525598045),
(10, 1, 9, 2, ' dass Urin je nach Verweildauer in der Blase dunkler gefärbt ist', 'Desto länger der Urin in der Blase ist, desto dunkler ist er beim Pinkeln.', 1525709463, 1525709463),
(11, 1, 10, 2, ' dass die Armspannweite normalerweise der Körpergröße entspricht', 'Bei den meisten Menschen beträgt die Armspannweite der Körpergröße.', 1525709665, 1525709665),
(12, 1, 11, 2, ' dass Rollmöpse in Wirklichkeit Gurken essen', 'Sonst währ ja keine Gurke drin :).', 1525709737, 1525709737),
(13, 1, 12, 2, ' dass Intelligente Menschen zu einer Sauklaue neigen', 'Laut Studien haben Intelligente Menschen eher eine unleserliche Handschrift als andere.', 1525709842, 1525709842),
(14, 1, 13, 2, ' dass reife Bananen Alkohol enthalten', 'Ja, reife Bananen enthalten bis zu 1.24 % Alkohol.', 1525710048, 1525710048),
(15, 1, 14, 2, ' dass Nat&uuml;rlich nur hei&szlig;t das es naturidentisch ist', 'Natürliche Zutaten müssen nicht aus der Natur stammen, Sie sind lediglich in der Natur in dieser Form vorhanden, müssen aber nicht aus Naturprodukten produziert worden sein.', 1525715716, 1525715716),
(16, 1, 15, 2, ' dass Teetrinker oft Halbblind sind', 'Sie vergessen nämlich den Löffel rauszunehmen.', 1526026831, 1526026831),
(17, 1, 16, 2, ' dass Wiener Schnitzel immer aus Kalbsfleisch hergestellt wird', 'Lediglich das Schnitzel \"Wiener Art\" ist aus Schweinefleisch.', 1526026921, 1526026921),
(18, 1, 17, 2, ' dass ein Pferd heisst Pferd weil es lebt auf der Erd', 'Lebte es in der Luft hiess es Pfluft.', 1526124442, 1526124442),
(19, 1, 18, 2, ' dass im deutschem K&auml;sekuchen gar kein K&auml;se drin ist', 'Im Amerikanischem Cheesecake ist aber Frischkäse mit drin.', 1526216559, 1526216559),
(20, 1, 19, 2, ' dass Die Taschenuhrtasche noch heute verbaut wird', 'Die kleine Tasche in Jeans in der rechten vorderen Tasche ist Ursprünglich für Taschenuhren konzipiert. Aber noch heute passt eine Taschenuhr hinein.', 1526400529, 1526400529),
(21, 1, 20, 2, ' dass Salvator Dahl&iacute; das Logo von Chuppa Chups entworfen hat', 'Ja Dahlí hat damals das Logo des spanischem Lolliproduzenten designt.', 1526483708, 1526483708),
(22, 1, 21, 2, ' dass die Zunge der st&auml;rkste Muskel im K&ouml;rper eines Menschen ist', 'Ja die Zunge ist starkt und wird nicht von einem Knochen gestützt.', 1526483867, 1526483867),
(23, 1, 22, 2, ' dass Schlittenhund im Winter Schuhe tragen', 'Ja, die empfindlichen Pfoten werden bei Schlittenhunden mit einer art Schuhe geschützt.', 1526484029, 1526484029),
(24, 1, 23, 2, ' dass die Zeit schneller vergeht wenn einem etwas Spa&szlig; macht', 'Wenn wir Spaß an einer Sache haben kommt einem die Zeit kürzer vor.  <br />\nMan nehme 2 Gruppen, eine Spielt Billiard mit Frauen in Bikini und eine Gruppe schält Kartoffeln. Gruppe 1 dachte das sie eine viertel Stunde gespielt hat, während die Andere Gruppe glaubte eine Dreviertelstunde zu schälen. Beide Gruppen waren 30 Minuten beschäftigt.  <br />\nErgo, wenn eine Sache Spaß macht vergeht die Zeit schneller.+', 1526578094, 1526578094),
(25, 1, 24, 1, ' dass Wodka auf deutsch &uuml;bersetzt W&auml;sserchen heisst', 'Im Russischem steht das Wort Woda für Wasser, mit der verniedlichung \"ka\" am ende heißt es Wässerchen oder eben Wodka', 1526578223, 1526578223),
(26, 1, 25, 2, ' dass man Seine Wirbels&auml;ule knacken h&ouml;rt wenn man sein Ohr auf den Bauchnabel legt', 'Ja was soll man denn sonst hören :)', 1526578360, 1526578360),
(27, 1, 26, 2, ' dass Pferde nicht kotzen k&ouml;nnen', 'Pferde können nicht kotzen und deswegen ernähren Sie sich nur mit gesundem Futter.  <br />\nIm schlimmsten Fall bekommen Sie eine Schlundverstopfung die Ärztlich behandelt werden muss.', 1526662394, 1526662394),
(28, 1, 27, 2, ' dass man schwangere Frauen immer auf die linke Seite bei einer stabilen Seitenlage legen soll', 'Die Vene die das Embryo ernährt liegt auf der rechten Seite und sollte nicht abgeklemmt werden. Deswegen immer auf Links drehen.', 1526662544, 1526662544),
(29, 1, 28, 2, 'warum Vogelschei&szlig;e immer Wei&szlig; ist', 'Weil Vögel nicht Pinkeln können vermischt sich der Urin mit der Kacke und der Amoniak im Urin färbt die Scheiße Weiß.', 1528006650, 1528006650),
(30, 1, 29, 2, 'was das gr&ouml;&szlig;te Organ im menschlichem K&ouml;rper ist', 'Die Haut ist das größte Organ im menschlichem Körper.', 1528006817, 1528006817),
(31, 1, 30, 2, 'woran man einen Staatswagen erkennt', 'Das Nummernschild hat nach dem - nur eine Zahl. z.B. SE-123456', 1528006963, 1528006963),
(32, 1, 31, 2, ' dass Wasser trinken t&ouml;dlich sein kann', 'Ja, wer zu viel Wasser trinkt kann davon sterben weil die gesamten Elektrolyte rausgespielt werden. Aber das ist erst ab 8 Liter pro Tag gefährlich', 1528007129, 1528007129),
(33, 1, 32, 2, 'was der unterschied zwischen Moin und Moin Moin ist', 'Moin ist in Norddeutschland eine beliebte Begrüßungsfloskel.  <br />\nMoin Moin heißt im Prinzip das selbe wie Moin nur das der der Moin Moin sagt eher redselig ist.', 1528007339, 1528007339),
(34, 1, 33, 2, ' dass Espresso weniger Koffein enth&auml;lt als eine Tasse Kaffee', 'Robusta-Bohnen sind zwar etwas koffeinreicher als Arabica-Bohnen, aber insgesamt enthält ein Espresso doch weniger Koffein als Filterkaffee. Das liegt schlicht daran, dass er sehr viel kleiner ist.', 1528638563, 1528638563),
(35, 1, 34, 2, ' dass Arbeitspferde auf kurzen Strecken mehr als 1 PS leisten', 'Bis zu 24 PS können Kaltblüter auf kurzen Strecken erreichen.  <br />\nSomit ist eine Pferdestärke nicht immer ein PS.', 1529762418, 1529762418),
(36, 1, 35, 2, ' dass Frauen sich seltener die H&auml;nde waschen als M&auml;nner', 'Eine Studie unter Medizinern besagt, das sich Frauen nach dem Toilettengang sich seltener die Hände waschen als Männer.', 1529762626, 1529762626),
(37, 1, 36, 2, 'was der unterschied zwischen einer richtigen Schlange und einer Autoschlange ist', 'Bei der richtigen Schlange ist das Arschloch hinten.', 1529764039, 1529764039),
(38, 1, 37, 2, 'was la cucaracha auf deutsch hei&szlig;t', 'Es heißt, die Kakerlake.', 1529764479, 1529764479),
(39, 1, 38, 2, ' dass Aluminium nicht Rosten kann', 'Ja, Aluminium in reiner Form kann nicht rosten.', 1530549312, 1530549312),
(40, 1, 39, 2, ' dass Elefantenk&uuml;he 22 Monate tragen', 'Ja Elefantenkühe tragen 22 Monate bis sie ihr Kind gebären.', 1530886320, 1530886320),
(41, 1, 40, 2, ' dass Pommes Frites nicht aus Frankreich stammen', 'Pommes Frites, was auf deutsch frittierter Apfel heißt stammt tatsächlich aus Belgien.', 1531637834, 1531637834),
(42, 1, 41, 2, 'wer die meisten Motoren baut', 'Honda baut die meisten Motoren auf der Welt.', 1532848749, 1532848749),
(43, 1, 42, 2, 'wonach Rubinienholz riecht wenn man es schleift', 'Es riecht nach Kekse.', 1532848840, 1532848840),
(44, 1, 43, 2, ' dass man f&uuml;r jedes Hubschraubermodell einen extra F&uuml;hrerschein ben&ouml;tigt', 'Ja, der Helikopterpilot benötigt für jedes Hubschraubermodell das er fliegen will einen extra Führerschein.', 1533974315, 1533974315),
(45, 1, 44, 2, ' dass Chilli Con Carne gar nicht aus Mexico stammt', 'Chilli Con Carne ist ein texanisches Gericht und stammt nicht aus Mexico.', 1534061768, 1534061768),
(46, 1, 45, 2, ' dass Disco im Plattdeutschen nicht Disco hei&szlig;t', 'Disco ist im Plattdeutsch \"Dance op de deel\".', 1534518909, 1534518909),
(47, 1, 46, 2, ' dass Italiener gar nicht Spaghetti Bolognese bestellen', 'In Italien ist Spaghetti Bolognese Spaghetti a la Ragout.', 1535199238, 1535199238),
(48, 1, 47, 2, ' dass Truthahn und Pute das selbe ist', 'Truthahn ist eine männliche Pute, und Pute ist ein weiblicher Truthahn.', 1537081100, 1537081100),
(49, 1, 48, 2, ' dass Plastik aus Erd&ouml;l hergestellt wird', 'Kunststoff wird aus Erdöl hergestellt.', 1537616972, 1537616972),
(50, 1, 49, 2, 'warum Fahrbahnmarkierungen im dunkeln leuchten', 'Weil kleine Glasperlen aus Altglas in der Farbe enthalten sind.', 1538909055, 1538909055),
(51, 1, 50, 2, ' dass Erdbeeren in Wirklichkeit N&uuml;sse sind', 'Die Erdbeere gehört in Wahrheit zu den Sammelnussfrüchten.', 1539443704, 1539443704),
(52, 1, 51, 2, 'wof&uuml;r das A und O steht', 'A wie Alpha und O wie Omega sind der erste bzw. letzte Buchstabe im griechischem Alphabet.', 1540113812, 1540113812),
(53, 1, 52, 2, 'was zuerst erfunden wurde, Feuerzeug oder Streichholz', 'Benzinfeuerzeuge sind älter als Streichhölzer.', 1541012256, 1541012256),
(54, 1, 53, 2, ' dass die Tage im Sommer k&uuml;rzer und im Winter l&auml;nger werden', 'Ja, ab der Sommersonnenwende werden die Tage um 5 Minuten kürzer und um Winter wieder 5 Minuten länger pro Tag.', 1541922830, 1541922830),
(55, 1, 54, 2, ' dass Bambus nur alle 80-130 Jahre bl&uuml;ht', 'Bambusse blühen in Intervallen von ca. 80 bis 130 Jahren.', 1541938097, 1541938097),
(60, 1, 55, 2, ' dass im Eiwei&szlig; gar kein Eiwei&szlig; enthalten ist', 'Eiweiß ist nur im Eigelb enthalten. Das Eiklar enthält kein Eiweiß.', 1542743260, 1542743260),
(61, 1, 56, 2, ' dass Paprika mehr Vitamin C als Zitrusfr&uuml;chte enth&auml;lt', 'Ja die Paprika ist nach Hagebutte und Sanddorn die Vitaminreichste Frucht.', 1543071311, 1543071311),
(62, 1, 57, 2, ' dass harte Matratzen besser f&uuml;r den R&uuml;cken sind als weiche', 'Ja, eine harte Matratze ist besser für den Rücken.', 1543075002, 1543075002),
(63, 1, 58, 2, ' dass es nur eine Band gab in der jedes Mitglied einen Top-10 Hit schrieb', 'Ja es war Queen.', 1543741774, 1543741774),
(64, 1, 59, 2, ' dass man mit Cola Fliegendreck vom Auto bekommt', 'Einfach Cola in eine Schüssel, Lappen rein, Auto einmal nass machen und dann mit Cola einreiben oder Waschen.', 1543742554, 1543742554),
(65, 1, 60, 2, 'womit KrankenpflegerInnen rasieren &uuml;ben', 'Sie benutzen einen Luftballon. Rasierschaum rauf und vorsichtig abschaben.  <br />\nWenn der Ballon platzt hätten sie den Patienten geschnitten.', 1543945638, 1543945638),
(66, 1, 61, 2, 'warum Rehe einen wei&szlig;en Fleck am Hintern haben', 'Rehe sind Fluchttiere, und wenn sie hintereinander fliehen so finden sie den Vordermann in der Dämmerung leichter durch den weißen Fleck am Hinterteil.', 1544029854, 1544029854),
(67, 0, 62, 2, ' dass Neum&uuml;nster die gef&auml;hrlichste Stadt Deutschlands ist', 'Pro Kopf gerechnet sind die meisten Straftaten in Neumünster registriert worden.  <br />\nSomit ist Neumünster in Schleswig Holstein die gefährlichste Stadt Deutschlands.', 1544030202, 1544030202),
(68, 1, 63, 2, ' dass Verbrennungen am schnellsten verheilen wenn man sich den verbrannten Finger ans Ohrl&auml;ppchen h&auml;lt', 'Das Ohrläppchen ist immer lauwarm, was das beste bei leichten Verbrennungen ist.  <br />\nDeswegen Finger ans Ohrläppchen und die Brandblase kommt gar nicht erst.  <br />\nZumindest meistens klappt das', 1544031055, 1544031055),
(69, 1, 64, 2, 'welche Marke hinter Subaru steht', 'Subaru ist die Allradmarke von Toyota.', 1544031462, 1544031462),
(70, 1, 65, 2, ' dass Tintenfische keine Fische sind', 'Ja, Tintenfische sind Weichtiere und keine Fische.', 1545298587, 1545298587),
(71, 1, 66, 2, 'welche Firma das SUV erfunden hat', 'Jeep, es war ein Jeep.', 1546534526, 1546534526),
(72, 1, 67, 2, 'was der Unterschied zwischen Sultaninen und Rosinen ist', 'Sultaninen werden aus kernlosen Trauben hergestellt und Rosinen aus solchen mit Kernen.', 1546534684, 1546534684),
(73, 1, 68, 2, ' dass klarer Apfelsaft nichts f&uuml;r Vegetarier ist', 'Beim klären von Apfelsaft wird Gelatine verwendet die wiederum aus Knochen hergestellt wird.', 1546534819, 1546534819),
(74, 1, 69, 2, 'woher der Name Bob stammt', 'Bob ist die Kurzform von Robert.', 1546534927, 1546534927),
(75, 1, 70, 2, 'wer die europaweit gr&ouml;sste IT-Redaktion hat', 'Der Heise Verlag in Hannover ist Heimat der grössten IT-Redaktion Europas.', 1546535060, 1546535060),
(76, 1, 71, 2, 'wieviel Prozent Butter mehr Fett hat als Margarine', 'Butter hat nur 2 Prozent mehr Fett als Margarine.', 1546535192, 1546535192),
(77, 1, 72, 2, 'wie man Aufkleber von glatten Oberfl&auml;chen entfernt', 'Mit Essig einreiben, einwirken lassen, und schon lösen sich die Aufkleber wie von selbst.', 1547139329, 1547139329),
(78, 1, 73, 2, 'dass die Wahrscheinlichkeit gr&ouml;&szlig;er ist von einer Kokosnuss erschlagen zu werden. als von einem Haifisch angefallen zu werden', 'Ja, es ist wahrscheinlicher von einer Kokosnuss erschlagen zu werden, als von einem Hai gebissen zu werden.', 1548587479, 1548587479),
(79, 1, 74, 2, 'warum der Thunfisch Thunfisch heisst', 'Taucht ein Taucher vor der Küste nach Perlen und wird von einem Fisch gebissen, darauf der Taucher: \"Das kannst du doch nicht tun Fisch\".', 1549300059, 1549300059),
(80, 1, 83, 2, 'welches Land in Europa die h&ouml;chste Selbstmordrate hat', 'Finnland', 1549472914, 1549472914),
(81, 1, 75, 2, 'woher der Name Sascha stammt', 'Sascha ist die russische Kurzform von Alexander.', 1549473024, 1549473024),
(82, 1, 76, 2, 'dass die Sonne im Winter 5 Minuten pro Tag l&auml;nger scheint', 'Im Winter beträgt die Dauer des Sonnenscheins immer 5 Minuten mehr pro Tag.  <br />\nIm Sommer beträgt die Dauer des Tages 5 Minuten weniger pro Tag.', 1549784880, 1549784880),
(83, 1, 77, 2, 'dass Schiedsrichter in Deutschland jedes Bundesligaspiel umsonst besuchen k&ouml;nnen', 'Als Besitzer eines Schiedsrichterscheins sind alle Bundesligaspiele umsonst.', 1552407442, 1552407442),
(84, 1, 78, 2, 'wie viele Sterne es im Universum gibt', 'Ungefähr genauso viele wie Sandkörner auf der Erde.', 1553352135, 1553352135),
(85, 1, 79, 2, 'dass die Erfinder von Adidas und Puma verwand sind', 'Adi Dasler und sein Bruder erfanden die beiden Sportmarken.', 1553416058, 1553416058),
(86, 1, 80, 2, 'welches die Farbe ist die man als erstes sieht', 'Es ist Gelb, vermutlich wegen der gelben Sonne.', 1553424924, 1553424924),
(87, 1, 81, 2, 'dass Helmut Schmidt ausschlie&szlig;lich Menthol Zigaretten geraucht hat', 'Ja, er war ein Fan von Menthol Zigaretten, Gott hab Ihn selig.', 1553937245, 1553937245),
(88, 1, 82, 2, 'was Blinde an einer Ampel machen', 'Sie drücken einen kleinen Knopf an der Unterseite des Drückers um die Ampel auf Töne umzustellen. Ohne das betätigen des Knopfes piept die Ampel nicht.', 1553937411, 1553937411),
(89, 1, 84, 2, 'wieviel ein M&uuml; ist', 'Wenn man eine Münze zwischen den Fingern verreibt, das Geldstück noch riechen kann aber nicht mehr sehen kann dann ist die Münze noch ein Mü hoch.', 1556229600, 1556229600),
(90, 1, 85, 2, 'dass Farbige mehr kurzzuckende Muskeln haben', 'Farbige Menschen haben ca. 20% mehr kurzzuckende Muskeln was Ihre Bewegungen geschmeidiger macht. Selbst mit extremen Training sind die Bewegungen nie so geschmeidig wie bei einem Farbigen.', 1554544600, 1554544600),
(91, 1, 86, 2, 'wer den meisten Kaffee auf der Welt trinkt', 'Die Finnen trinken den meisten Kaffee auf der Welt.  <br />\nDas hängt mit dem Alkoholverbot von früher zusammen,  <br />\nals Ersatzdroge wurde/wird Kaffee getrunken', 1555242046, 1555242046),
(92, 1, 87, 2, 'welches Volk die meisten K&uuml;hlschr&auml;nke pro Kopf besitzt', 'Es sind die Inuit, besser bekannt als Eskimos.  <br />\nBei den Inuit ist es so kalt dass alles einfrieren würde wenn es nicht \"gekühlt\" werden würde.', 1555242235, 1555242235),
(93, 1, 88, 2, 'womit man Holzbretter desinfiziert', 'Mit Zitronensaft werden Holzbretter desinfiziert.', 1555785488, 1555785488),
(94, 1, 89, 2, 'was der Unterschied zwischen Nasi Goreng und Bami Goreng ist', 'Nasi Goreng ist mit Reis und Bami Goreng ist mit Nudeln.  <br />\nIch mag sie beide.', 1555831422, 1555831422),
(95, 1, 90, 2, 'wann Karfreitag ist', 'Karfreitag ist immer der Freitag nach dem letzten Vollmond im April.', 1559151775, 1559151775),
(96, 1, 91, 2, 'warum 4 Grad Celsius eine magische Temperatur ist', 'Ab 4 Grad Celsius ist die Anomalie des Wassers zu beobachten.  <br />\nWasser dehnt sich entgegen aller anderer Stoffe ab 4 Grad oder kälter weiter aus.  <br />\nDesweiteren Wächst Gras bei bis zu 4 Grad oder wärmerA noch.  <br />\nUnd unser Atem wird ab 4 Grad oder kälter sichtbar', 1559229687, 1559229687),
(97, 1, 92, 2, 'dass nicht alle Whirlpools Yakuzis sind', 'Aber alle Yakuzis sind Whirlpools.  <br />\nYakuzi ist eine Whirlpool Marke.', 1561876810, 1561876810),
(98, 1, 93, 2, 'Mit welchem Tier man früher Löwen gejagt hat', 'Früher wurden Löwen mit Deutschen Doggen gejagt.', 1563709877, 1563709877),
(99, 1, 94, 2, 'wie viel Stunden ein Koala am Tag schl&auml;ft', 'Ganze 20 Stunden pro Tag verbringt der Koala damit zu schlafen.', 1566127307, 1566127307),
(100, 1, 95, 2, 'Woher eine Blasenentz&uuml;ndung kommt', 'Eine Blasenentzündung kommt von Bakterien und nicht vom im kalten Sitzen.', 1572786018, 1572786018),
(101, 1, 96, 2, 'Wieviel CO2 unser Fleischkonsum kostet', 'Ein drittel des CO2 Verbrauchs ist nur für die Produktion von Fleisch verantwortlich.', 1572786222, 1572786222),
(102, 1, 97, 2, 'wozu die kleine Tasche in einer Jeans da ist', 'Die kleine Tasche ist für eine Taschenuhr gemacht worden, und sie wird noch heute integriert, obwohl kaum einer sie dafür noch nutzt', 1572786414, 1572786414),
(103, 1, 98, 2, 'Wozu Rippen da sind', 'Rippen sind gemacht zum Brechen.  <br />\nSo absorbieren sie die meiste Energie bei einer Kollision.', 1572786551, 1572786551),
(104, 1, 99, 2, 'wof&uuml;r Haribo steht', 'Haribo ist die Abk&uuml;rzung von HAns RIegel BOnn.', 1574242158, 1574242158),
(105, 1, 100, 2, 'dass ein Rolltreppengel&auml;nder nicht die selbe Geschwindigkeit hat wie die Treppe', 'Das Geländer läuft schneller als die Treppe damit man nicht so leicht nach hinten kippt.', 1576250008, 1576250008),
(106, 1, 101, 2, 'was die H&ouml;chststrafe f&uuml;r das Umfahren einer Kuh in Indien ist', 'In Indien kann man bis zu 7 Jahre Gefängnis bekommen wenn man eine Kuh überfährt.', 1578841747, 1578841747),
(107, 1, 102, 2, 'Warum der Porsche 911, 911 hei&szlig;t', 'Ursprünglich hieß der Porsche 911, Porsche 901 aber da hatten Sich die Zuffenhausener die Rechnung ohne Peugeot gemacht, die Mahnten an das die Zahl 901 mehr für Peugeot steht und sorgten dafür das der Porsche nun 911 hieß.', 1578841940, 1578841940),
(108, 0, 103, 2, 'dass Obst schneller reift wenn man es mit &Auml;pfeln lagert', 'Obst wie z.B. Bananen reifen schneller wenn sie mit Äpfeln in Kontakt kommen.', 1579288118, 1579288118),
(114, 1, 104, 2, 'wie lange Pandas pro Tag mit essen besch&auml;ftigt sind', 'Ganze 14 Stunden Pro Tag tun sie nichts anderes als fressen', 1583524276, 1583524276),
(115, 1, 105, 2, 'Welches die lautesten Tiere der Erde sind', 'Es sind Pottwale.  <br />\nNeben dem grössten Hirn sind sie auch die lautesten.  <br />\nIhre Klicklaute können lauter als ein Düsentriebwerk sein.', 1583524276, 1659536874),
(116, 1, 106, 2, 'das Bananen schneller reifen wenn sie mit &Auml;pfeln gelagert werden', 'Ja, die Äpfel sondern ein Reifegas aus was anderes Obst, wie Bananen schneller reifen lassen.', 1599306009, 1659536848),
(117, 1, 107, 2, 'wie oft man am Tag atmet', '18000 x Atmen wir im Schnitt pro Tag', 1676037113, 0),
(118, 1, 108, 2, 'Warum der Sonnenuntergang am Meer meist rot ist', 'Die Feuchtigkeit in der Luft wirkt wie ein Prisma das dass Licht bricht und den Himmel Rot erscheinen lässt', 1727605121, 0);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL DEFAULT 0,
  `position` bigint(11) NOT NULL,
  `images_categories_id` bigint(11) DEFAULT NULL,
  `headline` varchar(80) DEFAULT NULL,
  `headline_en` varchar(80) DEFAULT NULL,
  `status` enum('empty','sold','forsale','unsaleable','givenaway','lost','inwork') DEFAULT NULL,
  `created_at` bigint(11) NOT NULL DEFAULT 0,
  `chg_date` bigint(11) NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `message_en` longtext DEFAULT NULL,
  `camera_id` bigint(11) NOT NULL DEFAULT 0,
  `image_path` varchar(90) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `Format` varchar(80) DEFAULT NULL,
  `Format_en` varchar(80) DEFAULT NULL,
  `preis` float(5,2) DEFAULT NULL,
  `users_id` bigint(11) NOT NULL DEFAULT 0,
  `xis_IsSaleable` tinyint(1) DEFAULT NULL,
  `xkis_Ticker` tinyint(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `pub`, `position`, `images_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `chg_date`, `message`, `message_en`, `camera_id`, `image_path`, `link`, `Format`, `Format_en`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(5, 0, 300, 25, 'Die Weide', 'Die Weide', 'empty', 1160120700, 1160120700, 'Eine ausgestorbene Weide in Berge bei Nauen,  <br />\nIm Vordergrund unser Model Fabrice ;)', 'Eine ausgestorbene Weide in Berge bei Nauen,  <br />\nIm Vordergrund unser Model Fabrice ;)', 3, 'Die-Weide.jpg', '', '', '', 0.00, 1, 0, 1),
(6, 1, 299, 25, 'Die Schnecke', 'Die Schnecke', 'empty', 1156314000, 1156314000, 'Schnecke bei uns inner Laube.  <br />\nMan sieht sogar noch die Beschriftung annem Balken', 'Schnecke bei uns inner Laube.  <br />\nMan sieht sogar noch die Beschriftung annem Balken', 3, 'Die-Schnecke.jpg', '', '', '', 0.00, 1, 0, 1),
(10, 1, 298, 25, 'Bahnof Potsdamer Platz bei Nacht', 'Bahnof Potsdamer Platz bei Nacht', 'empty', 1159315800, 1159315800, 'Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  <br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.', 'Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  <br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.', 3, 'Potsdamer-Platz.jpg', '', '', '', 0.00, 1, 0, 1),
(15, 1, 297, 2, 'They Say Jump', 'They Say Jump', 'empty', 1018541160, 1018541160, 'Ein etwas älteres Wallpaper von 2002', 'Ein etwas älteres Wallpaper von 2002', 0, 'jump.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(16, 1, 296, 2, 'Where are you gone Now', 'Where are you gone Now', 'empty', 1021565220, 1021565220, 'Wallpaper von 2002', 'Wallpaper von 2002', 0, 'where-are-u-gone-now.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(17, 1, 295, 2, 'Smell the Roses', 'Smell the Roses', 'empty', 1026490080, 1026490080, 'Wallpaper von 2002', 'Wallpaper von 2002', 0, 'smell-the-roses.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(18, 1, 294, 2, 'RP- Wallpaper', 'RP- Wallpaper', 'empty', 1030982880, 1030982880, 'Das Rotten-Psychos Wallpaper von 2002', 'Das Rotten-Psychos Wallpaper von 2002', 0, 'Rotten-Psychos.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(21, 1, 293, 24, 'Edge Country', 'Edge Country', 'empty', 1050082380, 1050082380, '', '', 0, 'P2062655.jpg', '', '', '', 0.00, 1, 0, 1),
(22, 1, 292, 24, 'Evil Bedtime', 'Evil Bedtime', 'empty', 1059932760, 1059932760, '', '', 0, 'P2062656.jpg', '', '', '', 0.00, 1, 0, 1),
(23, 1, 291, 26, 'Extreme Wounds', 'Extreme Wounds', 'empty', 1086112080, 1086112080, '', '', 0, 'P2062657.jpg', '', '', '', 0.00, 1, 0, 1),
(25, 1, 290, 1, 'Rebeltown', 'Rebeltown', 'empty', 1072636440, 1072636440, '', '', 0, 'P2062660.jpg', '', '', '', 0.00, 1, 0, 1),
(28, 1, 289, 24, 'Hangtime', 'Hangtime', 'empty', 1096738140, 1096738140, '', '', 0, 'P2062662.jpg', '', '', '', 0.00, 1, 0, 1),
(30, 1, 288, 24, 'Blue Fontaine', 'Blue Fontaine', 'empty', 1099894200, 1099894200, '', '', 0, 'P2062665.jpg', '', '', '', 0.00, 1, 0, 1),
(31, 1, 287, 24, 'Circle Bang', 'Circle Bang', 'empty', 1101820320, 1101820320, '', '', 0, 'P2062664.jpg', '', '', '', 0.00, 1, 0, 1),
(33, 1, 286, 24, 'Neurotic Nurse', 'Neurotic Nurse', 'empty', 1102099620, 1102099620, '', '', 0, 'P2062666.jpg', '', '', '', 0.00, 1, 0, 1),
(36, 1, 285, 24, 'Lttle Kiwi', 'Lttle Kiwi', 'empty', 1112723460, 1112723460, 'Fineliner Artwork von 2005', 'Fineliner Artwork von 2005', 0, 'P2062671.jpg', '', '', '', 0.00, 1, 0, 1),
(37, 1, 284, 24, 'Spidermoon', 'Spidermoon', 'empty', 1123264320, 1123264320, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062672.jpg', '', '', '', 0.00, 1, 0, 1),
(38, 1, 283, 24, 'Honeymoon', 'Honeymoon', 'empty', 1129139580, 1129139580, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062673.jpg', '', '', '', 0.00, 1, 0, 1),
(39, 1, 282, 24, 'Pole Position', 'Pole Position', 'unsaleable', 1138874040, 1138874040, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062675.jpg', '', '', '', 0.00, 1, 0, 1),
(41, 1, 281, 24, 'Goldfish', 'Goldfish', 'givenaway', 1147473360, 1147473360, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062680.jpg', '', '', '', 0.00, 1, 0, 1),
(42, 1, 280, 24, 'Disc Error', 'Disc Error', 'empty', 1147715760, 1147715760, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062685.jpg', '', '', '', 0.00, 1, 0, 1),
(43, 1, 279, 24, 'Cloud Spring', 'Cloud Spring', 'unsaleable', 1151757480, 1151757480, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062688.jpg', '', '', '', 0.00, 1, 0, 1),
(44, 1, 278, 24, 'Webmaster\'s Delight', 'Webmaster\'s Delight', 'unsaleable', 1165603320, 1165603320, '', '', 0, 'P2062692.jpg', '', '', '', 0.00, 1, 0, 1),
(46, 1, 277, 24, 'Damned Fleet', 'Damned Fleet', 'forsale', 1170788700, 1170788700, '', '', 0, 'P6023068.JPG', '', '', '', 25.00, 1, 1, 1),
(47, 1, 276, 24, 'Twisted Minds', 'Twisted Minds', 'forsale', 1177697160, 1177697160, '', '', 0, 'P6023067.JPG', '', '', '', 20.00, 1, 1, 1),
(48, 1, 275, 24, 'Known Bugs', 'Known Bugs', 'forsale', 1177835160, 1177835160, '', '', 0, 'P6023066.JPG', '', '', '', 20.00, 1, 1, 1),
(49, 1, 274, 24, 'Gullivers Adventures', 'Gullivers Adventures', 'forsale', 1178008020, 1178008020, '', '', 0, 'P6023065.JPG', '', '', '', 20.00, 1, 1, 1),
(50, 1, 273, 24, 'Chaotic Australia', 'Chaotic Australia', 'forsale', 1180859220, 1180859220, 'Chaotisches Australien', 'Chaotisches Australien', 0, 'P6023064.JPG', '', '', '', 20.00, 1, 1, 1),
(51, 1, 272, 24, 'Curved Spikes', 'Curved Spikes', 'forsale', 1186334880, 1186334880, '2007er Fineliner Artwork', '2007er Fineliner Artwork', 0, 'P6043079.JPG', '', '', '', 20.00, 1, 1, 1),
(53, 1, 271, 24, '? LionTree ?', '? LionTree ?', 'forsale', 1191518940, 1191518940, 'Der Löwe unter dem Baum', 'Der Löwe unter dem Baum', 0, 'P6043081.jpg', '', '', '', 25.00, 1, 1, 1),
(54, 2, 270, 24, 'Drachenvogel - Dragonbird', 'Drachenvogel - Dragonbird', 'lost', 1191691740, 1191691740, 'Fineliner Artwork 2007', 'Fineliner Artwork 2007', 0, 'dragonbird.jpg', '', '', '', 0.00, 1, 0, 1),
(62, 1, 269, 25, 'Verschneiter Tisch', 'Verschneiter Tisch', 'empty', 1264187669, 1264187669, 'Winter in Schleswig Holstein', 'Winter in Schleswig Holstein', 2, '100_0222.jpg', '', '', '', 0.00, 1, 0, 1),
(63, 1, 268, 2, 'Jugendhof Brandenburg Collage', 'Jugendhof Brandenburg Collage', 'empty', 1156683720, 1156683720, 'Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.', 'Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.', 0, 'JHBR-Wallpaper.jpg', '', '1600x1200 Pixel', '1600x1200 Pixel', 0.00, 1, 0, 1),
(65, 1, 267, 2, 'Worst Enemy', 'Worst Enemy', 'empty', 1277655109, 1277655109, 'Wallpaper von 2010', 'Wallpaper von 2010', 0, 'Worst-enemy.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(71, 1, 266, 25, 'Die grosse Eiche', 'Die grosse Eiche', 'empty', 1308424701, 1308424701, 'Eine Eiche bei uns in BimÃ¶hlen im Sonnenuntergang', 'Eine Eiche bei uns in Bimöhlen im Sonnenuntergang', 2, 'baum_bimoehlen3.jpg', '', '', '', 0.00, 1, 0, 1),
(73, 1, 265, 24, 'Cool Livings', 'Cool Livings', 'givenaway', 1214322660, 1214322660, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'Cool-Livings.jpg', '', '', '', 20.00, 1, 0, 1),
(74, 1, 264, 24, 'Arthur Mac Donald', 'Arthur Mac Donald', 'forsale', 1222617300, 1222617300, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'arthus_mac-donald.jpg', '', '', '', 20.00, 1, 1, 1),
(75, 1, 263, 24, 'Evil Beast', 'Evil Beast', 'forsale', 1233853320, 1233853320, 'Fineliner Artwork von 2009', 'Fineliner Artwork von 2009', 0, 'evil_beast.jpg', '', '', '', 20.00, 1, 1, 1),
(76, 1, 262, 24, 'Cumulative FIst', 'Cumulative FIst', 'forsale', 1245859740, 1245859740, 'Cumulative Fist - Geballte Faust  <br />\nFineliner Artwork 2009', 'Cumulative Fist - Geballte Faust  <br />\nFineliner Artwork 2009', 0, 'cumulativ-fist.jpg', '', '', '', 20.00, 1, 1, 1),
(77, 1, 261, 24, 'Witch Chair', 'Witch Chair', 'forsale', 1253809260, 1253809260, 'Fineliner Artwork von 2009', 'Fineliner Artwork von 2009', 0, 'Nollie-Flip.jpg', '', '', '', 20.00, 1, 1, 1),
(78, 1, 260, 24, 'Fool Garden', 'Fool Garden', 'forsale', 1308932755, 1308932755, 'Fineliner Artwork von 2011', 'Fineliner Artwork von 2011', 0, 'fool-garden.jpg', '', '', '', 20.00, 1, 1, 1),
(80, 1, 259, 24, 'Simple Minds', 'Simple Minds', 'forsale', 1308933108, 1308933108, 'Fineliner Artwork von 2011', 'Fineliner Artwork von 2011', 0, 'Simple_Minds.jpg', '', '', '', 20.00, 1, 1, 1),
(81, 1, 258, 25, 'Elke Live', 'Elke Live', 'empty', 1315594558, 1315594558, 'Das ist Elke, die Katze meiner Schwester.', 'Das ist Elke, die Katze meiner Schwester.', 2, 'thecat.jpg', '', '', '', 0.00, 1, 0, 1),
(82, 1, 257, 25, 'Papageno Nana', 'Papageno Nana', 'empty', 1315665074, 1315665074, 'Kunstfigur aus Pappmachee', 'Kunstfigur aus Pappmachee', 2, 'papageno_nana.jpg', '', '', '', 0.00, 1, 0, 1),
(83, 1, 256, 2, 'Asarios Blog', 'Asarios Blog', 'empty', 1328898251, 1328898251, 'Wallpaper von 2012', 'Wallpaper von 2012', 0, 'ab_bg.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(84, 1, 255, 24, 'Hawk-Eye - Falkenauge', 'Hawk-Eye - Falkenauge', 'lost', 1290883020, 1290883020, 'Fineliner Artwork 2010', 'Fineliner Artwork 2010', 0, 'Hawk-Eye.jpg', '', '', '', 0.00, 1, 0, 1),
(85, 1, 254, 24, 'Find-Layer - Gefundene Ebene', 'Find-Layer - Gefundene Ebene', 'forsale', 1273081080, 1273081080, 'Fineliner Artwork von 2010', 'Fineliner Artwork von 2010', 0, 'Find-Layer.jpg', '', '', '', 20.00, 1, 1, 1),
(87, 1, 253, 24, 'Ginger Claw', 'Ginger Claw', 'unsaleable', 1330272158, 1692887694, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'ginger-claw.jpg', '', '', '', 0.00, 1, 0, 1),
(88, 1, 252, 25, 'Sonnenblume', 'Sonnenblume', 'empty', 1333313567, 1333313567, 'Ein Foto von 2012', 'Ein Foto von 2012', 2, 'Sunflowers.jpg', '', '', '', 0.00, 1, 0, 1),
(89, 0, 251, 1, 'Tri-Opterox I', 'Tri-Opterox I', 'forsale', 1340464748, 1340464748, '3 Leinwände ein Bild.  <br />\nMein erstes \"großes Werk\" in Acryl auf Leinwand', '3 Leinwände ein Bild.  <br />\nMein erstes \"großes Werk\" in Acryl auf Leinwand', 0, 'Tri-Opterox.jpg', '', '3x 80x20x3cm (BxHxT)', '3x 80x20x3cm (BxHxT)', 115.00, 1, 1, 1),
(90, 1, 250, 25, 'Pf&uuml;tze', 'Pf&uuml;tze', 'empty', 1340994423, 1340994423, 'Eine Pfütze vor unserem Haus', 'Eine Pfütze vor unserem Haus', 2, 'hecke.jpg', '', '', '', 0.00, 1, 0, 1),
(94, 1, 249, 25, 'Boot im Hasengraben', 'Boot im Hasengraben', 'empty', 1342112889, 1342112889, 'Ein einzelnes Boot im Potsdamer Hasengraben', 'Ein einzelnes Boot im Potsdamer Hasengraben', 2, 'Boot_im_Hasengraben.jpg', '', '', '', 0.00, 1, 0, 1),
(95, 2, 248, 24, 'Bearhunt - BÃ¤renjagd', 'Bearhunt - B&auml;renjagd', 'forsale', 1342719438, 1342719438, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'Bearhunt.jpg', '', '', '', 20.00, 1, 1, 1),
(96, 1, 247, 24, 'Wormholes', 'Wormholes', 'forsale', 1342719566, 1342719566, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'wormholes.jpg', '', '', '', 20.00, 1, 1, 1),
(97, 1, 246, 24, 'Sunny Valley', 'Sunny Valley', 'forsale', 1227135600, 1353420300, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'IMG_2223.jpg', '', '', '', 20.00, 1, 1, 1),
(98, 1, 245, 24, 'Hallo Kittie', 'Hallo Kittie', 'forsale', 1197986820, 1197986820, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'IMG_2224.jpg', '', '', '', 20.00, 1, 1, 1),
(99, 1, 244, 24, 'Snowie Time', 'Snowie Time', 'forsale', 1331388420, 1331388420, '', '', 0, 'IMG_2225.jpg', '', '', '', 20.00, 1, 1, 1),
(100, 1, 243, 24, 'Razorblade', 'Razorblade', 'forsale', 1335100020, 1335100020, '', '', 0, 'IMG_2226.jpg', '', '', '', 20.00, 1, 1, 1),
(101, 1, 242, 24, 'American Dream', 'American Dream', 'forsale', 1337520360, 1337520360, '', '', 0, 'IMG_2228.jpg', '', '', '', 20.00, 1, 1, 1),
(102, 1, 241, 24, 'Calculator Eye', 'Calculator Eye', 'unsaleable', 1339507680, 1339507680, '', '', 0, 'IMG_2227.jpg', '', '', '', 0.00, 1, 0, 1),
(103, 1, 240, 24, 'Rasputin Errors', 'Rasputin Errors', 'givenaway', 1353423420, 1353423420, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2254.jpg', '', '', '', 0.00, 1, 0, 1),
(104, 1, 239, 24, 'Red Stone', 'Red Stone', 'unsaleable', 1340115060, 1340115060, '', '', 0, 'IMG_2236.jpg', '', '', '', 0.00, 1, 0, 1),
(105, 1, 238, 24, 'Knowledge 2000', 'Knowledge 2000', 'forsale', 1356016980, 1356016980, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2242.jpg', '', '', '', 20.00, 1, 1, 1),
(106, 1, 237, 24, 'Supersonic', 'Supersonic', 'forsale', 1340893560, 1340893560, '', '', 0, 'IMG_2241.jpg', '', '', '', 20.00, 1, 1, 1),
(107, 1, 236, 24, 'Lucky Beggar', 'Lucky Beggar', 'forsale', 1199201220, 1199201220, '', '', 0, 'IMG_2247.jpg', '', '', '', 20.00, 1, 1, 1),
(108, 1, 235, 24, 'Long Time', 'Long Time', 'forsale', 1341153240, 1341153240, '', '', 0, 'IMG_2239.jpg', '', '', '', 20.00, 1, 1, 1),
(109, 1, 234, 12, 'Color Art', 'Color Art', 'unsaleable', 1342795058, 1342795058, '', '', 0, 'IMG_2251.jpg', '', '', '', 0.00, 1, 0, 1),
(110, 1, 233, 12, 'Grey Shadow', 'Grey Shadow', 'unsaleable', 1342795128, 1342795128, '', '', 0, 'IMG_2240.jpg', '', '', '', 0.00, 1, 0, 1),
(111, 1, 232, 24, 'Joker Face', 'Joker Face', 'forsale', 1204472400, 1204472400, '', '', 0, 'P2062665.jpg', '', '', '', 20.00, 1, 1, 1),
(112, 2, 231, 12, 'People of Joy', 'People of Joy', 'unsaleable', 978390000, 1342795423, '', '', 0, '100_1436.jpg', '', '', '', 0.00, 1, 0, 1),
(113, 1, 230, 24, 'Unfinished Mask', 'Unfinished Mask', 'unsaleable', 1342363440, 1342363440, '', '', 0, 'IMG_2261.jpg', '', '', '', 0.00, 1, 0, 1),
(121, 1, 223, 24, 'Cruel Fool', 'Cruel Fool', 'forsale', 1342800564, 1342800564, '', '', 0, 'IMG_2287.jpg', '', '', '', 20.00, 1, 1, 1),
(114, 1, 229, 12, 'Composed Train', 'Composed Train', 'unsaleable', 1342798582, 1342798582, '', '', 0, 'IMG_2256.jpg', '', '', '', 0.00, 1, 0, 1),
(115, 1, 228, 12, 'Ocean Drift', 'Ocean Drift', 'unsaleable', 1342798600, 1342798600, '', '', 0, 'IMG_2258.jpg', '', '', '', 0.00, 1, 0, 1),
(116, 1, 227, 12, 'Horizontal Skip', 'Horizontal Skip', 'unsaleable', 1342798619, 1342798619, '', '', 0, 'IMG_2260.jpg', '', '', '', 0.00, 1, 0, 1),
(117, 1, 226, 12, 'My personal Injury', 'My personal Injury', 'unsaleable', 1342798638, 1342798638, '', '', 0, 'IMG_2259.jpg', '', '', '', 0.00, 1, 0, 1),
(118, 1, 225, 12, 'Simple Knife', 'Simple Knife', 'unsaleable', 1342798833, 1342798833, '', '', 0, 'IMG_2285.jpg', '', '', '', 0.00, 1, 0, 1),
(119, 1, 224, 12, 'Corner Mark', 'Corner Mark', 'unsaleable', 1342798849, 1342798849, '', '', 0, 'IMG_2286.jpg', '', '', '', 0.00, 1, 0, 1),
(122, 1, 222, 24, 'Easy Listenimg', 'Easy Listenimg', 'forsale', 1345486020, 1345486020, '', '', 0, 'IMG_2248.jpg', '', '', '', 20.00, 1, 1, 1),
(123, 1, 221, 12, 'Sunglasses', 'Sunglasses', 'unsaleable', 1342807935, 1342807935, '', '', 0, 'IMG_2276.jpg', '', '', '', 0.00, 1, 0, 1),
(124, 1, 220, 25, 'Potsdam @ Night', 'Potsdam @ Night', 'empty', 1342814348, 1342814348, 'Ein Sonnenuntergang in Brandenburgs Hauptstadt', 'Ein Sonnenuntergang in Brandenburgs Hauptstadt', 2, 'Potsdam-at-Night.jpg', '', '', '', 0.00, 1, 0, 1),
(125, 0, 219, 1, 'Auriel Mark IV', 'Auriel Mark IV', 'unsaleable', 1346497423, 1346497423, '4 LeinwÃ¤nde 1 Bild, diesmal etwas Breiter.', '4 Leinwände 1 Bild, diesmal etwas Breiter.', 0, 'Auriel_Mark_IV.jpg', '', '', '', 0.00, 1, 0, 1),
(126, 1, 218, 25, 'Sky de Flugzeug', 'Sky de Flugzeug', 'empty', 1346512414, 1346512414, 'Der Himmel Ã¼ber uns', 'Der Himmel über uns', 2, '100_1054.jpg', '', '', '', 0.00, 1, 0, 1),
(127, 1, 217, 25, 'Car Shot', 'Car Shot', 'empty', 1346788034, 1346788034, 'Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling', 'Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling', 2, 'carshot2.jpg', '', '', '', 0.00, 1, 0, 1),
(128, 1, 216, 24, 'Nocturne', 'Nocturne', 'forsale', 1348238940, 1348238940, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2212.jpg', '', '', '', 20.00, 1, 1, 1),
(129, 1, 215, 24, 'Blue Horizon', 'Blue Horizon', 'forsale', 1348325801, 1348325801, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2213.jpg', '', '', '', 20.00, 1, 1, 1),
(130, 1, 214, 24, 'Stylish Bulldog', 'Stylish Bulldog', 'empty', 1285260000, 1285260000, '', '', 0, 'IMG_2255.jpg', '', '', '', 0.00, 1, 0, 1),
(131, 0, 213, 24, 'Black Jeans', 'Black Jeans', 'empty', 1285260120, 1285260120, '', '', 0, 'IMG_2257.jpg', '', '', '', 0.00, 1, 0, 1),
(132, 1, 212, 1, 'Green Valley', 'Green Valley', 'forsale', 1353614025, 1353614025, 'Leinwand und Acryl Zweifarbig', 'Leinwand und Acryl Zweifarbig', 0, 'Green_Valley.jpg', '', '60x60x3cm (BxHxT)', '60x60x3cm (BxHxT)', 80.00, 1, 1, 1),
(133, 1, 211, 2, 'Penguin Style', 'Penguin Style', 'empty', 1354475779, 1354475779, 'Wallpaper von 2012', 'Wallpaper von 2012', 0, 'penguin-style.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(134, 1, 210, 25, 'Elke 2k13', 'Elke 2k13', 'empty', 1357500081, 1357500081, 'Ein Foto von unserer Elke...', 'Ein Foto von unserer Elke...', 1, 'PC300151_01.jpg', '', '', '', 0.00, 1, 0, 1),
(135, 1, 209, 24, 'Colored Blur', 'Colored Blur', 'forsale', 1357500421, 1357500421, 'Fineliner Artwork von 2013', 'Fineliner Artwork von 2013', 0, 'colored-blur.jpg', '', '', '', 20.00, 1, 1, 1),
(136, 1, 208, 24, 'Dadelix', 'Dadelix', 'givenaway', 1262806080, 1262806080, 'Fineliner Artwork von 2010', 'Fineliner Artwork von 2010', 0, 'dadelix.jpg', '', '', '', 0.00, 1, 0, 1),
(137, 1, 207, 1, 'Yellow Bomb', 'Yellow Bomb', 'forsale', 1358710148, 1358710148, 'Zweifarbiges Werk aus Textilmalfarbe und Acryl', 'Zweifarbiges Werk aus Textilmalfarbe und Acryl', 0, 'Yellow_Bomb.jpg', '', '70x50x3cm (BxHxT)', '70x50x3cm (BxHxT)', 80.00, 1, 1, 1),
(138, 1, 206, 25, 'Herzkartoffel', 'Herzkartoffel', 'empty', 1359312207, 1359312207, 'Eine Herzliche Angelegenheit, so ein Weihnachtsfest.', 'Eine Herzliche Angelegenheit, so ein Weihnachtsfest.', 1, 'PC310250.JPG', '', '', '', 0.00, 1, 0, 1),
(139, 1, 205, 25, 'Elke Playin', 'Elke Playin', 'empty', 1359312356, 1359312356, 'Elke mit Spielzeug am Schmusen', 'Elke mit Spielzeug am Schmusen', 1, 'P290111.JPG', '', '', '', 0.00, 1, 0, 1),
(140, 1, 204, 25, 'Elke Sleeping', 'Elke Sleeping', 'empty', 1359312601, 1359312601, 'Auch die grÃ¶ÃŸte Katze braucht Ihren Schlaf.', 'Auch die größte Katze braucht Ihren Schlaf.', 1, 'P280054.JPG', '', '', '', 0.00, 1, 0, 1),
(141, 1, 203, 2, 'Little Fugo Desktop', 'Little Fugo Desktop', 'empty', 1359313075, 1359313075, 'Mein Lieblingsfugo als Wallpaper', 'Mein Lieblingsfugo als Wallpaper', 0, 'lf9.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(142, 1, 202, 12, 'Little Fugo', 'Little Fugo', 'givenaway', 1359313392, 1359313392, 'Ein Kugelfisch mal anders..', 'Ein Kugelfisch mal anders..', 0, 'Little_Fugo.jpg', '', '', '', 0.00, 1, 0, 1),
(143, 1, 201, 1, 'Fishtank', 'Fishtank', 'sold', 1361731596, 1361731596, 'Acryl & Edding auf Leinwand von 2013', 'Acryl & Edding auf Leinwand von 2013', 0, 'fishtank2.jpg', '', '3x 30x20x3cm (BxHxT)', '3x 30x20x3cm (BxHxT)', 52.96, 1, 0, 1),
(145, 1, 199, 1, 'Hedgehog Island', 'Hedgehog Island', 'forsale', 1371567481, 1371567481, 'Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.', 'Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.', 0, 'Hedgehog-Island.jpg', '', '50x70x3cm (BxHxT)', '50x70x3cm (BxHxT)', 80.00, 1, 1, 1),
(144, 2, 200, 9, 'Auriel Light Mark IV', 'Auriel Light Mark IV', 'unsaleable', 1369070650, 1369070650, '4 Leinw&auml;nde 1 Lichtobjekt.  \r\nVielen dank an Chris die mich immer wieder Inspiriert hat und die Idee zum Lichtobjekt hatte.', '4 canvases 1 light object.  \r\nMany thanks to Chris who inspired me again and again and had the idea for the light object.', 0, 'auriel_light_mark_iv_new.jpg', '', '34x90x30cm (BxHxT)', '34x90x30cm (BxHxT)', 149.95, 1, 0, 1),
(146, 1, 198, 25, 'Birthday Balloon', 'Birthday Balloon', 'empty', 1372015255, 1372015255, 'Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  <br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)', 'Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  <br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)', 1, 'birthday-baloon.jpg', '', '', '', 0.00, 1, 0, 1),
(147, 1, 197, 1, 'Rebellion Days', 'Rebellion Days', 'forsale', 1378058276, 1378058276, 'Acryl auf Leinwand, diesmal mit Ecken und Kanten.  <br />\nUnd zwar nur Ecken und Kanten', 'Acryl auf Leinwand, diesmal mit Ecken und Kanten.  <br />\nUnd zwar nur Ecken und Kanten', 0, 'rebellion_days_fin2.jpg', '', '30x90x3cm (BxHxT)', '30x90x3cm (BxHxT)', 80.00, 1, 1, 1),
(148, 1, 196, 25, 'Mein Lieblingswagen', 'Mein Lieblingswagen', 'empty', 1373822966, 1373822966, 'Ein Ford Focus der 1ten Generation.  <br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(', 'Ein Ford Focus der 1ten Generation.  <br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(', 2, 'ford_focus.jpg', '', '', '', 0.00, 1, 0, 1),
(149, 1, 195, 25, 'Fette Taube', 'Fette Taube', 'empty', 1373823466, 1373823466, 'An NeumÃ¼nsterer Bahnhof ist mir diese adipÃ¶se Taube begegnet.  <br />\nUnd da hab ich Sie einfach mal Fotografiert.', 'An Neumünsterer Bahnhof ist mir diese adipöse Taube begegnet.  <br />\nUnd da hab ich Sie einfach mal Fotografiert.', 1, 'fat_dove.jpg', '', '', '', 0.00, 1, 0, 1),
(150, 1, 194, 25, 'BigBaggy', 'BigBaggy', 'empty', 1373824000, 1373824000, 'Ein Baggy Pants Rock getragen von meiner Schwester.', 'Ein Baggy Pants Rock getragen von meiner Schwester.', 1, 'bigbaggy.jpg', '', '', '', 0.00, 1, 0, 1),
(151, 1, 193, 25, 'Elke unsharp', 'Elke unsharp', 'empty', 1373824276, 1373824276, 'Unsere Elke im Garten', 'Unsere Elke im Garten', 1, 'elke-unsharp.jpg', '', '', '', 0.00, 1, 0, 1),
(152, 1, 192, 25, 'Newspaper', 'Newspaper', 'empty', 1373824357, 1373824357, 'Eine Zeitung aus einem etwas anderem Blickwinkel.', 'Eine Zeitung aus einem etwas anderem Blickwinkel.', 1, 'newspaper.jpg', '', '', '', 0.00, 1, 0, 1),
(153, 1, 191, 25, 'Elke MÃ¼de', 'Elke MÃ¼de', 'empty', 1388945843, 1388945843, 'Man ist schlafen Anstrengend...', 'Man ist schlafen Anstrengend...', 1, 'elke_sleepy.jpg', '', '', '', 0.00, 1, 0, 1),
(154, 1, 190, 25, 'Bibliothek am Heiligen See', 'Bibliothek am Heiligen See', 'empty', 1388945992, 1388945992, 'Die Alte Bibliothek am Nachmittag', 'Die Alte Bibliothek am Nachmittag', 1, 'park.jpg', '', '', '', 0.00, 1, 0, 1),
(155, 1, 189, 25, 'Elke Greeneye', 'Elke Greeneye', 'empty', 1388946100, 1388946100, 'Elke unsere Elke mit Blick ins Objektiv.  <br />\nMan ist das ein GrÃ¼n...', 'Elke unsere Elke mit Blick ins Objektiv.  <br />\nMan ist das ein Grün...', 1, 'elke_greeneye.jpg', '', '', '', 0.00, 1, 0, 1),
(156, 0, 188, 25, 'Impressionen aus dem Bugapark', 'Impressionen aus dem Bugapark', 'empty', 1388946196, 1388946196, 'Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation', 'Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation', 1, 'buga_park.jpg', '', '', '', 0.00, 1, 0, 1),
(157, 1, 187, 1, 'Batman Bowling Birds', 'Batman Bowling Birds', 'lost', 1388946385, 1388946385, 'Ein Bild auf Leinwand in Schwarz / WeiÃ', 'Ein Bild auf Leinwand in Schwarz / WeiÃ', 0, 'batman_bowling_birds.jpg', '', '60x30x3cm (BxHxT)', '60x30x3cm (BxHxT)', 80.00, 1, 1, 1),
(158, 1, 186, 9, 'Orange Light 01', 'Orange Light 01', 'givenaway', 1392058458, 1392058458, 'Meine 2te Lampe.  <br />\nDiesmal mit Orangenem Hintergrund.', 'Meine 2te Lampe.  <br />\nDiesmal mit Orangenem Hintergrund.', 0, 'orange_glows_glowing2.jpg', '', '44x50x40cm (BxHxT)', '44x50x40cm (BxHxT)', 98.25, 1, 0, 1),
(159, 1, 185, 9, 'Groggy 3 Times', 'Groggy 3 Times', 'forsale', 1392058608, 1392058608, 'Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.', 'Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.', 0, 'groggy_3times_fin.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(160, 1, 184, 25, 'Gr&uuml;ne Idylle', 'Gr&uuml;ne Idylle', 'empty', 1398620032, 1398620032, 'Regen kann so schön sein.', 'Regen kann so schön sein.', 1, 'wet_leaf.png', '', '', '', 0.00, 1, 0, 1),
(161, 1, 183, 25, 'Eastereggs 2014', 'Eastereggs 2014', 'empty', 1398620118, 1398620118, 'Herzlichste OstergrÃ¼ÃŸe aus dem sonnigem Potsdam.', 'Herzlichste Ostergrüße aus dem sonnigem Potsdam.', 1, 'easter_eggs.jpg', '', '', '', 0.00, 1, 0, 1),
(162, 1, 182, 9, 'Giraffe Flower', 'Giraffe Flower', 'forsale', 1399565071, 1399565071, 'Eine Grüne Lampe mit schwarzem Blumenornamenten', 'Eine Grüne Lampe mit schwarzem Blumenornamenten', 0, 'giraffe-flower.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(163, 1, 181, 25, 'Klee in wei&szlig;', 'Klee in wei&szlig;', 'empty', 1402508071, 1402508071, 'Eine Blume halb verwelkt', 'Eine Blume halb verwelkt', 1, 'fadet_flower.jpg', '', '', '', 0.00, 1, 0, 1),
(164, 1, 180, 25, 'Stechpalme', 'Stechpalme', 'empty', 1402508288, 1402508288, 'Eine durchaus imposante Pflanze', 'Eine durchaus imposante Pflanze', 1, 'agarve.jpg', '', '', '', 0.00, 1, 0, 1),
(165, 1, 179, 25, 'Dinosaurier Auge', 'Dinosaurier Auge', 'empty', 1402508436, 1402508436, 'Dieses Holzstück erinnert mich an einen Dinosaurier', 'Dieses Holzstück erinnert mich an einen Dinosaurier', 1, 'dinosaur_eye.jpg', '', '', '', 0.00, 1, 0, 1),
(166, 1, 178, 25, 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'empty', 1402508839, 1402508839, 'Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.', 'Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.', 1, 'network.jpg', '', '', '', 0.00, 1, 0, 1),
(167, 1, 177, 25, 'Klee bei uns im Garten', 'Klee bei uns im Garten', 'empty', 1402590457, 1402590457, 'Gelber Klee', 'Gelber Klee', 1, 'unknown02.jpg', '', '', '', 0.00, 1, 0, 1),
(168, 1, 172, 14, 'Q', 'Q', 'empty', 1402592198, 1402592198, 'das Q', 'the Q', 1, 'Q.JPG', '', '', '', 0.00, 1, 0, 1),
(169, 1, 98, 14, 'C', 'C', 'empty', 1402592268, 1402592268, 'das C', 'the C', 1, 'C.JPG', '', '', '', 0.00, 1, 0, 1),
(170, 1, 96, 14, 'A', 'A', 'empty', 1402592329, 1402592329, 'das A', 'the A', 1, 'A_2.jpg', '', '', '', 0.00, 1, 0, 1),
(171, 1, 177, 14, 'Y', 'Y', 'empty', 1402665599, 1402665589, 'Das Y', 'the Y', 1, 'Y.jpg', '', '', '', 0.00, 1, 0, 1),
(172, 1, 150, 14, 'H', 'H', 'empty', 1402666864, 1402666864, 'Das H', 'the H', 1, 'H.JPG', '', '', '', 0.00, 1, 0, 1),
(183, 1, 175, 14, 'W', 'W', 'empty', 1402671709, 1402671709, 'Das W', 'the W', 1, 'W_clear.JPG', '', '', '', 0.00, 1, 0, 1),
(174, 1, 171, 15, 'Monstar 01', 'Monstar 01', 'empty', 1402667472, 1402667472, 'Das erste der Monstarz Serie', 'Das erste der Monstarz Serie', 1, 'Monster_wall_ashtray.jpg', '', '', '', 0.00, 1, 0, 1),
(175, 1, 170, 15, 'Monstar 02', 'Monstar 02', 'empty', 1402667587, 1402667587, '', '', 1, 'bush.jpg', '', '', '', 0.00, 1, 0, 1),
(177, 1, 169, 15, 'Monstar 03', 'Monstar 03', 'empty', 1402667718, 1402667718, '', '', 1, 'table.jpg', '', '', '', 0.00, 1, 0, 1),
(178, 1, 170, 14, 'M', 'M', 'empty', 1402668308, 1402668308, 'Das M', 'the M', 1, 'M.JPG', '', '', '', 0.00, 1, 0, 1),
(179, 1, 167, 25, 'Am Wegesrand', 'Am Wegesrand', 'empty', 1402669238, 1402669238, 'Kleine Details als Makroaufnahme', 'Kleine Details als Makroaufnahme', 1, 'garbage.jpg', '', '', '', 0.00, 1, 0, 1),
(182, 0, 166, 14, 'J', 'J', 'empty', 1402670110, 1402670110, 'Das J', 'the J', 1, 'J.jpg', '', '', '', 0.00, 1, 0, 1),
(184, 1, 97, 14, 'B', 'B', 'empty', 1402675949, 1402675949, 'Das B wie Buddha', 'B for Buddha', 1, 'B3.jpg', '', '', '', 0.00, 1, 0, 1),
(185, 1, 163, 15, 'Monstar 04', 'Monstar 04', 'empty', 1402753720, 1402753720, '', '', 1, 'P6141594.JPG', '', '', '', 0.00, 1, 0, 1),
(186, 1, 162, 15, 'Monstar 05', 'Monstar 05', 'empty', 1402753762, 1402753762, 'Monstar auf der Bank', 'Monstar auf der Bank', 1, 'P6141597.JPG', '', '', '', 0.00, 1, 0, 1),
(187, 1, 161, 25, 'Am Wegesrand 2', 'Am Wegesrand 2', 'empty', 1402841110, 1402841110, 'Nettes Detail der Pflanze', 'Nettes Detail der Pflanze', 1, 'wegesrand2.JPG', '', '', '', 0.00, 1, 0, 1),
(188, 1, 160, 25, 'Hairy Plant', 'Hairy Plant', 'empty', 1402843181, 1402843181, 'Spitzwegerich', 'Spitzwegerich', 1, 'Hairy_Plant.JPG', '', '', '', 0.00, 1, 0, 1),
(189, 1, 159, 25, 'Rinde', 'Rinde', 'empty', 1402848178, 1402848178, 'Eine Baumrinde von nah', 'Eine Baumrinde von nah', 1, 'bark.JPG', '', '', '', 0.00, 1, 0, 1),
(190, 1, 158, 1, 'Lionel Wall', 'Lionel Wall', 'forsale', 1405777542, 1405777542, 'A tribute to argentinia.', 'A tribute to argentinia.', 0, 'lionel_wall.jpg', '', '70x70x3 cm (BxHxT)', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(191, 1, 157, 9, 'Link Teabag', 'Link Teabag', 'forsale', 1408731988, 1408731988, 'Lila &plus; Pink = Link  <br />\nNoch ohne Beleuchtung aber gut.', 'Lila &plus; Pink = Link  <br />\nNoch ohne Beleuchtung aber gut.', 0, 'link_teabag.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(193, 1, 155, 15, 'Monstar 06', 'Monstar 06', 'empty', 1408815441, 1408815441, 'Diesmal Monstar auf Arbeit', 'Diesmal Monstar auf Arbeit', 1, 'monstar06.jpg', '', '', '', 0.00, 1, 0, 1),
(192, 1, 156, 25, 'Kn&ouml;terich Knospe', 'Kn&ouml;terich Knospe', 'empty', 1410720647, 1410720647, 'An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert', 'An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert', 1, 'knoeterich.JPG', '', '', '', 0.00, 1, 0, 1),
(194, 1, 154, 15, 'Monstar 07', 'Monstar 07', 'empty', 1411307901, 1411307901, 'Monstar im Badschrank', 'Monstar im Badschrank', 1, 'monster_bath.jpg', '', '', '', 0.00, 1, 0, 1),
(195, 1, 153, 25, 'Die M&ouml;we', 'Die M&ouml;we', 'empty', 1411910839, 1411910839, 'Eine Prachtvolle Silbermöwe auf einem Strandkorb.', 'Eine Prachtvolle Silbermöwe auf einem Strandkorb.', 1, 'Moewe.JPG', '', '', '', 0.00, 1, 0, 1),
(196, 1, 152, 2, 'Q3Face', 'Q3Face', 'empty', 1413574910, 1413574910, 'Nach etwas kramen fand ich dieses Bild...', 'Nach etwas kramen fand ich dieses Bild...', 0, 'q3face.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(197, 1, 151, 1, 'Double Crunch Peanut', 'Double Crunch Peanut', 'forsale', 1413577218, 1413577218, 'Das Bild mit der Erdnuss.... ;)', 'Das Bild mit der Erdnuss.... ;)', 0, 'double_crunch_peanut.jpg', '', '70x70x3 cm (BxHxT)', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(198, 1, 150, 15, 'Monstar Lennon Wall', 'Monstar Lennon Wall', 'empty', 1414605204, 1414605204, 'Monstar vor der \"John Lennon\" Wall in Hongkong.', 'Monstar vor der \"John Lennon\" Wall in Hongkong.', 4, 'IMG_5639.jpeg', '', '', '', 0.00, 1, 0, 1),
(199, 1, 149, 15, 'Monstar in the Tram', 'Monstar in the Tram', 'empty', 1414605264, 1414605264, 'Monstar vor der Skyline Hong-Kongs', 'Monstar vor der Skyline Hong-Kongs', 4, 'IMG_5635.jpeg', '', '', '', 0.00, 1, 0, 1),
(200, 1, 148, 24, 'Pteranodon', 'Pteranodon', 'givenaway', 1414608180, 1414608180, 'Ein Ur-Saurier als Grafik', 'Ein Ur-Saurier als Grafik', 0, 'Pteranodon.jpg', '', '', '', 0.00, 1, 0, 1),
(202, 1, 176, 14, 'X', 'X', 'empty', 1414693159, 1414693159, 'Schilf am Strand', 'reeds on the beach', 8, 'X.jpg', '', '', '', 0.00, 1, 0, 1),
(203, 1, 146, 15, 'Freeclimbing Monstar', 'Freeclimbing Monstar', 'empty', 1416325411, 1416325411, 'Ein Monster am Fenster', 'Ein Monster am Fenster', 5, 'SAM_1378.JPG', '', '', '', 0.00, 1, 0, 1),
(204, 1, 145, 15, 'Monstar on Rails', 'Monstar on Rails', 'empty', 1416325500, 1416325500, 'Ein Monstar im Park', 'Ein Monstar im Park', 5, 'SAM_1380.JPG', '', '', '', 0.00, 1, 0, 1),
(205, 1, 144, 15, 'Monstar Tabledance', 'Monstar Tabledance', 'empty', 1416325553, 1416325553, 'Ein Monstar auf dem Tisch.', 'Ein Monstar auf dem Tisch.', 5, 'SAM_1387.JPG', '', '', '', 0.00, 1, 0, 1),
(206, 1, 143, 15, 'Monstar Temple', 'Monstar Temple', 'empty', 1416325743, 1416325743, 'Monstar im Freilufttempel', 'Monstar im Freilufttempel', 5, 'SAM_1397.JPG', '', '', '', 0.00, 1, 0, 1),
(207, 1, 142, 15, 'Monstar Child', 'Monstar Child', 'empty', 1416325793, 1416325793, 'Ein Kind mit meinem Monstar', 'Ein Kind mit meinem Monstar', 5, 'SAM_1394.JPG', '', '', '', 0.00, 1, 0, 1),
(209, 1, 174, 14, 'T', 'T', 'empty', 1421605380, 1421605380, 'Das T als Schatten', 'The T as a shadow', 1, 'T.jpg', '', '', '', 0.00, 1, 0, 1),
(210, 1, 168, 14, 'L', 'L', 'empty', 1421605708, 1421605708, 'Das L', 'the L', 5, '107c1428a98c4d8148746a6c7ca75f61.jpg', '', '', '', 0.00, 1, 0, 1),
(211, 1, 171, 14, 'O', 'O', 'empty', 1422726510, 1422726510, 'Das O', 'the O', 1, 'o.jpg', '', '', '', 0.00, 1, 0, 1),
(212, 1, 138, 25, 'Sundown in Bim&ouml;hlen', 'Sundown in Bim&ouml;hlen', 'empty', 1425055816, 1425055816, 'Ein Sonnenuntergang bei uns im Dorf', 'Ein Sonnenuntergang bei uns im Dorf', 1, 'P2272172.JPG', '', '', '', 0.00, 1, 0, 1),
(213, 1, 137, 24, 'HorsePower', 'HorsePower', 'givenaway', 1425219186, 1425219186, 'Ein Pferdekopf (war nicht als solches gewollt)  <br />\nIst aber trotzdem Nett', 'Ein Pferdekopf (war nicht als solches gewollt)  <br />\nIst aber trotzdem Nett', 0, 'HorsePower.jpg', '', '', '', 0.00, 1, 0, 1),
(270, 0, 94, 25, 'Raindrop', 'Raindrop', 'empty', 1466090206, 1466090206, 'Taufrisch aus Rickling', 'Taufrisch aus Rickling', 1, 'raindrop.jpg', '', '', '', 0.00, 1, 0, 1),
(214, 1, 136, 9, 'Four Seasons', 'Four Seasons', 'forsale', 1426193204, 1426193204, 'Lichtobjekt aus 4 Leinwänden.  <br />\nJede Leinwand steht für eine Jahreszeit.  <br />\nFehlt nur noch das Licht... ;)', 'Lichtobjekt aus 4 Leinwänden.  <br />\nJede Leinwand steht für eine Jahreszeit.  <br />\nFehlt nur noch das Licht... ;)', 0, 'four_seasons.jpg', '', '30x34x90cm', '30x34x90cm', 220.00, 1, 1, 1),
(215, 1, 135, 24, 'Cockroach', 'Cockroach', 'givenaway', 1426237021, 1426237021, 'Die Kakerlake ... ;)', 'Die Kakerlake ... ;)', 0, 'cockroach.jpg', '', '', '', 20.00, 1, 0, 1),
(216, 1, 134, 24, 'Killer Instinct', 'Killer Instinct', 'forsale', 1426237137, 1426237137, 'Fineliner Artwork von 2015', 'Fineliner Artwork von 2015', 0, 'killer_instinct.jpg', '', '', '', 20.00, 1, 1, 1),
(217, 1, 133, 24, 'Elbic Dream', 'Elbic Dream', 'forsale', 1426237317, 1426237317, 'kein Kommentar ;)', 'kein Kommentar ;)', 0, 'elbic-dream.jpg', '', '', '', 20.00, 1, 1, 1),
(218, 1, 132, 25, 'Osterglocken', 'Osterglocken', 'empty', 1426939066, 1426939066, 'Ein gelbes Osterglöckchen', 'Ein gelbes Osterglöckchen', 1, 'yellow_flowers.jpg', '', '', '', 0.00, 1, 0, 1),
(219, 1, 131, 1, 'Schimmelreiter 2015', 'Schimmelreiter 2015', 'sold', 1427990280, 1427990280, 'Ein Bild mit vielen Namen...  <br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015', 'Ein Bild mit vielen Namen...  <br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015', 0, 'schimmelreiter2015.jpg', '', '50x60x3cm', '50x60x3cm', 80.00, 1, 0, 1),
(220, 1, 130, 25, 'Ostern 2015', 'Ostern 2015', 'empty', 1428328260, 1428328260, 'Ein kleiner Ostergruß von der Ostsee ;)', 'Ein kleiner Ostergruß von der Ostsee ;)', 1, 'easter_2015.jpg', '', '', '', 0.00, 1, 0, 1),
(221, 1, 129, 25, 'B&uuml;sumer Leuchtturm', 'B&uuml;sumer Leuchtturm', 'empty', 1428326778, 1428326778, 'Der Leuchtturm in Büsum an der windigen Nordsee', 'Der Leuchtturm in Büsum an der windigen Nordsee', 1, 'northsea.jpg', '', '', '', 0.00, 1, 0, 1),
(222, 1, 128, 25, 'Der Spatz im Hansapark', 'Der Spatz im Hansapark', 'empty', 1431012252, 1431012252, 'ganz schön zutraulig der Kleine.', 'ganz schön Zutraulig der kleine.', 1, 'sparrow.JPG', '', '', '', 0.00, 1, 0, 1),
(223, 1, 127, 25, 'Dandelion', 'Dandelion', 'empty', 1432050791, 1432050791, 'Ein verblühter Löwenzahn im Neuen Garten in Potsdam.', 'Ein verblühter Löwenzahn im Neuen Garten in Potsdam.', 1, 'dandelion.JPG', '', '', '', 0.00, 1, 0, 1),
(224, 1, 126, 24, 'Mystic Dragon', 'Mystic Dragon', 'forsale', 1434731544, 1434731544, 'Eins meiner neusten Werke.', 'Eins meiner neusten Werke.', 0, 'Mystic-Dragon.jpg', '', 'A4', 'A4', 25.00, 1, 1, 1),
(225, 1, 125, 24, 'Kitchen Aid', 'Kitchen Aid', 'forsale', 1434731670, 1434731670, 'Die Tolle Knolle. ;)', 'Die Tolle Knolle. ;)', 0, 'kitchen-aid.jpg', '', '', '', 20.00, 1, 1, 1),
(226, 1, 124, 24, 'Club Rotation', 'Club Rotation', 'forsale', 1436075813, 1436075813, 'A fineliner Artwork from 2015', 'A fineliner Artwork from 2015', 0, 'club-rotation.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(227, 1, 167, 14, 'K', 'K', 'empty', 1436075971, 1436075971, 'Das Gurken-K', 'The cucumber-K', 1, 'K.jpg', '', '', '', 0.00, 1, 0, 1),
(229, 1, 121, 24, 'Friends Letter', 'Friends Letter', 'forsale', 1437226294, 1437226294, 'Das Alphabet im Bild versteckt... ;)', 'Das Alphabet im Bild versteckt... ;)', 0, 'friends_letter.jpg', '', '', '', 20.00, 1, 1, 1),
(228, 1, 122, 24, 'Mr. Crab', 'Mr. Crab', 'forsale', 1436707048, 1436707048, 'Eine kleine Krabbe', 'Eine kleine Krabbe', 0, 'mr_crabs.jpg', '', '', '', 17.00, 1, 1, 1),
(230, 1, 120, 9, 'Buttercup', 'Buttercup', 'sold', 1438625547, 1438625547, 'Eine neue Lampe mit weißen Linien.........  <br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  <br />\nAlso es fehlt noch das Entscheidende Licht.', 'Eine neue Lampe mit weißen Linien.........  <br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  <br />\nAlso es fehlt noch das Entscheidende Licht.', 0, 'buttercup5.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 150.00, 1, 0, 1),
(231, 1, 119, 25, 'Orange Green MIX', 'Orange Green MIX', 'empty', 1438707002, 1438707002, 'Eine Blüte von größter Güte im Botanischen Garten in Kiel', 'Eine Blüte von größter Güte im Botanischen Garten in Kiel', 1, 'orange-cloud.jpg', '', '', '', 0.00, 1, 0, 1),
(232, 1, 118, 2, 'Crazy in love', 'Crazy in love', 'empty', 1442672097, 1442672097, 'Wallpaper von 2015', 'Wallpaper von 2015', 0, 'crazy-in-love4.jpg', '', '1920x1080 Pixel', '1920x1080 Pixel', 0.00, 1, 0, 1),
(243, 1, 117, 24, 'Pontius Pilatus', 'Pontius Pilatus', 'empty', 1444241923, 1444241923, 'Fineliner Pic von 2015', 'Fineliner Pic von 2015', 0, 'pontius-pilatus.jpg', '', '', '', 0.00, 1, 0, 1),
(244, 1, 116, 2, 'Red Obsession', 'Red Obsession', 'empty', 1448871172, 1448871172, 'Ein neueres Wallpaper von 2015', 'Ein neueres Wallpaper von 2015', 0, 'red19.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(245, 1, 115, 18, 'ZIA 01', 'ZIA 01', 'forsale', 1450036533, 1450036533, 'Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  <br />\nIndex: Crescent Moon, Static, Tipple, Florz', 'Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  <br />\nIndex: Crescent Moon, Static, Tipple, Florz', 0, 'ZIA-01.jpg', '', 'A4', 'A4', 15.00, 1, 1, 1),
(246, 1, 114, 25, 'Sunrise in Bim&ouml;hlen', 'Sunrise in Bim&ouml;hlen', 'empty', 1450688651, 1450688651, 'Ein Sonnenaufgang im Dezember bei uns in Bimöhlen', 'Ein Sonnenaufgang im Dezember bei uns in Bimöhlen', 1, 'sonnenaufgang.jpg', '', '', '', 0.00, 1, 0, 1),
(247, 2, 113, 18, 'ZIA 02', 'ZIA 02', 'forsale', 1452192718, 1452192718, 'Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  <br />\nIndex: Poke Root, Hollibaugh, Msst, Zander', 'Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  <br />\nIndex: Poke Root, Hollibaugh, Msst, Zander', 0, 'ZIA-02.jpg', '', '', '', 15.00, 1, 1, 1),
(248, 1, 112, 18, 'ZIA 03', 'ZIA 03', 'forsale', 1452192761, 1452192761, 'Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  <br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox', 'Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  <br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox', 0, 'ZIA-03_2.jpg', '', '', '', 15.00, 1, 1, 1),
(249, 1, 111, 21, 'Crusty King', 'Crusty King', 'forsale', 1452863539, 1452863539, 'Filzstift auf einer Runden Leinwand-Pappe', 'Filzstift auf einer Runden Leinwand-Pappe', 0, 'Crusty-King-2.jpg', '', '', '', 22.00, 1, 1, 1),
(250, 1, 110, 18, 'ZIA 04', 'ZIA 04', 'forsale', 1453403531, 1453403531, 'Mein 4tes Zentangle Inspired Art Bild  <br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas', 'Mein 4tes Zentangle Inspired Art Bild  <br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas', 0, 'ZIA-04.jpg', '', '', '', 15.00, 1, 1, 1),
(251, 1, 109, 18, 'ZIA 05', 'ZIA 05', 'forsale', 1454687577, 1454687577, 'Zentangle Inspired Postcard 01  <br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,', 'Zentangle Inspired Postcard 01  <br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,', 0, 'ZIA-05.jpg', '', '10x15cm', '10x15cm', 15.00, 1, 1, 1),
(252, 1, 108, 18, 'ZIA 06', 'ZIA 06', 'forsale', 1454687630, 1454687630, 'Zentangle Inspired Postcard 02  <br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,', 'Zentangle Inspired Postcard 02  <br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,', 0, 'ZIA-06.jpg', '', '10x15cm', '10x15cm', 15.00, 1, 1, 1),
(253, 1, 107, 18, 'ZIA 07', 'ZIA 07', 'forsale', 1455888058, 1455888058, 'Printed Zentangle im Paspartout.  <br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling', 'Printed Zentangle im Paspartout.  <br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling', 0, 'ZIA-07.jpg', '', 'A5', 'A5', 15.00, 1, 1, 1),
(254, 1, 106, 18, 'ZIA 08', 'ZIA 08', 'forsale', 1456509930, 1456509930, 'Zentangle Inspired Postcard No.3.  <br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon', 'Zentangle Inspired Postcard No.3.  <br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon', 0, 'ZIA-08.jpg', '', '', '', 15.00, 1, 1, 1),
(255, 1, 105, 18, 'ZIA 09', 'ZIA 09', 'forsale', 1456510004, 1456510004, 'Zentangle Inspired Postcard No. 4.  <br />\nIndex: Hollibaugh, Fracas \"Reverse\", W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz', 'Zentangle Inspired Postcard No. 4.  <br />\nIndex: Hollibaugh, Fracas \"Reverse\", W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz', 0, 'ZIA-09.jpg', '', '', '', 15.00, 1, 1, 1),
(256, 1, 104, 21, 'RIP MUM', 'RIP MUM', 'empty', 1458402396, 1458402396, 'Rest in Peace Mum', 'Rest in Peace Mum', 0, 'RIP_MUM.jpg', '', 'A3', 'A3', 0.00, 1, 0, 1),
(257, 1, 103, 21, 'Guilty Conscience', 'Guilty Conscience', 'forsale', 1458402472, 1458402472, 'Der Drachen der Drachen der Drachen der Drachen', 'Der Drachen der Drachen der Drachen der Drachen', 0, 'Guilty-Conscience.jpg', '', 'A3', 'A3', 22.00, 1, 1, 1),
(258, 1, 102, 24, 'Butterfly Prison', 'Butterfly Prison', 'empty', 1458409564, 1458409564, 'Ein Schmetterling im GefÃ¤ngnis in PostkartengrÃ¶ÃŸe', 'Ein Schmetterling im Gefängnis in Postkartengröße', 0, 'prison-butterfly.jpg', '', 'A6', 'A6', 0.00, 1, 0, 1),
(259, 1, 101, 24, 'Sitting Bull', 'Sitting Bull', 'empty', 1459437576, 1459437576, 'Eine Postkarte im Indian Asario Style :)', 'Eine Postkarte im Indian Asario Style :)', 0, 'sitting_bull.jpg', '', 'A6', 'A6', 0.00, 1, 0, 1),
(261, 1, 100, 2, 'asario.de', 'asario.de', 'empty', 1463078097, 1463078097, 'Das Wallpaper zur Domain www.asario.de', 'Das Wallpaper zur Domain www.asario.de', 0, 'ab_bluf.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(262, 1, 99, 1, 'Wandering Star', 'Wandering Star', 'givenaway', 1463155693, 1463155693, 'Der wandernde Stern in 3D', 'Der wandernde Stern in 3D', 0, 'wandering-star.jpg', '', '12x12cm', '12x12cm', 0.00, 1, 0, 1),
(265, 0, 169, 14, 'L', 'L', 'empty', 1463306557, 1463306557, 'Das L', 'the L', 1, 'L.jpg', '', '', '', 0.00, 1, 0, 1),
(266, 1, 97, 25, 'BeachBall', 'BeachBall', 'empty', 1465199404, 1465199404, 'Ein Strandbild', 'Ein Strandbild', 1, 'beach_feeling.jpg', '', '', '', 0.00, 1, 0, 1),
(267, 1, 96, 2, 'Sunshine Feelings', 'Sunshine Feelings', 'empty', 1465199502, 1465199502, 'Eine Collage von 2016', 'Eine Collage von 2016', 0, 'sunshine.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(268, 1, 95, 25, 'Dune Wonder', 'Dune Wonder', 'empty', 1465203250, 1465203250, 'Eine Düne an der Ostsee.', 'Eine Düne an der Ostsee.', 1, 'dune.jpg', '', '', '', 0.00, 1, 0, 1),
(271, 1, 93, 9, 'Blue Cage', 'Blue Cage', 'forsale', 1466777579, 1466777579, 'Mal wieder eine Lampe Ohne Licht (noch)', 'Mal wieder eine Lampe Ohne Licht (noch)', 0, 'Blue-Cage.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 150.00, 1, 1, 1),
(272, 1, 92, 22, 'Mighty Crab', 'Mighty Crab', 'forsale', 1468761406, 1468761406, 'Dieses Motiv ist aus dem Buch \"Zen Colouring Ocean\".  <br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.', 'Dieses Motiv ist aus dem Buch \"Zen Colouring Ocean\".  <br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.', 0, 'Mighty-Crab.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(273, 1, 91, 22, 'Fishy Fishy', 'Fishy Fishy', 'forsale', 1471543985, 1471543985, 'Ein Großer Fisch im Netz ;)  <br />\nAus dem Buch \"Zen Colouring Ocean\".', 'Ein Großer Fisch im Netz ;)  <br />\nAus dem Buch \"Zen Colouring Ocean\".', 0, 'fishy-fishy.jpg', '', '', '', 20.00, 1, 1, 1),
(274, 0, 90, 25, 'Sunrise on Angelteich ;)', 'Sunrise on Angelteich ;)', 'empty', 1472307094, 1472307094, 'Stimmiges Bild vom Angelteich in Wittenborn', 'Stimmiges Bild vom Angelteich in Wittenborn', 1, 'Sonenaufgang-am-See.jpg', '', '', '', 0.00, 1, 0, 1),
(275, 1, 89, 24, 'Useless Bag', 'Useless Bag', 'givenaway', 1476290809, 1476290809, 'Ein älteres Bild was ich vor kurzem erst gefunden habe.  <br />\nLag ganz unten in der Kiste ;)', 'Ein Älteres Bild was ich vor kurzem erst gefunden habe.  <br />\nLag ganz unten in der Kiste ;)', 0, 'useless-bag.jpg', '', '', '', 0.00, 1, 0, 1),
(276, 1, 88, 22, 'Circle Ornament', 'Circle Ornament', 'forsale', 1476457436, 1476457436, 'Ein Motiv aus dem Buch \"Hypnose und Trance\" ausgemalt mit Stabilos.  <br />\r\nDie Kunst ist das man nicht Verrückt wird dabei,', 'Ein Motiv aus dem Buch \"Hypnose und Trance\" ausgemalt mit Stabilos.  <br />\r\nDie Kunst ist das man nicht Verrückt wird dabei,', 6, 'ornament.jpg', '', '', '', 30.00, 1, 1, 1),
(277, 1, 87, 22, 'Jellyfish', 'Jellyfish', 'forsale', 1486666841, 1486666841, 'Aus dem Buch \"Hypnose & Trance\"', 'Aus dem Buch \"Hypnose & Trance\"', 0, 'jelly_fish.jpg', '', '', '', 20.00, 1, 1, 1),
(278, 1, 86, 1, 'Buttermilk Diver', 'Buttermilk Diver', 'forsale', 1487261241, 1487261241, 'Schwarzes Acryl auf weißer Leinwand.', 'Schwarzes Acryl auf weißer Leinwand.', 0, 'buttermilk-diver.jpg', '', '', '', 80.00, 1, 1, 1),
(279, 1, 85, 21, 'Hells Kitchen', 'Hells Kitchen', 'forsale', 1488484898, 1488484898, 'Der Teufel in uns ;).', 'Der Teufel in uns ;).', 0, 'devils_kitchen.jpg', '', 'A3', 'A3', 22.00, 1, 1, 1),
(280, 1, 84, 25, 'Vom Fernsehturm in Berlin - Gastbild', 'From television tower in Berlin - Guestimage', 'empty', 1495556271, 1495556271, 'Dieses nette Bild hat meine Schwester geschossen.  <br />\nEin Panorama vom Berliner Fernsehturm am Alex.', 'This nice shot was made by my Sister.  <br />\nA panorama from Television Tower at the Alex in Berlin.', 6, 'DSCF5931[1].jpg', '', '', '', 0.00, 1, 0, 1),
(281, 2, 83, 23, 'Mederius Aschenbecher[0]', 'Mederius Ashtray[0]', 'empty', 1495981790, 1692888560, 'Hier ein erster Entwurf des Mederius Aschenbechers.  \r\nJetzt endlich in glasierter Form.  \r\nIst erst der erste Grobentwurf', 'The first draft of the Mederius Ashtray.  \r\nNow it\\\'s glazed and fired.  \r\nIt\\\'s just a concept of proof.', 7, 'mederius_ashtray[0].jpg', '', '', '', 15.00, 1, 0, 1),
(283, 1, 82, 22, 'Womenizer', 'Womenizer', 'empty', 1499584164, 1692886897, 'Frauen an die Macht ;)  \r\nAus dem Buch \\\"Hypnose & Trance\\\"', 'Womenpower ;)  \r\nOut of the Book \\\"Hypnose & Trance\\\"', 0, 'womenizer.jpg', '', '17,5x17,5cm', '17,5x17,5cm', 0.00, 1, 0, 1),
(284, 1, 81, 15, 'Monster in Neu Seeland', 'Monstar in New Zealand', 'empty', 1505645646, 1505645646, 'Mein Monster im Süden', 'My Monstar in the South', 6, 'monstar_newzealand.JPG', '', '', '', 0.00, 1, 0, 1),
(285, 0, 80, 23, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', 1507474862, 1507474862, 'Ungebrannt und Unglasiert', 'Unglazed & Unfired', 0, 'ashtray[1].jpg', '', '', '', 0.00, 1, 0, 1),
(286, 1, 79, 23, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', 1508850619, 1692888409, 'Jetzt Aber...', 'Here we go...', 7, 'mederius_ashtray[1]_3.jpg', '', '', '', 25.00, 1, 1, 1),
(287, 1, 78, 15, 'Strand-Monstar', 'Beach-Monstar', 'empty', 1516637602, 1516637602, 'Monstar am Strand.', 'Monstar at the beach.', 6, 'beach-monstar.jpg', '', '', '', 0.00, 1, 0, 1),
(288, 1, 77, 15, 'Stein-Monstar', 'Stone-Monstar', 'empty', 1516637714, 1516637714, 'Monstar auf einem Felsen.', 'Monstar on the rocks', 6, 'stone-monstar.jpg', '', '', '', 0.00, 1, 0, 1),
(289, 1, 76, 15, 'Baxter &plus; Monstar', 'Baxter &plus; Monstar', 'empty', 1516637851, 1516637851, 'Baxter spielend mit dem Monstar', 'Baxter playing with monstar', 6, 'dog-star.jpg', '', '', '', 0.00, 1, 0, 1),
(290, 1, 75, 25, 'Ianosaurus & Masha - Gastbild', 'Ianosaurus & Masha - Guestimage', 'empty', 1516644415, 1516644415, 'Ianosaurus mit Masha', 'Ianosaurus with Masha', 6, 'DSCF7990[1].jpg', '', '', '', 0.00, 1, 0, 1),
(291, 1, 74, 25, 'Masha ist zur&uuml;ck', 'Masha is Back', 'empty', 1522677772, 1522677772, 'Mascha im Park.', 'Masha in the park.', 7, 'P1000148.JPG', '', '', '', 0.00, 1, 0, 1),
(292, 1, 73, 25, 'Balafon aus Afrika', 'Balafon from Africa', 'empty', 1522679859, 1522679859, 'Ein traditionelles afrikanisches Instrument', 'A traditional African Instrument', 7, 'P1000098.JPG', '', '', '', 0.00, 1, 0, 1),
(293, 1, 72, 25, 'Masha in the Face', 'Masha in the Face', 'empty', 1522680379, 1522680379, 'Masha in nah', 'Masha zoomed in', 7, 'P1000161.JPG', '', '', '', 0.00, 1, 0, 1);
INSERT INTO `images` (`id`, `pub`, `position`, `images_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `chg_date`, `message`, `message_en`, `camera_id`, `image_path`, `link`, `Format`, `Format_en`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(294, 1, 71, 2, 'Mixed Mash', 'Mixed Mash', 'empty', 1523785721, 1523785721, 'Eine Collage am Hamburger ZOB', 'A collage from ZOB in Hamburg', 0, 'mixed-mash.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(295, 1, 70, 1, 'Window Shopper', 'Window Shopper', 'forsale', 1524154537, 1524154537, 'Ein Acryl Kunstwerk', 'A Acrylic Artwork', 0, 'window-shopper.jpg', '', '50x50cm', '50x50cm', 80.00, 1, 1, 1),
(297, 1, 69, 1, 'Blue Marswallow', 'Blue Marswallow', 'givenaway', 1530357177, 1530357177, 'Das Geschenk zur Hochzeit meiner Schwester', 'The Wedding Gift for my Sister.', 0, 'blue-marswallow.jpg', '', '70x50cm', '70x50cm', 0.00, 1, 0, 1),
(298, 1, 68, 25, 'Wetterhahn', 'Weathercock', 'empty', 1533847116, 1533847116, 'Ein Wetterhahn im Abendhimmel', 'A Weathercock in evening sky', 7, 'sundown_cock.jpg', '', '', '', 0.00, 1, 0, 1),
(299, 1, 67, 25, 'Libelle am Fenster', 'Dragonfly on window', 'empty', 1533847358, 1533847358, 'Hier eine verirrte Libelle in unserem Feriendomizil', 'A dragonfly in our holiday home', 7, 'dragonfly.jpg', '', '', '', 0.00, 1, 0, 1),
(300, 1, 66, 15, 'Baxter am spielen mit dem Monstar', 'Baxter playing with the Monstar', 'empty', 1534065638, 1534065638, 'Baxter auf einem Felsen spielend mit dem Monstar.', 'Baxter is playing with the monstar on the beach at New Zealand.', 9, 'baxter_playing.JPG', '', '', '', 0.00, 1, 0, 1),
(302, 1, 65, 22, 'Italia', 'Italia', 'forsale', 1535209071, 1535209071, 'Aus dem Buch \"Dream Journey - Ausmalreise um die Welt\".', 'Out of the book \"Dream Journey - Ausmalreise um die Welt\".', 6, 'italia4.jpg', '', '20x20cm (BxH)', '20x20cm (WxH)', 30.00, 1, 1, 1),
(303, 1, 64, 15, 'Nitro   Monstar', 'Nitro   Monstar', 'empty', 1536935164, 1536935164, 'Nitro mit Monstar im Dänemark Urlaub', 'Nitro and Monstar on a trip through Denmark.', 10, 'Monstar-Nitro.jpg', '', '', '', 0.00, 1, 0, 1),
(304, 1, 63, 15, 'W&uuml;sten Operation', 'Desert Operations', 'empty', 1536935729, 1536935729, 'Nein, nicht in der Wüste, sondern am Strand', 'No, not in desert, but on the beach.', 10, 'Monstar-Sandwirbel.jpg', '', '', '', 0.00, 1, 0, 1),
(305, 1, 62, 15, 'Monstar Schild', 'Monstar Traffic Sign', 'empty', 1536947559, 1536947559, 'Mein Monstar an nem Schild', 'My Monstar on a traffic sign', 10, 'Monstar-Schild.jpg', '', '', '', 0.00, 1, 0, 1),
(306, 1, 61, 15, 'Rettungsring', 'Lifebelt', 'empty', 1536947792, 1536947792, 'Rettungsring Monstar', 'Lifebelt Monstar', 10, 'Monstar-Rettungsring.jpg', '', '', '', 0.00, 1, 0, 1),
(307, 1, 60, 22, 'Waldschrat', 'Wood Gnome', 'sold', 1540633852, 1540633852, 'Ein Ausmalbild mit Acrylfarbe ausgemalt mit Lederbandaufhängung.  <br />\r\nVielen Dank an Sigi für die Hilfe & Geduld mit mir.  <br />\r\nAus dem Buch Mythomorphia von Kerby Rosanes.', 'A colored pic colored with acrylic Colors on leather straps.  <br />\r\nLot of thanks to Sigi, who helped me with a lot of things.  <br />\r\nOut of the book Mythomorphia from Kerby Rosanes.', 6, 'waldschrat_12.jpg', '', '29x29 cm', '29x29cm', 0.00, 1, 0, 1),
(308, 1, 59, 25, 'Wintersegeberg', 'Wintersegeberg', 'empty', 1548432384, 1548432384, 'Ein Bild aus dem verschneitem Bad Segeberg', 'An image from the snowily Bad Segeberg', 7, 'P1010666.JPG', '', '', '', 0.00, 1, 0, 1),
(309, 1, 58, 1, 'Anubis', 'Anubis', 'forsale', 1549556220, 1549556220, 'Eine Bild des &auml;gyptischen Gottes Anubis. Er ist in detaillierter, traditioneller R&uuml;stung mit farbenfrohen Mustern dargestellt.\r\n\r\nVielen Dank an Siggi.', 'An image of the Egyptian god Anubis. He is depicted in detailed, traditional armor with colourful patterns.\r\n\r\nMany thanks to Siggi.', 0, 'Anubis24.jpg', '', '60x60cm', '60x60cm', 280.00, 1, 0, 1),
(310, 1, 57, 25, 'Wasserball', 'Waterpolo', 'empty', 1552725880, 1552725880, 'Bild vom Wasserballspiel zwischen OSC Potsdam und SSV Esslingen.  <br />\nIch war live dabei als Potsdam Esslingen mit 18:7 besiegte.', 'Image of the Waterpolo game betwen OSC Potsdam & SSV Esslingen.  <br />\nI was live there when Potsdam beated Esslingen with 18:7.', 7, 'h2opolo.jpg', '', '', '', 0.00, 1, 0, 1),
(311, 1, 56, 2, 'Little Alfred', 'Little Alfred', 'empty', 1554564146, 1554564146, 'Mein erstes Wallpaper 2019.  <br />\nIm Hintergrund Klein Alfred  <br />\nJetzt in WQHD Auflösung', 'My first Wallpaper in 2019.  <br />\nIn the Background little Alfred.  <br />\nNow in WQHD Resolution', 0, 'little-alfred.jpg', '', '2560x1440 Pixel', '2560x1440 Pixel', 0.00, 1, 0, 1),
(312, 1, 55, 1, 'Bastet', 'Bastet', 'inwork', 1564829730, 1564829730, 'Eine Weitere Ägyptische Göttin hat sich in die Acryl Galerie geschlichen.  <br />\nDie ersten Vorarbeiten sind gemacht, ist aber noch im Pre-Alpha Modus.', 'Another Goddess has arrived the Acrylic Gallery.  <br />\nIt\'s just a Pre-Alpha Version of Bastet.', 0, 'bastet15.jpg', '', '50x90 cm', '50x90 cm', 380.00, 1, 0, 1),
(313, 1, 54, 1, 'Das Rangi Schweini', 'The Rangi Pig', 'givenaway', 1567435136, 1567435136, 'Anlässlich der Geburt meines Neffen Alfred, habe ich dieses Schweini Bild gemalt.  <br />\nThx to Fenja.', 'To celebrate the birth of my nephew i made this picture.  <br />\nThx to Fenja.', 0, 'schweini-finished.jpg', '', '29x20 cm', '29x20 cm', 0.00, 1, 0, 1),
(314, 1, 53, 2, 'Anubis Wallpaper', 'Anubis Wallpaper', 'empty', 1567860535, 1567860535, 'Eine kleine Collage mit Anubis', 'A small collage with Anubis', 0, 'anubus_wallpaper_png.png', '', '2560x1440 Pixel', '2560x1440 Pixel', 0.00, 1, 0, 1),
(315, 1, 52, 24, 'GRTZ FR NZ', 'GRTZ FR NZ', 'empty', 1580425200, 1580425200, 'Eine Postkarte die um die Welt ging....', 'A Postcard all over the world...', 0, 'GRTZ-NZ.jpg', '', '', '', 0.00, 1, 0, 1),
(316, 1, 51, 1, 'Rangi Goat', 'Rangi Goat', 'givenaway', 1578610800, 1578610800, 'Eine Ziege zu Alfies Geburtstag am 11.5.', 'A goat to Alfies Birthday at 11.5.', 0, 'goat04.jpg', '', '', '', 0.00, 1, 0, 1),
(317, 1, 50, 1, 'Tigah', 'Tigah', 'givenaway', 1581843240, 1581843240, 'Ein Tiger, wie man unscheinbar erkennen kann', 'A Tiger, as you can see', 7, 'tigah05.jpg', '', '', '', 80.00, 1, 1, 1),
(318, 1, 49, 24, 'Red Tiger', 'Red Tiger', 'empty', 1597578758, 1597578758, 'Ein neues Fineliner Artwork von 2020', 'A new fineliner artwork from 2020', 0, 'red-tiger.jpg', '', '', '', 0.00, 1, 0, 1),
(319, 1, 48, 24, 'Crop Drop', 'Crop Drop', 'empty', 1597578758, 1597578758, 'Mein neuestes Fineliner-Bild überhaupt', 'My newest fineliner pic at all', 0, 'crop-drop.jpg', '', '', '', 0.00, 1, 0, 1),
(321, 2, 46, 24, 'Bumble Bee', 'Bumble Bee', 'forsale', 1633790713, 1633790713, '', '', 11, 'Bumble-Bee.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(322, 2, 45, 24, 'Dialogue-II', 'Dialogue-II', 'empty', 1633791612, 1633791612, '', '', 11, 'Dialoge-II.jpg', '', '', '', 0.00, 1, 0, 1),
(323, 1, 44, 24, 'Ill-Easy', 'Ill-Easy', 'forsale', 1633791849, 1633791849, '', '', 11, 'Ill-Easy.jpg', '', '', '', 20.00, 1, 1, 1),
(324, 1, 43, 24, 'Lost World', 'Lost World', 'empty', 1633792076, 1633792076, '', '', 11, 'lost-world.jpg', '', '', '', 20.00, 1, 1, 1),
(325, 1, 42, 24, 'Notorious Small', 'Notorious Small', 'empty', 1633792349, 1633792349, '', '', 11, 'Notorius-Small.jpg', '', '', '', 0.00, 1, 0, 1),
(326, 1, 41, 24, 'Operated Bullseye', 'Operated Bullseye', 'empty', 1633792563, 1633792563, '', '', 11, 'Operated-Bullseye.jpg', '', '', '', 0.00, 1, 0, 1),
(327, 1, 40, 24, 'Selfaction', 'Selfaction', 'forsale', 1633792764, 1633792764, '', '', 11, 'Selfactions.jpg', '', '', '', 20.00, 1, 1, 1),
(328, 1, 39, 24, 'Trio Del', 'Trio Del', 'givenaway', 1633793056, 1633793056, '', '', 11, 'trio-del.jpg', '', '', '', 0.00, 1, 0, 1),
(329, 1, 38, 1, 'El Novum', 'EL Novum', 'sold', 1640422582, 1659105444, 'Neun schmale, vertikale Leinw&auml;nde mit Mustern in Orange, Rot und Schwarz. Die abstrakten, tribalartigen Muster bestehen aus geometrischen Formen, die sich &uuml;ber die einzelnen Leinw&auml;nde hinweg fortsetzen.', 'Nine narrow, vertical canvases with patterns in orange, red and black. The abstract, tribal-like patterns consist of geometric shapes that continue across the individual canvases.', 7, 'El_Novum_Finiished.jpg', '', '9x 80cm x 20cm', '9x 80cm x 20cm', 525.25, 1, 1, 1),
(333, 1, 35, 21, 'Alfies Traktor', 'Alfies Tractor', 'givenaway', 1647422345, 1692887867, 'P&uuml;nktlich zu Weihnachten habe ich meinem Neffen ein Geschenk gemacht.  \r\nDa er voll auf Tr&auml;cker steht habe ich dieses Bild auf Leinwand verewigt.  \r\n  \r\nEs ist mit Filzern gemalt.', 'Just in time for Christmas, I made a present for my nephew.  \r\nSince he is really loving Tractors, I immortalised this picture on canvas.  \r\n  \r\nIt is painted with felt-tip-pens.', 11, 'tractor_cut.jpg', '', '', '', 0.00, 1, 0, 1),
(330, 1, 37, 24, 'Cloud Founder', 'Cloud Founder', 'empty', 1640503258, 1640503258, 'Ein Geschenk an meine Lieblingscousine.', 'A gift to my favorite cousin.', 11, 'cloud-founder.jpg', '', '', '', 0.00, 1, 0, 1),
(335, 2, 34, 24, 'Jena Tower', 'Jena Tower', 'givenaway', 1648475469, 1648475469, 'Ein A4 Artwork in Grün.', 'An A4 artwork in green.', 11, 'jena tower.png', '', 'A4', 'A4', 0.00, 1, 0, 1),
(336, 2, 33, 24, 'Spring Break', 'Spring Break', 'empty', 1651758600, 1651758600, 'Frühjahr 2022 Artwork', 'Spring 2022 Artwork', 7, 'spring-break.jpg', '', 'A4', 'A4', 22.00, 1, 1, 1),
(337, 2, 32, 26, 'Dragonbird 3D', 'Dragonbird 3D', 'unsaleable', 1655570166, 1667572762, 'Mein erstes gedrucktes Relief mit meinem Renkforce Pro3.  <br />\nDer 3D-Drucker meines Vertrauens ermöglichte mir dieses Kunstwerk zu erschaffen.', 'My first printed relief with my Renkforce Pro3.  <br />\nThe 3D printer I trust enabled me to create this work of art.', 7, 'dragonbird 3D.jpg', '', '', '', 0.00, 1, 0, 1),
(338, 1, 31, 24, 'Lost Nature', 'Lost Nature', 'empty', 1661076279, 1661529942, 'Ein Geburtstagsgeschenk für Ianosaurus', 'The birthday present for Ianosaurus', 7, 'lost nature.jpg', '', '', '', 0.00, 1, 0, 1),
(339, 1, 30, 23, 'Goldfish 3DP', 'Goldfish 3DP', 'empty', 1665144288, 1672312012, 'Ein Tonkunstwerk mit 3D Drucker Hilfe gestanzt.', 'A piece of clay art punched with 3D printer help.', 0, 'goldfish-3DP.jpg', '', '15x15cm', '15x15cm', 12.00, 1, 1, 1),
(346, 1, 25, 26, 'Webmasters Delight 3D', 'Webmasters Delight 3D', 'empty', 1671367510, 1672327569, 'Ein weiteres PLA Objekt', 'Another PLA Object', 7, 'P1000159.JPG', '', '', '', 0.00, 1, 0, 1),
(347, 1, 24, 26, 'Caustic Treble 3D', 'Caustic Treble 3D', 'empty', 1673451964, 1673451790, 'Das Design ist echt cool, wie ein modernes Kunstwerk aus dem 3D-Drucker. Die Linien und Formen sind richtig spannend, fast futuristisch. In WeiÃŸ wirkt das Ganze total clean und einzigartig - ein echter Hingucker!', 'The design is really cool, like a modern work of art from a 3D printer. The lines and shapes are really exciting, almost futuristic. In white, the whole thing looks totally clean and unique - a real eye-catcher!', 7, 'caustic-treble 3D.jpg', '', '', '', 0.00, 1, 0, 1),
(341, 1, 29, 23, 'Gullivers Adventures 3DP', 'Gullivers Adventures 3DP', 'empty', 1667571553, 1667571482, 'Gullivers Abenteuer in Ton gepresst (Form aus dem 3D-Drucker)', 'Gulliver\\\'s Adventures pressed in clay (mould from the 3D printer)', 0, 'Gullivers-3DP_2.jpg', '', '', '', 25.00, 1, 1, 1),
(342, 1, 28, 26, 'Supersonic 3D', 'Supersonic 3D', 'empty', 1667572017, 1667571557, 'Ein Relief vom Bild Supersonic.  <br />\n1.58h hat es gedauert bis es fertig wurde mit Drucken.', 'A relief of the painting Supersonic.  <br />\nIt took 1.58h to finish printing.', 0, 'Supersonic 3D.jpg', '', '', '', 25.00, 1, 1, 1),
(343, 1, 27, 26, 'Gullivers Adventures 3D', 'Gullivers Adventures 3D', 'empty', 1667572158, 1668784195, 'Das Relief von Gullivers Adventures in weißem PLA gedruckt.', 'The relief of Gulliver\'s Adventures printed in white PLA.', 7, 'Gulliverse-Adventure-3D.jpg', '', '', '', 25.00, 1, 1, 1),
(344, 1, 26, 26, 'Goldfish 3D', 'Goldfish 3D', 'empty', 1667572289, 1667572162, 'Ein weiters Relief von dem Bild Goldfish.', 'Another relief from the picture Goldfish.', 7, 'goldfish-3D.jpg', '', '', '', 0.00, 1, 0, 1),
(348, 0, 23, 26, 'St. Pauli Print 3D', 'St. Pauli Print 3D', 'empty', 1673452187, 1693225354, 'Das Logo vom FC St. Pauli.', 'The FC St. Pauli logo.', 7, 'st-pauli.jpg', '', '', '', 0.00, 1, 0, 1),
(349, 2, 22, 24, 'Caustic Treble', 'Caustic Treble', 'empty', 1673452956, 1673452867, 'Ein kleines feines Fineliner Bild', 'A fine little fineliner picture', 7, 'caustic-treble.jpg', '', '', '', 0.00, 1, 0, 1),
(350, 0, 21, 23, 'HSV Raute', 'HSV Rhombus', 'empty', 1675091445, 0, 'Eine Kachel im HSV Design.', 'A tile with the HSV design.', 7, 'HSV.jpg', '', '', '', 0.00, 1, 0, 1),
(353, 0, 19, 23, 'Werder Bremen 3DP', 'Werder Bremen 3DP', 'empty', 1676819298, 1692886788, 'Ein Werder Bremen Logo aus Ton', 'A Werder Bremen logo made of clay', 7, 'Werder-Bremen-3DP.jpg', '', '', '', 0.00, 1, 0, 1),
(352, 0, 20, 26, 'Werder Bremen 3D', 'Werder Bremen 3D', 'empty', 1676559483, 0, 'Ein Werder Logo', 'A Werder Logo', 7, 'werder_bremen_new_3.jpg', '', '', '', 0.00, 1, 0, 1),
(354, 0, 18, 23, 'St. Pauli Ashtray 3DP', 'St. Pauli Ashtray 3DP', 'sold', 1676819437, 1692884760, 'Ein St. Pauli Aschenbecher.', 'A St. Pauli ashtray.', 7, 'st_pauli_glased.jpg', '', '', '', 18.00, 1, 1, 1),
(355, 1, 17, 24, 'Holy Ground', 'Holy Ground', 'empty', 1678723243, 0, 'Ein Fineliner Artwork von 2023', 'A Fineliner Artwork from 2023', 7, 'Holy Ground02.jpg', '', '', '', 0.00, 1, 0, 1),
(356, 1, 16, 24, 'Fine Pix', 'Fine Pix', 'lost', 1684508567, 1692884225, 'Leider wurde mir dieses Bild gestohlen. Wer sachdienliche Hinweise hat bitte bei [paul.rieser[at]marblefx.de](mailto:paul.rieser@marblefx.de) melden.', 'Unfortunately, this picture was stolen from me. If you have any relevant information, please contact [paul.rieser[at]marblefx.de](mailto:paul.rieser@marblefx.de).', 7, 'fine_pix.jpg', '', 'A5', 'A5', 20.00, 1, 1, 1),
(357, 0, 15, 23, 'HSV Ascher', 'HSV Ashtrey', 'sold', 1684515831, 1692884138, 'F&uuml;r meinen Fahrer der mich morgens schon seit 9 Jahren nach Segeberg f&auml;hrt.', 'For my driver who has been driving me to Segeberg in the morning for 9 years.', 7, 'HSV-Ashtray.jpg', '', '', '', 25.00, 1, 1, 1),
(358, 1, 14, 24, 'Kirbys Dream', 'Kirbys Dream', 'forsale', 1688651007, 1693747812, 'A4 Blatt vollgekritzelt', 'A4 sheet fully scribbled', 7, 'kirbys_dream_fin.jpg', '', 'A4', 'A4', 100.00, 1, 1, 1),
(359, 1, 13, 21, 'Winter Blues', 'Winter Blues', 'forsale', 1702895175, 0, 'Mal was mit Filzstift & Fineliner.', 'Something with felt-tip pen & fineliner.', 7, 'winter-blues.jpg', '', '', '', 58.00, 1, 1, 1),
(362, 0, 11, 23, 'Hertha BSC Ashtray 3DP', 'Hertha BSC Ashtray 3DP', 'givenaway', 1704120819, 0, 'F&uuml;r meinen Stiefbruder', 'For my Stepbrother', 7, 'hbsc.jpg', '', '', '', 0.00, 1, 0, 1),
(361, 0, 12, 23, 'Carl Zeiss Jena Ashtray 3DP', 'Carl Zeiss Jena Ashtray 3DP', 'givenaway', 1704120694, 0, 'F&uuml;r meinen Stiefvater', 'For my Stepfather', 7, 'czj.jpg', '', '', '', 0.00, 1, 0, 1),
(363, 0, 10, 1, 'Wonder Spring', 'Wonder Spring', 'forsale', 1707064172, 0, 'Eine abstraktes Kunstwerk in verschiedenen Grüntönen mit schwarzen, organischen Mustern.', 'An abstract work of art in various shades of green with black, organic patterns.', 7, 'wonder-spring.jpg', '', '60x60 cm', '60x60 cm', 180.00, 1, 1, 1),
(364, 0, 9, 23, 'Die Drei Ashtray 3DP', 'Die Drei Ashtray 3DP', 'empty', 1708162459, 0, 'Ein Die Drei Fragezeichen Ascher', 'A The Three Question Marks ashtray', 7, 'diedrei.jpg', '', '12x12cm', '12x12cm', 50.00, 1, 1, 1),
(365, 1, 8, 1, 'Gepard', 'Cheetah', 'givenaway', 1715936114, 0, 'Ein Gepardenkopf mit goldbraunem Fell und ausdrucksstarken blauen Augen. Der Hintergrund ist oben grün wie Vegetation, unten beige wie die Savanne. \n\nEs ist ein Geschenk für meinen Neffen.', 'A cheetah head with golden-brown fur and expressive blue eyes. The background is green like vegetation at the top and beige like the savannah at the bottom.\r\n\r\nIt is a gift for my nephew.', 11, 'gepard_cut.jpg', '', '', '', 0.00, 1, 0, 1),
(366, 1, 7, 12, 'Alfie No. 5', 'Alfie No. 5', 'givenaway', 1716654107, 0, 'Bleistiftzeichnung von meinem Neffen an seinem 5. Geburtstag', 'Pencil drawing of my nephew on his 5th birthday', 7, 'Alfie-No-5.jpg', '', 'A4', 'A4', 0.00, 1, 0, 1),
(367, 0, 6, 24, 'Cucumber Shot', 'Cucumber Shot', 'empty', 1049407200, 0, 'Fineliner artwork auf karierten Papier', 'Fineliner Artwork on checked paper.', 7, 'cucumber_shot.jpg', '', '', '', 0.00, 1, 0, 1),
(368, 1, 5, 24, 'Liked Hiker', 'Liked Hiker', 'empty', 1199228400, 0, 'Fineliner Artwork von 2008', 'Fineliner artwork from 2008', 7, 'liked-hiker.jpg', '', '', '', 20.00, 1, 1, 1),
(369, 1, 4, 24, 'Crazy Frog', 'Crazy Frog', 'empty', 1351375200, 0, 'Fineliner Artwork von 10/12', 'Fineliner artwork from 10/12', 7, 'crazy-frog.jpg', '', '', '', 18.00, 1, 1, 1),
(370, 2, 3, 24, 'Eval Eye', 'Eval Eye', 'forsale', 1349647200, 0, 'Fineliner image from 10/12', 'Fineliner Image from 10/12', 7, 'Eval-Eye.jpg', '', '', '', 20.00, 1, 1, 1),
(371, 1, 2, 24, 'Rattlesnake', 'Rattlesnake', 'forsale', 1348005600, 0, 'Die Klapperschlange', 'The rattlesnake', 7, 'Rattlesnake.jpg', '', '', '', 20.00, 1, 1, 1),
(372, 1, 1, 24, 'Family Affair', 'Family Affair', 'empty', 1338156000, 0, '2012er Fineliner Artwork', '2012 fineliner artwork', 7, 'Family-Affair.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(373, 1, 0, 24, 'Lotus Flower', 'Lotus Flower', 'forsale', 1339970400, 0, 'Fineliner Artwork von 06/12', 'Fineliner artwork from 06/12', 7, 'Lotus-Flower.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(374, 1, 0, 24, 'The Bridge', 'The Bridge', 'forsale', 1335823200, 0, 'Fineliner Artwork von 05/12', 'Fineliner artwork from 05/12', 7, 'the-bridge.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(375, 1, 0, 24, 'Lisas House', 'Lisas House', 'forsale', 1334008800, 0, 'Fineliner Artwork von 04/12', 'Fineliner artwork from 04/12', 7, 'lisas-house.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(376, 1, 0, 24, 'Knock Knock', 'Knock Knock', 'forsale', 1711580400, 0, '', '', 7, 'knock-knock.jpg', '', 'A4', 'A4', 18.00, 1, 1, 1),
(377, 1, 0, 24, 'Palm Wood', 'Palm Wood', 'forsale', 1716919960, 0, '', '', 7, 'palm-wood.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(378, 1, 0, 24, 'Lens Share', 'Lens Share', 'forsale', 1589839200, 0, '', '', 7, 'lens-share.jpg', '', 'A4', 'A4', 21.00, 1, 1, 1),
(379, 1, 0, 24, 'Robin Hood', 'Robin Hood', 'forsale', 1599256800, 0, '', '', 7, 'robin-hood.jpg', '', 'A4', 'A4', 19.00, 1, 1, 1),
(380, 1, 0, 24, 'Cool Misa', 'Cool Misa', 'sold', 1717509383, 0, 'Ein Fineliner Tryptichon', 'Ein Fineliner Tryptichon', 4, 'cool-misa.jpg', '', '3x A4', '3x A4', 50.00, 1, 0, 1),
(381, 1, 0, 25, 'Schwamm', 'Sponge', 'empty', 1718444979, 0, 'Ein Schwamm als Makroaufnahme', 'A sponge as a macro image', 7, 'P1000396.JPG', '', '', '', 0.00, 1, 0, 1),
(382, 1, 0, 25, 'Klavier', 'Piano', 'empty', 1718445224, 0, 'Rollen eines Fl&uuml;gels', 'Rolling of a sash', 7, 'P1000442.JPG', '', '', '', 0.00, 1, 0, 1),
(383, 1, 0, 23, 'Alfies Bowl', 'Alfies Bowl', 'givenaway', 1719316366, 0, 'Ein Geschenk an meinen Neffen', 'A present for my nephew', 10, 'alfies-bowl.jpg', '', '', '', 0.00, 1, 0, 1),
(384, 1, 0, 23, 'Fine Pix 3DP', 'Fine Pix 3DP', 'forsale', 1721139340, 0, 'Fine Pix in Ton', 'Fine Pix in clay', 7, 'fine-pix-3DP.jpg', '', '', '', 20.00, 1, 1, 1),
(385, 1, 0, 23, 'Caustic Treble 3DP', 'Caustic Treble 3DP', 'forsale', 1721139427, 0, 'Caustic Treble in Ton', 'Caustic Treble in clay', 7, 'caustic-treble-3DP.jpg', '', '', '', 20.00, 1, 1, 1),
(386, 1, 0, 23, 'Salamander Vogeltränke', 'Salamander bird bath', 'givenaway', 1729780586, 0, 'Mit Glas als Premiere in meinen getöpferten Objekten', 'With glass as a premiere in my pottery objects', 11, 'salamander2.jpg', '', '', '', 0.00, 1, 0, 1),
(418, 1, 0, 2, 'Cewl Cow 2k', 'Cewl Cow 2k', 'empty', 1730632153, 0, 'Habe mal wieder was wiedergefunden und hier veröffentlicht', 'I found something again and published it here.', 12, '90a266c4a58cfb26513209acfa7fbbb0.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(414, 1, 0, 26, 'Dragonbird', 'Dragonbird', 'forsale', 1664810656, 0, 'Mein erstes Relief mit dem 3D Drucker', 'My first relief with the 3D printer', 7, 'ac5a23c8ccda1cbe7bceb0c87e7dd7cf.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(420, 1, 0, 26, 'Dadelix 3D', 'Dadelix 3D', 'empty', 1732977011, 0, 'Dadelix in 3D', 'Dadelix in 3D', 7, 'b563d0d7465da227f6c16888e73617fd.png', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(427, 1, 0, 1, 'Tartan Flex 4K', 'Tartan Flex 4K', 'forsale', 1733307386, 0, 'Ein Tetraptychon, das aus zusammenhängenden Leinwänden besteht, die gemeinsam eine größere Komposition bilden. Die vier Teile sind thematisch und stilistisch miteinander verbunden und ergeben ein cooles Gesamtwerk.', 'A tetraptych consisting of connected canvases that together form a larger composition. The four parts are thematically and stylistically linked and result in a cool overall work.', 6, 'ddacc961cf655ee549bb3eb8af457fa6.jpg', NULL, NULL, NULL, NULL, 0, NULL, NULL),
(428, 1, 0, 1, 'Mixed Smasher', 'Mixed Smasher', 'forsale', 1734165438, 0, 'Mit Pouring Technik erstellt.', 'Created with pouring technique', 12, '6520a3194aaca3927409825d6b0d95b0.jpg', NULL, NULL, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images_categories`
--

DROP TABLE IF EXISTS `images_categories`;
CREATE TABLE `images_categories` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` bigint(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `name_en` varchar(50) NOT NULL,
  `shortname` varchar(20) DEFAULT NULL,
  `heading_alt` varchar(255) NOT NULL,
  `heading_alt_en` varchar(255) NOT NULL,
  `img_icon` varchar(80) DEFAULT NULL,
  `AscName` varchar(50) DEFAULT NULL,
  `AscName_en` varchar(50) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `description_en` mediumtext NOT NULL,
  `itemscope` enum('','Painting','Photograph','Sculpture') DEFAULT NULL,
  `date` bigint(11) NOT NULL,
  `chg_date` bigint(11) NOT NULL,
  `xis_shopable` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `images_categories`
--

INSERT INTO `images_categories` (`id`, `pub`, `position`, `name`, `name_en`, `shortname`, `heading_alt`, `heading_alt_en`, `img_icon`, `AscName`, `AscName_en`, `description`, `description_en`, `itemscope`, `date`, `chg_date`, `xis_shopable`) VALUES
(1, 1, 23, 'acryl', 'acrylic', 'acryl', 'Bilder mit Acrylfarbe auf Leinwand', 'Paintings with Acrylic Color on Canvas', 'acryl_new.jpg', 'Acryl Bilder', 'Acrylic Images', 'All diese Bilder sind mit Acrylfarbe entstanden. Meist skizziere ich alles mit Bleistift, male dann mit Permanent Maker die Linien nach und male dann das Bild mit Acryl Farbe aus. Man muss sich ganz schön konzentrieren das man sich nicht vermalt. Die Arbeitszeit ist je nach Größe unterschiedlich, da die Farbe teilweise erst trocknen muss.', 'All of theese pictures are painted with Acrylic-Color. I often just sketch everything with a pencil. After that i just follow the lines with a permanent marker and fill out everything with Acrylic-Color. Sometimes it\'s hard to conzentrate on the image but it works mostly. I need different time to Create theese Artworks because the color must dry first until it\'s finished.', 'Painting', 1480528142, 1480528142, 1),
(2, 1, 20, 'digital', 'digital', 'digital', 'Meine Wallpaper', 'My Wallpaper', 'digital.jpg', 'Digitale Kunstwerke', 'Digitale Artworks', 'Hier findet Ihr ein paar Wallpaper von mir. Wallpaper entstehen bei mir oft als Zufallobjekt beim Spielen mit Grafiken. Alle Wallpaper könnt ihr in Originalgröße runterladen. Einfach aufs Thumbnail rechtsklicken und \"Bild Speichern\" oder so ähnlich auswählen. Ich hoffe euch gefallen meine kleinen Experimente.', 'Here you can see some of my Wallpapers i made in the last years. Wallpapers are often a random Product by Playing with images. All Wallpapers are available in full size. Just right click on the thumbnail and choose something like \"save image at\". I hope you enjoy my experiments.', 'Painting', 1486147923, 1486147923, 0),
(3, 0, 17, 'fineliner1', 'fineliner1', 'fineliner1', '0', '0', 'fineliner1.png', 'Fineliner Galerie 1', 'Fineliner Gallery 1', 'Fineliner Artworks von mir. Meine ersten Malereien sind auf kariertem Papier entstanden. Es dominiert Schwarz mit zum Teil Roten und Blauen Akzenten. Die meisten dieser Bilder sind in Psychiatrischen Kliniken entstanden, Ja ich liebe meine Stabilo Fineliner ;)', 'My Fineliner Artworks. The first of my Paintings are made on checkered Paper. It dominates black with some blue and red accents. Most of them are created in psychatric clinics. Yes I love my Stabilo Fineliners ;),', 'Painting', 1486147986, 1486147986, 0),
(4, 0, 16, 'fineliner2', 'fineliner2', 'fineliner2', '0', '0', 'fineliner2.png', 'Fineliner Galerie 2', 'Fineliner Gallery 2', 'Die 2te Fineliner Galerie. Hier mit zum Teil auf blank WeiÃŸem Papier gemalte Ornamente. Hier sind die mit Besten Bilder ever zu finden. Sogar ein farbiges hat sich hier gefunden. Leider sind die meisten der Bilder im Nirvana verschwunden aber ich hab Sie vorher noch Fotografieren kÃ¶nnen.', 'My 2nd Fineliner Gallery. Partially the ornaments are painted on blank white Paper. Here you\'ll find the best images ever. Also a colored one is in this gallery. Most if the Pictures in Fineliner2 Gallery are lost. I Just have the Photos of them at all.', 'Painting', 1486148680, 1486148680, 0),
(5, 0, 15, 'fineliner3', 'fineliner3', 'fineliner3', '0', '0', 'fineliner3.png', 'Fineliner Galerie 3', 'Fineliner Gallery 3', 'Fineliner Artworks Part III. Wie auch Picasso vor mir hatte auch ich eine Blaue Phase. Mein Fineliner gab nach diesen Bildern den Geist auf. Aber ich hab mir neue Stabilos gekauft. Nein, ich war nicht Blau als diese Bilder entstanden, aber mir gefallen Sie trotzdem gut.', 'Fineliner Artworks Part III. Like Picasso some years ago, i also had a blue phase. My fineliner was empty after theese pictures. But i buyed a new one. No i wasn\'t drunk during painting, but i like the pictures.', 'Painting', 1486148725, 1486148725, 1),
(6, 0, 14, 'fineliner4', 'fineliner4', 'fineliner4', '0', '0', 'fineliner4_2.png', 'Fineliner Galerie 4', 'Fineliner Gallery 4', 'Fineliner Artworks von 2008-2011. Diese Bilder haben mich lange BeschÃ¤ftigt. Es ist eine gemischte Galerie geworden mit Schwarzen und Blauen Fineliner Kritzeleien. Enjoy them ;).', 'Fineliner Artworks from 2008-2011. I was busy a while with this pictures Theese scrawlings are made with blue and black fineliners. Enjoy them ;).', 'Painting', 1486148761, 1486148761, 1),
(7, 0, 13, 'fineliner5', 'fineliner5', 'fineliner5', '0', '0', 'fineliner5.png', 'Fineliner Galerie 5', 'Fineliner Gallery 5', 'Mixed Fineliner Galerie No. 5', 'Mixed Fineliner Gallery No. 5', 'Painting', 1486148818, 1486148818, 1),
(8, 0, 12, 'fineliner6', 'fineliner6', 'fineliner6', '0', '0', 'fineliner6.png', 'Fineliner Galerie 6', 'Fineliner Gallery 6', 'Die 6te Galerie mit Kunst \"made with Stabilo\". Immer mehr Farbe kommt vor in diesen Artworks. Es sind aber auch Klassische 1-Farb-Bilder vorhanden. Es ist ein Durchschnitt von 2012-2015 der diese Galerie ausmacht. Ich wÃ¼nsche viel SpaÃŸ mit den Bildern.', 'The 6th Gallery wich are \"made with Stabilo\". The colored ones are more often to find in this Gallery. Also their are 1-Color-Pictures in here. It\'s a mixture of Pictures from 2012-2015 wich you find here in Fineliner6', 'Painting', 1486148850, 1486148850, 1),
(9, 1, 11, 'lampen', 'lamps', 'lampen', 'Lampen aus Leinw&auml;nden...', 'Lamps from Canvases', 'lampen.png', 'Lampen aus bemalten Leinw&auml;nden', 'Lamps created with painted Canvases', 'Vor einiger Zeit hatte Chris aus dem Maleratelier die Idee zu einem Lichtobkjekt. Die Lampen bestehen zum Teil aus fertig montierten Prismen-Leinwänden sowie verschraubten planen Leinwänden. In den Prismen steckt eine Leuchtstoffröhre und in den Viereckigen eine normale Glühlampe. Die Lampen stehen zum größtem Teil in Rickling im Maleratelier wo auch einige meiner Acryl-Werke hängen. Schaut mal rein und schaut euch glücklich,', 'Some time ago Chris from the \"Maleratelier\" had the idea to a Light-Object. Some of the Lamps are made of mounted Prism Canvases others of screwed Canvases. In the Prism Canvas is a fluorescent tube installed. The Others are filled with a Light Bulb. Most of the lamps are shown in Ricklink in the \"Maleratelier\" where also some of my acrylic Images are shown. Have a look and enjoy.', 'Painting', 1486148939, 1486148939, 1),
(11, 0, 9, 'photos2', 'photos2', 'photos2', '0', '0', 'photos2.png', 'Photo Galerie 2', 'Photo Gallery 2', 'Zwischen den KÃ¼sten und im \"Brandenburger Land\" sind diese Fotos entstanden. Es sind alles SchnappschÃ¼sse die mir vor die Kamera gelaufen sind und ich schnell ablichten musste. Ich hoffe mal euch gefÃ¤llt die Auswahl an Bildern. Schreibt doch einfach wenn Ihr ein Motiv sucht was ich mal Fotografieren soll. Ich bin offen fÃ¼r jede Anregung und hoffe Ihr seid mit der Auswahl zufrieden.', 'Between the Coasts and in Brandenburg this Photos are made. All of them are Snapshots wich are bumbed in to my Lens. I hope you like the selection. If you want something interresting to photograph just contact me. Im open for motivations and hope you like the selection.', 'Photograph', 1486149093, 1486149093, 0),
(12, 1, 6, 'sketches', 'sketches', 'sketches', 'Skizzen und Kritzeleien', 'Sketches and Scribbled ones', 'sketches.jpg', 'Sketches Galerie', 'Sketches Gallery', 'Skizzen und Entwürfe bzw. Konzeptzeichnungen sind hier. Hauptsächlich sind es Entwürfe die diese Galerie Prägen. Unter anderem sind es kleinere Zeichnungen die zwar fertig aber nicht Formatfüllend sind. Auch kleinere Experimente findet Ihr hier Versammelt unter dem Dach Sketches.', 'Sketches and schemes are in here. This gallery is characterized by schemes and drafts. Among others the pictures are very small but finished. Also smaller experiments you\'ll find here under the label Sketches.', 'Painting', 1486149265, 1486149265, 1),
(13, 0, 5, 'photos3', 'photos3', 'photos3', '0', '0', 'green_photos.jpg', 'GrÃ¼ne Photos', 'Green Photos', 'Makroaufnahmen aus Garten und Flur findet Ihr in dieser Galerie. Habe meine Kamera auf Makro eingestellt und ein paar nette SchÃ¼sse gemacht. Die meisten stammen aus unserem Garten in BimÃ¶hlen. Es sind aber auch Bilder aus dem Botanischen Garten in Kiel sowie aus Rickling dabei.', 'Macro-Shots through Garden and meadows you find in here. I configered my Cam in the Macro-Mode and shot some plants. Most of the pix are made in my garden in BimÃ¶hlen. But their are also snapshots from \"Botanischen Garten Kiel\" and from Rickling in this gallery.', 'Photograph', 1486149145, 1486149145, 0),
(14, 1, 22, 'alphabet', 'alphabet', 'alphabet', 'Von A-Z - Eine Auswahl ausgew&auml;hlter Fotos', 'From A-Z - A selection of selected Photos', 'abc.jpg', 'Alphabetische Bilder', 'Alphabetic pictures', 'Ich suche nach Buchstaben in Photos, hier sind meine Schnappsch&uuml;sse dazu zu finden. Es ist ganz sch&ouml;n knifflig passende Bilder zu finden. Aber man findet hin und wieder mal was passendes...', 'I\\\'m just looking for letters in the nature. Here you can see my snapshots. It\\\'s sometime hard to find something, but in some cases you\\\'ll find some images.', 'Photograph', 1480532088, 1480532088, 0),
(15, 1, 1, 'monstarz', 'monstarz', 'monstarz', 'Mein Monstar in der gro&szlig;en weiten Welt', 'My monstar in the big wide world', 'monstar.jpg', 'Mein Monstar', 'My Monstar', 'Ich habe vor Jahren ein Monstar-Kuscheltier bekommen, und habe es auf die Reise quer durch die Welt geschickt. Verwandte und Freunde haben das Tier in Szene gesetzt und Fotografiert. Mein Monster in der großen weiten Welt. Shots by Chinagirl, Baxter the dog, Nitropower, mir und Maria Zinckernagel Ich finde mein Monstar extrem Fotogen.', 'Some years ago i recieved a Monstar as a gift from my Sister. Sometimes Monstar is traveling around the world and some of my friends and family members shot photos with it. Monstar in the whole wide world. Shots by Chinagirl, Baxter the dog, Nitropower, Maria Zinckernagel and me I think my monstar has a lot of Sex-Appeal.', 'Photograph', 1486149018, 1486149018, 0),
(16, 0, 8, 'monstarnat', 'monstarnat', 'monstarnat', 'Mein Monstar in der gro&szlig;en weiten Welt', 'My monstar in the big wide world', 'monstarnat.jpg', 'Monstar International', 'Monstar International', 'Ich habe vor Jahren ein Monstar-Kuscheltier bekommen, und habe es auf die Reise quer durch die Welt geschickt. Meine Mutter und meine Schwester haben das Tier in Szene gesetzt und Fotografiert. Mein Monster in der großen weiten Welt. Shots by Chinagirl, Baxter the dog und Maria Zinckernagel', 'Some years ago i recieved a Monstar as a gift from my Sister. Sometimes Monstar is traveling around the world and some of my family members is shooting photos with it. Monstar in the whole wide world. Shots by Chinagirl, Baxter the dog & Maria Zinckernagel', 'Photograph', 1486148978, 1486148978, 0),
(17, 0, 10, 'fineliner7', 'fineliner7', 'fineliner7', '0', '0', 'fineliner7.jpg', 'Fineliner Galerie 7', 'Fineliner Gallery 7', 'Mal wieder Stabilo-Attacke in dieser Bildersammlung. Fineliner at it\'s best ist das Motto dieser Galerie. Alles was ich kÃ¼rzlich gemalt habe findet Ihr hier.', 'Again a Stabilo Attack in this Imagecollection. FIneliner at it\'s best is the motto of this gallery. Actual Pictures you find here.', 'Painting', 1486148901, 1486148901, 1),
(18, 1, 2, 'zentangle', 'zentangle', 'zentangle', 'Meine Zentangle Galerie - Alles Handgetangelt', 'My Zentangle Gallery - All handtangelt', 'zia_icon.jpg', 'Zentangle&reg;', 'Zentangle&reg;', 'Meine ersten Versuche mit Zentangle Inspired Art. Zentangles sind eigentlich Zeichnungen im Format 9x9cm, sind sie größer heißen sie offiziell \"Zentangle Inspired Art\". Es gibt diverse Zentangle Bücher und Hefte in denen die verschiedenen Muster abgedruckt sind, Ich habe einige davon zu Papier gebracht und unter anderem Postkarten mit diesen Mustern bemalt. Zentangles sind zum entspannen gut und fördern die Kreativität.', 'My first attemps with Zentangle Inspired Art. Actually Zentangle are 9cmx9cm big. Bigger ore Smaller Artworks are called \"Zentangle Inspired Arrt\". Their are plenty of books about Zentangles where different Patterns are printed in them. I Just made some Postcards and other Artworks with the patterns. You can relax while painting and it supports Creativity.', 'Painting', 1486149343, 1486149343, 1),
(20, 0, 3, 'photos4', 'photos4', 'photos4', '0', '0', 'photos4.jpg', 'Photos Galerie 4', 'Photos Gallery 4', 'Gemischte Photos vom Dezember 2015 bis Jetzt sind hier zu finden.', 'Mixed photos from December 2015 til now are found here.', 'Photograph', 1486149195, 1486149195, 0),
(21, 1, 19, 'fasermaler', 'Felt-Tip-Pen', 'fasermaler', 'Mit Filzstift auf Pappe und Papier oder Leinwand', 'With felt-tip pen on cardboard and paper or canvas', 'faser.jpg', 'Fasermaler Bilder', 'Felt Tip Images', 'Filzstift und Edding auf Karton / Pappe / Leinwand. Diese Bilder sind so Ähnlich wie Fineliner oder Acryl nur das sie auf Pappe bzw Papier oder Leinwand entstanden sind und nur mit Filzstift und Edding ausgemalt wurden. Die Bilder sind doppelt so groß wie Fineliner Pix und auch mit doppelt so dicken Stiften gemalt.', 'Felt-tip pen and Permanent Marker on cardboard / canvas. These pictures are similar to fineliners or acrylics, except that they are created on cardboard, paper or canvas and are only painted with a felt-tip pen and a Permanent Marker. The pictures are twice as big as Fineliner Pix and also painted with twice as thick pens.', 'Painting', 1481654720, 1481654720, 0),
(22, 1, 21, 'ausgemaltes', 'colored', 'ausgemaltes', 'Ausgemalte Bilder von Asario', 'Colored Pictures from Asario', 'ausgemalt.jpg', 'Ausgemaltes', 'colored', 'Ausmalbilder für Erwachsene sind voll im kommen. Hier ein paar Werke die ich mit Fineliner bzw. Acrylfarbe ausgemalt habe. Das größte Problem sind die feinen Strukturen in den Vorlagen. Momentan arbeite ich aus 4 Büchern heraus nette Grafiken. Ich erwähne in der Beschreibung das Quellbuch der Bilder.', 'Paint-in Images for adults are up to date today. Here you can see some Artworks wich I coloured with fineliners ore acrylic colors. The biggest problem are the tiny Structures in the drafts. At the moment i just work out of 4 Books nice artworks. I mention the book in the Image Description.', 'Painting', 1481654227, 1481654227, 1),
(23, 1, 4, 'ton', 'pottered', 'ton', 'Get&ouml;pferte Dinge', 'Pottered things', 'clay.jpg', 'get&ouml;pfertes', 'pottered', 'Einige Werke sind in 3D. Ausgestellt sind getöpferte Kunstwerke von Asario. Alles ist von mir handgemacht, mit Hilfe meines 3D-Druckers', 'Some works are in 3D. On display are pottery works of art by Asario. Everything is handmade by me, with the help of my 3D printer', 'Sculpture', 1495980764, 1495980764, 1),
(24, 1, 18, 'fineliner', 'fineliner', 'fineliner', 'Meine Fineliner Kunstwerke', 'my fineliner artworks', 'fineliner.jpg', 'Fineliner Galerie', 'Fineliner Gallery', 'Fineliner Artworks von mir. Das sind meine Fineliner Bilder von 2003-fx_year() Ja ich liebe meine Stabilo Fineliner ;)', 'My Fineliner Artworks. This are Artworks from 2003-fx_year() Yes I love my Stabilo Fineliners ;),', 'Painting', 1528568520, 1528568520, 1),
(25, 2, 7, 'photos', 'photos', 'photos', 'Meine gemischten Photos', 'My mixed Photos', 'photos.jpg', 'Fotografien', 'Photographs', 'Fotos aufgenommen mit diversen Kameras an verschiedenen Orten. Ostsee, Berlin, Kreis Segeberg uvm,', 'Photos shooted with different Cameras on different places. Baltic Sea, Berlin, Kreis Segeberg etc.', 'Photograph', 1530277678, 1530277678, 0),
(26, 1, 24, '3DDrucker', '3DPrinter', '3DPrinter', 'Frisch aus dem 3D Drucker', 'Fresh out of the 3D printer', '3dprinter.jpg', '3D Druck Bilder', '3D Print Images', 'Alles was man so mit einem 3D Drucker machen kann.', 'Everything you can do with a 3D printer.', 'Sculpture', 1641376316, 1673799343, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('dbvQFl4nWieFJhP97GCvUNhfUD14XwXT4LjR4JN5', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidVZSZG9PMHdyNXdUcjNoeGQ1VkFIT0tWbE9xanVuaHdPU2hHaGlMciI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ5OiJodHRwOi8vbG9jYWxob3N0OjgwODEvYWRtaW4vdGFibGVzL2VkaXQvYmxvZ3MvMTc5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1738329374),
('qVsPBOjMGUVHwwZlTSrwPBy7RJqQXqhZNUTZBT8R', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoibHN2cldNRFFUSDRRSWpMMXZ6QlZpalZOaVJlM2RhRVdHS0FSUXBzRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1OiJ0b2FzdCI7YTowOnt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MS9hZG1pbi90YWJsZXMvZWRpdC9ibG9ncy8xNzkiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6OToiZGFya19tb2RlIjtzOjQ6ImRhcmsiO30=', 1738265989);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE `tables` (
  `id` bigint(20) NOT NULL,
  `pub` tinyint(1) DEFAULT 1,
  `position` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `created_at` int(10) DEFAULT NULL,
  `published_at` int(10) DEFAULT NULL,
  `updated_at` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `pub`, `position`, `table_name`, `description`, `modul`, `created_at`, `published_at`, `updated_at`) VALUES
(2, 1, 1, 'blog_posts', 'Blog Posts', 'TesTModul', 1728395816, 0, 1725711767),
(15, 1, 11, 'users', 'Benutzer', NULL, 1727856000, 0, 1725711767),
(18, 1, 12, 'users_rights', 'Benutzerrechte', 'UserRights', NULL, 0, 1725711767),
(19, 1, 8, 'didyouknow', 'Wussten Sie Schon....?', NULL, 1725988470, 0, 1725711767),
(30, 1, 0, 'admin_table', 'This Table', NULL, 1725286348, 0, 1726160214),
(37, 1, 9, 'privacy', 'Datenschutzerklärung', NULL, 1725258218, 1727612054, 1727612054),
(78, 1, 5, 'texts', 'Texte für alle möglichen Seiten', NULL, 1729345863, 1729345863, 1729345863),
(87, 1, 10, 'shortpoems', 'Kurzgeschichten', NULL, 1730280017, 1730280017, 1730280017),
(90, 1, 6, 'images_cat', 'Bildergruppen', NULL, 1730295254, 1730295254, 1730295254),
(93, 1, 3, 'images', 'Bilder', NULL, 1730295288, 1730295288, 1730295288),
(96, 1, 4, 'comments', 'Kommentare', NULL, 1732545944, 1732545944, 1732545944),
(99, 1, 7, 'camera', 'Kameras', NULL, 1733239885, 1733239885, 1733239885),
(102, 1, 2, 'blog_categories', 'Kategorien der Blogeinträge', NULL, 1734191775, 1734191775, 1734191775);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `users_rights_id` bigint(11) NOT NULL DEFAULT 3,
  `profile_photo_path` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_employee` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer` tinyint(1) NOT NULL DEFAULT 0,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
  `xkis_AdminPanel` tinyint(2) NOT NULL,
  `xkis_UserRights` tinyint(2) NOT NULL,
  `xkis_SendMail` tinyint(1) NOT NULL DEFAULT 0,
  `xkis_SandMail` tinyint(1) NOT NULL DEFAULT 0,
  `xkis_CommentsCenter` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_rights`
--

INSERT INTO `users_rights` (`id`, `pub`, `position`, `moderator_id`, `name`, `shortname`, `view_table`, `add_table`, `edit_table`, `publish_table`, `date_table`, `delete_table`, `xkis_AdminPanel`, `xkis_UserRights`, `xkis_SendMail`, `xkis_SandMail`, `xkis_CommentsCenter`) VALUES
(1, 1, 0, 1, 'Developer', 'dev', '11111111111111111111111111', '111111111111111111111111111111', '11111111111111111111111111111111111111111', '1111111111111111111111111111111111', '11111111111111111111111111111', '1111111111111111111111111111111111111111111111111111', 1, 1, 0, 1, 1),
(2, 1, 1, 1, 'Moderator', 'mod', '0111111110100', '0111111110100', '0111111110100', '0111111110100', '0111111110000', '0111111110100', 1, 0, 0, 0, 1),
(3, 1, 2, 1, 'Normal User', 'user', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', 0, 0, 0, 0, 0),
(5, 1, 3, 1, 'Trial', 'trial', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', 0, 0, 0, 0, 0);

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
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devlog`
--
ALTER TABLE `devlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `didyouknow`
--
ALTER TABLE `didyouknow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_categories`
--
ALTER TABLE `images_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `devlog`
--
ALTER TABLE `devlog`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `didyouknow`
--
ALTER TABLE `didyouknow`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `images_categories`
--
ALTER TABLE `images_categories`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_rights`
--
ALTER TABLE `users_rights`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `name`, `email_verified_at`, `password`, `users_rights_id`, `profile_photo_path`, `is_admin`, `is_employee`, `is_customer`, `admin_id`, `company_id`, `customer_id`, `last_login_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Kiss', 'U', 'KissYou@example.com', 'KissU', '2025-01-10 14:58:58', '$2y$12$xmseqPoBKtL.VWc4w0yZAePcMwNY4ocIjIFgLYFYbYUrufAxuhXvG', 1, 'images/profile/008.jpg', 1, 0, 0, 2, NULL, NULL, '2025-01-30 16:31:49', NULL, NULL, '2025-01-20 17:38:47', NULL, '2025-01-10 14:58:58', '2025-01-30 16:31:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
