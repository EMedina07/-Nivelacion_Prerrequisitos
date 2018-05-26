--CREATE DATABASE Book_RegisterDB

--USE Book_RegisterDB

--CREATE TABLE Editoras
--(
--    EditoraID INT IDENTITY(1,1),
--	NombreEditora VARCHAR(50),
--	CONSTRAINT PK_Editoras_EditoraID PRIMARY KEY(EditoraID)
--)

SELECT * FROM Editoras

--INSERT INTO Editoras
--VALUES('RA-MA'),('Krasis Press'), ('RedUsers'),('Andaya'),('Atalaya')

--CREATE TABLE Autores
--(
--    AutoresID INT IDENTITY(1,1),
--	Nombre VARCHAR(50),
--    CONSTRAINT PK_Autores_AutoresID PRIMARY KEY(AutoresID)
--)

SELECT * FROM Autores

--INSERT INTO Autores
--VALUES('Maria Carmen Elena'),('Octabio Hernandez Leal'),('Nicolas Arrioja Landa Cosio'),

--CREATE TABLE Libros
--(
--    ISM VARCHAR(100),
--	Titulo VARCHAR(50), 
--	AutoresID INT,
--	EditoraID INT,
--	CONSTRAINT PK_Libros_ISM PRIMARY KEY(ISM),
--	CONSTRAINT FK_Libros_Autores_AutoresID FOREIGN KEY(AutoresID)
--	REFERENCES Autores(AutoresID),
--	CONSTRAINT FK_Libros_Editoras_EditoraID FOREIGN KEY(EditoraID)
--	REFERENCES Editoras(EditoraID)
--)

SELECT * FROM Libros

--INSERT INTO Libros
--VALUES('LB-001', 'Enciclopedia de Microsoft Visual C#', 1, 1),
--      ('LB-002', 'C# 3.0 y Linq', 2, 2),
--	  ('LB-003', 'C# Avanzado', 3, 3),
--	  ('LB-004', 'Enciclopedia de Microsoft Visual Basic (VB)', 1, 1),
--	  ('LB-005', 'Juana Montes', 4, 4)

////////////////////////////////////////////////////////////////////////////////////

                        SETORES PROCEDURES

////////////////////////////////////////////////////////////////////////////////////


--CREATE PROC usp_LibrosEscritosPorUnAuttor
--@NombreAuttor VARCHAR(50)
--AS
--    BEGIN
--	    SELECT A.Nombre, COUNT(L.ISM) AS 'Total de libros' 
--        FROM Libros AS L
--        INNER JOIN Autores AS A ON L.AutoresID = A.AutoresID
--		WHERE A.Nombre = @NombreAuttor
--        GROUP BY A.Nombre
--	END
    
EXEC usp_LibrosEscritosPorUnAuttor 'Javier Caballos'

--CREATE PROC usp_LibrosEditadosPorUnaEditora
--@Editora VARCHAR(50)
--AS
--    BEGIN
--	    SELECT E.NombreEditora, COUNT(L.ISM) AS 'Total de libros' 
--        FROM Libros AS L
--        INNER JOIN Editoras AS E ON L.EditoraID = E.EditoraID
--		WHERE E.NombreEditora = @Editora
--        GROUP BY E.NombreEditora
--	END

EXEC usp_LibrosEditadosPorUnaEditora 'RA-MA'

--CREATE PROC usp_CantidadDeAutoresPorLibros
--@Titulo VARCHAR(50)
--AS
--    BEGIN
--	    SELECT L.Titulo, COUNT(A.AutoresID) AS 'Autores Por Libros' 
--        FROM Libros AS L
--        INNER JOIN Autores AS A ON L.AutoresID = A.AutoresID
--		WHERE L.Titulo = @Titulo
--        GROUP BY L.Titulo
--	END

EXEC usp_CantidadDeAutoresPorLibros 'C# Avanzado'

--CREATE PROC usp_AutoresConLosQueHaTabajadoUnaEditora
--@Editora VARCHAR(50)
--AS
--    BEGIN
--	    SELECT E.NombreEditora, A.Nombre AS 'Autores'
--        FROM Libros AS L
--        INNER JOIN Autores AS A ON L.AutoresID = A.AutoresID
--        INNER JOIN Editoras AS E ON L.EditoraID = E.EditoraID
--        WHERE E.NombreEditora = @Editora
--	END

EXEC usp_AutoresConLosQueHaTabajadoUnaEditora 'Krasis Press'

--CREATE PROC usp_AutoresConLosQueNoHanTabajadoUnaEditora
--@Editora VARCHAR(50)
--AS
--    BEGIN
--	    SELECT A.Nombre AS 'Autores no registrado en esta casa editora'
--        FROM Libros AS L
--        INNER JOIN Autores AS A ON L.AutoresID = A.AutoresID
--        INNER JOIN Editoras AS E ON L.EditoraID = E.EditoraID
--        WHERE A.AutoresID IN (
--		                         SELECT AutoresID FROM Libros 
--								 WHERE Titulo NOT IN  (SELECT Titulo FROM Libros WHERE E.NombreEditora = @Editora)
--							  ) 
--	END

EXEC usp_AutoresConLosQueNoHanTabajadoUnaEditora 'Krasis Press'