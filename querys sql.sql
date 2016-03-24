--
-- Insert new author
--
INSERT INTO Authors SET name='Kevin Garret'

--
-- Insert new books with new author
--
INSERT INTO Books SET authorId=8, title='Books about my true story', year=2016

--
--Second insert new book
--
INSERT INTO Books SET authorId=8, title='Brand new car, 2th', year=2016
--
-- Update old books in new author
--
UPDATE Books SET authorId=4 WHERE bookId=2 LIMIT 1

--
-- count all authors books
--
SELECT COUNT(book.bookId) AS authorBookCount, author.name FROM Books AS book
INNER JOIN Authors AS author ON author.authorId=book.authorId
GROUP BY book.authorId

--
-- Delete inserted books
--
DELETE FROM Books WHERE authorId=8

--
--Delete books where doesnt have authors
--
DELETE FROM Books WHERE authorId IS NULL

--
-- Table structure for table `BooksGenres` - genres of the books
--
CREATE TABLE IF NOT EXISTS `BooksGenres` ( 
`genreId` INTEGER(11) NOT NULL AUTO_INCREMENT, 
`genre` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NOT NULL, 
`genreDescription` TEXT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci NULL, 
PRIMARY KEY (`genreId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci 

--
-- Add column with book genre
--
ALTER TABLE `Books` 
ADD `genreId` INTEGER(11) DEFAULT NULL

--
-- Insert genres into table 'BooksGenres'
--
INSERT INTO `BooksGenres` (`genre`, `genreDescription`) VALUES
('Detektyvas', 'Šio žanro knygos apie kriminalus'),
('Romanas', 'Romantikos mėgėjams'),
('Mokslas', 'Mokslo šaknys karčios, bet vaisiai saldūs'),
('Apysaka', 'Literatūrinė apysaka');

--
-- Change table Authors engine
--
ALTER TABLE `Authors` ENGINE = InnoDB;

--
-- Update Books table assign genres to books
--
UPDATE `Books` SET `genreId`=3 WHERE `authorId`=4;

--
-- Table structure for table `BooksMap` -author and books map
--
 CREATE TABLE IF NOT EXISTS `BooksMap` ( 
`mapId` INTEGER(11) NOT NULL AUTO_INCREMENT, 
`bookId` INTEGER(11) NOT NULL, 
`authorId` INTEGER(11) NULL, 
PRIMARY KEY (`mapId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci ;


--
--  Authors assign to books
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
-- Drop Author column from table Books
--
ALTER TABLE `Books`
DROP COLUMN `authorId`;

--
-- Get all list of books with authors
--
SELECT `title`, `genre`, `genreDescription`,  GROUP_CONCAT(`Authors`.`name`) AS `bookAuthors`
FROM `Books`
INNER JOIN `BooksMap` ON `BooksMap`.`bookId`=`Books`.`bookId`
LEFT JOIN `Authors` ON `Authors`.`authorId`=`BooksMap`.`authorId`
LEFT JOIN `BooksGenres` ON `BooksGenres`.`genreId`=`Books`.`genreId`
WHERE `BooksMap`.`bookId`=`BooksMap`.`bookId`
GROUP BY `BooksMap`.`bookId`;

--
-- Set Character set and collation
--
ALTER DATABASE `Books` DEFAULT CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;
ALTER TABLE `Books` CONVERT TO CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;
ALTER TABLE `Authors` CONVERT TO CHARACTER SET utf8 COLLATE utf8_lithuanian_ci;

--
-- New author
--
INSERT INTO Authors SET name='Jonas Biliūnas'


--
--Second insert new book
--
INSERT INTO Books SET authorId=11, title='Liūdna pasaka', year=1980, genreId=4;

--
--  Authors assign to books
--
INSERT INTO `BooksMap` (`bookId`, `authorId`) VALUES
(6,11),

