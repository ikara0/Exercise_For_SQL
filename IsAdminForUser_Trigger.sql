CREATE TABLE [User]
(
	ID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	UserName VARCHAR(20) NOT NULL,
	Email VARCHAR(64) NOT NULL,
	Password VARCHAR(64) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE()
)

SELECT * FROM [User]


CREATE OR ALTER TRIGGER trg_IsUserAdmin
ON [User] FOR DELETE
AS 
BEGIN 
	 DECLARE @isAdmin VARCHAR(64)
	 SELECT @isAdmin = UserName FROM DELETED 
	 IF @isAdmin = 'Admin'
	 BEGIN 
		 INSERT INTO [User] 
		 SELECT * FROM DELETED WHERE UserName = 'Admin'
		 PRINT 'Admin Ismindeki Kullanıcı Silinemez!'
		 SELECT * FROM [User] WHERE UserName = 'Admin'
	 END
	 ELSE 
	 BEGIN 
		 PRINT 'Silme Işlemi Başarılı!'
	 END
END

INSERT INTO [User] (UserName,Email,Password) VALUES ('Skahraman','sg@gmail.com','423wfmsfd'),
													('ozkule','eo@gmail.com','23erwefsd'),
													('Admin','adminim@gmail.com','*******')

SELECT * FROM [User]


DELETE FROM [User] WHERE UserName = 'Admin' 
