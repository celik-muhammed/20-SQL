/*===================================================
SELECT
===================================================*/

/* Query the track names (name) in the tracks table -
	tracks tablosundaki track isimlerini (name) sorgulayınız */
 SELECT name FROM tracks;

/* Query the composer(Composer) and song names (name) in the tracks table -
	tracks tablosundaki besteci(Composer) ve şarkı isimlerini (name) sorgulayınız*/
 SELECT Composer,name FROM tracks;
 
/* Query all the information in the album table -
	album tablosundaki tüm bilgileri sorgulayınız*/
 SELECT * FROM albums;

/*===================================================
DISTINCT
===================================================4*/
/* Query the composer information in the tracks table (IT MAY BE REPEAT) -
	tracks tablosundaki composer bilgileri sorgulayınız (TEKRARLI OLABİLİR)*/
 SELECT Composer FROM tracks;
 
 /* Query the composer information in the tracks table (WITHOUT REPEAT) -
	tracks tablosundaki composer bilgileri sorgulayınız (TEKRARSIZ)*/
 SELECT DISTINCT Composer FROM tracks;