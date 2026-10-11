USE ecommerce_db;

-- ==============================================================================
-- Query 1: SELECT co ban voi WHERE, ORDER BY, LIMIT
-- Muc dich: Tim 3 san pham co gia cao nhat dang mo ban (ACTIVE)
-- ==============================================================================
SELECT product_id, product_name, price, stock_quantity
FROM products
WHERE status = 'ACTIVE'
ORDER BY price DESC
LIMIT 3;

-- ==============================================================================
-- Query 2: JOIN (INNER JOIN, LEFT JOIN) giua nhieu bang
-- Muc dich: Thong ke don hang kem ten khach hang va thong tin thanh toan
-- ==============================================================================
SELECT 
    c.full_name, 
    c.phone, 
    o.order_id, 
    o.total_amount, 
    COALESCE(p.payment_method, 'CHUA CHON') AS payment_method,
    COALESCE(p.payment_status, 'CHUA THANH TOAN') AS payment_status
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id
ORDER BY o.order_date DESC;

-- ==============================================================================
-- Query 3: GROUP BY voi cac ham tong hop (COUNT, SUM) va HAVING
-- Muc dich: Doanh thu theo danh muc cua cac don COMPLETED co tong tien > 10,000,000
-- ==============================================================================
SELECT 
    cat.category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories cat
JOIN products p ON cat.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'COMPLETED'
GROUP BY cat.category_id, cat.category_name
HAVING total_revenue > 10000000
ORDER BY total_revenue DESC;

-- ==============================================================================
-- Query 4: Subquery trong WHERE va SELECT
-- Muc dich: Lay san pham co gia cao hon gia trung binh toan bo cua hang
-- ==============================================================================
SELECT 
    product_name, 
    price,
    ROUND(price - (SELECT AVG(price) FROM products), 2) AS price_diff_from_avg
FROM products
WHERE price > (SELECT AVG(price) FROM products)
ORDER BY price DESC;

-- ==============================================================================
-- Query 5: Window Function (DENSE_RANK voi PARTITION BY)
-- Muc dich: Xep hang gia san pham trong tung danh muc tuong ung
-- ==============================================================================
SELECT 
    c.category_name,
    p.product_name,
    p.price,
    DENSE_RANK() OVER (
        PARTITION BY p.category_id 
        ORDER BY p.price DESC
    ) AS ranking_in_category
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- ==============================================================================
-- Query 6: Nested query (Truy van long nhau trong FROM)
-- Muc dich: Tinh muc chi tieu trung binh cua moi khach hang da tung phat sinh don hang
-- ==============================================================================
SELECT 
    ROUND(AVG(customer_spending.total_spent), 2) AS avg_spending_per_active_customer
FROM (
    SELECT 
        customer_id, 
        SUM(total_amount) AS total_spent
    FROM orders
    WHERE order_status = 'COMPLETED'
    GROUP BY customer_id
) AS customer_spending;

-- ==============================================================================
-- Query 7: Truy van dieu kien voi CASE WHEN
-- Muc dich: Phan loai quy mo don hang (Nho, Trung binh, VIP)
-- ==============================================================================
SELECT 
    order_id, 
    customer_id, 
    total_amount,
    CASE 
        WHEN total_amount < 5000000 THEN 'Don hang nho'
        WHEN total_amount BETWEEN 5000000 AND 20000000 THEN 'Don hang trung binh'
        ELSE 'Don hang VIP'
    END AS order_tier
FROM orders
ORDER BY total_amount DESC;

-- ==============================================================================
-- Query 8: Tim du lieu khong ton tai voi NOT EXISTS
-- Muc dich: Tim khach hang da tao tai khoan nhung chua tung dat don hang nao
-- ==============================================================================
SELECT 
    c.customer_id, 
    c.full_name, 
    c.email, 
    c.phone
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM orders o 
    WHERE o.customer_id = c.customer_id
);

-- ==============================================================================
-- Query 9: Truy van phan trang (Pagination)
-- Muc dich: Lay trang thu 2 cua danh sach san pham (4 san pham moi trang)
-- ==============================================================================
SELECT 
    product_id, 
    product_name, 
    price, 
    stock_quantity
FROM products
ORDER BY product_name ASC
LIMIT 4 OFFSET 4;

-- ==============================================================================
-- Query 10: CTE (Common Table Expression - WITH)
-- Muc dich: Loc khach hang than thiet dat tong chi tieu tu 20 trieu tro len
-- ==============================================================================
WITH CustomerSpendingCTE AS (
    SELECT 
        o.customer_id,
        SUM(o.total_amount) AS total_spent,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    WHERE o.order_status = 'COMPLETED'
    GROUP BY o.customer_id
)
SELECT 
    c.full_name,
    c.email,
    cte.total_orders,
    cte.total_spent
FROM CustomerSpendingCTE cte
JOIN customers c ON cte.customer_id = c.customer_id
WHERE cte.total_spent >= 20000000
ORDER BY cte.total_spent DESC;
