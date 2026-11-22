# Chương 3 (phần datapath) – dàn ý viết báo cáo

Viết theo lối diễn dịch: câu chủ đề đầu đoạn → biểu thức → sơ đồ → kết quả VWF.

## 3.x.1 Bộ cộng
- ha, fa: biểu thức, sơ đồ.
- add4 → add32 ripple-carry.
- inc32: vì sao bit 1..0 đi thẳng, chỉ cần chuỗi ha từ bit 2.
- Hình: sơ đồ fa, add32, inc32; VWF add32, inc32.

## 3.x.2 ALU 32 bit
- ALU 1 bit (slide Chương 4), phép trừ bằng bù 2 (Binvert = CarryIn0 = ALUCtrl[2]).
- Ghép 32 bit, slt có hiệu chỉnh tràn (Set = Sum31 ⊕ V), cờ Zero.
- Hình: sơ đồ alu1/alu4/alu32; bảng phép toán; VWF 12 dòng.

## 3.x.3 ALU Control
- Bảng sự thật → 3 biểu thức rút gọn; kiểm tra 7 trường hợp.
- Vì sao addi/bne không phải sửa.

## 3.x.4 Register File
- dec5_32 + 31 reg32 + 3 LPM_MUX; không có R0.
- clk_n và "ghi trước – đọc sau"; đánh đổi nửa chu kỳ.
- Lý do dùng LPM_MUX.
- Hình: cấu trúc Register File; VWF 8 chu kỳ.

## 3.x.5 Tài nguyên khối datapath
- Bảng từ tai_nguyen.md + nhận xét khối tốn nhất, ảnh hưởng ripple-carry tới Fmax.

## Lưu đồ
- Hình 3.7 – thực thi một lệnh qua 5 tầng.
