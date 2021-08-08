CREATE DATABASE IF NOT EXISTS InternshipProject_db;
USE InternshipProject_db;

CREATE TABLE IF NOT EXISTS `Personel` (
	`personel_id` INT NOT NULL AUTO_INCREMENT,
    `personel_lid` VARCHAR(30),
    `personel_sifre` VARCHAR(30),
	`personel_ad` VARCHAR(30),
    `personel_gsm` VARCHAR(30),
	`personel_mail`  VARCHAR(45),
	`personel_adres`  VARCHAR(90),
	PRIMARY KEY (`personel_id`)
);

CREATE TABLE IF NOT EXISTS `Kitap` (
	`kitap_id` INT NOT NULL AUTO_INCREMENT,
    `kitap_ad` VARCHAR(30),
    `kitap_isbn` VARCHAR(30),    	
	`kitap_basimYili` INT,
    `kitap_cevirmenId` INT,
	`kitap_yayinEviId` INT,
    `kitap_yazarId` INT,
    `kitap_kategori` VARCHAR(30),
	`kitap_konum` VARCHAR(30),
	`kitap_mevcutSayi` INT,
	PRIMARY KEY (`kitap_id`)
);
    
CREATE TABLE IF NOT EXISTS `Yazar` (
	`yazar_id` INT NOT NULL AUTO_INCREMENT,
	`yazar_ad` VARCHAR(30),
	PRIMARY KEY (`yazar_id`)
);    

CREATE TABLE IF NOT EXISTS `yayinEvi` (
	`yayinEvi_id` INT NOT NULL AUTO_INCREMENT,
	`yayinEvi_ad` VARCHAR(30),
	`yayinEvi_adres` VARCHAR(90),	
	PRIMARY KEY (`yayinEvi_id`)
);

CREATE TABLE IF NOT EXISTS `Cevirmen` (
	`cevirmen_id` INT NOT NULL AUTO_INCREMENT,
	`cevirmen_ad` VARCHAR(30),
	PRIMARY KEY (`cevirmen_id`)
);

CREATE TABLE IF NOT EXISTS `Uye` (
	`uye_id` INT NOT NULL AUTO_INCREMENT,
    `uye_lid` VARCHAR(30),
    `uye_sifre` VARCHAR(30),
	`uye_ad` VARCHAR(30),
    `uye_gsm` VARCHAR(30),
	`uye_mail`  VARCHAR(45),
	`uye_adres`  VARCHAR(90),
    `uye_syd` VARCHAR(30),
    `uye_yasakDurumu` VARCHAR(30),
	PRIMARY KEY (`uye_id`)
);

CREATE TABLE IF NOT EXISTS `kitapDurum` (
	`kitapDurum_id` INT NOT NULL AUTO_INCREMENT,
	`uye_id` INT,
	`kitap_id` INT,
	`kitapDurum_verilisTarih` DATE,
	`kitapDurum_teslimTarih` DATE,
    `kitapDurum_teslimDurumu` INT,
	PRIMARY KEY (`kitapDurum_id`)
);

CREATE TABLE IF NOT EXISTS `Duyuru` (
	`duyuru_id` INT NOT NULL AUTO_INCREMENT,
    `duyuru_sahibi` INT,
    `duyuru_metni` VARCHAR(75),
	`duyuru_icerigi` VARCHAR(1000),
	`duyuru_tarihi` DATE,
	PRIMARY KEY (`duyuru_id`)
);

INSERT INTO `Duyuru` VALUES 
(1, 1, 'Yayınlanan duyuruya tıklayarak tetaylarını görüntüleyebilirsiniz.', 'Duyuru içeriği bu şekilde gözükmektedir. Duyuruların detayları maksimum 1000 karakter olacak şekilde ayarlanmıştır. Lütfen karakter sınırını aşmadan, gerekirse dizi şeklinde duyurular ekleyerek kullanınız.', '20-9-15'),
(2, 2, 'Ardından duyurunuzu yayınlayınız', 'Duyuru içeriği bu şekilde gözükmektedir. Duyuruların detayları maksimum 1000 karakter olacak şekilde ayarlanmıştır. Lütfen karakter sınırını aşmadan, gerekirse dizi şeklinde duyurular ekleyerek kullanınız.' , '20-9-16'),
(3, 3, 'Yönetici panelinde "Duyuru Ekle" sekmesine tıklayınız.', 'Duyuru içeriği bu şekilde gözükmektedir. Duyuruların detayları maksimum 1000 karakter olacak şekilde ayarlanmıştır. Lütfen karakter sınırını aşmadan, gerekirse dizi şeklinde duyurular ekleyerek kullanınız.' , '20-8-17'),
(4, 4, 'Yeni duyuru eklemek için yönetici paneline gidiniz.', 'Duyuru içeriği bu şekilde gözükmektedir. Duyuruların detayları maksimum 1000 karakter olacak şekilde ayarlanmıştır. Lütfen karakter sınırını aşmadan, gerekirse dizi şeklinde duyurular ekleyerek kullanınız.', '20-6-18'),
(5, 5, 'Duyurular bu alan üzerinden gösterilecektir.', 'Duyuru içeriği bu şekilde gözükmektedir. Duyuruların detayları maksimum 1000 karakter olacak şekilde ayarlanmıştır. Lütfen karakter sınırını aşmadan, gerekirse dizi şeklinde duyurular ekleyerek kullanınız.' , '20-6-19');

INSERT INTO `Personel` VALUES 
(1, 'kullaniciadi1', '0', 'Test Staff 1', '0545 000 00 00', 'ts1@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(2, 'kullaniciadi2', '0', 'Test Staff 2', '0545 000 00 00', 'ts2@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(3, 'kullaniciadi3', '0', 'Test Staff 3', '0545 000 00 00', 'ts3@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(4, 'kullaniciadi4', '0', 'Test Staff 4', '0545 000 00 00', 'ts4@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(5, 'kullaniciadi5', '0', 'Test Staff 5', '0545 000 00 00', 'ts5@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(6, 'kullaniciadi6', '0', 'Test Staff 6', '0545 000 00 00', 'ts6@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(7, 'kullaniciadi7', '0', 'Test Staff 7', '0545 000 00 00', 'ts7@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(8, 'kullaniciadi8', '0', 'Test Staff 8', '0545 000 00 00', 'ts8@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(9, 'kullaniciadi9', '0', 'Test Staff 9', '0545 000 00 00', 'ts9@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(10, 'kullaniciadi10', '0', 'Test Staff 10', '0545 000 00 00', 'ts10@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(11, 'kullaniciadi11', '0', 'Test Staff 11', '0545 000 00 00', 'ts11@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F'),
(12, 'kullaniciadi12', '0', 'Test Staff 12', '0545 000 00 00', 'ts12@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F');

INSERT INTO `Kitap` VALUES 
(1, 'Simyacı', '9789750726439', 2010, 2, 1, 3, 'Roman', 'K4-S3-S7', 3),
(2, 'Cesur Yeni Dünya', '9789756902165', 2003, 3, 2, 3, 'Roman', 'K4-S4-S6', 0),
(3, 'Otomatik Portakal', '9786052957929', 2019, 4, 3, 3,'Roman', 'K4-S2-S8', 1),
(4, 'Yabancı', '9789750741272', 1996, 5, 1, 4,'Roman', 'K4-S3-S2', 0),
(5, 'Sisifos Söyleni', '9789750726231', 1997, 6, 1, 4,'Deneme', 'K2-S1-S2', 4),
(6, 'Tesla', '9786051715834', 2017, 7, 4, 5,'Biyografi & Oto Biyografi', 'K2-S3-S7', 3),
(7, 'Büyük Sorulara Kısa Yanıtlar', '9786051719092', 2018, 7, 4, 6,'Popüler Bilim', 'K3-S1-S3', 6),
(8, 'İnsan Nedir?', '9786052245095', 2020, 8, 5, 7, 'Felsefe', 'K5-S6-S1', 3),
(9, 'Kağnı Gölgesindeki İt', '9789759038496', 2005, 1, 6, 8,'Roman', 'K4-S3-S7', 1),
(10, 'Test Book 1', '9789750726439', 2010, 2, 1, 3, 'Roman', 'K4-S3-S7', 3),
(11, 'Test Book 2', '9789750726111', 2003, 3, 2, 3, 'Roman', 'K4-S4-S6', 2),
(12, 'Test Book 3', '9789750726112', 2019, 4, 3, 3,'Roman', 'K4-S2-S8', 1),
(13, 'Test Book 4', '9789750726113', 1996, 5, 1, 4,'Roman', 'K4-S3-S2', 0),
(14, 'Test Book 5', '9789750726114', 1997, 6, 1, 4,'Deneme', 'K2-S1-S2', 4),
(15, 'Test Book 6', '9789750726115', 2017, 7, 4, 5,'Biyografi & Oto Biyografi', 'K2-S3-S7', 3),
(16, 'Test Book 7', '9789750726117', 2018, 7, 4, 6,'Popüler Bilim', 'K3-S1-S3', 6);

INSERT INTO `yayinEvi` VALUES
(1, 'Can Yayınları', 'Adres Bilgisi'),
(2, 'İthaki Yayınları', 'Adres Bilgisi'),
(3, 'İş Bankası Kültür Yayınları', 'Adres Bilgisi'),
(4, 'Alfa Yayıncılık', 'Adres Bilgisi'),
(5, 'Flipper Yayıncılık', 'Adres Bilgisi'),
(6, 'Nesin Yayınevi', 'Adres Bilgisi');

INSERT INTO `Yazar` VALUES
(1, 'Test Author 1'),
(2, 'Test Author 2'),
(3, 'Paulo COELHO'),
(4, 'Albert CAMUS'),
(5, 'Nikola TESLA'),
(6, 'Stephen HAWKING'),
(7, 'Mark TWAIN'),
(8, 'Aziz NESİN'),
(9, 'Test Author 3'),
(10, 'Test Author 4');

INSERT INTO `Cevirmen` VALUES
(1, 'Çevrilmemiş Kitap.'),
(2, 'Özdemir İNCE'),
(3, 'Ümit TOSUN'),
(4, 'Aziz ÜSTEL'),
(5, 'Samih TİRYAKİOĞLU'),
(6, 'Tahsin YÜCEL'),
(7, 'Mehmet Ata ARSLAN'),
(8, 'Esra Damla İPEKÇİ');

INSERT INTO `Uye` VALUES
(1, 'testuser1', '0', 'Test User 1', '0545 000 00 00', 'tu1@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(2, 'testuser2', '0', 'Test User 2', '0545 000 00 00', 'tu2@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(3, 'testuser3', '0', 'Test User 3', '0545 000 00 00', 'tu3@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(4, 'testuser4', '0', 'Test User 4', '0545 000 00 00', 'tu4@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '1'),
(5, 'testuser5', '0', 'Test User 5', '0545 000 00 00', 'tu5@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(6, 'testuser6', '0', 'Test User 6', '0545 000 00 00', 'tu6@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(7, 'testuser7', '0', 'Test User 7', '0545 000 00 00', 'tu7@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(8, 'testuser8', '0', 'Test User 8', '0545 000 00 00', 'tu8@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(9, 'testuser9', '0', 'Test User 9', '0545 000 00 00', 'tu9@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(10, 'testuser10', '0', 'Test User 10', '0545 000 00 00', 'tu10@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(11, 'testuser11', '0', 'Test User 11', '0545 000 00 00', 'tu11@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0'),
(12, 'testuser12', '0', 'Test User 12', '0545 000 00 00', 'tu12@domain.com', 'A Mahallesi, B Sokak, C Apartmanı, D Kat, E Daire, Merkez/F', 'Öğrenci', '0');

INSERT INTO `kitapDurum` VALUES
(1, 1, 1, '20-9-20', '20-9-23', 0),
(2, 2, 2, '20-9-07', '20-9-23', 0),
(3, 3, 3, '20-8-20', '20-9-24', 0),
(4, 5, 4, '20-8-16', '20-9-22', 0),
(5, 6, 5, '20-9-08', '20-9-24', 1),
(6, 7, 6, '20-9-20', '20-9-22', 1),
(7, 8, 7, '20-9-16', '20-9-23', 0),
(8, 1, 8, '20-9-11', '20-9-24', 0),
(9, 2, 9, '20-8-20', '20-9-22', 0),
(10, 3, 1, '20-8-16', '20-9-11', 0),
(11, 5, 2, '20-8-14', '20-9-11', 0),
(12, 6, 3, '20-8-20', '20-9-8', 0),
(13, 7, 4, '20-8-11', '20-9-8', 0),
(14, 8, 5, '20-8-11', '20-9-7', 0),
(15, 1, 6, '20-8-20', '20-9-6', 1),
(16, 2, 7, '20-8-13', '20-9-6', 0),
(17, 3, 8, '20-8-20', '20-9-7', 1),
(18, 4, 9, '20-8-16', '20-9-8', 0);

ALTER TABLE kitap
add FOREIGN KEY (`kitap_yazarid`) REFERENCES Yazar(`yazar_id`),
add FOREIGN KEY (`kitap_cevirmenid`) REFERENCES Cevirmen(`cevirmen_id`),
add FOREIGN KEY (`kitap_yayineviid`) REFERENCES YayinEvi(`yayinevi_id`);

ALTER TABLE kitapdurum
add FOREIGN KEY (`uye_id`) REFERENCES uye(`uye_id`),
add FOREIGN KEY (`kitap_id`) REFERENCES kitap(`kitap_id`);

ALTER TABLE Duyuru 
add FOREIGN KEY (`duyuru_sahibi`) REFERENCES Personel(`personel_id`);