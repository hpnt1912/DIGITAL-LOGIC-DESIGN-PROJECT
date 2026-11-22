# Tài nguyên theo khối datapath (Tuần 5)

Lấy từ *Compilation Report → Analysis & Synthesis → Resource Utilization by Entity* (top-level = mips_pipeline, chip EP2C35F672C6). Chỉ ghi số liệu thật, kèm ảnh chụp trong `images/`.

| Khối | Logic cells (LE) | Dedicated registers | Nhận xét |
| --- | --- | --- | --- |
| alu32 | | 0 | |
| alu_control | | 0 | |
| reg_file | | (≈ 992 = 31 × 32) | |
| ├ dec5_32 | | 0 | |
| └ mux32_32 × 3 | | 0 | |
| inc32 | | 0 | |
| add32 (BrTarget) | | 0 | |
| **Tổng thiết kế** | | | |

Nếu số thanh ghi reg_file < 992: xem *Optimization Results → Register Statistics → Registers Removed During Synthesis* và giải thích.
