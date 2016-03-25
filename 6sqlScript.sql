--
-- Database: `Books`
--


--
-- Table structure for table `Authors` - authors of the books
--

CREATE TABLE IF NOT EXISTS `Authors` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDb  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Authors`
--

INSERT INTO `Authors` (`authorId`, `name`) VALUES
(1, 'Chris Smith'),
(2, 'Steven Levithan'),
(3, ' Jan Goyvaerts'),
(4, 'Ryan Benedetti'),
(5, ' Al Anderson'),
(6, 'Clay Breshears'),
(7, 'Kevlin Henney');

--
-- Table structure for table `Books` - books with only main info
--

CREATE TABLE IF NOT EXISTS `Books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`bookId`, `authorId`, `title`, `year`) VALUES
(1, 1, 'Programming F# 3.0, 2nd Edition', 2012),
(2, 2, 'Regular Expressions Cookbook, 2nd Edition', 2012),
(3, 4, 'Head First Networking', 2009),
(4, 6, 'The Art of Concurrency', 2009),
(5, 7, '97 Things Every Programmer Should Know', 2010),
(6, NULL, 'McCullough and Berglund on Mastering Advanced Git', NULL),
(7, NULL, 'Version Control with Git, 2nd Edition', 2012),
(8, NULL, 'Learning Python, 4th Edition', 2009);


--
-- Set Character set and collation on database
--
ALTER DATABASE `Books` DEFAULT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;

--
-- 3a
--
INSERT INTO `Authors` (`name`) VALUES 
('Kevin Garret'),
('Arett Frisky');

--
-- 3b
--
INSERT INTO `Books` (`authorId`,`title`,`year`) VALUES
(8,'Books about my true story',2016),
(9,'Brand new car, 2th',2014);

--
-- 3c
--
SELECT `name`, `title`, `year`
FROM `Books`
LEFT JOIN `Authors` ON `Authors`.`authorId`=`Books`.`authorId`;

--
-- 3d
--
UPDATE `Books` SET `authorId`=4 WHERE `bookId`=2 LIMIT 1;

--
-- 3e
--
SELECT COUNT(`Books`.`bookId`) AS `authorBookCount`, `Authors`.`name` 
FROM `Books` 
INNER JOIN `Authors` ON `Authors`.`authorId`=`Books`.`authorId`
GROUP BY `Books`.`authorId`;

--
-- 3f
--
DELETE FROM `Authors` WHERE `authorId` IN (8,9);
DELETE FROM `Books` WHERE `authorId` IN (8,9);

--
-- 3g
--
DELETE FROM `Books` WHERE `authorId` IS NULL;

--
-- 4a Table structure for table `BooksGenres` - genres of the books
--
CREATE TABLE IF NOT EXISTS `BooksGenres` ( 
`genreId` INTEGER(11) NOT NULL AUTO_INCREMENT, 
`genre` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL, 
`genreDescription` TEXT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NULL, 
PRIMARY KEY (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci ;

--
-- 4a Add column with book genre
--
ALTER TABLE `Books` 
ADD `genreId` INTEGER(11) DEFAULT NULL;

--
-- 4a Insert genres into table 'BooksGenres'
--
INSERT INTO `BooksGenres` (`genre`, `genreDescription`) VALUES
('Detektyvas', 'Šio žanro knygos apie kriminalus'),
('Romanas', 'Romantikos mėgėjams'),
('Mokslas', 'Mokslo šaknys karčios, bet vaisiai saldūs'),
('Apysaka', 'Literatūrinė apysaka');

--
-- 4a Table structure for table `BooksGenres` - genres of the books
--
CREATE TABLE IF NOT EXISTS `BooksGenres` ( 
`genreId` INTEGER(11) NOT NULL AUTO_INCREMENT, 
`genre` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL, 
`genreDescription` TEXT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NULL, 
PRIMARY KEY (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci ;

--
-- 4a Add column with book genre
--
ALTER TABLE `Books` 
ADD `genreId` INTEGER(11) DEFAULT NULL;

--
-- 4a Insert genres into table 'BooksGenres'
--
INSERT INTO `BooksGenres` (`genre`, `genreDescription`) VALUES
('Detektyvas', 'Šio žanro knygos apie kriminalus'),
('Romanas', 'Romantikos mėgėjams'),
('Mokslas', 'Mokslo šaknys karčios, bet vaisiai saldūs'),
('Apysaka', 'Literatūrinė apysaka');



--
-- 4a aUpdate Books table assign genres to books
--
UPDATE `Books` SET `genreId`=3 WHERE `bookId`=4;
UPDATE `Books` SET `genreId`=2 WHERE `bookId`=3;
UPDATE `Books` SET `genreId`=4 WHERE `bookId`=1;
UPDATE `Books` SET `genreId`=1 WHERE `bookId`=2;
UPDATE `Books` SET `genreId`=3 WHERE `bookId`=5;


--
-- Change table Authors engine
--
ALTER TABLE `Authors` ENGINE = InnoDB;

--
-- 4b Table structure for table `BooksMap` -author and books map
--
 CREATE TABLE IF NOT EXISTS `BooksMap` ( 
`mapId` INTEGER(11) NOT NULL AUTO_INCREMENT, 
`bookId` INTEGER(11) NOT NULL, 
`authorId` INTEGER(11) NULL, 
PRIMARY KEY (`mapId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci ;


--
-- 4b Authors assign to books
--
INSERT INTO `BooksMap` (`bookId`, `authorId`) VALUES
(1,1),
(2,4),
(3,4),
(4,6),
(5,7),
(1,7),
(1,5);

--
-- 4c Drop Author column from table Books
--
ALTER TABLE `Books`
DROP COLUMN `authorId`;

--
-- 4d Get all list of books with authors
--
SELECT `title`, `genre`, `genreDescription`,  GROUP_CONCAT(`Authors`.`name`) AS `bookAuthors`
FROM `Books`
INNER JOIN `BooksMap` ON `BooksMap`.`bookId`=`Books`.`bookId`
LEFT JOIN `Authors` ON `Authors`.`authorId`=`BooksMap`.`authorId`
LEFT JOIN `BooksGenres` ON `BooksGenres`.`genreId`=`Books`.`genreId`
WHERE `BooksMap`.`bookId`=`BooksMap`.`bookId`
GROUP BY `BooksMap`.`bookId`;

--
-- 4e Set Character set and collation
--
ALTER DATABASE `Books` DEFAULT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;
ALTER TABLE `Books` CONVERT TO CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;
ALTER TABLE `Authors` CONVERT TO CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;

--
-- New author
--
INSERT INTO `Authors` SET `name`='Jonas Biliūnas';


--
--insert new book with LT name
--
INSERT INTO `Books` SET `title`='Liūdna pasaka', `year`=1980, `genreId`=4;

--
--  Authors assign to books
--
INSERT INTO `BooksMap` (`bookId`, `authorId`) VALUES
(11,10);




