-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 15. Mai 2012 um 20:13
-- Server Version: 5.1.44
-- PHP-Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `restaurantFinder`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `markers`
--

CREATE TABLE IF NOT EXISTS `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET latin1 NOT NULL,
  `street` varchar(250) CHARACTER SET latin1 NOT NULL,
  `city` varchar(250) CHARACTER SET latin1 NOT NULL,
  `plz` varchar(5) CHARACTER SET latin1 NOT NULL,
  `country` varchar(250) CHARACTER SET latin1 NOT NULL,
  `address` varchar(80) CHARACTER SET latin1 NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `Bemerkung` text CHARACTER SET latin1 NOT NULL,
  `official` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=46 ;

--
-- Daten für Tabelle `markers`
--

INSERT INTO `markers` (`id`, `name`, `street`, `city`, `plz`, `country`, `address`, `phone`, `lat`, `lng`, `Bemerkung`, `official`, `rating`) VALUES
(10, 'Solbad Hotel Sigriswil', 'Sigriswilstrasse 117', 'Sigriswil', '3655', 'Schweiz', 'Sigriswilstrasse 117 3655 Sigriswil Schweiz', '033 252 25 25', 46.714874, 7.714112, 'Hier kennt man sich mit glutenfreier Küche aus. Glutenfreies Brot ist immer vorrätig. Eine \r\nVoranmeldung für glutenfreie Menus ist nicht notwendig, eine Reservation aber doch \r\nsehr zu empfehlen. Die Gerichte sind auf der Karte nicht bezeichnet, die Details kann man \r\nmit dem Service bei der Bestellung absprechen.', 1, 0),
(2, 'Restaurant Schmiedstube', 'Schmiedenplatz 5', 'Bern', '3000', 'Schweiz', 'Schmiedenplatz 5 3000 Bern Schweiz', '031 311 34 61', 46.948704, 7.446795, 'Wir führen ein glutenfreies à la carte Angebot mit diversen Suppen, Saucen und Beilagen. \r\nGlutenfreies Brot ist immer erhältlich. Eine Voranmeldung für glutenfreies Essen ist nicht \r\nnotwendig. Die glutenfreien Gerichte sind auf einer separaten Karte zusammengefasst.\r\nDie Schmiedstube ist von Montag bis Samstag geöffnet, die Küche durchgehend von \r\n11.00 bis 23.00 Uhr', 1, 0),
(3, 'Restaurant National', 'Hirschengraben 24', 'Bern', '3007', 'Schweiz', 'Hirschengraben 24 3011 Bern Schweiz', '031 381 19 88', 46.946144, 7.436978, '«Da wir alles selber produzieren, wissen wir, was in unseren Speisen ist. Nach Absprache \r\nermöglichen wir gerne ein glutenfreies Essvergnügen. Zudem haben wir immer \r\nglutenfreie Speisen im Angebot.»\r\nVoranmeldung empfehlenswert, glutenfreies Brot und Spezialprodukte werden nicht \r\ngeführt.', 1, 0),
(4, 'Ristorante Pizzeria Da Bucolo', 'Amthausgasse 10', 'Bern', '3011', 'Schweiz', 'Amthausgasse 10 3011 Bern Schweiz', '031 332 82 82', 46.947372, 7.446515, 'Spezialisiert auf glutenfreie Pizzas. Reservation empfohlen.', 1, 0),
(5, 'Tea-Room Zingg Bäckerei', 'Säriswilstr. 1', 'Uettlingen', '3043', 'Schweiz', 'Säriswilstr. 1 3043 Uettlingen Schweiz', '031 829 01 73', 46.987221, 7.385338, 'Immer ein glutenfreies Tagesmenü sowie Pizza, Salate, Brot, Sandwich, Toast, belegte \r\nBrötli, diverse Patisserie, Stückli und Vermicelles – alles aus der eigenen glutenfreien \r\nBäckereiproduktion. Voranmeldung für glutenfreie Menüs ist empfehlenswert, \r\nglutenfreies Brot ist aber immer vorrätig. Die Details vom Menü jeweils mit dem Service \r\nbesprechen.\r\nMo, Mi, Do, Fr: 06.30–19.00 Uhr, Sa 06.30–18.00 Uhr, So 08.00–18.00 Uhr, Dienstag: \r\nRuhetag.', 1, 0),
(6, 'Restaurant Bären Buchsi', 'Bernstrasse 3', 'Münchenbuchsee', '3053', 'Schweiz', 'Bernstrasse 3 3053 Münchenbuchsee Schweiz', '031 869 02 99', 47.021454, 7.450668, 'Küchenchefin Claudia Purtschert und Sous-Chef Simon von Mühlenen bieten alles auf \r\nder alle 1,5 bis 2 Monate wechselnden Menukarte soweit möglich auch glutenfrei an. Eine \r\nVoranmeldung ist empfehlenswert. Die Details bei der Bestellung mit dem Service und \r\nder Küche besprechen. Glutenfreies Brot der Bäckerei Zingg in Uettligen und glutenfreie \r\nTeigwaren von Pasta Avanti sind immer vorrätig.', 1, 0),
(7, 'Restaurant Acappella', 'Worbstr. 326', 'Gümligen', '3073', 'Schweiz', 'Worbstr. 326 3073 Gümligen Schweiz', '031 958 18 81', 46.932308, 7.518307, 'Wir führen ein glutenfreies à la carte Angebot mit diversen mediterranen Gerichten, \r\nverlangen Sie die entsprechende Karte. Als Spezialität des Hauses servieren wir Ihnen ein \r\n«Original Kalbs-Wienerschnitzel» mit Allumettes (PS: die Allumettes für die glutenfreien \r\nGerichte bereiten wir in einer extra dafür angeschafften separaten Friteuse zu). Wir \r\nführen glutenfreies Brot der Bäckerei Zingg Uettligen sowie glutenfreie Teigwaren von \r\nPasta Avanti. Eine Voranmeldung für glutenfreies Essen ist nicht nötig, kann jedoch bei \r\nZeitengpässen von Vorteil sein.', 1, 0),
(8, 'Restaurant Seerose', 'Seerosenstrasse 52', 'Moorseedorf', '3302', 'Schweiz', 'Seerosenstrasse 52 3302 Moorseedorf Schweiz', '031 859 01 28', 47.022903, 7.473395, 'Neu: wir führen eine eigene glutenfreie Speisekarte. Zusätzlich werden Fisch-, Fleisch- \r\nund Vegi-Gerichte der normalen Karte glutenfrei zubereitet, Saucen und Suppen mit \r\nMaizena gebunden. Glutenfreies Brot bei Vorbestellung 24 Std. vorher vorhanden. Eine \r\nVoranmeldung für glutenfreie Menus ist empfehlenswert. Details jeweils mit Service und \r\nKüche absprechen.', 1, 0),
(25, 'Landgasthof Bären', 'Burgdorfstrasse 1', 'Ersigen', '3423', 'Schweiz', 'Burgdorfstrasse 1 3423 Ersigen Schweiz', '+41 444 88 88', 47.092083, 7.594835, 'Glutenfrei sind bei uns die Currygerichte (Krevetten, Poulet, Kalbfleisch und Quorn \n(vegi)), Cordon Bleu, Schnitzel, Saisonales, Cremesuppen, selber hergestellte Brötchen, \nTeigwaren (meist breite Nudeln) und Spätzli. Eine Voranmeldung für à la carte Essen ist \nnicht notwendig, eine Anmeldung ist jedoch wichtig bei Banketten oder Spezialwünschen. \nDie glutenfreien Gerichte sind gekennzeichnet, in Absprache können noch weitere \nGerichte glutenfrei zubereitet werden.', 1, 0),
(14, 'Ferien- und Familienhotel Alpina', 'Flecklistr. 40', 'Adelboden', '3715', 'Schweiz', 'Flecklistr. 40 3715 Adelboden Schweiz', '033 673 75 75', 46.484463, 7.567268, 'Wir bieten glutenfreie Mahlzeiten und hausgemachtes glutenfreies Brot für Hotelgäste. \nEine Voranmeldung für glutenfreies Essen ist empfehlenswert. Bitte Details jeweils mit \ndem Service und der Küche absprechen.', 1, 0),
(15, 'Hotel Simmenhof', 'Lenkstrasse 43', 'Lenk', '3775', 'Schweiz', 'Lenkstrasse 43 3775 Lenk Schweiz', '033 736 34 34', 46.472931, 7.434683, 'Wir bieten auf Voranmeldung gerne glutenfreie Gerichte an. Unsere Küche weiss über \nglutenfreie Ernährung bestens Bescheid. Bei der Bestellung können die Details der Menus \nbesprochen werden. Auch ohne Vorbestellung erhalten Sie bei uns hausgemachtes, \nglutenfreies Brot. Bei der Buchung eines Hotelaufenthaltes bitte «glutenfrei» vermerken, \ndann werden glutenfreie Spezial-Produkte vorhanden sein.', 1, 0),
(16, 'Hotel Hornberg', '', 'Saanenmöser', '3777', 'Schweiz', ' 3777 Saanenmöser Schweiz', '033 748 66 88', 46.519058, 7.313343, '«Bei uns können Sie entspannt Ihr Mittag- oder Abendessen glutenfrei geniessen. Sehr \nviele Gerichte unserer Karte sind glutenfrei zubereitbar. Der Wunsch nach «glutenfrei» \nnach Möglichkeit bei der Reservation und bei der Bestellung den Servicemitarbeitern \nmitteilen. Glutenfreies Brot ist immer vorrätig.»', 1, 0),
(18, 'Restaurant Steakhouse zum Eidgenossen', 'Schulhaustr. 2', 'Brig', '3900', 'Schweiz', 'Schulhaustr. 2 3900 Brig Schweiz', '027 923 92 07', 46.316730, 7.988544, 'Voranmeldung ist nicht notwendig, aber doch empfehlenswert. Glutenfreies Brot \nbitte 24 Std. vorher bestellen. Eigene glutenfreie Menükarte mit Lachs, Salaten, allen \nFleischsorten vom Holzkohlengrill, verschiedene Beilagen und Gemüseteller, Sauerrahm \nund Kräuterbutter.\n2 Minuten vom Bahnhof Brig, Dienstag = Ruhetag.', 1, 1),
(19, 'Hotel Britannia', '', 'Saas-Fee', '3906', 'Schweiz', ' 3906 Saas-Fee Schweiz', '027 958 60 00', 46.110603, 7.929830, 'Der Küchenchef, Herr Jacques Bilger kennt sich in der glutenfreien Küche exzellent \naus. Eine Voranmeldung für glutenfreie Menus ist empfohlen, glutenfreies Brot und \nTeigwaren sind jedoch immer vorrätig. Die Details bei der Bestellung jeweils mit Service \nund Küche besprechen.', 1, 0),
(20, 'Restaurant Kehlengrabenschlucht', 'Mariasteinstr. 32', 'Hofstetten', '4114', 'Schweiz', 'Mariasteinstr. 32 4114 Hofstetten Schweiz', '061 733 18 18', 47.474358, 7.513148, 'In der Familie haben wir jemanden mit Zöliakie und sind daher auf die Anliegen von \nZöliakiebetroffenen sehr sensibilisiert. Wir führen glutenfreie Pasta, Spätzli, Brot, \nPaniermehl etc. Verlangen Sie unsere glutenfreie Speisekarte mit Gerichten wie Schnitzel \nund Cordon-Bleu. Wir empfehlen eine Reservation für glutenfrei, damit Sie sicher einen \nPlatz haben und wir uns vorbereiten können. ', 1, 1),
(21, 'Restaurant/Pizzeria Sternen', 'Baselstr. 47', 'Solothurn', '4500', 'Schweiz', 'Baselstr. 47 4500 Solothurn Schweiz', '032 622 21 67', 47.212124, 7.545309, '«Unsere glutenfreie Pizza stellen wir separat mit Schär Brot Mix B her. Sie können die \nPizza vorbestellen oder auch erst im Restaurant. In diesem Fall bitten wir Sie, mit einer \nWartezeit von 30 Minuten zu rechnen. Sämtliche Salate, Salatsaucen, die Polenta und \ndiverse Risotto sind glutenfrei. Besprechen Sie die Details mit dem Service anlässlich \nder Bestellung. Zum Salat servieren wir Ihnen gerne ein glutenfreies Brötchen (ohne \nAufpreis und ohne Wartezeit).»', 1, 0),
(22, 'Restaurant zur Post', 'Baselstrasse 23', 'Riedholz', '4533', 'Schweiz', 'Baselstrasse 23 4533 Riedholz Schweiz', '032 622 27 10', 47.231342, 7.572646, 'Glutenfreies Brot ist immer vorrätig. Glutenfreie Gericht sind auf der Speisekarte nicht \ngekennzeichnet, können aber mit dem Service besprochen werden. Tischreservation \nvon Vorteil, vor allem im Herbst und Winter, Voranmeldung für glutenfreie Menus aber \nnicht nötig.', 1, 0),
(26, 'Landgasthof Bären', 'Burgdorfstrasse 1', 'Ersigen', '3423', 'Schweiz', 'Burgdorfstrasse 1 3423 Ersigen Schweiz', '+41 444 88 88', 47.092083, 7.594835, 'Glutenfrei sind bei uns die Currygerichte (Krevetten, Poulet, Kalbfleisch und Quorn \n(vegi)), Cordon Bleu, Schnitzel, Saisonales, Cremesuppen, selber hergestellte Brötchen, \nTeigwaren (meist breite Nudeln) und Spätzli. Eine Voranmeldung für à la carte Essen ist \nnicht notwendig, eine Anmeldung ist jedoch wichtig bei Banketten oder Spezialwünschen. \nDie glutenfreien Gerichte sind gekennzeichnet, in Absprache können noch weitere \nGerichte glutenfrei zubereitet werden.', 1, 0),
(27, 'Restaurant zum Alpenrösli', 'Baslerstrasse 80', 'Olten', '4600', 'Schweiz', 'Baslerstrasse 80 4600 Olten Schweiz', '062 212 29 69', 47.353268, 7.902644, 'Die ganze Karte wird glutenfrei angeboten, sprechen Sie die Details mit dem Service und \nder Küche ab. Eine Voranmeldung für glutenfreies Essen ist nicht notwendig. Wir führen \nauch glutenfreies Brot und arbeiten mit den Asolane Teigwaren von Mulino Di Ferro.', 1, 0),
(28, 'Hotel Bären / Restaurant «Atelier»', 'Hinterdorfstr. 10', 'Birr', '5242', 'Schweiz', 'Hinterdorfstr. 10 5242 Birr Schweiz', '056 464 01 01', 47.436882, 8.200091, 'Ein Paradies für Zöliakiebetroffene! Viele glutenfreie Gerichte auf der Speisekarte \n(speziell gekennzeichnet). Weiter ist das gesamte Angebot auf Wunsch glutenfrei \nerhältlich. Glutenfreies Brot, Pasta und Bier sind immer vorhanden. Eine Voranmeldung \nfür «glutenfrei» ist somit nicht notwendig, aber eine Platzreservation empfehlenswert.', 1, 0),
(29, 'Restaurant Frohsinn', 'Dorfstrasse 16', 'Oberrohrdorf', '5452', 'Schweiz', 'Dorfstrasse 16 5452 Oberrohrdorf Schweiz', '+41 649 61 57', 47.425072, 8.313375, 'Engagierte Frischküche. Voranmeldung für glutenfreie Menüs ist empfohlen. Alle Menüs  der Karte können glutenfrei abgewandelt werden, z.B. Fischnusperli oder Cordon Bleu.  Glutenfreie Apero Cracker und Teigwaren werden geführt.', 1, 0),
(30, 'Restaurant Central', 'Dorfstr. 18', 'Safenwil', '5745', 'Schweiz', 'Dorfstr. 18 5745 Safenwil Schweiz', '+41 279 70 98', 47.319225, 7.983813, 'Alle unsere Gerichte inkl. Saucen sind hausgemacht. An glutenfreien Spezialprodukten \nführen wir Nudeln, Penne, Bier und unsere Spezialität, das hausgemachte glutenfreie \nKnusperbrot. Eine Voranmeldung für glutenfreie Menus ist nicht notwendig. Wenn Brot \ngewünscht wird, sollte man sich aber 24 Std. vorher anmelden. Die glutenfreien Gerichte \nsind auf der Speisekarte gekennzeichnet.', 1, 0),
(31, 'Restaurant Nix’s in der Laterne', 'Reusssteg 9', 'Luzern', '6003', 'Schweiz', 'Reusssteg 9 6003 Luzern Schweiz', '+41 124 02 43', 47.050945, 8.302845, '«Wir kochen konsequent ohne Fertig-Produkte, so wissen wir, wo was drin ist. Glutenfrei \nist daher kein Problem. Mehr Infos auf unserer Homepage. Eine Voranmeldung für \nglutenfreie Menüs ist nicht notwendig, Details jeweils beim Bestellen mit Service und \nKüche absprechen. Glutenfreies Brot wird nicht geführt.»', 1, 0),
(32, 'Trattoria della Nonna', 'Spitalstrasse 21', 'Luzern', '6004', 'Schweiz', 'Spitalstrasse 21 6004 Luzern Schweiz', '+41 142 04 72', 47.058643, 8.300472, 'Glutenfrei gibt es Pizza, Cordon Bleu, Pasta, Tiramisu und Lasagne sowie eine Vielzahl von \nweiteren Gerichten. Eine Voranmeldung für glutenfreie Menus ist empfehlenswert, Brot \nbitte 24 Stunden vorher bestellen. Wir führen auch glutenfreie Snacks, Riegel, Waffeln \nund Löffelbisquits. Die glutenfreien Gerichte sind auf unserer Speisekarte entsprechend \ngekennzeichnet.', 1, 0),
(33, 'Restaurant Hergiswald', 'Hergiswald', 'Obernau', '6012', 'Schweiz', 'Hergiswald 6012 Obernau Schweiz', '+41 132 01 82', 47.022839, 8.234930, 'Wir bieten saisonale, traumhafte Fleisch- und Wildspezialitäten, aber auch vegetarische \nGerichte glutenfrei an. Eine Voranmeldung für glutenfreie Gerichte ist nicht notwendig. \nDetails bitte mit unseren Mitarbeitern absprechen. (Glutenfreies Brot ist keines vorrätig).', 1, 0),
(37, 'Gasthof St. Mauritz', 'Luzernerstr. 1', 'Schötz', '6247', 'Schweiz', 'Luzernerstr. 1 6247 Schötz Schweiz', '+41 198 04 22', 47.170784, 7.989465, 'Pizza, Pasta und Brot sind glutenfrei erhältlich. Eine Voranmeldung für glutenfreies \nEssen ist empfehlenswert, bei Vorbestellung innert 24 Stunden ist auch glutenfreies Brot \nvorrätig. Bitte Details jeweils beim Bestellen mit Service und Küche absprechen.', 1, 0),
(35, 'Seminarhotel Sempachersee', 'Kantonsstr. 46', 'Nottwil', '6207', 'Schweiz', 'Kantonsstr. 46 6207 Nottwil Schweiz', '+41 193 92 23', 47.139671, 8.129028, '«Wir bereiten Ihre Lieblinsspeise oder unsere Gerichte auch gerne glutenfrei zu und \nfreuen uns auf Ihren Besuch. Unsere Küche arbeitet ausschliesslich mit Frischprodukten \nund ohne Würzmittel, die Gluten enthalten. Eine Voranmeldung für glutenfreie Menüs \nist empfehlenswert, glutenfreies Brot ist aber immer vorrätig. Details jeweils mit dem \nService und der Küche absprechen.»', 1, 0),
(39, 'Brasserie le Mirage', 'Stansstaderstr. 90', 'Stans', '6370', 'Schweiz', 'Stansstaderstr. 90 6370 Stans Schweiz', '+41 161 10 30', 46.968220, 8.354362, 'Sämtliche Saucen und Suppen sind ohne Mehl gebunden, wir verwenden dafür \nausschliesslich Maizena. Eine Voranmeldung ist empfehlenswert, glutenfreies Brot \nbieten wir an. Die Details mit dem Service und der Küche absprechen. Für gediegene \nund französische Küche empfiehlt sich das Gourmetrestaurant «Le Mistral». Im BrasserieRestaurant werden Sie mit gepflegter französischer Frischküche verwöhnt.', 1, 0),
(40, 'Hotel Ascona', 'Via Collina', 'Ascona', '6612', 'Schweiz', 'Via Collina 6612 Ascona Schweiz', '+41 178 54 40', 46.157570, 8.767932, 'Glutenfreie Menüs und glutenfreies Brot bitte 24 Stunden im voraus bestellen. Die \nmediterran geprägte Küche bietet auch glutenfreie Teigwaren an.', 1, 0),
(41, 'Ayurveda-Wohlfühlhotel FidazerHof', 'Via da Fidaz 34', 'Flims-Fidaz', '7019', 'Schweiz', 'Via da Fidaz 34 7019 Flims-Fidaz Schweiz', '081 920 90 10', 46.837326, 9.302625, 'Frühstücksecke mit glutenfreien Produkten, Saucen und Suppen werden mit Reismehl \noder Maizena gebunden, Ernährungsberatung im Hause, flexible Mitarbeiter. \nVoranmeldung nicht notwendig, ausser für glutenfreies Brot (24 Std. vorher bestellen). \nMenüdetails mit dem Personal bei der Bestellung besprechen.', 1, 0),
(42, 'Hotel Postigliun', 'Via Alpsu 57', 'Sedrum', '7188', 'Schweiz', 'Via Alpsu 57 7188 Sedrum Schweiz', '081 949 10 46', 46.680592, 8.775627, '«Köstlichkeiten wie hausgemachte Gnocchi, Pizzas aus dem Holzofen und viele \nsaisonale Spezialitäten finden Sie auf unserer glutenfreien und laktosefreien Karte. \nGeniessen Sie auch feine Glace- und Dessertkreationen. Verschiedene Brotsorten sind \nselbstverständlich vorhanden. Voranmeldung ist nicht nötig, eine Tischreservation ist \nempfehlenswert.\nEntspannen Sie sich unbeschwert einige Tag in unserem Hotel. Ein herzhaftes glutenfreies \nFrühstück erwartet Sie täglich mit Müesli, Zopf, Toast etc.»', 1, 0),
(43, 'Wohlfühl Bio-Hotel Curuna', 'Hauptstr. 200', 'Scoul', '7550', 'Schweiz', 'Hauptstr. 200 7550 Scoul Schweiz', '081 864 14 51', 47.011425, 9.081004, 'Gepflegte italienische und mediterrane Küche mit Fleisch, Pizza, Pasta etc. Frühstück \nund Halbpensionsmenu glutenfrei. Eine Voranmeldung für glutenfreie Menus ist nicht \nnotwendig, wird jedoch glutenfreies Brot gewünscht, dann bitte 24 Stunden vorher \nbestellten. Pizzaböden, Teigwaren und Müsli gibt es ebenfalls glutenfrei. Bitte die Details \njeweils bei der Bestellung mit dem Service und der Küche absprechen.', 1, 0),
(44, 'Hotel Restorant Engiadina', '', 'Ftan', '7551', 'Schweiz', ' 7551 Ftan Schweiz', '081 864 04 34', 46.794556, 10.248452, 'Bei Hotelaufenthalt anlässlich Buchung den Wunsch «glutenfrei» mitteilen, dann sind \nsämtliche glutenfreien Spezialprodukte (Brot, Teigwaren etc.) vorhanden. Wenn nur \ndas Restaurant besucht wird, Tisch reservieren und den Wunsch «glutenfreies Menü» \nmitteilen. Bei der Bestellung werden dann die Details vom Menü besprochen. Glutenfrei \nist im Hotel Restorant Engiadina kein Problem, denn das Servicepersonal und die Küche \nsind informiert. Die Speisekarte wird drei Mal jährlich erneuert. Die aktuelle Version \nfinden Sie unter www.engiadina-ftan.ch (Speisekarte).', 1, 0),
(45, 'Restaurant Au Gratin', 'Bahnhofplatz 2', 'Zürich', '8001', 'Schweiz', 'Bahnhofplatz 2 8001 Zürich Schweiz', '+41 422 13 00', 47.376835, 8.540655, 'Einige glutenfreie Gratins mit saisonalen Frischprodukten, zudem Fleischgerichte mit \nverschiedenen wählbaren Beilagen. Beim Servicepersonal die glutenfreie Spezialkarte \nverlangen. Eine Voranmeldung für glutenfreie Menus ist nicht notwendig. Brot und \nweitere glutenfreie Spezialprodukte führen wir nicht.', 1, 0);