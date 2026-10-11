USE ecommerce_db;

-- 1. Categories
INSERT INTO categories (category_name, description) VALUES
('Điện thoại & Tablet', 'Thiết bị di động thông minh'),
('Laptop & Máy tính', 'Máy tính xách tay và linh kiện PC'),
('Phụ kiện công nghệ', 'Tai nghe, cáp sạc, chuột bàn phím'),
('Thời trang nam', 'Quần áo và giày dép nam'),
('Gia dụng & Đời sống', 'Thiết bị nhà bếp và chăm sóc nhà cửa'),
('Sách & Văn phòng phẩm', 'Sách kỹ năng, tiểu thuyết, giáo trình'),
('Đồng hồ thông minh', 'Smartwatch và vòng tay theo dõi sức khỏe'),
('Âm thanh', 'Loa Bluetooth, soundbar, ampli'),
('Mỹ phẩm & Chăm sóc da', 'Sản phẩm dưỡng da và trang điểm'),
('Thể thao & Dã ngoại', 'Dụng cụ tập gym và cắm trại');

-- 2. Customers
INSERT INTO customers (full_name, email, phone, address) VALUES
('Nguyen Van A', 'nguyenvana@gmail.com', '0901234567', 'Quan 1, TP Ho Chi Minh'),
('Tran Thi B', 'tranthib@gmail.com', '0912345678', 'Ba Dinh, Ha Noi'),
('Le Van C', 'levanc@gmail.com', '0923456789', 'Hai Chau, Da Nang'),
('Pham Minh D', 'phamminhd@gmail.com', '0934567890', 'Cau Giay, Ha Noi'),
('Hoang Thi E', 'hoangthie@gmail.com', '0945678901', 'Ninh Kieu, Can Tho'),
('Doan Van F', 'doanvanf@gmail.com', '0956789012', 'Quan 7, TP Ho Chi Minh'),
('Bui Thi G', 'buithig@gmail.com', '0967890123', 'Thanh Khe, Da Nang'),
('Vuong Minh H', 'vuongminhh@gmail.com', '0978901234', 'Dong Da, Ha Noi'),
('Dinh Van I', 'dinhvani@gmail.com', '0989012345', 'Quan 3, TP Ho Chi Minh'),
('Ngo Thi K', 'ngothik@gmail.com', '0990123456', 'Ha Dong, Ha Noi');

-- 3. Products
INSERT INTO products (category_id, product_name, price, stock_quantity, status) VALUES
(1, 'iPhone 15 Pro 128GB', 27990000, 45, 'ACTIVE'),
(1, 'Samsung Galaxy S24 Ultra', 29990000, 30, 'ACTIVE'),
(2, 'MacBook Air M2 16GB', 26500000, 20, 'ACTIVE'),
(2, 'Dell XPS 13 9315', 24900000, 15, 'ACTIVE'),
(3, 'Chuột Logitech MX Master 3S', 2290000, 100, 'ACTIVE'),
(3, 'Bàn phím cơ Keychron K2V2', 1850000, 50, 'ACTIVE'),
(7, 'Apple Watch Series 9 GPS', 10290000, 25, 'ACTIVE'),
(8, 'Tai nghe Sony WH-1000XM5', 7990000, 40, 'ACTIVE'),
(8, 'Loa Marshall Stanmore III', 8900000, 12, 'ACTIVE'),
(5, 'Nồi chiên không dầu Philips', 3200000, 35, 'ACTIVE'),
(6, 'Sách Clean Code tiếng Việt', 250000, 150, 'ACTIVE');

-- 4. Orders
INSERT INTO orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2026-09-01 10:00:00', 30280000, 'COMPLETED'),
(2, '2026-09-02 11:30:00', 26500000, 'COMPLETED'),
(3, '2026-09-03 14:15:00', 4140000, 'COMPLETED'),
(1, '2026-09-05 09:20:00', 7990000, 'PROCESSING'),
(4, '2026-09-06 16:45:00', 29990000, 'COMPLETED'),
(5, '2026-09-07 18:00:00', 3200000, 'PENDING'),
(6, '2026-09-08 08:30:00', 10290000, 'CANCELLED'),
(7, '2026-09-09 13:10:00', 500000, 'COMPLETED'),
(8, '2026-09-10 15:25:00', 8900000, 'COMPLETED'),
(9, '2026-09-11 17:40:00', 2290000, 'PROCESSING');

-- 5. Order Items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 27990000),
(1, 5, 1, 2290000),
(2, 3, 1, 26500000),
(3, 5, 1, 2290000),
(3, 6, 1, 1850000),
(4, 8, 1, 7990000),
(5, 2, 1, 29990000),
(6, 10, 1, 3200000),
(7, 7, 1, 10290000),
(8, 11, 2, 250000),
(9, 9, 1, 8900000),
(10, 5, 1, 2290000);

-- 6. Payments
INSERT INTO payments (order_id, payment_method, payment_status, payment_date, amount_paid) VALUES
(1, 'CREDIT_CARD', 'PAID', '2026-09-01 10:05:00', 30280000),
(2, 'BANK_TRANSFER', 'PAID', '2026-09-02 11:35:00', 26500000),
(3, 'E_WALLET', 'PAID', '2026-09-03 14:20:00', 4140000),
(4, 'BANK_TRANSFER', 'PAID', '2026-09-05 09:25:00', 7990000),
(5, 'CREDIT_CARD', 'PAID', '2026-09-06 16:50:00', 29990000),
(6, 'COD', 'UNPAID', NULL, 3200000),
(7, 'CREDIT_CARD', 'REFUNDED', '2026-09-08 09:00:00', 10290000),
(8, 'COD', 'PAID', '2026-09-10 10:00:00', 500000),
(9, 'E_WALLET', 'PAID', '2026-09-10 15:30:00', 8900000),
(10, 'BANK_TRANSFER', 'UNPAID', NULL, 2290000);

-- 7. Reviews
INSERT INTO reviews (customer_id, product_id, rating, comment) VALUES
(1, 1, 5, 'Máy dùng rất mượt, viền titan nhẹ hơn đời trước nhiều.'),
(1, 5, 4, 'Chuột cầm êm tay, cuộn vô cực rất thích.'),
(2, 3, 5, 'MacBook pin cực trâu, hoàn thiện xuất sắc.'),
(3, 5, 5, 'Đáng giá từng xu cho dân văn phòng.'),
(3, 6, 4, 'Bàn phím gõ nảy nhưng switch hơi ồn.'),
(4, 2, 5, 'Màn hình hiển thị chống chói cực đỉnh.'),
(7, 11, 5, 'Sách gối đầu giường cho mọi lập trình viên.'),
(8, 9, 5, 'Chất âm loa Marshall ấm và chi tiết, decor phòng rất đẹp.'),
(9, 5, 4, 'Dùng tốt trên macOS.');
