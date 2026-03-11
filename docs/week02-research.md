# BÁO CÁO TUẦN 2

## Các lưu ý khi cắt một khối giao diện từ Figma sang code

### 1. Phân tích cấu trúc (Layout) trước khi code

- Nhìn tổng thể bản thiết kế:
  - Chia khối (Container): Xác định đâu là Header, Navigation, Main Content, Sidebar và Footer.
  - Nhận diện các thành phần lặp lại: Các nút bấm (Button), thẻ bài viết (Card), hay Input form, dùng Kiểu (Class) để định nghĩa style một lần và dùng cho nhiều chỗ.
  - Grid/Flexbox: Xác định xem các hàng và cột nên dùng display: flex hay display: grid.

### 2. Chọn định dạng file khi Export từ Figma

- PNG (Portable Network Graphics): Ảnh cần nền trong suốt (transparent), ảnh có nhiều chi tiết sắc nét, các icon phức tạp mà không có file SVG.
  - Đặc điểm: Giữ nguyên chất lượng ảnh (không mất dữ liệu), nhưng dung lượng file thường lớn.
  - Ví dụ: Logo, ảnh nhân vật tách nền, các nút bấm có đổ bóng phức tạp.

- JPEG (Joint Photographic Experts Group): Các ảnh phong cảnh, ảnh chụp người, ảnh nền (background) có dung lượng lớn và không cần nền trong suốt.
  - Đặc điểm: Dung lượng file rất nhẹ nhờ nén dữ liệu, nhưng nếu nén quá tay ảnh sẽ bị vỡ (pixelated).
  - Ví dụ: Ảnh sản phẩm cho cửa hàng thời trang, ảnh banner trang chủ.

- SVG (Scalable Vector Graphics) - Ưu tiên hàng đầu cho Web: Các Icon, Logo dạng phẳng, các hình khối (Shapes).
  - Đặc điểm: Là dạng vector, bạn có thể phóng to vô hạn mà không bao giờ bị vỡ ảnh. Dung lượng cực nhẹ vì nó thực chất là các dòng code.
  - Ví dụ: Icon giỏ hàng, icon mạng xã hội, logo thương hiệu.

- PDF (Portable Document Format): Khi bạn muốn gửi bản thiết kế cho khách hàng xem hoặc để mang đi in ấn.
  - Đặc điểm: Không dùng để chèn vào code trang web trực tiếp như ảnh.

### 3. Kiểm tra các thông số trong Figma

- Khi click vào một phần tử trong Figma, nhìn sang bảng Inspect bên phải:
  - Spacing & Margin: Giữ phím Alt (Windows) và di chuột giữa các phần tử để xem khoảng cách chính xác (Padding/Margin).
  - Typography: Kiểm tra kỹ font-family, font-size, line-height và font-weight.
  - Lưu ý: Đừng quên line-height, nếu thiếu thông số này, các đoạn văn bản của bạn sẽ trông rất bí bách so với bản thiết kế.
  - Color: Copy mã màu HEX (ví dụ: #FFFFFF) để khai báo trong CSS.

### 4. Sử dụng đơn vị đo lường phù hợp

- px (Pixels): Dùng cho kích thước cố định, border.
- rem/em: Dùng cho font-size và khoảng cách để giao diện dễ dàng co giãn trên các thiết bị khác nhau (Responsive).
- % hoặc vw/vh: Dùng cho chiều rộng (width) của các khối lớn để chúng tự động tràn theo màn hình.
