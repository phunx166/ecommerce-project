USE ecommerce_db;

-- ========================================================
-- BONUS 1: TRANSACTION (Hoan tien va huy don hang an toan)
-- ========================================================
START TRANSACTION;
UPDATE payments SET payment_status = 'REFUNDED' WHERE order_id = 7;
UPDATE orders SET order_status = 'CANCELLED' WHERE order_id = 7;
COMMIT;

-- ========================================================
-- BONUS 2: PHAN QUYEN USER (GRANT)
-- ========================================================
-- Tao tai khoan nhan vien chi duoc xem bao cao
CREATE USER IF NOT EXISTS 'reporter_user'@'localhost' IDENTIFIED BY 'Reporter@2026';
GRANT SELECT ON ecommerce_db.view_order_summary TO 'reporter_user'@'localhost';
FLUSH PRIVILEGES;
