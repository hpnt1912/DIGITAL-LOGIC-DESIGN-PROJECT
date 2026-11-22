# Chân chuẩn các khối của TV2 (chốt ngày 1 – không đổi sau khi đã chốt)

| Khối | Chân vào | Chân ra |
| --- | --- | --- |
| ha | a, b | s, c |
| fa | a, b, cin | s, cout |
| add4 | a[3..0], b[3..0], cin | s[3..0], cout |
| add32 | a[31..0], b[31..0] | s[31..0] |
| incre32 | a[31..0] | y[31..0] |
| dec5_32 | a[4..0], en | eq[31..0] |
| alu1 | a, b, Binvert, CarryIn, Less, Op[1..0] | Result, CarryOut, Sum |
| alu4 | a[3..0], b[3..0], Binvert, CarryIn, Less0, Op[1..0] | Result[3..0], CarryOut, Sum3, C3 |
| alu32 | A[31..0], B[31..0], ALUCtrl[2..0] | Result[31..0], Zero |
| alu_control | ALUOp[1..0], F[5..0] | ALUCtrl[2..0] |
| mux32_32 (IP) | data0x[31..0] … data31x[31..0], sel[4..0] | result[31..0] |
| reg_file | clk, reset, RegWrite, ReadReg1[4..0], ReadReg2[4..0], WriteReg[4..0], WriteData[31..0], dbg_sel[4..0] | ReadData1[31..0], ReadData2[31..0], dbg_data[31..0] |

Giả định chân reg32 của TV1: vào `d[31..0], en, clr, clk, reset` – ra `q[31..0]` (xác nhận lại với TV1).

## Nối ở top-level (để đối chiếu khi ghép với TV1)

| Khối | Chân | Net ở top-level |
| --- | --- | --- |
| incre32 | a → y | PC[31..0] → PC4[31..0] |
| reg_file | ReadReg1, ReadReg2 | IF_ID_Instr[25..21], IF_ID_Instr[20..16] |
| reg_file | WriteReg, WriteData, RegWrite | MEM_WB_WriteReg[4..0], WB_Data[31..0], MEM_WB_ctrl[1] |
| reg_file | ReadData1, ReadData2 | ID_RD1[31..0], ID_RD2[31..0] |
| alu_control | ALUOp, F | ID_EX_ctrl[3..2] (bit 3 = ALUOp1), ID_EX_Imm[5..0] |
| alu32 | A, B, ALUCtrl | EX_A, EX_B, EX_ALUCtrl[2..0] |
| alu32 | Result, Zero | EX_ALU[31..0], EX_Zero |
| add32 (BrTarget) | a, b | ID_EX_PC4; bus "ID_EX_Imm[29..0], zero, zero" |
