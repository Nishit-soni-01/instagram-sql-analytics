-- 1. Finding 5 oldest users
SELECT * FROM users
ORDER BY created_at
LIMIT 5;
-- ***********************************************************************************************************************
-- 2. Ad Campaign Optimization (Peak Registration Days)
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- ***********************************************************************************************************************

-- 3. Targeted Email Marketing (Identifying Ghost Users)
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

-- ***********************************************************************************************************************

-- 4. Platform Superstars (Most Liked Photo)
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- ***********************************************************************************************************************

-- 5. Investor Metrics (Average User Post Rate)
SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 

-- ***********************************************************************************************************************