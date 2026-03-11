# BÁO CÁO TUẦN 1

## HTML Căn bản

### 1. Giới thiệu về HTML

- HTML (Hyper Text Markup Language)-Ngôn ngữ đánh dấu siêu văn bản
- Là một ngôn ngữ dùng để xây dựng một trang Web.
- Chứa các thành phần định dạng để báo cho trình duyệt Web biết cách để hiển thị một trang Web.

### 2. Cấu trúc của 1 tài liệu HTML

- `<html></html>` : Định nghĩa phạm vi của văn bản HTML
- `<head></head>` : Định nghĩa các mô tả về trang HTML. Thông tin trong tag này không được hiển thị trên trang web
- `<title></title>` : Mô tả tiêu đề trang web
- `<body></body>` : Xác định vùng thân của trang web, nơi chứa các thông tin

### 3. Các tag cơ bản

- Các Tag xử lý văn bản: Các thẻ định dạng khối văn bản(Tiêu đề, Đoạn văn bản, Danh sách, Đường kẻ ngang), Các thẻ định dạng chuổi văn bản(Định dạng chữ, Tạo siêu liên kết, Xuống dòng)
- Tag hình ảnh: `<img>`(thuộc tính: SRC, ALT, Position, Border), đặt ảnh nền cho trang web(`<body Background=‘Image Path’>`)
- Tag âm thanh: `<bgsound>`, thuộc tính(SRC, Loop), thường đặt trong tag <head> của trang web.

### 4. Các tag danh sách

| Kiểu danh sách            | Thẻ    | Phần tử trong DS |
| ------------------------- | ------ | ---------------- |
| Danh sách có thứ tự       | `<ol>` | `<li>`           |
| Danh sách không có thứ tự | `<ul>` | `<li>`           |
| Danh sách tự định nghĩa   | `<dl>` | `<dt>`, `<di>`   |

### 5. Tag liên kết trang

- Cú pháp : `<a href="URL“ target=‘......’> Linked content </a>`
- Thuộc tính target của tag `<a>`
  - name: tải trang web vào frame có tên NAME
  - \_blank: tải trang web vào cửa sổ mới
  - \_parent: tải trang web vào cửa sổ cha của nó
  - \_self: tải trang web vào chính cửa sổ hiện hành
  - \_top: tải trang web vào cửa số cao nhất

- Liên kết ngoại (External link): Dẫn đến một trang web khác hoàn toàn (ví dụ dẫn sang Facebook, Google).
- Liên kết nội (Internal link): Dẫn đến một vị trí khác trên cùng một trang web hoặc giữa các trang trong cùng một thư mục.
- Liên kết email (Email link): Khi click vào sẽ tự động mở ứng dụng gửi thư (Outlook, Gmail) với địa chỉ nhận được điền sẵn (thường bắt đầu bằng mailto:).

- Địa chỉ URL phân làm 2 loại :
  - Địa chỉ tuyệt đối : Là vị trí tuyệt đối so với Mạng Internet
  - Địa chỉ tương đối : Là vị trí tương đối so với trang web hiện hành đang chứ liên kết.

### 6. Tag kẻ bảng

| STT | Tên thẻ HTML         | Mô tả-Ví dụ     |
| --- | -------------------- | --------------- |
| 1   | `<table>...</table>` | Khởi tạo 1 bảng |
| 2   | `<tr>...</tr>`       | Tạo 1 dòng      |
| 3   | `<th>...</th>`       | Tạo 1 ô tiêu đề |
| 4   | `<td>...</td>`       | Tạo 1 ô         |

### 7. Form

_Giới thiệu Form_

- Được dùng để nhận dữ liệu từ phía người dùng
- Giúp gởi yêu cầu của người dùng đến trang xử lý
  trong ứng dụng web
- Tag <form> dùng để chứa các thành phần khác của
  form
- Những thành phần nhập liệu được gọi là Form Field
  - text field
  - password field
  - multiple-line text field
  - ...

_Tag `<Form>`_

- Là container chứa các thành phần nhập liệu khác.
  `<FORM NAME=“...” ACTION=“...” METHOD=“...”>`
  `<!-- các thành phần của Form -->`
  `</FORM>`
- Các thuộc tính của `</FORM>`
- NAME : tên FORM
- ACTION : chỉ định trang web nhận xử lý dữ liệu từ FORM này khi có sự kiện click của button SUBMIT.
- METHOD : Xác định phương thức chuyển dữ liệu (POST,GET)

_Các thành phần của Form_

| Các loại Form Field      | Chức năng                                                                                                       |
| ------------------------ | --------------------------------------------------------------------------------------------------------------- |
| Text field               | Dùng để nhập một dòng văn bản                                                                                   |
| Password field           | Dùng để nhập mật khẩu                                                                                           |
| Hidden Text field        | Dùng để lưu trữ các giá trị mà người dùng không thể nhìn thấy hoặc chỉnh sửa trực tiếp trên giao diện trang web |
| Check box                | Hiện ô để tích lựa chọn                                                                                         |
| Radio button             | Hiện ô để tích lựa chọn (chỉ chọn được 1)                                                                       |
| File Form Control        | Dùng để upload 1 file lên server                                                                                |
| Submit Button            | Nút phát lệnh và gởi dữ liệu của form đến trang xử lý, chỉ có một nút submit và nút này được viền đậm           |
| Reset Button             | Dùng để trả lại giá trị mặc định cho các control khác trong form                                                |
| Generalized Button       | Nút bấm tổng quát/đa năng, không mang các chức năng mặc định                                                    |
| Multiple-line text field | Dùng để nhập văn bản nhiều dòng                                                                                 |
| Label                    | Dùng để gán nhãn cho một Form Field                                                                             |
| Pull-down menu           | Dùng để tạo ra một combo box                                                                                    |
| Scrolled list            | Hiển thị một danh sách các lựa chọn dưới dạng một khung có thanh cuộn thay vì danh sách thả xuống đơn thuần     |
| Field Set                | Dùng để tạo ra Group box, nhóm các thành phần nhập liệu trong form                                              |
|                          |

### 8. Một số thẻ HTML đặc biệt

- Thẻ Meta
  - Đặt ở giữa <head>...</head>
  - Thường dùng quy định thuộc tính cho trang web
  - Tác dụng: font, tìm kiếm, chuyển trang...
  - 2 cách viết thẻ `<meta>`:
    `<META NAME="name" CONTENT="content“>`
    `<META HTTP-EQUIV="name“ CONTENT="content“>`
  - Thẻ meta với font
  - Thẻ meta cho phép tìm kiếm: Khai báo các từ khóa để các Search Engineer tìm kiếm: author, keywords,...
  - Thẻ meta tự động chuyển URL
- Thẻ Script
  - Muốn kiểm soát các hành động của người dùng
  - Khai báo các phương thức xử lý phía Client => Client Script: JavaScript và VBScript
  - Cú pháp
    `<SCRIPT language=“javascript”>`
    lệnh;
    `</SCRIPT>`
- Thẻ Marquee
  - Dùng để tạo hiệu ứng chữ chạy trên màn hình trình duyệt
  - Tự động chuyển hướng trang web sang trang web khác (URL) sau một khoảng thời gian t (tính theo giây)

## CSS Căn bản

### 1. Giới thiệu về CSS

- CSS = Casscading Style Sheets
- Dùng để mô tả cách hiển thị các thành phần trên trang WEB
- Style tiết kiệm thời gian
- CSS dễ thay đổi
- Sự nhất quán
- Khả năng chi phối đa dạng
- Tạo ra định dạng chung cho toàn bộ Web

### 2. Định nghĩa Style

- Kiểu 1:
  - `<tag style =
“property1:value1;
property2:value2;
.........
propertyN:valueN;”>...</tag>`
- Kiểu 2:
  - `SelectorName {
property1:value1;
property2:value2;
.........
propertyN:valueN;}
<tag class = “SelectorName”>
.........
</tag>`

- Ghi chú: Sử dụng `/*Ghi chú*/`

### 3. Sử dụng và phân loại CSS

- Gồm 3 loại CSS
  - Inline Style Sheet (Nhúng CSS vào tag HTML)
  - Embedding Style Sheet (Nhúng CSS vào trang web)
  - External Style Sheet (Liên kết CSS với trang web)

- Inline Style Sheet:
  - Định nghĩa style trong thuộc tính style của từng tag
    HTML.
  - Theo cú pháp kiểu 1.
    `<tag style = “property1:value1;...propertyN:valueN;”> .... </tag>`
- Embedding Style Sheet:
  - Còn gọi là Internal Style Sheet hoặc Document-Wide Style Sheet
  - Mọi định nghĩa style được đặt trong tag `<style>` của trang HTML.
  - Định nghĩa style theo cú pháp kiểu 2.
- External Style Sheet:
  - Mọi style đều lưu trong file có phần mở rộng là \*.CSS.
  - File CSS: lưu trữ nhiều style theo cú pháp kiểu 2.

  - Trong file HTML: liên kết bằng tag link.

  <!-- ```<head>
  <link rel=“stylesheet” href=“URL” type="text/css">
  </head> -->
  - Trang HTML : Liên kết bằng tag style với @import url.
  <!-- <head>
  <style type=“text/css” media="all | print | screen" >

  @import url(URL);

    </style>
    </head>
  ``` -->

### 4. Độ ưu tiên:

- Thứ tự ưu tiên áp dụng định dạng khi sử dụng các loại CSS (độ ưu tiên giảm dần) :
  - Inline Style Sheet
  - Embedding Style Sheet
  - External Style Sheet
  - Browser Default

### 5. Selector trong CSS và phạm vi ảnh hưởng

- Selector (Bộ chọn) là công cụ dùng để "nhắm mục tiêu" các phần tử HTML mà bạn muốn áp dụng phong cách (style). Nó nói cho trình duyệt biết: "Hãy tìm tất cả các phần tử X và tô màu đỏ cho chúng".

### 5. Selector trong CSS và phạm vi ảnh hưởng

| Loại                                 | Mô tả phạm vi ảnh hưởng                                                                          | Ví dụ                                                                                                                        |
| :----------------------------------- | :----------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| **element**                          | Định dạng áp dụng cho ND tất cả các tag **Element** trong tài liệu Web                           | `h1 {color: red;}` <br> /_ ND của thẻ `<h1>` bị định dạng màu chữ=đỏ _/                                                      |
| **#id**                              | Định dạng áp dụng cho ND tất cả các tag có thuộc tính **id** trong tài liệu Web                  | `#test {color: green;}` <br> /_ ND của bất kỳ tag có thuộc tính id=test đều bị định dạng màu chữ=xanh lá _/                  |
| **.class**                           | Định dạng áp dụng cho ND tất cả các tag có thuộc tính **class** trong tài liệu Web               | `.note {color: yellow;}` <br> /_ ND của bất kỳ tag có thuộc tính class=note đều bị định dạng màu chữ=vàng _/                 |
| **element . class**                  | Định dạng áp dụng cho ND các tag **Element** có thuộc tính **class** tương ứng                   | `h1.note {text-decoration: underline;}` <br> /_ ND của các thẻ `<h1>` có thuộc tính class=note đều bị định dạng gạch chân _/ |
| **Grouping**                         | Định dạng áp dụng cho ND một nhóm các tag trong tài liệu.                                        | `h1,h2,h3 {background-color: orange;}` <br> /_ ND của các thẻ `<h1>` `<h2>` `<h3>` đều bị định dạng màu nền = màu cam _/     |
| **Contextual**                       | Định dạng áp dụng cho ND các thẻ được lồng trong một thẻ cha nào đó                              | `p strong {color: purple;}` <br> /_ ND của các thẻ `<strong>` nằm trong thẻ `<p>` đều bị định dạng màu chữ=màu tía _/        |
| **Pseudo Class <br> Pseudo element** | Định dạng dựa vào trạng thái của liên kết, sự kiện chuột. <br> Có thể kết hợp với Selector khác. | `a:hover {color: blue;}` <br> /_ Đổi màu liên kết khi người dùng di chuột qua _/                                             |

### 6. Một số quy ước về đơn vị trong CSS

- Đơn vị chiều dài

| Đơn vị | Mô tả                                                                                           |
| ------ | ----------------------------------------------------------------------------------------------- |
| %      | Phần trăm                                                                                       |
| In     | Inch (1 inch = 2.54 cm)                                                                         |
| cm     | Centimeter                                                                                      |
| mm     | Millimeter                                                                                      |
| pc     | Pica (1 pc = 12 pt)                                                                             |
| px     | Pixels (điểm ảnh trên màn hình máy tính)                                                        |
| pt     | Point (1 pt = 1/72 inch)                                                                        |
| em     | 1 em tương đương kích thước font hiện hành, nếu font hiện hành có kích cỡ 14px thì 1 em = 14 px |

- Đơn vị màu sắc:

| Đơn vị          | Mô tả                                                                              |
| --------------- | ---------------------------------------------------------------------------------- |
| Color-name      | Tên màu. Ví dụ: black, white,...                                                   |
| RGB (r,g,b)     | Màu RGB với 3 giá trị R, G, B có trị từ 0 – 255 kết hợp với nhau tạo ra vô số màu. |
| RGB(%r,%g,%b)   | Màu RGB với 3 giá trị R, G, B có trị từ 0 – 100% kết hợp.                          |
| Hexadecimal RGB | Mã màu RGB dạng hệ thập lục. Ví dụ: #FFFF: trắng, #000: đen,...                    |

### 7. CSS Background

- Thuộc tính Background cho phép thiết lập màu nền, ảnh nền, lặp ảnh...
  - background-color
    - Thường áp dụng cho thẻ: body và các thẻ hiển thị dữ liệu: DIV, P, H1...để đặt màu nền
  - background-image
    - Thường sử dụng để chèn một ảnh nền BODY
    - Căn ảnh, xác định vị trí ảnh và cho phép lặp ảnh hay không

### 8. CSS Text

- direction
  - ltr: left to right. Chữ hiển thị từ bên trái sang phải
  - rtl: right to left. Chữ hiển thị từ bên phải sang trái letter-spacing
  - Tăng/giảm khoảng cách giữa các kí tự so với trạng thái thông thường (normal)
    - Giá trị có thể là số dương hoặc âm
- text-align
  - Căn nội dung văn bản theo chiều ngang: left, center, right, justify

### 9. CSS Font

- font-family
  - Các kiểu font: Liệt kê các font sử dụng, ngăn cách nhau bởi dấu ;
  - font-size
    - Đặt kích thước cho văn bản. Mặc định kích thước thông thường là 16px
- font-style
- font-weight

### 10. Mô hình hộp

- Có 2 loại hộp:
  - Block-Level Elements: có thể chứa các phần tử nội tuyến và các phần tử block-level khác. Block-box được
    sinh ra bởi thẻ p, div, table
  - Inline Elements xuất hiện bên trong nội dung, và có thể chứa văn bản hoặc các phần tử inline khác. Ví dụ: a, em, strong, img, input.
- Thuộc tính display
  - block: sinh ra một block box
  - inline : sinh ra một inline box
  - list-item: sinh ra danh sách box

### 11. CSS Margin

- Tương ứng với 4 phía ta có 4 thuộc tính:
- margin-top:
- margin-right:
- margin-bottom:
- margin-left:
  - Để cho gọn chúng ta cũng có thể viết thuộc tính margin dưới dạng shorthand
    - div.margin { margin: 10px 4px 5px 9px};
    - `/* top | right | bottom | left*/`

- Nếu muốn đặt màu cho đường bao chúng ta có thể sử dụng thuộc tính outline-color
- Để đặt độ rộng cho đường bao chúng ta đặt giá trị độ lớn cho thuộc tính outline-width
- Để chọn kiểu cho đường bao chúng ta sẽ đặt lần lượt các giá trị cho thuộc tính outline-style

### 12. CSS Border

- Chỉ ra độ rộng, màu và kiểu của vùng border của box. Thuộc tính này áp dụng cho tất cả các phần tử:
  - border-color: Phải đi kèm với border-style
  - border-width:
  - border-style:
