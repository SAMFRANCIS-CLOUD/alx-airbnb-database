-- Indexes for Optimization
-- 1. Index on User Table for columns frequently used in WHERE or JOIN
CREATE INDEX idx_user_id ON users(id);
CREATE INDEX idx_user_name ON users(name);

-- 2. Index on Booking Table for columns frequently used in WHERE or JOIN
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_date ON bookings(booking_date);

-- 3. Index on Property Table for columns frequently used in WHERE or ORDER BY
CREATE INDEX idx_property_id ON properties(id);
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_price ON properties(price);
