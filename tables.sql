-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Mrz 2025 um 17:26
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `oliver_rein`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_table`
--

CREATE TABLE `admin_table` (
  `id` bigint(20) NOT NULL,
  `pub` tinyint(1) DEFAULT 1,
  `position` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `admin_table`
--

INSERT INTO `admin_table` (`id`, `pub`, `position`, `table_name`, `description`, `modul`, `created_at`, `published_at`, `updated_at`) VALUES
(2, 1, 1, 'blogs', 'Blog Posts', 'TesTModul', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, 11, 'users', 'Benutzer', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, 12, 'users_rights', 'Benutzerrechte', 'UserRights', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, 8, 'didyouknow', 'Wussten Sie Schon....?', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 1, 0, 'admin_table', 'This Table', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 1, 9, 'privacy', 'Datenschutzerklärung', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 1, 5, 'texts', 'Texte für alle möglichen Seiten', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 1, 10, 'shortpoems', 'Kurzgeschichten', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 1, 6, 'image_categories', 'Kategorien der Bilder', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 1, 3, 'images', 'Bilder', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 1, 4, 'comments', 'Kommentare', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 1, 7, 'camera', 'Kameras', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 1, 2, 'blog_categories', 'Kategorien der Blogeinträge', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 1, 100, 'testfield', 'Test Tabelle', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_date` timestamp NULL DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `blog_categories_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `blog_authors_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `content` text DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `reading_time` int(11) DEFAULT 3,
  `markdown_on` tinyint(1) DEFAULT 1,
  `xis_aiImage` tinyint(1) DEFAULT NULL,
  `blog_images_iid` bigint(20) UNSIGNED DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `blogs`
--

INSERT INTO `blogs` (`id`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `slug`, `reading_time`, `markdown_on`, `xis_aiImage`, `blog_images_iid`, `created_at`, `updated_at`) VALUES
(2, '2006-09-21 19:00:00', 'Wir Feiern Wir Feiern', 1, 1, 'Heute ist der Grosse Tag der Tag der erÃ¶ffnung von **asario.marblefx.de**, meinem PersÃ¶nlichen Blog.  \nMit allem was von mir ist oder mit mir zu tun hat.', 'Heute ist der Grosse Tag der Tag der erÃ¶ffnung von **asario.marblefx.de**, meinem PersÃ¶nlichen Blog.  \nMit allem was von mir ist oder mit mir zu tun hat.    ', 'f4ba6049e367dba7873d85a6b9f9789c', 1, 1, 0, 1, '2006-09-21 17:00:00', '2025-02-25 15:00:24'),
(3, '2006-09-27 21:28:00', 'MCS 1.58 angefangen', 2, 1, 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei Doppelklick zu Fehlern kommen. <blockquote>\r\n       Edit: lag am FILE SIZE Limit\r\n    </blockquote>\r\n</li>\r\n <li>\r\n     Date funktion Funktioniert manchmal nicht, d.h. Datum wird nicht eingestellt obwohl es eine Datumsspalte gibt. <blockquote>\r\n       Edit:Bug gefunden lag am mangelndem Update in der Preview Funktion\r\n    </blockquote>\r\n  </li>\r\n</ul>', 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei &hellip;', 'ce490a4b1f733a9c32cbd601050927ff', 1, 1, 0, 1, '2006-09-27 19:28:00', '2025-02-25 15:00:24'),
(4, '2007-06-04 17:32:00', 'Neue Fineliner Galerie', 1, 1, 'Unter [Images->Fineliner3](index.php?page=images&action=fineliner3) sind neue Bilder gesichtet worden ...  \nhave a look ;)', 'Unter [Images->Fineliner3](index.php?page=images&action=fineliner3) sind neue Bilder gesichtet worden ...  \nhave a look ;)    ', '819ef050fba2e8cb1db56c75fcbc84de', 1, 1, 0, 1, '2007-06-04 15:32:00', '2025-02-25 15:00:24'),
(5, '2008-01-07 22:16:00', 'MCS 1.59 workin', 2, 1, 'Wir sind am Arbeiten was MCS 1.59 angeht.  \neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  \nPrivate Messages kommen alle noch in dieses Release mit rein  \n  \nfieser Bug in der Welcome gefunden und gelöst', 'Wir sind am Arbeiten was MCS 1.59 angeht.  \neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  \nPrivate Messages kommen alle noch in dieses Release mit rein  \n  \nfieser Bug in der Welcome gefunden und gelöst  ', '080c719b8e5492e6173077c3b0bf9719', 1, 1, 0, 1, '2008-01-07 21:16:00', '2025-02-25 15:00:24'),
(6, '2008-01-14 10:02:00', 'PalivaRedesign', 3, 1, 'Schon wieder ne durchzechte Nacht wegen ner Website,  \nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren während andere Schlummern.  \naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate  \nund das über Nacht.  \n  \nUnd wann kommt endlich mein c\'T Abo an ?', 'Schon wieder ne durchzechte Nacht wegen ner Website,  \nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren während andere Schlummern.  \naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate  \nund das über Nacht.  \n  \nUnd wann kommt endlich mein c\'T Abo an ? &hellip;', '5224ccf4def072422ca732d7af2155b6', 1, 1, 0, 1, '2008-01-14 09:02:00', '2025-02-25 15:00:24'),
(7, '2008-01-15 09:48:00', 'Weiteres Projekt bei mederius', 3, 1, 'Nun solls ne Zeitung werden  \nlayout 1 steht', 'Nun solls ne Zeitung werden  \nlayout 1 steht      ', 'cfad224967f73d33f4483d27fc36d090', 1, 1, 0, 1, '2008-01-15 08:48:00', '2025-02-25 15:00:24'),
(8, '2008-01-27 09:00:00', 'Rotten Psychos Redesign', 3, 1, 'Bin am Überlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....  \nRotten-Psychos ist bzw war ein Clan aus meiner \"Beben 3 Arena\" Zeit.  \n  \n_edit:_  \nClanpage is zu 90% fertig', 'Bin am Überlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....  \nRotten-Psychos ist bzw war ein Clan aus meiner \"Beben 3 Arena\" Zeit.  \n  \n_edit:_  \nClanpage is zu 90% fertig   ', 'f1a651250f8a04a6befd6a7ebf8d51ec', 1, 1, 0, 1, '2008-01-27 08:00:00', '2025-02-25 15:00:24'),
(9, '2008-02-17 11:56:00', 'Is schon irre was man so macht', 3, 1, 'Rotten Psychos ist f&uuml;r mich eine der besten Zeiten gewesen die ich hatte.  \r\nDamals war DSL noch Teuer und man freute sich &uuml;ber jedes 1on1  \r\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut', 'Rotten Psychos ist f&uuml;r mich eine der besten Zeiten gewesen die ich hatte.  \r\nDamals war DSL noch Teuer und man freute sich &uuml;ber jedes 1on1  \r\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut  ', 'a6aace2e58518a59116ebd8f6d605c32', 1, 1, 0, 1, '2008-02-17 10:56:00', '2025-02-25 15:00:24'),
(10, '2008-11-28 11:27:00', 'How Tough - Rotten-Psychos online', 1, 1, 'Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.  \nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.  \nZur Zeit feile ich an der Neuen <a target=\"rotte\" href=\"http://www.rotten-psychos.de\">Rotten Psychos Seite</a> und das RP-Forum ist fast fertig.  \nDas Forum ist eine Eigenentwicklung auf MCS Basis.  \nHat mich ne menge Zeit gekostet bis alles so funktionierte wie gedacht.  \nAber ich habs geschafft die Fehler die sich versteckt hatten zu finden.', 'Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.  \nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.  \nZur Zeit feile ich an der Neuen <a target=\"rotte\" href=\"http://www.rotten-psychos.de\">Rotten Psychos Seite</a> und das RP-Forum ist fast fertig.  \nDas Forum &hellip;', 'e87fb57a53d4b1cbe19013ab0db1d4ae', 1, 1, 0, 1, '2008-11-28 10:27:00', '2025-02-25 15:00:24'),
(11, '2010-01-10 10:41:00', 'How Real', 1, 1, 'Es ist mal wieder eine neue Seite fertig geworden.  \nunter [www.freundeskreis-spiegelbild.de](http://www.freundeskreis-spiegelbild.de) findet ihr alles zum Förderverein Freundeskreis Spiegelbild', 'Es ist mal wieder eine neue Seite fertig geworden.  \nunter [www.freundeskreis-spiegelbild.de](http://www.freundeskreis-spiegelbild.de) findet ihr alles zum Förderverein Freundeskreis Spiegelbild  ', '7071bbc1905f12d7b6d64f940df4bf1e', 1, 1, 0, 1, '2010-01-10 09:41:00', '2025-02-25 15:00:24'),
(12, '2010-01-12 17:09:00', 'MCS 1.61 workin', 2, 1, 'Marble Content System ist in version 1.61 erschienen.  \nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  \n  \nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>', 'Marble Content System ist in version 1.61 erschienen.  \nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  \n  \nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>  ', '3e98b9fbcd5bc9d6cf6147773e4557fa', 1, 1, 0, 1, '2010-01-12 16:09:00', '2025-02-25 15:00:24'),
(13, '2010-06-19 20:31:00', 'Happy Birthday Asario', 1, 1, 'Herzlichen Glückwunsch Lieber Asario zum 27. Geburtstag.  \nDer Tag war schön und das Wetter ging auch in Ordnung.  \nFreue mich schon auf den Sommer.  \nHabe nette Sachen geschenk bekommen und demnächst lad ich noch 1-2 Fineliner-Bilder hoch.  \nHabt Spass, in liebe euer Asario.', 'Herzlichen Glückwunsch Lieber Asario zum 27. Geburtstag.  \nDer Tag war schön und das Wetter ging auch in Ordnung.  \nFreue mich schon auf den Sommer.  \nHabe nette Sachen geschenk bekommen und demnächst lad ich noch 1-2 Fineliner-Bilder hoch.  \nHabt Spass, in liebe euer Asario. &hellip;', '99bd104be1eee60947dabcce6ad10727', 1, 1, 0, 1, '2010-06-19 18:31:00', '2025-02-25 15:00:24'),
(14, '2010-08-14 20:31:00', 'Neue Bilder', 1, 1, 'Habe 1 neues Wallpaper unter [Digital Art](index.php?pae=images&action=digital) und 2 Fineliner Artworks unter [Fineliner 4](index.php?pae=images&action=fineliner4) hochgeladen.  \n  \nWünsche euch viel spass mit den Bildern.', 'Habe 1 neues Wallpaper unter [Digital Art](index.php?pae=images&action=digital) und 2 Fineliner Artworks unter [Fineliner 4](index.php?pae=images&action=fineliner4) hochgeladen.  \n  \nWünsche euch viel spass mit den Bildern.  ', '3402dede9d08dacbbe43c35407ad4afd', 1, 1, 0, 1, '2010-08-14 18:31:00', '2025-02-25 15:00:24'),
(15, '2010-12-26 14:35:00', 'Merry X-Mas and a happy  new Year', 1, 1, 'Hiermit wünsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.  \n  \nhabt Spass, bis bald, euer Asario', 'Hiermit wünsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.  \n  \nhabt Spass, bis bald, euer Asario    ', 'a04fcfa3e53019b75561bb7fc28d67be', 1, 1, 0, 1, '2010-12-26 13:35:00', '2025-02-25 15:00:24'),
(16, '2011-06-27 17:33:00', 'MCS 1.63 Workin', 2, 1, 'MCS 1.63 ist nun verfügbar.  \neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  \n  \nWünsche viel spass mit meinem Blog.', 'MCS 1.63 ist nun verfügbar.  \neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  \n  \nWünsche viel spass mit meinem Blog.    ', '8c858125470a24e05d189e62874c43f9', 1, 1, 0, 1, '2011-06-27 15:33:00', '2025-02-25 15:00:24'),
(17, '2011-06-27 17:35:00', 'Neue (alte) Bilder unter Fineliner4', 1, 1, 'Hier ein paar neue Fineliner Artworks.  \nBei der Scanqualität musste ich leider etwas nachbearbeiten.  \nHoffe sie gefallen euch.  \nAuf Bald euer Asario', 'Hier ein paar neue Fineliner Artworks.  \nBei der Scanqualität musste ich leider etwas nachbearbeiten.  \nHoffe sie gefallen euch.  \nAuf Bald euer Asario    ', '7652bbbf46050a2c0e8d0894792c2aa0', 1, 1, 0, 1, '2011-06-27 15:35:00', '2025-02-25 15:00:24'),
(18, '2011-06-27 17:49:00', 'Bin wieder Online....', 3, 1, 'Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,  \nd.h. ich bin wieder dabei.', 'Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,  \nd.h. ich bin wieder dabei.     ', '3206d174d66b122c35ad325b4ba49b87', 1, 1, 0, 1, '2011-06-27 15:49:00', '2025-02-25 15:00:24'),
(19, '2011-07-29 16:30:00', 'MCS Update steht bevor....', 2, 1, 'Also hier mal wieder ein paar News aus der Devlog Ecke.  \nDie Entwicklung von MCS 1.64 ist angelaufen....  \nGeplant sind einige nette Features zwecks Private Messaging.  \nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  \nweitere Infos demnächst Hier...', 'Also hier mal wieder ein paar News aus der Devlog Ecke.  \nDie Entwicklung von MCS 1.64 ist angelaufen....  \nGeplant sind einige nette Features zwecks Private Messaging.  \nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  \nweitere Infos demnächst Hier... &hellip;', '2a0227a2585cb3889d54180b0b5601f0', 1, 1, 0, 1, '2011-07-29 14:30:00', '2025-02-25 15:00:24'),
(20, '2011-08-11 17:38:00', 'news from MCS', 2, 1, 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  \nso das niemand eine PM verpasst.  \nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  \nund in Asarios Blog implementiert.  \n(ich arbeite noch dran)...', 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  \nso das niemand eine PM verpasst.  \nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  \nund in Asarios Blog implementiert.  \n(ich arbeite noch dran)... &hellip;', '1be8f91a62e9ed9ddbdd3bc825ba2322', 1, 1, 0, 1, '2011-08-11 15:38:00', '2025-02-25 15:00:24'),
(21, '2011-08-11 17:38:00', 'MCS version 1.67 Released', 2, 1, 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  \nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  \n  \nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  \n  \nMCS ist jetzt Multilanguage fÃ¤hig.  \n  \nVieles Neues kam dazu, altes wurde verbessert.', 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  \nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  \n  \nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  \n  \nMCS ist jetzt Multilanguage fÃ¤hig.  \n  \nVieles Neues kam dazu, altes &hellip;', '10df6140be8b21472264b095912de0a4', 1, 1, 0, 1, '2011-08-11 15:38:00', '2025-02-25 15:00:24'),
(22, '2011-09-25 14:54:00', 'Neue Shortstorie gesichtet & 2 neue Photos', 1, 1, 'Hab ma wieder [was geschrieben](%5C\'index.php?page=shortstories%5C) und [2 Photos](%5C\'index.php?page=images&action=photos%5C) hochgeladen.  \nHabt Spass, euer Asario', 'Hab ma wieder [was geschrieben](%5C\'index.php?page=shortstories%5C) und [2 Photos](%5C\'index.php?page=images&action=photos%5C) hochgeladen.  \nHabt Spass, euer Asario   ', 'fbac8ff9e350b045355eec28916176d9', 1, 1, 0, 1, '2011-09-25 12:54:00', '2025-02-25 15:00:24'),
(23, '2011-10-28 18:43:00', 'neue Fineliner Artworks', 1, 1, 'Ich habe ein paar [Artworks von 2011](%5C\'index.php?page=images&action=fineliner4%5C\') hochgeladen.  \nWünsche viel Spass, Asario.', 'Ich habe ein paar [Artworks von 2011](%5C\'index.php?page=images&action=fineliner4%5C\') hochgeladen.  \nWünsche viel Spass, Asario.    ', '31f889ccae7aed4764b13b5c4f45ed78', 1, 1, 0, 1, '2011-10-28 16:43:00', '2025-02-25 15:00:24'),
(24, '2011-12-04 18:58:00', 'Neues Fineliner Pic', 1, 1, 'Hab mal wieder nen Bild gefunden und hochgeladen.  \nHabt Spaß, euer Asario', 'Hab mal wieder nen Bild gefunden und hochgeladen.  \nHabt Spaß, euer Asario     ', '9e29031600cde17f027211af76b74092', 1, 1, 0, 1, '2011-12-04 17:58:00', '2025-02-25 15:00:24'),
(25, '2012-01-01 18:54:00', 'Happy New Year !', 1, 1, 'Allen Besuchern und Freunden wünsche ich ein schönes neues Jahr.  \n  \nHabt Spaß, auch in 2012.  \n  \nIn Liebe, euer Asario', 'Allen Besuchern und Freunden wünsche ich ein schönes neues Jahr.  \n  \nHabt Spaß, auch in 2012.  \n  \nIn Liebe, euer Asario    ', 'f874ee878f4863a68a3e12f2a3a850bb', 1, 1, 0, 1, '2012-01-01 17:54:00', '2025-02-25 15:00:24'),
(26, '2012-02-12 19:23:00', 'Neues bei mir.', 1, 1, 'Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.  \n  \nWünsche viel Spaß damit, euer Asario.', 'Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.  \n  \nWünsche viel Spaß damit, euer Asario.     ', '6e211e11d69e89e6740691bf9017d62f', 1, 1, 0, 1, '2012-02-12 18:23:00', '2025-02-25 15:00:24'),
(27, '2012-08-21 13:43:00', 'Alles Neue macht der August', 1, 1, 'Also wir haben jetzt das Update zu Version 1.67 vollzogen.  \nviele kleine neuen Sachen sind jetzt dabei.  \nich wÃ¼nsch euch viel SpaÃŸ in Asarios Blog', 'Also wir haben jetzt das Update zu Version 1.67 vollzogen.  \nviele kleine neuen Sachen sind jetzt dabei.  \nich wÃ¼nsch euch viel SpaÃŸ in Asarios Blog    ', '23cd01309dd069a8b82992b975c7a8f3', 1, 1, 0, 1, '2012-08-21 11:43:00', '2025-02-25 15:00:24'),
(28, '2012-09-09 17:46:00', 'Neues Design, neue Funktionen, neue Innovationen', 1, 1, 'Habe in meiner Schublade noch Bilder gefunden und hochgeladen.  \nHoffe Sie gefallen euch.  \n  \nviel Spass Asario', 'Habe in meiner Schublade noch Bilder gefunden und hochgeladen.  \nHoffe Sie gefallen euch.  \n  \nviel Spass Asario    ', '87d055aa557b17827914ca38c29dc475', 1, 1, 0, 1, '2012-09-09 15:46:00', '2025-02-25 15:00:24'),
(29, '2012-11-22 19:50:00', 'Neue Funktion in Asarios Blog', 1, 1, 'Newsfeeds sind jetzt im Abo erhÃ¤ltlich,  \nzu finden Rechts unter Benutzerliste.  \n  \nWÃ¼nsch euch viel SpaÃŸ mit den Feeds', 'Newsfeeds sind jetzt im Abo erhÃ¤ltlich,  \nzu finden Rechts unter Benutzerliste.  \n  \nWÃ¼nsch euch viel SpaÃŸ mit den Feeds    ', 'a7e3648f062f3b72d664ac1331377391', 1, 1, 0, 1, '2012-11-22 18:50:00', '2025-02-25 15:00:24'),
(30, '2012-12-02 19:17:00', 'Neue Bilder gesichtet.', 1, 1, 'unter Images->Digital und unter Images->Acryl sind neue Bilder gesichtet worden,  \nhabt SpaÃŸ, Asario', 'unter Images->Digital und unter Images->Acryl sind neue Bilder gesichtet worden,  \nhabt SpaÃŸ, Asario     ', '94c2b0b0fd97669d8e56938ed3fe7b81', 1, 1, 0, 1, '2012-12-02 18:17:00', '2025-02-25 15:00:24'),
(31, '2013-01-06 19:31:00', 'Hab noch mal gekramt....', 1, 1, '... und neue Bilder gefunden.  \nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.  \n  \nAch ja, ein schÃ¶nes neues Jahr an alle.', '... und neue Bilder gefunden.  \nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.  \n  \nAch ja, ein schÃ¶nes neues Jahr an alle.    ', '940dbcf8951ebe1fa1585d479893774c', 1, 1, 0, 1, '2013-01-06 18:31:00', '2025-02-25 15:00:24'),
(32, '2013-01-27 19:06:00', 'Wieder was von der Bilderfront.', 1, 1, 'Unter Images->Photos2 ist eine neue Galerie entstanden.  \nUnter Images->Acryl ist ein neues Bild.  \nUnter Images->Sketches ist eine neue Skizze.  \nUnter Images->Digital ist ein neues Wallpaper.  \n  \nViel Spass mit den Bildern, Asario', 'Unter Images->Photos2 ist eine neue Galerie entstanden.  \nUnter Images->Acryl ist ein neues Bild.  \nUnter Images->Sketches ist eine neue Skizze.  \nUnter Images->Digital ist ein neues Wallpaper.  \n  \nViel Spass mit den Bildern, Asario  ', '22530b8457ef0e9fc8c9acf79a986174', 1, 1, 0, 33, '2013-01-27 18:06:00', '2025-02-25 15:00:24'),
(33, '2013-05-20 17:26:00', 'Wie man aus 4 LeinwÃ¤nden 1 Lichtobjekt macht....', 1, 1, '... Seht ihr unter Images->Lampen  \nUns kam die Idee aus einem \"neverending Paul\" Bild eine Lampe zu fertigen.  \nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.  \n  \nedit: Die Winkel haben wir jetzt, die mÃ¼ssen nur noch gebohrt und montiert werden.  \n  \nWÃ¼nsche viel Spass damit, euer Asario', '... Seht ihr unter Images->Lampen  \nUns kam die Idee aus einem \"neverending Paul\" Bild eine Lampe zu fertigen.  \nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.  \n  \nedit: Die Winkel haben wir jetzt, die mÃ¼ssen nur noch gebohrt und montiert werden.  \n  \nWÃ¼nsche viel Spass damit, &hellip;', 'bb838e8469ee288fb30cd0500fac64fc', 1, 1, 0, 34, '2013-05-20 15:26:00', '2025-02-25 15:00:24'),
(34, '2013-05-20 17:52:00', 'Neuer Fernseher in Asarios Home Office.', 3, 1, 'Ich habe mir mal was gegÃ¶nnt und mir einen neuen Fernseher gekauft.  \nDaten:  \nGrÃ¶sse: 47\' (119cm)  \nLAN, 3D, FullHD, Smart TV Funktionen  \n  \nJetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.  \nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich mal mein Herz ausschÃ¼tten', 'Ich habe mir mal was gegÃ¶nnt und mir einen neuen Fernseher gekauft.  \nDaten:  \nGrÃ¶sse: 47\' (119cm)  \nLAN, 3D, FullHD, Smart TV Funktionen  \n  \nJetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.  \nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich &hellip;', '4ca5b52d88f022e441de09abdb8a6d5e', 1, 1, 0, 35, '2013-05-20 15:52:00', '2025-02-25 15:00:24'),
(35, '2013-06-23 19:37:00', 'MCS v. 1.68 released', 2, 1, 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  \nMCS version 1.68 (Honkey Donkey) wurde installiert.  \n  \nZu den Features zählen:  \n-Neue Icons im Admincenter  \n-Benutzerinhalte Funktionen  \nsowie mehrere kleine eliminierte Fehler  \n  \nMehr Informationen im Changelog auf www.marblefx.de', 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  \nMCS version 1.68 (Honkey Donkey) wurde installiert.  \n  \nZu den Features zählen:  \n-Neue Icons im Admincenter  \n-Benutzerinhalte Funktionen  \nsowie mehrere kleine eliminierte Fehler  \n  \nMehr Informationen im Changelog auf www.marblefx.de &hellip;', '8b597627d1eeb5d893d150cecadd1494', 1, 1, 0, 1, '2013-06-23 17:37:00', '2025-02-25 15:00:24'),
(36, '2013-06-23 19:38:00', 'Smilies all over the World', 1, 1, 'Ab jetzt seht ihr Ã¼berall Smilies wo auch immer sie geschrieben wurden.  \nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)', 'Ab jetzt seht ihr Ã¼berall Smilies wo auch immer sie geschrieben wurden.  \nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)    ', '7827de3fd2c40e016e33585d024382f5', 1, 1, 0, 37, '2013-06-23 17:38:00', '2025-02-25 15:00:24'),
(37, '2013-07-14 17:55:00', 'Alles Neue Macht der Juli.', 1, 1, 'In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.  \nIhr findet Sie unter Images->Photos2', 'In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.  \nIhr findet Sie unter Images->Photos2    ', 'c7257ed3b6ce1859ad172640c3b372ef', 1, 1, 0, 38, '2013-07-14 15:55:00', '2025-02-25 15:00:24'),
(38, '2013-08-11 18:00:00', 'Der Fernseher h&auml;ngt an der Wand ;)', 3, 1, 'Ja er hängt noch, er hängt noch für mich....  \nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)  \nUnd mein neuer 3D-BluRay Player rockt auch derbst.  \nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.  \nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.  \n  \ngl&hf Paul', 'Ja er hängt noch, er hängt noch für mich....  \nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)  \nUnd mein neuer 3D-BluRay Player rockt auch derbst.  \nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.  \nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.  \n  \ngl&hf Paul &hellip;', 'a7b8722e2506176851a0ef8fa97dcff3', 1, 1, 0, 39, '2013-08-11 16:00:00', '2025-02-25 15:00:24'),
(39, '2014-01-05 18:14:00', 'Frohes Neues - 2014 - ein GlÃ¼cksjahr', 1, 1, 'Ich habe unter Images->Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,  \nIch hoffe bei euch war der Weihnachtsmann auch so fleiÃŸig wie bei mir.  \nAllen Besuchern meiner Seite wÃ¼nsche ich gut reingerutscht zu sein und ein schÃ¶nes neues Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, euer Asario.  \n  \nViele GrÃ¼sse auch von \"the cat\" Elke aus Potsdam ;)', 'Ich habe unter Images->Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,  \nIch hoffe bei euch war der Weihnachtsmann auch so fleiÃŸig wie bei mir.  \nAllen Besuchern meiner Seite wÃ¼nsche ich gut reingerutscht zu sein und ein schÃ¶nes neues Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, euer Asario.  \n  \nViele GrÃ¼sse auch von &hellip;', 'c6c6687abfd057fa7d752f23df3ae670', 1, 1, 0, 40, '2014-01-05 17:14:00', '2025-02-25 15:00:24'),
(40, '2014-02-10 19:02:00', 'Neues Layout !', 1, 1, 'Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylemÃ¤ssig erneuert.  \nUnd eine Neue Galerie hat sich angefunden.  \nMehr unter Images->Lampen', 'Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylemÃ¤ssig erneuert.  \nUnd eine Neue Galerie hat sich angefunden.  \nMehr unter Images->Lampen    ', 'e6f376d84ac0f7a03f236a7c71871067', 1, 1, 0, 41, '2014-02-10 18:02:00', '2025-02-25 15:00:24'),
(41, '2014-03-02 19:04:00', 'MCS v. 1.69 Online', 2, 1, 'Marble Content System wurde auf Version 1.69 aktualisiert.  \nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  \nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  \nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine Funktionen fanden den Weg ins 1.69er Release.  \nWenn euch was auffÃ¤llt schreibt mir auf www.mfx.marblefx.de/index.php?page=contact  \nIch wÃ¼nsche euch viel Spass auf meinen Seiten.  \n  \nAsario', 'Marble Content System wurde auf Version 1.69 aktualisiert.  \nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  \nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  \nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine &hellip;', 'bff93cc3f7057f6758e3c1474d9d8f1b', 1, 1, 0, 1, '2014-03-02 18:04:00', '2025-02-25 15:00:24'),
(42, '2014-03-31 17:07:00', 'Ausstellung in Kaltenkirchen', 1, 1, 'Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃ¶ffnet. Bei ca. 40 geladenen GÃ¤sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde Ã¼ber Kunst in der Psychatrie gesprochen sowie auf einzelne KÃ¼nstler eingegangen.  \n  \nDie Ausstellung lÃ¤uft noch 6 Wochen und es sind etliche KÃ¼nstler des Malerateliers zu sehen und auch zu Kaufen was \"wir\" alles so gemalt und kreiert haben.  \nÃ–ffnungszeiten sind montags bis donnerstags von 8:30 Uhr bis 18 Uhr sowie freitags von 8:30 Uhr bis 16:00 Uhr  \n  \nVon mir sind 3 Kunstwerke ausgestellt welche das sind seht Ihr wenn ihr da seid ;)  \nVon Hier aus noch mal Danke an Chris die das alles mÃ¶glich gemacht hat.;)', 'Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃ¶ffnet. Bei ca. 40 geladenen GÃ¤sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde Ã¼ber Kunst in der Psychatrie gesprochen sowie auf einzelne KÃ¼nstler eingegangen.  \n  \nDie Ausstellung lÃ¤uft noch 6 Wochen und es sind &hellip;', '37061081d94b406a09b0bee3397f035b', 1, 1, 0, 43, '2014-03-31 15:07:00', '2025-02-25 15:00:24'),
(43, '2014-04-13 17:35:00', 'Misteri&ouml;se Schatten werfen Ihr Licht auf uns....', 2, 1, 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.', 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.  ', '70c7cfef34f3922705d9a6d22c5c6e9b', 1, 1, 0, 1, '2014-04-13 15:35:00', '2025-02-25 15:00:24'),
(44, '2014-04-27 17:36:00', 'Frohe Ostern... Der Osterhase war da!', 1, 1, 'Allen Besuchern wÃ¼nsche ich, frohe  \nOstern gehabt zu haben, Ich habe 2  \nneue Photos Hochgeladen.... viel  \nSpaÃŸ damit euer Asarioâ€¦', 'Allen Besuchern wÃ¼nsche ich, frohe  \nOstern gehabt zu haben, Ich habe 2  \nneue Photos Hochgeladen.... viel  \nSpaÃŸ damit euer Asarioâ€¦    ', '327c377574dd80904f59608c69b2d924', 1, 1, 0, 45, '2014-04-27 15:36:00', '2025-02-25 15:00:24'),
(45, '2014-06-17 17:31:00', '3 neue Galerien', 1, 1, 'Ich erÃ¶ffne Hiermit die Galerien **Alphabet**, **Monstarz** und **Photos3**  \nhab eine Menge neuer Bilder hochgeladen, viel SpaÃŸ damit euer Asario.', 'Ich erÃ¶ffne Hiermit die Galerien **Alphabet**, **Monstarz** und **Photos3**  \nhab eine Menge neuer Bilder hochgeladen, viel SpaÃŸ damit euer Asario.    ', '85fe98376c4985096c1188bfa4920b0c', 1, 1, 0, 46, '2014-06-17 15:31:00', '2025-02-25 15:00:24'),
(46, '2014-08-25 17:49:00', 'Bewertungsfunktion fÃ¼r Bilder.', 1, 1, 'Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.  \nAlle Meine Bilder kÃ¶nnt Ihr bewerten und sehen wie Sie ankommen.  \nViel SpaÃŸ damit, euer Asario', 'Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.  \nAlle Meine Bilder kÃ¶nnt Ihr bewerten und sehen wie Sie ankommen.  \nViel SpaÃŸ damit, euer Asario   ', 'c1c70865938aeccad492f69f5708d2eb', 1, 1, 0, 47, '2014-08-25 15:49:00', '2025-02-25 15:00:24'),
(47, '2014-10-19 17:29:00', 'Mein neues Bike', 3, 1, 'Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.  \nEs fährt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gepäckträger und Kunststoffschutzbleche sowie jede Menge Fahrspaß inklusive.  \n  \nIch bin Stolz auf dieses tolle Teil.', 'Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.  \nEs fährt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gepäckträger und Kunststoffschutzbleche sowie jede Menge Fahrspaß &hellip;', '8afb6b96cad226351512649051b1448e', 1, 1, 0, 48, '2014-10-19 15:29:00', '2025-02-25 15:00:24'),
(48, '2014-10-25 16:14:00', 'MCS v. 1.70 released', 2, 1, 'Die Neueste MCS Version ist Nr. 1.70.  \nIn diesem Release wurde einiges neu gemacht.  \nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  \nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  \nMehr infos siehe Changelog  \nIch hoffe Ihr habt eure Freude an diesem Release.', 'Die Neueste MCS Version ist Nr. 1.70.  \nIn diesem Release wurde einiges neu gemacht.  \nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  \nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  \nMehr infos siehe Changelog  &hellip;', 'eaeedee2d1ba00382633ef4238663272', 1, 1, 0, 1, '2014-10-25 14:14:00', '2025-02-25 15:00:24'),
(49, '2014-11-02 14:33:00', 'New Images', 1, 1, 'Unter Images sind neue Bilder gesichtet worden,  \nund eine neue Galerie wurde erÃ¶ffnet.  \nDie Monstarnational Galerie mit Bildern vom Monstar in der groÃŸen weiten Welt.  \nHoffe Ihr habt SpaÃŸ damit, Asario', 'Unter Images sind neue Bilder gesichtet worden,  \nund eine neue Galerie wurde erÃ¶ffnet.  \nDie Monstarnational Galerie mit Bildern vom Monstar in der groÃŸen weiten Welt.  \nHoffe Ihr habt SpaÃŸ damit, Asario  ', 'fcea25b2d04b431ed53ec2531251a292', 1, 1, 0, 50, '2014-11-02 13:33:00', '2025-02-25 15:00:24'),
(50, '2014-11-16 17:49:00', 'Mein erster Ritt...', 3, 1, 'In meinem Urlaub war ich das erste mal in meinem Leben \"selbstÃ¤ndig\" Reiten,  \nEs macht Irre SpaÃŸ, ist aber doch gewÃ¶hnungsbedÃ¼rftig sprich ich habe Respekt vor dem Tier.  \n  \nRispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃ¶rperspannung muss ich noch arbeiten.  \n  \nPS: Reiten ist Geil ;)', 'In meinem Urlaub war ich das erste mal in meinem Leben \"selbstÃ¤ndig\" Reiten,  \nEs macht Irre SpaÃŸ, ist aber doch gewÃ¶hnungsbedÃ¼rftig sprich ich habe Respekt vor dem Tier.  \n  \nRispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃ¶rperspannung muss ich noch arbeiten.  \n  \nPS: Reiten ist Geil ;) &hellip;', '110448b8e51065dd1566d30c78837ce1', 1, 1, 0, 51, '2014-11-16 16:49:00', '2025-02-25 15:00:24'),
(51, '2014-12-05 18:30:00', 'Frohe Weihnachten und einen...', 1, 1, 'guten Rutsch ins neue Jahr.  \nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.  \nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein groÃŸes Event und viel SpaÃŸ fÃ¼r uns.  \nIch wÃ¼nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.  \nViele GrÃ¼ÃŸe aus Bad Segeberg, BimÃ¶hlen und Potsdam, Asario', 'guten Rutsch ins neue Jahr.  \nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.  \nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein groÃŸes Event und viel SpaÃŸ fÃ¼r uns.  \nIch wÃ¼nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.  \nViele GrÃ¼ÃŸe aus Bad &hellip;', 'dde11d6bd610a0588eef83c68f5f6ea7', 1, 1, 0, 52, '2014-12-05 17:30:00', '2025-02-25 15:00:24'),
(52, '2015-03-20 17:49:00', 'Der FrÃ¼hling kommt.', 1, 1, 'Wie Ihr auf dem Bild seht ist schon wieder alles GrÃ¼n.  \nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.  \nIhr findet Sie wie immer Ã¼ber den Roten Button rechts oben auf dieser Seite.  \nIch hoffe Ihr genieÃŸt das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.  \n  \nAch ja, unter Mindblog gibt es ne Geschichte Ã¼ber mich und mein Leben.  \nPart I ist Online, Part II kommt demnÃ¤chst  \nViele GrÃ¼ÃŸe aus dem sonnigen BimÃ¶hlen, euer Asario', 'Wie Ihr auf dem Bild seht ist schon wieder alles GrÃ¼n.  \nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.  \nIhr findet Sie wie immer Ã¼ber den Roten Button rechts oben auf dieser Seite.  \nIch hoffe Ihr genieÃŸt das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.  \n  \nAch ja, unter &hellip;', '966ab1d63e82d3d47eba16e36e51a567', 1, 1, 0, 53, '2015-03-20 16:49:00', '2025-02-25 15:00:24'),
(53, '2015-03-20 17:51:00', 'Asario\'s Geschichte Part I', 0, 1, 'Alles fing mit einem verkorksten 16. Geburtstag an.  \nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.  \nEs waren die Punks vom See mit Ihren Hunden.  \nIch spielte mit den Hunden und kam ins GesprÃ¤ch-  \nWir redeten Ã¼ber meinen Geburtstag und Sie fragten mich ob ich nicht mit in Ihre Kneipe kommen wÃ¼rde.  \nIch sagte zu. Von da an war ich Ã¶fter in der Kneipe. Es waren verstÃ¤ndnisvolle Menschen die vÃ¶llig natÃ¼rlich und nett waren. Ich fÃ¼hlte mich geborgen bei Ihnen.  \n  \nNicht so wie bei meinen Eltern, wo nur Ehe-Krach und Scheidungsstreitigkeiten an der Tagesordnung waren.  \nWenn ein Mensch Geborgenheit sucht und nichts ausser zerrÃ¼tteter VerhÃ¤ltnisse bekommt sucht man sich immer einen Ruhepol.  \nDen hatte ich in dieser besagten Kneipe gefunden. Viele Hunde, nette Menschen und Party Party Party war das was ich da hatte.  \n  \nDie Partys waren eine gute MÃ¶glichkeit mich abzulenken. Ich trank ein Paar Bier und schon ging es mir viel Besser.  \nZwar war das GefÃ¼hl nur fÃ¼r einen Moment vorhanden aber ich hatte meinen SpaÃŸ.  \n  \nMeine Leistungen in der Schule gingen rapide Bergab. Ich hatte einfach keine Lust es meinen Eltern Recht zu machen und in der Schule aufzupassen.  \nIch entwickelte mich immer mehr von einem guten SchÃ¼ler zu einen Klassenclown.  \nWIeso sollte ich meinem Traum vom Meeresbiologen denn weiter TrÃ¤umen wenn meine Eltern es nicht mal schaffen zusammenzuhalten ?  \n  \nIch war frustriert und Lustlos von all dem ganzen Zeug.  \nNur meine Punkerfreunde waren fÃ¼r mich da und machten mir Mut das irgendwann Licht am Ende des Tunnels sei.  \n  \nIch hatte eine Zweite Familie gefunden.  \n  \nto be continued', 'Alles fing mit einem verkorksten 16. Geburtstag an.  \nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.  \nEs waren die Punks vom See mit Ihren Hunden.  \nIch spielte mit den Hunden und kam ins GesprÃ¤ch-  \nWir redeten Ã¼ber meinen Geburtstag und Sie fragten mich ob ich nicht mit &hellip;', '5847fe96b9f3c8433ce7705adbf82199', 2, 1, 0, 1, '2015-03-20 16:51:00', '2025-02-25 15:00:24'),
(54, '2015-03-20 17:55:00', 'MCS v. 1.72 Ver&ouml;fentlicht', 2, 1, 'Joa, hab mal wieder ne neue Version released.  \nhinzugekommen sind:  \n- ein neues Anti Spam Modul  \n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  \n- Signatureinstellungen automatisiert.  \n  \nAußerdem habe ich Fehler beseitigt im  \n- Benutzerprofil  \n- Meta Tags Scripts  \n- Searching Scripts  \n  \nsowie mehrere kleine Bugs im System.', 'Joa, hab mal wieder ne neue Version released.  \nhinzugekommen sind:  \n- ein neues Anti Spam Modul  \n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  \n- Signatureinstellungen automatisiert.  \n  \nAußerdem habe ich Fehler beseitigt im  \n- Benutzerprofil  \n- Meta Tags Scripts  \n- Searching &hellip;', '2876ef7ba5b3a95fb84fbe59724c592e', 1, 1, 0, 1, '2015-03-20 16:55:00', '2025-02-25 15:00:24'),
(55, '2015-05-05 16:16:00', 'Elke ist tod. :(', 1, 1, 'Leider mussten wir Elke unsere Admin Katze einschlÃ¤fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.  \nSie hatte schon immer einen leichten Schaden, nur weil es nicht besser wurde und meine Mutter mit EntzÃ¼ndingen schon des Ã¶fteren bei Ã„rzten war, lieÃŸen wir Sie EinschlÃ¤fern...  \nR.I.P. Elke, wir denken an dich.', 'Leider mussten wir Elke unsere Admin Katze einschlÃ¤fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.  \nSie hatte schon immer einen leichten Schaden, nur weil &hellip;', '7e0b3aee964d4bce03ca4dccd5f3ee4a', 1, 1, 0, 56, '2015-05-05 14:16:00', '2025-02-25 15:00:24'),
(56, '2015-05-05 16:18:00', 'Neue BilderÂ²', 1, 1, 'Here we goooo.  \nSind mal wieder 4 Bilder Hochgeladen worden...  \nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).  \nBei uns ist zur Zeit gutes Wetter was fÃ¼r mich heiÃŸt Fahrradfahren.  \nWerd mal zum SpaÃŸ meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme...  \nWÃ¼nsche viel SpaÃŸ mit den Bildern...', 'Here we goooo.  \nSind mal wieder 4 Bilder Hochgeladen worden...  \nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).  \nBei uns ist zur Zeit gutes Wetter was fÃ¼r mich heiÃŸt Fahrradfahren.  \nWerd mal zum SpaÃŸ meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme... &hellip;', 'd16045de8df8baa762a799e08060c092', 1, 1, 0, 57, '2015-05-05 14:18:00', '2025-02-25 15:00:24'),
(57, '2015-07-05 16:19:00', 'Neue Fineliner Bilder gesichtet...', 1, 1, 'Unter Images->Fineliner7 wurden neue Bilder gesichtet.  \nHope you enjoy the Ride ;)', 'Unter Images->Fineliner7 wurden neue Bilder gesichtet.  \nHope you enjoy the Ride ;)     ', '63baa31298a1aaee60c28da6a2413da4', 1, 1, 0, 58, '2015-07-05 14:19:00', '2025-02-25 15:00:24'),
(58, '2015-07-19 17:21:00', 'Shopping Tour in NeumÃ¼nster', 3, 1, 'waren am Samstag Shoppen in der Innenstadt von NeumÃ¼nster und ich hab mir ein Paar neue Sneakers gekauft.  \nLÃ¤uft sich gut in den Schuhen...  \n  \nAnbei ein Photo der Schuhe.  \nstay in tuned, Asario', 'waren am Samstag Shoppen in der Innenstadt von NeumÃ¼nster und ich hab mir ein Paar neue Sneakers gekauft.  \nLÃ¤uft sich gut in den Schuhen...  \n  \nAnbei ein Photo der Schuhe.  \nstay in tuned, Asario   ', '513db49bd8cf3759191db7ce7a2b9812', 1, 1, 0, 59, '2015-07-19 15:21:00', '2025-02-25 15:00:24'),
(59, '2015-08-04 16:13:00', 'Haare AB!', 3, 1, 'Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.  \nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.  \n  \nEndlich wieder ohne Schmerzen kÃ¤mmen und mehr Substanz.  \nNaja, muss man sich noch dran gewÃ¶hnen... ;)  \nAber es sieht schon besser aus.', 'Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.  \nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.  \n  \nEndlich wieder ohne Schmerzen kÃ¤mmen und mehr Substanz.  \nNaja, muss man sich noch dran gewÃ¶hnen... ;)  \nAber es sieht schon besser aus. &hellip;', '6e2747bb90d1b11d251cc27118042f34', 1, 1, 0, 60, '2015-08-04 14:13:00', '2025-02-25 15:00:24'),
(60, '2015-08-30 18:26:00', 'Ricklinger Jahresfest 2015', 1, 1, 'Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.  \nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.  \nWÃ¼nsche viel SpaÃŸ mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.  \n  \nalso bis Sonntag, euer Asario', 'Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.  \nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.  \nWÃ¼nsche viel SpaÃŸ mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.  \n  \nalso bis Sonntag, euer Asario &hellip;', '280555b8e500cbdca762d5d38203bd00', 1, 1, 0, 61, '2015-08-30 16:26:00', '2025-02-25 15:00:24'),
(61, '2015-09-06 17:29:00', 'MCS v. 1.85 ist eingetroffen....', 2, 1, 'Mal wieder wurde MCS erneuert.  \nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  \nEinige Formularelemente wurden mit Material Design aktualisiert.  \nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  \n  \nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien zum Hochladen in die Update Ordner zu schieben.  \n  \nAußerdem ist ein interner Chat entstanden.  \n  \nwünsche viel Spaß mit MCS v. 1.85 ;)  \nPS.: Momentan arbeite ich an der Integration von JQuery UI Elementen in das Admin Center.  \nsee you soon, Paule aka Asario', 'Mal wieder wurde MCS erneuert.  \nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  \nEinige Formularelemente wurden mit Material Design aktualisiert.  \nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  \n  \nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien &hellip;', 'b014f7a6285afeefee08a0c737f7294e', 1, 1, 0, 1, '2015-09-06 15:29:00', '2025-02-25 15:00:24'),
(62, '2015-09-15 16:44:00', 'Neue Shortstories', 1, 1, 'Hab mal wieder nen paar Shortstories  \nhochgeladen. Ich will mal hoffen das  \neuch die gefallen.  \nPS: JQuery UI hÃ¤lt Einzug in MCS. weitere Infos demnÃ¤chst im Devlog.', 'Hab mal wieder nen paar Shortstories  \nhochgeladen. Ich will mal hoffen das  \neuch die gefallen.  \nPS: JQuery UI hÃ¤lt Einzug in MCS. weitere Infos demnÃ¤chst im Devlog.   ', '3dd943a29233263cc87ef57fb718bb50', 1, 1, 0, 63, '2015-09-15 14:44:00', '2025-02-25 15:00:24'),
(63, '2015-10-04 18:03:00', 'Neuerungen dank JQuery UI', 2, 1, 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  \n  \nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  \nIch musste alles was auf einzelnen extra Seiten war auf eine Seite reduzieren und die Verlinkung anpassen.  \n  \nAber alles in allem hat es sich gelohnt. Sieht Jetzt Stylischer aus und geht alles sehr viel schneller.  \nHab natürlich beim proggen etliche Bugs verursacht die ich mühsam finden und beseitigen musste.  \n  \nEin nettes Schmankerl ist auch die neue Shortstories Seite.  \n  \naber jetzt müsste eigentlich alles funken. wenn euch noch was auffällt schreibt mir ne PM oder mailt mir einfach über das Mailformular.  \n  \nAch ja, Die Hilfe Seite hab ich komplett neu geschrieben und dabei ca. 80 Zeilen Code eingespart. Klingt nicht nach viel aber bei einem Vergleichsweise kleinem Script ist das schon ne Menge.  \n  \nPS: In den Privaten Nachrichten sind Smilies mit dabei.  \n  \nBis Bald Asario.', 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  \n  \nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  \nIch musste alles was auf einzelnen extra Seiten war auf &hellip;', 'de8c2fd9afb6f1a198fcf049d2289cc1', 1, 1, 0, 1, '2015-10-04 16:03:00', '2025-02-25 15:00:24'),
(64, '2015-10-13 16:50:00', 'JQuery UI integrated', 1, 1, 'Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.  \nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.  \nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.  \nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.  \nAnsonsten ist noch alles Banane in Big Bad Bottermilk BimÃ¶hlen.', 'Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.  \nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.  \nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.  \nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.  \nAnsonsten &hellip;', '3cc4f6f7cececc7848983b2a9e8c829a', 1, 1, 0, 65, '2015-10-13 14:50:00', '2025-02-25 15:00:24'),
(65, '2015-10-27 17:00:00', 'Die Kundenzufriedenheitsumfrage ;)', 3, 1, 'Ich will von euch wissen was euch auf meiner Seite fehlt.  \nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?  \nHabt ihr ne Idee fÃ¼r meine Seite ?  \nSoll ich einen Chat programmieren oder doch nen GÃ¤stebuch integrieren ?  \nIhr entscheidend was ich einbaue.  \nOder solls vielleicht ne Shoutbox sein ?  \n  \nIDEEN RAN, ABER FLOTT ;)', 'Ich will von euch wissen was euch auf meiner Seite fehlt.  \nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?  \nHabt ihr ne Idee fÃ¼r meine Seite ?  \nSoll ich einen Chat programmieren oder doch nen GÃ¤stebuch integrieren ?  \nIhr entscheidend was ich einbaue.  \nOder solls &hellip;', '73c99e6563172cafad2a2d00291385c0', 1, 1, 0, 1, '2015-10-27 16:00:00', '2025-02-25 15:00:24'),
(66, '2015-10-27 17:02:00', 'Neues Kleid fÃ¼r alte GerÃ¼ste.', 1, 1, 'Jetzt erstrahlt auch die Startseite in freundlichen Orange.  \nIch habe einen Ã¼blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.  \nIch hoffe alles funktioniert jetzt so wie gewÃ¼nscht.  \nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.  \nIch hoffe Ihr genieÃŸt den \\\"Ritt\\\" auf der AB Welle ;)  \nSincerly Yours Asario', 'Jetzt erstrahlt auch die Startseite in freundlichen Orange.  \nIch habe einen Ã¼blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.  \nIch hoffe alles funktioniert jetzt so wie gewÃ¼nscht.  \nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.  \nIch hoffe Ihr genieÃŸt den &hellip;', 'c0d653839c756e1d41512cb7f8fd1533', 1, 1, 0, 67, '2015-10-27 16:02:00', '2025-02-25 15:00:24'),
(67, '2015-11-24 18:37:00', 'Meine Karriere zum freiwilligen Webdesigner und die Zunkunft...', 3, 1, 'Alles fing im Informatikunterricht in der 9./10. Klasse an.  \nWir lernten das Erstellen von Websites mit Microsoft Frontpage.  \nIch war sofort begeistert wie einfach man Websites erstellen kann.  \nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.  \nPHP ist eine einfach zu erlernende Scriptsprache die meine Ideen aufsog wie ein nasser Schwamm.  \n  \nNach einigen Jahren Programmiererfahrung entstand MCS, mein noch heute im Einsatz befindliches System, das **Marble Content System**  \nEine Vorlagen Engine sowie eine umfangreiche Administration entstanden in den darauffolgenden Jahren.  \nMittlerweile ist alles vom Portal bis zur Web-Visitenkarte machbar.  \nIch integrierte etliches nützliches aus meiner C\'t und bin immer noch am Arbeiten, neue Module zu erfinden bzw. alte zu verbessern  \n  \nIm Admin Center geht es los. Inhalte Einpflegen, Tabelleneinstellungen, Vorlagen Einstellungen, Benutzerprofile, Benutzerinhalte, Benutzergruppen und Rechte,  \nNewsletter, Kontakte, Kalender, Private Nachrichten uvm.  \n  \nMomentan habe ich 3 Javascript Frameworks installiert, die Entweder aufhübschen oder Funktionen nachrüsten.  \nJQuery UI, Foundation, Material Framework sind bei mir auf der ein oder anderen MCS-Seite installiert.  \n  \nMomentan läuft MCS auf 8 Webseiten in meinem Webspace.  \n  \nViele fragen sich, warum das Rad neu erfinden? Ich meine Wordpress, Typo3 oder Drupal können doch auch alles.  \nDoch selbst ein älteres Mambo hat 60% Mehr Code als MCS  \nEngines wie Smarty die mal eben 6000 Zeilen Code fressen wollte ich nicht integrieren.  \nmeine Vorlagen Engine hat mit 474 Zeilen weniger Gewicht als Hochgezüchtete CMS\'es und ist dennoch funktional.  \n  \nDer Vorteil an MCS ist dass man die HTML Vorlagen mit einem Wysiwyg Editor komplett erstellen kann weil sie reines HTML sind.  \nAngereichert mit in PHP geschriebenen Modulen und Funktionen sind sie hochdynamisch und schnell.  \nWollt Ihr/ Willst du schon immer eine eigene Website haben wo du dich über dein Hobby oder dein Lieblingsthema auslassen willst so schreib mir doch über das [Kontaktformular](kontakt) falls du eine interessante Idee für eine Homepage hast. Ich freue mich über jede Anregung oder Idee.  \n  \nForum, Chat, Shoutbox, Kommentare, Gästebücher sowie Bildergalerien, Texte, Fotos, Suchfunktion, RSS Stream, Smartphone Unterstützung uvm, wurden bereits Entwickelt und in MCS integriert. Wenn dir auch für meine Seite eine Idee einfällt schreib mir über das [Kontakformular](kontakt)  \n  \nMCS is ready to Launch.', 'Alles fing im Informatikunterricht in der 9./10. Klasse an.  \nWir lernten das Erstellen von Websites mit Microsoft Frontpage.  \nIch war sofort begeistert wie einfach man Websites erstellen kann.  \nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.  \nPHP ist eine einfach zu &hellip;', '7d1a12c9a210465499f9245cb03a0895', 2, 1, 0, 1, '2015-11-24 17:37:00', '2025-02-25 15:00:24'),
(68, '2015-12-18 19:17:00', 'Neue Galerie und einige nette Details', 1, 1, 'Habe eine neue Galerie mit Zentangles erstellt.  \nDa findet Ihr meine Fortschritte beim Tanglen.  \nAuÃŸerdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.  \nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gekÃ¼rzt aufgezeichnet werden.  \nPiwik ist ein Statistiktool zum Auswerten der Besuche auf dem Server.  \nIhr kÃ¶nnt jederzeit Ã¼ber die fx_lxk(index.php?page=datenschutz|||Datenschutz) Einstellungen das Tracking deaktivieren.  \nDie Statistischen Daten dienen der Verbesserung des Angebotes und sind Indikatoren fÃ¼r BesucherstrÃ¶me.  \nWÃ¼nsche viel SpaÃŸ mit meinen Seiten, In Liebe, Asario', 'Habe eine neue Galerie mit Zentangles erstellt.  \nDa findet Ihr meine Fortschritte beim Tanglen.  \nAuÃŸerdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.  \nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gekÃ¼rzt aufgezeichnet werden.  &hellip;', 'e60250a712dc052264ba132e72fa1466', 1, 1, 0, 69, '2015-12-18 18:17:00', '2025-02-25 15:00:24');
INSERT INTO `blogs` (`id`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `slug`, `reading_time`, `markdown_on`, `xis_aiImage`, `blog_images_iid`, `created_at`, `updated_at`) VALUES
(69, '2016-01-03 17:15:00', 'Happy New Year', 1, 1, 'Ich wÃ¼nsche allen Besuchern gut reingerutscht zu sein.  \nIch hoffe Ihr habt nicht zu viel Zugenommen Ã¼ber die Feiertage und seit gut reingerutscht  \nNatÃ¼rlich hoffen wir das wir alle Gesund bleiben,  \nund Erfolg im Beruf haben sowie das dieses ein glÃ¼ckliches Jahr wird', 'Ich wÃ¼nsche allen Besuchern gut reingerutscht zu sein.  \nIch hoffe Ihr habt nicht zu viel Zugenommen Ã¼ber die Feiertage und seit gut reingerutscht  \nNatÃ¼rlich hoffen wir das wir alle Gesund bleiben,  \nund Erfolg im Beruf haben sowie das dieses ein glÃ¼ckliches Jahr wird  ', '6d713031cd29f69c679de72c234e45aa', 1, 1, 0, 70, '2016-01-03 16:15:00', '2025-02-25 15:00:24'),
(70, '2016-01-15 18:10:00', '2 neue Galerien gefunden', 1, 1, 'Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃ¶ffentlicht.  \nIn der Galerie Photos4 findet Ihr meine neusten Fotos.  \nBei der 2ten Galerie dreht sich alles um Fasermalerbilder  \nStÃ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich fÃ¼ge demnÃ¤chst neue Bilder hinzu.  \nIch mÃ¶chte noch mal auf Mindblog hinweisen wo Ihr Mitspracherecht bekommt was Ihr euch fÃ¼r 2016 von mir WÃ¼nscht.  \n  \nAlso bis bald, Asario', 'Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃ¶ffentlicht.  \nIn der Galerie Photos4 findet Ihr meine neusten Fotos.  \nBei der 2ten Galerie dreht sich alles um Fasermalerbilder  \nStÃ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich fÃ¼ge demnÃ¤chst neue Bilder hinzu.  \nIch mÃ¶chte &hellip;', 'aee1c348eb7cf5136da764b9224a1bd1', 1, 1, 0, 71, '2016-01-15 17:10:00', '2025-02-25 15:00:24'),
(71, '2016-02-09 18:55:00', 'Neue Domain VerfÃ¼gbar.', 1, 1, 'An alle Fans hier der Tipp des Jahres:  \nwww.asario.de statt ab.marblefx.de.  \nAlso noch mal zum Mitschreiben www.asario.de ist Online ......  \n  \nWÃ¼nsche viel SpaÃŸ auf meiner Seite.', 'An alle Fans hier der Tipp des Jahres:  \nwww.asario.de statt ab.marblefx.de.  \nAlso noch mal zum Mitschreiben www.asario.de ist Online ......  \n  \nWÃ¼nsche viel SpaÃŸ auf meiner Seite.   ', '880158f6c6cb1227f2d60352383197c0', 1, 1, 0, 72, '2016-02-09 17:55:00', '2025-02-25 15:00:24'),
(72, '2016-04-01 16:43:00', 'Ich habe 4 neue Bilder gemalt', 1, 1, 'Ihr findet Sie unter [Images->Fasermaler](index.php?page=images&action=cat&id=21) sowie unter [Images->Fineliner7](index.php?page=images&action=cat&id=17).  \nWÃ¼nsche viel SpaÃŸ mit den Bildern.  \nmfg Asario', 'Ihr findet Sie unter [Images->Fasermaler](index.php?page=images&action=cat&id=21) sowie unter [Images->Fineliner7](index.php?page=images&action=cat&id=17).  \nWÃ¼nsche viel SpaÃŸ mit den Bildern.  \nmfg Asario  ', '57b3caff9a947fbc7cb256e5f243f269', 1, 1, 0, 73, '2016-04-01 14:43:00', '2025-02-25 15:00:24'),
(73, '2016-05-17 16:16:00', 'Neues Wallpaper', 1, 1, 'Ein neues Wallpaper wurde unter Images->Digital gesichtet.  \nAusserdem wurde das Upload Script Ã¼berarbeitet.  \nMehr dazu demnÃ¤chst im Changelog und unter Devlog.', 'Ein neues Wallpaper wurde unter Images->Digital gesichtet.  \nAusserdem wurde das Upload Script Ã¼berarbeitet.  \nMehr dazu demnÃ¤chst im Changelog und unter Devlog.   ', '5d955a2a5671383fb26017fbe49b5408', 1, 1, 0, 74, '2016-05-17 14:16:00', '2025-02-25 15:00:24'),
(74, '2016-05-24 16:50:00', 'MCS Version 1.98 erschienen', 2, 1, 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  \n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  \n2. Countpixel zur Besucheranalyse wurden integriert.  \n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  \n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r einzelne Galerien erweitert,  \nd.h. je nach gewÃ¤hlter Galerie sind unterschiedliche StandardgrÃ¶ÃŸen einstellbar', 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  \n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  \n2. Countpixel zur Besucheranalyse wurden integriert.  \n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  \n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r &hellip;', 'aaa52c8c69e17a2992bbf1ba928f6a67', 1, 1, 0, 1, '2016-05-24 14:50:00', '2025-02-25 15:00:24'),
(75, '2016-06-14 17:04:00', 'Diverse neue Bilder', 1, 1, 'Ich habe mal wieder Bilder hochgeladen.  \nIhr findet die Objekte unter [Images](index.php?page=images)  \nIch wÃ¼nsche euch viel SpaÃŸ damit.  \nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.  \nIch wÃ¼nsche euch viel SpaÃŸ auf meiner Seite.  \nBis bald, Asario.', 'Ich habe mal wieder Bilder hochgeladen.  \nIhr findet die Objekte unter [Images](index.php?page=images)  \nIch wÃ¼nsche euch viel SpaÃŸ damit.  \nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.  \nIch wÃ¼nsche euch viel SpaÃŸ &hellip;', '232badc78c7d74110fbd0fc9d319a2c5', 1, 1, 0, 76, '2016-06-14 15:04:00', '2025-02-25 15:00:24'),
(76, '2016-06-28 16:57:00', 'MCS Version 2.01', 2, 1, 'Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,  \nAlles im Sinne von 2.01 ;)  \nWÃ¼nsche viel Spass, Asario', 'Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,  \nAlles im Sinne von 2.01 ;)  \nWÃ¼nsche viel Spass, Asario &hellip;', 'efdee83d10af6f3429f05a19a518bfce', 1, 1, 0, 77, '2016-06-28 14:57:00', '2025-02-25 15:00:24'),
(77, '2016-07-04 15:12:00', 'Neuerungen in MCS 2.01', 2, 1, 'Es ist mal wieder was von der MCS Front zu berichten.  \nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  \nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  \nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die VerknÃ¼pfung  \nder Bilder erneuern/reparieren.  \nEben ist mir bzw Mumbo ein Fehler beim PM Script aufgefallen den ich ebenso gefixt hab.  \nSinn und zweck der Kanonischen URL\'s ist es den Seitennamen zu vereinfachen/zu verkÃ¼rzen.  \nSo wird aus www.asario.de/index.php?page=news -> www.asario.de/news was fÃ¼r Suchmaschinen  \nideal ist und auch leichter zu merken ist.  \nBin zwar noch nicht zufrieden mit den Kanonischen URL\'s aber da fÃ¤llt mir auch noch was ein.  \nHoffe Ihr habt SpaÃŸ auf meinen Seiten...  \nin Love Asario', 'Es ist mal wieder was von der MCS Front zu berichten.  \nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  \nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  \nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die &hellip;', '852cded0f6d19bc7f59a0c6b983d21d2', 1, 1, 0, 1, '2016-07-04 13:12:00', '2025-02-25 15:00:24'),
(78, '2016-07-08 18:14:00', 'Burzeltach und seine Folgen...', 3, 1, 'Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.  \r\nund habe mir selber ein großes Geschenk gemacht.  \r\nIch habe eine nicht nennenswerte Summe Geld investiert und  \r\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)  \r\nAuf dem Foto ist hoffentlich mein 2tes großes Geschenk zu sehen.  \r\nEin Pinsel-Set zum professionellem Malen im Maleratelier und bei mir zu Hause.  \r\nDemnächst ist Mighty Crab Online (Unter [www.asario.de/ausgemaltes](ausgemaltes) bald zu sehen)  \r\nDenn das Zen-Color Buch von meiner Schwester ist mit guten Motiven gespickt, so das ich hin und wieder mal was ausmale und unter [Images->Ausgemaltes](ausgemaltes) veröffentliche.', 'Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.  \r\nund habe mir selber ein großes Geschenk gemacht.  \r\nIch habe eine nicht nennenswerte Summe Geld investiert und  \r\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)  \r\nAuf dem Foto ist hoffentlich mein 2tes großes Geschenk zu &hellip;', '9b9518a9870c96e3f65d8c2e71802afe', 1, 1, 0, 79, '2016-07-08 16:14:00', '2025-02-25 15:00:24'),
(79, '2016-07-08 18:16:00', 'Asario\'s Geschichte Part II', 0, 1, 'So da wÃƒÂ¤ren wir nun.  \nWir haben eine zerÃƒÂ¼ttet Familie, ein Haufen Chaoten und jede Menge Party.  \nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.  \nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.  \n  \nIch fing eine Ausbildung zum Kaufmann fÃƒÂ¼r Audiovisuelle Medien an und nach 1,5 Jahren ging ich nicht mehr hin, weil mir alles zu viel wurde.  \nIrgendwann quartierte mich meine Mutter aus und ich zog in ein Neubauviertel in Potsdam.  \n  \nNach anderthalb Jahren im \"RattenkÃƒÂ¤fig\" fing bei mir alles an sich zu ÃƒÂ¤ndern. Ich bekam komische Nachrichten per Telepathie und zog mich immer weiter ZurÃƒÂ¼ck.  \nIn Wahrheit bekam ich eine Psychose und wurde Psychisch Krank.  \n  \nSchizophrenie die Diagnose der Ãƒâ€žrzte schockte mich schon ganz schÃƒÂ¶n.  \nDie ersten Jahre mit der Krankheit dachte ich ich wÃƒÂ¤hr gesund nur irgendwann wurde mir klar das man diese Krankheit zwar beherrschen aber nicht heilen kann.  \n  \nSo nun bin ich halt krank, na und ?  \nIch versuche das Beste draus zu machen und bin seit ein paar Jahren ziemlich stabil.  \n  \nto be continued...', 'So da wÃƒÂ¤ren wir nun.  \nWir haben eine zerÃƒÂ¼ttet Familie, ein Haufen Chaoten und jede Menge Party.  \nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.  \nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.  \n  \nIch fing eine Ausbildung zum &hellip;', '31effc4d2d137ef6176b6520bccb3651', 1, 1, 0, 1, '2016-07-08 16:16:00', '2025-02-25 15:00:24'),
(80, '2016-08-24 08:20:00', 'Neue Galerie vorhanden.', 1, 1, 'Ich habe ja wie bereits erwÃ¤hnt ein Ausmalbuch \"Zen Colour Ocean\" zum Geburtstag  \nbekommen. Hier und jetzt kÃ¶nnt Ihr meine Werke bewundern.  \nViel SpaÃŸ, Asario', 'Ich habe ja wie bereits erwÃ¤hnt ein Ausmalbuch \"Zen Colour Ocean\" zum Geburtstag  \nbekommen. Hier und jetzt kÃ¶nnt Ihr meine Werke bewundern.  \nViel SpaÃŸ, Asario    ', 'e34d1a4e246be87bd40ed9fef8063586', 1, 1, 0, 81, '2016-08-24 06:20:00', '2025-02-25 15:00:24'),
(81, '2016-10-08 18:07:00', 'Neuerungen unter der Haube', 2, 1, 'Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.  \nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.  \nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte verÃ¤ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen Webspace.  \nSomit muss ich mich nicht mit Datenbank Dumps rumÃ¤rgern und habe alle Seiten immer aktuell. Momentan schraube ich noch am RSS-Feed, der irgendwie noch nicht mit dem Sync-Client kompatibel scheint.  \nAber gut ding will Weile haben, oder wie man auch sagt: Was lange Wert, wird endlich gut.  \nIn diesem Sinne, Have Fun Folks.', 'Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.  \nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.  \nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte verÃ¤ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen &hellip;', '295718e2c50a890aa96304e38ce208a9', 1, 1, 0, 82, '2016-10-08 16:07:00', '2025-02-25 15:00:24'),
(82, '2016-12-19 17:24:00', 'Merry X-Mas', 1, 1, 'Ich wÃ¼nsche allen Fans ein besinnliches und schÃ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im nÃ¤chsten Jahr alles GlÃ¼ck der Welt haben und Fit sind wie im Letzten Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, Berlin und Potsdam wÃ¼nscht euer Asario.', 'Ich wÃ¼nsche allen Fans ein besinnliches und schÃ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im nÃ¤chsten Jahr alles GlÃ¼ck der Welt haben und Fit sind wie im Letzten Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, Berlin und Potsdam wÃ¼nscht euer Asario. &hellip;', 'ca4dacc573395b1d0f7364f113924e58', 1, 1, 0, 83, '2016-12-19 16:24:00', '2025-02-25 15:00:24'),
(83, '2017-01-25 08:37:00', 'Big Exceptions', 1, 1, 'Die Erwartung ist groÃŸ, ich hoffe sie enttÃ¤uscht euch nicht.  \nHab mal wieder was ausgemalt, zu finden unter Images->Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demnÃ¤chst hier reinflattern wird.  \nich hoffe Ihr mÃ¶gt Quallen, denn mein aktuellstes Werk heiÃŸt Jellyfish, hat aber im Grunde genommen keine Ã„hnlichkeit mit einer Qualle.  \nAch ja, vielleicht ist es euch schon Aufgefallen, Ich habe ein paar Layout Ã„nderungen unter **Images**, **Devlog**, **Mindblog** und **Shortstories** vorgenommen. Ich hoffe Ihr mÃ¶gt es..  \nPS: Die Bewertung von Bildern habe ich etwas verÃ¤ndert, aber lasst euch davon nicht abschrecken zu Voten...  \nAch ja, bevor ichs vergesse, MCS wurde auf Version 2.15 gepatcht.  \nenjoy the ride, Asario', 'Die Erwartung ist groÃŸ, ich hoffe sie enttÃ¤uscht euch nicht.  \nHab mal wieder was ausgemalt, zu finden unter Images->Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demnÃ¤chst hier reinflattern wird.  \nich hoffe Ihr mÃ¶gt Quallen, denn mein aktuellstes Werk heiÃŸt Jellyfish, hat aber im &hellip;', 'f62d71e05eaaaeee1830e93de829bdfc', 1, 1, 0, 84, '2017-01-25 07:37:00', '2025-02-25 15:00:24'),
(84, '2017-01-25 10:17:00', 'MCS Version 2.15', 2, 1, 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  \nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  \nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  \nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige kleinere Updates vorgenommen. Unter anderem habe ich ein paar Bugs im Synchro-Tool beseitigt.  \nIch muss demnÃ¤chst noch die RSS-Feeds kontrollieren, hab dazu bis jetzt noch keine Zeit gehabt.  \nAuch dieses mal wÃ¼nsche ich eine schÃ¶ne Zeit in meinem Blog.  \nmfg Asario', 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  \nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  \nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  \nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige &hellip;', '8a253c7421a6af37a39cc0a428921bb1', 1, 1, 0, 1, '2017-01-25 09:17:00', '2025-02-25 15:00:24'),
(85, '2017-01-29 14:48:00', 'MCS Points - die Smarte W&auml;hrung', 1, 1, 'Ab jetzt k&ouml;nnt ihr als registrierte Benutzer satte Pr&auml;mien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. F&uuml;r jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen k&ouml;nnt. Ihr erhaltet signierte original Kunstwerke f&uuml;r eure Butze oder zum Verschenken.\r\n\r\nfx_premium_table()', 'Ab jetzt k&ouml;nnt ihr als registrierte Benutzer satte Pr&auml;mien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. F&uuml;r jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen k&ouml;nnt. Ihr erhaltet signierte original Kunstwerke f&uuml;r &hellip;', '365ffd79c810a577c4a11c9650f77fa0', 1, 1, 0, 86, '2017-01-29 13:48:00', '2025-02-25 15:00:24'),
(86, '2017-02-19 12:37:00', 'Meine Privaten News', 3, 1, 'Ich Ã¼berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / möchte.  \nMeine Grafikkarte röhrt seit einigen Wochen, ich werde sie wohl ersetzen mÃ¼ssen.  \nDiesmal wird es wohl eine karte von NVIDIA sein.  \nschon falls ich es doch noch mal schaffe mich an Linux zu gewöhnen.  \nAußerdem sind die Nvidia Karten Sparsamer was den Energieverbrauch angeht.  \nWird wohl ne GF1060 werden. Mein Kollege Mumbo hat mir die schon empfohlen.  \nNun ja Eine neue Grafikkarte soll auch 4k-FÃ¤hig sein, falls ich mir noch nen 4k Monitor holen will.  \nDie sind zwar jetzt noch zu Teuer aber die Preise fallen mit der Zeit bekanntlich so dass sie bald erschwinglich sind.  \nNun ja alles klar auf der Andrea Doria.  \nEs ist schon Praktisch das die Dinger im Leerlauf die Lüfter anhalten können.  \nSo hab ich beim Programmieren von Websites immer einen leisen PC.  \nSchade das AMD und Linux nicht so ganz Harmonieren, hätte mir gern ne AMD Karte geholt.  \nAber man soll an die Zukunft denken.  \n  \nAch ja ich vergas doch glatt das ich mir ne Blu-Ray über Amy Winehouse gekauft habe.  \nIst echt Irre, was die so erlebt hat.  \nR.I.P. Amy.  \n  \nin diesem Sinne, Viel Spaß Asario', 'Ich Ã¼berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / möchte.  \nMeine Grafikkarte röhrt seit einigen Wochen, ich werde sie wohl ersetzen mÃ¼ssen.  \nDiesmal wird es wohl eine karte von NVIDIA sein.  \nschon falls ich es doch noch mal schaffe mich an Linux zu gewöhnen.  \nAußerdem sind die Nvidia Karten &hellip;', '5ff4c95c375b2a431736fe930943d7c9', 2, 1, 0, 1, '2017-02-19 11:37:00', '2025-02-25 15:00:24'),
(87, '2017-03-02 17:43:00', 'Jetzt aber...', 1, 1, 'Ich habe mal wieder was gebastelt. Unter [Benutzer](user) kÃ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.  \nUnd damit kÃ¶nnt ihr \"eure Leistung\" mit der der anderen vergleichen.  \nSoo, dann hab ich noch 2 neue Bilder Online gestellt zu finden unter [Images](images) in den Galerien Faser und Acryl. Siehe auch rechts oben auf dieser Seite.  \nViel Spass beim Statistiken guggen, in Love Asario', 'Ich habe mal wieder was gebastelt. Unter [Benutzer](user) kÃ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.  \nUnd damit kÃ¶nnt ihr \"eure Leistung\" mit der der anderen vergleichen.  \nSoo, dann hab ich noch 2 &hellip;', '757bf20782851c75ecb8bd9dba444858', 1, 1, 0, 88, '2017-03-02 16:43:00', '2025-02-25 15:00:24'),
(88, '2017-03-12 15:33:00', 'Neue Navigationsleiste', 1, 1, 'Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.  \nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen [meldet euch bei mir](kontakt).  \nViel SpaÃŸ in meinem Blog, in Love, Asario', 'Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.  \nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen [meldet euch bei mir](kontakt).  \nViel SpaÃŸ in meinem Blog, in Love, Asario &hellip;', '9cb937c35c7e5fdd10c5dc1909bf6839', 1, 1, 0, 89, '2017-03-12 14:33:00', '2025-02-25 15:00:24'),
(89, '2017-03-24 17:50:00', 'MultiLanguageSupport', 1, 1, 'Ab jetzt kÃ¶nnt ihr einige der Seiten in Englischer Sprache sehen.  \nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang fÃ¤hig. Einstellen der Sprache kÃ¶nnt ihr in der Navigation oben rechts.  \n  \nIch habe grad einen Ã¼blen Bug im Dateihochladescript gefunden...  \nmÃ¼sste jetzt wieder gehen.  \n  \nWÃ¼nsche viel SpaÃŸ damit. falls euch noch was einfÃ¤llt oder auffÃ¤llt schreibt es mir.  \n  \nKommentare, E-Mails oder PMs sind willkommen...  \nbis denne, Asario', 'Ab jetzt kÃ¶nnt ihr einige der Seiten in Englischer Sprache sehen.  \nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang fÃ¤hig. Einstellen der Sprache kÃ¶nnt ihr in der Navigation oben rechts.  \n  \nIch habe grad einen Ã¼blen Bug im Dateihochladescript gefunden...  \nmÃ¼sste &hellip;', '6b0c4368312086bfd14351921e87e7d1', 1, 1, 0, 90, '2017-03-24 16:50:00', '2025-02-25 15:00:24'),
(90, '2017-05-18 17:58:00', 'Das Warten hat ein Ende', 1, 1, 'Endlich habe ich mal wieder nen funzenden Web-Stick.  \nwie Ihr seht bin ich wieder Online unterwegs.  \nhabe ne lÃ¤ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.  \nHoffe Ihr habt SpaÃŸ mit meiner Seite.  \nwww.asario.de your finest Art Place ;)', 'Endlich habe ich mal wieder nen funzenden Web-Stick.  \nwie Ihr seht bin ich wieder Online unterwegs.  \nhabe ne lÃ¤ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.  \nHoffe Ihr habt SpaÃŸ mit meiner Seite.  \nwww.asario.de your finest Art Place ;)  ', '2393b4dce774f7208fbff4759e451cd2', 1, 1, 0, 91, '2017-05-18 15:58:00', '2025-02-25 15:00:24'),
(91, '2017-05-26 07:13:00', 'Die Version 2.35 von MCS wurde aktualisiert.', 2, 1, 'Mal wieder habe ich eine neue Version veröffentlicht.  \nDie größte Änderung betrifft die Übersicht der Tabelle.  \nHier kann man nun per Drag & Drop Einträge sortieren.  \nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  \nAußerdem habe ich diverse Bugs in einigen Modulen gestopft.  \nEin übler Bug im Kontaktformular wurde soeben gefixt.  \nIhr könnt mir wieder Mails schreiben...  \nmehr Infos wie immer im Changelog.', 'Mal wieder habe ich eine neue Version veröffentlicht.  \nDie größte Änderung betrifft die Übersicht der Tabelle.  \nHier kann man nun per Drag & Drop Einträge sortieren.  \nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  \nAußerdem habe ich diverse Bugs in einigen &hellip;', '157ceb16f673cc1da07b675e2bdb6177', 1, 1, 0, 1, '2017-05-26 05:13:00', '2025-02-25 15:00:24'),
(92, '2017-05-28 17:09:00', 'Neue Galerie gesichtet', 1, 1, 'Ab jetzt kÃ¶nnt ihr getÃ¶pferte Kunstwerke von mir sehen.  \nUnter [http://www.asario.de/ton](ton) findet ihr meine vorrangig Viereckigen GegenstÃ¤nden.  \nHabe bis jetzt einen Aschenbecher in der Mache.', 'Ab jetzt kÃ¶nnt ihr getÃ¶pferte Kunstwerke von mir sehen.  \nUnter [http://www.asario.de/ton](ton) findet ihr meine vorrangig Viereckigen GegenstÃ¤nden.  \nHabe bis jetzt einen Aschenbecher in der Mache.   ', '34c06f70c3165643804c25771252adaa', 1, 1, 0, 93, '2017-05-28 15:09:00', '2025-02-25 15:00:24'),
(93, '2017-06-17 15:56:00', 'Herzlichen GlÃ¼ckwunsch', 1, 1, 'Mal wieder jÃ¤hrt sich der Tag an dem ich Ã¤lter werde.  \nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.  \nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.  \nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.  \nIch hoffe Ihr seid nicht Einsam.  \n  \nIn Love, Asario', 'Mal wieder jÃ¤hrt sich der Tag an dem ich Ã¤lter werde.  \nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.  \nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.  \nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.  \nIch hoffe Ihr seid nicht &hellip;', '76015a7c33e8df7d6a5c9b56f72cedea', 1, 1, 0, 94, '2017-06-17 13:56:00', '2025-02-25 15:00:24'),
(94, '2017-06-20 17:45:00', 'Meine Geschenke....', 3, 1, 'Ich bin jetzt Besitzer eines Schafes in Afghanistan.\nIch hoffe das die Familie viel Milch und Wolle ernten kann. \nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage. \nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.\nBestellt euch doch auch so ein Schaf.  \n\nAußerdem habe ich noch ein Buch und einen neuen Rucksack geschenkt bekommen. Und jede Menge Tee war auch dabei.  \n\nThx Ianosaurus & Chinagirl', 'Ich bin jetzt Besitzer eines Schafes in Afghanistan.\nIch hoffe das die Familie viel Milch und Wolle ernten kann. \nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage. \nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.\nBestellt euch doch auch so ein Schaf.  \n\nAußerdem &hellip;', '5cd1f4137ac80edb6e2a1f27413b5c6b', 1, 1, 0, 1, '2017-06-20 15:45:00', '2025-02-25 15:00:24'),
(95, '2017-06-30 18:07:00', 'Internationalisierung vorangetrieben', 1, 1, 'Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.  \nIch bin fleissig am Ãœbersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlieÃŸlich auch noch nebenbei BrÃ¶tchen verdienen.  \nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.  \n  \nDa Google Translate nur Bullshit bringt muss ich alles von Hand Ã¼bersetzen was bei meinem Schulenglisch gar nicht so leicht ist...  \n  \nHoffe Ihr Muttersprachler verzeiht mir meine Faux Pas.  \n  \nNeu dazugekommen ist der Englische Newsfeed unter [http://www.feeds.marblefx.de/ab.en.xml](http://www.feeds.marblefx.de/ab.en.xml)  \nin Love, Asario', 'Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.  \nIch bin fleissig am Ãœbersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlieÃŸlich auch noch nebenbei BrÃ¶tchen verdienen.  \nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.  \n  \nDa &hellip;', 'f2c79d61e9a4471ca1efa9b5a6b81439', 1, 1, 0, 96, '2017-06-30 16:07:00', '2025-02-25 15:00:24'),
(96, '2017-07-07 16:26:00', 'Habe mal wieder geschraubt.', 1, 1, 'Ab Sofort kÃ¶nnt Ihr miteinander Chatten.  \nSobald auÃŸer euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.  \nIch hoffe Ihr habt mal das GlÃ¼ck jemand im Chat zu begegnen.  \nWÃ¼nsche Viel SpaÃŸ, in Love Asario', 'Ab Sofort kÃ¶nnt Ihr miteinander Chatten.  \nSobald auÃŸer euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.  \nIch hoffe Ihr habt mal das GlÃ¼ck jemand im Chat zu begegnen.  \nWÃ¼nsche Viel SpaÃŸ, in Love Asario  ', '06be608eb231652b0edb13f0a9cb6e71', 1, 1, 0, 97, '2017-07-07 14:26:00', '2025-02-25 15:00:24'),
(97, '2017-07-11 16:44:00', 'Neue Version auf alten Gleisen', 2, 1, 'MCS Version 2.45 ist erschienen.  \nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  \nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  \nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  \nAch ja, ich arbeite an den ersten Landingpages fÃ¼r Asarios Blog und musste deswegen an der Grundstruktur der Seiten arbeiten.  \nViel SpaÃŸ damit, Asario', 'MCS Version 2.45 ist erschienen.  \nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  \nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  \nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  \nAch ja, ich &hellip;', '0967d62106eae0a8aac3b376810ecbfb', 1, 1, 0, 1, '2017-07-11 14:44:00', '2025-02-25 15:00:24'),
(98, '2018-05-01 16:53:00', 'Layoutveränderung 2.0', 1, 1, 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf Mobilgeräten besser zu benutzen das neue Layout.  \nHoffe Ihr habt Spaß damit.  \n  \nWünsche einen schönen Mai, Asario.', 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf Mobilgeräten besser zu benutzen das neue Layout.  \nHoffe Ihr habt Spaß damit.  \n  \nWünsche einen schönen Mai, Asario.', '337b711b698013d837964f37152b0910', 1, 1, 0, 115, '2018-05-01 14:53:00', '2017-07-29 14:06:00'),
(99, '2017-08-20 13:40:00', 'SSL Ãœberall', 1, 1, 'Herzlichen GlÃ¼hstrumpf, wir haben SSL aktivieren kÃ¶nnen.  \nDank Let\'s Encrypt ist jetzt alles sicher.  \nVielen Dank an 1blu die Let\'s Encrypt integriert haben.  \nWÃ¼nsche ein sicheres \"SURF\", Asario', 'Herzlichen GlÃ¼hstrumpf, wir haben SSL aktivieren kÃ¶nnen.  \nDank Let\'s Encrypt ist jetzt alles sicher.  \nVielen Dank an 1blu die Let\'s Encrypt integriert haben.  \nWÃ¼nsche ein sicheres \"SURF\", Asario   ', '5e715ff71afe5cd48b4177fc66cde9e1', 1, 1, 0, 100, '2017-08-20 11:40:00', '2025-02-25 15:00:24'),
(100, '2017-09-10 10:48:00', 'Neues auf meinem Blog', 1, 1, 'Ein kleines Detail hat sich auf meiner Seite verÃ¤ndert.  \nLinks vom Kommentar ist das Profilbild des Users zu finden.  \nWar ne recht schnelle Nummer das Umzusetzen.  \nSieht echt Schnieke aus so.', 'Ein kleines Detail hat sich auf meiner Seite verÃ¤ndert.  \nLinks vom Kommentar ist das Profilbild des Users zu finden.  \nWar ne recht schnelle Nummer das Umzusetzen.  \nSieht echt Schnieke aus so.   ', 'f6bd6c9ac0ba237b2dc86fb0e4b60ec2', 1, 1, 0, 101, '2017-09-10 08:48:00', '2025-02-25 15:00:24'),
(101, '2017-09-17 17:16:00', 'Neue Bilder gefunden', 1, 1, 'Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich wÃ¼nsche viel SpaÃŸ damit, Asario', 'Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich wÃ¼nsche viel SpaÃŸ damit, Asario    ', '1f347f9fa9db5b4dcdb4b182be72e19c', 1, 1, 0, 102, '2017-09-17 15:16:00', '2025-02-25 15:00:24'),
(102, '2017-10-14 17:08:00', 'Mein Praktikum', 1, 1, 'Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel SpaÃŸ und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.  \nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich auf ein Wiedersehen mit dem Team von Elan Nord.', 'Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel SpaÃŸ und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.  \nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich &hellip;', 'f5c2f68bbd34fa501bc97a0764a6d470', 1, 1, 0, 103, '2017-10-14 15:08:00', '2025-02-25 15:00:24'),
(103, '2017-10-29 11:56:00', 'Neuer Ascher', 1, 1, 'Joa, Ich hab mal wieder getÃ¶pfert...  \nEin Mederius Aschenbecher ist draus geworden.  \nVielen Dank an Ivonne & Ullrich, die das Teil fÃ¼r mich glasiert haben.  \nDemnÃ¤chst mach ich noch mal welche fÃ¼r die neue Aschenbecherlinie von Asario.', 'Joa, Ich hab mal wieder getÃ¶pfert...  \nEin Mederius Aschenbecher ist draus geworden.  \nVielen Dank an Ivonne & Ullrich, die das Teil fÃ¼r mich glasiert haben.  \nDemnÃ¤chst mach ich noch mal welche fÃ¼r die neue Aschenbecherlinie von Asario.  ', 'a8c56dce57df4255ef82a377ef07e4c7', 1, 1, 0, 104, '2017-10-29 10:56:00', '2025-02-25 15:00:24'),
(104, '2017-11-12 13:59:00', 'VerÃ¤ndertes Layout', 1, 1, 'Ich hab mal wieder am Design von www.asario.de geschraubt.  \nHope you enjoy.  \nKritiken bitte per Comment oder PM...  \nBis bald, Asario', 'Ich hab mal wieder am Design von www.asario.de geschraubt.  \nHope you enjoy.  \nKritiken bitte per Comment oder PM...  \nBis bald, Asario    ', '722c287fcb79e749b540cce686a657ed', 1, 1, 0, 105, '2017-11-12 12:59:00', '2025-02-25 15:00:24'),
(105, '2017-11-19 08:18:00', 'Neue Galerie', 1, 1, 'Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)', 'Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)  ', '271e892310700e7c44193545e45d9782', 1, 1, 0, 106, '2017-11-19 07:18:00', '2025-02-25 15:00:24'),
(106, '2017-12-20 08:10:00', 'Endlich wieder Online', 1, 1, 'Endlich funktioniert mein Surf Stick wieder.  \nWar ein paar Wochen Offline :(  \nIch wÃ¼nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.  \nHoffe 2018 wird noch besser als 2017.  \nBis bald, Paul aka Asario', 'Endlich funktioniert mein Surf Stick wieder.  \nWar ein paar Wochen Offline :(  \nIch wÃ¼nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.  \nHoffe 2018 wird noch besser als 2017.  \nBis bald, Paul aka Asario  ', '752146882b2582bc465b1d5dec1194b0', 1, 1, 0, 107, '2017-12-20 07:10:00', '2025-02-25 15:00:24'),
(107, '2018-01-28 08:17:00', 'Neue Monstar Pix', 1, 1, 'Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃ¶ffentlicht.  \nVielen Dank an Chinagirl & Ianosaurus.  \nViel Spass wÃ¼nscht Asario', 'Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃ¶ffentlicht.  \nVielen Dank an Chinagirl & Ianosaurus.  \nViel Spass wÃ¼nscht Asario    ', '63f93c5648bc383ea5ff3cfc54a496b0', 1, 1, 0, 108, '2018-01-28 07:17:00', '2025-02-25 15:00:24'),
(108, '2018-03-02 16:55:00', 'Shortstories wird zu Shortpoems', 1, 1, 'Die Shortstorie Rubrik wurde in Shortpoems umbenannt.  \nNach wie vor kÃ¶nnt Ihr mir WÃ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.  \n  \nFreu mich schon auf eure Poem-VorschlÃ¤ge.', 'Die Shortstorie Rubrik wurde in Shortpoems umbenannt.  \nNach wie vor kÃ¶nnt Ihr mir WÃ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.  \n  \nFreu mich schon auf eure Poem-VorschlÃ¤ge.   ', 'e470f64e50acb2bd485977186aacb81a', 1, 1, 0, 109, '2018-03-02 15:55:00', '2025-02-25 15:00:24'),
(109, '2018-04-02 14:26:00', 'Neue Kamera', 1, 1, 'Ich habe mir zu Ostern eine neue Kamera geleistet.  \nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.  \nWÃ¼nsche euch einen schÃ¶nen FrÃ¼hling.  \n  \nIn Liebe, Asario', 'Ich habe mir zu Ostern eine neue Kamera geleistet.  \nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.  \nWÃ¼nsche euch einen schÃ¶nen FrÃ¼hling.  \n  \nIn Liebe, Asario   ', 'a4edab5841632ac7d0232fce7305e132', 1, 1, 0, 110, '2018-04-02 12:26:00', '2025-02-25 15:00:24'),
(110, '2018-04-15 10:28:00', 'Neues Wallpaper @ Digital Galerie', 1, 1, 'Habe mal wieder ein Wallpaper kreiert. Ein grÃ¼nes mal wieder, denn GrÃ¼n ist die Hoffnung.  \nStay tuned, Asario', 'Habe mal wieder ein Wallpaper kreiert. Ein grÃ¼nes mal wieder, denn GrÃ¼n ist die Hoffnung.  \nStay tuned, Asario    ', '99680dec7d77de85e7d34499bb9cdf23', 1, 1, 0, 111, '2018-04-15 08:28:00', '2025-02-25 15:00:24'),
(111, '2018-04-18 17:32:00', 'Frickeleien am Code', 2, 1, 'Habe auch dieses mal einiges verbessert.  \nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  \nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  \n  \nAber es ist geschafft und ich bin Stolz auf meine Arbeit in die ich meine Feierabende investiert habe.  \n  \nHoffe Ihr genieÃŸt das schÃ¶ne Wetter.  \nIch geh jetzt raus mich sonnen.  \n  \nGRTZ from BimÃ¶hlen, Asario', 'Habe auch dieses mal einiges verbessert.  \nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  \nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  \n  \nAber es ist geschafft und ich bin Stolz &hellip;', 'ef9f2aa1577c19ebae1c579ba70041dc', 1, 1, 0, 1, '2018-04-18 15:32:00', '2025-02-25 15:00:24'),
(112, '2018-04-20 16:20:00', 'Ein bisschen leer hier', 3, 1, 'Hab lange nix mehr hier rein geschrieben.  \nIch genieße das schöne Wetter in SH.  \nSonne Satt und das im April, fast wie letztes Jahr.  \n  \nMomentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschloßen haben möchte.  \n  \nIst nur Organisatorischer Kram, aber der muss auch sein.  \n  \nBin echt zufrieden mit meiner Neuanschaffung, einer LUMIX TZ-71.  \ndas Studium des Handbuches steht auch noch auf meiner TODO-Liste.  \n  \nBin jetzt bei Seite 98 von 300. Aber ein paar Kamerafeatures sind echt gut.  \nMit freundlichen Grüßen, Asario', 'Hab lange nix mehr hier rein geschrieben.  \nIch genieße das schöne Wetter in SH.  \nSonne Satt und das im April, fast wie letztes Jahr.  \n  \nMomentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschloßen haben möchte.  \n  \nIst nur Organisatorischer Kram, aber der muss auch sein.  \n  &hellip;', 'b50f0b235bcc3e9f58dc6cfc619b13f6', 1, 1, 0, 1, '2018-04-20 14:20:00', '2025-02-25 15:00:24'),
(113, '2018-04-29 08:49:00', 'Mein Smartphone', 1, 1, 'Ich habe kÃ¼rzlich von einer netten Kollegin ein Smartphone fÃ¼r gÃ¼nstig ersteigert.  \nMusste jetzt auf allen Seiten meine Telefonnummer Ã¤ndern...  \nAber bis jetzt funktioniert das Internet noch nicht :(.  \nNaja, gut ding will Weile haben.', 'Ich habe kÃ¼rzlich von einer netten Kollegin ein Smartphone fÃ¼r gÃ¼nstig ersteigert.  \nMusste jetzt auf allen Seiten meine Telefonnummer Ã¤ndern...  \nAber bis jetzt funktioniert das Internet noch nicht :(.  \nNaja, gut ding will Weile haben.  ', '88e3e5245514398413170b9e98d80e7a', 1, 1, 0, 114, '2018-04-29 06:49:00', '2025-02-25 15:00:24'),
(114, '2018-05-01 16:53:00', 'Layoutveränderung 2.0', 1, 1, 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf Mobilgeräten besser zu benutzen das neue Layout.  \nHoffe Ihr habt Spaß damit.  \n  \nWÃ¼nsche einen schönen Mai, Asario.', 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf Mobilgeräten besser zu benutzen das neue Layout.  \nHoffe Ihr habt Spaß damit.  \n  \nWÃ¼nsche einen schönen Mai, Asario.', '337b711b698013d837964f37152b0910', 1, 1, 0, 115, '2018-05-01 14:53:00', '2018-05-01 14:53:00'),
(115, '2018-05-06 09:01:00', 'Neue Rubrik', 1, 1, 'Habe eine neue Rubrik auf meiner Seite veröffentlicht, sie heißt Did You Know und beschäftigt sich mit Unnützem Wissen.  \n  \nAber manchmal ist ne wissenswerte Info dabei.  \n  \nWünsche viel Spaß mit der Seite, Asario', 'Habe eine neue Rubrik auf meiner Seite veröffentlicht, sie heißt Did You Know und beschäftigt sich mit Unnützem Wissen.  \n  \nAber manchmal ist ne wissenswerte Info dabei.  \n  \nWünsche viel Spaß mit der Seite, Asario  ', 'f52abf24344d4436694cfbb0deace971', 1, 1, 0, 116, '2018-05-06 07:01:00', '2025-02-25 15:00:24'),
(116, '2018-05-13 08:02:00', 'Neue Wissensfragen auf DidYouKnow', 1, 1, 'Habe mal wieder ein paar Fragen online gestellt.  \nHoffe die sind lehrreich.  \nAußerdem kann man im PM Schreiben Menü jetzt nach Benutzern suchen.  \n  \nBis denne Penne, ich liebe Nudeln und gut.  \nAsario tut was er tut.', 'Habe mal wieder ein paar Fragen online gestellt.  \nHoffe die sind lehrreich.  \nAußerdem kann man im PM Schreiben Menü jetzt nach Benutzern suchen.  \n  \nBis denne Penne, ich liebe Nudeln und gut.  \nAsario tut was er tut.  ', 'fe747d146c02918323e6d444aa836e0f', 1, 1, 0, 117, '2018-05-13 06:02:00', '2025-02-25 15:00:24'),
(117, '2018-06-17 07:29:00', 'Mein 35ter Geburtstag', 1, 1, 'Herzlichen Glühstrumpf Asario.  \nWieder 1 Jahr älter geworden...  \nHabe mich selber schon am Samstag beschenkt.  \n1 Bluetooth Kopfhörer hab ich mir geleistet (von Sony).  \nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.  \n  \nKleine Änderung an der Seite...  \nIch habe die Fineliner Galerien 1-7 in eine Fineliner Galerie verpackt.  \n  \nIn diesem Sinne, habt Spaß, Asario', 'Herzlichen Glühstrumpf Asario.  \nWieder 1 Jahr älter geworden...  \nHabe mich selber schon am Samstag beschenkt.  \n1 Bluetooth Kopfhörer hab ich mir geleistet (von Sony).  \nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.  \n  \nKleine Änderung an der Seite...  \nIch habe die Fineliner Galerien 1-7 in &hellip;', '9a28e5a7b4fb278fc4044f15692e48ec', 1, 1, 0, 118, '2018-06-17 05:29:00', '2025-02-25 15:00:24'),
(118, '2018-06-30 06:38:00', 'Neuigkeiten auf Asarios Blog', 1, 1, 'Ab Jetzt habe ich die Photos Galerien in eine verpackt.  \nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.  \nAußerdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.  \nWünsche euch viel Spaß auf meiner Seite.  \nIn Love, Asario.', 'Ab Jetzt habe ich die Photos Galerien in eine verpackt.  \nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.  \nAußerdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.  \nWünsche euch viel Spaß auf meiner Seite.  \nIn Love, Asario.  ', '7ddb9e70c9b0ad7bc147ddae330d86e8', 1, 1, 0, 119, '2018-06-30 04:38:00', '2025-02-25 15:00:24'),
(119, '2018-08-10 09:13:00', 'MCS Version 2.87 Published', 2, 1, 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  \nVersion 2.87 enthält einige neue Features und Verbesserungen.  \nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  \n  \nDesweiteren wurden etliche kleine Bugs beseitigt und es wurde ein Double Opt Out für meinen Asarios Blog Newsletter eingerichtet.  \n  \nWünsche viel Spaß mit diesem Release.  \n  \nIn Love, Asario', 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  \nVersion 2.87 enthält einige neue Features und Verbesserungen.  \nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  \n  \nDesweiteren wurden etliche kleine Bugs beseitigt und &hellip;', 'e6ea04be6e874d0bb7d71985067f2407', 1, 1, 0, 1, '2018-08-10 07:13:00', '2025-02-25 15:00:24'),
(120, '2018-08-10 18:02:00', 'Neue Fotos und neue MCS Version', 1, 1, 'Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.  \nIst ein grosses Release geworden, mit vielen Verbesserungen.  \nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.  \nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog', 'Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.  \nIst ein grosses Release geworden, mit vielen Verbesserungen.  \nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.  \nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog &hellip;', 'ac77fddb335d29a06684876f7451b9a0', 1, 1, 0, 121, '2018-08-10 16:02:00', '2025-02-25 15:00:24'),
(121, '2018-08-23 15:11:00', 'Neues PM Layout, Stats und MCS-Newsletter', 2, 1, 'Habe am Layout der PM\'s in Asarios Blog gearbeitet.  \nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled  \nHat mich ne Menge Arbeit gekostet, fügt sich jetzt aber besser ins Gesamtbild ein.  \n  \nDer fleißige Newsletterleser kommt jetzt zu Punkten.  \nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort MCS-Points sammeln lassen.  \n  \nMusste deswegen auch die Statistiken erweitern  \n  \nAußerdem hab ich seit den letzten news mal wieder ein paar Did You Know Fragen geupped.  \nHope you enjoy it, Asario', 'Habe am Layout der PM\'s in Asarios Blog gearbeitet.  \nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled  \nHat mich ne Menge Arbeit gekostet, fügt sich jetzt aber besser ins Gesamtbild ein.  \n  \nDer fleißige Newsletterleser kommt jetzt zu Punkten.  \nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort &hellip;', '00cbba230337d3b8ddd0303a5f6a75b0', 1, 1, 0, 122, '2018-08-23 13:11:00', '2025-02-25 15:00:24'),
(122, '2018-09-15 18:23:00', 'Monstar in D&auml;nemark', 1, 1, 'Mein Monstar hat nach einem Trip durch Dänemark mir seine Selfies geschickt.  \nSind paar nette Bilder dabei. Vielen Dank an Nitropower für die Übermittlung der Bilder.  \nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.  \nHope you enjoy, Asario', 'Mein Monstar hat nach einem Trip durch Dänemark mir seine Selfies geschickt.  \nSind paar nette Bilder dabei. Vielen Dank an Nitropower für die Übermittlung der Bilder.  \nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.  \nHope you enjoy, Asario  ', 'b9f3e5d0555ead13b76503ff8c1f0eb5', 1, 1, 0, 123, '2018-09-15 16:23:00', '2025-02-25 15:00:24'),
(123, '2018-09-26 15:45:00', 'Kommentaren Folgen', 1, 1, 'Ab Jetzt könnt ihr bestimmten Kommentaren folgen.  \nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.  \nHoffe euch gefällt das Feature und nutzt es auch kräftig.  \nBis bald, Asario', 'Ab Jetzt könnt ihr bestimmten Kommentaren folgen.  \nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.  \nHoffe euch gefällt das Feature und nutzt es auch kräftig.  \nBis bald, Asario   ', '3c7646b4186294b8ee99e2c38af17b66', 1, 1, 0, 124, '2018-09-26 13:45:00', '2025-02-25 15:00:24'),
(124, '2018-10-21 14:48:00', 'Neuer Button unter Images', 1, 1, 'Es ist ein neuer Button unter Images dazugekommen.  \nunter Voter könnt Ihr nachsehen wer wie viel Punkte vergeben hat.  \nAus der Blackbox ist eine Whitebox Anwendung geworden.', 'Es ist ein neuer Button unter Images dazugekommen.  \nunter Voter könnt Ihr nachsehen wer wie viel Punkte vergeben hat.  \nAus der Blackbox ist eine Whitebox Anwendung geworden.   ', 'dd5eaf548dded3190d8e25fcf1738c9b', 1, 1, 0, 125, '2018-10-21 12:48:00', '2025-02-25 15:00:24'),
(125, '2018-10-21 17:16:00', 'LCD, LED, OLED, Plasma - Inwiefern unterscheiden sich TV-Geräte?', 0, 1, 'Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen können, setzt sich aus unzähligen Pixeln zusammen. Der Unterschied besteht hauptsächlich in der Erzeugung der Bildpunkte.  \r\n  \r\nLCD, LED - Was bedeuten diese Abkürzungen?  \r\n  \r\nAlle diese Akronyme stammen aus dem Englischen. LCD bedeutet ausgeschrieben \"liquid crystal display\", zu deutsch Flüssigkristallanzeige. In LC-Monitoren werden die namensgebenden, halbdurchsichtigen Flüssigkristalle dafür eingesetzt, die Menge an durchgelassenem Licht zu kontrollieren. Dafür ändern sie ihre Ausrichtung. Die Kristalle befinden sich zwischen zwei sogenannten Polarisationsfilter.  \r\n  \r\nLED- und OLED-Fernseher nutzen ebenfalls Flüssigkristrallanzeigen. Hier bezieht sich die Abkürzung auf die Art der Beleuchtung. TV-Geräte mit der \"light-emitting diode\"-Technologie sind heutzutage die Norm und sind flacher als LCD-Fernseher mit Leuchtstoffröhren. LED bedeutet übersetzt Leuchtdiode.  \r\n  \r\nPlasmafernseher - eine Nummer teurer?  \r\n  \r\nIn einem Plasmafernseher wird das Bild durch Edelgase erzeugt, die in Kammern zwischen zwei Glasplatten liegen. Plasmen senden aufgrund von quantenhaften Emissionen Strahlung, unter anderem in Form von sichtbarem Licht, aus. Da das Licht vom Gas kommt, und keine Hintergrundbeleuchtung wie beim LCD eingesetzt wird, sind sowohl Schwarzwerte, als auch der Kontrast besser. Bisher galten sie außerdem als reaktionsschneller. Sie sind allerdings deutlich teurer in der Anschaffung als LCD-Fernseher. Plasmafernseher verbrauchen desweiteren mehr Energie. Daher haben sie sich auf dem Markt kaum durchgesetzt.  \r\n  \r\nOLED - die Zukunft?  \r\n  \r\nOLED-Fernseher verwenden organische Leuchtdioden, die von selbst verschiedene Farben darstellen. Diese können sehr platzsparend verbaut werden und bieten eine bessere Bildqualität und Räumlichkeit. OLED-Geräte sind allerdings noch sehr teuer in der Herstellung. Langfristig wird sich diese Technologie aber durchsetzen können, da sie die Vorteile von herkömmlichen LCDs und Plasmafernsehern vereint.  \r\n  \r\nBei der Kaufentscheidung sollten Sie sich genau über das gewünschte Produkt informieren, beispielsweise [auf www.fernseher24.com.](http://www.fernseher24.com/) Vor allem Ihr Budget eine große Rolle. Ob es der gebrauchte Samsung-Fernseher im Angebot aus der letzten Generation oder ein neuer ultra hochauflösender OLED-Fernseher wird, entscheidet auch Ihr Geldbeutel.  \r\nvon Melanie Unger (www.fernseher24.com)', 'Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen können, setzt sich aus unzähligen Pixeln zusammen. Der Unterschied besteht hauptsächlich in der Erzeugung der Bildpunkte.  \r\n  \r\nLCD, LED - Was bedeuten diese Abkürzungen?  \r\n  &hellip;', 'c2f4a79d679c244ae1155f938c865b3c', 2, 1, 0, 1, '2018-10-21 15:16:00', '2025-02-25 15:00:24'),
(126, '2018-11-25 08:16:00', 'Neuer Slider auf News Seite.', 1, 1, 'Wie Ihr seht, hab ich den Slider auf der Newsseite verändert.  \nHope you enjoy, Asario', 'Wie Ihr seht, hab ich den Slider auf der Newsseite verändert.  \nHope you enjoy, Asario     ', 'fc9c4be033b4e19af0a6cd85b2577706', 1, 1, 0, 127, '2018-11-25 07:16:00', '2025-02-25 15:00:24'),
(127, '2018-12-02 08:55:00', 'Neues Feature auf Images Seite', 1, 1, 'Unter [Ausgemaltes](ausgemaltes) könnt Ihr ab jetzt den Fortschritt über Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.', 'Unter [Ausgemaltes](ausgemaltes) könnt Ihr ab jetzt den Fortschritt über Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.    ', '7b76e2828b1d1d619d0167a90ef4f3d7', 1, 1, 0, 128, '2018-12-02 07:55:00', '2025-02-25 15:00:24'),
(128, '2018-12-09 09:16:00', 'Neues unter DidYouKnow', 1, 1, 'Ich habe mal wieder ein paar Wissenshäppchen verteilt. Ich hoffe sie sind lehrreich.  \nIhr findet sie unter [DidYouKnow](didyouknow).  \nAußerdem ist ein neues Release von MCS veröffentlicht worden.  \nViel Spaß damit, euer Asario.', 'Ich habe mal wieder ein paar Wissenshäppchen verteilt. Ich hoffe sie sind lehrreich.  \nIhr findet sie unter [DidYouKnow](didyouknow).  \nAußerdem ist ein neues Release von MCS veröffentlicht worden.  \nViel Spaß damit, euer Asario.  ', '4be6840341103eb12c01f3130695d284', 1, 1, 0, 129, '2018-12-09 08:16:00', '2025-02-25 15:00:24'),
(129, '2018-12-20 17:12:00', 'Merry Christmas Folks', 1, 1, 'Auch euch ein schönes Weihnachtsfest mit hoffentlich vielen Geschenken.  \nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.  \nAlles gute aus meiner Heimat, Asario.', 'Auch euch ein schönes Weihnachtsfest mit hoffentlich vielen Geschenken.  \nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.  \nAlles gute aus meiner Heimat, Asario.   ', 'dd6222bdf4f1b7291b280f446dbaa1b8', 1, 1, 0, 130, '2018-12-20 16:12:00', '2025-02-25 15:00:24');
INSERT INTO `blogs` (`id`, `blog_date`, `title`, `blog_categories_id`, `blog_authors_id`, `content`, `summary`, `slug`, `reading_time`, `markdown_on`, `xis_aiImage`, `blog_images_iid`, `created_at`, `updated_at`) VALUES
(130, '2019-01-01 09:41:00', 'Frohes Neues Freunde', 1, 1, 'Ich wünsche allen ein frohes Neues 2019.  \nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.  \nIch habe Sylvester in Bimöhlen verbracht, war ruhig so weit man das sagen kann...', 'Ich wünsche allen ein frohes Neues 2019.  \nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.  \nIch habe Sylvester in Bimöhlen verbracht, war ruhig so weit man das sagen kann...   ', 'a30cf57967dbb91f215f4de33ab78cd0', 1, 1, 0, 131, '2019-01-01 08:41:00', '2025-02-25 15:00:24'),
(131, '2019-02-22 15:16:00', 'Neue Kunstwerke gesichtet', 1, 1, 'Ich habe unter <a href=\\\"ausgemaltes\\\">Images->Ausgemaltes</a> ein Bild fertiggestellt, sowie unter <a href=\\\"acryl\\\">Images->Acryl</a> ein neues Bild angefangen.  \n  \nHoffe Ihr mögt die Motive, in love, Asario', 'Ich habe unter <a href=\\\"ausgemaltes\\\">Images->Ausgemaltes</a> ein Bild fertiggestellt, sowie unter <a href=\\\"acryl\\\">Images->Acryl</a> ein neues Bild angefangen.  \n  \nHoffe Ihr mögt die Motive, in love, Asario &hellip;', '8bd1c72fd7bc3c21cd829b1dc9dbe4da', 1, 1, 0, 132, '2019-02-22 14:16:00', '2025-02-25 15:00:24'),
(132, '2019-03-24 14:19:00', 'F&uuml;r alle Apfel Nerds und 4K Nutzer', 1, 1, 'Dank einer kleineren Änderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgelöstes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.  \n  \nViel Spaß damit, euer Asario', 'Dank einer kleineren Änderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgelöstes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.  \n  \nViel Spaß damit, euer Asario  ', 'deb2c66a511e036ed8211185d55e14db', 1, 1, 0, 133, '2019-03-24 13:19:00', '2025-02-25 15:00:24'),
(133, '2019-03-29 15:04:00', 'Monstarz United', 1, 1, 'Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz überführt worden.  \nAnsonsten hat sich nix verändert. Hoffe euch gefallen die neuen alten Bilder.  \n  \nIn Love, Asario.', 'Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz überführt worden.  \nAnsonsten hat sich nix verändert. Hoffe euch gefallen die neuen alten Bilder.  \n  \nIn Love, Asario.   ', '7e7c197b9e7cc31b1cb2b9c297d50478', 1, 1, 0, 134, '2019-03-29 14:04:00', '2025-02-25 15:00:24'),
(134, '2019-04-20 11:28:00', 'Frohe Ostern', 1, 1, 'Ich wünsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).  \nDie Lämmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz großer Gefahr.  \n  \nAch ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points einstreichen, Viel Spaß beim suchen.  \nDie Easter Egg Aktion gilt noch bis 30.4.2019.  \n  \nWeiterhin viele grüße aus dem sonnigen Bimöhlen, Asario', 'Ich wünsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).  \nDie Lämmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz großer Gefahr.  \n  \nAch ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points &hellip;', '719c1f9efd8d6860cc962dbdb33ab7fb', 1, 1, 0, 135, '2019-04-20 09:28:00', '2025-02-25 15:00:24'),
(135, '2019-05-27 09:16:00', 'Besuch bei meinem kleinem Neffen', 1, 1, 'Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten können.  \nEcht süß der kleine Racker. Alfred, so heißt er ist ein echt süßes Baby.  \nMit einem Kampfgewicht von 4290 g und einer Körperlänge von 56 cm war das ein ganz schöner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  \n  \nAußerdem habe ich ein Wallpaper mit Alfred verschönert.  \nUnd ich habe die Prämien verändert. Viele Artworks sind jetzt mit noch weniger Punkten zu haben. Viel Spaß beim posten & bewerten.', 'Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten können.  \nEcht süß der kleine Racker. Alfred, so heißt er ist ein echt süßes Baby.  \nMit einem Kampfgewicht von 4290 g und einer Körperlänge von 56 cm war das ein ganz schöner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  &hellip;', 'a583db1a6e4156a585a974b18f65bd2c', 1, 1, 0, 136, '2019-05-27 07:16:00', '2025-02-25 15:00:24'),
(136, '2019-06-23 06:40:00', 'Anubis fast fertig', 1, 1, 'Mein Gold Anubis ist auf der Zielgerade angekommen.  \nEin paar Details an der Schnauze müssen noch gemacht werden, ansonsten ist er Fertig.  \nMein bisher aufwendigstes Kunstwerk nähert sich der Fertigstellung.', 'Mein Gold Anubis ist auf der Zielgerade angekommen.  \nEin paar Details an der Schnauze müssen noch gemacht werden, ansonsten ist er Fertig.  \nMein bisher aufwendigstes Kunstwerk nähert sich der Fertigstellung.   ', '2dfc67ff26995c266c186906d37ae551', 1, 1, 0, 137, '2019-06-23 04:40:00', '2025-02-25 15:00:24'),
(137, '2019-06-30 11:22:00', 'MCS Doku Multi-Language', 2, 1, 'Ich überarbeite zur Zeit die MCS Dokumentation.  \nWenn ich alle Texte übersetzt und alle Grafiken überarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht weiß.  \nIch hoffe meine Englischen Fans danken es mir.', 'Ich überarbeite zur Zeit die MCS Dokumentation.  \nWenn ich alle Texte übersetzt und alle Grafiken überarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht weiß.  \nIch hoffe meine Englischen Fans danken es mir.  ', '3f9a576af20262fff4cf442ed6462a34', 1, 1, 0, 138, '2019-06-30 09:22:00', '2025-02-25 15:00:24'),
(138, '2019-09-06 13:58:00', 'Anubis fertig', 1, 1, 'Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.  \nVielen Dank noch mal an Sigi für die Hilfe bei diesem Bild. Ohne dich hätte ich das nie geschafft.  \n  \nWer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.', 'Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.  \nVielen Dank noch mal an Sigi für die Hilfe bei diesem Bild. Ohne dich hätte ich das nie geschafft.  \n  \nWer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.  ', 'd3a3b70995252f0fccd0909c1add3a54', 1, 1, 0, 139, '2019-09-06 11:58:00', '2025-02-25 15:00:24'),
(139, '2019-09-15 08:34:00', 'Shariff Online', 1, 1, 'Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.  \nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich wünsche viel Spaß beim Teilen meiner Inhalte.', 'Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.  \nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich wünsche viel Spaß beim Teilen meiner Inhalte.  ', '71df6806b35005213c0aa2b0e7090608', 1, 1, 0, 140, '2019-09-15 06:34:00', '2025-02-25 15:00:24'),
(140, '2019-10-03 07:08:00', 'Neue Folgen Funktion', 1, 1, 'Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.  \nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.  \n  \nNach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie immer im Detail.  \n  \nFür alle Members, die Standard Einstellung beim folgen ist folgen per E-mail.', 'Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.  \nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.  \n  \nNach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie &hellip;', '43c936606434d512b27783522102fd00', 1, 1, 0, 141, '2019-10-03 05:08:00', '2025-02-25 15:00:24'),
(141, '2019-12-23 22:59:00', 'Merry Christmas and a happy New Year', 1, 1, 'Auch dieses Jahr geht zu ende und wir haben viel geschafft.  \nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genießen .  \n  \nIch wünsche allen die dies Lesen ein frohes Fest zu Feiern.  \nUnd rutscht gut rein....', 'Auch dieses Jahr geht zu ende und wir haben viel geschafft.  \nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genießen .  \n  \nIch wünsche allen die dies Lesen ein frohes Fest zu Feiern.  \nUnd rutscht gut rein....  ', '537052b0ba7fa3d5392e93d23d94746d', 1, 1, 0, 142, '2019-12-23 21:59:00', '2025-02-25 15:00:24'),
(142, '2019-12-28 16:54:00', 'Gut reingerutscht?', 1, 1, 'Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.  \nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario kürzlich in einem Interview zum neuen Jahr.  \n  \nViel Glück, Leute.', 'Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.  \nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario kürzlich in einem Interview zum neuen Jahr.  \n  \nViel Glück, Leute.  ', '76fd74bb02b9fec6554854d3b936947f', 1, 1, 0, 143, '2019-12-28 15:54:00', '2025-02-25 15:00:24'),
(143, '2020-01-12 12:47:00', 'Zwei Faktor Authentifizierung auf Asarios Blog', 1, 1, 'Ab jetzt könnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.  \nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.  \nSicherheit ist für mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.  \n  \nHoffe Ihr genießt den Komfort der 2 Faktor Authentifizierung.  \n  \nEhe ich\'s vergesse, hab mal wieder nen paar Wissenshappen unter DidYouKnow verteilt.', 'Ab jetzt könnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.  \nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.  \nSicherheit ist für mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.  \n  \nHoffe Ihr genießt den Komfort der 2 Faktor Authentifizierung. &hellip;', '2f257a5010ba985bbda29f4cb10f9b57', 1, 1, 0, 144, '2020-01-12 11:47:00', '2025-02-25 15:00:24'),
(144, '2020-02-23 15:06:00', 'Ich verlasse Bim&ouml;hlen', 1, 1, 'Nächste Woche ziehe ich aus Mederius in Bimöhlen aus.  \nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen nächsten Schritt in Richtung Selbständigkeit. Ich ziehe in eine Teilstationäre WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.  \n  \nIch Spare mir dann 2 Stunden pro Arbeitstag an Fahrerei.  \nAllerdings muss ich trotzdem mehr machen, wie Kochen und Putzen.  \n  \nIch bin schon sehr aufgeregt und freue mich.', 'Nächste Woche ziehe ich aus Mederius in Bimöhlen aus.  \nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen nächsten Schritt in Richtung Selbständigkeit. Ich ziehe in eine Teilstationäre WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.  \n  \nIch Spare mir dann 2 Stunden pro Arbeitstag an &hellip;', '7a204bda810b3297efae9c49f41003cd', 1, 1, 0, 145, '2020-02-23 14:06:00', '2025-02-25 15:00:24'),
(145, '2020-03-04 14:47:00', 'Willkommen SE', 1, 1, 'Herzlich Willkommen in Bad Segeberg.  \nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.  \nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.  \nIch habe die ersten Nächte hinter mir und es schläft sich gut im meinem neuem Bett.  \nGrüße aus meinem Homeoffice, Asario 8)', 'Herzlich Willkommen in Bad Segeberg.  \nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.  \nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.  \nIch habe die ersten Nächte hinter mir und es schläft sich gut im meinem neuem Bett.  \nGrüße aus meinem Homeoffice, Asario 8) &hellip;', '0a9ee14fd007665e52cade00544814fd', 1, 1, 0, 146, '2020-03-04 13:47:00', '2025-02-25 15:00:24'),
(146, '2020-08-16 11:52:00', 'Neue Bilder gesichtet', 1, 1, 'Auch dieses mal hab ich mich kreativ betätigt und 2 neue Fineliner Bilder gemalt.  \nHoffe sie gefallen euch, in love, Asario', 'Auch dieses mal hab ich mich kreativ betätigt und 2 neue Fineliner Bilder gemalt.  \nHoffe sie gefallen euch, in love, Asario    ', '34729c492112e67537b94732d6c69855', 1, 1, 0, 147, '2020-08-16 09:52:00', '2025-02-25 15:00:24'),
(147, '2020-09-06 15:51:00', 'Neues Layout auf Asario.de', 1, 1, 'Herzlich willkommen im grey theme von Asarios Blog.  \nHoffe ihr findet das Layout auch so gut wie ich.  \nIst nur wenig anders aber doch anders.  \nHabt Spaß und kommentiert fleißig.  \nIn Love, Asario', 'Herzlich willkommen im grey theme von Asarios Blog.  \nHoffe ihr findet das Layout auch so gut wie ich.  \nIst nur wenig anders aber doch anders.  \nHabt Spaß und kommentiert fleißig.  \nIn Love, Asario   ', '52966411a2af8a861d7a3f9551a9a947', 1, 1, 0, 148, '2020-09-06 13:51:00', '2025-02-25 15:00:24'),
(148, '2020-12-31 23:32:00', 'Frohes Neues', 1, 1, 'An alle Freunde und Bekannte, Ich wünsche ein frohes neues 2021.  \nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genießen können. Ich wünsche euch allen das Ihr gesund und munter das neue Jahr verlebt.  \n  \nAuf ein schönes, gesundes 2021, Asario', 'An alle Freunde und Bekannte, Ich wünsche ein frohes neues 2021.  \nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genießen können. Ich wünsche euch allen das Ihr gesund und munter das neue Jahr verlebt.  \n  \nAuf ein schönes, gesundes 2021, Asario &hellip;', '8c41d111895c4e9f89d9b8aa13bee64f', 1, 1, 0, 149, '2020-12-31 22:32:00', '2025-02-25 15:00:24'),
(149, '2021-08-12 11:14:00', 'Back in town...', 1, 1, 'Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.  \nHabe während meines Aufenthalts viel gemalt wie man unter [Images->Fineliner](fineliner) erkennen kann.', 'Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.  \nHabe während meines Aufenthalts viel gemalt wie man unter [Images->Fineliner](fineliner) erkennen kann.  ', '7b120dc10519204a1c57d3adbbbc3644', 1, 1, 0, 150, '2021-08-12 09:14:00', '2025-02-25 15:00:24'),
(150, '2021-10-09 18:19:00', 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', 1, 1, 'Bin wieder im Lande angekommen.  \nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.  \nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.', 'Bin wieder im Lande angekommen.  \nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.  \nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.  ', '10d2294dcd3030deb841507dcfe4379f', 1, 1, 0, 151, '2021-10-09 16:19:00', '2025-02-25 15:00:24'),
(151, '2021-10-09 21:14:00', 'Neues von MCS', 2, 1, 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  \n  \nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  \n  \nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  \n  \nWar ne Zeit lang ohne Internet und konnte somit nichts Posten.  \n  \nWünsche viel Spaß auf [www.asario.de](https://www.asario.de)', 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  \n  \nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  \n  \nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  \n  \nWar ne Zeit lang ohne Internet und konnte somit &hellip;', '0f9bd3bf70db225eede993a53ec017ea', 1, 1, 0, 1, '2021-10-09 19:14:00', '2025-02-25 15:00:24'),
(152, '2021-12-25 09:42:00', 'Merry X-Mas 2021', 1, 1, 'Ich wünsche euch ein Frohes Fest.  \nHoffe es gab lecker Essen und Trinken zu Weihnachten.  \nIch habe gestern die 3te von 9 Leinwänden für mein Großprojekt fertig gestellt.  \nEl Novem ist noch in Arbeit aber sieht relativ geil aus.', 'Ich wünsche euch ein Frohes Fest.  \nHoffe es gab lecker Essen und Trinken zu Weihnachten.  \nIch habe gestern die 3te von 9 Leinwänden für mein Großprojekt fertig gestellt.  \nEl Novem ist noch in Arbeit aber sieht relativ geil aus.  ', '086e03050016bca0cd0d9be2400914df', 1, 1, 0, 153, '2021-12-25 08:42:00', '2025-02-25 15:00:24'),
(153, '2022-02-15 11:15:00', 'Neues Feature', 1, 1, 'Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.  \nHoffe Ihr habt spaß mit den Sternen.  \nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.', 'Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.  \nHoffe Ihr habt spaß mit den Sternen.  \nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.  ', '7714b1adf9b7f1df058e1dd0b9088712', 1, 1, 0, 154, '2022-02-15 10:15:00', '2025-02-25 15:00:24'),
(154, '2022-04-27 17:13:00', 'Solidarit&auml;t mit der Ukraine', 1, 1, 'Ich wünsche allen UkrainerInnen da draußen das der Krieg bald vorüber geht.  \n  \nKrieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,  \nund wir hoffen das dieser Krieg bald endet.  \n  \nIn Frieden, Asario', 'Ich wünsche allen UkrainerInnen da draußen das der Krieg bald vorüber geht.  \n  \nKrieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,  \nund wir hoffen das dieser Krieg bald endet.  \n  \nIn Frieden, Asario  ', 'dc7ac065d0257e11a5aa53be5db029ae', 1, 1, 0, 155, '2022-04-18 20:00:00', '2025-02-25 15:00:24'),
(155, '2022-06-19 13:15:00', '3D Printer Objekte', 1, 1, 'Happy Birthday to me.  \nHabe meinen 3D Drucker in Betrieb genommen und mal was Künstlerisches gedruckt.  \nEs ist ein Relief erstellt und mit PLA gedruckt worden.  \nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.  \n  \nHope you enjoy, Asario', 'Happy Birthday to me.  \nHabe meinen 3D Drucker in Betrieb genommen und mal was Künstlerisches gedruckt.  \nEs ist ein Relief erstellt und mit PLA gedruckt worden.  \nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.  \n  \nHope you enjoy, Asario &hellip;', '6cb3d83f7932ee548e834a91b05f575d', 1, 1, 0, 156, '2022-06-28 20:00:00', '2025-02-25 15:00:24'),
(156, '2022-08-24 16:53:00', 'Neuerungen im System', 2, 1, 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  \r\n  \r\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  \r\nAußerdem mal wieder etliche kleinere und größere Bugs behoben.  \r\nWünsche viel Spaß bei meinen Seiten.  \r\nCincerly Paul Rieser aka. Asario', 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  \r\n  \r\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  \r\n', '337b711b698013d837964f38872255fe', 1, 1, 1, 190, '2024-06-27 14:53:00', '2022-10-09 07:14:00'),
(157, '2022-11-05 14:56:00', 'Neues aus PLA', 1, 1, 'Mein 3D Drucker l&auml;uft warm und hat mir die Galerie [3D Printer](3DPrinter) erm&ouml;glicht. Hoffe euch gefallen die Drucke.', 'Mein 3D Drucker l&auml;uft warm und hat mir die Galerie [3D Printer](3DPrinter) erm&ouml;glicht. Hoffe euch gefallen die Drucke.    ', '499bdd396496bfea2274ce8967c82b82', 1, 1, 0, 158, '2022-11-05 13:56:00', '2025-02-25 15:00:24'),
(158, '2023-01-22 13:07:00', 'Happy 2023', 1, 1, 'Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten können.  \nHabe mal wieder an der Sicherheit von MCS gearbeitet.  \nWünsche viel Spaß auf meinen Seiten / meiner Seite.', 'Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten können.  \nHabe mal wieder an der Sicherheit von MCS gearbeitet.  \nWünsche viel Spaß auf meinen Seiten / meiner Seite.   ', 'a1850e2f0cea31839df888e3423db94e', 1, 1, 1, 159, '2023-01-22 12:07:00', '2025-02-25 15:00:24'),
(159, '2023-01-27 18:03:00', 'Winter in town', 1, 1, 'Es ist kalt geworden und der Winter hat uns fest im Griff.  \r\nIch hoffe, ihr m&uuml;sst nicht raus, es ist  sehr  kalt.  \r\nHabe wieder ein paar Bugs gefunden und beseitigt.  \r\nCiao, Asario', 'Es ist kalt geworden und der Winter hat uns fest im Griff.  \r\nIch hoffe, ihr m&uuml;sst nicht raus, es ist  sehr  kalt.  \r\nHabe wieder ein paar Bugs gefunden und beseitigt.  \r\nCiao, Asario   ', 'ece1e0956e588978d5b71e28ca9db06e', 1, 1, 1, 160, '2023-01-27 17:03:00', '2025-02-25 15:00:24'),
(160, '2023-02-04 12:05:00', 'Winter Update', 2, 1, 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  \r\nDie Google Sitemap wurden überarbeitet und verschönert.  \r\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  \r\nBugs waren auch einige dabei, alle behoben.  \r\nHoffe ihr habt spass auf meinen Seiten.', 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  \r\nDie Google Sitemap wurden überarbeitet und verschönert.  \r\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  \r\nBugs waren auch einige dabei, alle behoben.  \r\nHoffe ihr habt spass auf meinen Seiten. &hellip;', '898501c0f73954e48990b203c2fea3ae', 1, 1, 1, 161, '2023-02-04 11:05:00', '2025-02-25 15:00:24'),
(161, '2023-02-13 08:56:00', 'Frohe Ostern 2023', 1, 1, 'Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.  \nIn diesem Sinne, Frohe Ostern, Asario', 'Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.  \nIn diesem Sinne, Frohe Ostern, Asario &hellip;', '9961534e2caf9e9240a0f1c9842ea13b', 1, 1, 1, 162, '2023-02-13 07:56:00', '2025-02-25 15:00:24'),
(162, '2023-02-22 15:10:00', 'Fr&uuml;hling', 1, 1, 'Das Ende des Winters bringt eine Ver&auml;nderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden w&auml;rmer und die Tage l&auml;nger.  \r\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort sch&ouml;n ist wenn die Sonne zu scheinen beginnt. AuÃ?erdem ist Eekholdt gleich um die Ecke und immer einen Besuch wert.', 'Das Ende des Winters bringt eine Ver&auml;nderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden w&auml;rmer und die Tage l&auml;nger.  \r\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort sch&ouml;n ist wenn die Sonne zu scheinen beginnt. &hellip;', '4d152837df543a0524e94cb35dfd2bd7', 1, 1, 1, 163, '2023-02-22 14:10:00', '2025-02-25 15:00:24'),
(163, '2023-03-11 12:03:00', 'Verbesserte Feeds', 2, 1, 'Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed lädt jetzt schneller, und seit kurzem auch in Englisch verfügbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar kleinere Bugs zu beheben die ich kürzlich gefixt habe.Und da alles gut läuft freue ich mich auf kommende Spannende Features die noch entwickelt werden wollen.', 'Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed lädt jetzt schneller, und seit kurzem auch in Englisch verfügbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar &hellip;', '93639873949f60a11ed5a1fc9d549859', 1, 1, 1, 164, '2023-03-11 11:03:00', '2025-02-25 15:00:24'),
(164, '2023-05-07 08:42:00', 'Neue Sterne', 2, 1, 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zunächst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** wieder einen Schritt weiter gekommen und ich habe den einen oder anderen Bug behoben.\r\nIch hoffe ihr habt Spaß, Asario', 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zunächst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** &hellip;', '23ac16d033377889adc24dc8e1b6127b', 1, 1, 1, 165, '2023-05-07 06:42:00', '2025-02-25 15:00:24'),
(165, '2023-05-29 10:02:00', 'Sommer 2023', 1, 1, 'Auch in diesem Quartal habe ich wieder einige Änderungen vorgenommen.\r\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde überarbeitet.\r\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was für welchen Zweck gesammelt wird.\r\nDie Bildberbewertung auf asario.de habe ich etwas verändert.\r\nWenn die Sterne halb gelb sind, hat man noch nicht bewertet, wenn sie ganz gelb sind, wurden schon Sterne vergeben.\r\nAußerdem habe ich wieder ein paar kleine Fehler behoben, die mir im Laufe der Zeit aufgefallen sind.\r\n\r\n\r\nIch wünsche euch einen sonnigen Sommer, bis bald, Asario.', 'Auch in diesem Quartal habe ich wieder einige Änderungen vorgenommen.\r\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde überarbeitet.\r\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was für welchen Zweck gesammelt wird.\r\nDie Bildberbewertung auf &hellip;', '43c622a37b1034cb87696d2f55ddd5c9', 1, 1, 1, 166, '2023-05-29 08:02:00', '2025-02-25 15:00:24'),
(166, '2023-07-22 13:38:00', 'Sp&auml;tsommer 2023', 1, 1, 'ich m&ouml;chte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu k&ouml;nnen, dass es wieder aufgetaucht ist und sich auf den Weg nach Berlin gemacht hat! Das ist wirklich aufregend und ich bin gespannt, welche Abenteuer ihn dort erwarten.\r\n\r\nIch habe in den letzten Tagen und Wochen hart gearbeitet, um einige kleinere Bugs zu beheben und Verbesserungen an meinen Seiten vorzunehmen. Es war eine Herausforderung, aber es hat sich definitiv gelohnt. Ich m&ouml;chte, dass ihr als Besucher ein optimales Erlebnis habt und euch auf meinen Seiten wohlf&uuml;hlt. Deshalb ist es mir wichtig, diese technischen H&uuml;rden aus dem Weg zu r&auml;umen und das Beste aus meinen Websites herauszuholen.\r\n\r\nIch freue mich auf die kommenden Wochen und Monate und hoffe, dass ihr weiterhin mit mir auf meiner Reise seid. Eure Unterst&uuml;tzung und Begeisterung bedeuten mir alles. Lasst uns gemeinsam diese aufregende Zeit genieÃ?en und viele unvergessliche Momente teilen.\r\n\r\nHoffe Ihr habt SpaÃ? auf meinen Seiten, in Love, Asario', 'ich m&ouml;chte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu k&ouml;nnen, dass es wieder aufgetaucht ist und sich &hellip;', '67ae3b91baa34ba55cd22f2ba32dc8aa', 2, 1, 1, 167, '2023-07-22 11:38:00', '2025-02-25 15:00:24'),
(167, '2023-08-21 13:27:00', 'Herbst 2023', 1, 1, 'Hallo zusammen!\r\n\r\nIch habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und lästige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verläuft. Die gemütlichen Vibes des Herbstes begleiten nun eure Uploads.\r\n\r\nEine benutzerfreundliche Oberfläche ermöglicht es Nutzern, Inhalte schnell hochzuladen, zu organisieren und anzuzeigen, ohne technisches Fachwissen zu benötigen. Dies spart Zeit und Mühe bei der Verwaltung von Dateien/Bildern und erleichtert die Fokussierung auf die eigentliche Inhaltsproduktion.\r\n\r\nInsgesamt bietet das neu gestaltete Upload-Skript eine verbesserte Benutzererfahrung und trägt dazu bei, den Arbeitsablauf bei der Erstellung und Verwaltung von Inhalten zu optimieren.\r\n\r\n Ich wünsche euch einen wunderschönen Herbst voller Wärme und Freude.', 'Hallo zusammen!\r\n\r\nIch habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und lästige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verläuft. Die gemütlichen Vibes des Herbstes begleiten nun eure Uploads.\r\n\r\nEine benutzerfreundliche Oberfläche ermöglicht es Nutzern, Inhalte schnell &hellip;', '11cc28c7b621586b96d21c518cebd3dc', 1, 1, 1, 168, '2023-08-21 11:27:00', '2025-02-25 15:00:24'),
(168, '2023-11-30 16:05:00', 'Winter & 2fa', 1, 1, 'Der Winter h&uuml;llte die Welt in ein schneewei&szlig;es M&auml;rchen. Schlittenfahrten und fr&ouml;hliche Abenteuer auf den H&uuml;geln lieÃ?en uns den Zauber der kalten Tage sp&uuml;ren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige W&auml;rme gem&uuml;tliche Stunden bescherten.\n\n**Natur und Gemeinschaft:**\nDie verschneite Landschaft und klirrend kalte N&auml;chte schufen eine bezaubernde Kulisse. Gleichzeitig lieÃ?en Nachbarschaftshilfe und winterliche Aktivit&auml;ten eine wohltuende Gemeinschaft entstehen. Dieser Wintermonat wurde zu einer Zeit der inneren Einkehr, kulinarischer Freuden und Vorfreude auf das Erwachen der Natur im kommenden Fr&uuml;hling.\n\n**Zwei-Faktor-Authentifizierung Update f&uuml;r Asario.de:**\n\nWir freuen uns, Ihnen mitteilen zu k&ouml;nnen, dass Asario.de jetzt OTP (One-Time Passwords) unterst&uuml;tzt, um Ihren Login noch sicherer zu gestalten. Diese Funktion finden Sie in den Profil-Einstellungen unter **2FA aktivieren**.\n\nZus&auml;tzlich haben wir die M&ouml;glichkeit integriert, Ihre Kontowiederherstellungscodes direkt in Ihrem Benutzerprofil zu verwalten. Diese zus&auml;tzliche SicherheitsmaÃ?nahme gew&auml;hrleistet ein hohes Sicherheitsniveau\nBitte beachten Sie: Geben Sie die Codes niemals an andere weiter. Wir werden Sie niemals nach den 2fa-Codes fragen.\nBei Fragen oder Anliegen stehen wir Ihnen jederzeit zur Verf&uuml;gung.', 'Der Winter h&uuml;llte die Welt in ein schneewei&szlig;es M&auml;rchen. Schlittenfahrten und fr&ouml;hliche Abenteuer auf den H&uuml;geln lieÃ?en uns den Zauber der kalten Tage sp&uuml;ren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige W&auml;rme &hellip;', 'c8b89da4c750dc2aa5cbed6a63716d2f', 2, 1, 1, 169, '2023-11-30 14:05:00', '2025-02-25 15:00:24'),
(169, '2023-10-31 20:02:00', 'Halloween 2023', 1, 1, 'Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verr&uuml;cktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haust&uuml;r sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. Also, schnapp dir dein Kost&uuml;m und mach dich bereit f&uuml;r eine unvergessliche Halloween-Nacht!', 'Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verr&uuml;cktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haust&uuml;r sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. &hellip;', '5643d9ac757fc1de84e09b32dff42961', 1, 1, 1, 170, '2023-10-31 19:02:00', '2025-02-25 15:00:24'),
(170, '2023-11-22 15:01:00', 'Update zur Zwei-Faktor-Authentifizierung', 2, 1, 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese Codes nutzen, um sich einzuloggen.\r\n\r\nNach der Aktivierung der Zwei-Faktor-Authentifizierung zeigt Ihnen die Seite Ihre persönlichen Wiederherstellungscodes an. Sie finden diese in Ihrem Benutzerprofil unter Profil-Einstellungen außerdem über dem \"Wiederherstellungscodes\"-Button.\r\n\r\nFür eventuelle Fragen oder Unterstützung stehen wir Ihnen gerne zur Verfügung. Bitte beachten Sie: Geben Sie diese Codes niemals an andere weiter. Sicherheit hat bei uns oberste Priorität!\r\n\r\nMit freundlichen Grüßen, Asario', 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese &hellip;', 'b1810b700b5ebe9003314cd4b311693c', 1, 1, 1, 171, '2023-11-21 22:00:00', '2025-02-25 15:00:24'),
(171, '2023-12-16 16:09:00', 'Frohe Weihnachten 2023', 1, 1, 'Die festliche Jahreszeit ist angebrochen, und mit jedem Tag w&auml;chst die Vorfreude auf das Weihnachtsfest. In den geschm&uuml;ckten StraÃ?en und liebevoll dekorierten H&auml;usern spiegelt sich die warme Atmosph&auml;re dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der Auswahl von Geschenken, dem Zubereiten k&ouml;stlicher Mahlzeiten oder dem Teilen von Traditionen.\r\n\r\nWeihnachten ist mehr als nur ein festlicher Anlass; es ist eine Zeit der Besinnung. Inmitten von Geselligkeit und Freude sollten wir auch innehalten, um das vergangene Jahr zu reflektieren. M&ouml;ge die Magie von Weihnachten uns mit Liebe, Mitgef&uuml;hl und Hoffnung erf&uuml;llen. Frohe Weihnachten an euch alle!', 'Die festliche Jahreszeit ist angebrochen, und mit jedem Tag w&auml;chst die Vorfreude auf das Weihnachtsfest. In den geschm&uuml;ckten StraÃ?en und liebevoll dekorierten H&auml;usern spiegelt sich die warme Atmosph&auml;re dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der &hellip;', 'f0b9bce219e7f868f33644fe128068df', 1, 1, 1, 172, '2023-12-16 15:09:00', '2025-02-25 15:00:24'),
(172, '2024-01-09 21:14:00', 'KI, Webdesign, Kunst und Fotografie', 3, 1, 'Als leidenschaftlicher Blogger erkunde ich in meinen Beitr&auml;gen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der K&uuml;nstlichen Intelligenz &uuml;ber innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - ich m&ouml;chte euch auf kurzweilige Weise inspirieren und ihre Neugier f&uuml;r diese spannenden Themen wecken. Begleite mich auf dieser Entdeckungsreise durch die faszinierende Fusion von Technologie und Kreativit&auml;t!', 'Als leidenschaftlicher Blogger erkunde ich in meinen Beitr&auml;gen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der K&uuml;nstlichen Intelligenz &uuml;ber innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - &hellip;', '510745f9bb217d1e01521caddef90eaa', 1, 1, 1, 173, '2024-01-09 20:14:00', '2025-02-25 15:00:24'),
(173, '2024-03-14 15:10:00', 'Frühling', 1, 1, 'Ja, der Frühling steht vor der Tür, und mit ihm kommt auch Ostern näher. In vielen Teilen der Welt ist der Frühling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden länger, die Blumen blühen, und die Temperaturen steigen langsam an.\r\n\r\nOstern ist ein festliches Ereignis, das in vielen Kulturen und Traditionen gefeiert wird. Es markiert die Auferstehung Jesu Christi und wird oft mit verschiedenen Bräuchen und Feierlichkeiten begangen. Dazu gehören das Färben und Verstecken von Ostereiern, das Dekorieren von Osternestern, Ostermärkte, Osterfeuer und vieles mehr.\r\n\r\nEs ist eine Zeit der Freude, des Zusammenseins mit Familie und Freunden und des Genießens der Frühlingsstimmung. Egal, ob man religiöse Rituale begeht oder einfach die Gelegenheit nutzt, um sich zu entspannen und das schöne Wetter zu genießen, der Frühling und Ostern bieten eine willkommene Abwechslung nach den kalten Wintermonaten.', 'Ja, der Frühling steht vor der Tür, und mit ihm kommt auch Ostern näher. In vielen Teilen der Welt ist der Frühling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden länger, die Blumen blühen, und die Temperaturen steigen langsam &hellip;', 'dde9b0f3364b6da067da3baa23272668', 1, 1, 1, 174, '2024-03-13 22:00:00', '2025-02-25 15:00:24'),
(174, '2024-04-21 13:54:00', 'Sommer 2024', 1, 1, 'Der Sommer steht vor der T&uuml;r und bringt warme Temperaturen, sonnige Tage und endlose M&ouml;glichkeiten f&uuml;r Outdoor-Aktivit&auml;ten mit sich. Es ist die perfekte Zeit, um die Natur zu genie&szlig;en, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand entspannst, wandern gehst oder einfach nur die warmen Sommerabende genie&szlig;t, diese Jahreszeit bietet f&uuml;r jeden etwas.\r\n\r\nNutze den Sommer, um neue Hobbys auszuprobieren, Freunde zu treffen und unvergessliche Momente zu schaffen. Es ist eine Zeit des Neubeginns, der Erholung und der Freude. Also pack die Sonnencreme ein, zieh deine Sommerschuhe an und mach dich bereit, den Sommer in vollen Z&uuml;gen zu genie&szlig;en!', 'Der Sommer steht vor der T&uuml;r und bringt warme Temperaturen, sonnige Tage und endlose M&ouml;glichkeiten f&uuml;r Outdoor-Aktivit&auml;ten mit sich. Es ist die perfekte Zeit, um die Natur zu genie&szlig;en, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand &hellip;', '73ae0dd610479903b7f0829c363ce59d', 1, 1, 1, 175, '2024-04-21 11:54:00', '2025-02-25 15:00:24'),
(175, '2024-06-27 16:53:00', 'Neues Layout', 2, 1, 'Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgfältig ausgewählt.\r\nIch hoffe, dass euch das neue Design genauso gut gefällt wie mir. Schaut euch um und lasst mich wissen, was Ihr  denkt!\r\n\r\nVielen Dank, dass ihr Teil unserer Community seid.\r\n\r\nEuer Team', 'Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgfältig ausgewählt.', '337b711b698013d837964f37152255fe', 1, 1, 0, 176, '2024-06-27 14:53:00', '2024-07-16 20:00:00'),
(176, '2024-08-08 10:08:00', 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', 2, 1, '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen habe, mit euch teilen.\r\n\r\n**Warum PHP 8.2?**\r\nPHP 8.2 bringt viele neue Features und Verbesserungen, die sowohl die Performance als auch die Sicherheit betreffen. Besonders interessant fand ich die verbesserten Type Declarations und die optimierten Fehlerbehandlungsmechanismen. Allerdings bedeutet ein Versionssprung auch, dass bestehender Code Überarbeitet werden muss.\r\n\r\nDie Herausforderung: Variablen deklarieren\r\nEin großes Problem, auf das ich stieß, war, dass PHP 8.2 strenger mit der Variablendeklaration umgeht. Das bedeutet, dass ich in meinem Code viele Variablen explizit deklarieren musste, bevor sie verwendet wurden. Das war zeitaufwendig, weil ich jeden einzelnen Fall durchgehen und sicherstellen musste, dass alle Variablen korrekt initialisiert sind.\r\n\r\n**Die Testphase: Alles durchprobieren**\r\nNachdem ich die Variablen angepasst hatte, begann die intensive Testphase. Ich musste alle Funktionen und Skripte durchprobieren, um sicherzustellen, dass sie unter PHP 8.2 wie gewünscht funktionieren. Es war frustrierend, auf unerwartete Fehlermeldungen zu stoßen, aber nach und nach konnte ich alle Probleme beheben.\r\n\r\nDas Ergebnis: Ein schnelleres und sichereres System\r\nNach all der Arbeit kann ich stolz sagen, dass mein System nun unter PHP 8.2 läuft - und das schneller und sicherer als je zuvor. Die Mühe hat sich gelohnt, und ich bin gespannt, wie sich diese Optimierungen langfristig auswirken werden.\r\n\r\n**Fazit:**\r\nDie Aktualisierung auf PHP 8.2 war eine Herausforderung, aber auch eine wertvolle Lernerfahrung. Wenn du ebenfalls darüber nachdenkst, PHP auf deinem Server zu aktualisieren, empfehle ich dir, gründlich zu testen und dich auf einige Anpassungen im Code vorzubereiten. Es lohnt sich!', '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen &hellip;', '3773943d9f6b912e9d5a5d70e04a3a1c', 2, 1, 1, 177, '2024-08-08 08:08:00', '2025-02-25 15:00:24'),
(177, '2024-08-18 12:25:00', 'Laravel Experimente', 2, 1, 'Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights gehört eine Blog-Komponente, die es den Nutzern ermöglicht, Beiträge zu erstellen und zu verwalten.\r\n\r\nDarüber hinaus habe ich eine sichere Login-/Logout-Funktion entwickelt, die durch OTP-Codes (Einmalpasswörter) geschützt ist. Dabei wird der OTP-Code via QR-Code eingelesen, was die Sicherheit und Benutzerfreundlichkeit weiter erhöht.\r\n\r\nAuch die Profileinstellungen sind umfangreich: Benutzer können ihre E-Mail-Adresse ändern und ihr Passwort erneuern. Diese Funktionen bieten eine solide Basis für die Verwaltung von Benutzerkonten und tragen zur Sicherheit der Plattform bei.\r\n\r\nIch freue mich darauf, meine Kenntnisse in Laravel weiter zu vertiefen und das Projekt kontinuierlich zu erweitern.', 'Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights gehört eine Blog-Komponente, die es den Nutzern ermöglicht, Beiträge zu erstellen und zu verwalten.\r\n\r\nDarüber hinaus habe ich eine sichere &hellip;', '0954c969a702e73e43dbefd17de5ac4c', 1, 1, 1, 178, '2024-08-18 10:25:00', '2025-02-25 15:00:24'),
(178, '2024-10-31 09:35:00', 'Und schon wieder haben wir Halloween!', 1, 1, 'Halloween ist wieder da - die Straßen füllen sich mit Kürbislaternen, die Kinder schlüpfen in schaurige Kostüme, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativität Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Bräuchen hat, hat sich längst über die ganze Welt verbreitet und begeistert Jung und Alt. Ob gespenstische Deko, ausgehöhlte Kürbisse oder einfach ein gemütlicher Horrorfilmabend - Halloween bringt die Menschen auf eine unbeschwerte, magische Weise zusammen.\r\n\r\nDoch Halloween ist mehr als nur ein Fest des Schreckens. Es ist auch ein Spiegel für unsere Fantasie und Kreativität. Jedes Kostüm, jede verzierte Haustür und jede handgemachte Kürbislaterne erzählt eine eigene Geschichte. Vielleicht ist das der eigentliche Zauber von Halloween: einen Abend lang in eine andere Welt einzutauchen, zusammen mit Freunden und Familie die Nacht zu erobern und sich gemeinsam vor dem Spuk zu gruseln – nur um am nächsten Morgen mit einem Schmunzeln an das Abenteuer zurückzudenken.', 'Halloween ist wieder da - die Straßen füllen sich mit Kürbislaternen, die Kinder schlüpfen in schaurige Kostüme, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativität Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Bräuchen hat, hat sich längst &hellip;', 'a691c59c0f5dd9d20e87dbc949785431', 1, 1, 1, 179, '2024-10-31 08:35:00', '2025-02-25 15:00:24'),
(179, '2024-12-07 14:36:00', 'X-Mas 2024', 1, 1, 'Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleichermaßen, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die kühle Luft trägt den Hauch von Winter, während die Bewegung die Herzen erwärmt. Schlittschuhlaufen - ein schwebendes Glück, das die Tage heller und die Nächte leichter macht.\r\n\r\nAm Rande der Bahnen strömt der Duft von Glühwein und gebrannten Mandeln durch die kalte Luft, eine Einladung zum Verweilen. Der Glühwein, tiefrot und würzig, wärmt Hände und Seele, während die süßen Mandeln knuspernd Erinnerungen an vergangene Jahre heraufbeschwören. Inmitten des bunten Treibens auf den Weihnachtsmärkten entfaltet sich eine stille Harmonie - eine Feier des Augenblicks, voller Vertrautheit und leiser Freude.', 'Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleichermaßen, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die kühle Luft trägt den Hauch von Winter, während die &hellip;', '15311dd0d03d13f6cc6b26a95f2a1dd8', 1, 1, 1, 180, '2024-12-07 13:36:00', '2025-02-25 15:00:24'),
(180, '2025-02-02 20:49:01', 'Warum MCSL auf Laravel/Vue basiert – Die Technologie hinter diesem Blog', 2, 1, 'In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die **Flexibilität**, **Skalierbarkeit** und **Benutzerfreundlichkeit** von Laravel. Heute möchte ich ein wenig darüber sprechen, warum **MCSL** auf Laravel basiert und wie es gemeinsam mit **Vue.js** das **Rückgrat** unseres Blogs bildet.\n\n--- \n\n ## Warum Laravel?\n\nLaravel ist ein **PHP-Framework**, das für seine **elegante Syntax**, **robusten Funktionen** und **entwicklerfreundlichen Tools** bekannt ist. Es vereinfacht den Entwicklungsprozess und bietet gleichzeitig leistungsstarke Funktionen. Mit Features wie **Authentifizierung**, **Routing**, **Sessions** und **Caching** stellt Laravel alles zur Verfügung, was benötigt wird, um leistungsstarke Webanwendungen wie **MCSL** zu entwickeln.\n\n### **Wichtige Gründe, warum Laravel die Basis von MCSL ist:**\n\n- **Schnelle Entwicklungszeiten:**  \n  Laravel’s **Artisan CLI** automatisiert wiederkehrende Aufgaben und beschleunigt so den Entwicklungsprozess erheblich.  \n\n- **Modularität:**  \n  Laravel’s **modulare Architektur** ermöglicht es uns, Funktionen wie **Benutzerverwaltung**, **API-Integrationen** und **Datenverwaltung** einfach zu implementieren und zu erweitern.  \n\n- **Sicherheit:**  \n  Laravel bietet integrierten Schutz vor gängigen Sicherheitslücken wie **CSRF**, **SQL-Injektionen** und **XSS-Angriffen**, wodurch MCSL von Anfang an sicher ist.\n--- \n## **Warum Vue.js?**\n\nVue.js ist ein **JavaScript-Framework**, das speziell dafür entwickelt wurde, benutzerfreundliche und reaktive Benutzeroberflächen zu erstellen. Zusammen mit Laravel bildet es eine perfekte Kombination für moderne Webanwendungen.\n\n### **Vorteile von Vue.js in MCSL:**\n\n- **Echtzeit-Updates:**  \n  Vue.js ermöglicht es, **Benutzerinteraktionen** ohne komplette Seitenaktualisierungen zu verarbeiten, sodass Änderungen in Echtzeit angezeigt werden.\n\n- **Komponentenstruktur:**  \n  Vue.js erlaubt es, verschiedene Teile der Anwendung als unabhängige, wiederverwendbare Komponenten zu erstellen. Das fördert eine **saubere und modulare Codebasis**.\n\n- **Interaktive Benutzeroberflächen:**  \n  Vue.js ermöglicht es, **dynamische und benutzerfreundliche Oberflächen** zu entwickeln, die direkt mit Laravel’s API kommunizieren.\n--- \n## **MCSL: Laravel und Vue.js im Zusammenspiel**\n\nMCSL ist mehr als nur ein **Content-Management-System (CMS)** — es ist eine moderne Webplattform, die von den **Stärken von Laravel und Vue.js** profitiert. Laravel fungiert dabei als **starke Backend-Architektur**, während Vue.js eine **dynamische und reaktionsschnelle Benutzeroberfläche** bereitstellt.\n\n### **Kernkomponenten der MCSL-Architektur:**\n\n- **Echtzeit-Datenverwaltung:**  \n  Laravel und Vue.js ermöglichen es, Daten in Echtzeit zu aktualisieren und anzuzeigen.\n\n- **Nahtlose API-Integration:**  \n  Laravel bietet leistungsstarke APIs, die von Vue.js genutzt werden, um eine reibungslose Benutzererfahrung zu gewährleisten.\n\n- **Dynamische Benutzeroberflächen:**  \n  Dank Vue.js kann MCSL interaktive Funktionen wie Drag-and-Drop, Inline-Bearbeitung und Live-Datenaktualisierungen bieten.', 'In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die **Flexibilität**, **Skalierbarkeit** und **Benutzerfreundlichkeit** von Laravel. Heute möchte ich ein wenig darüber sprechen, warum **MCSL** auf Laravel basiert und wie es gemeinsam mit **Vue.js** das **Rückgrat** unseres Blogs bildet. &hellip;', '15311dd0d03d13f6cc6b26a95f2a1d99', 2, 1, 1, 181, '2025-02-26 20:45:25', '2025-02-25 15:00:24');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blog_authors`
--

CREATE TABLE `blog_authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `users_id` bigint(11) NOT NULL,
  `info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `blog_authors`
--

INSERT INTO `blog_authors` (`id`, `name`, `users_id`, `info`, `created_at`, `updated_at`) VALUES
(1, 'Asario', 1, 'Seit über 20 Jahren PHP Developer, nun geht\'s an Laravel & VUE\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `summary`, `created_at`, `updated_at`) VALUES
(1, 'News', 'Neuigkeiten', '2025-01-22 17:00:24', NULL),
(2, 'Devlog', 'Developer Log', '2025-01-22 17:02:27', NULL),
(3, 'Mindblog', 'Meine Gedankenwelt', '2025-01-22 17:04:17', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blog_images`
--

CREATE TABLE `blog_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT 'http://localhost:8000/images/blog_empty.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `blog_images`
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
(34, 'Wie man aus 4 LeinwÃ¤nden 1 Lichtobjekt macht....', '/images/blogs/auriel.jpg', '2013-05-20 17:26:00', '2013-05-20 17:26:00'),
(35, 'Neuer Fernseher in Asarios Home Office.', '/images/blogs/bigtv.jpg', '2013-05-20 17:52:00', '2013-05-20 17:52:00'),
(36, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2013-06-23 19:37:00', '2013-06-23 19:37:00'),
(37, 'Smilies all over the World', '/images/blogs/smilies.jpg', '2013-06-23 19:38:00', '2013-06-23 19:38:00'),
(38, 'Alles Neue Macht der Juli.', '/images/blogs/juli.jpg', '2013-07-14 17:55:00', '2013-07-14 17:55:00'),
(39, 'Der Fernseher h&auml;ngt an der Wand ;)', '/images/blogs/tvset.jpg', '2013-08-11 18:00:00', '2013-08-11 18:00:00'),
(40, 'Frohes Neues - 2014 - ein GlÃ¼cksjahr', '/images/blogs/NEW_YEAR2.jpg', '2014-01-05 18:14:00', '2014-01-05 18:14:00'),
(41, 'Neues Layout !', '/images/blogs/lampen.jpg', '2014-02-10 19:02:00', '2014-02-10 19:02:00'),
(42, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-03-02 19:04:00', '2014-03-02 19:04:00'),
(43, 'Ausstellung in Kaltenkirchen', '/images/blogs/ausstellung.png', '2014-03-31 17:07:00', '2014-03-31 17:07:00'),
(44, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-04-13 17:35:00', '2014-04-13 17:35:00'),
(45, 'Frohe Ostern... Der Osterhase war da!', '/images/blogs/easter.png', '2014-04-27 17:36:00', '2014-04-27 17:36:00'),
(46, '3 neue Galerien', '/images/blogs/newgal.jpg', '2014-06-17 17:31:00', '2014-06-17 17:31:00'),
(47, 'Bewertungsfunktion fÃ¼r Bilder.', '/images/blogs/starz.jpg', '2014-08-25 17:49:00', '2014-08-25 17:49:00'),
(48, 'Mein neues Bike', '/images/blogs/Hubertus.JPG', '2014-10-19 17:29:00', '2014-10-19 17:29:00'),
(49, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2014-10-25 16:14:00', '2014-10-25 16:14:00'),
(50, 'New Images', '/images/blogs/saurier.jpg', '2014-11-02 14:33:00', '2014-11-02 14:33:00'),
(51, 'Mein erster Ritt...', '/images/blogs/Horseriding.jpg', '2014-11-16 17:49:00', '2014-11-16 17:49:00'),
(52, 'Frohe Weihnachten und einen...', '/images/blogs/coca2.jpg', '2014-12-05 18:30:00', '2014-12-05 18:30:00'),
(53, 'Der FrÃ¼hling kommt.', '/images/blogs/spring2015.jpg', '2015-03-20 17:49:00', '2015-03-20 17:49:00'),
(54, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-03-20 17:51:00', '2015-03-20 17:51:00'),
(55, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-03-20 17:55:00', '2015-03-20 17:55:00'),
(56, 'Elke ist tod. :(', '/images/blogs/elke_history.jpg', '2015-05-05 16:16:00', '2015-05-05 16:16:00'),
(57, 'Neue BilderÂ²', '/images/blogs/easter_2015.jpg', '2015-05-05 16:18:00', '2015-05-05 16:18:00'),
(58, 'Neue Fineliner Bilder gesichtet...', '/images/blogs/dragon.jpg', '2015-07-05 16:19:00', '2015-07-05 16:19:00'),
(59, 'Shopping Tour in NeumÃ¼nster', '/images/blogs/new_shoes.jpg', '2015-07-19 17:21:00', '2015-07-19 17:21:00'),
(60, 'Haare AB!', '/images/blogs/haircut.jpg', '2015-08-04 16:13:00', '2015-08-04 16:13:00'),
(61, 'Ricklinger Jahresfest 2015', '/images/blogs/jahresfest.jpg', '2015-08-30 18:26:00', '2015-08-30 18:26:00'),
(62, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-09-06 17:29:00', '2015-09-06 17:29:00'),
(63, 'Neue Shortstories', '/images/blogs/short_st.jpg', '2015-09-15 16:44:00', '2015-09-15 16:44:00'),
(64, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-10-04 18:03:00', '2015-10-04 18:03:00'),
(65, 'JQuery UI integrated', '/images/blogs/jquery.jpg', '2015-10-13 16:50:00', '2015-10-13 16:50:00'),
(66, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-10-27 17:00:00', '2015-10-27 17:00:00'),
(67, 'Neues Kleid fÃ¼r alte GerÃ¼ste.', '/images/blogs/sar.jpg', '2015-10-27 17:02:00', '2015-10-27 17:02:00'),
(68, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2015-11-24 18:37:00', '2015-11-24 18:37:00'),
(69, 'Neue Galerie und einige nette Details', '/images/blogs/daimkon.jpg', '2015-12-18 19:17:00', '2015-12-18 19:17:00'),
(70, 'Happy New Year', '/images/blogs/sylv_2015_2016.jpg', '2016-01-03 17:15:00', '2016-01-03 17:15:00'),
(71, '2 neue Galerien gefunden', '/images/blogs/07new_noname.jpg', '2016-01-15 18:10:00', '2016-01-15 18:10:00'),
(72, 'Neue Domain VerfÃ¼gbar.', '/images/blogs/05new_noname.jpg', '2016-02-09 18:55:00', '2016-02-09 18:55:00'),
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
(94, 'Herzlichen GlÃ¼ckwunsch', '/images/blogs/09new_noname.jpg', '2017-06-17 15:56:00', '2017-06-17 15:56:00'),
(95, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-06-20 17:45:00', '2017-06-20 17:45:00'),
(96, 'Internationalisierung vorangetrieben', '/images/blogs/multilang_overall.jpg', '2017-06-30 18:07:00', '2017-06-30 18:07:00'),
(97, 'Habe mal wieder geschraubt.', '/images/blogs/18new_noname.jpg', '2017-07-07 16:26:00', '2017-07-07 16:26:00'),
(98, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2017-07-11 16:44:00', '2017-07-11 16:44:00'),
(99, 'Neues Design', '/images/blogs/38new_noname.jpg', '2017-07-29 16:06:00', '2017-07-29 16:06:00'),
(100, 'SSL Ãœberall', '/images/blogs/33new_noname.jpg', '2017-08-20 13:40:00', '2017-08-20 13:40:00'),
(101, 'Neues auf meinem Blog', '/images/blogs/35new_noname.jpg', '2017-09-10 10:48:00', '2017-09-10 10:48:00'),
(102, 'Neue Bilder gefunden', '/images/blogs/34new_noname.jpg', '2017-09-17 17:16:00', '2017-09-17 17:16:00'),
(103, 'Mein Praktikum', '/images/blogs/40new_noname.jpg', '2017-10-14 17:08:00', '2017-10-14 17:08:00'),
(104, 'Neuer Ascher', '/images/blogs/41new_noname.jpg', '2017-10-29 11:56:00', '2017-10-29 11:56:00'),
(105, 'VerÃ¤ndertes Layout', '/images/blogs/20new_noname.jpg', '2017-11-12 13:59:00', '2017-11-12 13:59:00'),
(106, 'Neue Galerie', '/images/blogs/30new_noname.jpg', '2017-11-19 08:18:00', '2017-11-19 08:18:00'),
(107, 'Endlich wieder Online', '/images/blogs/21new_noname.jpg', '2017-12-20 08:10:00', '2017-12-20 08:10:00'),
(108, 'Neue Monstar Pix', '/images/blogs/42new_noname.jpg', '2018-01-28 08:17:00', '2018-01-28 08:17:00'),
(109, 'Shortstories wird zu Shortpoems', '/images/blogs/26new_noname.jpg', '2018-03-02 16:55:00', '2018-03-02 16:55:00'),
(110, 'Neue Kamera', '/images/blogs/56new_noname.jpg', '2018-04-02 14:26:00', '2018-04-02 14:26:00'),
(111, 'Neues Wallpaper @ Digital Galerie', '/images/blogs/63new_noname.jpg', '2018-04-15 10:28:00', '2018-04-15 10:28:00'),
(112, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-04-18 17:32:00', '2018-04-18 17:32:00'),
(113, 'Kein Bild Vorhanden', '/images/blogs/008.jpg', '2018-04-20 16:20:00', '2018-04-20 16:20:00'),
(114, 'Mein Smartphone', '/images/blogs/66new_noname.jpg', '2018-04-29 08:49:00', '2018-04-29 08:49:00'),
(115, 'LayoutverÃ¤nderung 2.0', '/images/blogs/60new_moname.jpg', '2018-05-01 16:53:00', '2018-05-01 16:53:00'),
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
(174, 'Frühling', '/images/blogs/7b3cd6e8c28cc9ee80b122d085f9ff79.jpg', '2024-03-13 23:00:00', '2024-03-13 23:00:00'),
(175, 'Sommer 2024', '/images/blogs/2cb4d6cdd6b5a3b3551824c54d9b3cc0.jpg', '2024-04-21 13:54:00', '2024-04-21 13:54:00'),
(176, 'Neues Layout', '/images/blogs/a72b888abc6d4430a697c77ff2adabf8.png', '2024-07-16 22:00:00', '2024-07-16 22:00:00'),
(177, 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', '/images/blogs/9443b4d9d13c07d1de2607cbc2b1f147.jpg', '2024-08-08 10:08:00', '2024-08-08 10:08:00'),
(178, 'Laravel Experimente', '/images/blogs/1f19113fd5e6d3034053946fa19216ce.jpg', '2024-08-18 12:25:00', '2024-08-18 12:25:00'),
(179, 'Und schon wieder haben wir Halloween!', '/images/blogs/88d46e6c705129501bdd680082b4ff7e.jpg', '2024-10-31 09:35:00', '2024-10-31 09:35:00'),
(180, 'X-Mas 2024', '/images/blogs/ae9cca18e24abc8d33617425f56ad5ad.jpg', '2024-12-07 14:36:00', '2024-12-07 14:36:00'),
(181, 'Warum MCSL auf Laravel basiert – Die Technologie hinter diesem Blog', '/images/blogs/d1adb2203dbe352814a1271ee5df2962.jpg', '2025-01-26 23:00:00', '2025-01-26 23:00:00'),
(190, 'Neuerungen im System', '/images/blogs/inno.jpg', '2025-01-26 23:00:00', '2025-01-26 23:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `camera`
--

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
-- Daten für Tabelle `camera`
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
(11, 1, 11, 'Google Pixel 3a', 'Pixel 3a', '', 'asario', 'Asario', 'GOOGLE', 'Pixel 3a'),
(12, 1, 12, 'Pixel 7a (Pauleman)', 'Pixel 7a', '900', 'asario', 'Asario', NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `comments`
--

CREATE TABLE `comments` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL DEFAULT 1,
  `users_id` bigint(11) NOT NULL,
  `post_id` bigint(11) NOT NULL,
  `tablename` varchar(200) DEFAULT NULL,
  `content` text NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `xis_checked` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `comments`
--

INSERT INTO `comments` (`id`, `pub`, `users_id`, `post_id`, `tablename`, `content`, `email`, `created_at`, `updated_at`, `xis_checked`) VALUES
(1, 1, 1, 363, 'images', '133333333333', 'info@asario.de', '2024-11-20 12:23:38', '2024-11-20 12:23:38', 0),
(2, 1, 1, 365, 'images', 'pöolpü', 'info@asario.de', '2024-11-20 13:36:30', '2024-11-20 13:36:30', 0),
(3, 1, 1, 365, 'images', 'test 213', 'info@asario.de', '2024-11-20 13:36:42', '2024-11-20 13:36:42', 0),
(4, 1, 1, 363, 'images', '1321111111111111111', 'info@asario.de', '2024-11-20 14:16:56', '2024-11-20 14:16:56', 0),
(5, 1, 1, 365, 'images', 'oloooooooooooooool', 'info@asario.de', '2024-11-21 09:51:51', '2024-11-21 09:51:51', 0),
(6, 1, 1, 365, 'images', 'püloool', 'info@asario.de', '2024-11-21 10:16:52', '2024-11-21 10:16:52', 0),
(7, 1, 1, 363, 'images', 'hallo welt', 'info@asario.de', '2024-11-21 15:30:29', '2024-11-21 15:30:29', 0),
(8, 1, 1, 363, 'images', 'test 213', 'info@asario.de', '2024-11-22 16:48:08', '2024-11-22 16:48:08', 0),
(9, 1, 1, 363, 'images', 'test 123', 'info@asario.de', '2024-11-23 10:17:13', '2024-11-23 10:17:13', 0),
(10, 1, 1, 329, 'images', '123', 'info@asario.de', '2024-11-23 10:17:40', '2024-11-23 10:17:40', 0),
(11, 1, 1, 329, 'images', 'test 2331', 'info@asario.de', '2024-11-23 10:20:15', '2024-11-23 10:20:15', 0),
(12, 1, 1, 329, 'images', '123333333333333', 'info@asario.de', '2024-11-23 10:25:17', '2024-11-23 10:25:17', 0),
(14, 1, 1, 329, 'images', '123465789123456790012345678901233112\r\n213113', 'info@asario.de', '2024-11-24 15:40:03', '2024-11-24 15:40:03', 0),
(15, 1, 1, 363, 'images', 'klopapier', 'info@asario.de', '2024-11-26 15:49:32', '2024-11-26 15:49:32', 0),
(16, 1, 1, 365, 'images', 'hallo World', 'info@asario.de', '2024-11-28 15:40:40', '2024-11-28 15:40:40', 0),
(17, 1, 1, 182, 'blog_posts', 'ein etwas längerer', 'info@asario.de', '2024-11-29 18:22:50', '2024-11-29 18:22:50', 0),
(18, 1, 1, 182, 'blog_posts', 'asdsadasdasdasdasdasdasdasdasdadsdds', 'info@asario.de', '2024-11-29 19:30:03', '2024-11-29 19:30:03', 0),
(19, 1, 1, 182, 'blog_posts', 'hallo welt !', 'info@asario.de', '2024-11-29 19:31:38', '2024-11-29 19:31:38', 0),
(20, 1, 1, 180, 'blog_posts', '2132132', 'info@asario.de', '2024-11-30 12:24:52', '2024-11-30 12:24:52', 0),
(22, 1, 1, 365, 'images', 'test des redirect', 'info@asario.de', '2024-12-01 10:03:14', '2024-12-01 10:03:14', 0),
(23, 1, 1, 344, 'images', 'your commment', 'info@asario.de', '2024-12-15 15:18:56', '2024-12-15 15:18:56', 0),
(24, 1, 1, 182, 'blog_posts', 'Comment new Number 1', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(25, 1, 2, 182, 'blog_posts', 'Comment new Number 2', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(26, 1, 2, 182, 'blog_posts', 'Comment new Number 3', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(27, 1, 2, 182, 'blog_posts', 'Comment new Number 4', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(28, 1, 2, 182, 'blog_posts', 'Comment new Number 5', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(29, 1, 1, 182, 'blog_posts', 'Comment new Number 6', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(30, 1, 1, 182, 'blog_posts', 'Comment new Number 7', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(31, 1, 1, 182, 'blog_posts', 'Comment new Number 8', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(32, 1, 2, 182, 'blog_posts', 'Comment new Number 9', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(33, 1, 1, 182, 'blog_posts', 'Comment new Number 10', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(34, 1, 1, 182, 'blog_posts', 'Comment new Number 11', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(35, 1, 2, 182, 'blog_posts', 'Comment new Number 12', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(40, 1, 1, 182, 'blog_posts', 'Comment new Number 17', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(41, 1, 1, 182, 'blog_posts', 'Comment new Number 18', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(42, 1, 1, 182, 'blog_posts', 'Comment new Number 19', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(43, 1, 2, 182, 'blog_posts', 'Comment new Number 20', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(44, 1, 1, 182, 'blog_posts', 'Comment new Number 21', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(45, 1, 2, 182, 'blog_posts', 'Comment new Number 22', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(46, 1, 1, 182, 'blog_posts', 'Comment new Number 23', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(47, 1, 1, 182, 'blog_posts', 'Comment new Number 24', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(48, 1, 1, 182, 'blog_posts', 'Comment new Number 25', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(49, 1, 1, 182, 'blog_posts', 'Comment new Number 26', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(50, 1, 2, 182, 'blog_posts', 'Comment new Number 27', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(51, 1, 1, 182, 'blog_posts', 'Comment new Number 28', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(52, 1, 1, 182, 'blog_posts', 'Comment new Number 29', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(53, 1, 1, 182, 'blog_posts', 'Comment new Number 30', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(54, 1, 1, 182, 'blog_posts', 'Comment new Number 31', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(56, 1, 1, 182, 'blog_posts', 'Comment new Number 33', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(57, 1, 2, 182, 'blog_posts', 'Comment new Number 34', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(58, 1, 1, 182, 'blog_posts', 'Comment new Number 35', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(59, 1, 1, 182, 'blog_posts', 'Comment new Number 36', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(60, 1, 2, 182, 'blog_posts', 'Comment new Number 37', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(61, 1, 1, 182, 'blog_posts', 'Comment new Number 38', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(62, 1, 2, 182, 'blog_posts', 'Comment new Number 39', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(63, 1, 1, 182, 'blog_posts', 'Comment new Number 40', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(64, 1, 1, 182, 'blog_posts', 'Comment new Number 41', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(65, 1, 2, 182, 'blog_posts', 'Comment new Number 42', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(66, 1, 1, 182, 'blog_posts', 'Comment new Number 43', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(67, 1, 2, 182, 'blog_posts', 'Comment new Number 44', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(68, 1, 1, 182, 'blog_posts', 'Comment new Number 45', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(69, 1, 1, 182, 'blog_posts', 'Comment new Number 46', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(70, 1, 1, 182, 'blog_posts', 'Comment new Number 47', 'info@asario.de', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(71, 1, 2, 182, 'blog_posts', 'Comment new Number 48', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(72, 1, 2, 182, 'blog_posts', 'Comment new Number 49', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(73, 1, 2, 182, 'blog_posts', 'Comment new Number 50', 'malte@example.com', '2024-12-28 16:41:18', '2024-12-28 16:41:18', 0),
(74, 1, 2, 427, 'images', 'Comment new Number 1', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(75, 1, 2, 427, 'images', 'Comment new Number 2', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(76, 1, 1, 427, 'images', 'Comment new Number 3', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(77, 1, 1, 427, 'images', 'Comment new Number 4', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(78, 1, 2, 427, 'images', 'Comment new Number 5', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(79, 1, 2, 427, 'images', 'Comment new Number 6', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(80, 1, 1, 427, 'images', 'Comment new Number 7', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(81, 1, 1, 427, 'images', 'Comment new Number 8', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(82, 1, 1, 427, 'images', 'Comment new Number 9', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(83, 1, 2, 427, 'images', 'Comment new Number 10', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(84, 1, 1, 427, 'images', 'Comment new Number 11', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(85, 1, 2, 427, 'images', 'Comment new Number 12', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(86, 1, 1, 427, 'images', 'Comment new Number 13', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(87, 1, 2, 427, 'images', 'Comment new Number 14', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(88, 1, 2, 427, 'images', 'Comment new Number 15', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(89, 1, 2, 427, 'images', 'Comment new Number 16', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(90, 1, 1, 427, 'images', 'Comment new Number 17', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(91, 1, 1, 427, 'images', 'Comment new Number 18', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(93, 1, 1, 427, 'images', 'Comment new Number 20', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(95, 1, 2, 427, 'images', 'Comment new Number 22', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(97, 1, 2, 427, 'images', 'Comment new Number 24', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(98, 1, 2, 427, 'images', 'Comment new Number 25', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(100, 1, 2, 427, 'images', 'Comment new Number 27', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(101, 1, 2, 427, 'images', 'Comment new Number 28', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(102, 1, 2, 427, 'images', 'Comment new Number 29', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(103, 1, 2, 427, 'images', 'Comment new Number 30', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(104, 1, 1, 427, 'images', 'Comment new Number 31', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(107, 1, 1, 427, 'images', 'Comment new Number 34', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(108, 1, 2, 427, 'images', 'Comment new Number 35', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(109, 1, 2, 427, 'images', 'Comment new Number 36', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(110, 1, 2, 427, 'images', 'Comment new Number 37', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(111, 1, 1, 427, 'images', 'Comment new Number 38', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(112, 1, 1, 427, 'images', 'Comment new Number 39', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(113, 1, 2, 427, 'images', 'Comment new Number 40', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(114, 1, 2, 427, 'images', 'Comment new Number 41', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(115, 1, 1, 427, 'images', 'Comment new Number 42', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(116, 1, 1, 427, 'images', 'Comment new Number 43', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(117, 1, 1, 427, 'images', 'Comment new Number 44', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(118, 1, 2, 427, 'images', 'Comment new Number 45', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(119, 1, 2, 427, 'images', 'Comment new Number 46', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(120, 1, 1, 427, 'images', 'Comment new Number 47', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(121, 1, 1, 427, 'images', 'Comment new Number 48', 'info@asario.de', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(122, 1, 2, 427, 'images', 'Comment new Number 49', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(123, 1, 2, 427, 'images', 'Comment new Number 50', 'malte@example.com', '2024-12-28 18:34:08', '2024-12-28 18:34:08', 0),
(124, 1, 1, 180, 'blog_posts', 'test 213', 'info@asario.de', '2024-12-28 19:50:22', '2024-12-28 19:50:22', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `didyouknow`
--

CREATE TABLE `didyouknow` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(2) NOT NULL,
  `position` int(11) NOT NULL,
  `author_id` bigint(11) NOT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `answer` mediumtext NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `chg_date` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Daten für Tabelle `didyouknow`
--

INSERT INTO `didyouknow` (`id`, `pub`, `position`, `author_id`, `headline`, `answer`, `created_at`, `chg_date`) VALUES
(1, 1, 0, 1, ' dass am 4.5. Star Wars Tag ist', 'May the 4th will be with you,  <br />\nmay the force will be with you.', '2018-05-05 15:38:52', 1525527532),
(2, 1, 1, 1, ' dass In Schleswig Holstein die glücklichsten Menschen Deutschlands leben', 'Schleswig Holsteiner sind die glücklichsten im Bundesdurchschnitt.', '2018-05-05 15:43:35', 1525527815),
(3, 1, 2, 1, ' dass eine Hummel laut Gesetzen der Aerodynamik gar nicht fliegen kann.', 'Die Hummel wiegt 4,8\nGramm. Sie hat eine\nFlügelfläche von\n1,45 cm² bei einem\nFlächenwinkel von 6\nGrad.  \nNach den Gesetzen\nder Aerodynamik kann die\nHummel nicht fliegen.\nAber die Hummel weiß das\nnicht.  \n(Wer hätte das\ngedacht!)', '2018-05-05 15:47:46', 1525528066),
(4, 1, 3, 2, ' dass ein Saxophon ein Holzblasinstrument ist', 'Ja, da der Tonerzeuger (das Rohrblatt) aus Holz ist, gehört das Saxophon zu den Holzbläsern.', '2024-09-22 14:37:00', 1525528657),
(5, 1, 4, 2, ' dass man vom Kaffee Entzug Kopfschmerzen bekommen kann', 'Bei einigen Menschen sorgt der Kaffee Entzug für starke Kopfschmerzen.', '2024-09-22 14:24:00', 1525529238),
(6, 1, 5, 2, ' dass Heroin keine Psychosen auslöst', 'Als einzige illegale Droge führt Heroin nicht zu Psychosen.  \nTrotzdem sollte man sowas nicht ausprobieren.', '2018-05-05 16:09:09', 1525529349),
(7, 1, 6, 2, ' dass Hunde ein glänzendes Fell bekommen wenn man Sie mit Thunfisch füttert', 'Ja, Thunfisch in Öl sorgt für ein glänzendes Fell bei Hunden.  \nAchtung: wenn der Hund es nicht verträgt kann es zu Durchfall kommen (wegen dem Öll)', '2018-05-05 16:39:20', 1525531160),
(8, 1, 7, 2, ' dass auf einer Zahnbürste mehr Keime zu finden sind als auf einer Klobrille', 'Die Keimbelastung einer Zahnbüste ist höher als auf einem Smartphone oder einer Klobrille. Die Keime sind aber wichtig um das Essen beim kauen vorzuverdauen.', '2018-05-05 16:50:21', 1525531821),
(9, 1, 8, 2, ' dass Erdbeeraroma nicht aus Erdbeeren sondern aus Sägemehl hergestellt wird', 'Ja, Erdbeerarome wird aus Pilzkulturen gewonnen die auf BuchenholzspÃ¤nen wachsen.', '2018-05-06 11:14:05', 1525598045),
(10, 1, 9, 2, ' dass Urin je nach Verweildauer in der Blase dunkler gefärbt ist', 'Desto länger der Urin in der Blase ist, desto dunkler ist er beim Pinkeln.', '2018-05-07 18:11:03', 1525709463),
(11, 1, 10, 2, ' dass die Armspannweite normalerweise der Körpergröße entspricht', 'Bei den meisten Menschen beträgt die Armspannweite der Körpergröße.', '2018-05-07 18:14:25', 1525709665),
(12, 1, 11, 2, ' dass Rollmöpse in Wirklichkeit Gurken essen', 'Sonst währ ja keine Gurke drin :).', '2018-05-07 18:15:37', 1525709737),
(13, 1, 12, 2, ' dass Intelligente Menschen zu einer Sauklaue neigen', 'Laut Studien haben Intelligente Menschen eher eine unleserliche Handschrift als andere.', '2018-05-07 18:17:22', 1525709842),
(14, 1, 13, 2, ' dass reife Bananen Alkohol enthalten', 'Ja, reife Bananen enthalten bis zu 1.24 % Alkohol.', '2018-05-07 18:20:48', 1525710048),
(15, 1, 14, 2, ' dass Nat&uuml;rlich nur hei&szlig;t das es naturidentisch ist', 'Natürliche Zutaten müssen nicht aus der Natur stammen, Sie sind lediglich in der Natur in dieser Form vorhanden, müssen aber nicht aus Naturprodukten produziert worden sein.', '2018-05-07 19:55:16', 1525715716),
(16, 1, 15, 2, ' dass Teetrinker oft Halbblind sind', 'Sie vergessen nämlich den Löffel rauszunehmen.', '2018-05-11 10:20:31', 1526026831),
(17, 1, 16, 2, ' dass Wiener Schnitzel immer aus Kalbsfleisch hergestellt wird', 'Lediglich das Schnitzel \"Wiener Art\" ist aus Schweinefleisch.', '2018-05-11 10:22:01', 1526026921),
(18, 1, 17, 2, ' dass ein Pferd heisst Pferd weil es lebt auf der Erd', 'Lebte es in der Luft hiess es Pfluft.', '2018-05-12 13:27:22', 1526124442),
(19, 1, 18, 2, ' dass im deutschem K&auml;sekuchen gar kein K&auml;se drin ist', 'Im Amerikanischem Cheesecake ist aber Frischkäse mit drin.', '2018-05-13 15:02:39', 1526216559),
(20, 1, 19, 2, ' dass Die Taschenuhrtasche noch heute verbaut wird', 'Die kleine Tasche in Jeans in der rechten vorderen Tasche ist Ursprünglich für Taschenuhren konzipiert. Aber noch heute passt eine Taschenuhr hinein.', '2018-05-15 18:08:49', 1526400529),
(21, 1, 20, 2, ' dass Salvator Dahl&iacute; das Logo von Chuppa Chups entworfen hat', 'Ja Dahlí hat damals das Logo des spanischem Lolliproduzenten designt.', '2018-05-16 17:15:08', 1526483708),
(22, 1, 21, 2, ' dass die Zunge der st&auml;rkste Muskel im K&ouml;rper eines Menschen ist', 'Ja die Zunge ist starkt und wird nicht von einem Knochen gestützt.', '2018-05-16 17:17:47', 1526483867),
(23, 1, 22, 2, ' dass Schlittenhund im Winter Schuhe tragen', 'Ja, die empfindlichen Pfoten werden bei Schlittenhunden mit einer art Schuhe geschützt.', '2018-05-16 17:20:29', 1526484029),
(24, 1, 23, 2, ' dass die Zeit schneller vergeht wenn einem etwas Spa&szlig; macht', 'Wenn wir Spaß an einer Sache haben kommt einem die Zeit kürzer vor.  <br />\nMan nehme 2 Gruppen, eine Spielt Billiard mit Frauen in Bikini und eine Gruppe schält Kartoffeln. Gruppe 1 dachte das sie eine viertel Stunde gespielt hat, während die Andere Gruppe glaubte eine Dreviertelstunde zu schälen. Beide Gruppen waren 30 Minuten beschäftigt.  <br />\nErgo, wenn eine Sache Spaß macht vergeht die Zeit schneller.+', '2018-05-17 19:28:14', 1526578094),
(25, 1, 24, 1, ' dass Wodka auf deutsch &uuml;bersetzt W&auml;sserchen heisst', 'Im Russischem steht das Wort Woda für Wasser, mit der verniedlichung \"ka\" am ende heißt es Wässerchen oder eben Wodka', '2018-05-17 19:30:23', 1526578223),
(26, 1, 25, 2, ' dass man Seine Wirbels&auml;ule knacken h&ouml;rt wenn man sein Ohr auf den Bauchnabel legt', 'Ja was soll man denn sonst hören :)', '2018-05-17 19:32:40', 1526578360),
(27, 1, 26, 2, ' dass Pferde nicht kotzen k&ouml;nnen', 'Pferde können nicht kotzen und deswegen ernähren Sie sich nur mit gesundem Futter.  <br />\nIm schlimmsten Fall bekommen Sie eine Schlundverstopfung die Ärztlich behandelt werden muss.', '2018-05-18 18:53:14', 1526662394),
(28, 1, 27, 2, ' dass man schwangere Frauen immer auf die linke Seite bei einer stabilen Seitenlage legen soll', 'Die Vene die das Embryo ernährt liegt auf der rechten Seite und sollte nicht abgeklemmt werden. Deswegen immer auf Links drehen.', '2018-05-18 18:55:44', 1526662544),
(29, 1, 28, 2, 'warum Vogelschei&szlig;e immer Wei&szlig; ist', 'Weil Vögel nicht Pinkeln können vermischt sich der Urin mit der Kacke und der Amoniak im Urin färbt die Scheiße Weiß.', '2018-06-03 08:17:30', 1528006650),
(30, 1, 29, 2, 'was das gr&ouml;&szlig;te Organ im menschlichem K&ouml;rper ist', 'Die Haut ist das größte Organ im menschlichem Körper.', '2018-06-03 08:20:17', 1528006817),
(31, 1, 30, 2, 'woran man einen Staatswagen erkennt', 'Das Nummernschild hat nach dem - nur eine Zahl. z.B. SE-123456', '2018-06-03 08:22:43', 1528006963),
(32, 1, 31, 2, ' dass Wasser trinken t&ouml;dlich sein kann', 'Ja, wer zu viel Wasser trinkt kann davon sterben weil die gesamten Elektrolyte rausgespielt werden. Aber das ist erst ab 8 Liter pro Tag gefährlich', '2018-06-03 08:25:29', 1528007129),
(33, 1, 32, 2, 'was der unterschied zwischen Moin und Moin Moin ist', 'Moin ist in Norddeutschland eine beliebte Begrüßungsfloskel.  <br />\nMoin Moin heißt im Prinzip das selbe wie Moin nur das der der Moin Moin sagt eher redselig ist.', '2018-06-03 08:28:59', 1528007339),
(34, 1, 33, 2, ' dass Espresso weniger Koffein enth&auml;lt als eine Tasse Kaffee', 'Robusta-Bohnen sind zwar etwas koffeinreicher als Arabica-Bohnen, aber insgesamt enthält ein Espresso doch weniger Koffein als Filterkaffee. Das liegt schlicht daran, dass er sehr viel kleiner ist.', '2018-06-10 15:49:23', 1528638563),
(35, 1, 34, 2, ' dass Arbeitspferde auf kurzen Strecken mehr als 1 PS leisten', 'Bis zu 24 PS können Kaltblüter auf kurzen Strecken erreichen.  <br />\nSomit ist eine Pferdestärke nicht immer ein PS.', '2018-06-23 16:00:18', 1529762418),
(36, 1, 35, 2, ' dass Frauen sich seltener die H&auml;nde waschen als M&auml;nner', 'Eine Studie unter Medizinern besagt, das sich Frauen nach dem Toilettengang sich seltener die Hände waschen als Männer.', '2018-06-23 16:03:46', 1529762626),
(37, 1, 36, 2, 'was der unterschied zwischen einer richtigen Schlange und einer Autoschlange ist', 'Bei der richtigen Schlange ist das Arschloch hinten.', '2018-06-23 16:27:19', 1529764039),
(38, 1, 37, 2, 'was la cucaracha auf deutsch hei&szlig;t', 'Es heißt, die Kakerlake.', '2018-06-23 16:34:39', 1529764479),
(39, 1, 38, 2, ' dass Aluminium nicht Rosten kann', 'Ja, Aluminium in reiner Form kann nicht rosten.', '2018-07-02 18:35:12', 1530549312),
(40, 1, 39, 2, ' dass Elefantenk&uuml;he 22 Monate tragen', 'Ja Elefantenkühe tragen 22 Monate bis sie ihr Kind gebären.', '2018-07-06 16:12:00', 1530886320),
(41, 1, 40, 2, ' dass Pommes Frites nicht aus Frankreich stammen', 'Pommes Frites, was auf deutsch frittierter Apfel heißt stammt tatsächlich aus Belgien.', '2018-07-15 08:57:14', 1531637834),
(42, 1, 41, 2, 'wer die meisten Motoren baut', 'Honda baut die meisten Motoren auf der Welt.', '2018-07-29 09:19:09', 1532848749),
(43, 1, 42, 2, 'wonach Rubinienholz riecht wenn man es schleift', 'Es riecht nach Kekse.', '2018-07-29 09:20:40', 1532848840),
(44, 1, 43, 2, ' dass man f&uuml;r jedes Hubschraubermodell einen extra F&uuml;hrerschein ben&ouml;tigt', 'Ja, der Helikopterpilot benötigt für jedes Hubschraubermodell das er fliegen will einen extra Führerschein.', '2018-08-11 09:58:35', 1533974315),
(45, 1, 44, 2, ' dass Chilli Con Carne gar nicht aus Mexico stammt', 'Chilli Con Carne ist ein texanisches Gericht und stammt nicht aus Mexico.', '2018-08-12 10:16:08', 1534061768),
(46, 1, 45, 2, ' dass Disco im Plattdeutschen nicht Disco hei&szlig;t', 'Disco ist im Plattdeutsch \"Dance op de deel\".', '2018-08-17 17:15:09', 1534518909),
(47, 1, 46, 2, ' dass Italiener gar nicht Spaghetti Bolognese bestellen', 'In Italien ist Spaghetti Bolognese Spaghetti a la Ragout.', '2018-08-25 14:13:58', 1535199238),
(48, 1, 47, 2, ' dass Truthahn und Pute das selbe ist', 'Truthahn ist eine männliche Pute, und Pute ist ein weiblicher Truthahn.', '2018-09-16 08:58:20', 1537081100),
(49, 1, 48, 2, ' dass Plastik aus Erd&ouml;l hergestellt wird', 'Kunststoff wird aus Erdöl hergestellt.', '2018-09-22 13:49:32', 1537616972),
(50, 1, 49, 2, 'warum Fahrbahnmarkierungen im dunkeln leuchten', 'Weil kleine Glasperlen aus Altglas in der Farbe enthalten sind.', '2018-10-07 12:44:15', 1538909055),
(51, 1, 50, 2, ' dass Erdbeeren in Wirklichkeit N&uuml;sse sind', 'Die Erdbeere gehört in Wahrheit zu den Sammelnussfrüchten.', '2018-10-13 17:15:04', 1539443704),
(52, 1, 51, 2, 'wof&uuml;r das A und O steht', 'A wie Alpha und O wie Omega sind der erste bzw. letzte Buchstabe im griechischem Alphabet.', '2018-10-21 11:23:32', 1540113812),
(53, 1, 52, 2, 'was zuerst erfunden wurde, Feuerzeug oder Streichholz', 'Benzinfeuerzeuge sind älter als Streichhölzer.', '2018-10-31 19:57:36', 1541012256),
(54, 1, 53, 2, ' dass die Tage im Sommer k&uuml;rzer und im Winter l&auml;nger werden', 'Ja, ab der Sommersonnenwende werden die Tage um 5 Minuten kürzer und um Winter wieder 5 Minuten länger pro Tag.', '2018-11-11 08:53:50', 1541922830),
(55, 1, 54, 2, ' dass Bambus nur alle 80-130 Jahre bl&uuml;ht', 'Bambusse blühen in Intervallen von ca. 80 bis 130 Jahren.', '2018-11-11 13:08:17', 1541938097),
(60, 1, 55, 2, ' dass im Eiwei&szlig; gar kein Eiwei&szlig; enthalten ist', 'Eiweiß ist nur im Eigelb enthalten. Das Eiklar enthält kein Eiweiß.', '2018-11-20 20:47:40', 1542743260),
(61, 1, 56, 2, ' dass Paprika mehr Vitamin C als Zitrusfr&uuml;chte enth&auml;lt', 'Ja die Paprika ist nach Hagebutte und Sanddorn die Vitaminreichste Frucht.', '2018-11-24 15:55:11', 1543071311),
(62, 1, 57, 2, ' dass harte Matratzen besser f&uuml;r den R&uuml;cken sind als weiche', 'Ja, eine harte Matratze ist besser für den Rücken.', '2018-11-24 16:56:42', 1543075002),
(63, 1, 58, 2, ' dass es nur eine Band gab in der jedes Mitglied einen Top-10 Hit schrieb', 'Ja es war Queen.', '2018-12-02 10:09:34', 1543741774),
(64, 1, 59, 2, ' dass man mit Cola Fliegendreck vom Auto bekommt', 'Einfach Cola in eine Schüssel, Lappen rein, Auto einmal nass machen und dann mit Cola einreiben oder Waschen.', '2018-12-02 10:22:34', 1543742554),
(65, 1, 60, 2, 'womit KrankenpflegerInnen rasieren &uuml;ben', 'Sie benutzen einen Luftballon. Rasierschaum rauf und vorsichtig abschaben.  <br />\nWenn der Ballon platzt hätten sie den Patienten geschnitten.', '2018-12-04 18:47:18', 1543945638),
(66, 1, 61, 2, 'warum Rehe einen wei&szlig;en Fleck am Hintern haben', 'Rehe sind Fluchttiere, und wenn sie hintereinander fliehen so finden sie den Vordermann in der Dämmerung leichter durch den weißen Fleck am Hinterteil.', '2018-12-05 18:10:54', 1544029854),
(67, 0, 62, 2, ' dass Neum&uuml;nster die gef&auml;hrlichste Stadt Deutschlands ist', 'Pro Kopf gerechnet sind die meisten Straftaten in Neumünster registriert worden.  <br />\nSomit ist Neumünster in Schleswig Holstein die gefährlichste Stadt Deutschlands.', '2018-12-05 18:16:42', 1544030202),
(68, 1, 63, 2, ' dass Verbrennungen am schnellsten verheilen wenn man sich den verbrannten Finger ans Ohrl&auml;ppchen h&auml;lt', 'Das Ohrläppchen ist immer lauwarm, was das beste bei leichten Verbrennungen ist.  <br />\nDeswegen Finger ans Ohrläppchen und die Brandblase kommt gar nicht erst.  <br />\nZumindest meistens klappt das', '2018-12-05 18:30:55', 1544031055),
(69, 1, 64, 2, 'welche Marke hinter Subaru steht', 'Subaru ist die Allradmarke von Toyota.', '2018-12-05 18:37:42', 1544031462),
(70, 1, 65, 2, ' dass Tintenfische keine Fische sind', 'Ja, Tintenfische sind Weichtiere und keine Fische.', '2018-12-20 10:36:27', 1545298587),
(71, 1, 66, 2, 'welche Firma das SUV erfunden hat', 'Jeep, es war ein Jeep.', '2019-01-03 17:55:26', 1546534526),
(72, 1, 67, 2, 'was der Unterschied zwischen Sultaninen und Rosinen ist', 'Sultaninen werden aus kernlosen Trauben hergestellt und Rosinen aus solchen mit Kernen.', '2019-01-03 17:58:04', 1546534684),
(73, 1, 68, 2, ' dass klarer Apfelsaft nichts f&uuml;r Vegetarier ist', 'Beim klären von Apfelsaft wird Gelatine verwendet die wiederum aus Knochen hergestellt wird.', '2019-01-03 18:00:19', 1546534819),
(74, 1, 69, 2, 'woher der Name Bob stammt', 'Bob ist die Kurzform von Robert.', '2019-01-03 18:02:07', 1546534927),
(75, 1, 70, 2, 'wer die europaweit gr&ouml;sste IT-Redaktion hat', 'Der Heise Verlag in Hannover ist Heimat der grössten IT-Redaktion Europas.', '2019-01-03 18:04:20', 1546535060),
(76, 1, 71, 2, 'wieviel Prozent Butter mehr Fett hat als Margarine', 'Butter hat nur 2 Prozent mehr Fett als Margarine.', '2019-01-03 18:06:32', 1546535192),
(77, 1, 72, 2, 'wie man Aufkleber von glatten Oberfl&auml;chen entfernt', 'Mit Essig einreiben, einwirken lassen, und schon lösen sich die Aufkleber wie von selbst.', '2019-01-10 17:55:29', 1547139329),
(78, 1, 73, 2, 'dass die Wahrscheinlichkeit gr&ouml;&szlig;er ist von einer Kokosnuss erschlagen zu werden. als von einem Haifisch angefallen zu werden', 'Ja, es ist wahrscheinlicher von einer Kokosnuss erschlagen zu werden, als von einem Hai gebissen zu werden.', '2019-01-27 12:11:19', 1548587479),
(79, 1, 74, 2, 'warum der Thunfisch Thunfisch heisst', 'Taucht ein Taucher vor der Küste nach Perlen und wird von einem Fisch gebissen, darauf der Taucher: \"Das kannst du doch nicht tun Fisch\".', '2019-02-04 18:07:39', 1549300059),
(80, 1, 83, 2, 'welches Land in Europa die h&ouml;chste Selbstmordrate hat', 'Finnland', '2019-02-06 18:08:34', 1549472914),
(81, 1, 75, 2, 'woher der Name Sascha stammt', 'Sascha ist die russische Kurzform von Alexander.', '2019-02-06 18:10:24', 1549473024),
(82, 1, 76, 2, 'dass die Sonne im Winter 5 Minuten pro Tag l&auml;nger scheint', 'Im Winter beträgt die Dauer des Sonnenscheins immer 5 Minuten mehr pro Tag.  <br />\nIm Sommer beträgt die Dauer des Tages 5 Minuten weniger pro Tag.', '2019-02-10 08:48:00', 1549784880),
(83, 1, 77, 2, 'dass Schiedsrichter in Deutschland jedes Bundesligaspiel umsonst besuchen k&ouml;nnen', 'Als Besitzer eines Schiedsrichterscheins sind alle Bundesligaspiele umsonst.', '2019-03-12 17:17:22', 1552407442),
(84, 1, 78, 2, 'wie viele Sterne es im Universum gibt', 'Ungefähr genauso viele wie Sandkörner auf der Erde.', '2019-03-23 15:42:15', 1553352135),
(85, 1, 79, 2, 'dass die Erfinder von Adidas und Puma verwand sind', 'Adi Dasler und sein Bruder erfanden die beiden Sportmarken.', '2019-03-24 09:27:38', 1553416058),
(86, 1, 80, 2, 'welches die Farbe ist die man als erstes sieht', 'Es ist Gelb, vermutlich wegen der gelben Sonne.', '2019-03-24 11:55:24', 1553424924),
(87, 1, 81, 2, 'dass Helmut Schmidt ausschlie&szlig;lich Menthol Zigaretten geraucht hat', 'Ja, er war ein Fan von Menthol Zigaretten, Gott hab Ihn selig.', '2019-03-30 10:14:05', 1553937245),
(88, 1, 82, 2, 'was Blinde an einer Ampel machen', 'Sie drücken einen kleinen Knopf an der Unterseite des Drückers um die Ampel auf Töne umzustellen. Ohne das betätigen des Knopfes piept die Ampel nicht.', '2019-03-30 10:16:51', 1553937411),
(89, 1, 84, 2, 'wieviel ein M&uuml; ist', 'Wenn man eine Münze zwischen den Fingern verreibt, das Geldstück noch riechen kann aber nicht mehr sehen kann dann ist die Münze noch ein Mü hoch.', '2019-04-26 00:00:00', 1556229600),
(90, 1, 85, 2, 'dass Farbige mehr kurzzuckende Muskeln haben', 'Farbige Menschen haben ca. 20% mehr kurzzuckende Muskeln was Ihre Bewegungen geschmeidiger macht. Selbst mit extremen Training sind die Bewegungen nie so geschmeidig wie bei einem Farbigen.', '2019-04-06 11:56:40', 1554544600),
(91, 1, 86, 2, 'wer den meisten Kaffee auf der Welt trinkt', 'Die Finnen trinken den meisten Kaffee auf der Welt.  <br />\nDas hängt mit dem Alkoholverbot von früher zusammen,  <br />\nals Ersatzdroge wurde/wird Kaffee getrunken', '2019-04-14 13:40:46', 1555242046),
(92, 1, 87, 2, 'welches Volk die meisten K&uuml;hlschr&auml;nke pro Kopf besitzt', 'Es sind die Inuit, besser bekannt als Eskimos.  <br />\nBei den Inuit ist es so kalt dass alles einfrieren würde wenn es nicht \"gekühlt\" werden würde.', '2019-04-14 13:43:55', 1555242235),
(93, 1, 88, 2, 'womit man Holzbretter desinfiziert', 'Mit Zitronensaft werden Holzbretter desinfiziert.', '2019-04-20 20:38:08', 1555785488),
(94, 1, 89, 2, 'was der Unterschied zwischen Nasi Goreng und Bami Goreng ist', 'Nasi Goreng ist mit Reis und Bami Goreng ist mit Nudeln.  <br />\nIch mag sie beide.', '2019-04-21 09:23:42', 1555831422),
(95, 1, 90, 2, 'wann Karfreitag ist', 'Karfreitag ist immer der Freitag nach dem letzten Vollmond im April.', '2019-05-29 19:42:55', 1559151775),
(96, 1, 91, 2, 'warum 4 Grad Celsius eine magische Temperatur ist', 'Ab 4 Grad Celsius ist die Anomalie des Wassers zu beobachten.  <br />\nWasser dehnt sich entgegen aller anderer Stoffe ab 4 Grad oder kälter weiter aus.  <br />\nDesweiteren Wächst Gras bei bis zu 4 Grad oder wärmerA noch.  <br />\nUnd unser Atem wird ab 4 Grad oder kälter sichtbar', '2019-05-30 17:21:27', 1559229687),
(97, 1, 92, 2, 'dass nicht alle Whirlpools Yakuzis sind', 'Aber alle Yakuzis sind Whirlpools.  <br />\nYakuzi ist eine Whirlpool Marke.', '2019-06-30 08:40:10', 1561876810),
(98, 1, 93, 2, 'Mit welchem Tier man früher Löwen gejagt hat', 'Früher wurden Löwen mit Deutschen Doggen gejagt.', '2019-07-21 13:51:17', 1563709877),
(99, 1, 94, 2, 'wie viel Stunden ein Koala am Tag schl&auml;ft', 'Ganze 20 Stunden pro Tag verbringt der Koala damit zu schlafen.', '2019-08-18 13:21:47', 1566127307),
(100, 1, 95, 2, 'Woher eine Blasenentz&uuml;ndung kommt', 'Eine Blasenentzündung kommt von Bakterien und nicht vom im kalten Sitzen.', '2019-11-03 14:00:18', 1572786018),
(101, 1, 96, 2, 'Wieviel CO2 unser Fleischkonsum kostet', 'Ein drittel des CO2 Verbrauchs ist nur für die Produktion von Fleisch verantwortlich.', '2019-11-03 14:03:42', 1572786222),
(102, 1, 97, 2, 'wozu die kleine Tasche in einer Jeans da ist', 'Die kleine Tasche ist für eine Taschenuhr gemacht worden, und sie wird noch heute integriert, obwohl kaum einer sie dafür noch nutzt', '2019-11-03 14:06:54', 1572786414),
(103, 1, 98, 2, 'Wozu Rippen da sind', 'Rippen sind gemacht zum Brechen.  <br />\nSo absorbieren sie die meiste Energie bei einer Kollision.', '2019-11-03 14:09:11', 1572786551),
(104, 1, 99, 2, 'wof&uuml;r Haribo steht', 'Haribo ist die Abk&uuml;rzung von HAns RIegel BOnn.', '2019-11-20 10:29:18', 1574242158),
(105, 1, 100, 2, 'dass ein Rolltreppengel&auml;nder nicht die selbe Geschwindigkeit hat wie die Treppe', 'Das Geländer läuft schneller als die Treppe damit man nicht so leicht nach hinten kippt.', '2019-12-13 16:13:28', 1576250008),
(106, 1, 101, 2, 'was die H&ouml;chststrafe f&uuml;r das Umfahren einer Kuh in Indien ist', 'In Indien kann man bis zu 7 Jahre Gefängnis bekommen wenn man eine Kuh überfährt.', '2020-01-12 16:09:07', 1578841747),
(107, 1, 102, 2, 'Warum der Porsche 911, 911 hei&szlig;t', 'Ursprünglich hieß der Porsche 911, Porsche 901 aber da hatten Sich die Zuffenhausener die Rechnung ohne Peugeot gemacht, die Mahnten an das die Zahl 901 mehr für Peugeot steht und sorgten dafür das der Porsche nun 911 hieß.', '2020-01-12 16:12:20', 1578841940),
(108, 0, 103, 2, 'dass Obst schneller reift wenn man es mit &Auml;pfeln lagert', 'Obst wie z.B. Bananen reifen schneller wenn sie mit Äpfeln in Kontakt kommen.', '2020-01-17 20:08:38', 1579288118),
(114, 1, 104, 2, 'wie lange Pandas pro Tag mit essen besch&auml;ftigt sind', 'Ganze 14 Stunden Pro Tag tun sie nichts anderes als fressen', '2020-03-06 20:51:16', 1583524276),
(115, 1, 105, 2, 'Welches die lautesten Tiere der Erde sind', 'Es sind Pottwale.  <br />\nNeben dem grössten Hirn sind sie auch die lautesten.  <br />\nIhre Klicklaute können lauter als ein Düsentriebwerk sein.', '2020-03-06 20:51:16', 1659536874),
(116, 1, 106, 2, 'das Bananen schneller reifen wenn sie mit &Auml;pfeln gelagert werden', 'Ja, die Äpfel sondern ein Reifegas aus was anderes Obst, wie Bananen schneller reifen lassen.', '2020-09-05 13:40:09', 1659536848),
(117, 1, 107, 2, 'wie oft man am Tag atmet', '18000 x Atmen wir im Schnitt pro Tag', '2023-02-10 14:51:53', 0),
(118, 1, 108, 2, 'Warum der Sonnenuntergang am Meer meist rot ist', 'Die Feuchtigkeit in der Luft wirkt wie ein Prisma das dass Licht bricht und den Himmel Rot erscheinen lässt', '2024-09-29 12:18:41', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images`
--

CREATE TABLE `images` (
  `id` bigint(11) NOT NULL,
  `pub` tinyint(1) NOT NULL DEFAULT 0,
  `position` bigint(11) NOT NULL,
  `images_categories_id` bigint(11) DEFAULT NULL,
  `headline` varchar(80) DEFAULT NULL,
  `headline_en` varchar(80) DEFAULT NULL,
  `status` enum('empty','sold','forsale','unsaleable','givenaway','lost','inwork') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
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
-- Daten für Tabelle `images`
--

INSERT INTO `images` (`id`, `pub`, `position`, `images_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `chg_date`, `message`, `message_en`, `camera_id`, `image_path`, `link`, `Format`, `Format_en`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(5, 0, 300, 10, 'Die Weide', 'Die Weide', 'empty', '2006-10-06 09:45:00', 1160120700, 'Eine ausgestorbene Weide in Berge bei Nauen,  <br />\nIm Vordergrund unser Model Fabrice ;)', 'Eine ausgestorbene Weide in Berge bei Nauen,  <br />\nIm Vordergrund unser Model Fabrice ;)', 3, 'Die-Weide.jpg', '', '', '', 0.00, 1, 0, 1),
(6, 1, 299, 10, 'Die Schnecke', 'Die Schnecke', 'empty', '2006-08-23 08:20:00', 1156314000, 'Schnecke bei uns inner Laube.  <br />\nMan sieht sogar noch die Beschriftung annem Balken', 'Schnecke bei uns inner Laube.  <br />\nMan sieht sogar noch die Beschriftung annem Balken', 3, 'Die-Schnecke.jpg', '', '', '', 0.00, 1, 0, 1),
(10, 1, 298, 10, 'Bahnof Potsdamer Platz bei Nacht', 'Bahnof Potsdamer Platz bei Nacht', 'empty', '2006-09-27 02:10:00', 1159315800, 'Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  <br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.', 'Gestern Abend ich mit Kamera in Berlin und musste auf nen Zug warten,  <br />\nda fiel mir dieses Ausergewöhnliche Bild ins Auge, musst ich gleich ma Fotofiern.', 3, 'Potsdamer-Platz.jpg', '', '', '', 0.00, 1, 0, 1),
(15, 1, 297, 5, 'They Say Jump', 'They Say Jump', 'empty', '2002-04-11 18:06:00', 1018541160, 'Ein etwas älteres Wallpaper von 2002', 'Ein etwas älteres Wallpaper von 2002', 0, 'jump.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(16, 1, 296, 5, 'Where are you gone Now', 'Where are you gone Now', 'empty', '2002-05-16 18:07:00', 1021565220, 'Wallpaper von 2002', 'Wallpaper von 2002', 0, 'where-are-u-gone-now.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(17, 1, 295, 5, 'Smell the Roses', 'Smell the Roses', 'empty', '2002-07-12 18:08:00', 1026490080, 'Wallpaper von 2002', 'Wallpaper von 2002', 0, 'smell-the-roses.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(18, 1, 294, 5, 'RP- Wallpaper', 'RP- Wallpaper', 'empty', '2002-09-02 18:08:00', 1030982880, 'Das Rotten-Psychos Wallpaper von 2002', 'Das Rotten-Psychos Wallpaper von 2002', 0, 'Rotten-Psychos.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(21, 1, 293, 7, 'Edge Country', 'Edge Country', 'empty', '2003-04-11 19:33:00', 1050082380, '', '', 0, 'P2062655.jpg', '', '', '', 0.00, 1, 0, 1),
(22, 1, 292, 7, 'Evil Bedtime', 'Evil Bedtime', 'empty', '2003-08-03 19:46:00', 1059932760, '', '', 0, 'P2062656.jpg', '', '', '', 0.00, 1, 0, 1),
(23, 1, 291, 1, 'Extreme Wounds', 'Extreme Wounds', 'empty', '2004-06-01 19:48:00', 1086112080, '', '', 0, 'P2062657.jpg', '', '', '', 0.00, 1, 0, 1),
(25, 1, 290, 2, 'Rebeltown', 'Rebeltown', 'empty', '2003-12-28 19:34:00', 1072636440, '', '', 0, 'P2062660.jpg', '', '', '', 0.00, 1, 0, 1),
(28, 1, 289, 7, 'Hangtime', 'Hangtime', 'empty', '2004-10-02 19:29:00', 1096738140, '', '', 0, 'P2062662.jpg', '', '', '', 0.00, 1, 0, 1),
(30, 1, 288, 7, 'Blue Fontaine', 'Blue Fontaine', 'empty', '2004-11-08 07:10:00', 1099894200, '', '', 0, 'P2062665.jpg', '', '', '', 0.00, 1, 0, 1),
(31, 1, 287, 7, 'Circle Bang', 'Circle Bang', 'empty', '2004-11-30 14:12:00', 1101820320, '', '', 0, 'P2062664.jpg', '', '', '', 0.00, 1, 0, 1),
(33, 1, 286, 7, 'Neurotic Nurse', 'Neurotic Nurse', 'empty', '2004-12-03 19:47:00', 1102099620, '', '', 0, 'P2062666.jpg', '', '', '', 0.00, 1, 0, 1),
(36, 1, 285, 7, 'Lttle Kiwi', 'Lttle Kiwi', 'empty', '2005-04-05 19:51:00', 1112723460, 'Fineliner Artwork von 2005', 'Fineliner Artwork von 2005', 0, 'P2062671.jpg', '', '', '', 0.00, 1, 0, 1),
(37, 1, 284, 7, 'Spidermoon', 'Spidermoon', 'empty', '2005-08-05 19:52:00', 1123264320, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062672.jpg', '', '', '', 0.00, 1, 0, 1),
(38, 1, 283, 7, 'Honeymoon', 'Honeymoon', 'empty', '2005-10-12 19:53:00', 1129139580, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062673.jpg', '', '', '', 0.00, 1, 0, 1),
(39, 1, 282, 7, 'Pole Position', 'Pole Position', 'unsaleable', '2006-02-02 10:54:00', 1138874040, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062675.jpg', '', '', '', 0.00, 1, 0, 1),
(41, 1, 281, 7, 'Goldfish', 'Goldfish', 'givenaway', '2006-05-13 00:36:00', 1147473360, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062680.jpg', '', '', '', 0.00, 1, 0, 1),
(42, 1, 280, 7, 'Disc Error', 'Disc Error', 'empty', '2006-05-15 19:56:00', 1147715760, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062685.jpg', '', '', '', 0.00, 1, 0, 1),
(43, 1, 279, 7, 'Cloud Spring', 'Cloud Spring', 'unsaleable', '2006-07-01 14:38:00', 1151757480, 'Fineliner Artwork von 2006', 'Fineliner Artwork von 2006', 0, 'P2062688.jpg', '', '', '', 0.00, 1, 0, 1),
(44, 1, 278, 7, 'Webmaster\'s Delight', 'Webmaster\'s Delight', 'unsaleable', '2006-12-08 19:42:00', 1165603320, '', '', 0, 'P2062692.jpg', '', '', '', 0.00, 1, 0, 1),
(46, 1, 277, 7, 'Damned Fleet', 'Damned Fleet', 'forsale', '2007-02-06 20:05:00', 1170788700, '', '', 0, 'P6023068.JPG', '', '', '', 25.00, 1, 1, 1),
(47, 1, 276, 7, 'Twisted Minds', 'Twisted Minds', 'forsale', '2007-04-27 20:06:00', 1177697160, '', '', 0, 'P6023067.JPG', '', '', '', 20.00, 1, 1, 1),
(48, 1, 275, 7, 'Known Bugs', 'Known Bugs', 'forsale', '2007-04-29 10:26:00', 1177835160, '', '', 0, 'P6023066.JPG', '', '', '', 20.00, 1, 1, 1),
(49, 1, 274, 7, 'Gullivers Adventures', 'Gullivers Adventures', 'forsale', '2007-05-01 10:27:00', 1178008020, '', '', 0, 'P6023065.JPG', '', '', '', 20.00, 1, 1, 1),
(50, 1, 273, 7, 'Chaotic Australia', 'Chaotic Australia', 'forsale', '2007-06-03 10:27:00', 1180859220, 'Chaotisches Australien', 'Chaotisches Australien', 0, 'P6023064.JPG', '', '', '', 20.00, 1, 1, 1),
(51, 1, 272, 7, 'Curved Spikes', 'Curved Spikes', 'forsale', '2007-08-05 19:28:00', 1186334880, '2007er Fineliner Artwork', '2007er Fineliner Artwork', 0, 'P6043079.JPG', '', '', '', 20.00, 1, 1, 1),
(53, 1, 271, 7, '? LionTree ?', '? LionTree ?', 'forsale', '2007-10-04 19:29:00', 1191518940, 'Der Löwe unter dem Baum', 'Der Löwe unter dem Baum', 0, 'P6043081.jpg', '', '', '', 25.00, 1, 1, 1),
(54, 2, 270, 7, 'Drachenvogel - Dragonbird', 'Drachenvogel - Dragonbird', 'lost', '2007-10-06 19:29:00', 1191691740, 'Fineliner Artwork 2007', 'Fineliner Artwork 2007', 0, 'dragonbird.jpg', '', '', '', 0.00, 1, 0, 1),
(62, 1, 269, 10, 'Verschneiter Tisch', 'Verschneiter Tisch', 'empty', '2010-01-22 20:14:29', 1264187669, 'Winter in Schleswig Holstein', 'Winter in Schleswig Holstein', 2, '100_0222.jpg', '', '', '', 0.00, 1, 0, 1),
(63, 1, 268, 5, 'Jugendhof Brandenburg Collage', 'Jugendhof Brandenburg Collage', 'empty', '2006-08-27 15:02:00', 1156683720, 'Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.', 'Eine Kleine Foto-Kollage zum Thema Jugendhof Brandenburg.', 0, 'JHBR-Wallpaper.jpg', '', '1600x1200 Pixel', '1600x1200 Pixel', 0.00, 1, 0, 1),
(65, 1, 267, 5, 'Worst Enemy', 'Worst Enemy', 'empty', '2010-06-27 18:11:49', 1277655109, 'Wallpaper von 2010', 'Wallpaper von 2010', 0, 'Worst-enemy.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(71, 1, 266, 10, 'Die grosse Eiche', 'Die grosse Eiche', 'empty', '2011-06-18 21:18:21', 1308424701, 'Eine Eiche bei uns in BimÃ¶hlen im Sonnenuntergang', 'Eine Eiche bei uns in Bimöhlen im Sonnenuntergang', 2, 'baum_bimoehlen3.jpg', '', '', '', 0.00, 1, 0, 1),
(73, 1, 265, 7, 'Cool Livings', 'Cool Livings', 'givenaway', '2008-06-24 17:51:00', 1214322660, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'Cool-Livings.jpg', '', '', '', 20.00, 1, 0, 1),
(74, 1, 264, 7, 'Arthur Mac Donald', 'Arthur Mac Donald', 'forsale', '2008-09-28 17:55:00', 1222617300, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'arthus_mac-donald.jpg', '', '', '', 20.00, 1, 1, 1),
(75, 1, 263, 7, 'Evil Beast', 'Evil Beast', 'forsale', '2009-02-05 18:02:00', 1233853320, 'Fineliner Artwork von 2009', 'Fineliner Artwork von 2009', 0, 'evil_beast.jpg', '', '', '', 20.00, 1, 1, 1),
(76, 1, 262, 7, 'Cumulative FIst', 'Cumulative FIst', 'forsale', '2009-06-24 18:09:00', 1245859740, 'Cumulative Fist - Geballte Faust  <br />\nFineliner Artwork 2009', 'Cumulative Fist - Geballte Faust  <br />\nFineliner Artwork 2009', 0, 'cumulativ-fist.jpg', '', '', '', 20.00, 1, 1, 1),
(77, 1, 261, 7, 'Witch Chair', 'Witch Chair', 'forsale', '2009-09-24 18:21:00', 1253809260, 'Fineliner Artwork von 2009', 'Fineliner Artwork von 2009', 0, 'Nollie-Flip.jpg', '', '', '', 20.00, 1, 1, 1),
(78, 1, 260, 7, 'Fool Garden', 'Fool Garden', 'forsale', '2011-06-24 18:25:55', 1308932755, 'Fineliner Artwork von 2011', 'Fineliner Artwork von 2011', 0, 'fool-garden.jpg', '', '', '', 20.00, 1, 1, 1),
(80, 1, 259, 7, 'Simple Minds', 'Simple Minds', 'forsale', '2011-06-24 18:31:48', 1308933108, 'Fineliner Artwork von 2011', 'Fineliner Artwork von 2011', 0, 'Simple_Minds.jpg', '', '', '', 20.00, 1, 1, 1),
(81, 1, 258, 10, 'Elke Live', 'Elke Live', 'empty', '2011-09-09 20:55:58', 1315594558, 'Das ist Elke, die Katze meiner Schwester.', 'Das ist Elke, die Katze meiner Schwester.', 2, 'thecat.jpg', '', '', '', 0.00, 1, 0, 1),
(82, 1, 257, 10, 'Papageno Nana', 'Papageno Nana', 'empty', '2011-09-10 16:31:14', 1315665074, 'Kunstfigur aus Pappmachee', 'Kunstfigur aus Pappmachee', 2, 'papageno_nana.jpg', '', '', '', 0.00, 1, 0, 1),
(83, 1, 256, 5, 'Asarios Blog', 'Asarios Blog', 'empty', '2012-02-10 19:24:11', 1328898251, 'Wallpaper von 2012', 'Wallpaper von 2012', 0, 'ab_bg.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(84, 1, 255, 7, 'Hawk-Eye - Falkenauge', 'Hawk-Eye - Falkenauge', 'lost', '2010-11-27 19:37:00', 1290883020, 'Fineliner Artwork 2010', 'Fineliner Artwork 2010', 0, 'Hawk-Eye.jpg', '', '', '', 0.00, 1, 0, 1),
(85, 1, 254, 7, 'Find-Layer - Gefundene Ebene', 'Find-Layer - Gefundene Ebene', 'forsale', '2010-05-05 19:38:00', 1273081080, 'Fineliner Artwork von 2010', 'Fineliner Artwork von 2010', 0, 'Find-Layer.jpg', '', '', '', 20.00, 1, 1, 1),
(87, 1, 253, 7, 'Ginger Claw', 'Ginger Claw', 'unsaleable', '2012-02-26 17:02:38', 1692887694, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'ginger-claw.jpg', '', '', '', 0.00, 1, 0, 1),
(88, 1, 252, 10, 'Sonnenblume', 'Sonnenblume', 'empty', '2012-04-01 22:52:47', 1333313567, 'Ein Foto von 2012', 'Ein Foto von 2012', 2, 'Sunflowers.jpg', '', '', '', 0.00, 1, 0, 1),
(89, 0, 251, 2, 'Tri-Opterox I', 'Tri-Opterox I', 'forsale', '2012-06-23 17:19:08', 1340464748, '3 Leinwände ein Bild.  <br />\nMein erstes \"großes Werk\" in Acryl auf Leinwand', '3 Leinwände ein Bild.  <br />\nMein erstes \"großes Werk\" in Acryl auf Leinwand', 0, 'Tri-Opterox.jpg', '', '3x 80x20x3cm (BxHxT)', '3x 80x20x3cm (BxHxT)', 115.00, 1, 1, 1),
(90, 1, 250, 10, 'Pf&uuml;tze', 'Pf&uuml;tze', 'empty', '2012-06-29 20:27:03', 1340994423, 'Eine Pfütze vor unserem Haus', 'Eine Pfütze vor unserem Haus', 2, 'hecke.jpg', '', '', '', 0.00, 1, 0, 1),
(94, 1, 249, 10, 'Boot im Hasengraben', 'Boot im Hasengraben', 'empty', '2012-07-12 19:08:09', 1342112889, 'Ein einzelnes Boot im Potsdamer Hasengraben', 'Ein einzelnes Boot im Potsdamer Hasengraben', 2, 'Boot_im_Hasengraben.jpg', '', '', '', 0.00, 1, 0, 1),
(95, 2, 248, 7, 'Bearhunt - BÃ¤renjagd', 'Bearhunt - B&auml;renjagd', 'forsale', '2012-07-19 19:37:18', 1342719438, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'Bearhunt.jpg', '', '', '', 20.00, 1, 1, 1),
(96, 1, 247, 7, 'Wormholes', 'Wormholes', 'forsale', '2012-07-19 19:39:26', 1342719566, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'wormholes.jpg', '', '', '', 20.00, 1, 1, 1),
(97, 1, 246, 7, 'Sunny Valley', 'Sunny Valley', 'forsale', '2008-11-20 00:00:00', 1353420300, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'IMG_2223.jpg', '', '', '', 20.00, 1, 1, 1),
(98, 1, 245, 7, 'Hallo Kittie', 'Hallo Kittie', 'forsale', '2007-12-18 15:07:00', 1197986820, 'Fineliner Artwork von 2008', 'Fineliner Artwork von 2008', 0, 'IMG_2224.jpg', '', '', '', 20.00, 1, 1, 1),
(99, 1, 244, 7, 'Snowie Time', 'Snowie Time', 'forsale', '2012-03-10 15:07:00', 1331388420, '', '', 0, 'IMG_2225.jpg', '', '', '', 20.00, 1, 1, 1),
(100, 1, 243, 7, 'Razorblade', 'Razorblade', 'forsale', '2012-04-22 15:07:00', 1335100020, '', '', 0, 'IMG_2226.jpg', '', '', '', 20.00, 1, 1, 1),
(101, 1, 242, 7, 'American Dream', 'American Dream', 'forsale', '2012-05-20 15:26:00', 1337520360, '', '', 0, 'IMG_2228.jpg', '', '', '', 20.00, 1, 1, 1),
(102, 1, 241, 7, 'Calculator Eye', 'Calculator Eye', 'unsaleable', '2012-06-12 15:28:00', 1339507680, '', '', 0, 'IMG_2227.jpg', '', '', '', 0.00, 1, 0, 1),
(103, 1, 240, 7, 'Rasputin Errors', 'Rasputin Errors', 'givenaway', '2012-11-20 15:57:00', 1353423420, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2254.jpg', '', '', '', 0.00, 1, 0, 1),
(104, 1, 239, 7, 'Red Stone', 'Red Stone', 'unsaleable', '2012-06-19 16:11:00', 1340115060, '', '', 0, 'IMG_2236.jpg', '', '', '', 0.00, 1, 0, 1),
(105, 1, 238, 7, 'Knowledge 2000', 'Knowledge 2000', 'forsale', '2012-12-20 16:23:00', 1356016980, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2242.jpg', '', '', '', 20.00, 1, 1, 1),
(106, 1, 237, 7, 'Supersonic', 'Supersonic', 'forsale', '2012-06-28 16:26:00', 1340893560, '', '', 0, 'IMG_2241.jpg', '', '', '', 20.00, 1, 1, 1),
(107, 1, 236, 7, 'Lucky Beggar', 'Lucky Beggar', 'forsale', '2008-01-01 16:27:00', 1199201220, '', '', 0, 'IMG_2247.jpg', '', '', '', 20.00, 1, 1, 1),
(108, 1, 235, 7, 'Long Time', 'Long Time', 'forsale', '2012-07-01 16:34:00', 1341153240, '', '', 0, 'IMG_2239.jpg', '', '', '', 20.00, 1, 1, 1),
(109, 1, 234, 11, 'Color Art', 'Color Art', 'unsaleable', '2012-07-20 16:37:38', 1342795058, '', '', 0, 'IMG_2251.jpg', '', '', '', 0.00, 1, 0, 1),
(110, 1, 233, 11, 'Grey Shadow', 'Grey Shadow', 'unsaleable', '2012-07-20 16:38:48', 1342795128, '', '', 0, 'IMG_2240.jpg', '', '', '', 0.00, 1, 0, 1),
(111, 1, 232, 7, 'Joker Face', 'Joker Face', 'forsale', '2008-03-02 16:40:00', 1204472400, '', '', 0, 'P2062665.jpg', '', '', '', 20.00, 1, 1, 1),
(112, 2, 231, 11, 'People of Joy', 'People of Joy', 'unsaleable', '2001-01-02 00:00:00', 1342795423, '', '', 0, '100_1436.jpg', '', '', '', 0.00, 1, 0, 1),
(113, 1, 230, 7, 'Unfinished Mask', 'Unfinished Mask', 'unsaleable', '2012-07-15 16:44:00', 1342363440, '', '', 0, 'IMG_2261.jpg', '', '', '', 0.00, 1, 0, 1),
(121, 1, 223, 7, 'Cruel Fool', 'Cruel Fool', 'forsale', '2012-07-20 18:09:24', 1342800564, '', '', 0, 'IMG_2287.jpg', '', '', '', 20.00, 1, 1, 1),
(114, 1, 229, 11, 'Composed Train', 'Composed Train', 'unsaleable', '2012-07-20 17:36:22', 1342798582, '', '', 0, 'IMG_2256.jpg', '', '', '', 0.00, 1, 0, 1),
(115, 1, 228, 11, 'Ocean Drift', 'Ocean Drift', 'unsaleable', '2012-07-20 17:36:40', 1342798600, '', '', 0, 'IMG_2258.jpg', '', '', '', 0.00, 1, 0, 1),
(116, 1, 227, 11, 'Horizontal Skip', 'Horizontal Skip', 'unsaleable', '2012-07-20 17:36:59', 1342798619, '', '', 0, 'IMG_2260.jpg', '', '', '', 0.00, 1, 0, 1),
(117, 1, 226, 11, 'My personal Injury', 'My personal Injury', 'unsaleable', '2012-07-20 17:37:18', 1342798638, '', '', 0, 'IMG_2259.jpg', '', '', '', 0.00, 1, 0, 1),
(118, 1, 225, 11, 'Simple Knife', 'Simple Knife', 'unsaleable', '2012-07-20 17:40:33', 1342798833, '', '', 0, 'IMG_2285.jpg', '', '', '', 0.00, 1, 0, 1),
(119, 1, 224, 11, 'Corner Mark', 'Corner Mark', 'unsaleable', '2012-07-20 17:40:49', 1342798849, '', '', 0, 'IMG_2286.jpg', '', '', '', 0.00, 1, 0, 1),
(122, 1, 222, 7, 'Easy Listenimg', 'Easy Listenimg', 'forsale', '2012-08-20 20:07:00', 1345486020, '', '', 0, 'IMG_2248.jpg', '', '', '', 20.00, 1, 1, 1),
(123, 1, 221, 11, 'Sunglasses', 'Sunglasses', 'unsaleable', '2012-07-20 20:12:15', 1342807935, '', '', 0, 'IMG_2276.jpg', '', '', '', 0.00, 1, 0, 1),
(124, 1, 220, 10, 'Potsdam @ Night', 'Potsdam @ Night', 'empty', '2012-07-20 21:59:08', 1342814348, 'Ein Sonnenuntergang in Brandenburgs Hauptstadt', 'Ein Sonnenuntergang in Brandenburgs Hauptstadt', 2, 'Potsdam-at-Night.jpg', '', '', '', 0.00, 1, 0, 1),
(125, 0, 219, 2, 'Auriel Mark IV', 'Auriel Mark IV', 'unsaleable', '2012-09-01 13:03:43', 1346497423, '4 LeinwÃ¤nde 1 Bild, diesmal etwas Breiter.', '4 Leinwände 1 Bild, diesmal etwas Breiter.', 0, 'Auriel_Mark_IV.jpg', '', '', '', 0.00, 1, 0, 1),
(126, 1, 218, 10, 'Sky de Flugzeug', 'Sky de Flugzeug', 'empty', '2012-09-01 17:13:34', 1346512414, 'Der Himmel Ã¼ber uns', 'Der Himmel über uns', 2, '100_1054.jpg', '', '', '', 0.00, 1, 0, 1),
(127, 1, 217, 10, 'Car Shot', 'Car Shot', 'empty', '2012-09-04 21:47:14', 1346788034, 'Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling', 'Ein Bild durch den Wald aus dem Auto auf dem Weg nach Rickling', 2, 'carshot2.jpg', '', '', '', 0.00, 1, 0, 1),
(128, 1, 216, 7, 'Nocturne', 'Nocturne', 'forsale', '2012-09-21 16:49:00', 1348238940, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2212.jpg', '', '', '', 20.00, 1, 1, 1),
(129, 1, 215, 7, 'Blue Horizon', 'Blue Horizon', 'forsale', '2012-09-22 16:56:41', 1348325801, 'Fineliner Artwork von 2012', 'Fineliner Artwork von 2012', 0, 'IMG_2213.jpg', '', '', '', 20.00, 1, 1, 1),
(130, 1, 214, 7, 'Stylish Bulldog', 'Stylish Bulldog', 'empty', '2010-09-23 18:40:00', 1285260000, '', '', 0, 'IMG_2255.jpg', '', '', '', 0.00, 1, 0, 1),
(131, 0, 213, 7, 'Black Jeans', 'Black Jeans', 'empty', '2010-09-23 18:42:00', 1285260120, '', '', 0, 'IMG_2257.jpg', '', '', '', 0.00, 1, 0, 1),
(132, 1, 212, 2, 'Green Valley', 'Green Valley', 'forsale', '2012-11-22 20:53:45', 1353614025, 'Leinwand und Acryl Zweifarbig', 'Leinwand und Acryl Zweifarbig', 0, 'Green_Valley.jpg', '', '60x60x3cm (BxHxT)', '60x60x3cm (BxHxT)', 80.00, 1, 1, 1),
(133, 1, 211, 5, 'Penguin Style', 'Penguin Style', 'empty', '2012-12-02 20:16:19', 1354475779, 'Wallpaper von 2012', 'Wallpaper von 2012', 0, 'penguin-style.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(134, 1, 210, 10, 'Elke 2k13', 'Elke 2k13', 'empty', '2013-01-06 20:21:21', 1357500081, 'Ein Foto von unserer Elke...', 'Ein Foto von unserer Elke...', 1, 'PC300151_01.jpg', '', '', '', 0.00, 1, 0, 1),
(135, 1, 209, 7, 'Colored Blur', 'Colored Blur', 'forsale', '2013-01-06 20:27:01', 1357500421, 'Fineliner Artwork von 2013', 'Fineliner Artwork von 2013', 0, 'colored-blur.jpg', '', '', '', 20.00, 1, 1, 1),
(136, 1, 208, 7, 'Dadelix', 'Dadelix', 'givenaway', '2010-01-06 20:28:00', 1262806080, 'Fineliner Artwork von 2010', 'Fineliner Artwork von 2010', 0, 'dadelix.jpg', '', '', '', 0.00, 1, 0, 1),
(137, 1, 207, 2, 'Yellow Bomb', 'Yellow Bomb', 'forsale', '2013-01-20 20:29:08', 1358710148, 'Zweifarbiges Werk aus Textilmalfarbe und Acryl', 'Zweifarbiges Werk aus Textilmalfarbe und Acryl', 0, 'Yellow_Bomb.jpg', '', '70x50x3cm (BxHxT)', '70x50x3cm (BxHxT)', 80.00, 1, 1, 1),
(138, 1, 206, 10, 'Herzkartoffel', 'Herzkartoffel', 'empty', '2013-01-27 19:43:27', 1359312207, 'Eine Herzliche Angelegenheit, so ein Weihnachtsfest.', 'Eine Herzliche Angelegenheit, so ein Weihnachtsfest.', 1, 'PC310250.JPG', '', '', '', 0.00, 1, 0, 1),
(139, 1, 205, 10, 'Elke Playin', 'Elke Playin', 'empty', '2013-01-27 19:45:56', 1359312356, 'Elke mit Spielzeug am Schmusen', 'Elke mit Spielzeug am Schmusen', 1, 'P290111.JPG', '', '', '', 0.00, 1, 0, 1),
(140, 1, 204, 10, 'Elke Sleeping', 'Elke Sleeping', 'empty', '2013-01-27 19:50:01', 1359312601, 'Auch die grÃ¶ÃŸte Katze braucht Ihren Schlaf.', 'Auch die größte Katze braucht Ihren Schlaf.', 1, 'P280054.JPG', '', '', '', 0.00, 1, 0, 1),
(141, 1, 203, 5, 'Little Fugo Desktop', 'Little Fugo Desktop', 'empty', '2013-01-27 19:57:55', 1359313075, 'Mein Lieblingsfugo als Wallpaper', 'Mein Lieblingsfugo als Wallpaper', 0, 'lf9.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(142, 1, 202, 11, 'Little Fugo', 'Little Fugo', 'givenaway', '2013-01-27 20:03:12', 1359313392, 'Ein Kugelfisch mal anders..', 'Ein Kugelfisch mal anders..', 0, 'Little_Fugo.jpg', '', '', '', 0.00, 1, 0, 1),
(143, 1, 201, 2, 'Fishtank', 'Fishtank', 'sold', '2013-02-24 19:46:36', 1361731596, 'Acryl & Edding auf Leinwand von 2013', 'Acryl & Edding auf Leinwand von 2013', 0, 'fishtank2.jpg', '', '3x 30x20x3cm (BxHxT)', '3x 30x20x3cm (BxHxT)', 52.96, 1, 0, 1),
(145, 1, 199, 2, 'Hedgehog Island', 'Hedgehog Island', 'forsale', '2013-06-18 16:58:01', 1371567481, 'Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.', 'Gespachtelter Türkisblauer Hintergrund mit Weißem Vordergrund.', 0, 'Hedgehog-Island.jpg', '', '50x70x3cm (BxHxT)', '50x70x3cm (BxHxT)', 80.00, 1, 1, 1),
(144, 2, 200, 8, 'Auriel Light Mark IV', 'Auriel Light Mark IV', 'unsaleable', '2013-05-20 19:24:10', 1369070650, '4 Leinw&auml;nde 1 Lichtobjekt.  \r\nVielen dank an Chris die mich immer wieder Inspiriert hat und die Idee zum Lichtobjekt hatte.', '4 canvases 1 light object.  \r\nMany thanks to Chris who inspired me again and again and had the idea for the light object.', 0, 'auriel_light_mark_iv_new.jpg', '', '34x90x30cm (BxHxT)', '34x90x30cm (BxHxT)', 149.95, 1, 0, 1),
(146, 1, 198, 10, 'Birthday Balloon', 'Birthday Balloon', 'empty', '2013-06-23 21:20:55', 1372015255, 'Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  <br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)', 'Am letzten Dienstag, meinem Geburtstag schoss ich dieses Foto vor meiner Haustür.  <br />\nHoffe ihr nehmt mir die Schleichwerbung nicht übel. ;)', 1, 'birthday-baloon.jpg', '', '', '', 0.00, 1, 0, 1),
(147, 1, 197, 2, 'Rebellion Days', 'Rebellion Days', 'forsale', '2013-09-01 19:57:56', 1378058276, 'Acryl auf Leinwand, diesmal mit Ecken und Kanten.  <br />\nUnd zwar nur Ecken und Kanten', 'Acryl auf Leinwand, diesmal mit Ecken und Kanten.  <br />\nUnd zwar nur Ecken und Kanten', 0, 'rebellion_days_fin2.jpg', '', '30x90x3cm (BxHxT)', '30x90x3cm (BxHxT)', 80.00, 1, 1, 1),
(148, 1, 196, 10, 'Mein Lieblingswagen', 'Mein Lieblingswagen', 'empty', '2013-07-14 19:29:26', 1373822966, 'Ein Ford Focus der 1ten Generation.  <br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(', 'Ein Ford Focus der 1ten Generation.  <br />\nIch liebe diesen Wagen, nur leider ist er nicht meiner. :(', 2, 'ford_focus.jpg', '', '', '', 0.00, 1, 0, 1),
(149, 1, 195, 10, 'Fette Taube', 'Fette Taube', 'empty', '2013-07-14 19:37:46', 1373823466, 'An NeumÃ¼nsterer Bahnhof ist mir diese adipÃ¶se Taube begegnet.  <br />\nUnd da hab ich Sie einfach mal Fotografiert.', 'An Neumünsterer Bahnhof ist mir diese adipöse Taube begegnet.  <br />\nUnd da hab ich Sie einfach mal Fotografiert.', 1, 'fat_dove.jpg', '', '', '', 0.00, 1, 0, 1),
(150, 1, 194, 10, 'BigBaggy', 'BigBaggy', 'empty', '2013-07-14 19:46:40', 1373824000, 'Ein Baggy Pants Rock getragen von meiner Schwester.', 'Ein Baggy Pants Rock getragen von meiner Schwester.', 1, 'bigbaggy.jpg', '', '', '', 0.00, 1, 0, 1),
(151, 1, 193, 10, 'Elke unsharp', 'Elke unsharp', 'empty', '2013-07-14 19:51:16', 1373824276, 'Unsere Elke im Garten', 'Unsere Elke im Garten', 1, 'elke-unsharp.jpg', '', '', '', 0.00, 1, 0, 1),
(152, 1, 192, 10, 'Newspaper', 'Newspaper', 'empty', '2013-07-14 19:52:37', 1373824357, 'Eine Zeitung aus einem etwas anderem Blickwinkel.', 'Eine Zeitung aus einem etwas anderem Blickwinkel.', 1, 'newspaper.jpg', '', '', '', 0.00, 1, 0, 1),
(153, 1, 191, 10, 'Elke MÃ¼de', 'Elke MÃ¼de', 'empty', '2014-01-05 19:17:23', 1388945843, 'Man ist schlafen Anstrengend...', 'Man ist schlafen Anstrengend...', 1, 'elke_sleepy.jpg', '', '', '', 0.00, 1, 0, 1),
(154, 1, 190, 10, 'Bibliothek am Heiligen See', 'Bibliothek am Heiligen See', 'empty', '2014-01-05 19:19:52', 1388945992, 'Die Alte Bibliothek am Nachmittag', 'Die Alte Bibliothek am Nachmittag', 1, 'park.jpg', '', '', '', 0.00, 1, 0, 1),
(155, 1, 189, 10, 'Elke Greeneye', 'Elke Greeneye', 'empty', '2014-01-05 19:21:40', 1388946100, 'Elke unsere Elke mit Blick ins Objektiv.  <br />\nMan ist das ein GrÃ¼n...', 'Elke unsere Elke mit Blick ins Objektiv.  <br />\nMan ist das ein Grün...', 1, 'elke_greeneye.jpg', '', '', '', 0.00, 1, 0, 1),
(156, 0, 188, 10, 'Impressionen aus dem Bugapark', 'Impressionen aus dem Bugapark', 'empty', '2014-01-05 19:23:16', 1388946196, 'Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation', 'Hier ein Bild aus dem Bugapark Potsdam mit Blick auf eine Wasserinstallation', 1, 'buga_park.jpg', '', '', '', 0.00, 1, 0, 1),
(157, 1, 187, 2, 'Batman Bowling Birds', 'Batman Bowling Birds', 'lost', '2014-01-05 19:26:25', 1388946385, 'Ein Bild auf Leinwand in Schwarz / WeiÃ', 'Ein Bild auf Leinwand in Schwarz / WeiÃ', 0, 'batman_bowling_birds.jpg', '', '60x30x3cm (BxHxT)', '60x30x3cm (BxHxT)', 80.00, 1, 1, 1),
(158, 1, 186, 8, 'Orange Light 01', 'Orange Light 01', 'givenaway', '2014-02-10 19:54:18', 1392058458, 'Meine 2te Lampe.  <br />\nDiesmal mit Orangenem Hintergrund.', 'Meine 2te Lampe.  <br />\nDiesmal mit Orangenem Hintergrund.', 0, 'orange_glows_glowing2.jpg', '', '44x50x40cm (BxHxT)', '44x50x40cm (BxHxT)', 98.25, 1, 0, 1),
(159, 1, 185, 8, 'Groggy 3 Times', 'Groggy 3 Times', 'forsale', '2014-02-10 19:56:48', 1392058608, 'Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.', 'Die Lampe ist aus einer Spezialleinwand in Prismenform gefertigt.', 0, 'groggy_3times_fin.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(160, 1, 184, 10, 'Gr&uuml;ne Idylle', 'Gr&uuml;ne Idylle', 'empty', '2014-04-27 19:33:52', 1398620032, 'Regen kann so schön sein.', 'Regen kann so schön sein.', 1, 'wet_leaf.png', '', '', '', 0.00, 1, 0, 1),
(161, 1, 183, 10, 'Eastereggs 2014', 'Eastereggs 2014', 'empty', '2014-04-27 19:35:18', 1398620118, 'Herzlichste OstergrÃ¼ÃŸe aus dem sonnigem Potsdam.', 'Herzlichste Ostergrüße aus dem sonnigem Potsdam.', 1, 'easter_eggs.jpg', '', '', '', 0.00, 1, 0, 1),
(162, 1, 182, 8, 'Giraffe Flower', 'Giraffe Flower', 'forsale', '2014-05-08 18:04:31', 1399565071, 'Eine Grüne Lampe mit schwarzem Blumenornamenten', 'Eine Grüne Lampe mit schwarzem Blumenornamenten', 0, 'giraffe-flower.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(163, 1, 181, 10, 'Klee in wei&szlig;', 'Klee in wei&szlig;', 'empty', '2014-06-11 19:34:31', 1402508071, 'Eine Blume halb verwelkt', 'Eine Blume halb verwelkt', 1, 'fadet_flower.jpg', '', '', '', 0.00, 1, 0, 1),
(164, 1, 180, 10, 'Stechpalme', 'Stechpalme', 'empty', '2014-06-11 19:38:08', 1402508288, 'Eine durchaus imposante Pflanze', 'Eine durchaus imposante Pflanze', 1, 'agarve.jpg', '', '', '', 0.00, 1, 0, 1),
(165, 1, 179, 10, 'Dinosaurier Auge', 'Dinosaurier Auge', 'empty', '2014-06-11 19:40:36', 1402508436, 'Dieses Holzstück erinnert mich an einen Dinosaurier', 'Dieses Holzstück erinnert mich an einen Dinosaurier', 1, 'dinosaur_eye.jpg', '', '', '', 0.00, 1, 0, 1),
(166, 1, 178, 10, 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'Bl&uuml;tenzauber des Kn&ouml;terichs', 'empty', '2014-06-11 19:47:19', 1402508839, 'Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.', 'Wie die Topologie eines Netzwerks breitet sich diese Blütenpracht an unserem Haus aus.', 1, 'network.jpg', '', '', '', 0.00, 1, 0, 1),
(167, 1, 177, 10, 'Klee bei uns im Garten', 'Klee bei uns im Garten', 'empty', '2014-06-12 18:27:37', 1402590457, 'Gelber Klee', 'Gelber Klee', 1, 'unknown02.jpg', '', '', '', 0.00, 1, 0, 1),
(168, 1, 172, 3, 'Q', 'Q', 'empty', '2014-06-12 18:56:38', 1402592198, 'das Q', 'the Q', 1, 'Q.JPG', '', '', '', 0.00, 1, 0, 1),
(169, 1, 98, 3, 'C', 'C', 'empty', '2014-06-12 18:57:48', 1402592268, 'das C', 'the C', 1, 'C.JPG', '', '', '', 0.00, 1, 0, 1),
(170, 1, 96, 3, 'A', 'A', 'empty', '2014-06-12 18:58:49', 1402592329, 'das A', 'the A', 1, 'A_2.jpg', '', '', '', 0.00, 1, 0, 1),
(171, 1, 177, 3, 'Y', 'Y', 'empty', '2014-06-13 15:19:59', 1402665589, 'Das Y', 'the Y', 1, 'Y.jpg', '', '', '', 0.00, 1, 0, 1),
(172, 1, 150, 3, 'H', 'H', 'empty', '2014-06-13 15:41:04', 1402666864, 'Das H', 'the H', 1, 'H.JPG', '', '', '', 0.00, 1, 0, 1),
(183, 1, 175, 3, 'W', 'W', 'empty', '2014-06-13 17:01:49', 1402671709, 'Das W', 'the W', 1, 'W_clear.JPG', '', '', '', 0.00, 1, 0, 1),
(174, 1, 171, 9, 'Monstar 01', 'Monstar 01', 'empty', '2014-06-13 15:51:12', 1402667472, 'Das erste der Monstarz Serie', 'Das erste der Monstarz Serie', 1, 'Monster_wall_ashtray.jpg', '', '', '', 0.00, 1, 0, 1),
(175, 1, 170, 9, 'Monstar 02', 'Monstar 02', 'empty', '2014-06-13 15:53:07', 1402667587, '', '', 1, 'bush.jpg', '', '', '', 0.00, 1, 0, 1),
(177, 1, 169, 9, 'Monstar 03', 'Monstar 03', 'empty', '2014-06-13 15:55:18', 1402667718, '', '', 1, 'table.jpg', '', '', '', 0.00, 1, 0, 1),
(178, 1, 170, 3, 'M', 'M', 'empty', '2014-06-13 16:05:08', 1402668308, 'Das M', 'the M', 1, 'M.JPG', '', '', '', 0.00, 1, 0, 1),
(179, 1, 167, 10, 'Am Wegesrand', 'Am Wegesrand', 'empty', '2014-06-13 16:20:38', 1402669238, 'Kleine Details als Makroaufnahme', 'Kleine Details als Makroaufnahme', 1, 'garbage.jpg', '', '', '', 0.00, 1, 0, 1),
(182, 0, 166, 3, 'J', 'J', 'empty', '2014-06-13 16:35:10', 1402670110, 'Das J', 'the J', 1, 'J.jpg', '', '', '', 0.00, 1, 0, 1),
(184, 1, 97, 3, 'B', 'B', 'empty', '2014-06-13 18:12:29', 1402675949, 'Das B wie Buddha', 'B for Buddha', 1, 'B3.jpg', '', '', '', 0.00, 1, 0, 1),
(185, 1, 163, 9, 'Monstar 04', 'Monstar 04', 'empty', '2014-06-14 15:48:40', 1402753720, '', '', 1, 'P6141594.JPG', '', '', '', 0.00, 1, 0, 1),
(186, 1, 162, 9, 'Monstar 05', 'Monstar 05', 'empty', '2014-06-14 15:49:22', 1402753762, 'Monstar auf der Bank', 'Monstar auf der Bank', 1, 'P6141597.JPG', '', '', '', 0.00, 1, 0, 1),
(187, 1, 161, 10, 'Am Wegesrand 2', 'Am Wegesrand 2', 'empty', '2014-06-15 16:05:10', 1402841110, 'Nettes Detail der Pflanze', 'Nettes Detail der Pflanze', 1, 'wegesrand2.JPG', '', '', '', 0.00, 1, 0, 1),
(188, 1, 160, 10, 'Hairy Plant', 'Hairy Plant', 'empty', '2014-06-15 16:39:41', 1402843181, 'Spitzwegerich', 'Spitzwegerich', 1, 'Hairy_Plant.JPG', '', '', '', 0.00, 1, 0, 1),
(189, 1, 159, 10, 'Rinde', 'Rinde', 'empty', '2014-06-15 18:02:58', 1402848178, 'Eine Baumrinde von nah', 'Eine Baumrinde von nah', 1, 'bark.JPG', '', '', '', 0.00, 1, 0, 1),
(190, 1, 158, 2, 'Lionel Wall', 'Lionel Wall', 'forsale', '2014-07-19 15:45:42', 1405777542, 'A tribute to argentinia.', 'A tribute to argentinia.', 0, 'lionel_wall.jpg', '', '70x70x3 cm (BxHxT)', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(191, 1, 157, 8, 'Link Teabag', 'Link Teabag', 'forsale', '2014-08-22 20:26:28', 1408731988, 'Lila &plus; Pink = Link  <br />\nNoch ohne Beleuchtung aber gut.', 'Lila &plus; Pink = Link  <br />\nNoch ohne Beleuchtung aber gut.', 0, 'link_teabag.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 180.00, 1, 1, 1),
(193, 1, 155, 9, 'Monstar 06', 'Monstar 06', 'empty', '2014-08-23 19:37:21', 1408815441, 'Diesmal Monstar auf Arbeit', 'Diesmal Monstar auf Arbeit', 1, 'monstar06.jpg', '', '', '', 0.00, 1, 0, 1),
(192, 1, 156, 10, 'Kn&ouml;terich Knospe', 'Kn&ouml;terich Knospe', 'empty', '2014-09-14 20:50:47', 1410720647, 'An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert', 'An unserer Hauswand wohnt ein Knöterich und den hab ich mal Fotografiert', 1, 'knoeterich.JPG', '', '', '', 0.00, 1, 0, 1),
(194, 1, 154, 9, 'Monstar 07', 'Monstar 07', 'empty', '2014-09-21 15:58:21', 1411307901, 'Monstar im Badschrank', 'Monstar im Badschrank', 1, 'monster_bath.jpg', '', '', '', 0.00, 1, 0, 1),
(195, 1, 153, 10, 'Die M&ouml;we', 'Die M&ouml;we', 'empty', '2014-09-28 15:27:19', 1411910839, 'Eine Prachtvolle Silbermöwe auf einem Strandkorb.', 'Eine Prachtvolle Silbermöwe auf einem Strandkorb.', 1, 'Moewe.JPG', '', '', '', 0.00, 1, 0, 1),
(196, 1, 152, 5, 'Q3Face', 'Q3Face', 'empty', '2014-10-17 21:41:50', 1413574910, 'Nach etwas kramen fand ich dieses Bild...', 'Nach etwas kramen fand ich dieses Bild...', 0, 'q3face.jpg', '', '1024x768 Pixel', '1024x768 Pixel', 0.00, 1, 0, 1),
(197, 1, 151, 2, 'Double Crunch Peanut', 'Double Crunch Peanut', 'forsale', '2014-10-17 22:20:18', 1413577218, 'Das Bild mit der Erdnuss.... ;)', 'Das Bild mit der Erdnuss.... ;)', 0, 'double_crunch_peanut.jpg', '', '70x70x3 cm (BxHxT)', '70x70x3 cm (BxHxT)', 80.00, 1, 1, 1),
(198, 1, 150, 9, 'Monstar Lennon Wall', 'Monstar Lennon Wall', 'empty', '2014-10-29 18:53:24', 1414605204, 'Monstar vor der \"John Lennon\" Wall in Hongkong.', 'Monstar vor der \"John Lennon\" Wall in Hongkong.', 4, 'IMG_5639.jpeg', '', '', '', 0.00, 1, 0, 1),
(199, 1, 149, 9, 'Monstar in the Tram', 'Monstar in the Tram', 'empty', '2014-10-29 18:54:24', 1414605264, 'Monstar vor der Skyline Hong-Kongs', 'Monstar vor der Skyline Hong-Kongs', 4, 'IMG_5635.jpeg', '', '', '', 0.00, 1, 0, 1),
(200, 1, 148, 7, 'Pteranodon', 'Pteranodon', 'givenaway', '2014-10-29 19:43:00', 1414608180, 'Ein Ur-Saurier als Grafik', 'Ein Ur-Saurier als Grafik', 0, 'Pteranodon.jpg', '', '', '', 0.00, 1, 0, 1),
(202, 1, 176, 3, 'X', 'X', 'empty', '2014-10-30 19:19:19', 1414693159, 'Schilf am Strand', 'reeds on the beach', 8, 'X.jpg', '', '', '', 0.00, 1, 0, 1),
(203, 1, 146, 9, 'Freeclimbing Monstar', 'Freeclimbing Monstar', 'empty', '2014-11-18 16:43:31', 1416325411, 'Ein Monster am Fenster', 'Ein Monster am Fenster', 5, 'SAM_1378.JPG', '', '', '', 0.00, 1, 0, 1),
(204, 1, 145, 9, 'Monstar on Rails', 'Monstar on Rails', 'empty', '2014-11-18 16:45:00', 1416325500, 'Ein Monstar im Park', 'Ein Monstar im Park', 5, 'SAM_1380.JPG', '', '', '', 0.00, 1, 0, 1),
(205, 1, 144, 9, 'Monstar Tabledance', 'Monstar Tabledance', 'empty', '2014-11-18 16:45:53', 1416325553, 'Ein Monstar auf dem Tisch.', 'Ein Monstar auf dem Tisch.', 5, 'SAM_1387.JPG', '', '', '', 0.00, 1, 0, 1),
(206, 1, 143, 9, 'Monstar Temple', 'Monstar Temple', 'empty', '2014-11-18 16:49:03', 1416325743, 'Monstar im Freilufttempel', 'Monstar im Freilufttempel', 5, 'SAM_1397.JPG', '', '', '', 0.00, 1, 0, 1),
(207, 1, 142, 9, 'Monstar Child', 'Monstar Child', 'empty', '2014-11-18 16:49:53', 1416325793, 'Ein Kind mit meinem Monstar', 'Ein Kind mit meinem Monstar', 5, 'SAM_1394.JPG', '', '', '', 0.00, 1, 0, 1),
(209, 1, 174, 3, 'T', 'T', 'empty', '2015-01-18 19:23:00', 1421605380, 'Das T als Schatten', 'The T as a shadow', 1, 'T.jpg', '', '', '', 0.00, 1, 0, 1),
(210, 1, 168, 3, 'L', 'L', 'empty', '2015-01-18 19:28:28', 1421605708, 'Das L', 'the L', 5, '107c1428a98c4d8148746a6c7ca75f61.jpg', '', '', '', 0.00, 1, 0, 1),
(211, 1, 171, 3, 'O', 'O', 'empty', '2015-01-31 18:48:30', 1422726510, 'Das O', 'the O', 1, 'o.jpg', '', '', '', 0.00, 1, 0, 1),
(212, 1, 138, 10, 'Sundown in Bim&ouml;hlen', 'Sundown in Bim&ouml;hlen', 'empty', '2015-02-27 17:50:16', 1425055816, 'Ein Sonnenuntergang bei uns im Dorf', 'Ein Sonnenuntergang bei uns im Dorf', 1, 'P2272172.JPG', '', '', '', 0.00, 1, 0, 1),
(213, 1, 137, 7, 'HorsePower', 'HorsePower', 'givenaway', '2015-03-01 15:13:06', 1425219186, 'Ein Pferdekopf (war nicht als solches gewollt)  <br />\nIst aber trotzdem Nett', 'Ein Pferdekopf (war nicht als solches gewollt)  <br />\nIst aber trotzdem Nett', 0, 'HorsePower.jpg', '', '', '', 0.00, 1, 0, 1),
(270, 0, 94, 10, 'Raindrop', 'Raindrop', 'empty', '2016-06-16 17:16:46', 1466090206, 'Taufrisch aus Rickling', 'Taufrisch aus Rickling', 1, 'raindrop.jpg', '', '', '', 0.00, 1, 0, 1),
(214, 1, 136, 8, 'Four Seasons', 'Four Seasons', 'forsale', '2015-03-12 21:46:44', 1426193204, 'Lichtobjekt aus 4 Leinwänden.  <br />\nJede Leinwand steht für eine Jahreszeit.  <br />\nFehlt nur noch das Licht... ;)', 'Lichtobjekt aus 4 Leinwänden.  <br />\nJede Leinwand steht für eine Jahreszeit.  <br />\nFehlt nur noch das Licht... ;)', 0, 'four_seasons.jpg', '', '30x34x90cm', '30x34x90cm', 220.00, 1, 1, 1),
(215, 1, 135, 7, 'Cockroach', 'Cockroach', 'givenaway', '2015-03-13 09:57:01', 1426237021, 'Die Kakerlake ... ;)', 'Die Kakerlake ... ;)', 0, 'cockroach.jpg', '', '', '', 20.00, 1, 0, 1),
(216, 1, 134, 7, 'Killer Instinct', 'Killer Instinct', 'forsale', '2015-03-13 09:58:57', 1426237137, 'Fineliner Artwork von 2015', 'Fineliner Artwork von 2015', 0, 'killer_instinct.jpg', '', '', '', 20.00, 1, 1, 1),
(217, 1, 133, 7, 'Elbic Dream', 'Elbic Dream', 'forsale', '2015-03-13 10:01:57', 1426237317, 'kein Kommentar ;)', 'kein Kommentar ;)', 0, 'elbic-dream.jpg', '', '', '', 20.00, 1, 1, 1),
(218, 1, 132, 10, 'Osterglocken', 'Osterglocken', 'empty', '2015-03-21 12:57:46', 1426939066, 'Ein gelbes Osterglöckchen', 'Ein gelbes Osterglöckchen', 1, 'yellow_flowers.jpg', '', '', '', 0.00, 1, 0, 1),
(219, 1, 131, 2, 'Schimmelreiter 2015', 'Schimmelreiter 2015', 'sold', '2015-04-02 17:58:00', 1427990280, 'Ein Bild mit vielen Namen...  <br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015', 'Ein Bild mit vielen Namen...  <br />\nPfebra, Zerd, Pippilottas Horse, Schimmelreiter 2015', 0, 'schimmelreiter2015.jpg', '', '50x60x3cm', '50x60x3cm', 80.00, 1, 0, 1),
(220, 1, 130, 10, 'Ostern 2015', 'Ostern 2015', 'empty', '2015-04-06 15:51:00', 1428328260, 'Ein kleiner Ostergruß von der Ostsee ;)', 'Ein kleiner Ostergruß von der Ostsee ;)', 1, 'easter_2015.jpg', '', '', '', 0.00, 1, 0, 1),
(221, 1, 129, 10, 'B&uuml;sumer Leuchtturm', 'B&uuml;sumer Leuchtturm', 'empty', '2015-04-06 15:26:18', 1428326778, 'Der Leuchtturm in Büsum an der windigen Nordsee', 'Der Leuchtturm in Büsum an der windigen Nordsee', 1, 'northsea.jpg', '', '', '', 0.00, 1, 0, 1),
(222, 1, 128, 10, 'Der Spatz im Hansapark', 'Der Spatz im Hansapark', 'empty', '2015-05-07 17:24:12', 1431012252, 'ganz schön zutraulig der Kleine.', 'ganz schön Zutraulig der kleine.', 1, 'sparrow.JPG', '', '', '', 0.00, 1, 0, 1),
(223, 1, 127, 10, 'Dandelion', 'Dandelion', 'empty', '2015-05-19 17:53:11', 1432050791, 'Ein verblühter Löwenzahn im Neuen Garten in Potsdam.', 'Ein verblühter Löwenzahn im Neuen Garten in Potsdam.', 1, 'dandelion.JPG', '', '', '', 0.00, 1, 0, 1),
(224, 1, 126, 7, 'Mystic Dragon', 'Mystic Dragon', 'forsale', '2015-06-19 18:32:24', 1434731544, 'Eins meiner neusten Werke.', 'Eins meiner neusten Werke.', 0, 'Mystic-Dragon.jpg', '', 'A4', 'A4', 25.00, 1, 1, 1),
(225, 1, 125, 7, 'Kitchen Aid', 'Kitchen Aid', 'forsale', '2015-06-19 18:34:30', 1434731670, 'Die Tolle Knolle. ;)', 'Die Tolle Knolle. ;)', 0, 'kitchen-aid.jpg', '', '', '', 20.00, 1, 1, 1),
(226, 1, 124, 7, 'Club Rotation', 'Club Rotation', 'forsale', '2015-07-05 07:56:53', 1436075813, 'A fineliner Artwork from 2015', 'A fineliner Artwork from 2015', 0, 'club-rotation.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(227, 1, 167, 3, 'K', 'K', 'empty', '2015-07-05 07:59:31', 1436075971, 'Das Gurken-K', 'The cucumber-K', 1, 'K.jpg', '', '', '', 0.00, 1, 0, 1),
(229, 1, 121, 7, 'Friends Letter', 'Friends Letter', 'forsale', '2015-07-18 15:31:34', 1437226294, 'Das Alphabet im Bild versteckt... ;)', 'Das Alphabet im Bild versteckt... ;)', 0, 'friends_letter.jpg', '', '', '', 20.00, 1, 1, 1),
(228, 1, 122, 7, 'Mr. Crab', 'Mr. Crab', 'forsale', '2015-07-12 15:17:28', 1436707048, 'Eine kleine Krabbe', 'Eine kleine Krabbe', 0, 'mr_crabs.jpg', '', '', '', 17.00, 1, 1, 1),
(230, 1, 120, 8, 'Buttercup', 'Buttercup', 'sold', '2015-08-03 20:12:27', 1438625547, 'Eine neue Lampe mit weißen Linien.........  <br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  <br />\nAlso es fehlt noch das Entscheidende Licht.', 'Eine neue Lampe mit weißen Linien.........  <br />\nMal wieder ist die Baumarkttruppe noch nicht angekommen... ;)  <br />\nAlso es fehlt noch das Entscheidende Licht.', 0, 'buttercup5.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 150.00, 1, 0, 1),
(231, 1, 119, 10, 'Orange Green MIX', 'Orange Green MIX', 'empty', '2015-08-04 18:50:02', 1438707002, 'Eine Blüte von größter Güte im Botanischen Garten in Kiel', 'Eine Blüte von größter Güte im Botanischen Garten in Kiel', 1, 'orange-cloud.jpg', '', '', '', 0.00, 1, 0, 1),
(232, 1, 118, 5, 'Crazy in love', 'Crazy in love', 'empty', '2015-09-19 16:14:57', 1442672097, 'Wallpaper von 2015', 'Wallpaper von 2015', 0, 'crazy-in-love4.jpg', '', '1920x1080 Pixel', '1920x1080 Pixel', 0.00, 1, 0, 1),
(243, 1, 117, 7, 'Pontius Pilatus', 'Pontius Pilatus', 'empty', '2015-10-07 20:18:43', 1444241923, 'Fineliner Pic von 2015', 'Fineliner Pic von 2015', 0, 'pontius-pilatus.jpg', '', '', '', 0.00, 1, 0, 1),
(244, 1, 116, 5, 'Red Obsession', 'Red Obsession', 'empty', '2015-11-30 09:12:52', 1448871172, 'Ein neueres Wallpaper von 2015', 'Ein neueres Wallpaper von 2015', 0, 'red19.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(245, 1, 115, 13, 'ZIA 01', 'ZIA 01', 'forsale', '2015-12-13 20:55:33', 1450036533, 'Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  <br />\nIndex: Crescent Moon, Static, Tipple, Florz', 'Mein erstes Zentangle inspiriertes Bild - (ZIA - Zentangle ® Inspired Art)  <br />\nIndex: Crescent Moon, Static, Tipple, Florz', 0, 'ZIA-01.jpg', '', 'A4', 'A4', 15.00, 1, 1, 1),
(246, 1, 114, 10, 'Sunrise in Bim&ouml;hlen', 'Sunrise in Bim&ouml;hlen', 'empty', '2015-12-21 10:04:11', 1450688651, 'Ein Sonnenaufgang im Dezember bei uns in Bimöhlen', 'Ein Sonnenaufgang im Dezember bei uns in Bimöhlen', 1, 'sonnenaufgang.jpg', '', '', '', 0.00, 1, 0, 1),
(247, 2, 113, 13, 'ZIA 02', 'ZIA 02', 'forsale', '2016-01-07 19:51:58', 1452192718, 'Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  <br />\nIndex: Poke Root, Hollibaugh, Msst, Zander', 'Zentangle Inspired Art Nummer 2 ist noch nicht fertig...  <br />\nIndex: Poke Root, Hollibaugh, Msst, Zander', 0, 'ZIA-02.jpg', '', '', '', 15.00, 1, 1, 1),
(248, 1, 112, 13, 'ZIA 03', 'ZIA 03', 'forsale', '2016-01-07 19:52:41', 1452192761, 'Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  <br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox', 'Zentangle Inspired Art Nummer 3 ist noch nicht fertig...  <br />\nIndex: Florz, Emingle, Zander, Poke Root, Static, Printemps, Jetties, Hollibaugh, Crescent, Moon, Tipple, Paradox', 0, 'ZIA-03_2.jpg', '', '', '', 15.00, 1, 1, 1),
(249, 1, 111, 6, 'Crusty King', 'Crusty King', 'forsale', '2016-01-15 14:12:19', 1452863539, 'Filzstift auf einer Runden Leinwand-Pappe', 'Filzstift auf einer Runden Leinwand-Pappe', 0, 'Crusty-King-2.jpg', '', '', '', 22.00, 1, 1, 1),
(250, 1, 110, 13, 'ZIA 04', 'ZIA 04', 'forsale', '2016-01-21 20:12:11', 1453403531, 'Mein 4tes Zentangle Inspired Art Bild  <br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas', 'Mein 4tes Zentangle Inspired Art Bild  <br />\nIndex: Rain,Sedgling,Purk,Jonqal,Huggins,Fracas', 0, 'ZIA-04.jpg', '', '', '', 15.00, 1, 1, 1),
(251, 1, 109, 13, 'ZIA 05', 'ZIA 05', 'forsale', '2016-02-05 16:52:57', 1454687577, 'Zentangle Inspired Postcard 01  <br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,', 'Zentangle Inspired Postcard 01  <br />\nIndex: Zander, Printemps, Nipa, Meer, Marbaix, Man-O-Man, Knase, Keeko,Kathy\'s Dilemma, Hollibaugh, Hibred, Gneiss, Fracas, Moon,', 0, 'ZIA-05.jpg', '', '10x15cm', '10x15cm', 15.00, 1, 1, 1),
(252, 1, 108, 13, 'ZIA 06', 'ZIA 06', 'forsale', '2016-02-05 16:53:50', 1454687630, 'Zentangle Inspired Postcard 02  <br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,', 'Zentangle Inspired Postcard 02  <br />\nIndex: Zander, TA-SF, Keeko , Hollibaugh, Fracas, Flukes, Cubine, Coral Seeds, Barber Pole, Tipple,', 0, 'ZIA-06.jpg', '', '10x15cm', '10x15cm', 15.00, 1, 1, 1),
(253, 1, 107, 13, 'ZIA 07', 'ZIA 07', 'forsale', '2016-02-19 14:20:58', 1455888058, 'Printed Zentangle im Paspartout.  <br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling', 'Printed Zentangle im Paspartout.  <br />\nIndex: Nipa, Marbaix, Holibaugh, Crescent Moon, Keeko, Yincut, Sedgling', 0, 'ZIA-07.jpg', '', 'A5', 'A5', 15.00, 1, 1, 1),
(254, 1, 106, 13, 'ZIA 08', 'ZIA 08', 'forsale', '2016-02-26 19:05:30', 1456509930, 'Zentangle Inspired Postcard No.3.  <br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon', 'Zentangle Inspired Postcard No.3.  <br />\nIndex: Hollibaugh, Emingle, Flukes, Enyshou, Beeline, Yincut, Fracas, Marbaix, Paradox, Coral Seeds, Finery, Chilon', 0, 'ZIA-08.jpg', '', '', '', 15.00, 1, 1, 1),
(255, 1, 105, 13, 'ZIA 09', 'ZIA 09', 'forsale', '2016-02-26 19:06:44', 1456510004, 'Zentangle Inspired Postcard No. 4.  <br />\nIndex: Hollibaugh, Fracas \"Reverse\", W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz', 'Zentangle Inspired Postcard No. 4.  <br />\nIndex: Hollibaugh, Fracas \"Reverse\", W2, Cubine, Crescent Moon, Enyshou, Btl Joos, Yincut, Braze, Coral Seeds, Floorz', 0, 'ZIA-09.jpg', '', '', '', 15.00, 1, 1, 1),
(256, 1, 104, 6, 'RIP MUM', 'RIP MUM', 'empty', '2016-03-19 16:46:36', 1458402396, 'Rest in Peace Mum', 'Rest in Peace Mum', 0, 'RIP_MUM.jpg', '', 'A3', 'A3', 0.00, 1, 0, 1),
(257, 1, 103, 6, 'Guilty Conscience', 'Guilty Conscience', 'forsale', '2016-03-19 16:47:52', 1458402472, 'Der Drachen der Drachen der Drachen der Drachen', 'Der Drachen der Drachen der Drachen der Drachen', 0, 'Guilty-Conscience.jpg', '', 'A3', 'A3', 22.00, 1, 1, 1),
(258, 1, 102, 7, 'Butterfly Prison', 'Butterfly Prison', 'empty', '2016-03-19 18:46:04', 1458409564, 'Ein Schmetterling im GefÃ¤ngnis in PostkartengrÃ¶ÃŸe', 'Ein Schmetterling im Gefängnis in Postkartengröße', 0, 'prison-butterfly.jpg', '', 'A6', 'A6', 0.00, 1, 0, 1),
(259, 1, 101, 7, 'Sitting Bull', 'Sitting Bull', 'empty', '2016-03-31 17:19:36', 1459437576, 'Eine Postkarte im Indian Asario Style :)', 'Eine Postkarte im Indian Asario Style :)', 0, 'sitting_bull.jpg', '', 'A6', 'A6', 0.00, 1, 0, 1),
(261, 1, 100, 5, 'asario.de', 'asario.de', 'empty', '2016-05-12 20:34:57', 1463078097, 'Das Wallpaper zur Domain www.asario.de', 'Das Wallpaper zur Domain www.asario.de', 0, 'ab_bluf.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(262, 1, 99, 2, 'Wandering Star', 'Wandering Star', 'givenaway', '2016-05-13 18:08:13', 1463155693, 'Der wandernde Stern in 3D', 'Der wandernde Stern in 3D', 0, 'wandering-star.jpg', '', '12x12cm', '12x12cm', 0.00, 1, 0, 1),
(265, 0, 169, 3, 'L', 'L', 'empty', '2016-05-15 12:02:37', 1463306557, 'Das L', 'the L', 1, 'L.jpg', '', '', '', 0.00, 1, 0, 1),
(266, 1, 97, 10, 'BeachBall', 'BeachBall', 'empty', '2016-06-06 09:50:04', 1465199404, 'Ein Strandbild', 'Ein Strandbild', 1, 'beach_feeling.jpg', '', '', '', 0.00, 1, 0, 1),
(267, 1, 96, 5, 'Sunshine Feelings', 'Sunshine Feelings', 'empty', '2016-06-06 09:51:42', 1465199502, 'Eine Collage von 2016', 'Eine Collage von 2016', 0, 'sunshine.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(268, 1, 95, 10, 'Dune Wonder', 'Dune Wonder', 'empty', '2016-06-06 10:54:10', 1465203250, 'Eine Düne an der Ostsee.', 'Eine Düne an der Ostsee.', 1, 'dune.jpg', '', '', '', 0.00, 1, 0, 1),
(271, 1, 93, 8, 'Blue Cage', 'Blue Cage', 'forsale', '2016-06-24 16:12:59', 1466777579, 'Mal wieder eine Lampe Ohne Licht (noch)', 'Mal wieder eine Lampe Ohne Licht (noch)', 0, 'Blue-Cage.jpg', '', '29x90x15cm (BxHxT)', '29x90x15cm (BxHxT)', 150.00, 1, 1, 1),
(272, 1, 92, 4, 'Mighty Crab', 'Mighty Crab', 'forsale', '2016-07-17 15:16:46', 1468761406, 'Dieses Motiv ist aus dem Buch \"Zen Colouring Ocean\".  <br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.', 'Dieses Motiv ist aus dem Buch \"Zen Colouring Ocean\".  <br />\nIch habe es lediglich mit farbigen Fineliner ausgemalt.', 0, 'Mighty-Crab.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(273, 1, 91, 4, 'Fishy Fishy', 'Fishy Fishy', 'forsale', '2016-08-18 20:13:05', 1471543985, 'Ein Großer Fisch im Netz ;)  <br />\nAus dem Buch \"Zen Colouring Ocean\".', 'Ein Großer Fisch im Netz ;)  <br />\nAus dem Buch \"Zen Colouring Ocean\".', 0, 'fishy-fishy.jpg', '', '', '', 20.00, 1, 1, 1),
(274, 0, 90, 10, 'Sunrise on Angelteich ;)', 'Sunrise on Angelteich ;)', 'empty', '2016-08-27 16:11:34', 1472307094, 'Stimmiges Bild vom Angelteich in Wittenborn', 'Stimmiges Bild vom Angelteich in Wittenborn', 1, 'Sonenaufgang-am-See.jpg', '', '', '', 0.00, 1, 0, 1),
(275, 1, 89, 7, 'Useless Bag', 'Useless Bag', 'givenaway', '2016-10-12 18:46:49', 1476290809, 'Ein älteres Bild was ich vor kurzem erst gefunden habe.  <br />\nLag ganz unten in der Kiste ;)', 'Ein Älteres Bild was ich vor kurzem erst gefunden habe.  <br />\nLag ganz unten in der Kiste ;)', 0, 'useless-bag.jpg', '', '', '', 0.00, 1, 0, 1),
(276, 1, 88, 4, 'Circle Ornament', 'Circle Ornament', 'forsale', '2016-10-14 17:03:56', 1476457436, 'Ein Motiv aus dem Buch \"Hypnose und Trance\" ausgemalt mit Stabilos.  <br />\r\nDie Kunst ist das man nicht Verrückt wird dabei,', 'Ein Motiv aus dem Buch \"Hypnose und Trance\" ausgemalt mit Stabilos.  <br />\r\nDie Kunst ist das man nicht Verrückt wird dabei,', 6, 'ornament.jpg', '', '', '', 30.00, 1, 1, 1),
(277, 1, 87, 4, 'Jellyfish', 'Jellyfish', 'forsale', '2017-02-09 20:00:41', 1486666841, 'Aus dem Buch \"Hypnose & Trance\"', 'Aus dem Buch \"Hypnose & Trance\"', 0, 'jelly_fish.jpg', '', '', '', 20.00, 1, 1, 1),
(278, 1, 86, 2, 'Buttermilk Diver', 'Buttermilk Diver', 'forsale', '2017-02-16 17:07:21', 1487261241, 'Schwarzes Acryl auf weißer Leinwand.', 'Schwarzes Acryl auf weißer Leinwand.', 0, 'buttermilk-diver.jpg', '', '', '', 80.00, 1, 1, 1),
(279, 1, 85, 6, 'Hells Kitchen', 'Hells Kitchen', 'forsale', '2017-03-02 21:01:38', 1488484898, 'Der Teufel in uns ;).', 'Der Teufel in uns ;).', 0, 'devils_kitchen.jpg', '', 'A3', 'A3', 22.00, 1, 1, 1),
(280, 1, 84, 10, 'Vom Fernsehturm in Berlin - Gastbild', 'From television tower in Berlin - Guestimage', 'empty', '2017-05-23 18:17:51', 1495556271, 'Dieses nette Bild hat meine Schwester geschossen.  <br />\nEin Panorama vom Berliner Fernsehturm am Alex.', 'This nice shot was made by my Sister.  <br />\nA panorama from Television Tower at the Alex in Berlin.', 6, 'DSCF5931[1].jpg', '', '', '', 0.00, 1, 0, 1),
(281, 2, 83, 12, 'Mederius Aschenbecher[0]', 'Mederius Ashtray[0]', 'empty', '2017-05-28 16:29:50', 1692888560, 'Hier ein erster Entwurf des Mederius Aschenbechers.  \r\nJetzt endlich in glasierter Form.  \r\nIst erst der erste Grobentwurf', 'The first draft of the Mederius Ashtray.  \r\nNow it\\\'s glazed and fired.  \r\nIt\\\'s just a concept of proof.', 7, 'mederius_ashtray[0].jpg', '', '', '', 15.00, 1, 0, 1);
INSERT INTO `images` (`id`, `pub`, `position`, `images_categories_id`, `headline`, `headline_en`, `status`, `created_at`, `chg_date`, `message`, `message_en`, `camera_id`, `image_path`, `link`, `Format`, `Format_en`, `preis`, `users_id`, `xis_IsSaleable`, `xkis_Ticker`) VALUES
(283, 1, 82, 4, 'Womenizer', 'Womenizer', 'empty', '2017-07-09 09:09:24', 1692886897, 'Frauen an die Macht ;)  \r\nAus dem Buch \\\"Hypnose & Trance\\\"', 'Womenpower ;)  \r\nOut of the Book \\\"Hypnose & Trance\\\"', 0, 'womenizer.jpg', '', '17,5x17,5cm', '17,5x17,5cm', 0.00, 1, 0, 1),
(284, 1, 81, 9, 'Monster in Neu Seeland', 'Monstar in New Zealand', 'empty', '2017-09-17 12:54:06', 1505645646, 'Mein Monster im Süden', 'My Monstar in the South', 6, 'monstar_newzealand.JPG', '', '', '', 0.00, 1, 0, 1),
(285, 0, 80, 12, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', '2017-10-08 17:01:02', 1507474862, 'Ungebrannt und Unglasiert', 'Unglazed & Unfired', 0, 'ashtray[1].jpg', '', '', '', 0.00, 1, 0, 1),
(286, 1, 79, 12, 'Mederius Aschenbecher[1]', 'Mederius Ashtray[1]', 'empty', '2017-10-24 15:10:19', 1692888409, 'Jetzt Aber...', 'Here we go...', 7, 'mederius_ashtray[1]_3.jpg', '', '', '', 25.00, 1, 1, 1),
(287, 1, 78, 9, 'Strand-Monstar', 'Beach-Monstar', 'empty', '2018-01-22 17:13:22', 1516637602, 'Monstar am Strand.', 'Monstar at the beach.', 6, 'beach-monstar.jpg', '', '', '', 0.00, 1, 0, 1),
(288, 1, 77, 9, 'Stein-Monstar', 'Stone-Monstar', 'empty', '2018-01-22 17:15:14', 1516637714, 'Monstar auf einem Felsen.', 'Monstar on the rocks', 6, 'stone-monstar.jpg', '', '', '', 0.00, 1, 0, 1),
(289, 1, 76, 9, 'Baxter &plus; Monstar', 'Baxter &plus; Monstar', 'empty', '2018-01-22 17:17:31', 1516637851, 'Baxter spielend mit dem Monstar', 'Baxter playing with monstar', 6, 'dog-star.jpg', '', '', '', 0.00, 1, 0, 1),
(290, 1, 75, 10, 'Ianosaurus & Masha - Gastbild', 'Ianosaurus & Masha - Guestimage', 'empty', '2018-01-22 19:06:55', 1516644415, 'Ianosaurus mit Masha', 'Ianosaurus with Masha', 6, 'DSCF7990[1].jpg', '', '', '', 0.00, 1, 0, 1),
(291, 1, 74, 10, 'Masha ist zur&uuml;ck', 'Masha is Back', 'empty', '2018-04-02 16:02:52', 1522677772, 'Mascha im Park.', 'Masha in the park.', 7, 'P1000148.JPG', '', '', '', 0.00, 1, 0, 1),
(292, 1, 73, 10, 'Balafon aus Afrika', 'Balafon from Africa', 'empty', '2018-04-02 16:37:39', 1522679859, 'Ein traditionelles afrikanisches Instrument', 'A traditional African Instrument', 7, 'P1000098.JPG', '', '', '', 0.00, 1, 0, 1),
(293, 1, 72, 10, 'Masha in the Face', 'Masha in the Face', 'empty', '2018-04-02 16:46:19', 1522680379, 'Masha in nah', 'Masha zoomed in', 7, 'P1000161.JPG', '', '', '', 0.00, 1, 0, 1),
(294, 1, 71, 5, 'Mixed Mash', 'Mixed Mash', 'empty', '2018-04-15 11:48:41', 1523785721, 'Eine Collage am Hamburger ZOB', 'A collage from ZOB in Hamburg', 0, 'mixed-mash.jpg', '', '1680x1050 Pixel', '1680x1050 Pixel', 0.00, 1, 0, 1),
(295, 1, 70, 2, 'Window Shopper', 'Window Shopper', 'forsale', '2018-04-19 18:15:37', 1524154537, 'Ein Acryl Kunstwerk', 'A Acrylic Artwork', 0, 'window-shopper.jpg', '', '50x50cm', '50x50cm', 80.00, 1, 1, 1),
(297, 1, 69, 2, 'Blue Marswallow', 'Blue Marswallow', 'givenaway', '2018-06-30 13:12:57', 1530357177, 'Das Geschenk zur Hochzeit meiner Schwester', 'The Wedding Gift for my Sister.', 0, 'blue-marswallow.jpg', '', '70x50cm', '70x50cm', 0.00, 1, 0, 1),
(298, 1, 68, 10, 'Wetterhahn', 'Weathercock', 'empty', '2018-08-09 22:38:36', 1533847116, 'Ein Wetterhahn im Abendhimmel', 'A Weathercock in evening sky', 7, 'sundown_cock.jpg', '', '', '', 0.00, 1, 0, 1),
(299, 1, 67, 10, 'Libelle am Fenster', 'Dragonfly on window', 'empty', '2018-08-09 22:42:38', 1533847358, 'Hier eine verirrte Libelle in unserem Feriendomizil', 'A dragonfly in our holiday home', 7, 'dragonfly.jpg', '', '', '', 0.00, 1, 0, 1),
(300, 1, 66, 9, 'Baxter am spielen mit dem Monstar', 'Baxter playing with the Monstar', 'empty', '2018-08-12 11:20:38', 1534065638, 'Baxter auf einem Felsen spielend mit dem Monstar.', 'Baxter is playing with the monstar on the beach at New Zealand.', 9, 'baxter_playing.JPG', '', '', '', 0.00, 1, 0, 1),
(302, 1, 65, 4, 'Italia', 'Italia', 'forsale', '2018-08-25 16:57:51', 1535209071, 'Aus dem Buch \"Dream Journey - Ausmalreise um die Welt\".', 'Out of the book \"Dream Journey - Ausmalreise um die Welt\".', 6, 'italia4.jpg', '', '20x20cm (BxH)', '20x20cm (WxH)', 30.00, 1, 1, 1),
(303, 1, 64, 9, 'Nitro   Monstar', 'Nitro   Monstar', 'empty', '2018-09-14 16:26:04', 1536935164, 'Nitro mit Monstar im Dänemark Urlaub', 'Nitro and Monstar on a trip through Denmark.', 10, 'Monstar-Nitro.jpg', '', '', '', 0.00, 1, 0, 1),
(304, 1, 63, 9, 'W&uuml;sten Operation', 'Desert Operations', 'empty', '2018-09-14 16:35:29', 1536935729, 'Nein, nicht in der Wüste, sondern am Strand', 'No, not in desert, but on the beach.', 10, 'Monstar-Sandwirbel.jpg', '', '', '', 0.00, 1, 0, 1),
(305, 1, 62, 9, 'Monstar Schild', 'Monstar Traffic Sign', 'empty', '2018-09-14 19:52:39', 1536947559, 'Mein Monstar an nem Schild', 'My Monstar on a traffic sign', 10, 'Monstar-Schild.jpg', '', '', '', 0.00, 1, 0, 1),
(306, 1, 61, 9, 'Rettungsring', 'Lifebelt', 'empty', '2018-09-14 19:56:32', 1536947792, 'Rettungsring Monstar', 'Lifebelt Monstar', 10, 'Monstar-Rettungsring.jpg', '', '', '', 0.00, 1, 0, 1),
(307, 1, 60, 4, 'Waldschrat', 'Wood Gnome', 'sold', '2018-10-27 11:50:52', 1540633852, 'Ein Ausmalbild mit Acrylfarbe ausgemalt mit Lederbandaufhängung.  <br />\r\nVielen Dank an Sigi für die Hilfe & Geduld mit mir.  <br />\r\nAus dem Buch Mythomorphia von Kerby Rosanes.', 'A colored pic colored with acrylic Colors on leather straps.  <br />\r\nLot of thanks to Sigi, who helped me with a lot of things.  <br />\r\nOut of the book Mythomorphia from Kerby Rosanes.', 6, 'waldschrat_12.jpg', '', '29x29 cm', '29x29cm', 0.00, 1, 0, 1),
(308, 1, 59, 10, 'Wintersegeberg', 'Wintersegeberg', 'empty', '2019-01-25 17:06:24', 1548432384, 'Ein Bild aus dem verschneitem Bad Segeberg', 'An image from the snowily Bad Segeberg', 7, 'P1010666.JPG', '', '', '', 0.00, 1, 0, 1),
(309, 1, 58, 2, 'Anubis', 'Anubis', 'forsale', '2019-02-07 17:17:00', 1549556220, 'Eine Bild des &auml;gyptischen Gottes Anubis. Er ist in detaillierter, traditioneller R&uuml;stung mit farbenfrohen Mustern dargestellt.\r\n\r\nVielen Dank an Siggi.', 'An image of the Egyptian god Anubis. He is depicted in detailed, traditional armor with colourful patterns.\r\n\r\nMany thanks to Siggi.', 0, 'Anubis24.jpg', '', '60x60cm', '60x60cm', 280.00, 1, 0, 1),
(310, 1, 57, 10, 'Wasserball', 'Waterpolo', 'empty', '2019-03-16 09:44:40', 1552725880, 'Bild vom Wasserballspiel zwischen OSC Potsdam und SSV Esslingen.  <br />\nIch war live dabei als Potsdam Esslingen mit 18:7 besiegte.', 'Image of the Waterpolo game betwen OSC Potsdam & SSV Esslingen.  <br />\nI was live there when Potsdam beated Esslingen with 18:7.', 7, 'h2opolo.jpg', '', '', '', 0.00, 1, 0, 1),
(311, 1, 56, 5, 'Little Alfred', 'Little Alfred', 'empty', '2019-04-06 17:22:26', 1554564146, 'Mein erstes Wallpaper 2019.  <br />\nIm Hintergrund Klein Alfred  <br />\nJetzt in WQHD Auflösung', 'My first Wallpaper in 2019.  <br />\nIn the Background little Alfred.  <br />\nNow in WQHD Resolution', 0, 'little-alfred.jpg', '', '2560x1440 Pixel', '2560x1440 Pixel', 0.00, 1, 0, 1),
(312, 1, 55, 2, 'Bastet', 'Bastet', 'inwork', '2019-08-03 12:55:30', 1564829730, 'Eine Weitere Ägyptische Göttin hat sich in die Acryl Galerie geschlichen.  <br />\nDie ersten Vorarbeiten sind gemacht, ist aber noch im Pre-Alpha Modus.', 'Another Goddess has arrived the Acrylic Gallery.  <br />\nIt\'s just a Pre-Alpha Version of Bastet.', 0, 'bastet15.jpg', '', '50x90 cm', '50x90 cm', 380.00, 1, 0, 1),
(313, 1, 54, 2, 'Das Rangi Schweini', 'The Rangi Pig', 'givenaway', '2019-09-02 16:38:56', 1567435136, 'Anlässlich der Geburt meines Neffen Alfred, habe ich dieses Schweini Bild gemalt.  <br />\nThx to Fenja.', 'To celebrate the birth of my nephew i made this picture.  <br />\nThx to Fenja.', 0, 'schweini-finished.jpg', '', '29x20 cm', '29x20 cm', 0.00, 1, 0, 1),
(314, 1, 53, 5, 'Anubis Wallpaper', 'Anubis Wallpaper', 'empty', '2019-09-07 14:48:55', 1567860535, 'Eine kleine Collage mit Anubis', 'A small collage with Anubis', 0, 'anubus_wallpaper_png.png', '', '2560x1440 Pixel', '2560x1440 Pixel', 0.00, 1, 0, 1),
(315, 1, 52, 7, 'GRTZ FR NZ', 'GRTZ FR NZ', 'empty', '2020-01-31 00:00:00', 1580425200, 'Eine Postkarte die um die Welt ging....', 'A Postcard all over the world...', 0, 'GRTZ-NZ.jpg', '', '', '', 0.00, 1, 0, 1),
(316, 1, 51, 2, 'Rangi Goat', 'Rangi Goat', 'givenaway', '2020-01-10 00:00:00', 1578610800, 'Eine Ziege zu Alfies Geburtstag am 11.5.', 'A goat to Alfies Birthday at 11.5.', 0, 'goat04.jpg', '', '', '', 0.00, 1, 0, 1),
(317, 1, 50, 2, 'Tigah', 'Tigah', 'givenaway', '2020-02-16 09:54:00', 1581843240, 'Ein Tiger, wie man unscheinbar erkennen kann', 'A Tiger, as you can see', 7, 'tigah05.jpg', '', '', '', 80.00, 1, 1, 1),
(318, 1, 49, 7, 'Red Tiger', 'Red Tiger', 'empty', '2020-08-16 13:52:38', 1597578758, 'Ein neues Fineliner Artwork von 2020', 'A new fineliner artwork from 2020', 0, 'red-tiger.jpg', '', '', '', 0.00, 1, 0, 1),
(319, 1, 48, 7, 'Crop Drop', 'Crop Drop', 'empty', '2020-08-16 13:52:38', 1597578758, 'Mein neuestes Fineliner-Bild überhaupt', 'My newest fineliner pic at all', 0, 'crop-drop.jpg', '', '', '', 0.00, 1, 0, 1),
(321, 2, 46, 7, 'Bumble Bee', 'Bumble Bee', 'forsale', '2021-10-09 16:45:13', 1633790713, '', '', 11, 'Bumble-Bee.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(322, 2, 45, 7, 'Dialogue-II', 'Dialogue-II', 'empty', '2021-10-09 17:00:12', 1633791612, '', '', 11, 'Dialoge-II.jpg', '', '', '', 0.00, 1, 0, 1),
(323, 1, 44, 7, 'Ill-Easy', 'Ill-Easy', 'forsale', '2021-10-09 17:04:09', 1633791849, '', '', 11, 'Ill-Easy.jpg', '', '', '', 20.00, 1, 1, 1),
(324, 1, 43, 7, 'Lost World', 'Lost World', 'empty', '2021-10-09 17:07:56', 1633792076, '', '', 11, 'lost-world.jpg', '', '', '', 20.00, 1, 1, 1),
(325, 1, 42, 7, 'Notorious Small', 'Notorious Small', 'empty', '2021-10-09 17:12:29', 1633792349, '', '', 11, 'Notorius-Small.jpg', '', '', '', 0.00, 1, 0, 1),
(326, 1, 41, 7, 'Operated Bullseye', 'Operated Bullseye', 'empty', '2021-10-09 17:16:03', 1633792563, '', '', 11, 'Operated-Bullseye.jpg', '', '', '', 0.00, 1, 0, 1),
(327, 1, 40, 7, 'Selfaction', 'Selfaction', 'forsale', '2021-10-09 17:19:24', 1633792764, '', '', 11, 'Selfactions.jpg', '', '', '', 20.00, 1, 1, 1),
(328, 1, 39, 7, 'Trio Del', 'Trio Del', 'givenaway', '2021-10-09 17:24:16', 1633793056, '', '', 11, 'trio-del.jpg', '', '', '', 0.00, 1, 0, 1),
(329, 1, 38, 2, 'El Novum', 'EL Novum', 'sold', '2021-12-25 09:56:22', 1659105444, 'Neun schmale, vertikale Leinw&auml;nde mit Mustern in Orange, Rot und Schwarz. Die abstrakten, tribalartigen Muster bestehen aus geometrischen Formen, die sich &uuml;ber die einzelnen Leinw&auml;nde hinweg fortsetzen.', 'Nine narrow, vertical canvases with patterns in orange, red and black. The abstract, tribal-like patterns consist of geometric shapes that continue across the individual canvases.', 7, 'El_Novum_Finiished.jpg', '', '9x 80cm x 20cm', '9x 80cm x 20cm', 525.25, 1, 1, 1),
(333, 1, 35, 6, 'Alfies Traktor', 'Alfies Tractor', 'givenaway', '2022-03-16 10:19:05', 1692887867, 'P&uuml;nktlich zu Weihnachten habe ich meinem Neffen ein Geschenk gemacht.  \r\nDa er voll auf Tr&auml;cker steht habe ich dieses Bild auf Leinwand verewigt.  \r\n  \r\nEs ist mit Filzern gemalt.', 'Just in time for Christmas, I made a present for my nephew.  \r\nSince he is really loving Tractors, I immortalised this picture on canvas.  \r\n  \r\nIt is painted with felt-tip-pens.', 11, 'tractor_cut.jpg', '', '', '', 0.00, 1, 0, 1),
(330, 1, 37, 7, 'Cloud Founder', 'Cloud Founder', 'empty', '2021-12-26 08:20:58', 1640503258, 'Ein Geschenk an meine Lieblingscousine.', 'A gift to my favorite cousin.', 11, 'cloud-founder.jpg', '', '', '', 0.00, 1, 0, 1),
(335, 2, 34, 7, 'Jena Tower', 'Jena Tower', 'givenaway', '2022-03-28 15:51:09', 1648475469, 'Ein A4 Artwork in Grün.', 'An A4 artwork in green.', 11, 'jena tower.png', '', 'A4', 'A4', 0.00, 1, 0, 1),
(336, 2, 33, 7, 'Spring Break', 'Spring Break', 'empty', '2022-05-05 15:50:00', 1651758600, 'Frühjahr 2022 Artwork', 'Spring 2022 Artwork', 7, 'spring-break.jpg', '', 'A4', 'A4', 22.00, 1, 1, 1),
(337, 2, 32, 1, 'Dragonbird 3D', 'Dragonbird 3D', 'unsaleable', '2022-06-18 18:36:06', 1667572762, 'Mein erstes gedrucktes Relief mit meinem Renkforce Pro3.  <br />\nDer 3D-Drucker meines Vertrauens ermöglichte mir dieses Kunstwerk zu erschaffen.', 'My first printed relief with my Renkforce Pro3.  <br />\nThe 3D printer I trust enabled me to create this work of art.', 7, 'dragonbird 3D.jpg', '', '', '', 0.00, 1, 0, 1),
(338, 1, 31, 7, 'Lost Nature', 'Lost Nature', 'empty', '2022-08-21 12:04:39', 1661529942, 'Ein Geburtstagsgeschenk für Ianosaurus', 'The birthday present for Ianosaurus', 7, 'lost nature.jpg', '', '', '', 0.00, 1, 0, 1),
(339, 1, 30, 12, 'Goldfish 3DP', 'Goldfish 3DP', 'empty', '2022-10-07 14:04:48', 1672312012, 'Ein Tonkunstwerk mit 3D Drucker Hilfe gestanzt.', 'A piece of clay art punched with 3D printer help.', 0, 'goldfish-3DP.jpg', '', '15x15cm', '15x15cm', 12.00, 1, 1, 1),
(346, 1, 25, 1, 'Webmasters Delight 3D', 'Webmasters Delight 3D', 'empty', '2022-12-18 13:45:10', 1672327569, 'Ein weiteres PLA Objekt', 'Another PLA Object', 7, 'P1000159.JPG', '', '', '', 0.00, 1, 0, 1),
(347, 1, 24, 1, 'Caustic Treble 3D', 'Caustic Treble 3D', 'empty', '2023-01-11 16:46:04', 1673451790, 'Das Design ist echt cool, wie ein modernes Kunstwerk aus dem 3D-Drucker. Die Linien und Formen sind richtig spannend, fast futuristisch. In WeiÃŸ wirkt das Ganze total clean und einzigartig - ein echter Hingucker!', 'The design is really cool, like a modern work of art from a 3D printer. The lines and shapes are really exciting, almost futuristic. In white, the whole thing looks totally clean and unique - a real eye-catcher!', 7, 'caustic-treble 3D.jpg', '', '', '', 0.00, 1, 0, 1),
(341, 1, 29, 12, 'Gullivers Adventures 3DP', 'Gullivers Adventures 3DP', 'empty', '2022-11-04 15:19:13', 1667571482, 'Gullivers Abenteuer in Ton gepresst (Form aus dem 3D-Drucker)', 'Gulliver\\\'s Adventures pressed in clay (mould from the 3D printer)', 0, 'Gullivers-3DP_2.jpg', '', '', '', 25.00, 1, 1, 1),
(342, 1, 28, 1, 'Supersonic 3D', 'Supersonic 3D', 'empty', '2022-11-04 15:26:57', 1667571557, 'Ein Relief vom Bild Supersonic.  <br />\n1.58h hat es gedauert bis es fertig wurde mit Drucken.', 'A relief of the painting Supersonic.  <br />\nIt took 1.58h to finish printing.', 0, 'Supersonic 3D.jpg', '', '', '', 25.00, 1, 1, 1),
(343, 1, 27, 1, 'Gullivers Adventures 3D', 'Gullivers Adventures 3D', 'empty', '2022-11-04 15:29:18', 1668784195, 'Das Relief von Gullivers Adventures in weißem PLA gedruckt.', 'The relief of Gulliver\'s Adventures printed in white PLA.', 7, 'Gulliverse-Adventure-3D.jpg', '', '', '', 25.00, 1, 1, 1),
(344, 1, 26, 1, 'Goldfish 3D', 'Goldfish 3D', 'empty', '2022-11-04 15:31:29', 1667572162, 'Ein weiters Relief von dem Bild Goldfish.', 'Another relief from the picture Goldfish.', 7, 'goldfish-3D.jpg', '', '', '', 0.00, 1, 0, 1),
(348, 0, 23, 1, 'St. Pauli Print 3D', 'St. Pauli Print 3D', 'empty', '2023-01-11 16:49:47', 1693225354, 'Das Logo vom FC St. Pauli.', 'The FC St. Pauli logo.', 7, 'st-pauli.jpg', '', '', '', 0.00, 1, 0, 1),
(349, 2, 22, 7, 'Caustic Treble', 'Caustic Treble', 'empty', '2023-01-11 17:02:36', 1673452867, 'Ein kleines feines Fineliner Bild', 'A fine little fineliner picture', 7, 'caustic-treble.jpg', '', '', '', 0.00, 1, 0, 1),
(350, 0, 21, 12, 'HSV Raute', 'HSV Rhombus', 'empty', '2023-01-30 16:10:45', 0, 'Eine Kachel im HSV Design.', 'A tile with the HSV design.', 7, 'HSV.jpg', '', '', '', 0.00, 1, 0, 1),
(353, 0, 19, 12, 'Werder Bremen 3DP', 'Werder Bremen 3DP', 'empty', '2023-02-19 16:08:18', 1692886788, 'Ein Werder Bremen Logo aus Ton', 'A Werder Bremen logo made of clay', 7, 'Werder-Bremen-3DP.jpg', '', '', '', 0.00, 1, 0, 1),
(352, 0, 20, 1, 'Werder Bremen 3D', 'Werder Bremen 3D', 'empty', '2023-02-16 15:58:03', 0, 'Ein Werder Logo', 'A Werder Logo', 7, 'werder_bremen_new_3.jpg', '', '', '', 0.00, 1, 0, 1),
(354, 0, 18, 12, 'St. Pauli Ashtray 3DP', 'St. Pauli Ashtray 3DP', 'sold', '2023-02-19 16:10:37', 1692884760, 'Ein St. Pauli Aschenbecher.', 'A St. Pauli ashtray.', 7, 'st_pauli_glased.jpg', '', '', '', 18.00, 1, 1, 1),
(355, 1, 17, 7, 'Holy Ground', 'Holy Ground', 'empty', '2023-03-13 17:00:43', 0, 'Ein Fineliner Artwork von 2023', 'A Fineliner Artwork from 2023', 7, 'Holy Ground02.jpg', '', '', '', 0.00, 1, 0, 1),
(356, 1, 16, 7, 'Fine Pix', 'Fine Pix', 'lost', '2023-05-19 17:02:47', 1692884225, 'Leider wurde mir dieses Bild gestohlen. Wer sachdienliche Hinweise hat bitte bei [paul.rieser[at]marblefx.de](mailto:paul.rieser@marblefx.de) melden.', 'Unfortunately, this picture was stolen from me. If you have any relevant information, please contact [paul.rieser[at]marblefx.de](mailto:paul.rieser@marblefx.de).', 7, 'fine_pix.jpg', '', 'A5', 'A5', 20.00, 1, 1, 1),
(357, 0, 15, 12, 'HSV Ascher', 'HSV Ashtrey', 'sold', '2023-05-19 19:03:51', 1692884138, 'F&uuml;r meinen Fahrer der mich morgens schon seit 9 Jahren nach Segeberg f&auml;hrt.', 'For my driver who has been driving me to Segeberg in the morning for 9 years.', 7, 'HSV-Ashtray.jpg', '', '', '', 25.00, 1, 1, 1),
(358, 1, 14, 7, 'Kirbys Dream', 'Kirbys Dream', 'forsale', '2023-07-06 15:43:27', 1693747812, 'A4 Blatt vollgekritzelt', 'A4 sheet fully scribbled', 7, 'kirbys_dream_fin.jpg', '', 'A4', 'A4', 100.00, 1, 1, 1),
(359, 1, 13, 6, 'Winter Blues', 'Winter Blues', 'forsale', '2023-12-18 11:26:15', 0, 'Mal was mit Filzstift & Fineliner.', 'Something with felt-tip pen & fineliner.', 7, 'winter-blues.jpg', '', '', '', 58.00, 1, 1, 1),
(362, 0, 11, 12, 'Hertha BSC Ashtray 3DP', 'Hertha BSC Ashtray 3DP', 'givenaway', '2024-01-01 15:53:39', 0, 'F&uuml;r meinen Stiefbruder', 'For my Stepbrother', 7, 'hbsc.jpg', '', '', '', 0.00, 1, 0, 1),
(361, 0, 12, 12, 'Carl Zeiss Jena Ashtray 3DP', 'Carl Zeiss Jena Ashtray 3DP', 'givenaway', '2024-01-01 15:51:34', 0, 'F&uuml;r meinen Stiefvater', 'For my Stepfather', 7, 'czj.jpg', '', '', '', 0.00, 1, 0, 1),
(363, 0, 10, 2, 'Wonder Spring', 'Wonder Spring', 'forsale', '2024-02-04 17:29:32', 0, 'Eine abstraktes Kunstwerk in verschiedenen Grüntönen mit schwarzen, organischen Mustern.', 'An abstract work of art in various shades of green with black, organic patterns.', 7, 'wonder-spring.jpg', '', '60x60 cm', '60x60 cm', 180.00, 1, 1, 1),
(364, 0, 9, 12, 'Die Drei Ashtray 3DP', 'Die Drei Ashtray 3DP', 'empty', '2024-02-17 10:34:19', 0, 'Ein Die Drei Fragezeichen Ascher', 'A The Three Question Marks ashtray', 7, 'diedrei.jpg', '', '12x12cm', '12x12cm', 50.00, 1, 1, 1),
(365, 1, 8, 2, 'Gepard', 'Cheetah', 'givenaway', '2024-05-17 10:55:14', 0, 'Ein Gepardenkopf mit goldbraunem Fell und ausdrucksstarken blauen Augen. Der Hintergrund ist oben grün wie Vegetation, unten beige wie die Savanne. \n\nEs ist ein Geschenk für meinen Neffen.', 'A cheetah head with golden-brown fur and expressive blue eyes. The background is green like vegetation at the top and beige like the savannah at the bottom.\r\n\r\nIt is a gift for my nephew.', 11, 'gepard_cut.jpg', '', '', '', 0.00, 1, 0, 1),
(366, 1, 7, 11, 'Alfie No. 5', 'Alfie No. 5', 'givenaway', '2024-05-25 18:21:47', 0, 'Bleistiftzeichnung von meinem Neffen an seinem 5. Geburtstag', 'Pencil drawing of my nephew on his 5th birthday', 7, 'Alfie-No-5.jpg', '', 'A4', 'A4', 0.00, 1, 0, 1),
(367, 0, 6, 7, 'Cucumber Shot', 'Cucumber Shot', 'empty', '2003-04-04 00:00:00', 0, 'Fineliner artwork auf karierten Papier', 'Fineliner Artwork on checked paper.', 7, 'cucumber_shot.jpg', '', '', '', 0.00, 1, 0, 1),
(368, 1, 5, 7, 'Liked Hiker', 'Liked Hiker', 'empty', '2008-01-02 00:00:00', 0, 'Fineliner Artwork von 2008', 'Fineliner artwork from 2008', 7, 'liked-hiker.jpg', '', '', '', 20.00, 1, 1, 1),
(369, 1, 4, 7, 'Crazy Frog', 'Crazy Frog', 'empty', '2012-10-28 00:00:00', 0, 'Fineliner Artwork von 10/12', 'Fineliner artwork from 10/12', 7, 'crazy-frog.jpg', '', '', '', 18.00, 1, 1, 1),
(370, 2, 3, 7, 'Eval Eye', 'Eval Eye', 'forsale', '2012-10-08 00:00:00', 0, 'Fineliner image from 10/12', 'Fineliner Image from 10/12', 7, 'Eval-Eye.jpg', '', '', '', 20.00, 1, 1, 1),
(371, 1, 2, 7, 'Rattlesnake', 'Rattlesnake', 'forsale', '2012-09-19 00:00:00', 0, 'Die Klapperschlange', 'The rattlesnake', 7, 'Rattlesnake.jpg', '', '', '', 20.00, 1, 1, 1),
(372, 1, 1, 7, 'Family Affair', 'Family Affair', 'empty', '2012-05-28 00:00:00', 0, '2012er Fineliner Artwork', '2012 fineliner artwork', 7, 'Family-Affair.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(373, 1, 0, 7, 'Lotus Flower', 'Lotus Flower', 'forsale', '2012-06-18 00:00:00', 0, 'Fineliner Artwork von 06/12', 'Fineliner artwork from 06/12', 7, 'Lotus-Flower.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(374, 1, 0, 7, 'The Bridge', 'The Bridge', 'forsale', '2012-05-01 00:00:00', 0, 'Fineliner Artwork von 05/12', 'Fineliner artwork from 05/12', 7, 'the-bridge.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(375, 1, 0, 7, 'Lisas House', 'Lisas House', 'forsale', '2012-04-10 00:00:00', 0, 'Fineliner Artwork von 04/12', 'Fineliner artwork from 04/12', 7, 'lisas-house.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(376, 1, 0, 7, 'Knock Knock', 'Knock Knock', 'forsale', '2024-03-28 00:00:00', 0, '', '', 7, 'knock-knock.jpg', '', 'A4', 'A4', 18.00, 1, 1, 1),
(377, 1, 0, 7, 'Palm Wood', 'Palm Wood', 'forsale', '2024-05-28 20:12:40', 0, '', '', 7, 'palm-wood.jpg', '', 'A4', 'A4', 20.00, 1, 1, 1),
(378, 1, 0, 7, 'Lens Share', 'Lens Share', 'forsale', '2020-05-19 00:00:00', 0, '', '', 7, 'lens-share.jpg', '', 'A4', 'A4', 21.00, 1, 1, 1),
(379, 1, 0, 7, 'Robin Hood', 'Robin Hood', 'forsale', '2020-09-05 00:00:00', 0, '', '', 7, 'robin-hood.jpg', '', 'A4', 'A4', 19.00, 1, 1, 1),
(380, 1, 0, 7, 'Cool Misa', 'Cool Misa', 'sold', '2024-06-04 15:56:23', 0, 'Ein Fineliner Tryptichon', 'Ein Fineliner Tryptichon', 4, 'cool-misa.jpg', '', '3x A4', '3x A4', 50.00, 1, 0, 1),
(381, 1, 0, 10, 'Schwamm', 'Sponge', 'empty', '2024-06-15 11:49:39', 0, 'Ein Schwamm als Makroaufnahme', 'A sponge as a macro image', 7, 'P1000396.JPG', '', '', '', 0.00, 1, 0, 1),
(382, 1, 0, 10, 'Klavier', 'Piano', 'empty', '2024-06-15 11:53:44', 0, 'Rollen eines Fl&uuml;gels', 'Rolling of a sash', 7, 'P1000442.JPG', '', '', '', 0.00, 1, 0, 1),
(383, 1, 0, 12, 'Alfies Bowl', 'Alfies Bowl', 'givenaway', '2024-06-25 13:52:46', 0, 'Ein Geschenk an meinen Neffen', 'A present for my nephew', 10, 'alfies-bowl.jpg', '', '', '', 0.00, 1, 0, 1),
(384, 1, 0, 12, 'Fine Pix 3DP', 'Fine Pix 3DP', 'forsale', '2024-07-16 16:15:40', 0, 'Fine Pix in Ton', 'Fine Pix in clay', 7, 'fine-pix-3DP.jpg', '', '', '', 20.00, 1, 1, 1),
(385, 1, 0, 12, 'Caustic Treble 3DP', 'Caustic Treble 3DP', 'forsale', '2024-07-16 16:17:07', 0, 'Caustic Treble in Ton', 'Caustic Treble in clay', 7, 'caustic-treble-3DP.jpg', '', '', '', 20.00, 1, 1, 1),
(386, 1, 0, 12, 'Salamander Vogeltränke', 'Salamander bird bath', 'givenaway', '2024-10-24 16:36:26', 0, 'Mit Glas als Premiere in meinen getöpferten Objekten', 'With glass as a premiere in my pottery objects', 11, 'salamander2.jpg', '', '', '', 0.00, 1, 0, 1),
(418, 1, 0, 5, 'Cewl Cow 2k', 'Cewl Cow 2k', 'empty', '2024-11-03 12:09:13', 0, 'Habe mal wieder was wiedergefunden und hier veröffentlicht', 'I found something again and published it here.', 12, '90a266c4a58cfb26513209acfa7fbbb0.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(414, 1, 0, 1, 'Dragonbird', 'Dragonbird', 'forsale', '2022-10-03 17:24:16', 0, 'Mein erstes Relief mit dem 3D Drucker', 'My first relief with the 3D printer', 7, 'ac5a23c8ccda1cbe7bceb0c87e7dd7cf.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(420, 1, 0, 1, 'Dadelix 3D', 'Dadelix 3D', 'empty', '2024-11-30 15:30:11', 0, 'Dadelix in 3D', 'Dadelix in 3D', 7, 'b563d0d7465da227f6c16888e73617fd.png', NULL, NULL, NULL, NULL, 1, NULL, NULL),
(428, 1, 0, 2, 'Mixed Smasher', 'Mixed Smasher', 'forsale', '2024-12-14 09:37:18', 0, 'Mit Pouring Technik erstellt.', 'Created with pouring technique', 12, '6520a3194aaca3927409825d6b0d95b0.jpg', NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `images_categories`
--

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
-- Daten für Tabelle `images_categories`
--

INSERT INTO `images_categories` (`id`, `pub`, `position`, `name`, `name_en`, `shortname`, `heading_alt`, `heading_alt_en`, `img_icon`, `AscName`, `AscName_en`, `description`, `description_en`, `itemscope`, `date`, `chg_date`, `xis_shopable`) VALUES
(1, 1, 1, '3DDrucker', '3DPrinter', '3DPrinter', 'Frisch aus dem 3D Drucker', 'Fresh out of the 3D printer', '3dprinter.jpg', '3D Druck Bilder', '3D Print Images', 'Alles was man so mit einem 3D Drucker machen kann.', 'Everything you can do with a 3D printer.', 'Sculpture', 1641376316, 1673799343, 0),
(2, 1, 2, 'acryl', 'acrylic', 'acryl', 'Bilder mit Acrylfarbe auf Leinwand', 'Paintings with Acrylic Color on Canvas', 'acryl_new.jpg', 'Acryl Bilder', 'Acrylic Images', 'All diese Bilder sind mit Acrylfarbe entstanden. Meist skizziere ich alles mit Bleistift, male dann mit Permanent Maker die Linien nach und male dann das Bild mit Acryl Farbe aus. Man muss sich ganz schön konzentrieren das man sich nicht vermalt. Die Arbeitszeit ist je nach Größe unterschiedlich, da die Farbe teilweise erst trocknen muss.', 'All of theese pictures are painted with Acrylic-Color. I often just sketch everything with a pencil. After that i just follow the lines with a permanent marker and fill out everything with Acrylic-Color. Sometimes it\'s hard to conzentrate on the image but it works mostly. I need different time to Create theese Artworks because the color must dry first until it\'s finished.', 'Painting', 1480528142, 1480528142, 1),
(3, 1, 3, 'alphabet', 'alphabet', 'alphabet', 'Von A-Z - Eine Auswahl ausgew&auml;hlter Fotos', 'From A-Z - A selection of selected Photos', 'abc.jpg', 'Alphabetische Bilder', 'Alphabetic pictures', 'Ich suche nach Buchstaben in Photos, hier sind meine Schnappsch&uuml;sse dazu zu finden. Es ist ganz sch&ouml;n knifflig passende Bilder zu finden. Aber man findet hin und wieder mal was passendes...', 'I\\\'m just looking for letters in the nature. Here you can see my snapshots. It\\\'s sometime hard to find something, but in some cases you\\\'ll find some images.', 'Photograph', 1480532088, 1480532088, 0),
(4, 1, 4, 'ausgemaltes', 'colored', 'ausgemaltes', 'Ausgemalte Bilder von Asario', 'Colored Pictures from Asario', 'ausgemalt.jpg', 'Ausgemaltes', 'colored', 'Ausmalbilder für Erwachsene sind voll im kommen. Hier ein paar Werke die ich mit Fineliner bzw. Acrylfarbe ausgemalt habe. Das größte Problem sind die feinen Strukturen in den Vorlagen. Momentan arbeite ich aus 4 Büchern heraus nette Grafiken. Ich erwähne in der Beschreibung das Quellbuch der Bilder.', 'Paint-in Images for adults are up to date today. Here you can see some Artworks wich I coloured with fineliners ore acrylic colors. The biggest problem are the tiny Structures in the drafts. At the moment i just work out of 4 Books nice artworks. I mention the book in the Image Description.', 'Painting', 1481654227, 1481654227, 1),
(5, 1, 5, 'digital', 'digital', 'digital', 'Meine Wallpaper', 'My Wallpaper', 'digital.jpg', 'Digitale Kunstwerke', 'Digitale Artworks', 'Hier findet Ihr ein paar Wallpaper von mir. Wallpaper entstehen bei mir oft als Zufallobjekt beim Spielen mit Grafiken. Alle Wallpaper könnt ihr in Originalgröße runterladen. Einfach aufs Thumbnail rechtsklicken und \"Bild Speichern\" oder so ähnlich auswählen. Ich hoffe euch gefallen meine kleinen Experimente.', 'Here you can see some of my Wallpapers i made in the last years. Wallpapers are often a random Product by Playing with images. All Wallpapers are available in full size. Just right click on the thumbnail and choose something like \"save image at\". I hope you enjoy my experiments.', 'Painting', 1486147923, 1486147923, 0),
(6, 1, 6, 'fasermaler', 'Felt-Tip-Pen', 'fasermaler', 'Mit Filzstift auf Pappe und Papier oder Leinwand', 'With felt-tip pen on cardboard and paper or canvas', 'faser.jpg', 'Fasermaler Bilder', 'Felt Tip Images', 'Filzstift und Edding auf Karton / Pappe / Leinwand. Diese Bilder sind so Ähnlich wie Fineliner oder Acryl nur das sie auf Pappe bzw Papier oder Leinwand entstanden sind und nur mit Filzstift und Edding ausgemalt wurden. Die Bilder sind doppelt so groß wie Fineliner Pix und auch mit doppelt so dicken Stiften gemalt.', 'Felt-tip pen and Permanent Marker on cardboard / canvas. These pictures are similar to fineliners or acrylics, except that they are created on cardboard, paper or canvas and are only painted with a felt-tip pen and a Permanent Marker. The pictures are twice as big as Fineliner Pix and also painted with twice as thick pens.', 'Painting', 1481654720, 1481654720, 0),
(7, 1, 7, 'fineliner', 'fineliner', 'fineliner', 'Meine Fineliner Kunstwerke', 'my fineliner artworks', 'fineliner.jpg', 'Fineliner Galerie', 'Fineliner Gallery', 'Fineliner Artworks von mir. Das sind meine Fineliner Bilder von 2003-fx_year() Ja ich liebe meine Stabilo Fineliner ;)', 'My Fineliner Artworks. This are Artworks from 2003-fx_year() Yes I love my Stabilo Fineliners ;),', 'Painting', 1528568520, 1528568520, 1),
(8, 1, 8, 'lampen', 'lamps', 'lampen', 'Lampen aus Leinw&auml;nden...', 'Lamps from Canvases', 'lampen.png', 'Lampen aus bemalten Leinw&auml;nden', 'Lamps created with painted Canvases', 'Vor einiger Zeit hatte Chris aus dem Maleratelier die Idee zu einem Lichtobkjekt. Die Lampen bestehen zum Teil aus fertig montierten Prismen-Leinwänden sowie verschraubten planen Leinwänden. In den Prismen steckt eine Leuchtstoffröhre und in den Viereckigen eine normale Glühlampe. Die Lampen stehen zum größtem Teil in Rickling im Maleratelier wo auch einige meiner Acryl-Werke hängen. Schaut mal rein und schaut euch glücklich,', 'Some time ago Chris from the \"Maleratelier\" had the idea to a Light-Object. Some of the Lamps are made of mounted Prism Canvases others of screwed Canvases. In the Prism Canvas is a fluorescent tube installed. The Others are filled with a Light Bulb. Most of the lamps are shown in Ricklink in the \"Maleratelier\" where also some of my acrylic Images are shown. Have a look and enjoy.', 'Painting', 1486148939, 1486148939, 1),
(9, 1, 9, 'monstarz', 'monstarz', 'monstarz', 'Mein Monstar in der gro&szlig;en weiten Welt', 'My monstar in the big wide world', 'monstar.jpg', 'Mein Monstar', 'My Monstar', 'Ich habe vor Jahren ein Monstar-Kuscheltier bekommen, und habe es auf die Reise quer durch die Welt geschickt. Verwandte und Freunde haben das Tier in Szene gesetzt und Fotografiert. Mein Monster in der großen weiten Welt. Shots by Chinagirl, Baxter the dog, Nitropower, mir und Maria Zinckernagel Ich finde mein Monstar extrem Fotogen.', 'Some years ago i recieved a Monstar as a gift from my Sister. Sometimes Monstar is traveling around the world and some of my friends and family members shot photos with it. Monstar in the whole wide world. Shots by Chinagirl, Baxter the dog, Nitropower, Maria Zinckernagel and me I think my monstar has a lot of Sex-Appeal.', 'Photograph', 1486149018, 1486149018, 0),
(10, 1, 10, 'photos', 'photos', 'photos', 'Meine gemischten Photos', 'My mixed Photos', 'photos.jpg', 'Fotografien', 'Photographs', 'Fotos aufgenommen mit diversen Kameras an verschiedenen Orten. Ostsee, Berlin, Kreis Segeberg uvm,', 'Photos shooted with different Cameras on different places. Baltic Sea, Berlin, Kreis Segeberg etc.', 'Photograph', 1530277678, 1530277678, 0),
(11, 1, 11, 'sketches', 'sketches', 'sketches', 'Skizzen und Kritzeleien', 'Sketches and Scribbled ones', 'sketches.jpg', 'Sketches Galerie', 'Sketches Gallery', 'Skizzen und Entwürfe bzw. Konzeptzeichnungen sind hier. Hauptsächlich sind es Entwürfe die diese Galerie Prägen. Unter anderem sind es kleinere Zeichnungen die zwar fertig aber nicht Formatfüllend sind. Auch kleinere Experimente findet Ihr hier Versammelt unter dem Dach Sketches.', 'Sketches and schemes are in here. This gallery is characterized by schemes and drafts. Among others the pictures are very small but finished. Also smaller experiments you\'ll find here under the label Sketches.', 'Painting', 1486149265, 1486149265, 1),
(12, 1, 12, 'ton', 'pottered', 'ton', 'Get&ouml;pferte Dinge', 'Pottered things', 'clay.jpg', 'get&ouml;pfertes', 'pottered', 'Einige Werke sind in 3D. Ausgestellt sind getöpferte Kunstwerke von Asario. Alles ist von mir handgemacht, mit Hilfe meines 3D-Druckers', 'Some works are in 3D. On display are pottery works of art by Asario. Everything is handmade by me, with the help of my 3D printer', 'Sculpture', 1495980764, 1495980764, 1),
(13, 1, 13, 'zentangle', 'zentangle', 'zentangle', 'Meine Zentangle Galerie - Alles Handgetangelt', 'My Zentangle Gallery - All handtangelt', 'zia_icon.jpg', 'Zentangle&reg;', 'Zentangle&reg;', 'Meine ersten Versuche mit Zentangle Inspired Art. Zentangles sind eigentlich Zeichnungen im Format 9x9cm, sind sie größer heißen sie offiziell \"Zentangle Inspired Art\". Es gibt diverse Zentangle Bücher und Hefte in denen die verschiedenen Muster abgedruckt sind, Ich habe einige davon zu Papier gebracht und unter anderem Postkarten mit diesen Mustern bemalt. Zentangles sind zum entspannen gut und fördern die Kreativität.', 'My first attemps with Zentangle Inspired Art. Actually Zentangle are 9cmx9cm big. Bigger ore Smaller Artworks are called \"Zentangle Inspired Arrt\". Their are plenty of books about Zentangles where different Patterns are printed in them. I Just made some Postcards and other Artworks with the patterns. You can relax while painting and it supports Creativity.', 'Painting', 1486149343, 1486149343, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `migrations`
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
-- Tabellenstruktur für Tabelle `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personal_access_tokens`
--

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
-- Tabellenstruktur für Tabelle `posts`
--

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

--
-- Daten für Tabelle `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `author_name`, `author_id`, `image_path`, `published_at`, `created_at`, `updated_at`) VALUES
(1, 'sadasdads', 'asdsd', 'Asario', 2, NULL, NULL, NULL, 1723659066),
(2, 'ad2', 'asdsad', 'Asario', 2, NULL, NULL, NULL, 1723659217),
(3, '2131313131313131313131313', '111111111111111111111111111', 'Asario', 2, NULL, NULL, NULL, 1723795661),
(4, '22369871', '21323122312', 'Asario', 2, NULL, NULL, NULL, 1723927839),
(5, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303031),
(6, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303031),
(7, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303032),
(8, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303032),
(9, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303032),
(10, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303032),
(11, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303033),
(12, 'news213', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725303033),
(13, 'etst', 'test', 'Asario', 2, NULL, NULL, NULL, 1725303211),
(14, 'etst', 'test', 'Asario', 2, NULL, NULL, NULL, 1725303212),
(15, 'etst', 'test', 'Asario', 2, NULL, NULL, NULL, 1725303212),
(16, 'etst', 'test', 'Asario', 2, NULL, NULL, NULL, 1725303212),
(17, 'hallo wlet !', 'asda', 'Asario', 2, NULL, NULL, NULL, 1725303392),
(18, 'hallo wlet !', 'asda', 'Asario', 2, NULL, NULL, NULL, 1725303393),
(19, 'hallo wlet !', 'asda', 'Asario', 2, NULL, NULL, NULL, 1725303393),
(20, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303808),
(21, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303808),
(22, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303859),
(23, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303859),
(24, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303860),
(25, '11313', '132133', 'Asario', 2, NULL, NULL, NULL, 1725303860),
(26, 'etst ssdadtstasd', 'asdasdasd', 'Asario', 2, NULL, NULL, NULL, 1725304315),
(27, 'etst ssdadtstasd', 'asdasdasd', 'Asario', 2, NULL, NULL, NULL, 1725304316),
(28, 'etst ssdadtstasd', 'asdasdasd', 'Asario', 2, NULL, NULL, NULL, 1725304316),
(29, 'etst ssdadtstasd', 'asdasdasd', 'Asario', 2, NULL, NULL, NULL, 1725304317),
(30, 'adssssssssssssssssss', 'adddddddddddddd', 'Asario', 2, NULL, NULL, NULL, 1725304361),
(31, 'adssssssssssssssssss', 'adddddddddddddd', 'Asario', 2, NULL, NULL, NULL, 1725304361),
(32, 'adssssssssssssssssss', 'adddddddddddddd', 'Asario', 2, NULL, NULL, NULL, 1725304362),
(33, '21213123', '213132123', 'Asario', 2, NULL, NULL, NULL, 1725304393),
(34, '21213123', '213132123', 'Asario', 2, NULL, NULL, NULL, 1725304393),
(35, '21213123', '213132123', 'Asario', 2, NULL, NULL, NULL, 1725304458),
(36, '21213123', '213132123', 'Asario', 2, NULL, NULL, NULL, 1725304460),
(37, '21213123', '213132123', 'Asario', 2, NULL, NULL, NULL, 1725304522),
(38, 'fffr', 'ffffffffffr', 'Asario', 2, NULL, NULL, NULL, 1725304611),
(39, 'fffr', 'ffffffffffr', 'Asario', 2, NULL, NULL, NULL, 1725304611),
(40, 'fffr', 'ffffffffffr', 'Asario', 2, NULL, NULL, NULL, 1725304734),
(41, 'fffr', 'ffffffffffr', 'Asario', 2, NULL, NULL, NULL, 1725304734),
(42, 'fffr', 'ffffffffffr', 'Asario', 2, NULL, NULL, NULL, 1725304736),
(43, 'fffrtt', 'ffffffffffrttt', 'Asario', 2, NULL, NULL, NULL, 1725304776),
(44, 'fffrtt', 'ffffffffffrttt', 'Asario', 2, NULL, NULL, NULL, 1725304777),
(45, 'fffrtt', 'ffffffffffrttt', 'Asario', 2, NULL, NULL, NULL, 1725304777),
(46, 'fffrtt', 'ffffffffffrttt', 'Asario', 2, NULL, NULL, NULL, 1725304777),
(47, 'holllo', 'loipo', 'Asario', 2, NULL, NULL, NULL, 1725304799),
(48, 'holllo', 'loipo', 'Asario', 2, NULL, NULL, NULL, 1725304800),
(49, 'holllo', 'loipo', 'Asario', 2, NULL, NULL, NULL, 1725304800),
(50, 'holllo', 'loipo', 'Asario', 2, NULL, NULL, NULL, 1725304800),
(51, 'loosha', 'loschu', 'Asario', 2, NULL, NULL, NULL, 1725304970),
(52, 'loosha', 'loschu', 'Asario', 2, NULL, NULL, NULL, 1725304970),
(53, 'loosha', 'loschu', 'Asario', 2, NULL, NULL, NULL, 1725304971),
(54, 'usertest', 'asdasd', 'Asario', 2, NULL, NULL, NULL, 1725305224),
(55, 'hgu', 'ghu', 'Asario', 2, NULL, NULL, NULL, 1725305315),
(56, 'usertest223', 'asdadsdas', 'Asario', 2, NULL, NULL, NULL, 1725305466),
(57, 'asdsddddddddd', 'dddddddddddddddddddd', 'Asario', 2, NULL, NULL, NULL, 1725305521),
(58, 'fgtzu', 'ghtzu', 'Asario', 2, NULL, NULL, NULL, 1725305562),
(59, 'fdsdfsdf', 'fdfd', 'Asario', 2, NULL, NULL, NULL, 1725305588),
(60, 'new entry', 'asd', 'Asario', 2, NULL, NULL, NULL, 1725305628),
(61, 'operytion hinkelstein', 'hallo', 'Asario', 2, NULL, NULL, NULL, 1725306208);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ratings`
--

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
-- Daten für Tabelle `ratings`
--

INSERT INTO `ratings` (`id`, `users_id`, `image_id`, `table`, `rating`, `email`, `created_at`, `updated_at`) VALUES
(20, 2, 175, 'images', 4, NULL, '2016-06-01 00:00:00', NULL),
(21, 2, 186, 'images', 3, NULL, '2016-06-01 00:00:00', NULL),
(22, 2, 193, 'images', 2, NULL, '2016-06-01 00:00:00', NULL),
(23, 2, 185, 'images', 1, NULL, '2016-06-01 00:00:00', NULL),
(24, 2, 177, 'images', 1, NULL, '2016-06-01 00:00:00', NULL),
(25, 2, 174, 'images', 2, NULL, '2016-06-01 00:00:00', NULL),
(26, 2, 90, 'images', 2, NULL, '2016-07-20 00:00:00', NULL),
(27, 2, 88, 'images', 2, NULL, '2016-07-20 00:00:00', NULL),
(28, 2, 81, 'images', 5, NULL, '2016-07-20 00:00:00', NULL),
(29, 2, 10, 'images', 5, NULL, '2016-07-20 00:00:00', NULL),
(30, 2, 6, 'images', 4, NULL, '2016-07-27 00:00:00', NULL),
(31, 2, 62, 'images', 2, NULL, '2016-07-27 00:00:00', NULL),
(32, 2, 71, 'images', 2, NULL, '2016-07-27 00:00:00', NULL),
(33, 2, 82, 'images', 2, NULL, '2016-07-27 00:00:00', NULL),
(34, 2, 124, 'images', 2, NULL, '2016-07-27 00:00:00', NULL),
(35, 2, 126, 'images', 1, NULL, '2016-08-01 00:00:00', NULL),
(36, 2, 94, 'images', 1, NULL, '2016-08-01 00:00:00', NULL),
(37, 2, 127, 'images', 1, NULL, '2016-08-01 00:00:00', NULL),
(38, 2, 155, 'images', 4, NULL, '2016-08-01 00:00:00', NULL),
(39, 2, 153, 'images', 4, NULL, '2016-08-01 00:00:00', NULL),
(40, 2, 151, 'images', 5, NULL, '2016-08-01 00:00:00', NULL),
(41, 2, 150, 'images', 5, NULL, '2016-08-01 00:00:00', NULL),
(42, 2, 149, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(43, 2, 139, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(44, 2, 134, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(45, 2, 138, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(46, 2, 140, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(47, 2, 146, 'images', 1, NULL, '2016-09-01 00:00:00', NULL),
(48, 2, 148, 'images', 1, NULL, '2016-09-01 00:00:00', NULL),
(49, 2, 152, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(50, 2, 154, 'images', 1, NULL, '2016-09-01 00:00:00', NULL),
(51, 2, 161, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(52, 2, 160, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(53, 2, 163, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(54, 2, 164, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(55, 2, 165, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(56, 2, 166, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(57, 2, 179, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(58, 2, 167, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(59, 2, 187, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(60, 2, 188, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(61, 2, 189, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(62, 2, 192, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(63, 2, 83, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(64, 2, 18, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(65, 2, 15, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(66, 2, 16, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(67, 2, 17, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(68, 2, 133, 'images', 1, NULL, '2016-09-01 00:00:00', NULL),
(69, 2, 141, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(70, 2, 65, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(71, 2, 63, 'images', 2, NULL, '2016-09-01 00:00:00', NULL),
(72, 2, 198, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(73, 2, 199, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(74, 2, 206, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(75, 2, 204, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(76, 2, 203, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(77, 2, 207, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(78, 2, 205, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(79, 2, 200, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(80, 2, 194, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(81, 2, 218, 'images', 5, NULL, '2016-09-01 00:00:00', NULL),
(82, 2, 195, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(83, 2, 212, 'images', 3, NULL, '2016-09-01 00:00:00', NULL),
(84, 2, 221, 'images', 4, NULL, '2016-09-01 00:00:00', NULL),
(85, 2, 220, 'images', 4, NULL, '2017-03-01 00:00:00', NULL),
(86, 2, 196, 'images', 4, NULL, '2016-09-13 00:00:00', NULL),
(87, 2, 223, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(88, 2, 222, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(89, 2, 231, 'images', 3, NULL, '2016-09-13 00:00:00', NULL),
(90, 2, 158, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(91, 2, 159, 'images', 4, NULL, '2016-09-13 00:00:00', NULL),
(92, 2, 162, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(93, 2, 144, 'images', 3, NULL, '2016-09-13 00:00:00', NULL),
(94, 2, 191, 'images', 3, NULL, '2016-09-13 00:00:00', NULL),
(95, 2, 214, 'images', 3, NULL, '2016-09-13 00:00:00', NULL),
(96, 2, 210, 'images', 4, NULL, '2016-09-13 00:00:00', NULL),
(97, 2, 227, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(98, 2, 172, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(99, 2, 169, 'images', 5, NULL, '2016-09-13 00:00:00', NULL),
(100, 2, 184, 'images', 2, NULL, '2016-09-13 00:00:00', NULL),
(101, 2, 170, 'images', 2, NULL, '2016-09-13 00:00:00', NULL),
(102, 2, 178, 'images', 3, NULL, '2016-09-13 00:00:00', NULL),
(103, 2, 211, 'images', 2, NULL, '2016-09-13 00:00:00', NULL),
(104, 2, 209, 'images', 4, NULL, '2016-09-13 00:00:00', NULL),
(105, 2, 168, 'images', 4, NULL, '2017-03-01 00:00:00', NULL),
(106, 2, 183, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(107, 2, 202, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(108, 2, 171, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(109, 9, 144, 'images', 5, NULL, '2016-09-19 00:00:00', NULL),
(110, 9, 105, 'images', 5, NULL, '2016-09-19 00:00:00', NULL),
(111, 9, 200, 'images', 5, NULL, '2016-09-19 00:00:00', NULL),
(112, 2, 266, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(113, 2, 268, 'images', 3, NULL, '2016-09-19 00:00:00', NULL),
(114, 2, 246, 'images', 3, NULL, '2016-09-19 00:00:00', NULL),
(115, 2, 270, 'images', 5, NULL, '2016-09-19 00:00:00', NULL),
(116, 2, 272, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(117, 2, 244, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(118, 2, 261, 'images', 5, NULL, '2016-09-19 00:00:00', NULL),
(119, 2, 267, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(120, 2, 230, 'images', 3, NULL, '2016-09-19 00:00:00', NULL),
(121, 2, 271, 'images', 1, NULL, '2016-09-19 00:00:00', NULL),
(122, 2, 274, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(123, 2, 273, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(124, 2, 276, 'images', 4, NULL, '2016-09-19 00:00:00', NULL),
(125, 7, 257, 'images', 5, NULL, '2017-02-24 10:55:10', NULL),
(126, 7, 227, 'images', 5, NULL, '2017-02-24 10:55:10', NULL),
(127, 7, 246, 'images', 5, NULL, '2017-02-24 10:55:10', NULL),
(128, 7, 266, 'images', 5, NULL, '2017-02-24 10:55:10', NULL),
(129, 11, 262, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(130, 11, 197, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(131, 11, 89, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(132, 11, 273, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(133, 11, 183, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(134, 11, 227, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(135, 11, 169, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(136, 11, 141, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(137, 11, 249, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(138, 11, 30, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(139, 11, 43, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(140, 11, 44, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(141, 11, 98, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(142, 11, 49, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(143, 11, 47, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(144, 11, 46, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(145, 11, 48, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(146, 11, 50, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(147, 11, 51, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(148, 11, 53, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(149, 11, 54, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(150, 11, 97, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(151, 11, 107, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(152, 11, 111, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(153, 11, 129, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(154, 11, 122, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(155, 11, 108, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(156, 11, 106, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(157, 11, 200, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(158, 11, 271, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(159, 11, 230, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(160, 11, 214, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(161, 11, 191, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(162, 11, 162, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(163, 11, 159, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(164, 11, 158, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(165, 11, 144, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(166, 11, 194, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(167, 11, 193, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(168, 11, 186, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(169, 11, 185, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(170, 11, 177, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(171, 11, 175, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(172, 11, 174, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(173, 11, 207, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(174, 11, 206, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(175, 11, 205, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(176, 11, 204, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(177, 11, 203, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(178, 11, 199, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(179, 11, 198, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(180, 11, 126, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(181, 11, 124, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(182, 11, 88, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(183, 11, 71, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(184, 11, 6, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(185, 11, 222, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(186, 11, 220, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(187, 11, 221, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(188, 11, 212, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(189, 11, 195, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(190, 11, 161, 'images', 2, NULL, '2017-02-24 18:30:18', NULL),
(191, 11, 154, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(192, 11, 150, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(193, 11, 149, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(194, 11, 231, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(195, 11, 223, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(196, 11, 218, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(197, 11, 192, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(198, 11, 164, 'images', 4, NULL, '2017-02-24 18:30:18', NULL),
(199, 11, 163, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(200, 11, 268, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(201, 11, 266, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(202, 11, 246, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(203, 11, 168, 'images', 5, NULL, '2017-02-24 18:30:18', NULL),
(280, 11, 132, 'images', 3, NULL, '2017-02-24 18:30:18', NULL),
(281, 12, 49, 'images', 4, NULL, '2017-04-15 18:17:27', NULL),
(282, 9, 219, 'images', 5, NULL, '2017-04-20 18:16:11', NULL),
(283, 9, 278, 'images', 5, NULL, '2017-04-20 18:18:07', NULL),
(284, 9, 41, 'images', 5, NULL, '2017-04-20 18:19:53', NULL),
(285, 9, 259, 'images', 5, NULL, '2017-04-20 18:20:42', NULL),
(286, 9, 10, 'images', 5, NULL, '2017-04-20 18:21:19', NULL),
(287, 2, 129, 'images', 5, NULL, '2017-04-23 21:02:42', NULL),
(288, 2, 128, 'images', 4, NULL, '2017-04-23 21:02:55', NULL),
(289, 2, 122, 'images', 4, NULL, '2017-04-23 21:03:09', NULL),
(290, 2, 121, 'images', 3, NULL, '2017-04-23 21:03:37', NULL),
(291, 2, 113, 'images', 2, NULL, '2017-04-23 21:04:07', NULL),
(292, 2, 108, 'images', 2, NULL, '2017-04-23 21:04:18', NULL),
(293, 2, 106, 'images', 4, NULL, '2017-04-23 21:04:30', NULL),
(294, 2, 104, 'images', 2, NULL, '2017-04-23 21:04:48', NULL),
(295, 2, 232, 'images', 3, NULL, '2017-04-23 21:07:06', NULL),
(296, 2, 277, 'images', 4, NULL, '2017-04-23 21:07:39', NULL),
(297, 2, 219, 'images', 3, NULL, '2017-04-23 21:08:31', NULL),
(298, 2, 278, 'images', 3, NULL, '2017-04-23 21:08:54', NULL),
(299, 2, 262, 'images', 3, NULL, '2017-04-23 21:09:08', NULL),
(300, 2, 281, 'images', 4, NULL, '2017-06-14 20:34:59', NULL),
(301, 2, 280, 'images', 5, NULL, '2017-06-14 20:35:58', NULL),
(302, 2, 197, 'images', 4, NULL, '2017-06-14 20:37:02', NULL),
(303, 2, 190, 'images', 2, NULL, '2017-06-14 20:37:18', NULL),
(304, 2, 157, 'images', 1, NULL, '2017-06-14 20:37:30', NULL),
(305, 2, 147, 'images', 1, NULL, '2017-06-14 20:37:43', NULL),
(306, 2, 145, 'images', 3, NULL, '2017-06-14 20:37:53', NULL),
(307, 2, 143, 'images', 2, NULL, '2017-06-14 20:38:06', NULL),
(308, 2, 137, 'images', 1, NULL, '2017-06-14 20:38:15', NULL),
(309, 2, 132, 'images', 1, NULL, '2017-06-14 20:38:28', NULL),
(310, 2, 89, 'images', 3, NULL, '2017-06-14 20:38:49', NULL),
(311, 2, 256, 'images', 1, NULL, '2017-06-14 20:40:02', NULL),
(312, 2, 279, 'images', 4, NULL, '2017-06-14 20:40:28', NULL),
(313, 2, 257, 'images', 1, NULL, '2017-06-14 20:40:44', NULL),
(314, 2, 249, 'images', 1, NULL, '2017-06-14 20:40:58', NULL),
(315, 2, 33, 'images', 1, NULL, '2017-06-14 20:41:17', NULL),
(316, 2, 31, 'images', 1, NULL, '2017-06-14 20:41:26', NULL),
(317, 2, 30, 'images', 1, NULL, '2017-06-14 20:41:42', NULL),
(318, 2, 28, 'images', 1, NULL, '2017-06-14 20:41:52', NULL),
(319, 2, 25, 'images', 2, NULL, '2017-06-14 20:42:06', NULL),
(320, 2, 23, 'images', 1, NULL, '2017-06-14 20:42:16', NULL),
(321, 2, 22, 'images', 1, NULL, '2017-06-14 20:42:48', NULL),
(322, 2, 21, 'images', 1, NULL, '2017-06-14 20:43:00', NULL),
(323, 2, 44, 'images', 4, NULL, '2017-06-14 20:43:20', NULL),
(324, 2, 43, 'images', 2, NULL, '2017-06-14 20:43:40', NULL),
(325, 2, 42, 'images', 2, NULL, '2017-06-14 20:43:53', NULL),
(326, 2, 41, 'images', 4, NULL, '2017-06-14 20:44:04', NULL),
(327, 2, 39, 'images', 1, NULL, '2017-06-14 20:44:15', NULL),
(328, 2, 38, 'images', 3, NULL, '2017-06-14 20:44:25', NULL),
(329, 2, 37, 'images', 2, NULL, '2017-06-14 20:44:38', NULL),
(330, 2, 36, 'images', 3, NULL, '2017-06-14 20:44:51', NULL),
(331, 2, 111, 'images', 3, NULL, '2017-06-14 20:45:05', NULL),
(332, 2, 107, 'images', 3, NULL, '2017-06-14 20:45:14', NULL),
(333, 2, 98, 'images', 3, NULL, '2017-06-14 20:45:23', NULL),
(334, 2, 97, 'images', 3, NULL, '2017-06-14 20:45:31', NULL),
(335, 2, 54, 'images', 3, NULL, '2017-06-14 20:45:42', NULL),
(336, 2, 53, 'images', 3, NULL, '2017-06-14 20:45:50', NULL),
(337, 2, 51, 'images', 2, NULL, '2017-06-14 20:46:03', NULL),
(338, 2, 50, 'images', 3, NULL, '2017-06-14 20:46:13', NULL),
(339, 2, 49, 'images', 4, NULL, '2017-06-14 20:46:22', NULL),
(340, 2, 48, 'images', 3, NULL, '2017-06-14 20:46:32', NULL),
(341, 2, 46, 'images', 2, NULL, '2017-06-14 20:46:41', NULL),
(342, 2, 136, 'images', 4, NULL, '2017-06-14 20:47:00', NULL),
(343, 2, 130, 'images', 1, NULL, '2017-06-14 20:47:12', NULL),
(344, 2, 85, 'images', 2, NULL, '2017-06-14 20:47:21', NULL),
(345, 2, 84, 'images', 3, NULL, '2017-06-14 20:47:32', NULL),
(346, 2, 80, 'images', 2, NULL, '2017-06-14 20:47:43', NULL),
(347, 2, 78, 'images', 2, NULL, '2017-06-14 20:47:54', NULL),
(348, 2, 77, 'images', 3, NULL, '2017-06-14 20:48:06', NULL),
(349, 2, 76, 'images', 1, NULL, '2017-06-14 20:48:15', NULL),
(350, 2, 75, 'images', 1, NULL, '2017-06-14 20:48:23', NULL),
(351, 2, 74, 'images', 1, NULL, '2017-06-14 20:48:30', NULL),
(352, 2, 73, 'images', 1, NULL, '2017-06-14 20:48:38', NULL),
(353, 2, 102, 'images', 1, NULL, '2017-06-14 20:49:00', NULL),
(354, 2, 101, 'images', 1, NULL, '2017-06-14 20:49:08', NULL),
(355, 2, 100, 'images', 3, NULL, '2017-06-14 20:49:17', NULL),
(356, 2, 99, 'images', 1, NULL, '2017-06-14 20:49:26', NULL),
(357, 2, 217, 'images', 3, NULL, '2017-06-14 20:49:47', NULL),
(358, 2, 216, 'images', 1, NULL, '2017-06-14 20:49:59', NULL),
(359, 2, 215, 'images', 2, NULL, '2017-06-14 20:50:11', NULL),
(360, 2, 213, 'images', 2, NULL, '2017-06-14 20:50:22', NULL),
(361, 2, 135, 'images', 3, NULL, '2017-06-14 20:50:39', NULL),
(362, 2, 105, 'images', 1, NULL, '2017-06-14 20:50:47', NULL),
(363, 2, 103, 'images', 1, NULL, '2017-06-14 20:50:58', NULL),
(364, 2, 95, 'images', 2, NULL, '2017-06-14 20:51:09', NULL),
(365, 2, 87, 'images', 1, NULL, '2017-06-14 20:51:17', NULL),
(366, 2, 275, 'images', 1, NULL, '2017-06-14 20:51:41', NULL),
(367, 2, 259, 'images', 1, NULL, '2017-06-14 20:51:53', NULL),
(368, 2, 258, 'images', 1, NULL, '2017-06-14 20:52:09', NULL),
(369, 2, 243, 'images', 1, NULL, '2017-06-14 20:52:23', NULL),
(370, 2, 229, 'images', 3, NULL, '2017-06-14 20:52:37', NULL),
(371, 2, 228, 'images', 2, NULL, '2017-06-14 20:52:50', NULL),
(372, 2, 226, 'images', 1, NULL, '2017-06-14 20:53:02', NULL),
(373, 2, 224, 'images', 1, NULL, '2017-06-14 20:53:16', NULL),
(374, 2, 225, 'images', 1, NULL, '2017-06-14 20:53:30', NULL),
(375, 2, 142, 'images', 3, NULL, '2017-06-14 20:55:00', NULL),
(376, 2, 123, 'images', 1, NULL, '2017-06-14 20:55:15', NULL),
(377, 2, 119, 'images', 3, NULL, '2017-06-14 20:55:29', NULL),
(378, 2, 118, 'images', 4, NULL, '2017-06-14 20:55:39', NULL),
(379, 2, 117, 'images', 1, NULL, '2017-06-14 20:55:58', NULL),
(380, 2, 116, 'images', 1, NULL, '2017-06-14 20:56:10', NULL),
(381, 2, 115, 'images', 2, NULL, '2017-06-14 20:56:23', NULL),
(382, 2, 114, 'images', 1, NULL, '2017-06-14 20:56:37', NULL),
(383, 2, 112, 'images', 2, NULL, '2017-06-14 20:56:51', NULL),
(384, 2, 110, 'images', 3, NULL, '2017-06-14 20:57:07', NULL),
(385, 2, 109, 'images', 1, NULL, '2017-06-14 20:57:19', NULL),
(386, 2, 255, 'images', 1, NULL, '2017-06-14 20:57:52', NULL),
(387, 2, 254, 'images', 1, NULL, '2017-06-14 20:58:04', NULL),
(388, 2, 253, 'images', 2, NULL, '2017-06-14 20:58:17', NULL),
(389, 2, 252, 'images', 1, NULL, '2017-06-14 20:58:27', NULL),
(390, 2, 251, 'images', 1, NULL, '2017-06-14 20:58:40', NULL),
(391, 2, 248, 'images', 1, NULL, '2017-06-14 20:59:03', NULL),
(392, 2, 247, 'images', 1, NULL, '2017-06-14 20:59:10', NULL),
(393, 2, 245, 'images', 1, NULL, '2017-06-14 20:59:20', NULL),
(394, 2, 288, 'images', 5, NULL, '2018-01-28 18:45:22', NULL),
(395, 2, 289, 'images', 4, NULL, '2018-01-28 18:46:09', NULL),
(396, 2, 287, 'images', 5, NULL, '2018-01-28 18:46:20', NULL),
(397, 2, 284, 'images', 5, NULL, '2018-01-28 18:46:41', NULL),
(398, 2, 290, 'images', 4, NULL, '2018-01-28 18:47:21', NULL),
(399, 2, 294, 'images', 4, NULL, '2018-04-15 16:53:20', NULL),
(400, 5, 295, 'images', 3, NULL, '2018-04-29 02:42:29', NULL),
(401, 5, 219, 'images', 4, NULL, '2018-04-29 02:42:58', NULL),
(402, 2, 293, 'images', 4, NULL, '2018-05-06 18:18:42', NULL),
(403, 2, 291, 'images', 3, NULL, '2018-05-06 18:19:04', NULL),
(404, 2, 292, 'images', 5, NULL, '2018-05-06 18:19:22', NULL),
(405, 2, 295, 'images', 3, NULL, '2018-06-03 17:54:01', NULL),
(406, 15, 297, 'images', 5, NULL, '2018-08-25 21:33:15', NULL),
(407, 2, 300, 'images', 3, NULL, '2018-08-26 18:03:49', NULL),
(408, 2, 283, 'images', 3, NULL, '2018-08-26 18:06:57', NULL),
(409, 2, 298, 'images', 4, NULL, '2018-08-26 18:10:37', NULL),
(410, 9, 280, 'images', 5, NULL, '2018-08-26 20:28:43', NULL),
(411, 15, 290, 'images', 5, NULL, '2018-08-27 07:19:12', NULL),
(412, 15, 299, 'images', 5, NULL, '2018-08-27 07:21:33', NULL),
(414, 2, 306, 'images', 5, NULL, '2018-09-16 19:15:04', NULL),
(415, 2, 305, 'images', 5, NULL, '2018-09-16 19:15:18', NULL),
(416, 2, 304, 'images', 5, NULL, '2018-09-16 19:15:30', NULL),
(417, 2, 303, 'images', 5, NULL, '2018-09-16 19:15:45', NULL),
(418, 8, 297, 'images', 5, NULL, '2018-09-21 16:01:24', NULL),
(419, 8, 147, 'images', 5, NULL, '2018-09-21 16:03:05', NULL),
(420, 8, 143, 'images', 5, NULL, '2018-09-21 16:03:31', NULL),
(421, 8, 145, 'images', 5, NULL, '2018-09-21 16:04:01', NULL),
(422, 8, 132, 'images', 5, NULL, '2018-09-21 16:04:17', NULL),
(423, 2, 302, 'images', 5, NULL, '2018-10-14 18:48:18', NULL),
(424, 2, 308, 'images', 4, NULL, '2019-01-27 19:57:39', NULL),
(425, 2, 307, 'images', 5, NULL, '2019-01-27 19:58:12', NULL),
(426, 2, 310, 'images', 3, NULL, '2019-06-02 17:02:21', NULL),
(427, 2, 286, 'images', 3, NULL, '2019-06-02 17:03:46', NULL),
(428, 2, 311, 'images', 3, NULL, '2019-06-02 17:04:31', NULL),
(429, 2, 313, 'images', 5, NULL, '2019-09-08 20:01:47', NULL),
(430, 2, 309, 'images', 4, NULL, '2019-09-08 20:05:12', NULL),
(431, 2, 315, 'images', 5, NULL, '2020-09-26 21:57:37', NULL),
(432, 2, 318, 'images', 2, NULL, '2020-09-26 21:58:05', NULL),
(433, 2, 319, 'images', 2, NULL, '2020-09-26 21:58:20', NULL),
(434, 2, 316, 'images', 4, NULL, '2020-11-18 20:42:49', NULL),
(435, 18, 317, 'images', 5, NULL, '2021-07-21 15:18:30', NULL),
(436, 18, 258, 'images', 4, NULL, '2021-07-21 15:24:08', NULL),
(437, 18, 226, 'images', 4, NULL, '2021-07-21 15:24:36', NULL),
(438, 18, 224, 'images', 3, NULL, '2021-07-21 15:25:24', NULL),
(439, 18, 225, 'images', 5, NULL, '2021-07-21 15:26:21', NULL),
(440, 18, 216, 'images', 2, NULL, '2021-07-21 15:27:01', NULL),
(441, 18, 136, 'images', 5, NULL, '2021-07-21 15:27:43', NULL),
(442, 18, 319, 'images', 5, NULL, '2021-07-21 15:29:28', NULL),
(443, 18, 256, 'images', 4, NULL, '2021-07-23 09:05:06', NULL),
(444, 18, 249, 'images', 3, NULL, '2021-07-23 09:05:28', NULL),
(445, 18, 279, 'images', 5, NULL, '2021-07-23 09:05:44', NULL),
(446, 18, 257, 'images', 2, NULL, '2021-07-23 09:06:03', NULL),
(447, 18, 170, 'images', 4, NULL, '2021-08-02 16:47:40', NULL),
(448, 18, 227, 'images', 3, NULL, '2021-08-02 16:48:06', NULL),
(449, 18, 211, 'images', 3, NULL, '2021-08-02 16:48:25', NULL),
(450, 18, 168, 'images', 5, NULL, '2021-08-02 16:48:46', NULL),
(451, 18, 183, 'images', 2, NULL, '2021-08-02 16:49:17', NULL),
(452, 18, 171, 'images', 5, NULL, '2021-08-02 16:49:43', NULL),
(453, 18, 184, 'images', 3, NULL, '2021-08-02 17:12:32', NULL),
(454, 18, 314, 'images', 5, NULL, '2021-08-03 19:33:39', NULL),
(455, 18, 311, 'images', 3, NULL, '2021-08-03 19:34:04', NULL),
(456, 18, 261, 'images', 4, NULL, '2021-08-03 19:34:46', NULL),
(457, 18, 232, 'images', 5, NULL, '2021-08-03 19:35:13', NULL),
(458, 18, 65, 'images', 4, NULL, '2021-08-03 19:35:42', NULL),
(459, 18, 63, 'images', 4, NULL, '2021-08-03 19:36:21', NULL),
(460, 18, 17, 'images', 5, NULL, '2021-08-03 19:37:30', NULL),
(461, 2, 321, 'images', 1, NULL, '2021-11-02 20:08:44', NULL),
(462, 2, 322, 'images', 1, NULL, '2021-11-02 20:09:15', NULL),
(463, 2, 323, 'images', 2, NULL, '2021-11-02 20:09:40', NULL),
(464, 2, 324, 'images', 1, NULL, '2021-11-02 20:11:16', NULL),
(465, 2, 329, 'images', 5, NULL, '1970-01-01 01:00:00', NULL),
(466, 2, 325, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(467, 2, 326, 'images', 2, NULL, '1970-01-01 01:00:00', NULL),
(468, 2, 327, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(469, 2, 328, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(470, 2, 330, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(471, 18, 321, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(473, 2, 352, 'images', 2, NULL, '1970-01-01 01:00:00', NULL),
(474, 2, 348, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(475, 2, 347, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(476, 2, 346, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(477, 2, 344, 'images', 2, NULL, '1970-01-01 01:00:00', NULL),
(478, 2, 343, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(479, 2, 342, 'images', 2, NULL, '1970-01-01 01:00:00', NULL),
(480, 2, 337, 'images', 2, NULL, '1970-01-01 01:00:00', NULL),
(481, 2, 349, 'images', 3, NULL, '1970-01-01 01:00:00', NULL),
(482, 2, 338, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(483, 2, 336, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(484, 2, 335, 'images', 1, NULL, '1970-01-01 01:00:00', NULL),
(485, 21, 348, 'images', 5, NULL, '2023-06-06 10:55:11', NULL),
(486, 21, 343, 'images', 4, NULL, '2023-06-06 10:54:33', NULL),
(487, 21, 337, 'images', 4, NULL, '2023-06-06 10:53:49', NULL),
(488, 21, 352, 'images', 5, NULL, '2023-06-06 10:53:06', NULL),
(489, 21, 329, 'images', 5, NULL, '2023-06-06 10:52:27', NULL),
(490, 21, 316, 'images', 5, NULL, '2023-06-06 10:51:46', NULL),
(491, 21, 262, 'images', 5, NULL, '2023-06-06 10:51:18', NULL),
(492, 21, 147, 'images', 5, NULL, '2023-06-06 10:50:33', NULL),
(493, 21, 277, 'images', 5, NULL, '2023-06-06 10:50:07', NULL),
(494, 21, 272, 'images', 4, NULL, '2023-06-06 10:49:34', NULL),
(495, 21, 311, 'images', 5, NULL, '2023-06-06 10:49:04', NULL),
(496, 21, 133, 'images', 5, NULL, '2023-06-06 10:48:29', NULL),
(497, 21, 15, 'images', 4, NULL, '2023-06-06 10:48:01', NULL),
(498, 21, 333, 'images', 5, NULL, '2023-06-06 10:47:25', NULL),
(499, 21, 257, 'images', 5, NULL, '2023-06-06 10:46:39', NULL),
(500, 21, 355, 'images', 5, NULL, '2023-06-06 10:45:55', NULL),
(501, 21, 349, 'images', 5, NULL, '2023-06-06 10:45:27', NULL),
(502, 21, 336, 'images', 5, NULL, '2023-06-06 10:44:41', NULL),
(503, 21, 326, 'images', 5, NULL, '2023-06-06 10:44:11', NULL),
(504, 21, 322, 'images', 5, NULL, '2023-06-06 10:43:30', NULL),
(505, 21, 228, 'images', 5, NULL, '2023-06-06 10:42:43', NULL),
(506, 21, 224, 'images', 5, NULL, '2023-06-06 10:42:15', NULL),
(507, 21, 271, 'images', 5, NULL, '2023-06-06 10:41:30', NULL),
(508, 21, 300, 'images', 5, NULL, '2023-06-06 10:40:42', NULL),
(509, 21, 289, 'images', 5, NULL, '2023-06-06 10:40:03', NULL),
(510, 21, 207, 'images', 5, NULL, '2016-06-01 00:50:00', NULL),
(511, 21, 177, 'images', 5, NULL, '2016-06-01 01:40:00', NULL),
(512, 21, 308, 'images', 5, NULL, '2023-06-06 10:39:15', NULL),
(513, 21, 298, 'images', 5, NULL, '2023-06-06 10:38:41', NULL),
(514, 21, 293, 'images', 5, NULL, '2023-06-06 10:38:05', NULL),
(515, 21, 291, 'images', 5, NULL, '2023-06-06 10:37:28', NULL),
(516, 21, 142, 'images', 5, NULL, '2023-06-06 10:36:38', NULL),
(517, 21, 123, 'images', 5, NULL, '2023-06-06 10:36:13', NULL),
(518, 21, 119, 'images', 5, NULL, '2023-06-06 10:35:32', NULL),
(519, 21, 117, 'images', 4, NULL, '2023-06-06 10:34:59', NULL),
(520, 21, 114, 'images', 5, NULL, '2023-06-06 10:34:13', NULL),
(521, 21, 112, 'images', 4, NULL, '2023-06-06 10:33:40', NULL),
(522, 21, 109, 'images', 4, NULL, '2023-06-06 10:33:02', NULL),
(523, 21, 354, 'images', 4, NULL, '2023-06-06 10:32:21', NULL),
(524, 21, 353, 'images', 4, NULL, '2023-06-06 10:31:50', NULL),
(525, 21, 350, 'images', 5, NULL, '2023-06-06 10:31:06', NULL),
(526, 21, 341, 'images', 5, NULL, '2023-06-06 10:30:33', NULL),
(527, 21, 339, 'images', 5, NULL, '2023-06-06 10:30:04', NULL),
(528, 21, 286, 'images', 5, NULL, '2023-06-06 10:29:25', NULL),
(529, 21, 281, 'images', 5, NULL, '2023-06-06 10:28:40', NULL),
(530, 21, 254, 'images', 5, NULL, '2023-06-06 10:27:54', NULL),
(531, 21, 253, 'images', 4, NULL, '2023-06-06 10:27:22', NULL),
(532, 21, 252, 'images', 4, NULL, '2023-06-06 10:26:56', NULL),
(533, 21, 250, 'images', 5, NULL, '2023-06-06 10:26:23', NULL),
(534, 21, 344, 'images', 5, NULL, '2023-06-06 10:25:53', NULL),
(538, 2, 182, 'blog_posts', 4, NULL, '2024-11-30 10:35:40', '2024-11-30 10:39:14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('WXLyeC9y0EQr4dJJTYCMQNCakAFLhGcOZQNfqX6I', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicnZyZ1Bjb2M2RnV2anV5MEs3dHNGS2lmcjVOR1BMaWxOb2dIV25VNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MS9hZG1pbi90YWJsZXMvZWRpdC85MC9hZG1pbl90YWJsZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo1OiJ0b2FzdCI7YTowOnt9fQ==', 1741189386);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) NOT NULL,
  `pub` tinyint(1) DEFAULT 1,
  `position` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `modul` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `tables`
--

INSERT INTO `tables` (`id`, `pub`, `position`, `table_name`, `description`, `modul`, `created_at`, `published_at`, `updated_at`) VALUES
(2, 1, 1, 'blog_posts', 'Blog Posts', 'TesTModul', '2024-10-08 15:56:56', '1970-01-01 01:00:00', '2024-09-07 14:22:47'),
(15, 1, 11, 'users', 'Benutzer', NULL, '2024-10-02 10:00:00', '1970-01-01 01:00:00', '2024-09-07 14:22:47'),
(18, 1, 12, 'users_rights', 'Benutzerrechte', 'UserRights', NULL, '1970-01-01 01:00:00', '2024-09-07 14:22:47'),
(19, 1, 8, 'didyouknow', 'Wussten Sie Schon....?', NULL, '2024-09-10 19:14:30', '1970-01-01 01:00:00', '2024-09-07 14:22:47'),
(30, 1, 0, 'admin_table', 'This Table', NULL, '2024-09-02 16:12:28', '1970-01-01 01:00:00', '2024-09-12 18:56:54'),
(37, 1, 9, 'privacy', 'Datenschutzerklärung', NULL, '2024-09-02 08:23:38', '2024-09-29 14:14:14', '2024-09-29 14:14:14'),
(78, 1, 5, 'texts', 'Texte für alle möglichen Seiten', NULL, '2024-10-19 15:51:03', '2024-10-19 15:51:03', '2024-10-19 15:51:03'),
(87, 1, 10, 'shortpoems', 'Kurzgeschichten', NULL, '2024-10-30 10:20:17', '2024-10-30 10:20:17', '2024-10-30 10:20:17'),
(90, 1, 6, 'images_cat', 'Bildergruppen', NULL, '2024-10-30 14:34:14', '2024-10-30 14:34:14', '2024-10-30 14:34:14'),
(93, 1, 3, 'images', 'Bilder', NULL, '2024-10-30 14:34:48', '2024-10-30 14:34:48', '2024-10-30 14:34:48'),
(96, 1, 4, 'comments', 'Kommentare', NULL, '2024-11-25 15:45:44', '2024-11-25 15:45:44', '2024-11-25 15:45:44'),
(99, 1, 7, 'camera', 'Kameras', NULL, '2024-12-03 16:31:25', '2024-12-03 16:31:25', '2024-12-03 16:31:25'),
(102, 1, 2, 'blog_categories', 'Kategorien der Blogeinträge', NULL, '2024-12-14 16:56:15', '2024-12-14 16:56:15', '2024-12-14 16:56:15');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `testfield`
--

CREATE TABLE `testfield` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_categories_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `blog_authors_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `blog_date` datetime DEFAULT NULL,
  `markdown_on` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `testfield`
--

INSERT INTO `testfield` (`id`, `blog_categories_id`, `blog_authors_id`, `title`, `content`, `blog_date`, `markdown_on`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'MCS 1.57 Released', 'Marble Content System Version 1.57 (Crazy Joana)  \r\nwurde ver&ouml;ffentlicht und auf der Lowmaxx Seite zu testzwecken installiert.  \r\n  \r\nDieses Release ist das erste offizielle Release und hat mich viel Zeit gekostet.  \r\nViele Features wurden hinzugef&uuml;gt einiges neuprogrammiert und verbessert.  \r\n  \r\nEine umfangreiche Dokumentation ist jetzt auch dabei und einige Features vereinfachen die Arbeit mit MCS erheblich.  \r\n  \r\ngenauere Infos siehe Link.', '2006-09-20 20:18:00', 1, '2006-09-20 18:18:00', '2006-09-20 18:18:00'),
(2, 1, 1, 'Wir Feiern Wir Feiern', 'Heute ist der Grosse Tag der Tag der erÃ¶ffnung von **asario.marblefx.de**, meinem PersÃ¶nlichen Blog.  \nMit allem was von mir ist oder mit mir zu tun hat.', '2006-09-21 21:00:00', 1, '2006-09-21 19:00:00', '2006-09-21 19:00:00'),
(3, 2, 1, 'MCS 1.58 angefangen', 'Wie bei jeder neuen Version fallen Fehler auf.  \r\nSo auch bei dieser Version.  \r\nNun Ideen sind auch neue dazugekommen und ich denke mir f&auml;llt auch noch was ein.  \r\n  \r\n**Todolist:**\r\n[Hier](index.php?page=infos&action=details&id=24)\r\n\r\n**Buglist:**\r\n<ul>\r\n <li>\r\n     Beim Hochladen von Dateien kann es bei Doppelklick zu Fehlern kommen. <blockquote>\r\n       Edit: lag am FILE SIZE Limit\r\n    </blockquote>\r\n</li>\r\n <li>\r\n     Date funktion Funktioniert manchmal nicht, d.h. Datum wird nicht eingestellt obwohl es eine Datumsspalte gibt. <blockquote>\r\n       Edit:Bug gefunden lag am mangelndem Update in der Preview Funktion\r\n    </blockquote>\r\n  </li>\r\n</ul>', '2006-09-27 23:28:00', 1, '2006-09-27 21:28:00', '2006-09-27 21:28:00'),
(4, 1, 1, 'Neue Fineliner Galerie', 'Unter [Images->Fineliner3](index.php?page=images&action=fineliner3) sind neue Bilder gesichtet worden ...  \nhave a look ;)', '2007-06-04 19:32:00', 1, '2007-06-04 17:32:00', '2007-06-04 17:32:00'),
(5, 2, 1, 'MCS 1.59 workin', 'Wir sind am Arbeiten was MCS 1.59 angeht.  \neine Komplette Hilfe, neue Administration und ein paar Gimmicks wie  \nPrivate Messages kommen alle noch in dieses Release mit rein  \n  \nfieser Bug in der Welcome gefunden und gelöst', '2008-01-07 23:16:00', 1, '2008-01-07 22:16:00', '2008-01-07 22:16:00'),
(6, 3, 1, 'PalivaRedesign', 'Schon wieder ne durchzechte Nacht wegen ner Website,  \nis irgendwie fast wie ne Sucht, die ganze Zeit zu Programmieren während andere Schlummern.  \naber es hat einen Vorteil, wenn andere Wach werden sehen sie Resultate  \nund das über Nacht.  \n  \nUnd wann kommt endlich mein c\'T Abo an ?', '2008-01-14 11:02:00', 1, '2008-01-14 10:02:00', '2008-01-14 10:02:00'),
(7, 3, 1, 'Weiteres Projekt bei mederius', 'Nun solls ne Zeitung werden  \nlayout 1 steht', '2008-01-15 10:48:00', 1, '2008-01-15 09:48:00', '2008-01-15 09:48:00'),
(8, 3, 1, 'Rotten Psychos Redesign', 'Bin am Überlegen ob ich bzw Wir Rotten-Psychos wiederbeleben....  \nRotten-Psychos ist bzw war ein Clan aus meiner \"Beben 3 Arena\" Zeit.  \n  \n_edit:_  \nClanpage is zu 90% fertig', '2008-01-27 10:00:00', 1, '2008-01-27 09:00:00', '2008-01-27 09:00:00'),
(9, 3, 1, 'Is schon irre was man so macht', 'Rotten Psychos ist f&uuml;r mich eine der besten Zeiten gewesen die ich hatte.  \r\nDamals war DSL noch Teuer und man freute sich &uuml;ber jedes 1on1  \r\nnun ist DSL billig und man hat keins weils dann doch finanzell nicht hinhaut', '2008-02-17 12:56:00', 1, '2008-02-17 11:56:00', '2008-02-17 11:56:00'),
(10, 1, 1, 'How Tough - Rotten-Psychos online', 'Herzlichste Gr?sse aus Bim?hlen w?nscht euch euer Asario.  \nh?re grad ma wieder Musik und denke mir, was geht bei euch so ab.  \nZur Zeit feile ich an der Neuen <a target=\"rotte\" href=\"http://www.rotten-psychos.de\">Rotten Psychos Seite</a> und das RP-Forum ist fast fertig.  \nDas Forum ist eine Eigenentwicklung auf MCS Basis.  \nHat mich ne menge Zeit gekostet bis alles so funktionierte wie gedacht.  \nAber ich habs geschafft die Fehler die sich versteckt hatten zu finden.', '2008-11-28 12:27:00', 1, '2008-11-28 11:27:00', '2008-11-28 11:27:00'),
(11, 1, 1, 'How Real', 'Es ist mal wieder eine neue Seite fertig geworden.  \nunter [www.freundeskreis-spiegelbild.de](http://www.freundeskreis-spiegelbild.de) findet ihr alles zum Förderverein Freundeskreis Spiegelbild', '2010-01-10 11:41:00', 1, '2010-01-10 10:41:00', '2010-01-10 10:41:00'),
(12, 2, 1, 'MCS 1.61 workin', 'Marble Content System ist in version 1.61 erschienen.  \nNeue Navigation neues Rechtesystem und etliche Zugaben sind ins Release eingeflossen.  \n  \nweitere infos zu MCS und dem aktuellen Status auf <a target=\"marbl\" href=\"http://www.marblefx.de\">www.marblefx.de</a>', '2010-01-12 18:09:00', 1, '2010-01-12 17:09:00', '2010-01-12 17:09:00'),
(13, 1, 1, 'Happy Birthday Asario', 'Herzlichen Glückwunsch Lieber Asario zum 27. Geburtstag.  \nDer Tag war schön und das Wetter ging auch in Ordnung.  \nFreue mich schon auf den Sommer.  \nHabe nette Sachen geschenk bekommen und demnächst lad ich noch 1-2 Fineliner-Bilder hoch.  \nHabt Spass, in liebe euer Asario.', '2010-06-19 22:31:00', 1, '2010-06-19 20:31:00', '2010-06-19 20:31:00'),
(14, 1, 1, 'Neue Bilder', 'Habe 1 neues Wallpaper unter [Digital Art](index.php?pae=images&action=digital) und 2 Fineliner Artworks unter [Fineliner 4](index.php?pae=images&action=fineliner4) hochgeladen.  \n  \nWünsche euch viel spass mit den Bildern.', '2010-08-14 22:31:00', 1, '2010-08-14 20:31:00', '2010-08-14 20:31:00'),
(15, 1, 1, 'Merry X-Mas and a happy  new Year', 'Hiermit wünsche ich allen Besuchern ein Frohes Fest und einen guten Rutsch ins neue Jahr.  \n  \nhabt Spass, bis bald, euer Asario', '2010-12-26 15:35:00', 1, '2010-12-26 14:35:00', '2010-12-26 14:35:00'),
(16, 2, 1, 'MCS 1.63 Workin', 'MCS 1.63 ist nun verfügbar.  \neinige nette Gimmicks wurden hinzugefügt, und die Liste für 1.65 ist schon lang.  \n  \nWünsche viel spass mit meinem Blog.', '2011-06-27 19:33:00', 1, '2011-06-27 17:33:00', '2011-06-27 17:33:00'),
(17, 1, 1, 'Neue (alte) Bilder unter Fineliner4', 'Hier ein paar neue Fineliner Artworks.  \nBei der Scanqualität musste ich leider etwas nachbearbeiten.  \nHoffe sie gefallen euch.  \nAuf Bald euer Asario', '2011-06-27 19:35:00', 1, '2011-06-27 17:35:00', '2011-06-27 17:35:00'),
(18, 3, 1, 'Bin wieder Online....', 'Dank eines kleinen Surfsticks bin ich ab und zu im Netz unterwegs,  \nd.h. ich bin wieder dabei.', '2011-06-27 19:49:00', 1, '2011-06-27 17:49:00', '2011-06-27 17:49:00'),
(19, 2, 1, 'MCS Update steht bevor....', 'Also hier mal wieder ein paar News aus der Devlog Ecke.  \nDie Entwicklung von MCS 1.64 ist angelaufen....  \nGeplant sind einige nette Features zwecks Private Messaging.  \nUnter anderem soll ein komplettes Einstellungstool das Private Messaging noch einfacher machen.  \nweitere Infos demnächst Hier...', '2011-07-29 18:30:00', 1, '2011-07-29 16:30:00', '2011-07-29 16:30:00'),
(20, 2, 1, 'news from MCS', 'Private Nachrichten werden ab jetzt auf Wunsch an die eigene E-Mailadresse gesendet,  \nso das niemand eine PM verpasst.  \nDas Einstellungstool sowie das Profilwerkzeug werden ab demnÃ¤chst zusammengefasst  \nund in Asarios Blog implementiert.  \n(ich arbeite noch dran)...', '2011-08-11 19:38:00', 1, '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(21, 2, 1, 'MCS version 1.67 Released', 'Viele neue Features und Funktionen kommen zum Major Release von MCS.  \nNun ist es endlich mÃ¶glich mehrere MCS Instanzen auf einer Scriptbasis zu Hosten.  \n  \nModule basierendes Admincenter gehÃ¶rt ebenso dazu wie eine Semantic Web Funktion.  \n  \nMCS ist jetzt Multilanguage fÃ¤hig.  \n  \nVieles Neues kam dazu, altes wurde verbessert.', '2011-08-11 19:38:00', 1, '2011-08-11 17:38:00', '2011-08-11 17:38:00'),
(22, 1, 1, 'Neue Shortstorie gesichtet & 2 neue Photos', 'Hab ma wieder [was geschrieben](%5C\'index.php?page=shortstories%5C) und [2 Photos](%5C\'index.php?page=images&action=photos%5C) hochgeladen.  \nHabt Spass, euer Asario', '2011-09-25 16:54:00', 1, '2011-09-25 14:54:00', '2011-09-25 14:54:00'),
(23, 1, 1, 'neue Fineliner Artworks', 'Ich habe ein paar [Artworks von 2011](%5C\'index.php?page=images&action=fineliner4%5C\') hochgeladen.  \nWünsche viel Spass, Asario.', '2011-10-28 20:43:00', 1, '2011-10-28 18:43:00', '2011-10-28 18:43:00'),
(24, 1, 1, 'Neues Fineliner Pic', 'Hab mal wieder nen Bild gefunden und hochgeladen.  \nHabt Spaß, euer Asario', '2011-12-04 19:58:00', 1, '2011-12-04 18:58:00', '2011-12-04 18:58:00'),
(25, 1, 1, 'Happy New Year !', 'Allen Besuchern und Freunden wünsche ich ein schönes neues Jahr.  \n  \nHabt Spaß, auch in 2012.  \n  \nIn Liebe, euer Asario', '2012-01-01 19:54:00', 1, '2012-01-01 18:54:00', '2012-01-01 18:54:00'),
(26, 1, 1, 'Neues bei mir.', 'Hab mal wieder nen Wallpaper und ne Shortstorie hochgeladen.  \n  \nWünsche viel Spaß damit, euer Asario.', '2012-02-12 20:23:00', 1, '2012-02-12 19:23:00', '2012-02-12 19:23:00'),
(27, 1, 1, 'Alles Neue macht der August', 'Also wir haben jetzt das Update zu Version 1.67 vollzogen.  \nviele kleine neuen Sachen sind jetzt dabei.  \nich wÃ¼nsch euch viel SpaÃŸ in Asarios Blog', '2012-08-21 15:43:00', 1, '2012-08-21 13:43:00', '2012-08-21 13:43:00'),
(28, 1, 1, 'Neues Design, neue Funktionen, neue Innovationen', 'Habe in meiner Schublade noch Bilder gefunden und hochgeladen.  \nHoffe Sie gefallen euch.  \n  \nviel Spass Asario', '2012-09-09 19:46:00', 1, '2012-09-09 17:46:00', '2012-09-09 17:46:00'),
(29, 1, 1, 'Neue Funktion in Asarios Blog', 'Newsfeeds sind jetzt im Abo erhÃ¤ltlich,  \nzu finden Rechts unter Benutzerliste.  \n  \nWÃ¼nsch euch viel SpaÃŸ mit den Feeds', '2012-11-22 20:50:00', 1, '2012-11-22 19:50:00', '2012-11-22 19:50:00'),
(30, 1, 1, 'Neue Bilder gesichtet.', 'unter Images->Digital und unter Images->Acryl sind neue Bilder gesichtet worden,  \nhabt SpaÃŸ, Asario', '2012-12-02 20:17:00', 1, '2012-12-02 19:17:00', '2012-12-02 19:17:00'),
(31, 1, 1, 'Hab noch mal gekramt....', '... und neue Bilder gefunden.  \nunter Photos, Fineliner4 und Sketches wurde neues gesichtet.  \n  \nAch ja, ein schÃ¶nes neues Jahr an alle.', '2013-01-06 20:31:00', 1, '2013-01-06 19:31:00', '2013-01-06 19:31:00'),
(32, 1, 1, 'Wieder was von der Bilderfront.', 'Unter Images->Photos2 ist eine neue Galerie entstanden.  \nUnter Images->Acryl ist ein neues Bild.  \nUnter Images->Sketches ist eine neue Skizze.  \nUnter Images->Digital ist ein neues Wallpaper.  \n  \nViel Spass mit den Bildern, Asario', '2013-01-27 20:06:00', 1, '2013-01-27 19:06:00', '2013-01-27 19:06:00'),
(33, 1, 1, 'Wie man aus 4 LeinwÃ¤nden 1 Lichtobjekt macht....', '... Seht ihr unter Images->Lampen  \nUns kam die Idee aus einem \"neverending Paul\" Bild eine Lampe zu fertigen.  \nMomentan arbeiten wir an der Befestigung sowie der Fassung des Lichtobjekts.  \n  \nedit: Die Winkel haben wir jetzt, die mÃ¼ssen nur noch gebohrt und montiert werden.  \n  \nWÃ¼nsche viel Spass damit, euer Asario', '2013-05-20 19:26:00', 1, '2013-05-20 17:26:00', '2013-05-20 17:26:00'),
(34, 3, 1, 'Neuer Fernseher in Asarios Home Office.', 'Ich habe mir mal was gegÃ¶nnt und mir einen neuen Fernseher gekauft.  \nDaten:  \nGrÃ¶sse: 47\' (119cm)  \nLAN, 3D, FullHD, Smart TV Funktionen  \n  \nJetzt hab ich nur noch das Problem das kein Satelitensignal bei mir ankommt, aber das kommt noch.  \nProllen ist zwar oll, doch dieser Fernseher ist so toll da musste ich mal mein Herz ausschÃ¼tten', '2013-05-20 19:52:00', 1, '2013-05-20 17:52:00', '2013-05-20 17:52:00'),
(35, 2, 1, 'MCS v. 1.68 released', 'Willkommen in Asarios Blog, meinem Blog auf MCS Basis.  \nMCS version 1.68 (Honkey Donkey) wurde installiert.  \n  \nZu den Features zählen:  \n-Neue Icons im Admincenter  \n-Benutzerinhalte Funktionen  \nsowie mehrere kleine eliminierte Fehler  \n  \nMehr Informationen im Changelog auf www.marblefx.de', '2013-06-23 21:37:00', 1, '2013-06-23 19:37:00', '2013-06-23 19:37:00'),
(36, 1, 1, 'Smilies all over the World', 'Ab jetzt seht ihr Ã¼berall Smilies wo auch immer sie geschrieben wurden.  \nHoffe es animiert euch zu neuen Kommentaren und bringt mehr Lesekomfort. :roll: ;)', '2013-06-23 21:38:00', 1, '2013-06-23 19:38:00', '2013-06-23 19:38:00'),
(37, 1, 1, 'Alles Neue Macht der Juli.', 'In meinem Urlaub in der Heimat habe ich ein paar Bilder geschossen, die ich euch nicht vorenthalten will.  \nIhr findet Sie unter Images->Photos2', '2013-07-14 19:55:00', 1, '2013-07-14 17:55:00', '2013-07-14 17:55:00'),
(38, 3, 1, 'Der Fernseher h&auml;ngt an der Wand ;)', 'Ja er hängt noch, er hängt noch für mich....  \nIch kann jetzt endlich alle Sender empfangen, einige sogar in HD ;)  \nUnd mein neuer 3D-BluRay Player rockt auch derbst.  \nIch hab mir gestern Avatar auf DVD mit meinem Blurayplayer angesehen.  \nEr rechnet das Bild zwar nur hoch aber selbst das sieht scharf aus.  \n  \ngl&hf Paul', '2013-08-11 20:00:00', 1, '2013-08-11 18:00:00', '2013-08-11 18:00:00'),
(39, 1, 1, 'Frohes Neues - 2014 - ein GlÃ¼cksjahr', 'Ich habe unter Images->Photos2 neue Photos aus meinem Weihnachtsurlaub gepostet,  \nIch hoffe bei euch war der Weihnachtsmann auch so fleiÃŸig wie bei mir.  \nAllen Besuchern meiner Seite wÃ¼nsche ich gut reingerutscht zu sein und ein schÃ¶nes neues Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, euer Asario.  \n  \nViele GrÃ¼sse auch von \"the cat\" Elke aus Potsdam ;)', '2014-01-05 19:14:00', 1, '2014-01-05 18:14:00', '2014-01-05 18:14:00'),
(40, 1, 1, 'Neues Layout !', 'Jetzt ist es mal wieder vollbracht, Asarios Blog wurde stylemÃ¤ssig erneuert.  \nUnd eine Neue Galerie hat sich angefunden.  \nMehr unter Images->Lampen', '2014-02-10 20:02:00', 1, '2014-02-10 19:02:00', '2014-02-10 19:02:00'),
(41, 2, 1, 'MCS v. 1.69 Online', 'Marble Content System wurde auf Version 1.69 aktualisiert.  \nNeben vielen kleinen Bugs die beseitigt wurden, gab es auch einige Neuentwicklungen  \nzu bestaunen. Ein Newsletter Service sowie eine Dynamische Hilfe wurden hinzugefÃ¼gt.  \nAuÃŸerdem wurde das Suchindex Script Ã¼berarbeitet sowie einige kleine Funktionen fanden den Weg ins 1.69er Release.  \nWenn euch was auffÃ¤llt schreibt mir auf www.mfx.marblefx.de/index.php?page=contact  \nIch wÃ¼nsche euch viel Spass auf meinen Seiten.  \n  \nAsario', '2014-03-02 20:04:00', 1, '2014-03-02 19:04:00', '2014-03-02 19:04:00'),
(42, 1, 1, 'Ausstellung in Kaltenkirchen', 'Am letztem Donnerstag wurde in Kaltenkirchen eine Ausstellung des Malerateliers erÃ¶ffnet. Bei ca. 40 geladenen GÃ¤sten im Beratungszentrum am Flottkamp 13b in Kaltenkirchen wurde Ã¼ber Kunst in der Psychatrie gesprochen sowie auf einzelne KÃ¼nstler eingegangen.  \n  \nDie Ausstellung lÃ¤uft noch 6 Wochen und es sind etliche KÃ¼nstler des Malerateliers zu sehen und auch zu Kaufen was \"wir\" alles so gemalt und kreiert haben.  \nÃ–ffnungszeiten sind montags bis donnerstags von 8:30 Uhr bis 18 Uhr sowie freitags von 8:30 Uhr bis 16:00 Uhr  \n  \nVon mir sind 3 Kunstwerke ausgestellt welche das sind seht Ihr wenn ihr da seid ;)  \nVon Hier aus noch mal Danke an Chris die das alles mÃ¶glich gemacht hat.;)', '2014-03-31 19:07:00', 1, '2014-03-31 17:07:00', '2014-03-31 17:07:00'),
(43, 2, 1, 'Misteri&ouml;se Schatten werfen Ihr Licht auf uns....', 'Ich plane demnächst den nächsten gro&szlig;en Schritt auf meiner Website, so stay in Tuned and look out for new functions...\r\n\r\nAlles geheim was ich hier mache...  \r\n\r\nAber Ihr hört von mir wenn ich aus dem Urlaub zurück bin.', '2014-04-13 19:35:00', 1, '2014-04-13 17:35:00', '2014-04-13 17:35:00'),
(44, 1, 1, 'Frohe Ostern... Der Osterhase war da!', 'Allen Besuchern wÃ¼nsche ich, frohe  \nOstern gehabt zu haben, Ich habe 2  \nneue Photos Hochgeladen.... viel  \nSpaÃŸ damit euer Asarioâ€¦', '2014-04-27 19:36:00', 1, '2014-04-27 17:36:00', '2014-04-27 17:36:00'),
(45, 1, 1, '3 neue Galerien', 'Ich erÃ¶ffne Hiermit die Galerien **Alphabet**, **Monstarz** und **Photos3**  \nhab eine Menge neuer Bilder hochgeladen, viel SpaÃŸ damit euer Asario.', '2014-06-17 19:31:00', 1, '2014-06-17 17:31:00', '2014-06-17 17:31:00'),
(46, 1, 1, 'Bewertungsfunktion fÃ¼r Bilder.', 'Ich habe auf Wunsch eines einzelnen Herren eine Bewertungsfunktion geschrieben.  \nAlle Meine Bilder kÃ¶nnt Ihr bewerten und sehen wie Sie ankommen.  \nViel SpaÃŸ damit, euer Asario', '2014-08-25 19:49:00', 1, '2014-08-25 17:49:00', '2014-08-25 17:49:00'),
(47, 3, 1, 'Mein neues Bike', 'Ich hab mal wieder etwas Geld in die Hand genommen und mir ein Trekking Rad zugelegt.  \nEs fährt sich echt g**l. Hubertus, mein neues Fahrrad ist ne Granate mit Hydraulikbremsen, Federgabel, 24 Gang Schaltung, Felgendyamo, stabiler Gepäckträger und Kunststoffschutzbleche sowie jede Menge Fahrspaß inklusive.  \n  \nIch bin Stolz auf dieses tolle Teil.', '2014-10-19 19:29:00', 1, '2014-10-19 17:29:00', '2014-10-19 17:29:00'),
(48, 2, 1, 'MCS v. 1.70 released', 'Die Neueste MCS Version ist Nr. 1.70.  \nIn diesem Release wurde einiges neu gemacht.  \nDas File Upload Center hat ein groÃŸes Update erfahren, so das sich Uploads parallel anstoÃŸen lassen.  \nAusserdem hat man im File Upload Center die MÃ¶glichkeit den Fortschritt des Uploads zu sehen.  \nMehr infos siehe Changelog  \nIch hoffe Ihr habt eure Freude an diesem Release.', '2014-10-25 18:14:00', 1, '2014-10-25 16:14:00', '2014-10-25 16:14:00'),
(49, 1, 1, 'New Images', 'Unter Images sind neue Bilder gesichtet worden,  \nund eine neue Galerie wurde erÃ¶ffnet.  \nDie Monstarnational Galerie mit Bildern vom Monstar in der groÃŸen weiten Welt.  \nHoffe Ihr habt SpaÃŸ damit, Asario', '2014-11-02 15:33:00', 1, '2014-11-02 14:33:00', '2014-11-02 14:33:00'),
(50, 3, 1, 'Mein erster Ritt...', 'In meinem Urlaub war ich das erste mal in meinem Leben \"selbstÃ¤ndig\" Reiten,  \nEs macht Irre SpaÃŸ, ist aber doch gewÃ¶hnungsbedÃ¼rftig sprich ich habe Respekt vor dem Tier.  \n  \nRispe, unser Therapiepferd ist sehr ruhig, nur an meiner KÃ¶rperspannung muss ich noch arbeiten.  \n  \nPS: Reiten ist Geil ;)', '2014-11-16 18:49:00', 1, '2014-11-16 17:49:00', '2014-11-16 17:49:00'),
(51, 1, 1, 'Frohe Weihnachten und einen...', 'guten Rutsch ins neue Jahr.  \nAnfang Dezember hat unser Chef uns zum schmunzeln gebracht.  \nEr hat den Coca Cola Truck inkl. Weihnachtsmann zu uns bestellt. Das war ein groÃŸes Event und viel SpaÃŸ fÃ¼r uns.  \nIch wÃ¼nsche allen Besuchern ein sinnliches Fest und einen guten Rutsch ins neue Jahr.  \nViele GrÃ¼ÃŸe aus Bad Segeberg, BimÃ¶hlen und Potsdam, Asario', '2014-12-05 19:30:00', 1, '2014-12-05 18:30:00', '2014-12-05 18:30:00'),
(52, 1, 1, 'Der FrÃ¼hling kommt.', 'Wie Ihr auf dem Bild seht ist schon wieder alles GrÃ¼n.  \nIn den letzten Monaten habe ich ein paar Bilder Online gestellt.  \nIhr findet Sie wie immer Ã¼ber den Roten Button rechts oben auf dieser Seite.  \nIch hoffe Ihr genieÃŸt das wunderbare Wetter wie ich letztens beim Eisessen in Bad Bramstedt.  \n  \nAch ja, unter Mindblog gibt es ne Geschichte Ã¼ber mich und mein Leben.  \nPart I ist Online, Part II kommt demnÃ¤chst  \nViele GrÃ¼ÃŸe aus dem sonnigen BimÃ¶hlen, euer Asario', '2015-03-20 18:49:00', 1, '2015-03-20 17:49:00', '2015-03-20 17:49:00'),
(53, 0, 1, 'Asario\'s Geschichte Part I', 'Alles fing mit einem verkorksten 16. Geburtstag an.  \nIch fuhr mit dem Rad durch die Gegend um mich abzureagieren und da traf ich sie wieder.  \nEs waren die Punks vom See mit Ihren Hunden.  \nIch spielte mit den Hunden und kam ins GesprÃ¤ch-  \nWir redeten Ã¼ber meinen Geburtstag und Sie fragten mich ob ich nicht mit in Ihre Kneipe kommen wÃ¼rde.  \nIch sagte zu. Von da an war ich Ã¶fter in der Kneipe. Es waren verstÃ¤ndnisvolle Menschen die vÃ¶llig natÃ¼rlich und nett waren. Ich fÃ¼hlte mich geborgen bei Ihnen.  \n  \nNicht so wie bei meinen Eltern, wo nur Ehe-Krach und Scheidungsstreitigkeiten an der Tagesordnung waren.  \nWenn ein Mensch Geborgenheit sucht und nichts ausser zerrÃ¼tteter VerhÃ¤ltnisse bekommt sucht man sich immer einen Ruhepol.  \nDen hatte ich in dieser besagten Kneipe gefunden. Viele Hunde, nette Menschen und Party Party Party war das was ich da hatte.  \n  \nDie Partys waren eine gute MÃ¶glichkeit mich abzulenken. Ich trank ein Paar Bier und schon ging es mir viel Besser.  \nZwar war das GefÃ¼hl nur fÃ¼r einen Moment vorhanden aber ich hatte meinen SpaÃŸ.  \n  \nMeine Leistungen in der Schule gingen rapide Bergab. Ich hatte einfach keine Lust es meinen Eltern Recht zu machen und in der Schule aufzupassen.  \nIch entwickelte mich immer mehr von einem guten SchÃ¼ler zu einen Klassenclown.  \nWIeso sollte ich meinem Traum vom Meeresbiologen denn weiter TrÃ¤umen wenn meine Eltern es nicht mal schaffen zusammenzuhalten ?  \n  \nIch war frustriert und Lustlos von all dem ganzen Zeug.  \nNur meine Punkerfreunde waren fÃ¼r mich da und machten mir Mut das irgendwann Licht am Ende des Tunnels sei.  \n  \nIch hatte eine Zweite Familie gefunden.  \n  \nto be continued', '2015-03-20 18:51:00', 1, '2015-03-20 17:51:00', '2015-03-20 17:51:00'),
(54, 2, 1, 'MCS v. 1.72 Ver&ouml;fentlicht', 'Joa, hab mal wieder ne neue Version released.  \nhinzugekommen sind:  \n- ein neues Anti Spam Modul  \n- Sicherheitsfunktionen die bei Erhöhtem Aufkommen die Seite sperren.  \n- Signatureinstellungen automatisiert.  \n  \nAußerdem habe ich Fehler beseitigt im  \n- Benutzerprofil  \n- Meta Tags Scripts  \n- Searching Scripts  \n  \nsowie mehrere kleine Bugs im System.', '2015-03-20 18:55:00', 1, '2015-03-20 17:55:00', '2015-03-20 17:55:00'),
(55, 1, 1, 'Elke ist tod. :(', 'Leider mussten wir Elke unsere Admin Katze einschlÃ¤fern weil Sie zu aggressiv wurde und meine Eltern mehrfach gebissen hat. Sie hatte es die letzten Jahre wirklich gut bei meinen Eltern und wir hoffen das es Ihr im Himmel besser geht als hier auf der Erde.  \nSie hatte schon immer einen leichten Schaden, nur weil es nicht besser wurde und meine Mutter mit EntzÃ¼ndingen schon des Ã¶fteren bei Ã„rzten war, lieÃŸen wir Sie EinschlÃ¤fern...  \nR.I.P. Elke, wir denken an dich.', '2015-05-05 18:16:00', 1, '2015-05-05 16:16:00', '2015-05-05 16:16:00'),
(56, 1, 1, 'Neue BilderÂ²', 'Here we goooo.  \nSind mal wieder 4 Bilder Hochgeladen worden...  \nIhr findet Sie unter fx_lxk(index.php?page=images|||Images).  \nBei uns ist zur Zeit gutes Wetter was fÃ¼r mich heiÃŸt Fahrradfahren.  \nWerd mal zum SpaÃŸ meine Kamera mitnehmen, mal sehn was ich da vor die Linse bekomme...  \nWÃ¼nsche viel SpaÃŸ mit den Bildern...', '2015-05-05 18:18:00', 1, '2015-05-05 16:18:00', '2015-05-05 16:18:00'),
(57, 1, 1, 'Neue Fineliner Bilder gesichtet...', 'Unter Images->Fineliner7 wurden neue Bilder gesichtet.  \nHope you enjoy the Ride ;)', '2015-07-05 18:19:00', 1, '2015-07-05 16:19:00', '2015-07-05 16:19:00'),
(58, 3, 1, 'Shopping Tour in NeumÃ¼nster', 'waren am Samstag Shoppen in der Innenstadt von NeumÃ¼nster und ich hab mir ein Paar neue Sneakers gekauft.  \nLÃ¤uft sich gut in den Schuhen...  \n  \nAnbei ein Photo der Schuhe.  \nstay in tuned, Asario', '2015-07-19 19:21:00', 1, '2015-07-19 17:21:00', '2015-07-19 17:21:00'),
(59, 3, 1, 'Haare AB!', 'Wie man auf dem linken Bild sieht sind meine Haare sehr kaputt gewesen.  \nSomit nahm sich eine Mitarbeiterin bei uns die Schere und killte 25cm von meinem Haupthaar.  \n  \nEndlich wieder ohne Schmerzen kÃ¤mmen und mehr Substanz.  \nNaja, muss man sich noch dran gewÃ¶hnen... ;)  \nAber es sieht schon besser aus.', '2015-08-04 18:13:00', 1, '2015-08-04 16:13:00', '2015-08-04 16:13:00'),
(60, 1, 1, 'Ricklinger Jahresfest 2015', 'Auch dieses Jahr am ersten Sonntag im September findet in Ricklingen das Jahresfest statt.  \nEs sind einige Bilder und Lampen von mir im Maleratelier zu finden.  \nWÃ¼nsche viel SpaÃŸ mit Essen, Trinken und dem restlichem Rahmenprogramm beim Fest.  \n  \nalso bis Sonntag, euer Asario', '2015-08-30 20:26:00', 1, '2015-08-30 18:26:00', '2015-08-30 18:26:00'),
(61, 2, 1, 'MCS v. 1.85 ist eingetroffen....', 'Mal wieder wurde MCS erneuert.  \nDazu gekommen sind einige kosmetische Eingriffe vorgenommen worden.  \nEinige Formularelemente wurden mit Material Design aktualisiert.  \nDazu kommen noch etliche Bugfixes in mehreren Komponenten.  \n  \nHinzugekommen sind ein Datei-Synchronisations-Script um schneller neue Dateien zum Hochladen in die Update Ordner zu schieben.  \n  \nAußerdem ist ein interner Chat entstanden.  \n  \nwünsche viel Spaß mit MCS v. 1.85 ;)  \nPS.: Momentan arbeite ich an der Integration von JQuery UI Elementen in das Admin Center.  \nsee you soon, Paule aka Asario', '2015-09-06 19:29:00', 1, '2015-09-06 17:29:00', '2015-09-06 17:29:00'),
(62, 1, 1, 'Neue Shortstories', 'Hab mal wieder nen paar Shortstories  \nhochgeladen. Ich will mal hoffen das  \neuch die gefallen.  \nPS: JQuery UI hÃ¤lt Einzug in MCS. weitere Infos demnÃ¤chst im Devlog.', '2015-09-15 18:44:00', 1, '2015-09-15 16:44:00', '2015-09-15 16:44:00'),
(63, 2, 1, 'Neuerungen dank JQuery UI', 'JQuery UI ist fast komplett integriert und ich habe kaum noch sachen zu machen... Habe jetzt alle Tabs auf den Seiten durch JQuery UI tabs ersetzt.  \n  \nIst irgendwie irre was man so mach wenn man viel Zeit hat. War ein ganz schöner Krampf die Tabs einzubauen.  \nIch musste alles was auf einzelnen extra Seiten war auf eine Seite reduzieren und die Verlinkung anpassen.  \n  \nAber alles in allem hat es sich gelohnt. Sieht Jetzt Stylischer aus und geht alles sehr viel schneller.  \nHab natürlich beim proggen etliche Bugs verursacht die ich mühsam finden und beseitigen musste.  \n  \nEin nettes Schmankerl ist auch die neue Shortstories Seite.  \n  \naber jetzt müsste eigentlich alles funken. wenn euch noch was auffällt schreibt mir ne PM oder mailt mir einfach über das Mailformular.  \n  \nAch ja, Die Hilfe Seite hab ich komplett neu geschrieben und dabei ca. 80 Zeilen Code eingespart. Klingt nicht nach viel aber bei einem Vergleichsweise kleinem Script ist das schon ne Menge.  \n  \nPS: In den Privaten Nachrichten sind Smilies mit dabei.  \n  \nBis Bald Asario.', '2015-10-04 20:03:00', 1, '2015-10-04 18:03:00', '2015-10-04 18:03:00'),
(64, 1, 1, 'JQuery UI integrated', 'Ich hab mir Erlaubt, JQuery UI in meine Seite zu integrieren.  \nsichtbar ist das in den Private Messages. Ich habe die Bereiche mit Tabs modernisiert.  \nHat ne Menge Zeit gekostet bis alles funktionierte aber es ist geschafft.  \nHoffe euch gefallen die Akzente die ich mit JQuery UI gesetzt habe.  \nAnsonsten ist noch alles Banane in Big Bad Bottermilk BimÃ¶hlen.', '2015-10-13 18:50:00', 1, '2015-10-13 16:50:00', '2015-10-13 16:50:00'),
(65, 3, 1, 'Die Kundenzufriedenheitsumfrage ;)', 'Ich will von euch wissen was euch auf meiner Seite fehlt.  \nSeit Ihr an neuen Shortstories interessiert ? Oder sollen es doch mehr Bilder sein ?  \nHabt ihr ne Idee fÃ¼r meine Seite ?  \nSoll ich einen Chat programmieren oder doch nen GÃ¤stebuch integrieren ?  \nIhr entscheidend was ich einbaue.  \nOder solls vielleicht ne Shoutbox sein ?  \n  \nIDEEN RAN, ABER FLOTT ;)', '2015-10-27 18:00:00', 1, '2015-10-27 17:00:00', '2015-10-27 17:00:00'),
(66, 1, 1, 'Neues Kleid fÃ¼r alte GerÃ¼ste.', 'Jetzt erstrahlt auch die Startseite in freundlichen Orange.  \nIch habe einen Ã¼blen Bug in der Benutzerkonfiguration in den Private Messages gekillt.  \nIch hoffe alles funktioniert jetzt so wie gewÃ¼nscht.  \nDesweiteren arbeite ich an einigen Details die noch nicht Spruchreif sind.  \nIch hoffe Ihr genieÃŸt den \\\"Ritt\\\" auf der AB Welle ;)  \nSincerly Yours Asario', '2015-10-27 18:02:00', 1, '2015-10-27 17:02:00', '2015-10-27 17:02:00'),
(67, 3, 1, 'Meine Karriere zum freiwilligen Webdesigner und die Zunkunft...', 'Alles fing im Informatikunterricht in der 9./10. Klasse an.  \nWir lernten das Erstellen von Websites mit Microsoft Frontpage.  \nIch war sofort begeistert wie einfach man Websites erstellen kann.  \nIch erstellte einige Websites mit MS Frontpage und kam dann durch einen Kumpel zu PHP.  \nPHP ist eine einfach zu erlernende Scriptsprache die meine Ideen aufsog wie ein nasser Schwamm.  \n  \nNach einigen Jahren Programmiererfahrung entstand MCS, mein noch heute im Einsatz befindliches System, das **Marble Content System**  \nEine Vorlagen Engine sowie eine umfangreiche Administration entstanden in den darauffolgenden Jahren.  \nMittlerweile ist alles vom Portal bis zur Web-Visitenkarte machbar.  \nIch integrierte etliches nützliches aus meiner C\'t und bin immer noch am Arbeiten, neue Module zu erfinden bzw. alte zu verbessern  \n  \nIm Admin Center geht es los. Inhalte Einpflegen, Tabelleneinstellungen, Vorlagen Einstellungen, Benutzerprofile, Benutzerinhalte, Benutzergruppen und Rechte,  \nNewsletter, Kontakte, Kalender, Private Nachrichten uvm.  \n  \nMomentan habe ich 3 Javascript Frameworks installiert, die Entweder aufhübschen oder Funktionen nachrüsten.  \nJQuery UI, Foundation, Material Framework sind bei mir auf der ein oder anderen MCS-Seite installiert.  \n  \nMomentan läuft MCS auf 8 Webseiten in meinem Webspace.  \n  \nViele fragen sich, warum das Rad neu erfinden? Ich meine Wordpress, Typo3 oder Drupal können doch auch alles.  \nDoch selbst ein älteres Mambo hat 60% Mehr Code als MCS  \nEngines wie Smarty die mal eben 6000 Zeilen Code fressen wollte ich nicht integrieren.  \nmeine Vorlagen Engine hat mit 474 Zeilen weniger Gewicht als Hochgezüchtete CMS\'es und ist dennoch funktional.  \n  \nDer Vorteil an MCS ist dass man die HTML Vorlagen mit einem Wysiwyg Editor komplett erstellen kann weil sie reines HTML sind.  \nAngereichert mit in PHP geschriebenen Modulen und Funktionen sind sie hochdynamisch und schnell.  \nWollt Ihr/ Willst du schon immer eine eigene Website haben wo du dich über dein Hobby oder dein Lieblingsthema auslassen willst so schreib mir doch über das [Kontaktformular](kontakt) falls du eine interessante Idee für eine Homepage hast. Ich freue mich über jede Anregung oder Idee.  \n  \nForum, Chat, Shoutbox, Kommentare, Gästebücher sowie Bildergalerien, Texte, Fotos, Suchfunktion, RSS Stream, Smartphone Unterstützung uvm, wurden bereits Entwickelt und in MCS integriert. Wenn dir auch für meine Seite eine Idee einfällt schreib mir über das [Kontakformular](kontakt)  \n  \nMCS is ready to Launch.', '2015-11-24 19:37:00', 1, '2015-11-24 18:37:00', '2015-11-24 18:37:00'),
(68, 1, 1, 'Neue Galerie und einige nette Details', 'Habe eine neue Galerie mit Zentangles erstellt.  \nDa findet Ihr meine Fortschritte beim Tanglen.  \nAuÃŸerdem habe ich im Dokumentenfooter Links zu Kontakt,Datenschutz und Impressum integriert.  \nUm dem Datenschutz nachzukommen habe ich Piwik so eingestellt das Ip Adressen nur gekÃ¼rzt aufgezeichnet werden.  \nPiwik ist ein Statistiktool zum Auswerten der Besuche auf dem Server.  \nIhr kÃ¶nnt jederzeit Ã¼ber die fx_lxk(index.php?page=datenschutz|||Datenschutz) Einstellungen das Tracking deaktivieren.  \nDie Statistischen Daten dienen der Verbesserung des Angebotes und sind Indikatoren fÃ¼r BesucherstrÃ¶me.  \nWÃ¼nsche viel SpaÃŸ mit meinen Seiten, In Liebe, Asario', '2015-12-18 20:17:00', 1, '2015-12-18 19:17:00', '2015-12-18 19:17:00'),
(69, 1, 1, 'Happy New Year', 'Ich wÃ¼nsche allen Besuchern gut reingerutscht zu sein.  \nIch hoffe Ihr habt nicht zu viel Zugenommen Ã¼ber die Feiertage und seit gut reingerutscht  \nNatÃ¼rlich hoffen wir das wir alle Gesund bleiben,  \nund Erfolg im Beruf haben sowie das dieses ein glÃ¼ckliches Jahr wird', '2016-01-03 18:15:00', 1, '2016-01-03 17:15:00', '2016-01-03 17:15:00'),
(70, 1, 1, '2 neue Galerien gefunden', 'Wie Ihr vielleicht seht hab ich 2 Bildergalerien verÃ¶ffentlicht.  \nIn der Galerie Photos4 findet Ihr meine neusten Fotos.  \nBei der 2ten Galerie dreht sich alles um Fasermalerbilder  \nStÃ¶bert doch mal vorbei, es lohnt sich auch wenn es noch relativ Leer aussieht, ich fÃ¼ge demnÃ¤chst neue Bilder hinzu.  \nIch mÃ¶chte noch mal auf Mindblog hinweisen wo Ihr Mitspracherecht bekommt was Ihr euch fÃ¼r 2016 von mir WÃ¼nscht.  \n  \nAlso bis bald, Asario', '2016-01-15 19:10:00', 1, '2016-01-15 18:10:00', '2016-01-15 18:10:00'),
(71, 1, 1, 'Neue Domain VerfÃ¼gbar.', 'An alle Fans hier der Tipp des Jahres:  \nwww.asario.de statt ab.marblefx.de.  \nAlso noch mal zum Mitschreiben www.asario.de ist Online ......  \n  \nWÃ¼nsche viel SpaÃŸ auf meiner Seite.', '2016-02-09 19:55:00', 1, '2016-02-09 18:55:00', '2016-02-09 18:55:00'),
(72, 1, 1, 'Ich habe 4 neue Bilder gemalt', 'Ihr findet Sie unter [Images->Fasermaler](index.php?page=images&action=cat&id=21) sowie unter [Images->Fineliner7](index.php?page=images&action=cat&id=17).  \nWÃ¼nsche viel SpaÃŸ mit den Bildern.  \nmfg Asario', '2016-04-01 18:43:00', 1, '2016-04-01 16:43:00', '2016-04-01 16:43:00'),
(73, 1, 1, 'Neues Wallpaper', 'Ein neues Wallpaper wurde unter Images->Digital gesichtet.  \nAusserdem wurde das Upload Script Ã¼berarbeitet.  \nMehr dazu demnÃ¤chst im Changelog und unter Devlog.', '2016-05-17 18:16:00', 1, '2016-05-17 16:16:00', '2016-05-17 16:16:00'),
(74, 2, 1, 'MCS Version 1.98 erschienen', 'Joa, hab mal wieder n paar Aktualisierung an MCS vorgenommen.  \n1. Semantische Tags wurden eingefÃ¼hrt, basierend auf dem Suchindex.  \n2. Countpixel zur Besucheranalyse wurden integriert.  \n3. Sitemap wurde eingebaut und auf einigen Seiten aktiviert.  \n4. Bilderupload Script wurde um StandardgrÃ¶ÃŸen fÃ¼r einzelne Galerien erweitert,  \nd.h. je nach gewÃ¤hlter Galerie sind unterschiedliche StandardgrÃ¶ÃŸen einstellbar', '2016-05-24 18:50:00', 1, '2016-05-24 16:50:00', '2016-05-24 16:50:00'),
(75, 1, 1, 'Diverse neue Bilder', 'Ich habe mal wieder Bilder hochgeladen.  \nIhr findet die Objekte unter [Images](index.php?page=images)  \nIch wÃ¼nsche euch viel SpaÃŸ damit.  \nFalls Ihr immer noch nicht wisst wie man zu den Bildern kommt so guggt doch mal ganz nach oben. Auf dem Schwarzen Balken ist die Navigation zum Surfen.  \nIch wÃ¼nsche euch viel SpaÃŸ auf meiner Seite.  \nBis bald, Asario.', '2016-06-14 19:04:00', 1, '2016-06-14 17:04:00', '2016-06-14 17:04:00'),
(76, 1, 1, 'MCS Version 2.01', 'Herzlich Willkommen bei MCS 2.01 mit 201 Bildern unter Images. Jetzt endlich mit kanonischen URLs. Nun kann man z.B. mit www.asario,de/shortstories die Shortstories aufrufen. Hinzugekommen zu 2 neuen Bildern ist auch 1 Shortstory,  \nAlles im Sinne von 2.01 ;)  \nWÃ¼nsche viel Spass, Asario', '2016-06-28 18:57:00', 1, '2016-06-28 16:57:00', '2016-06-28 16:57:00'),
(77, 2, 1, 'Neuerungen in MCS 2.01', 'Es ist mal wieder was von der MCS Front zu berichten.  \nZu diesem Major Release habe ich Kanonische also eindeutige und einfachere URL\'s eingebaut,  \nnoch ein paar Bugs in der Gallery Connection gekillt und die Countpixel Module gefixt.  \nIch musste wegen den Kanonischen URL\'s fast die gesamte Verlinkung und die VerknÃ¼pfung  \nder Bilder erneuern/reparieren.  \nEben ist mir bzw Mumbo ein Fehler beim PM Script aufgefallen den ich ebenso gefixt hab.  \nSinn und zweck der Kanonischen URL\'s ist es den Seitennamen zu vereinfachen/zu verkÃ¼rzen.  \nSo wird aus www.asario.de/index.php?page=news -> www.asario.de/news was fÃ¼r Suchmaschinen  \nideal ist und auch leichter zu merken ist.  \nBin zwar noch nicht zufrieden mit den Kanonischen URL\'s aber da fÃ¤llt mir auch noch was ein.  \nHoffe Ihr habt SpaÃŸ auf meinen Seiten...  \nin Love Asario', '2016-07-04 17:12:00', 1, '2016-07-04 15:12:00', '2016-07-04 15:12:00'),
(78, 3, 1, 'Burzeltach und seine Folgen...', 'Wie Ihr vielleicht wisst hatte ich am 18.06. Geburtstag.  \r\nund habe mir selber ein großes Geschenk gemacht.  \r\nIch habe eine nicht nennenswerte Summe Geld investiert und  \r\nmir einen absolut bequemen Schreibtischsessel gekauft. (siehe Bild)  \r\nAuf dem Foto ist hoffentlich mein 2tes großes Geschenk zu sehen.  \r\nEin Pinsel-Set zum professionellem Malen im Maleratelier und bei mir zu Hause.  \r\nDemnächst ist Mighty Crab Online (Unter [www.asario.de/ausgemaltes](ausgemaltes) bald zu sehen)  \r\nDenn das Zen-Color Buch von meiner Schwester ist mit guten Motiven gespickt, so das ich hin und wieder mal was ausmale und unter [Images->Ausgemaltes](ausgemaltes) veröffentliche.', '2016-07-08 20:14:00', 1, '2016-07-08 18:14:00', '2016-07-08 18:14:00'),
(79, 0, 1, 'Asario\'s Geschichte Part II', 'So da wÃƒÂ¤ren wir nun.  \nWir haben eine zerÃƒÂ¼ttet Familie, ein Haufen Chaoten und jede Menge Party.  \nIch blieb bei meinem Vater nachdem meine Mutter Ihn verlassen hatte.  \nAber auch das ging nicht lange gut. Nach 2-3 Jahren bei meinem Vater zog ich dann doch zu meiner Mutter.  \n  \nIch fing eine Ausbildung zum Kaufmann fÃƒÂ¼r Audiovisuelle Medien an und nach 1,5 Jahren ging ich nicht mehr hin, weil mir alles zu viel wurde.  \nIrgendwann quartierte mich meine Mutter aus und ich zog in ein Neubauviertel in Potsdam.  \n  \nNach anderthalb Jahren im \"RattenkÃƒÂ¤fig\" fing bei mir alles an sich zu ÃƒÂ¤ndern. Ich bekam komische Nachrichten per Telepathie und zog mich immer weiter ZurÃƒÂ¼ck.  \nIn Wahrheit bekam ich eine Psychose und wurde Psychisch Krank.  \n  \nSchizophrenie die Diagnose der Ãƒâ€žrzte schockte mich schon ganz schÃƒÂ¶n.  \nDie ersten Jahre mit der Krankheit dachte ich ich wÃƒÂ¤hr gesund nur irgendwann wurde mir klar das man diese Krankheit zwar beherrschen aber nicht heilen kann.  \n  \nSo nun bin ich halt krank, na und ?  \nIch versuche das Beste draus zu machen und bin seit ein paar Jahren ziemlich stabil.  \n  \nto be continued...', '2016-07-08 20:16:00', 1, '2016-07-08 18:16:00', '2016-07-08 18:16:00'),
(80, 1, 1, 'Neue Galerie vorhanden.', 'Ich habe ja wie bereits erwÃ¤hnt ein Ausmalbuch \"Zen Colour Ocean\" zum Geburtstag  \nbekommen. Hier und jetzt kÃ¶nnt Ihr meine Werke bewundern.  \nViel SpaÃŸ, Asario', '2016-08-24 10:20:00', 1, '2016-08-24 08:20:00', '2016-08-24 08:20:00'),
(81, 1, 1, 'Neuerungen unter der Haube', 'Mal wieder habe ich geschraubt und gemacht um MCS noch besser zu machen.  \nUnter der Haube habe ich eine Synchronisationsumgebung gebaut um noch einfacher neue Inhalte zu publizieren.  \nWenn ich also bei mir zu Hause Dateien oder Datenbankinhalte verÃ¤ndere bzw Erstelle so synchronisiert MCS alle Inhalte auf meinen Webspace.  \nSomit muss ich mich nicht mit Datenbank Dumps rumÃ¤rgern und habe alle Seiten immer aktuell. Momentan schraube ich noch am RSS-Feed, der irgendwie noch nicht mit dem Sync-Client kompatibel scheint.  \nAber gut ding will Weile haben, oder wie man auch sagt: Was lange Wert, wird endlich gut.  \nIn diesem Sinne, Have Fun Folks.', '2016-10-08 20:07:00', 1, '2016-10-08 18:07:00', '2016-10-08 18:07:00'),
(82, 1, 1, 'Merry X-Mas', 'Ich wÃ¼nsche allen Fans ein besinnliches und schÃ¶nes Weihnachtsfest und einen guten Rutsch ins neue Jahr. Hoffen wir das wir auch im nÃ¤chsten Jahr alles GlÃ¼ck der Welt haben und Fit sind wie im Letzten Jahr.  \n  \nViele GrÃ¼ÃŸe aus BimÃ¶hlen, Berlin und Potsdam wÃ¼nscht euer Asario.', '2016-12-19 18:24:00', 1, '2016-12-19 17:24:00', '2016-12-19 17:24:00'),
(83, 1, 1, 'Big Exceptions', 'Die Erwartung ist groÃŸ, ich hoffe sie enttÃ¤uscht euch nicht.  \nHab mal wieder was ausgemalt, zu finden unter Images->Ausgemaltes und ich arbeite an einem neuen Acryl auf Leinwand Bild was demnÃ¤chst hier reinflattern wird.  \nich hoffe Ihr mÃ¶gt Quallen, denn mein aktuellstes Werk heiÃŸt Jellyfish, hat aber im Grunde genommen keine Ã„hnlichkeit mit einer Qualle.  \nAch ja, vielleicht ist es euch schon Aufgefallen, Ich habe ein paar Layout Ã„nderungen unter **Images**, **Devlog**, **Mindblog** und **Shortstories** vorgenommen. Ich hoffe Ihr mÃ¶gt es..  \nPS: Die Bewertung von Bildern habe ich etwas verÃ¤ndert, aber lasst euch davon nicht abschrecken zu Voten...  \nAch ja, bevor ichs vergesse, MCS wurde auf Version 2.15 gepatcht.  \nenjoy the ride, Asario', '2017-01-25 09:37:00', 1, '2017-01-25 08:37:00', '2017-01-25 08:37:00'),
(84, 2, 1, 'MCS Version 2.15', 'Sooooooooooooo, mal wieder was neues aus meinen Programmiergriffeln.  \nMCS 2.15 wurde verÃ¶ffentlicht. In Diesem Release ist fast alles von und mit Google.  \nEin Sitemap Generator wurde ebenso integriert wie ein Rich Snippet Modul.  \nGoogle mein Freund ist fleiÃŸig am Crawlen der Seiten. AuÃŸerdem hab ich einige kleinere Updates vorgenommen. Unter anderem habe ich ein paar Bugs im Synchro-Tool beseitigt.  \nIch muss demnÃ¤chst noch die RSS-Feeds kontrollieren, hab dazu bis jetzt noch keine Zeit gehabt.  \nAuch dieses mal wÃ¼nsche ich eine schÃ¶ne Zeit in meinem Blog.  \nmfg Asario', '2017-01-25 11:17:00', 1, '2017-01-25 10:17:00', '2017-01-25 10:17:00'),
(85, 1, 1, 'MCS Points - die Smarte W&auml;hrung', 'Ab jetzt k&ouml;nnt ihr als registrierte Benutzer satte Pr&auml;mien kassieren wenn ihr genug Artikel kommentiert, Newsletter lest, Shortpoems vorschlagt oder Bilder bewertet. F&uuml;r jede Aktion gibt es Punkte die Ihr gegen Bilder, eintauschen k&ouml;nnt. Ihr erhaltet signierte original Kunstwerke f&uuml;r eure Butze oder zum Verschenken.\r\n\r\nfx_premium_table()', '2017-01-29 15:48:00', 1, '2017-01-29 14:48:00', '2017-01-29 14:48:00'),
(86, 3, 1, 'Meine Privaten News', 'Ich Ã¼berlege zur Zeit was ich mir von meinem Ersparten kaufen soll / möchte.  \nMeine Grafikkarte röhrt seit einigen Wochen, ich werde sie wohl ersetzen mÃ¼ssen.  \nDiesmal wird es wohl eine karte von NVIDIA sein.  \nschon falls ich es doch noch mal schaffe mich an Linux zu gewöhnen.  \nAußerdem sind die Nvidia Karten Sparsamer was den Energieverbrauch angeht.  \nWird wohl ne GF1060 werden. Mein Kollege Mumbo hat mir die schon empfohlen.  \nNun ja Eine neue Grafikkarte soll auch 4k-FÃ¤hig sein, falls ich mir noch nen 4k Monitor holen will.  \nDie sind zwar jetzt noch zu Teuer aber die Preise fallen mit der Zeit bekanntlich so dass sie bald erschwinglich sind.  \nNun ja alles klar auf der Andrea Doria.  \nEs ist schon Praktisch das die Dinger im Leerlauf die Lüfter anhalten können.  \nSo hab ich beim Programmieren von Websites immer einen leisen PC.  \nSchade das AMD und Linux nicht so ganz Harmonieren, hätte mir gern ne AMD Karte geholt.  \nAber man soll an die Zukunft denken.  \n  \nAch ja ich vergas doch glatt das ich mir ne Blu-Ray über Amy Winehouse gekauft habe.  \nIst echt Irre, was die so erlebt hat.  \nR.I.P. Amy.  \n  \nin diesem Sinne, Viel Spaß Asario', '2017-02-19 13:37:00', 1, '2017-02-19 12:37:00', '2017-02-19 12:37:00'),
(87, 1, 1, 'Jetzt aber...', 'Ich habe mal wieder was gebastelt. Unter [Benutzer](user) kÃ¶nnt ihr im Profil eine Statistik bewundern. JQPlott sei dank habe ich ein Paar Diagramme geparkt die veranschaulichen was wer wann und wie gemacht hat.  \nUnd damit kÃ¶nnt ihr \"eure Leistung\" mit der der anderen vergleichen.  \nSoo, dann hab ich noch 2 neue Bilder Online gestellt zu finden unter [Images](images) in den Galerien Faser und Acryl. Siehe auch rechts oben auf dieser Seite.  \nViel Spass beim Statistiken guggen, in Love Asario', '2017-03-02 18:43:00', 1, '2017-03-02 17:43:00', '2017-03-02 17:43:00'),
(88, 2, 1, 'Neue Navigationsleiste', 'Ich habe die Navigation neu sortiert. Devlog, Mindblog und Shortstories sind ab jetzt unter Articles zu finden. Die Navi ist jetzt nicht mehr so voll wie vorher.  \nIch hoffe Ihr findet euch zurecht. Bei Fragen und anregungen [meldet euch bei mir](kontakt).  \nViel SpaÃŸ in meinem Blog, in Love, Asario', '2017-03-12 16:33:00', 1, '2017-03-12 15:33:00', '2017-03-12 15:33:00'),
(89, 2, 1, 'MultiLanguageSupport', 'Ab jetzt kÃ¶nnt ihr einige der Seiten in Englischer Sprache sehen.  \nDie gesamten Texte konnte ich noch nicht einenglischen aber Einstellungen und Backend sind Multi-Lang fÃ¤hig. Einstellen der Sprache kÃ¶nnt ihr in der Navigation oben rechts.  \n  \nIch habe grad einen Ã¼blen Bug im Dateihochladescript gefunden...  \nmÃ¼sste jetzt wieder gehen.  \n  \nWÃ¼nsche viel SpaÃŸ damit. falls euch noch was einfÃ¤llt oder auffÃ¤llt schreibt es mir.  \n  \nKommentare, E-Mails oder PMs sind willkommen...  \nbis denne, Asario', '2017-03-24 18:50:00', 1, '2017-03-24 17:50:00', '2017-03-24 17:50:00'),
(90, 1, 1, 'Das Warten hat ein Ende', 'Endlich habe ich mal wieder nen funzenden Web-Stick.  \nwie Ihr seht bin ich wieder Online unterwegs.  \nhabe ne lÃ¤ngere Pause Gemacht und hoffe bald mal wieder was gemaltes zu uppen.  \nHoffe Ihr habt SpaÃŸ mit meiner Seite.  \nwww.asario.de your finest Art Place ;)', '2017-05-18 19:58:00', 1, '2017-05-18 17:58:00', '2017-05-18 17:58:00'),
(91, 2, 1, 'Die Version 2.35 von MCS wurde aktualisiert.', 'Mal wieder habe ich eine neue Version veröffentlicht.  \nDie größte Änderung betrifft die Übersicht der Tabelle.  \nHier kann man nun per Drag & Drop Einträge sortieren.  \nEinige Styles von www.marblefx.de wurden überarbeitet, so dass alle Ränder genau übereinander liegen.  \nAußerdem habe ich diverse Bugs in einigen Modulen gestopft.  \nEin übler Bug im Kontaktformular wurde soeben gefixt.  \nIhr könnt mir wieder Mails schreiben...  \nmehr Infos wie immer im Changelog.', '2017-05-26 09:13:00', 1, '2017-05-26 07:13:00', '2017-05-26 07:13:00'),
(92, 1, 1, 'Neue Galerie gesichtet', 'Ab jetzt kÃ¶nnt ihr getÃ¶pferte Kunstwerke von mir sehen.  \nUnter [http://www.asario.de/ton](ton) findet ihr meine vorrangig Viereckigen GegenstÃ¤nden.  \nHabe bis jetzt einen Aschenbecher in der Mache.', '2017-05-28 19:09:00', 1, '2017-05-28 17:09:00', '2017-05-28 17:09:00'),
(93, 1, 1, 'Herzlichen GlÃ¼ckwunsch', 'Mal wieder jÃ¤hrt sich der Tag an dem ich Ã¤lter werde.  \nIn diesem Moment ist es nicht verwunderlich, dass man sich seine Gedanken macht.  \nMeine Gedanken gehen an meine verstorbenen Eltern und den Rest meiner Familie.  \nEinsamkeit ist eine komplizierte Angelegenheit, die manchmal Probleme aufwirft.  \nIch hoffe Ihr seid nicht Einsam.  \n  \nIn Love, Asario', '2017-06-17 17:56:00', 1, '2017-06-17 15:56:00', '2017-06-17 15:56:00'),
(94, 3, 1, 'Meine Geschenke....', 'Ich bin jetzt Besitzer eines Schafes in Afghanistan.\nIch hoffe das die Familie viel Milch und Wolle ernten kann. \nDank www.OxfamUnverpackt.de hat eine arme Familie eine Lebensgrundlage. \nDas Schaf ist ein nettes Geschenk mit Hintergedanken finde ich.\nBestellt euch doch auch so ein Schaf.  \n\nAußerdem habe ich noch ein Buch und einen neuen Rucksack geschenkt bekommen. Und jede Menge Tee war auch dabei.  \n\nThx Ianosaurus & Chinagirl', '2017-06-20 19:45:00', 1, '2017-06-20 17:45:00', '2017-06-20 17:45:00'),
(95, 1, 1, 'Internationalisierung vorangetrieben', 'Mittlerweile gibt es die meisten Seiten auch auf Englisch zu sehen.  \nIch bin fleissig am Ãœbersetzen der Texte. Kann aber, da ich allein bin nicht so viel machen... Muss ja schlieÃŸlich auch noch nebenbei BrÃ¶tchen verdienen.  \nAber ich habe mir vorgenommen alles neue in Deutsch und Englisch anzubieten.  \n  \nDa Google Translate nur Bullshit bringt muss ich alles von Hand Ã¼bersetzen was bei meinem Schulenglisch gar nicht so leicht ist...  \n  \nHoffe Ihr Muttersprachler verzeiht mir meine Faux Pas.  \n  \nNeu dazugekommen ist der Englische Newsfeed unter [http://www.feeds.marblefx.de/ab.en.xml](http://www.feeds.marblefx.de/ab.en.xml)  \nin Love, Asario', '2017-06-30 20:07:00', 1, '2017-06-30 18:07:00', '2017-06-30 18:07:00'),
(96, 1, 1, 'Habe mal wieder geschraubt.', 'Ab Sofort kÃ¶nnt Ihr miteinander Chatten.  \nSobald auÃŸer euch noch jemand eingeloggt ist seht ihr einen Link zum Chat.  \nIch hoffe Ihr habt mal das GlÃ¼ck jemand im Chat zu begegnen.  \nWÃ¼nsche Viel SpaÃŸ, in Love Asario', '2017-07-07 18:26:00', 1, '2017-07-07 16:26:00', '2017-07-07 16:26:00'),
(97, 2, 1, 'Neue Version auf alten Gleisen', 'MCS Version 2.45 ist erschienen.  \nzu den Herausragenden Features zÃ¤hlen der Chat auf www.asario.de.  \nSollte mehr als 1 User online seien gibt es einen Hinweis auf meinen Chat.  \nVielleicht bau ich noch eine Einladungsfunktion ein die per Mail Nutzer meines Blogs in den Chat einladen.  \nAch ja, ich arbeite an den ersten Landingpages fÃ¼r Asarios Blog und musste deswegen an der Grundstruktur der Seiten arbeiten.  \nViel SpaÃŸ damit, Asario', '2017-07-11 18:44:00', 1, '2017-07-11 16:44:00', '2017-07-11 16:44:00'),
(98, 1, 1, 'Neues Design', 'Ich habe mal wieder an der Designschraube gestellt.  \nnun erscheint Asarios Blog in zartem TÃ¼rkis Blau.  \nHoffe euch gefÃ¤llt die neue Aufmachung gut.  \nKommentare immer willkommen... :)  \nbis dann Asario', '2017-07-29 18:06:00', 1, '2017-07-29 16:06:00', '2017-07-29 16:06:00'),
(99, 1, 1, 'SSL Ãœberall', 'Herzlichen GlÃ¼hstrumpf, wir haben SSL aktivieren kÃ¶nnen.  \nDank Let\'s Encrypt ist jetzt alles sicher.  \nVielen Dank an 1blu die Let\'s Encrypt integriert haben.  \nWÃ¼nsche ein sicheres \"SURF\", Asario', '2017-08-20 15:40:00', 1, '2017-08-20 13:40:00', '2017-08-20 13:40:00'),
(100, 1, 1, 'Neues auf meinem Blog', 'Ein kleines Detail hat sich auf meiner Seite verÃ¤ndert.  \nLinks vom Kommentar ist das Profilbild des Users zu finden.  \nWar ne recht schnelle Nummer das Umzusetzen.  \nSieht echt Schnieke aus so.', '2017-09-10 12:48:00', 1, '2017-09-10 10:48:00', '2017-09-10 10:48:00'),
(101, 1, 1, 'Neue Bilder gefunden', 'Ich habe unter www.asario.de/ton und www.asario.de/monstarnat neue Bilder hochgeladen. Ich wÃ¼nsche viel SpaÃŸ damit, Asario', '2017-09-17 19:16:00', 1, '2017-09-17 17:16:00', '2017-09-17 17:16:00'),
(102, 1, 1, 'Mein Praktikum', 'Ich habe letzten Freitag mein Praktikum bei Elan Nord beendet. Die Arbeit macht mir sehr viel SpaÃŸ und ich konnte einiges lernen sowie ausprobieren. Ich durfte viel mit Klebefolien arbeiten und bekam Einblicke in die Arbeit eines Mediengestalters.  \nIch bin sehr froh das ich dieses Praktikum machen konnte, und freue mich auf ein Wiedersehen mit dem Team von Elan Nord.', '2017-10-14 19:08:00', 1, '2017-10-14 17:08:00', '2017-10-14 17:08:00'),
(103, 1, 1, 'Neuer Ascher', 'Joa, Ich hab mal wieder getÃ¶pfert...  \nEin Mederius Aschenbecher ist draus geworden.  \nVielen Dank an Ivonne & Ullrich, die das Teil fÃ¼r mich glasiert haben.  \nDemnÃ¤chst mach ich noch mal welche fÃ¼r die neue Aschenbecherlinie von Asario.', '2017-10-29 12:56:00', 1, '2017-10-29 11:56:00', '2017-10-29 11:56:00'),
(104, 1, 1, 'VerÃ¤ndertes Layout', 'Ich hab mal wieder am Design von www.asario.de geschraubt.  \nHope you enjoy.  \nKritiken bitte per Comment oder PM...  \nBis bald, Asario', '2017-11-12 14:59:00', 1, '2017-11-12 13:59:00', '2017-11-12 13:59:00');
INSERT INTO `testfield` (`id`, `blog_categories_id`, `blog_authors_id`, `title`, `content`, `blog_date`, `markdown_on`, `created_at`, `updated_at`) VALUES
(105, 1, 1, 'Neue Galerie', 'Habe jetzt Photoswipe als Standard Galerie eingebaut. Da kann man zwischen den Bildern wischen. Der Chat hat eine Einladungsfunktion bekommen und ich habe einige Bugs beseitigt die noch so rumschwirrten. Hope U Like It :)', '2017-11-19 09:18:00', 1, '2017-11-19 08:18:00', '2017-11-19 08:18:00'),
(106, 1, 1, 'Endlich wieder Online', 'Endlich funktioniert mein Surf Stick wieder.  \nWar ein paar Wochen Offline :(  \nIch wÃ¼nsche schon mal ein Frohes Fest und einen gutem Rutsch ins neue Jahr.  \nHoffe 2018 wird noch besser als 2017.  \nBis bald, Paul aka Asario', '2017-12-20 09:10:00', 1, '2017-12-20 08:10:00', '2017-12-20 08:10:00'),
(107, 1, 1, 'Neue Monstar Pix', 'Ich habe ein paar neue Monstar Bilder hochgeladen und eine Shortstorie verÃ¶ffentlicht.  \nVielen Dank an Chinagirl & Ianosaurus.  \nViel Spass wÃ¼nscht Asario', '2018-01-28 09:17:00', 1, '2018-01-28 08:17:00', '2018-01-28 08:17:00'),
(108, 1, 1, 'Shortstories wird zu Shortpoems', 'Die Shortstorie Rubrik wurde in Shortpoems umbenannt.  \nNach wie vor kÃ¶nnt Ihr mir WÃ¶rter vorschlagen die ich dann zu kurzen Gedichten verarbeite.  \n  \nFreu mich schon auf eure Poem-VorschlÃ¤ge.', '2018-03-02 17:55:00', 1, '2018-03-02 16:55:00', '2018-03-02 16:55:00'),
(109, 1, 1, 'Neue Kamera', 'Ich habe mir zu Ostern eine neue Kamera geleistet.  \nEs ist eine Lumix TZ-71. Ich hoffe euch gefallen die Bilder die ich damit schiesse.  \nWÃ¼nsche euch einen schÃ¶nen FrÃ¼hling.  \n  \nIn Liebe, Asario', '2018-04-02 16:26:00', 1, '2018-04-02 14:26:00', '2018-04-02 14:26:00'),
(110, 1, 1, 'Neues Wallpaper @ Digital Galerie', 'Habe mal wieder ein Wallpaper kreiert. Ein grÃ¼nes mal wieder, denn GrÃ¼n ist die Hoffnung.  \nStay tuned, Asario', '2018-04-15 12:28:00', 1, '2018-04-15 10:28:00', '2018-04-15 10:28:00'),
(111, 2, 1, 'Frickeleien am Code', 'Habe auch dieses mal einiges verbessert.  \nIm Fokus stand die Google XML Scriptsammlung. Hier war einiges im argen aber ich konnte es richten, so das Google nur noch geÃ¤nderte Seiten aktualisieren muss.  \nHab ne Menge Hirnschmalz verbraucht um alles zum laufen zu bringen.  \n  \nAber es ist geschafft und ich bin Stolz auf meine Arbeit in die ich meine Feierabende investiert habe.  \n  \nHoffe Ihr genieÃŸt das schÃ¶ne Wetter.  \nIch geh jetzt raus mich sonnen.  \n  \nGRTZ from BimÃ¶hlen, Asario', '2018-04-18 19:32:00', 1, '2018-04-18 17:32:00', '2018-04-18 17:32:00'),
(112, 3, 1, 'Ein bisschen leer hier', 'Hab lange nix mehr hier rein geschrieben.  \nIch genieße das schöne Wetter in SH.  \nSonne Satt und das im April, fast wie letztes Jahr.  \n  \nMomentan plane ich Umbauarbeiten an MCS die ich bis zum Sommer 2018 abgeschloßen haben möchte.  \n  \nIst nur Organisatorischer Kram, aber der muss auch sein.  \n  \nBin echt zufrieden mit meiner Neuanschaffung, einer LUMIX TZ-71.  \ndas Studium des Handbuches steht auch noch auf meiner TODO-Liste.  \n  \nBin jetzt bei Seite 98 von 300. Aber ein paar Kamerafeatures sind echt gut.  \nMit freundlichen Grüßen, Asario', '2018-04-20 18:20:00', 1, '2018-04-20 16:20:00', '2018-04-20 16:20:00'),
(113, 1, 1, 'Mein Smartphone', 'Ich habe kÃ¼rzlich von einer netten Kollegin ein Smartphone fÃ¼r gÃ¼nstig ersteigert.  \nMusste jetzt auf allen Seiten meine Telefonnummer Ã¤ndern...  \nAber bis jetzt funktioniert das Internet noch nicht :(.  \nNaja, gut ding will Weile haben.', '2018-04-29 10:49:00', 1, '2018-04-29 08:49:00', '2018-04-29 08:49:00'),
(114, 1, 1, 'LayoutverÃ¤nderung 2.0', 'Habe am Grundlayout von Asarios Blog gearbeitet.  \nist auf MobilgerÃ¤ten besser zu benutzen das neue Layout.  \nHoffe Ihr habt SpaÃŸ damit.  \n  \nWÃ¼nsche einen schÃ¶nen Mai, Asario.', '2018-05-01 18:53:00', 1, '2018-05-01 16:53:00', '2018-05-01 16:53:00'),
(115, 1, 1, 'Neue Rubrik', 'Habe eine neue Rubrik auf meiner Seite veröffentlicht, sie heißt Did You Know und beschäftigt sich mit Unnützem Wissen.  \n  \nAber manchmal ist ne wissenswerte Info dabei.  \n  \nWünsche viel Spaß mit der Seite, Asario', '2018-05-06 11:01:00', 1, '2018-05-06 09:01:00', '2018-05-06 09:01:00'),
(116, 1, 1, 'Neue Wissensfragen auf DidYouKnow', 'Habe mal wieder ein paar Fragen online gestellt.  \nHoffe die sind lehrreich.  \nAußerdem kann man im PM Schreiben Menü jetzt nach Benutzern suchen.  \n  \nBis denne Penne, ich liebe Nudeln und gut.  \nAsario tut was er tut.', '2018-05-13 10:02:00', 1, '2018-05-13 08:02:00', '2018-05-13 08:02:00'),
(117, 1, 1, 'Mein 35ter Geburtstag', 'Herzlichen Glühstrumpf Asario.  \nWieder 1 Jahr älter geworden...  \nHabe mich selber schon am Samstag beschenkt.  \n1 Bluetooth Kopfhörer hab ich mir geleistet (von Sony).  \nSind vom Klang her 1te Sahne Sitzen gut und Halten lange.  \n  \nKleine Änderung an der Seite...  \nIch habe die Fineliner Galerien 1-7 in eine Fineliner Galerie verpackt.  \n  \nIn diesem Sinne, habt Spaß, Asario', '2018-06-17 09:29:00', 1, '2018-06-17 07:29:00', '2018-06-17 07:29:00'),
(118, 1, 1, 'Neuigkeiten auf Asarios Blog', 'Ab Jetzt habe ich die Photos Galerien in eine verpackt.  \nAlso statt Photos1/Photos2/Photos3/... nur noch Photos.  \nAußerdem haben sich letzte Woche ein paar DidYouKnow Fragen angesammelt.  \nWünsche euch viel Spaß auf meiner Seite.  \nIn Love, Asario.', '2018-06-30 08:38:00', 1, '2018-06-30 06:38:00', '2018-06-30 06:38:00'),
(119, 2, 1, 'MCS Version 2.87 Published', 'Just in diesem Moment habe ich ein neues Release fertiggestellt.  \nVersion 2.87 enthält einige neue Features und Verbesserungen.  \nZu den Features gehören ein verbessertes Admincenter mit Autopublisher sowie ein Script welches die Einträge auf Seiten verteilt.  \n  \nDesweiteren wurden etliche kleine Bugs beseitigt und es wurde ein Double Opt Out für meinen Asarios Blog Newsletter eingerichtet.  \n  \nWünsche viel Spaß mit diesem Release.  \n  \nIn Love, Asario', '2018-08-10 11:13:00', 1, '2018-08-10 09:13:00', '2018-08-10 09:13:00'),
(120, 1, 1, 'Neue Fotos und neue MCS Version', 'Ich habe unter Photos neue Bilder hochgeladen und gleichzeitig eine neue MCS Version installiert.  \nIst ein grosses Release geworden, mit vielen Verbesserungen.  \nAm Newsletter arbeite ich noch... da steckt noch Potenzial drin.  \nWeitere Infos siehe Devlog oder im Changelog auf www.marblefx.de/changelog', '2018-08-10 20:02:00', 1, '2018-08-10 18:02:00', '2018-08-10 18:02:00'),
(121, 1, 1, 'Neues PM Layout, Stats und MCS-Newsletter', 'Habe am Layout der PM\'s in Asarios Blog gearbeitet.  \nDas Backend ist jetzt auch im MCS 2.87 Layout gestyled  \nHat mich ne Menge Arbeit gekostet, fügt sich jetzt aber besser ins Gesamtbild ein.  \n  \nDer fleißige Newsletterleser kommt jetzt zu Punkten.  \nIn Jedem neuen Newsletter steckt ein Link mit dem sich ab sofort MCS-Points sammeln lassen.  \n  \nMusste deswegen auch die Statistiken erweitern  \n  \nAußerdem hab ich seit den letzten news mal wieder ein paar Did You Know Fragen geupped.  \nHope you enjoy it, Asario', '2018-08-23 17:11:00', 1, '2018-08-23 15:11:00', '2018-08-23 15:11:00'),
(122, 1, 1, 'Monstar in D&auml;nemark', 'Mein Monstar hat nach einem Trip durch Dänemark mir seine Selfies geschickt.  \nSind paar nette Bilder dabei. Vielen Dank an Nitropower für die Übermittlung der Bilder.  \nAch ja, ich arbeite zur Zeit an einem Ausmalbild namens Italia.  \nHope you enjoy, Asario', '2018-09-15 20:23:00', 1, '2018-09-15 18:23:00', '2018-09-15 18:23:00'),
(123, 1, 1, 'Kommentaren Folgen', 'Ab Jetzt könnt ihr bestimmten Kommentaren folgen.  \nEinfach beim schreiben aktivieren und ihr verpasst keine Diskussion mehr.  \nHoffe euch gefällt das Feature und nutzt es auch kräftig.  \nBis bald, Asario', '2018-09-26 17:45:00', 1, '2018-09-26 15:45:00', '2018-09-26 15:45:00'),
(124, 1, 1, 'Neuer Button unter Images', 'Es ist ein neuer Button unter Images dazugekommen.  \nunter Voter könnt Ihr nachsehen wer wie viel Punkte vergeben hat.  \nAus der Blackbox ist eine Whitebox Anwendung geworden.', '2018-10-21 16:48:00', 1, '2018-10-21 14:48:00', '2018-10-21 14:48:00'),
(125, 0, 1, 'LCD, LED, OLED, Plasma - Inwiefern unterscheiden sich TV-Geräte?', 'Das Grundprinzip der Darstellung von Bildern ist bei den verschiedenen Varianten von modernen Fernsehern gleich. Was wir auf dem Monitor sehen können, setzt sich aus unzähligen Pixeln zusammen. Der Unterschied besteht hauptsächlich in der Erzeugung der Bildpunkte.  \r\n  \r\nLCD, LED - Was bedeuten diese Abkürzungen?  \r\n  \r\nAlle diese Akronyme stammen aus dem Englischen. LCD bedeutet ausgeschrieben \"liquid crystal display\", zu deutsch Flüssigkristallanzeige. In LC-Monitoren werden die namensgebenden, halbdurchsichtigen Flüssigkristalle dafür eingesetzt, die Menge an durchgelassenem Licht zu kontrollieren. Dafür ändern sie ihre Ausrichtung. Die Kristalle befinden sich zwischen zwei sogenannten Polarisationsfilter.  \r\n  \r\nLED- und OLED-Fernseher nutzen ebenfalls Flüssigkristrallanzeigen. Hier bezieht sich die Abkürzung auf die Art der Beleuchtung. TV-Geräte mit der \"light-emitting diode\"-Technologie sind heutzutage die Norm und sind flacher als LCD-Fernseher mit Leuchtstoffröhren. LED bedeutet übersetzt Leuchtdiode.  \r\n  \r\nPlasmafernseher - eine Nummer teurer?  \r\n  \r\nIn einem Plasmafernseher wird das Bild durch Edelgase erzeugt, die in Kammern zwischen zwei Glasplatten liegen. Plasmen senden aufgrund von quantenhaften Emissionen Strahlung, unter anderem in Form von sichtbarem Licht, aus. Da das Licht vom Gas kommt, und keine Hintergrundbeleuchtung wie beim LCD eingesetzt wird, sind sowohl Schwarzwerte, als auch der Kontrast besser. Bisher galten sie außerdem als reaktionsschneller. Sie sind allerdings deutlich teurer in der Anschaffung als LCD-Fernseher. Plasmafernseher verbrauchen desweiteren mehr Energie. Daher haben sie sich auf dem Markt kaum durchgesetzt.  \r\n  \r\nOLED - die Zukunft?  \r\n  \r\nOLED-Fernseher verwenden organische Leuchtdioden, die von selbst verschiedene Farben darstellen. Diese können sehr platzsparend verbaut werden und bieten eine bessere Bildqualität und Räumlichkeit. OLED-Geräte sind allerdings noch sehr teuer in der Herstellung. Langfristig wird sich diese Technologie aber durchsetzen können, da sie die Vorteile von herkömmlichen LCDs und Plasmafernsehern vereint.  \r\n  \r\nBei der Kaufentscheidung sollten Sie sich genau über das gewünschte Produkt informieren, beispielsweise [auf www.fernseher24.com.](http://www.fernseher24.com/) Vor allem Ihr Budget eine große Rolle. Ob es der gebrauchte Samsung-Fernseher im Angebot aus der letzten Generation oder ein neuer ultra hochauflösender OLED-Fernseher wird, entscheidet auch Ihr Geldbeutel.  \r\nvon Melanie Unger (www.fernseher24.com)', '2018-10-21 19:16:00', 1, '2018-10-21 17:16:00', '2018-10-21 17:16:00'),
(126, 1, 1, 'Neuer Slider auf News Seite.', 'Wie Ihr seht, hab ich den Slider auf der Newsseite verändert.  \nHope you enjoy, Asario', '2018-11-25 09:16:00', 1, '2018-11-25 08:16:00', '2018-11-25 08:16:00'),
(127, 1, 1, 'Neues Feature auf Images Seite', 'Unter [Ausgemaltes](ausgemaltes) könnt Ihr ab jetzt den Fortschritt über Artworks in einem Slider sehen. So sieht man die einzelnen Schritte der Bilder.', '2018-12-02 09:55:00', 1, '2018-12-02 08:55:00', '2018-12-02 08:55:00'),
(128, 1, 1, 'Neues unter DidYouKnow', 'Ich habe mal wieder ein paar Wissenshäppchen verteilt. Ich hoffe sie sind lehrreich.  \nIhr findet sie unter [DidYouKnow](didyouknow).  \nAußerdem ist ein neues Release von MCS veröffentlicht worden.  \nViel Spaß damit, euer Asario.', '2018-12-09 10:16:00', 1, '2018-12-09 09:16:00', '2018-12-09 09:16:00'),
(129, 1, 1, 'Merry Christmas Folks', 'Auch euch ein schönes Weihnachtsfest mit hoffentlich vielen Geschenken.  \nIch werde dieses Weihnachten mit meiner Familie in Potsdam/Berlin feiern.  \nAlles gute aus meiner Heimat, Asario.', '2018-12-20 18:12:00', 1, '2018-12-20 17:12:00', '2018-12-20 17:12:00'),
(130, 1, 1, 'Frohes Neues Freunde', 'Ich wünsche allen ein frohes Neues 2019.  \nHoffe ihr seid gut reingerutscht und habt ordentlich gefeiert.  \nIch habe Sylvester in Bimöhlen verbracht, war ruhig so weit man das sagen kann...', '2019-01-01 10:41:00', 1, '2019-01-01 09:41:00', '2019-01-01 09:41:00'),
(131, 1, 1, 'Neue Kunstwerke gesichtet', 'Ich habe unter <a href=\\\"ausgemaltes\\\">Images->Ausgemaltes</a> ein Bild fertiggestellt, sowie unter <a href=\\\"acryl\\\">Images->Acryl</a> ein neues Bild angefangen.  \n  \nHoffe Ihr mögt die Motive, in love, Asario', '2019-02-22 16:16:00', 1, '2019-02-22 15:16:00', '2019-02-22 15:16:00'),
(132, 1, 1, 'F&uuml;r alle Apfel Nerds und 4K Nutzer', 'Dank einer kleineren Änderung im Galerie Script bekommen alle mit 4K Displays jetzt hochaufgelöstes Material zu Gesicht. Wenn Ihr Monitor mehr als 2000 Pixel in der Breite hat werden die Retina Versionen der Bilder geladen.  \n  \nViel Spaß damit, euer Asario', '2019-03-24 15:19:00', 1, '2019-03-24 14:19:00', '2019-03-24 14:19:00'),
(133, 1, 1, 'Monstarz United', 'Ab Sofort sind die Galerien Monstarz und Monstarnational in die Galerie Monstarz überführt worden.  \nAnsonsten hat sich nix verändert. Hoffe euch gefallen die neuen alten Bilder.  \n  \nIn Love, Asario.', '2019-03-29 16:04:00', 1, '2019-03-29 15:04:00', '2019-03-29 15:04:00'),
(134, 1, 1, 'Frohe Ostern', 'Ich wünsche euch frohe Ostern. Hoffe Ihr seid gut reingerutscht :).  \nDie Lämmer stehen auf der Weide, auch wenn ich sie heute nicht reite, stehen Sie immer noch da und das trotz großer Gefahr.  \n  \nAch ja,eh ichs vergesse, ich habe ein Easter Egg versteckt auf meiner Seite, wer es findet kann 15 MCS Points einstreichen, Viel Spaß beim suchen.  \nDie Easter Egg Aktion gilt noch bis 30.4.2019.  \n  \nWeiterhin viele grüße aus dem sonnigen Bimöhlen, Asario', '2019-04-20 13:28:00', 1, '2019-04-20 11:28:00', '2019-04-20 11:28:00'),
(135, 1, 1, 'Besuch bei meinem kleinem Neffen', 'Ich habe letztes Wochenende zum ersten mal meinen Neffen im Arm halten können.  \nEcht süß der kleine Racker. Alfred, so heißt er ist ein echt süßes Baby.  \nMit einem Kampfgewicht von 4290 g und einer Körperlänge von 56 cm war das ein ganz schöner Brocken. Aber er ist gesund und munter, was die Hauptsache ist.  \n  \nAußerdem habe ich ein Wallpaper mit Alfred verschönert.  \nUnd ich habe die Prämien verändert. Viele Artworks sind jetzt mit noch weniger Punkten zu haben. Viel Spaß beim posten & bewerten.', '2019-05-27 11:16:00', 1, '2019-05-27 09:16:00', '2019-05-27 09:16:00'),
(136, 1, 1, 'Anubis fast fertig', 'Mein Gold Anubis ist auf der Zielgerade angekommen.  \nEin paar Details an der Schnauze müssen noch gemacht werden, ansonsten ist er Fertig.  \nMein bisher aufwendigstes Kunstwerk nähert sich der Fertigstellung.', '2019-06-23 08:40:00', 1, '2019-06-23 06:40:00', '2019-06-23 06:40:00'),
(137, 1, 1, 'MCS Doku Multi-Language', 'Ich überarbeite zur Zeit die MCS Dokumentation.  \nWenn ich alle Texte übersetzt und alle Grafiken überarbeitet habe kann jeder der Englisch versteht die Dokumentation zu rate ziehen falls man mal etwas nicht weiß.  \nIch hoffe meine Englischen Fans danken es mir.', '2019-06-30 13:22:00', 1, '2019-06-30 11:22:00', '2019-06-30 11:22:00'),
(138, 1, 1, 'Anubis fertig', 'Endlich, nach 24 Tagen der Arbeit ist Anubis auf der Zielgerade angekommen.  \nVielen Dank noch mal an Sigi für die Hilfe bei diesem Bild. Ohne dich hätte ich das nie geschafft.  \n  \nWer Interesse an diesem Kunstwerk hat, im Kunsthaus in Rickling ist es ausgestellt.', '2019-09-06 15:58:00', 1, '2019-09-06 13:58:00', '2019-09-06 13:58:00'),
(139, 1, 1, 'Shariff Online', 'Ich habe auf meinem Blog mittlerweile Datenschutzkonforme Social Media Links installiert.  \nMit Shariff werden erst dann Daten ans Soziale Netzwerk geschickt wen jemand den Link anclickt. Ich wünsche viel Spaß beim Teilen meiner Inhalte.', '2019-09-15 10:34:00', 1, '2019-09-15 08:34:00', '2019-09-15 08:34:00'),
(140, 1, 1, 'Neue Folgen Funktion', 'Ab Sofort kann jeder registrierte sowie externe Kommentaren Folgen.  \nDie Funktion war zwar schon halbwegs integriert, aber ich hab das ganze noch mal aufgebohrt und verbessert.  \n  \nNach dem Login oder der Eingabe der E-Mail Adresse kann man einem Kommentar folgen, So weit so simpel, aber der Teufel steckt wie immer im Detail.  \n  \nFür alle Members, die Standard Einstellung beim folgen ist folgen per E-mail.', '2019-10-03 09:08:00', 1, '2019-10-03 07:08:00', '2019-10-03 07:08:00'),
(141, 1, 1, 'Merry Christmas and a happy New Year', 'Auch dieses Jahr geht zu ende und wir haben viel geschafft.  \nIch hoffe der Vorweihnachtsstress hat euch nicht davon abgehalten die besinnliche Zeit zu genießen .  \n  \nIch wünsche allen die dies Lesen ein frohes Fest zu Feiern.  \nUnd rutscht gut rein....', '2019-12-23 23:59:00', 1, '2019-12-23 22:59:00', '2019-12-23 22:59:00'),
(142, 1, 1, 'Gut reingerutscht?', 'Auch dieses mal lassen wir ein Jahr voller Erlebnissen und Ereignissen hinter uns.  \nLiebe, Job und Gesundheit sollen in diesem Jahr besser werden sagte mir der Experte Prof. Dr. As-Ario kürzlich in einem Interview zum neuen Jahr.  \n  \nViel Glück, Leute.', '2019-12-28 17:54:00', 1, '2019-12-28 16:54:00', '2019-12-28 16:54:00'),
(143, 1, 1, 'Zwei Faktor Authentifizierung auf Asarios Blog', 'Ab jetzt könnt Ihr euch mit euren Yuby/Solo Keys sicher einloggen.  \nHabe jetzt fast 3 Wochen an dem Script gearbeitet, aber es lohnt sich.  \nSicherheit ist für mich und meine Freunde wichtig so dass ich eine Fido2 kompatible Schnittstelle erschaffen wollte.  \n  \nHoffe Ihr genießt den Komfort der 2 Faktor Authentifizierung.  \n  \nEhe ich\'s vergesse, hab mal wieder nen paar Wissenshappen unter DidYouKnow verteilt.', '2020-01-12 13:47:00', 1, '2020-01-12 12:47:00', '2020-01-12 12:47:00'),
(144, 1, 1, 'Ich verlasse Bim&ouml;hlen', 'Nächste Woche ziehe ich aus Mederius in Bimöhlen aus.  \nDie letzten 12 Jahre vergingen im Flug und ich freue mich auf meinen nächsten Schritt in Richtung Selbständigkeit. Ich ziehe in eine Teilstationäre WG in Bad Segeberg, gleich um die Ecke von meiner Arbeit.  \n  \nIch Spare mir dann 2 Stunden pro Arbeitstag an Fahrerei.  \nAllerdings muss ich trotzdem mehr machen, wie Kochen und Putzen.  \n  \nIch bin schon sehr aufgeregt und freue mich.', '2020-02-23 16:06:00', 1, '2020-02-23 15:06:00', '2020-02-23 15:06:00'),
(145, 1, 1, 'Willkommen SE', 'Herzlich Willkommen in Bad Segeberg.  \nIch bin gelandet und melde mich aus dem lauschigen Bad Segeberg.  \nNoch hab ich einige Kartons die ich auspacken muss, aber das wird schon.  \nIch habe die ersten Nächte hinter mir und es schläft sich gut im meinem neuem Bett.  \nGrüße aus meinem Homeoffice, Asario 8)', '2020-03-04 15:47:00', 1, '2020-03-04 14:47:00', '2020-03-04 14:47:00'),
(146, 1, 1, 'Neue Bilder gesichtet', 'Auch dieses mal hab ich mich kreativ betätigt und 2 neue Fineliner Bilder gemalt.  \nHoffe sie gefallen euch, in love, Asario', '2020-08-16 13:52:00', 1, '2020-08-16 11:52:00', '2020-08-16 11:52:00'),
(147, 1, 1, 'Neues Layout auf Asario.de', 'Herzlich willkommen im grey theme von Asarios Blog.  \nHoffe ihr findet das Layout auch so gut wie ich.  \nIst nur wenig anders aber doch anders.  \nHabt Spaß und kommentiert fleißig.  \nIn Love, Asario', '2020-09-06 17:51:00', 1, '2020-09-06 15:51:00', '2020-09-06 15:51:00'),
(148, 1, 1, 'Frohes Neues', 'An alle Freunde und Bekannte, Ich wünsche ein frohes neues 2021.  \nHoffe Ihr seid gut reingerutscht und habt die Feiertage auch im kleinem Rahmen genießen können. Ich wünsche euch allen das Ihr gesund und munter das neue Jahr verlebt.  \n  \nAuf ein schönes, gesundes 2021, Asario', '2021-01-01 00:32:00', 1, '2020-12-31 23:32:00', '2020-12-31 23:32:00'),
(149, 1, 1, 'Back in town...', 'Lange nix mehr gepostet. War jetzt fast ein Halbes Jahr in der Klinik und bin froh wieder hier in Bad Segeberg zu sein.  \nHabe während meines Aufenthalts viel gemalt wie man unter [Images->Fineliner](fineliner) erkennen kann.', '2021-08-12 13:14:00', 1, '2021-08-12 11:14:00', '2021-08-12 11:14:00'),
(150, 1, 1, 'Zur&uuml;ck im beschaulichen Bim&ouml;hlen', 'Bin wieder im Lande angekommen.  \nAuf dem Dorf hier ist es ruhiger und ich kann Regenerieren und Entspannen.  \nHab in meinem letztem Aufenthalt einiges Kreatives Produziert und hoffe euch gefallen die Bilder auch so gut wie mir.', '2021-10-09 20:19:00', 1, '2021-10-09 18:19:00', '2021-10-09 18:19:00'),
(151, 2, 1, 'Neues von MCS', 'Hallo und willkommen auf meinem Blog in der Rubrik Devlog.  \n  \nMCS hat wieder einiges dazugelernt und es sind einige Fehler behoben worden.  \n  \nWenn alles gut geht werde ich demnächst eine neue Seite Coden. Es dreht sich um Kunst, soviel kann ich schon mal sagen.  \n  \nWar ne Zeit lang ohne Internet und konnte somit nichts Posten.  \n  \nWünsche viel Spaß auf [www.asario.de](https://www.asario.de)', '2021-10-09 23:14:00', 1, '2021-10-09 21:14:00', '2021-10-09 21:14:00'),
(152, 1, 1, 'Merry X-Mas 2021', 'Ich wünsche euch ein Frohes Fest.  \nHoffe es gab lecker Essen und Trinken zu Weihnachten.  \nIch habe gestern die 3te von 9 Leinwänden für mein Großprojekt fertig gestellt.  \nEl Novem ist noch in Arbeit aber sieht relativ geil aus.', '2021-12-25 10:42:00', 1, '2021-12-25 09:42:00', '2021-12-25 09:42:00'),
(153, 1, 1, 'Neues Feature', 'Hab mal an den Image Starz gearbeitet. Jetzt besser am Smartphone und 1 klick weniger.  \nHoffe Ihr habt spaß mit den Sternen.  \nAnsonsten freu ich mich auf meine baldige Boosterung, so das ich bald wieder arbeiten gehen kann.', '2022-02-15 12:15:00', 1, '2022-02-15 11:15:00', '2022-02-15 11:15:00'),
(154, 1, 1, 'Solidarit&auml;t mit der Ukraine', 'Ich wünsche allen UkrainerInnen da draußen das der Krieg bald vorüber geht.  \n  \nKrieg ist eins der schlimmsten, wenn nicht das schlimmste auf diesem Planeten,  \nund wir hoffen das dieser Krieg bald endet.  \n  \nIn Frieden, Asario', '2022-04-27 19:13:00', 1, '2022-04-18 22:00:00', '2022-04-18 22:00:00'),
(155, 1, 1, '3D Printer Objekte', 'Happy Birthday to me.  \nHabe meinen 3D Drucker in Betrieb genommen und mal was Künstlerisches gedruckt.  \nEs ist ein Relief erstellt und mit PLA gedruckt worden.  \nDer Druck dauerte zwar fast 3 Stunden, aber es hat sich gelohnt, wie ich finde.  \n  \nHope you enjoy, Asario', '2022-06-19 15:15:00', 1, '2022-06-28 22:00:00', '2022-06-28 22:00:00'),
(156, 2, 1, 'Neuerungen im System', 'habe mal wieder am Image Upload Script gearbeitet, und einiges Verbessert.  \r\n  \r\nAb jetzt kann man in einer Galerie die Reihenfolge der Bilder per Drag & Drop ändern.  \r\nAußerdem mal wieder etliche kleinere und größere Bugs behoben.  \r\nWünsche viel Spaß bei meinen Seiten.  \r\nCincerly Paul Rieser aka. Asario', '2022-10-09 11:14:00', 1, '2022-10-09 09:14:00', '2022-10-09 09:14:00'),
(157, 1, 1, 'Neues aus PLA', 'Mein 3D Drucker l&auml;uft warm und hat mir die Galerie [3D Printer](3DPrinter) erm&ouml;glicht. Hoffe euch gefallen die Drucke.', '2022-11-05 15:56:00', 1, '2022-11-05 14:56:00', '2022-11-05 14:56:00'),
(158, 1, 1, 'Happy 2023', 'Hoffe Ihr seid gut reingerutscht und habt das neue Jahr gut starten können.  \nHabe mal wieder an der Sicherheit von MCS gearbeitet.  \nWünsche viel Spaß auf meinen Seiten / meiner Seite.', '2023-01-22 14:07:00', 1, '2023-01-22 13:07:00', '2023-01-22 13:07:00'),
(159, 1, 1, 'Winter in town', 'Es ist kalt geworden und der Winter hat uns fest im Griff.  \r\nIch hoffe, ihr m&uuml;sst nicht raus, es ist  sehr  kalt.  \r\nHabe wieder ein paar Bugs gefunden und beseitigt.  \r\nCiao, Asario', '2023-01-27 19:03:00', 1, '2023-01-27 18:03:00', '2023-01-27 18:03:00'),
(160, 2, 1, 'Winter Update', 'Auch in diesem Jahr war ich fleissig und habe einiges verbessert.  \r\nDie Google Sitemap wurden überarbeitet und verschönert.  \r\nDesweiteren sind diverse Sicherheitsmechanismen umgesetzt worden.  \r\nBugs waren auch einige dabei, alle behoben.  \r\nHoffe ihr habt spass auf meinen Seiten.', '2023-02-04 13:05:00', 1, '2023-02-04 12:05:00', '2023-02-04 12:05:00'),
(161, 1, 1, 'Frohe Ostern 2023', 'Ostern ist eine Zeit der Erneuerung, der Freude und der Hoffnung, und in diesem Jahr ist es ein besonders bedeutungsvolles Fest, da wir die Herausforderungen des vergangenen Jahres hinter uns lassen und in eine bessere Zukunft blicken.  \nIn diesem Sinne, Frohe Ostern, Asario', '2023-02-13 09:56:00', 1, '2023-02-13 08:56:00', '2023-02-13 08:56:00'),
(162, 1, 1, 'Fr&uuml;hling', 'Das Ende des Winters bringt eine Ver&auml;nderung mit sich, da der Schnee zu schmelzen beginnt und die Natur aus dem Winterschlaf erwacht. Die Temperaturen werden w&auml;rmer und die Tage l&auml;nger.  \r\nIch hoffe ich komme bald mal wieder nach Eekholdt, weil es dort sch&ouml;n ist wenn die Sonne zu scheinen beginnt. AuÃ?erdem ist Eekholdt gleich um die Ecke und immer einen Besuch wert.', '2023-02-22 16:10:00', 1, '2023-02-22 15:10:00', '2023-02-22 15:10:00'),
(163, 2, 1, 'Verbesserte Feeds', 'Ich habe Asarios Blog\'s Newsfeed-Funktion verbessert, um sie effizienter und benutzerfreundlicher zu gestalten. Der Newsfeed lädt jetzt schneller, und seit kurzem auch in Englisch verfügbar.  \r\n  \r\nMomentan arbeite ich noch an der Einbindung von Bildern in den Feeds.  \r\n  \r\nNichts desto trotz waren wieder ein paar kleinere Bugs zu beheben die ich kürzlich gefixt habe.Und da alles gut läuft freue ich mich auf kommende Spannende Features die noch entwickelt werden wollen.', '2023-03-11 13:03:00', 1, '2023-03-11 12:03:00', '2023-03-11 12:03:00'),
(164, 2, 1, 'Neue Sterne', 'Neue Sterne\r\nIch habe an den Bildbewertungen gearbeitet. Wenn die Sterne halbtransparent sind wurden sie noch nicht bewertet. Sind die Sterne Vollgelb/Rot so hat man die Bilder schon bewertet.\r\nMarkdown wurde auch aktiviert und ist zunächst zu Testzwecken auf www.asario.de installiert.\r\nAlles in allem ist **MCS** wieder einen Schritt weiter gekommen und ich habe den einen oder anderen Bug behoben.\r\nIch hoffe ihr habt Spaß, Asario', '2023-05-07 10:42:00', 1, '2023-05-07 08:42:00', '2023-05-07 08:42:00'),
(165, 1, 1, 'Sommer 2023', 'Auch in diesem Quartal habe ich wieder einige Änderungen vorgenommen.\r\nMarkDown hat Einzug in MCS gehalten und die Bildbewertung wurde überarbeitet.\r\nDer Cookie-Banner wurde komplett neu geschrieben und verbessert. Man kann nun im Detail sehen, was für welchen Zweck gesammelt wird.\r\nDie Bildberbewertung auf asario.de habe ich etwas verändert.\r\nWenn die Sterne halb gelb sind, hat man noch nicht bewertet, wenn sie ganz gelb sind, wurden schon Sterne vergeben.\r\nAußerdem habe ich wieder ein paar kleine Fehler behoben, die mir im Laufe der Zeit aufgefallen sind.\r\n\r\n\r\nIch wünsche euch einen sonnigen Sommer, bis bald, Asario.', '2023-05-29 12:02:00', 1, '2023-05-29 10:02:00', '2023-05-29 10:02:00'),
(166, 1, 1, 'Sp&auml;tsommer 2023', 'ich m&ouml;chte gerne meine neuesten Entwicklungen mit euch teilen, denn auch in dieser Jahreszeit gibt es bei mir etwas Neues zu berichten. Ihr erinnert euch vielleicht an das Rangi Goat, welches eine Zeit lang verschwunden war. Nun freue ich mich, euch mitteilen zu k&ouml;nnen, dass es wieder aufgetaucht ist und sich auf den Weg nach Berlin gemacht hat! Das ist wirklich aufregend und ich bin gespannt, welche Abenteuer ihn dort erwarten.\r\n\r\nIch habe in den letzten Tagen und Wochen hart gearbeitet, um einige kleinere Bugs zu beheben und Verbesserungen an meinen Seiten vorzunehmen. Es war eine Herausforderung, aber es hat sich definitiv gelohnt. Ich m&ouml;chte, dass ihr als Besucher ein optimales Erlebnis habt und euch auf meinen Seiten wohlf&uuml;hlt. Deshalb ist es mir wichtig, diese technischen H&uuml;rden aus dem Weg zu r&auml;umen und das Beste aus meinen Websites herauszuholen.\r\n\r\nIch freue mich auf die kommenden Wochen und Monate und hoffe, dass ihr weiterhin mit mir auf meiner Reise seid. Eure Unterst&uuml;tzung und Begeisterung bedeuten mir alles. Lasst uns gemeinsam diese aufregende Zeit genieÃ?en und viele unvergessliche Momente teilen.\r\n\r\nHoffe Ihr habt SpaÃ? auf meinen Seiten, in Love, Asario', '2023-07-22 15:38:00', 1, '2023-07-22 13:38:00', '2023-07-22 13:38:00'),
(167, 1, 1, 'Herbst 2023', 'Hallo zusammen!\r\n\r\nIch habe unserem Datei-Upload-Skript ein frisches Aussehen verpasst und lästige Fehler behoben, damit der Upload so reibungslos wie nie zuvor verläuft. Die gemütlichen Vibes des Herbstes begleiten nun eure Uploads.\r\n\r\nEine benutzerfreundliche Oberfläche ermöglicht es Nutzern, Inhalte schnell hochzuladen, zu organisieren und anzuzeigen, ohne technisches Fachwissen zu benötigen. Dies spart Zeit und Mühe bei der Verwaltung von Dateien/Bildern und erleichtert die Fokussierung auf die eigentliche Inhaltsproduktion.\r\n\r\nInsgesamt bietet das neu gestaltete Upload-Skript eine verbesserte Benutzererfahrung und trägt dazu bei, den Arbeitsablauf bei der Erstellung und Verwaltung von Inhalten zu optimieren.\r\n\r\n Ich wünsche euch einen wunderschönen Herbst voller Wärme und Freude.', '2023-08-21 15:27:00', 1, '2023-08-21 13:27:00', '2023-08-21 13:27:00'),
(168, 1, 1, 'Winter & 2fa', 'Der Winter h&uuml;llte die Welt in ein schneewei&szlig;es M&auml;rchen. Schlittenfahrten und fr&ouml;hliche Abenteuer auf den H&uuml;geln lieÃ?en uns den Zauber der kalten Tage sp&uuml;ren. Abends verlagerte sich die Magie vor den heimischen Kamin, wo das Knistern des Feuers und wohlige W&auml;rme gem&uuml;tliche Stunden bescherten.\n\n**Natur und Gemeinschaft:**\nDie verschneite Landschaft und klirrend kalte N&auml;chte schufen eine bezaubernde Kulisse. Gleichzeitig lieÃ?en Nachbarschaftshilfe und winterliche Aktivit&auml;ten eine wohltuende Gemeinschaft entstehen. Dieser Wintermonat wurde zu einer Zeit der inneren Einkehr, kulinarischer Freuden und Vorfreude auf das Erwachen der Natur im kommenden Fr&uuml;hling.\n\n**Zwei-Faktor-Authentifizierung Update f&uuml;r Asario.de:**\n\nWir freuen uns, Ihnen mitteilen zu k&ouml;nnen, dass Asario.de jetzt OTP (One-Time Passwords) unterst&uuml;tzt, um Ihren Login noch sicherer zu gestalten. Diese Funktion finden Sie in den Profil-Einstellungen unter **2FA aktivieren**.\n\nZus&auml;tzlich haben wir die M&ouml;glichkeit integriert, Ihre Kontowiederherstellungscodes direkt in Ihrem Benutzerprofil zu verwalten. Diese zus&auml;tzliche SicherheitsmaÃ?nahme gew&auml;hrleistet ein hohes Sicherheitsniveau\nBitte beachten Sie: Geben Sie die Codes niemals an andere weiter. Wir werden Sie niemals nach den 2fa-Codes fragen.\nBei Fragen oder Anliegen stehen wir Ihnen jederzeit zur Verf&uuml;gung.', '2023-09-30 17:05:00', 1, '2023-09-30 15:05:00', '2023-09-30 15:05:00'),
(169, 1, 1, 'Halloween 2023', 'Halloween ist die Zeit des Jahres, in der wir uns erlauben, ein wenig Verr&uuml;cktheit und Grusel in unser Leben zu bringen. Ganz gleich, ob du eine schaurige Party feierst oder einfach nur vor der Haust&uuml;r sitzt und die Vorbeigehenden bewunderst, es ist eine Gelegenheit, sich zu gruseln und zu lachen. Also, schnapp dir dein Kost&uuml;m und mach dich bereit f&uuml;r eine unvergessliche Halloween-Nacht!', '2023-10-31 21:02:00', 1, '2023-10-31 20:02:00', '2023-10-31 20:02:00'),
(170, 2, 1, 'Update zur Zwei-Faktor-Authentifizierung', 'ich freue mich, Ihnen mitteilen zu können, dass wir hart daran gearbeitet haben, unser Zwei-Faktor-Authentifizierungssystem zu verbessern. Ab sofort steht Ihnen eine großartige Funktion zur Verfügung: Wiederherstellungscodes! Für den Fall, dass Ihr Handy einmal nicht verfügbar ist, können Sie diese Codes nutzen, um sich einzuloggen.\r\n\r\nNach der Aktivierung der Zwei-Faktor-Authentifizierung zeigt Ihnen die Seite Ihre persönlichen Wiederherstellungscodes an. Sie finden diese in Ihrem Benutzerprofil unter Profil-Einstellungen außerdem über dem \"Wiederherstellungscodes\"-Button.\r\n\r\nFür eventuelle Fragen oder Unterstützung stehen wir Ihnen gerne zur Verfügung. Bitte beachten Sie: Geben Sie diese Codes niemals an andere weiter. Sicherheit hat bei uns oberste Priorität!\r\n\r\nMit freundlichen Grüßen, Asario', '2023-11-22 16:01:00', 1, '2023-11-21 23:00:00', '2023-11-21 23:00:00'),
(171, 1, 1, 'Frohe Weihnachten 2023', 'Die festliche Jahreszeit ist angebrochen, und mit jedem Tag w&auml;chst die Vorfreude auf das Weihnachtsfest. In den geschm&uuml;ckten StraÃ?en und liebevoll dekorierten H&auml;usern spiegelt sich die warme Atmosph&auml;re dieser besonderen Zeit wider. Gemeinschaft steht im Mittelpunkt, sei es bei der Auswahl von Geschenken, dem Zubereiten k&ouml;stlicher Mahlzeiten oder dem Teilen von Traditionen.\r\n\r\nWeihnachten ist mehr als nur ein festlicher Anlass; es ist eine Zeit der Besinnung. Inmitten von Geselligkeit und Freude sollten wir auch innehalten, um das vergangene Jahr zu reflektieren. M&ouml;ge die Magie von Weihnachten uns mit Liebe, Mitgef&uuml;hl und Hoffnung erf&uuml;llen. Frohe Weihnachten an euch alle!', '2023-12-16 17:09:00', 1, '2023-12-16 16:09:00', '2023-12-16 16:09:00'),
(172, 3, 1, 'KI, Webdesign, Kunst und Fotografie', 'Als leidenschaftlicher Blogger erkunde ich in meinen Beitr&auml;gen die aufregenden Welten von KI, Webdesign, Kunst und Fotografie. Von den neuesten Entwicklungen in der K&uuml;nstlichen Intelligenz &uuml;ber innovative Designtrends bis hin zu kreativen Fotografie- und Kunsttechniken mit KI-Bildbearbeitung - ich m&ouml;chte euch auf kurzweilige Weise inspirieren und ihre Neugier f&uuml;r diese spannenden Themen wecken. Begleite mich auf dieser Entdeckungsreise durch die faszinierende Fusion von Technologie und Kreativit&auml;t!', '2024-01-09 22:14:00', 1, '2024-01-09 21:14:00', '2024-01-09 21:14:00'),
(173, 1, 1, 'Frühling', 'Ja, der Frühling steht vor der Tür, und mit ihm kommt auch Ostern näher. In vielen Teilen der Welt ist der Frühling eine Zeit der Erneuerung, wenn die Natur aus ihrem Winterschlaf erwacht und alles wieder zum Leben erweckt wird. Die Tage werden länger, die Blumen blühen, und die Temperaturen steigen langsam an.\r\n\r\nOstern ist ein festliches Ereignis, das in vielen Kulturen und Traditionen gefeiert wird. Es markiert die Auferstehung Jesu Christi und wird oft mit verschiedenen Bräuchen und Feierlichkeiten begangen. Dazu gehören das Färben und Verstecken von Ostereiern, das Dekorieren von Osternestern, Ostermärkte, Osterfeuer und vieles mehr.\r\n\r\nEs ist eine Zeit der Freude, des Zusammenseins mit Familie und Freunden und des Genießens der Frühlingsstimmung. Egal, ob man religiöse Rituale begeht oder einfach die Gelegenheit nutzt, um sich zu entspannen und das schöne Wetter zu genießen, der Frühling und Ostern bieten eine willkommene Abwechslung nach den kalten Wintermonaten.', '2024-03-14 16:10:00', 1, '2024-03-13 23:00:00', '2024-03-13 23:00:00'),
(174, 1, 1, 'Sommer 2024', 'Der Sommer steht vor der T&uuml;r und bringt warme Temperaturen, sonnige Tage und endlose M&ouml;glichkeiten f&uuml;r Outdoor-Aktivit&auml;ten mit sich. Es ist die perfekte Zeit, um die Natur zu genie&szlig;en, im Freien zu entspannen und neue Abenteuer zu erleben. Egal, ob du gerne am Strand entspannst, wandern gehst oder einfach nur die warmen Sommerabende genie&szlig;t, diese Jahreszeit bietet f&uuml;r jeden etwas.\r\n\r\nNutze den Sommer, um neue Hobbys auszuprobieren, Freunde zu treffen und unvergessliche Momente zu schaffen. Es ist eine Zeit des Neubeginns, der Erholung und der Freude. Also pack die Sonnencreme ein, zieh deine Sommerschuhe an und mach dich bereit, den Sommer in vollen Z&uuml;gen zu genie&szlig;en!', '2024-04-21 15:54:00', 1, '2024-04-21 13:54:00', '2024-04-21 13:54:00'),
(175, 1, 1, 'Neues Layout', 'Ich freue mich, mein neues Layout vorzustellen! Ab heute erscheint meine Navigation in einem eleganten Blau. Dieses Farbschema wurde sorgfältig ausgewählt.\r\nIch hoffe, dass euch das neue Design genauso gut gefällt wie mir. Schaut euch um und lasst mich wissen, was Ihr  denkt!\r\n\r\nVielen Dank, dass ihr Teil unserer Community seid.\r\n\r\nEuer Team', '2024-07-17 00:00:00', 1, '2024-07-16 22:00:00', '2024-07-16 22:00:00'),
(176, 2, 1, 'PHP 8.2 auf MCS aktivieren: Mein Erfahrungsbericht', '**Einleitung:**\r\nNachdem ich einige Zeit an meinem MCS (Marble Content System) gearbeitet habe, habe ich mich dazu entschieden, die PHP-Version auf 8.2 zu aktualisieren. Dies war kein leichtes Unterfangen, aber es hat sich gelohnt! In diesem Blogpost möchte ich meine Erfahrungen und die Schritte, die ich unternommen habe, mit euch teilen.\r\n\r\n**Warum PHP 8.2?**\r\nPHP 8.2 bringt viele neue Features und Verbesserungen, die sowohl die Performance als auch die Sicherheit betreffen. Besonders interessant fand ich die verbesserten Type Declarations und die optimierten Fehlerbehandlungsmechanismen. Allerdings bedeutet ein Versionssprung auch, dass bestehender Code Überarbeitet werden muss.\r\n\r\nDie Herausforderung: Variablen deklarieren\r\nEin großes Problem, auf das ich stieß, war, dass PHP 8.2 strenger mit der Variablendeklaration umgeht. Das bedeutet, dass ich in meinem Code viele Variablen explizit deklarieren musste, bevor sie verwendet wurden. Das war zeitaufwendig, weil ich jeden einzelnen Fall durchgehen und sicherstellen musste, dass alle Variablen korrekt initialisiert sind.\r\n\r\n**Die Testphase: Alles durchprobieren**\r\nNachdem ich die Variablen angepasst hatte, begann die intensive Testphase. Ich musste alle Funktionen und Skripte durchprobieren, um sicherzustellen, dass sie unter PHP 8.2 wie gewünscht funktionieren. Es war frustrierend, auf unerwartete Fehlermeldungen zu stoßen, aber nach und nach konnte ich alle Probleme beheben.\r\n\r\nDas Ergebnis: Ein schnelleres und sichereres System\r\nNach all der Arbeit kann ich stolz sagen, dass mein System nun unter PHP 8.2 läuft - und das schneller und sicherer als je zuvor. Die Mühe hat sich gelohnt, und ich bin gespannt, wie sich diese Optimierungen langfristig auswirken werden.\r\n\r\n**Fazit:**\r\nDie Aktualisierung auf PHP 8.2 war eine Herausforderung, aber auch eine wertvolle Lernerfahrung. Wenn du ebenfalls darüber nachdenkst, PHP auf deinem Server zu aktualisieren, empfehle ich dir, gründlich zu testen und dich auf einige Anpassungen im Code vorzubereiten. Es lohnt sich!', '2024-08-08 12:08:00', 1, '2024-08-08 10:08:00', '2024-08-08 10:08:00'),
(177, 2, 1, 'Laravel Experimente', 'Ich bin aktuell dabei, mich intensiv in die Entwicklung mit Laravel einzuarbeiten, und konnte bereits einige spannende Features auf meiner Demoseite implementieren. Zu den Highlights gehört eine Blog-Komponente, die es den Nutzern ermöglicht, Beiträge zu erstellen und zu verwalten.\r\n\r\nDarüber hinaus habe ich eine sichere Login-/Logout-Funktion entwickelt, die durch OTP-Codes (Einmalpasswörter) geschützt ist. Dabei wird der OTP-Code via QR-Code eingelesen, was die Sicherheit und Benutzerfreundlichkeit weiter erhöht.\r\n\r\nAuch die Profileinstellungen sind umfangreich: Benutzer können ihre E-Mail-Adresse ändern und ihr Passwort erneuern. Diese Funktionen bieten eine solide Basis für die Verwaltung von Benutzerkonten und tragen zur Sicherheit der Plattform bei.\r\n\r\nIch freue mich darauf, meine Kenntnisse in Laravel weiter zu vertiefen und das Projekt kontinuierlich zu erweitern.', '2024-08-18 14:25:00', 1, '2024-08-18 12:25:00', '2024-08-18 12:25:00'),
(178, 1, 1, 'Und schon wieder haben wir Halloween!', 'Halloween ist wieder da - die Straßen füllen sich mit Kürbislaternen, die Kinder schlüpfen in schaurige Kostüme, und die Geistergeschichten erwachen zum Leben. Es ist die Zeit, in der Grusel und Kreativität Hand in Hand gehen. Die Tradition, die ihren Ursprung in irischen und keltischen Bräuchen hat, hat sich längst über die ganze Welt verbreitet und begeistert Jung und Alt. Ob gespenstische Deko, ausgehöhlte Kürbisse oder einfach ein gemütlicher Horrorfilmabend - Halloween bringt die Menschen auf eine unbeschwerte, magische Weise zusammen.\r\n\r\nDoch Halloween ist mehr als nur ein Fest des Schreckens. Es ist auch ein Spiegel für unsere Fantasie und Kreativität. Jedes Kostüm, jede verzierte Haustür und jede handgemachte Kürbislaterne erzählt eine eigene Geschichte. Vielleicht ist das der eigentliche Zauber von Halloween: einen Abend lang in eine andere Welt einzutauchen, zusammen mit Freunden und Familie die Nacht zu erobern und sich gemeinsam vor dem Spuk zu gruseln – nur um am nächsten Morgen mit einem Schmunzeln an das Abenteuer zurückzudenken.', '2024-10-31 10:35:00', 1, '2024-10-31 09:35:00', '2024-10-31 09:35:00'),
(179, 1, 1, 'X-Mas 2024', 'Weihnachten 2024 - eine Zeit voller stiller Magie und sanfter Freude. Auf den Eislaufbahnen sammeln sich Kinder und Erwachsene gleichermaßen, umgeben vom Glanz der festlichen Beleuchtung. Das Echo der Kufen auf dem Eis mischt sich mit dem Lachen der Menschen, und die kühle Luft trägt den Hauch von Winter, während die Bewegung die Herzen erwärmt. Schlittschuhlaufen - ein schwebendes Glück, das die Tage heller und die Nächte leichter macht.\r\n\r\nAm Rande der Bahnen strömt der Duft von Glühwein und gebrannten Mandeln durch die kalte Luft, eine Einladung zum Verweilen. Der Glühwein, tiefrot und würzig, wärmt Hände und Seele, während die süßen Mandeln knuspernd Erinnerungen an vergangene Jahre heraufbeschwören. Inmitten des bunten Treibens auf den Weihnachtsmärkten entfaltet sich eine stille Harmonie - eine Feier des Augenblicks, voller Vertrautheit und leiser Freude.', '2024-12-07 15:36:00', 1, '2024-12-07 14:36:00', '2024-12-07 14:36:00'),
(180, 2, 1, 'Warum MCSL auf Laravel/Vue basiert – Die Technologie hinter diesem Blog', 'In der Welt des modernen Web-Developments gibt es unzählige Frameworks und Plattformen, aber nur wenige bieten die **Flexibilität**, **Skalierbarkeit** und **Benutzerfreundlichkeit** von Laravel. Heute möchte ich ein wenig darüber sprechen, warum **MCSL** auf Laravel basiert und wie es gemeinsam mit **Vue.js** das **Rückgrat** unseres Blogs bildet.\r\n--- \r\n ## **Warum Laravel?** \r\n\r\n\r\nLaravel ist ein **PHP-Framework**, das für seine **elegante Syntax**, **robusten Funktionen** und **entwicklerfreundlichen Tools** bekannt ist. Es vereinfacht den Entwicklungsprozess und bietet gleichzeitig leistungsstarke Funktionen. Mit Features wie **Authentifizierung**, **Routing**, **Sessions** und **Caching** stellt Laravel alles zur Verfügung, was benötigt wird, um leistungsstarke Webanwendungen wie **MCSL** zu entwickeln.\r\n\r\n### **Wichtige Gründe, warum Laravel die Basis von MCSL ist:**\r\n\r\n\r\n- **Schnelle Entwicklungszeiten:**  \r\n  Laravel’s **Artisan CLI** automatisiert wiederkehrende Aufgaben und beschleunigt so den Entwicklungsprozess erheblich.  \r\n\r\n- **Modularität:**  \r\n  Laravel’s **modulare Architektur** ermöglicht es uns, Funktionen wie **Benutzerverwaltung**, **API-Integrationen** und **Datenverwaltung** einfach zu implementieren und zu erweitern.  \r\n\r\n- **Sicherheit:**  \r\n  Laravel bietet integrierten Schutz vor gängigen Sicherheitslücken wie **CSRF**, **SQL-Injektionen** und **XSS-Angriffen**, wodurch MCSL von Anfang an sicher ist.\r\n--- \r\n## **Warum Vue.js?**\r\n\r\n\r\nVue.js ist ein **JavaScript-Framework**, das speziell dafür entwickelt wurde, benutzerfreundliche und reaktive Benutzeroberflächen zu erstellen. Zusammen mit Laravel bildet es eine perfekte Kombination für moderne Webanwendungen.\r\n\r\n### **Vorteile von Vue.js in MCSL:**\r\n\r\n\r\n- **Echtzeit-Updates:**  \r\n  Vue.js ermöglicht es, **Benutzerinteraktionen** ohne komplette Seitenaktualisierungen zu verarbeiten, sodass Änderungen in Echtzeit angezeigt werden.\r\n\r\n- **Komponentenstruktur:**  \r\n  Vue.js erlaubt es, verschiedene Teile der Anwendung als unabhängige, wiederverwendbare Komponenten zu erstellen. Das fördert eine **saubere und modulare Codebasis**.\r\n\r\n- **Interaktive Benutzeroberflächen:**  \r\n  Vue.js ermöglicht es, **dynamische und benutzerfreundliche Oberflächen** zu entwickeln, die direkt mit Laravel’s API kommunizieren.\r\n--- \r\n## **MCSL: Laravel und Vue.js im Zusammenspiel**\r\n\r\n\r\nMCSL ist mehr als nur ein **Content-Management-System (CMS)** — es ist eine moderne Webplattform, die von den **Stärken von Laravel und Vue.js** profitiert. Laravel fungiert dabei als **starke Backend-Architektur**, während Vue.js eine **dynamische und reaktionsschnelle Benutzeroberfläche** bereitstellt.\r\n\r\n### **Kernkomponenten der MCSL-Architektur:**\r\n\r\n\r\n- **Echtzeit-Datenverwaltung:**  \r\n  Laravel und Vue.js ermöglichen es, Daten in Echtzeit zu aktualisieren und anzuzeigen.\r\n\r\n- **Nahtlose API-Integration:**  \r\n  Laravel bietet leistungsstarke APIs, die von Vue.js genutzt werden, um eine reibungslose Benutzererfahrung zu gewährleisten.\r\n\r\n- **Dynamische Benutzeroberflächen:**  \r\n  Dank Vue.js kann MCSL interaktive Funktionen wie Drag-and-Drop, Inline-Bearbeitung und Live-Datenaktualisierungen bieten.', '2025-01-14 00:00:00', 1, '2025-01-26 23:00:00', '2025-02-06 18:07:14'),
(181, 3, 1, 'etest', 'LAAAAAAAAAAAAAAAAAAAAAAAAAAAAANGE fASSSSSSUNG', '2025-02-06 00:00:00', 1, '2025-02-06 18:12:55', '2025-02-07 18:27:06');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `texts`
--

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
-- Daten für Tabelle `texts`
--

INSERT INTO `texts` (`id`, `pub`, `position`, `headline`, `text`, `type`, `author_id`, `created_at`) VALUES
(3, 1, 0, 'Willkommen', 'Liebe Musikfreunde,\r\n\r\nmein Name ist Björn Hannemann, besser bekannt als M66, und ich freue mich, euch auf meiner musikalischen Reise begrüßen zu dürfen! Als DJ erkunde ich eine Vielzahl von Genres und Stilen, von Pop über Goa bis hin zu Hip-Hop und Techno.\r\n\r\n \r\n\r\nMein erster Auftritt fand am 03.11.2023 im Seh Sie in Bad Oldesloe statt, ein unvergessliches Erlebnis, das den Startschuss für viele weitere musikalische Abenteuer markierte.\r\n\r\n \r\n\r\nAktuell verbringe ich viel Zeit zuhause an meinem Numark NS4FX DJ-Pult und arbeite an neuen Mixen, die ich mit euch auf Plattformen wie Mixcloud, SoundCloud und YouTube teile. Es wäre großartig, wenn ihr mal vorbeischaut, euch ein wenig Zeit nehmt, um reinzuhören und vielleicht sogar ein Follower zu werden.\r\n\r\n \r\n\r\nUnter meinen Künstlernamen wie Hannemuck (POP), Ghanuck66 (GOA), Grandpa Flash66 (HipHop) und BlackKNight0676 (Techno) findet ihr verschiedene Facetten meiner musikalischen Persönlichkeit, die ich gerne mit euch teile.\r\n\r\n \r\n\r\nVielen Dank für eure Unterstützung und die Zeit, die ihr meinen Mixen widmet. Ich freue mich darauf, euch auf meiner musikalischen Reise zu begleiten und gemeinsam mit euch die Welt der Musik zu erkunden.\r\n\r\nHerzliche Grüße,\r\n\r\n \r\n\r\nBjörn Hannemann (M66)', 'start', 1, '2024-10-15 17:09:04'),
(6, 1, 1, 'Hannemucks Biografie', 'Mein Name ist Björn (M66) Hannemann!\r\nIch bin am 06.01.1976 in Neumünster in einer Privatklinik geboren.\r\nAufgewachsen und zur Schule gegangen bin ich in einem schönen Dorf in Schleswig Holstein-Trappenkamp. Das erste mal mit der Musik kam ich ca 1984 bei Klaus L. aus Trappenkamp.\r\nDer war Dj auf Grill und Zeltfeten.\r\n\r\n \r\n\r\nDa habe ich sowas wie Max Mix und Italo Boot Mix kennen gelernt.\r\nNebenbei habe ich in dem Ortsansässigen Club (TV Trappenkamp) Fußball gespielt.\r\nMit ca 14 wollten ein paar Freunde aus Trappenkamp und Rickling in Rickling in der alten Wäscherei einen Club betreiben.(Da lief sowas wie SNAP-The Power und Dr Acid und Mr House)!\r\nMit 15-16 bin ich dann zu Gangster RAP aus den USA gekommen.\r\n\r\n \r\n\r\nDas ging bis zum 18. Lebensjahr,wobei ich da schon Angefangen habe mich Techno und Eurodance zu hören (sowas wie House Party 8, Thunderdome, Marusha,Westbam,Scooter,Masterboy,Odysee usw).\r\nMein erster Disco besuch war ca mit 16 (Traffic-Kaltenkirchen (bis 22uhr Eintritt frei)!\r\nAm 01.01.1995-31.12.1995 war ich als Wehrpflichtiger bei den Panzerbatallion 5/183 in Boostedt.\r\nWo es sich dann ergab immer ins SKY nach Neumünster zu gehen!\r\n\r\n \r\n\r\nNach meiner Bundeswehrzeit habe ich dann bei Becker Bau Bornhöved angefangen zu Lehrnen.\r\nDabei haben Freunde (the Chambers ± x) angefangen zu Mixen (Dreher Riehmenantrieb) und nebenbei zu Zocken (PS1).\r\nAb 1996 ist man auch auf Party gefahren.(erst Generationen Move HH und Loveparade Berlin).\r\n\r\n\r\nAb 1998 ist man dann in die Clubs und Privatpartys von Dj‘s (Box HH und Earthquake Party im Lindenhof und in Bornhöved)! \r\n\r\nIn den Clubs wurde man erst Anfang bis Mitte 1999 Aktiv ( Tunnel HH, New Bambu Neustadt in Holstein und 1x Ziegelei Groß Weeden)!\r\nDann war eine Künstlerische Pause bis auf Ortsansässige Partys wie Der Streetmove (Aqualoop Records) und von Kevax and Friends die T-Club Party’s und von Ivo and Friends die Flächenbrand Partys!\r\n\r\nAnfang-Mitte 2022 bin ich durch einen guten Freund (Maik V.) in der Behinderten Werkstatt Bad Segeberg auf Twitch aufmerksam gemacht worden. Dadurch wurde ich wieder Angefixt zu Mixen. Also habe ich mir Ende April ein DJ-Pult (Numark NS4FX) zu gelegt.\r\n\r\nMusik hatte ich noch von meiner Künstlerischen Pause.\r\nDann habe ich einfach mal los gelegt!\r\n\r\nUnd seid ca 12/22-23 heiße ich M66.\r\n\r\n\r\nDer Name Hannemuck ist eine zusammenhängender Begriff aus den Namen Hanne und Muck,wobei das Muck in den M von M66 versteckt ist!\r\nSeid den 11/2023 habe ich auch schon meinen ersten Öffentlichen Auftritt gehabt (Seh Sie-Bad Oldeslohe).\r\nAber ich mache inmoment nur Mixe bei mir zuhause die ich bei Mixcloud und SoundCloud veröffentliche.\r\n\r\nDie Links poste ich in allen möglichen Social Medias. So das war es erstmal!!', 'bio', 1, '2025-03-24 17:13:26'),
(8, 1, 2, 'Meine Musik', 'asd\r\nsd\r\nsd\r\n\r\nds\r\nsd\r\nds', 'music', 1, '2024-10-18 13:16:05'),
(9, 1, 3, 'Künstliche Intelligenz Bei Asario.de', 'Bildgenerierende KIs eröffnen spannende Möglichkeiten, um kreative Prozesse zu unterstützen. Sie erzeugen beeindruckende Bilder basierend auf Textbeschreibungen oder Vorgaben und finden zunehmend Anwendung in Kunst, Design und Marketing. Es wurden alle mit **\"AI\"** markierten Bilder mithilfe von __[NightCafe Studio](https://www.nightcafe.studio)__ erstellt. Entdecke, wie Künstliche Intelligenz das Bilderschaffen neu definiert und neue kreative Türen öffnet!', 'ai', 1, '2024-10-21 09:55:17'),
(12, 1, 4, 'test', '##etst\r\nhallo Welt', 'test', 1, '2024-10-21 12:29:42');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

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
  `image_path` varchar(255) DEFAULT NULL,
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
-- Tabellenstruktur für Tabelle `users_rights`
--

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
-- Daten für Tabelle `users_rights`
--

INSERT INTO `users_rights` (`id`, `pub`, `position`, `moderator_id`, `name`, `shortname`, `view_table`, `add_table`, `edit_table`, `publish_table`, `date_table`, `delete_table`, `xkis_AdminPanel`, `xkis_UserRights`, `xkis_SendMail`, `xkis_SandMail`, `xkis_CommentsCenter`) VALUES
(1, 1, 0, 1, 'Developer', 'dev', '11111111111111111111111111', '111111111111111111111111111111', '11111111111111111111111111111111111111111', '1111111111111111111111111111111111', '11111111111111111111111111111', '1111111111111111111111111111111111111111111111111111', 1, 1, 0, 1, 1),
(2, 1, 1, 1, 'Moderator', 'mod', '0111111110100', '0111111110100', '0111111110100', '0111111110100', '0111111110000', '0111111110100', 1, 0, 0, 0, 1),
(3, 1, 2, 1, 'Normal User', 'user', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', 0, 0, 0, 0, 0),
(5, 1, 3, 1, 'Trial', 'trial', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', '000000000000000', 0, 0, 0, 0, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blog_authors`
--
ALTER TABLE `blog_authors`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blog_images`
--
ALTER TABLE `blog_images`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indizes für die Tabelle `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indizes für die Tabelle `camera`
--
ALTER TABLE `camera`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `didyouknow`
--
ALTER TABLE `didyouknow`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `images_categories`
--
ALTER TABLE `images_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indizes für die Tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indizes für die Tabelle `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indizes für die Tabelle `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `testfield`
--
ALTER TABLE `testfield`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indizes für die Tabelle `users_rights`
--
ALTER TABLE `users_rights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT für Tabelle `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT für Tabelle `blog_authors`
--
ALTER TABLE `blog_authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `blog_images`
--
ALTER TABLE `blog_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT für Tabelle `camera`
--
ALTER TABLE `camera`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT für Tabelle `didyouknow`
--
ALTER TABLE `didyouknow`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT für Tabelle `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT für Tabelle `images_categories`
--
ALTER TABLE `images_categories`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT für Tabelle `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT für Tabelle `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT für Tabelle `testfield`
--
ALTER TABLE `testfield`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT für Tabelle `texts`
--
ALTER TABLE `texts`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users_rights`
--
ALTER TABLE `users_rights`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

INSERT INTO `users` (`id`, `first_name`, `nick_name`, `email`, `name`, `birthday`, `music`, `interests`, `occupation`, `email_verified_at`, `password`, `users_rights_id`, `profile_photo_path`, `is_admin`, `is_employee`, `is_customer`, `admin_id`, `company_id`, `customer_id`, `image_path`, `last_login_at`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Kiss', 'kissu', 'KissYou@example.com', 'KissU', '0000-00-00', NULL, NULL, NULL, '2025-01-10 14:58:58', '$2y$12$xmseqPoBKtL.VWc4w0yZAePcMwNY4ocIjIFgLYFYbYUrufAxuhXvG', 1, 'profile-photos/008.jpg', 0, 1, 0, 2, NULL, NULL, NULL, '2025-02-06 15:25:22', NULL, NULL, '2025-01-20 17:38:47', NULL, '2025-01-10 14:58:58', '2025-02-06 15:25:22');
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
