# Bộ test VWF cho các khối của TV2 (Thắng)

Mỗi bộ giá trị giữ 20 ns. Xem bus ở dạng Hexadecimal. Đánh dấu PASS khi VWF khớp cột "đúng".

## ha
| a b | 00 | 01 | 10 | 11 |
| --- | --- | --- | --- | --- |
| s c | 0 0 | 1 0 | 1 0 | 0 1 |

## fa
| a b cin | 000 | 001 | 010 | 011 | 100 | 101 | 110 | 111 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| s cout | 0 0 | 1 0 | 1 0 | 0 1 | 1 0 | 0 1 | 0 1 | 1 1 |

## add4
| a | b | cin | s, cout đúng | PASS |
| --- | --- | --- | --- | --- |
| 0111 | 0001 | 0 | 1000, 0 | ☐ |
| 1111 | 0001 | 0 | 0000, 1 | ☐ |
| 0101 | 0011 | 1 | 1001, 0 | ☐ |
| 1010 | 0101 | 0 | 1111, 0 | ☐ |

## add32
| a | b | s đúng | PASS |
| --- | --- | --- | --- |
| 00000005 | 00000003 | 00000008 | ☐ |
| FFFFFFFF | 00000001 | 00000000 | ☐ |
| 12345678 | 11111111 | 23456789 | ☐ |
| 7FFFFFFF | 00000001 | 80000000 | ☐ |
| 0000000C | FFFFFFF8 | 00000004 | ☐ |

## incre32 (PC + 4)
| a | y đúng | PASS |
| --- | --- | --- |
| 00000000 | 00000004 | ☐ |
| 000000FC | 00000100 | ☐ |
| 0000FFFC | 00010000 | ☐ |
| FFFFFFFC | 00000000 | ☐ |
| 00000003 | 00000007 | ☐ |

## dec5_32 (file sim/tv2/dec5_32.vwf đã có sẵn kích thích)
0–640 ns: en = 1, a đếm 0, 1, …, 31 (mỗi giá trị 20 ns) → eq phải lần lượt là 00000001, 00000002, 00000004, …, 80000000 (chỉ đúng 1 bit bằng 1, dịch dần sang trái).
640–1000 ns: en = 0, a tiếp tục đếm → eq phải luôn 00000000.

| a[4..0] | en | eq[31..0] đúng | PASS |
| --- | --- | --- | --- |
| 0 | 1 | 00000001 | ☐ |
| 1 | 1 | 00000002 | ☐ |
| 8 | 1 | 00000100 | ☐ |
| 13 | 1 | 00002000 | ☐ |
| 31 | 1 | 80000000 | ☐ |
| bất kỳ | 0 | 00000000 | ☐ |

## alu1
| a | b | Binvert | CarryIn | Less | Op | Result | CarryOut | PASS |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 1 | 0 | 0 | 0 | 00 | 1 | 1 | ☐ |
| 1 | 0 | 0 | 0 | 0 | 01 | 1 | 0 | ☐ |
| 1 | 1 | 0 | 1 | 0 | 10 | 1 | 1 | ☐ |
| 1 | 1 | 1 | 1 | 0 | 10 | 0 | 1 | ☐ |
| 0 | 0 | 0 | 0 | 1 | 11 | 1 | 0 | ☐ |
| 0 | 1 | 1 | 1 | 0 | 00 | 0 | 1 | ☐ |

## alu4
| a | b | Binvert | CarryIn | Op | Result đúng | PASS |
| --- | --- | --- | --- | --- | --- | --- |
| 0101 | 0011 | 0 | 0 | 10 | 1000 | ☐ |
| 0101 | 0011 | 1 | 1 | 10 | 0010 | ☐ |

## alu32
| A | B | ALUCtrl | Result đúng | Zero | Kiểm tra | PASS |
| --- | --- | --- | --- | --- | --- | --- |
| 00000005 | 00000003 | 010 | 00000008 | 0 | cộng | ☐ |
| 00000005 | 00000003 | 110 | 00000002 | 0 | trừ | ☐ |
| 00000005 | 00000003 | 000 | 00000001 | 0 | AND | ☐ |
| 00000005 | 00000003 | 001 | 00000007 | 0 | OR | ☐ |
| 00000005 | 00000003 | 111 | 00000000 | 1 | slt sai | ☐ |
| 00000003 | 00000005 | 111 | 00000001 | 0 | slt đúng | ☐ |
| 00000005 | 00000005 | 110 | 00000000 | 1 | Zero cho beq | ☐ |
| 00000003 | 00000005 | 110 | FFFFFFFE | 0 | trừ ra âm | ☐ |
| FFFFFFFF | 00000000 | 111 | 00000001 | 0 | slt có dấu | ☐ |
| 7FFFFFFF | 80000000 | 111 | 00000000 | 1 | slt khi tràn | ☐ |
| 80000000 | 7FFFFFFF | 111 | 00000001 | 0 | slt khi tràn (ngược) | ☐ |
| 7FFFFFFF | 00000001 | 010 | 80000000 | 0 | cộng tràn | ☐ |

## alu_control
| ALUOp | F (hex) | ALUCtrl đúng | Lệnh | PASS |
| --- | --- | --- | --- | --- |
| 00 | 2A | 010 | lw/sw/addi | ☐ |
| 01 | 20 | 110 | beq/bne | ☐ |
| 10 | 20 | 010 | add | ☐ |
| 10 | 22 | 110 | sub | ☐ |
| 10 | 24 | 000 | and | ☐ |
| 10 | 25 | 001 | or | ☐ |
| 10 | 2A | 111 | slt | ☐ |

## reg_file (clock 20 ns, đọc kết quả cuối mỗi chu kỳ)
| Chu kỳ | Ngõ vào | Kết quả đúng | PASS |
| --- | --- | --- | --- |
| 1–2 | reset = 1 | mọi ngõ đọc = 0 | ☐ |
| 3 | RegWrite=1, WriteReg=8, WriteData=00001234, ReadReg1=8 | ReadData1 = 00001234 ngay trong chu kỳ | ☐ |
| 4 | RegWrite=1, WriteReg=0, WriteData=FFFFFFFF, ReadReg1=0 | ReadData1 = 00000000 | ☐ |
| 5 | RegWrite=0, WriteReg=8, WriteData=0000AAAA, ReadReg1=8 | vẫn 00001234 | ☐ |
| 6 | RegWrite=1, WriteReg=31, WriteData=FFFFFFFF, ReadReg1=8, ReadReg2=31 | RD1 = 00001234, RD2 = FFFFFFFF | ☐ |
| 7 | RegWrite=0, dbg_sel=31 rồi 8 | dbg_data = FFFFFFFF rồi 00001234 | ☐ |
| 8 | reset = 1 | mọi giá trị về 0 | ☐ |
