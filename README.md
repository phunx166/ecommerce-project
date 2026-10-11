# Hệ Thống Quản Lý Bán Hàng Trực Tuyến (E-Commerce Database System)

## 1. Giới thiệu dự án
Dự án thiết kế cơ sở dữ liệu quan hệ cho hệ thống thương mại điện tử, quản lý danh mục, sản phẩm, khách hàng, đơn hàng, thanh toán và đánh giá. Đạt chuẩn chuẩn hóa 3NF.

## 2. Công nghệ sử dụng
- HQT CSDL: MySQL
- Công cụ: Terminal, TablePlus, Git

## 3. Cấu trúc thư mục
- `erd/`: Chứa sơ đồ thiết kế CSDL (ERD).
- `sql/`: Các script tạo cấu trúc bảng (`01_schema.sql`), nạp dữ liệu (`02_seeds.sql`), tính năng nâng cao (`03_bonus_admin.sql`) và file backup.
- `queries/`: File chứa 10 câu truy vấn SQL khai thác dữ liệu.
- `docs/`: File báo cáo cá nhân tổng kết dự án.

## 4. Hướng dẫn khởi chạy script
1. Khởi tạo cấu trúc và Trigger/View/Procedure:
   `mysql -u root -p < sql/01_schema.sql`
2. Nạp dữ liệu mẫu:
   `mysql -u root -p ecommerce_db < sql/02_seeds.sql`
3. Kiểm tra các câu truy vấn nghiệp vụ:
   `mysql -u root -p ecommerce_db < queries/queries.sql`
