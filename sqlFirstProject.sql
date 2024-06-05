-- We'll create the necessary tables. 
-- The "BOOK" Table records the books available in our library.


CREATE TABLE [BOOK] (
    [ID] INT  NOT NULL ,
    [Title] VARCHAR(50)  NOT NULL ,
    [AuthorId] INT  NOT NULL ,
    [AuthorID2] INT  NULL ,
    [GenreID] INT  NOT NULL ,
    [PublicationYear] DATE  NOT NULL ,
    [CopiesOwned] INT  NOT NULL ,
    CONSTRAINT [PK_BOOK] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

-- "AUTHOR" Table contains information about the authors of the various books.
CREATE TABLE [AUTHOR] (
    [ID] INT  NOT NULL ,
    [FirstName] VARCHAR(50)  NOT NULL ,
    [LastName] VARCHAR(50)  NOT NULL ,
    CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

-- "LOAN" Table records the books that were borrowed to the library's members.
CREATE TABLE [LOAN] (
    [ID] INT  NOT NULL ,
    [BookID] INT  NOT NULL ,
    [MemberID] INT  NOT NULL ,
    [DateBorrowed] DATE  NOT NULL ,
    [DateOfReturn] DATE  NULL ,
    CONSTRAINT [PK_LOAN] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

-- "MEMBER" contains information about the members of the library.
CREATE TABLE [MEMBER] (
    [ID] INT  NOT NULL ,
    [FirstName] Varchar(30)  NOT NULL ,
    [LastName] Varchar(30)  NOT NULL ,
    CONSTRAINT [PK_MEMBER] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

-- "GENRE" table records the two categories of books- Fiction and Nonfiction
CREATE TABLE [GENRE] (
    [ID] INT  NOT NULL ,
    [Name] Varchar(30)  NOT NULL ,
    CONSTRAINT [PK_GENRE] PRIMARY KEY CLUSTERED (
        [ID] ASC
    )
)

-- The Tables are linked through the use of primary and foreign keys.
ALTER TABLE [BOOK] WITH CHECK ADD CONSTRAINT [FK_BOOK_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [AUTHOR] ([ID])

ALTER TABLE [BOOK] CHECK CONSTRAINT [FK_BOOK_AuthorId]

ALTER TABLE [BOOK] WITH CHECK ADD CONSTRAINT [FK_BOOK_AuthorID2] FOREIGN KEY([AuthorID2])
REFERENCES [AUTHOR] ([ID])

ALTER TABLE [BOOK] CHECK CONSTRAINT [FK_BOOK_AuthorID2]

ALTER TABLE [BOOK] WITH CHECK ADD CONSTRAINT [FK_BOOK_GenreID] FOREIGN KEY([GenreID])
REFERENCES [GENRE] ([ID])

ALTER TABLE [BOOK] CHECK CONSTRAINT [FK_BOOK_GenreID]

ALTER TABLE [LOAN] WITH CHECK ADD CONSTRAINT [FK_LOAN_BookID] FOREIGN KEY([BookID])
REFERENCES [BOOK] ([ID])

ALTER TABLE [LOAN] CHECK CONSTRAINT [FK_LOAN_BookID]

ALTER TABLE [LOAN] WITH CHECK ADD CONSTRAINT [FK_LOAN_MemberID] FOREIGN KEY([MemberID])
REFERENCES [MEMBER] ([ID])

ALTER TABLE [LOAN] CHECK CONSTRAINT [FK_LOAN_MemberID]

-- Populate the Tables
INSERT INTO GENRE
VALUES
(1, 'Fiction'),
(2, 'Nonfiction');

INSERT INTO MEMBER
VALUES 
(01, 'Edouard', 'Mendy'),
(02, 'Cesar', 'Azipilicueta'),
(03, 'Thiago', 'Silva'),
(04, 'Antonio', 'Rudiger'),
(05, 'Reece', 'James'),
(06, 'Ben', 'Chilwell'),
(07, 'Jorginho', 'Frello'),
(08, 'NGolo', 'Kante'),
(09, 'Kai', 'Havertz'),
(10, 'Mason', 'Mount'),
(11, 'Timo', 'Werner'),
(12, 'Kepa', 'Arizabalaga'),
(13, 'Willy', 'Caballero'),
(14, 'Marcos', 'Alonso'),
(15, 'Andreas', 'Christensen'),
(16, 'Kurt', 'Zouma'),
(17, 'Emerson', 'Palmieri'),
(18, 'Christian', 'Pulisic'),
(19, 'Mateo', 'Kovacic'),
(20, 'Callum', 'Hudson-Odoi'),
(21, 'Hakim', 'Ziyech'),
(22, 'Billy', 'Gilmour'),
(23, 'Olivier', 'Giroud'),
(24, 'Thomas', 'Tuchel');

INSERT INTO AUTHOR
VALUES
(01, 'Caroline', 'Crampton'),
(02, 'Daniel', 'Susskind'),
(03, 'Wei', 'Tchou'),
(04, 'Emil', 'Ferris'),
(05, 'Mike','Hixenbaugh'),
(06, 'Kaliane', 'Bradley'),
(07, 'Joseph', 'Andras'),
(08, 'Alexandre', 'Levebvre'),
(09, 'Renee', 'Bergland'),
(10, 'Iman', 'Mershal');

INSERT INTO BOOK
VALUES
(01, 'A Body Made of Glass', 01, NULL, 2, '2024-04-23', 5),
(02, 'Growth: A History and a Reckoning', 02, NULL, 2, '2024-04-16', 5),
(03, 'Little Seed', 03, NULL, 2, '2024-05-14', 5),
(04, 'My Favorite thing is Monsters Book Two', 04, NULL, 1, '2024-05-28', 5),
(05, 'They Came for the Schools', 05, NULL, 2, '2024-05-14', 5),
(06, 'The Ministry of Time', 06, NULL, 1, '2024-05-07', 5),
(07, 'Faraway The Southern Sky', 07, NULL, 1, '2024-05-21', 5),
(08, 'Liberalism as a Way of Life', 08, NULL, 2, '2024-06-04', 5),
(09, 'Natural Magic', 09, NULL, 2, '2024-04-30', 5),
(10, 'Traces of Enayat', 10, NULL, 2, '2024-04-02', 5);

INSERT INTO LOAN
VALUES
(01, 01, 02, '2024-05-01', '2024-05-29'),
(02, 06, 08, '2024-05-10', '2024-05-13'),
(03, 09, 09, '2024-04-30', '2024-05-07'),
(04, 03, 08, '2024-05-16', '2024-06-01'),
(05, 07, 14, '2024-05-23', '2024-06-02'),
(06, 07, 12, '2024-05-24', '2024-06-05'),
(07, 07, 12, '2024-05-26', '2024-05-31'),
(08, 02, 05, '2024-04-20', '2024-04-30'),
(09, 04, 01, '2024-06-04', '2024-06-07'),
(10, 05, 10, '2024-05-16', '2024-05-31'),
(11, 06, 23, '2024-05-10', '2024-05-30'),
(12, 07, 21, '2024-06-01', '2024-06-03'),
(13, 08, 18, '2024-05-01', '2024-06-03'),
(14, 09, 07, '2024-04-30', '2024-05-08'),
(15, 10, 24, '2024-04-15', '2024-04-19')

-- Let's view our tables
SELECT * FROM AUTHOR
SELECT * FROM BOOK
SELECT * FROM LOAN
SELECT * FROM MEMBER;

-- Which books were borrowed the most frequently.
SELECT BOOK.Title, COUNT(*) AS No_of_books_borrowed
FROM BOOK INNER JOIN LOAN
ON BOOK.ID = LOAN.BookID
GROUP BY BOOK.Title
ORDER BY COUNT(*) DESC;

-- Which members borrowed books the most and the books they borrowed.
SELECT MEMBER.FirstName + ' ' + MEMBER.LastName AS Member, COUNT(*) AS No_of_books_borrowed
FROM MEMBER INNER JOIN LOAN
ON MEMBER.ID = LOAN.MemberID
GROUP BY (MEMBER.FirstName + ' ' + MEMBER.LastName)
ORDER BY COUNT(*) DESC;

-- Which genre of books are most available in the library.
SELECT GENRE.Name, SUM(BOOK.CopiesOwned) as NoOfCopiesAvailable
FROM GENRE INNER JOIN BOOK
ON GENRE.ID = BOOK.GenreID
GROUP BY GENRE.Name;

-- Which members did not borrow any books
SELECT MEMBER.FirstName + ' ' + MEMBER.LastName AS Member
FROM MEMBER
EXCEPT
SELECT MEMBER.FirstName + ' ' + MEMBER.LastName AS Member
FROM MEMBER INNER JOIN LOAN
ON MEMBER.ID = LOAN.MemberID
GROUP BY (MEMBER.FirstName + ' ' + MEMBER.LastName);

-- Let's find the members who borrowed a certain book like 'Faraway The Southern Sky'.
-- We'll find the book ID of 'Faraway The Southern Sky'.
SELECT ID
FROM BOOK
WHERE Title = 'Faraway The Southern Sky';

-- With our ID of 7, we'll find the members who borrowed it.
SELECT DISTINCT M.FirstName, M.LastName, B.Title
FROM BOOK AS B INNER JOIN LOAN AS L
ON B.ID = L.BookID
INNER JOIN MEMBER AS M
ON M.ID = L.MemberID
WHERE B.ID = 7;

-- Show all borrowed books that were returned after the due dates ie. after 10 days.
SELECT B.Title as BookTable, M.FirstName + ' ' + M.LastName AS Member
FROM BOOK AS B INNER JOIN LOAN AS L
ON B.ID = L.BookID
INNER JOIN MEMBER AS M
ON M.ID = L.MemberID
WHERE DATEDIFF(DAY, L.DateBorrowed, L.DateOfReturn) > 10;

-- CALCULATE THE average duration of each borrowed book from its lending to its return.
SELECT B.Title AS BookTitle, Count(*) AS NoOfTimesBorrowed, AVG(DATEDIFF(DAY, L.DateBorrowed, L.DateOfReturn)) AS AverageDuration
FROM BOOK AS B INNER JOIN LOAN AS L
ON B.ID = L.BookID
GROUP BY B.Title
ORDER BY Count(*) DESC;

/* Create a table for fining members who default on their borrowing requests. An automatic of $10 is imposed after 10 days of not 
returning a book */
CREATE TABLE FINE (
ID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
LoanID INT NOT NULL FOREIGN KEY REFERENCES LOAN(ID),
MemberID INT NOT NULL FOREIGN KEY REFERENCES MEMBER(ID),
BOOKid INT NOT NULL FOREIGN KEY REFERENCES BOOK(ID),
Amount MONEY NOT NULL DEFAULT 15
)

/* This query inserts into the "FINE" table, a record of books which have been borrowed passed their due date and the appropriate fines. */

INSERT INTO FINE (LoanID, MemberID, BOOKid)
SELECT L.ID, M.ID, B.ID
FROM BOOK AS B INNER JOIN LOAN AS L
ON B.ID = L.BookID
INNER JOIN MEMBER AS M
ON M.ID = L.MemberID
WHERE DATEDIFF(DAY, L.DateBorrowed, L.DateOfReturn) > 10;

SELECT * FROM FINE;

-- We can now see which members are defaulting and the books that were borrowed in that period.
SELECT M.FirstName + ' ' + M.LastName AS Member, B.Title AS BookName, L.DateBorrowed as DateBorrowed, L.DateOfReturn AS DateOfReturn
FROM MEMBER AS M INNER JOIN FINE AS F
ON M.ID = F.MemberID
INNER JOIN BOOK AS B
ON B.ID = F.BOOKid
INNER JOIN LOAN AS L
ON L.ID = F.LoanID;

/* CLASSIFY MEMBERS ACCORDING TO BORROWING FREQUENCY. THOSE WHO HAVE NEVER BORROWED SHOULD BE CLASSIFIED AS "NO RECORD'. THOSE WITH ONE 
BORROWING RECORD SHOULD BE CLASSIFIED 'BORROWED'. OTHERWISE, CLASSIFY "FREQUENT" */
SELECT MEMBER.FirstName + ' ' + MEMBER.LastName AS Member, COUNT(LOAN.MemberID), 
CASE
WHEN COUNT(LOAN.MemberID) >= 2 THEN 'FREQUENT'
WHEN COUNT(LOAN.MemberID) = 1 THEN 'BORROWED'
ELSE 'NO RECORD'
END AS STATUS
FROM MEMBER LEFT JOIN LOAN
ON MEMBER.ID = LOAN.MemberID
GROUP BY (MEMBER.FirstName + ' ' + MEMBER.LastName);
