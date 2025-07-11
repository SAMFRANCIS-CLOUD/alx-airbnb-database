-- 1. Find the total number of bookings made by each user using COUNT and GROUP BY
SELECT
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
JOIN
    bookings ON users.id = bookings.user_id
GROUP BY
    users.id
ORDER BY
    total_bookings DESC;
