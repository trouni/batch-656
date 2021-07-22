-- List all customers (name + email), ordered alphabetically (no extra information)

SELECT customers.first_name, customers.last_name, customers.email
FROM customers 
ORDER BY customers.last_name, customers.first_name

-- List tracks (Name + Composer) of the Classical playlist

SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
JOIN playlists ON playlist_tracks.playlist_id = playlists.id
WHERE playlists.name = "Classical"

-- List the 10 artists mostly listed in all playlists

SELECT COUNT(*) AS c, artists.name FROM artists
join albums ON albums.artist_id = artists.id
JOIN tracks on tracks.album_id = albums.id
JOIN playlist_tracks ON playlist_tracks.track_id = tracks.id
GROUP BY artists.name
ORDER BY c DESC
LIMIT 10

-- List the tracks which have been purchased at least twice, ordered by number of purchases

SELECT tracks.name, COUNT(*) AS c
FROM tracks
JOIN invoice_lines ON tracks.id = invoice_lines.track_id
GROUP BY tracks.id
HAVING c >= 2
ORDER BY c DESC
