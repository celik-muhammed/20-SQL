CREATE TABLE book_types (
						type_id INT NOT NULL IDENTITY PRIMARY KEY,
						book_type VARCHAR (50) NOT NULL,
						)

CREATE TABLE authors (
					author_id INT NOT NULL IDENTITY PRIMARY KEY,
					author_name VARCHAR (50) NOT NULL
					)

CREATE TABLE publishers (
						publisher_id INT NOT NULL IDENTITY PRIMARY KEY,
						publisher_name VARCHAR (50) NOT NULL,
						country VARCHAR (25),
						)

CREATE TABLE books (
					book_id INT NOT NULL IDENTITY PRIMARY KEY,
					book_name VARCHAR (50) NOT NULL,
					book_type INT FOREIGN KEY REFERENCES book_types(type_id),
					author_id INT FOREIGN KEY REFERENCES authors(author_id),
					publisher_id INT FOREIGN KEY REFERENCES publishers(publisher_id),
					price DECIMAL (5,2)
					)

INSERT INTO book_types (book_type) VALUES ('Anı')
INSERT INTO book_types (book_type) VALUES ('Deneme')
INSERT INTO book_types (book_type) VALUES ('Hikaye')
INSERT INTO book_types (book_type) VALUES ('Şiir')

INSERT INTO authors (author_name) VALUES ('Ömer Seyfettin')
INSERT INTO authors (author_name) VALUES ('Halide Edip Adıvar')
INSERT INTO authors (author_name) VALUES ('Ahmet Rasim')
INSERT INTO authors (author_name) VALUES ('Necip Fazıl Kısakürek')
INSERT INTO authors (author_name) VALUES ('Rıfat Ilgaz')
INSERT INTO authors (author_name) VALUES ('George Orwell')
INSERT INTO authors (author_name) VALUES ('David Atkinson')
INSERT INTO authors (author_name) VALUES ('Osman Şahin')

INSERT INTO publishers (publisher_name, country) VALUES ('Can Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Özgür Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Bilge Kültür Sanat', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Dergah Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Büyük Doğu Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Hacegan Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Çınar Yayınları', 'TR')
INSERT INTO publishers (publisher_name, country) VALUES ('Amazon', 'US')
INSERT INTO publishers (publisher_name, country) VALUES ('Joffe Books', 'UK')

INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Mor Salkımlı Ev', 1, 2, 1, 40.50)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Vurun Kahpeye', 1, 2, 1, 32.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Vurun Kahpeye', 1, 2, 2, 12.50)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Şehir Mektupları', 2, 3, 4, 65.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Çile', 4, 4, 5, 100.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Çöle İnen Nur', 3, 4, 5, 120.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Dördüncü Bölük', 3, 5, 7, 21.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Sonuncu İz', 3, 8, 1, 29.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Animal Farm', 3, 6, 8, 55.00)
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Love Byte', 3, 7, 9, 35.00)

