# DIGITAL-LOGIC-DESIGN-PROJECT

Hiện thực bộ xử lý MIPS pipeline 5 tầng có xử lý các xung đột.

## Project Quartus

- Công cụ: **Quartus II 13.0 SP1**, chip **Cyclone II EP2C35F672C6** (kit DE2), mô phỏng VWF/ModelSim-Altera.
- Mở project: `mips_pipeline.qpf`. Top-level: `mips_pipeline.bdf` (TV1 tạo).
- Clone về đường dẫn **không dấu, không khoảng trắng**:

```
git clone https://github.com/hpnt1912/DIGITAL-LOGIC-DESIGN-PROJECT.git D:\mips_pipeline
```

## Cấu trúc thư mục

```
mips_pipeline.qpf / .qsf / .sdc   project, cài đặt chip, ràng buộc clock
mips_pipeline.bdf                 sơ đồ top-level (TV1)
blocks/basic/                     khối cơ bản (thanh ghi, MUX, bộ cộng, giải mã, so sánh)
blocks/                           khối chức năng (control, ALU, register file, thanh ghi pipeline, xung đột)
ip/                               khối thư viện MegaWizard (ROM, RAM, LPM_MUX, bộ đếm)
mif/                              chương trình test (.mif)
sim/                              kịch bản mô phỏng (.vwf)
docs/                             tài liệu, ảnh sơ đồ, waveform, báo cáo
```

## Quy tắc làm việc

- Mỗi người làm trên branch riêng, mỗi file `.bdf` chỉ một người sửa.
- Không push thư mục biên dịch (db/, incremental_db/, output_files/, simulation/) – đã có `.gitignore`.
- Khi dùng *Set as Top-Level Entity* để test riêng một khối, **đặt lại mips_pipeline làm top-level trước khi commit** `mips_pipeline.qsf`.
