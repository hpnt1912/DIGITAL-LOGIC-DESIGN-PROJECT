# blocks/basic – khối cơ bản

Mỗi khối gồm file `.bdf` (sơ đồ) và `.bsf` (symbol). **Mỗi file chỉ một người sửa.**

| File | Người phụ trách | Trạng thái |
| --- | --- | --- |
| ha.bdf, fa.bdf | TV2 – Thắng | ☑ |
| add4.bdf, add32.bdf | TV2 – Thắng | ☑ |
| incre32.bdf (PC + 4 = add32 + const4) | TV2 – Thắng (gửi TV1 sớm) | ☑ |
| dec5_32.bdf (5 NOT + 32 AND6) | TV2 – Thắng | ☑ (chờ chạy VWF trên máy) |
| reg1, reg2, reg4, reg5, reg10, reg32 | TV1 | ☐ |
| mux2, mux2_5, mux2_32 | TV1 | ☐ |
| eq5, nz5, mux4, mux4_32 | TV3 | ☐ |

Chân chuẩn của các khối TV2: xem `docs/tv2_thang/ports.md`.
