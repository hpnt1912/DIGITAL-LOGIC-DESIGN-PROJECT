# ip – khối thư viện (MegaWizard)

| Tên | Thư viện | Cấu hình | Người tạo |
| --- | --- | --- | --- |
| mux32_32 | LPM_MUX | 32 ngõ vào × 32 bit, sel 5 bit, **không pipeline** | TV2 – Thắng |
| zero32 (chỉ khi cần) | LPM_CONSTANT | 32 bit, giá trị 0 – cho data0x của Register File | TV2 – Thắng |
| rom256x32, ram256x32 | ROM/RAM 1-PORT | 32 × 256, bỏ thanh ghi ngõ ra q | TV1 |
| cnt16, cnt23 | LPM_COUNTER | 16 / 23 bit, aclr | TV1 |

Ở trang cuối MegaWizard nhớ tick tạo file `.bsf`.
