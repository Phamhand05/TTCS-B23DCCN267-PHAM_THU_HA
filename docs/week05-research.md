# Báo cáo tuần: JavaScript cơ bản & sản phẩm tĩnh

## 1. Tìm hiểu / Đọc biến, kiểu dữ liệu, toán tử, hàm (function) trong JavaScript

- Biến (Variables)
  - Dùng để lưu trữ dữ liệu trong chương trình
  - Khai báo bằng: var, let, const
  - ```let name = "Ha";
    const age = 20;
    ```

- Dùng let khi giá trị có thể thay đổi, Dùng const khi không thay đổi
- Kiểu dữ liệu (Data Types)
  - Kiểu nguyên thủy:
    - Number → số
    - String → chuỗi
    - Boolean → true/false
    - Undefined, Null
    - let a = 10; // Number
    - let b = "Hello"; // String
    - let c = true; // Boolean
  - Toán tử (Operators)
    - Toán tử số học: + - \* / %
    - So sánh: == === != > <
    - Logic: && || !
    - let x = 5 + 3; // 8
    - let y = x > 5; // true
  - Hàm (Function): Là một khối lệnh thực hiện một nhiệm vụ
    - ```function sum(a, b) {
        return a + b;
        }
      console.log(sum(2, 3)); // 5
      const sum = (a, b) => a + b;
      ```
