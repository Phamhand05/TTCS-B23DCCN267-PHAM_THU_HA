# BÁO CÁO TUẦN 3: Responsive cho một website - Responsive Web Design

### Ý nghĩa:

- Thiết kế web đáp ứng (responsive web design) là việc tạo ra các trang web hiển thị tốt trên mọi thiết bị.
- Thiết kế web thích ứng sẽ tự động điều chỉnh cho phù hợp với các kích thước màn hình và khung nhìn khác nhau.

## 1. The Viewport

- Setting The Viewport
  - Khung nhìn là khu vực người dùng có thể nhìn thấy của một trang web.
  - Kích thước khung nhìn sẽ khác nhau tùy thuộc vào thiết bị (sẽ nhỏ hơn nhiều trên điện thoại di động so với màn hình máy tính).
  - `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
  - --> _Thiết lập chiều rộng của trang sao cho phù hợp với chiều rộng màn hình của thiết bị (chiều rộng này sẽ khác nhau tùy thuộc vào thiết bị),mức độ thu phóng ban đầu khi trang được trình duyệt tải lần đầu._
- Size Content to The Viewport
  - Một số quy tắc bổ sung cần tuân theo:

1. _KHÔNG_ sử dụng các phần tử có chiều rộng cố định lớn - Ví dụ, nếu một hình ảnh có chiều rộng lớn hơn khung nhìn, nó sẽ khiến khung nhìn cuộn ngang. Hãy nhớ điều chỉnh nội dung này sao cho phù hợp với chiều rộng của khung nhìn.
2. _KHÔNG_ nên để nội dung phụ thuộc vào một chiều rộng cụ thể để hiển thị tốt - Vì kích thước màn hình khác nhau giữa các thiết bị, nội dung không nên phụ thuộc vào một chiều rộng khung nhìn cụ thể để hiển thị tốt.
3. _Sử dụng truy vấn phương tiện CSS_ để áp dụng kiểu dáng khác nhau cho màn hình nhỏ và lớn - Việc đặt chiều rộng tuyệt đối lớn cho các phần tử trang bằng CSS sẽ khiến các phần tử quá rộng đối với các thiết bị nhỏ hơn. Thay vào đó, hãy cân nhắc sử dụng các giá trị chiều rộng tương đối, chẳng hạn như width: 100%. Ngoài ra, hãy cẩn thận khi sử dụng các giá trị định vị tuyệt đối lớn. Điều này có thể khiến phần tử nằm ngoài khung nhìn trên các thiết bị nhỏ.

## 2. Building a Grid View

- grid-area: [Hàng bắt đầu] / [Số cột chiếm dụng (span)]
  ![Code minh họa](..\src\samples\TUAN_2\image\minh-hoa-code_bcao3.png "Code minh họa")
- Định nghĩa:
  - Là trang được chia thành các hàng và cột.
  - Một lưới hiển thị linh hoạt thường có 6 hoặc 12 cột, và sẽ thu nhỏ hoặc mở rộng khi bạn thay đổi kích thước cửa sổ trình duyệt.
- Building a Grid View:
  - Đảm bảo tất cả các phần tử HTML đều có box-sizing thuộc tính được đặt thành `<div> border-box`--> đảm bảo phần đệm và đường viền được tính vào tổng chiều rộng và chiều cao của các phần tử.
  - VD: thêm vào phần đầu tệp CSS: `* {box-sizing: border-box;}`
- Các nguyên tắc để xây dựng bố cục 1 Grid View:

1. Nguyên tắc Hình chữ nhật (The Rectangular Rule): Đây là nguyên tắc quan trọng nhất.
   - Định nghĩa: Mỗi vùng (Area) được đặt tên phải tạo thành một hình chữ nhật hoặc hình vuông hoàn chỉnh.
   - Cấm tuyệt đối: Không được tạo ra các vùng hình chữ L, chữ T, hình răng cưa hoặc các ô nằm chéo nhau.Trình duyệt tính toán các vùng dựa trên tọa độ `[hàng\_bắt\_đầu, cột\_bắt\_đầu]` đến `[hàng\_kết\_thúc, cột\_kết\_thúc]`.
   - Nó chỉ có thể vẽ các đường thẳng song song với trục tọa độ.
2. Nguyên tắc Liên tục (The Continuity Rule): Các ô có cùng tên phải nằm sát cạnh nhau.
   - Định nghĩa: Bạn không thể khai báo vùng menu ở hàng 1, sau đó lại khai báo menu ở hàng 3 mà giữa chúng là một vùng khác.
   - Yêu cầu: Các ô cùng tên phải chia sẻ ít nhất một cạnh chung (trên, dưới, trái hoặc phải).
3. Nguyên tắc Đồng nhất số cột (The Consistency Rule): Mỗi hàng trong khai báo grid-template-areas phải có số lượng từ khóa bằng nhau.Đúng: `css'a b c''d e f'Sai: `css'a b c''d e'
   - Mẹo: Nếu bạn muốn để trống một ô, hãy sử dụng dấu chấm . thay vì để trống.CSS'header header header' 'menu main .'--> Ô thứ 3 hàng 2 sẽ để trống.
4. Nguyên tắc Định danh duy nhất (The Uniqueness Rule): Mặc dù có thể dùng một cái tên cho nhiều ô (để gộp chúng lại), nhưng không được sử dụng một cái tên để mô tả hai khối tách rời.
   - Trình duyệt sẽ coi toàn bộ các ô có cùng tên là một phần tử duy nhất.
   - Nếu muốn có hai menu ở hai nơi khác nhau, bạn phải đặt tên là menu1 và menu2.

## 3. Media Queries

- Cấu trúc cơ bản:
  - ```@media media-type and (media-feature) {
        /* Các đoạn mã CSS sẽ được áp dụng khi điều kiện thỏa mãn */
        .container {
        width: 100%;
        }
    }
    ```
  - @media: Từ khóa bắt đầu để trình duyệt nhận diện đây là một truy vấn phương tiện.
  - media-type (Kiểu phương tiện): Thường dùng là screen (màn hình), print (khi in ấn), hoặc all (tất cả).
  - and: Toán tử logic dùng để kết hợp các điều kiện.
  - (media-feature) (Đặc điểm): Điều kiện cụ thể, ví dụ: max-width: 768px.
- Các toán tử Logic trong Media Queries:
  - and: Cả hai điều kiện phải đúng.
  - Dấu phẩy (,): Tương đương với OR (hoặc). Chỉ cần một trong các điều kiện đúng.
  - not: Phủ định điều kiện.
  - only: Ngăn chặn các trình duyệt đời rất cũ không hỗ trợ Media Queries áp dụng các style này.
- Các đặc điểm (Features) phổ biến nhất:
  - Theo chiều rộng (Width)
    - max-width: Áp dụng khi màn hình nhỏ hơn hoặc bằng giá trị này. (Dùng cho tư duy Desktop-First).
    - min-width: Áp dụng khi màn hình lớn hơn hoặc bằng giá trị này. (Dùng cho tư duy Mobile-First).
  - Theo hướng xoay (Orientation)
    - portrait: Chiều cao lớn hơn chiều rộng (điện thoại đứng).
    - landscape: Chiều rộng lớn hơn chiều cao (điện thoại nằm ngang hoặc PC).

## 4. Images

- Sử dụng thuộc tính chiều rộng:

```img {
  width: 100%;
  height: auto;
}
```

--> Hình ảnh sẽ tự động điều chỉnh kích thước, phóng to hoặc thu nhỏ, có thể được phóng to hơn kích thước ban đầu, giải pháp tốt hơn là sử dụng max-width.

- Sử dụng thuộc tính max-width:

```img {
  max-width: 100%;
  height: auto;
}
```

--> Hình ảnh sẽ được thu nhỏ nếu cần thiết, nhưng sẽ không bao giờ phóng to vượt quá kích thước ban đầu.
