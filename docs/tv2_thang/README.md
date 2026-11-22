# TV2 – Thắng: Datapath (bộ cộng, ALU, ALU Control, Register File)

Sổ tay hướng dẫn chi tiết từng bước: [`SoTay_TV2_Thang_Datapath_v2.docx`](SoTay_TV2_Thang_Datapath_v2.docx) (bản mới nhất, mục 1.2 có bảng file nào lưu ở đâu; bản cũ giữ để đối chiếu)

## Cấu trúc file của TV2 trong repo

```
blocks/basic/   ha, fa, add4, add32, incre32, dec5_32 (.bdf + .bsf)
blocks/         alu1, alu4, alu32, alu_control, reg_file, (hex7seg) (.bdf + .bsf)
ip/             mux32_32 (LPM_MUX), zero32 (nếu cần)
sim/tv2/        *.vwf unit test + test_vectors.md
docs/tv2_thang/ sổ tay, ports.md, nhat_ky.md, bao_cao_datapath.md, tai_nguyen.md
docs/tv2_thang/images/  ảnh sơ đồ từng khối, ảnh VWF, ảnh báo cáo tài nguyên
```

## Checklist

### Ngày 1
- [ ] Cài Quartus II 13.0 SP1 + Cyclone II + ModelSim-Altera, thử VWF
- [ ] Chốt chân (ports.md) với nhóm; chốt chân reg32 với TV1
- [ ] Tạo khối rỗng incre32, add32, alu32, alu_control, reg_file và push

### Tuần 1
- [x] ha, fa + VWF
- [x] add4 → add32 + VWF
- [x] incre32 (= add32 + const4) + VWF – **gửi TV1 ngay**
- [x] dec5_32 + VWF
- [ ] Kiểm chứng trên máy: menu University Program VWF, nối GND vào bus 32 bit

### Tuần 2
- [x] alu1 (dùng mux4_1 tự vẽ) → alu4 → alu32 + VWF 12 dòng
- [x] alu_control + VWF 7 dòng
- [x] mux32_32 bằng LPM_MUX (**không pipeline**)
- [x] Bắt đầu reg_file

### Tuần 3
- [x] reg_file + VWF (14 ô, đã PASS các ô 0–240 ns)
- [ ] Ghép top-level cùng TV1 (đối chiếu ports.md) – **Test 0 PASS**

### Tuần 4
- [ ] Gỡ lỗi tầng EX; Test 1, 2, 3 PASS

### Tuần 5
- [ ] Bảng tài nguyên theo khối (tai_nguyen.md)
- [ ] (Tùy chọn) hex7seg

### Tuần 6
- [ ] Lưu đồ Hình 3.7 (draw.io)
- [ ] Viết phần datapath (bao_cao_datapath.md) gửi TV1
- [ ] Tập vấn đáp

## Quy tắc làm việc nhóm
- Chỉ sửa file của mình; muốn sửa khối người khác thì nhắn người đó.
- Không push db/, incremental_db/, output_files/, simulation/ (đã có .gitignore).
- Đổi chân khối nào → tạo lại symbol + báo nhóm.
