// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Dec 20 12:44:21 2023
// Host        : LAPTOP-F00L5AKI running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/andre/Documents/GitHub/Maq_expendedora/Maq_expendedora/Maq_expendedora.sim/sim_1/impl/timing/xsim/Maq_exp_tb_time_impl.v
// Design      : TOP
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module EDGEDCTR
   (D,
    \aux_reg[1]_0 ,
    E,
    \sreg_1_reg[0]_0 ,
    \sreg_2_reg[0]_0 ,
    \sreg_1_reg[0]_1 ,
    CLK_IBUF_BUFG,
    \sreg_2_reg[0]_1 ,
    \aux_reg[0]_0 ,
    SW_IBUF,
    Q,
    act_saldo,
    \total_reg[0] ,
    \total_reg[0]_0 );
  output [0:0]D;
  output \aux_reg[1]_0 ;
  output [0:0]E;
  output \sreg_1_reg[0]_0 ;
  output \sreg_2_reg[0]_0 ;
  input \sreg_1_reg[0]_1 ;
  input CLK_IBUF_BUFG;
  input \sreg_2_reg[0]_1 ;
  input \aux_reg[0]_0 ;
  input [3:0]SW_IBUF;
  input [0:0]Q;
  input act_saldo;
  input \total_reg[0] ;
  input \total_reg[0]_0 ;

  wire CLK_IBUF_BUFG;
  wire [0:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [3:0]SW_IBUF;
  wire act_saldo;
  wire [2:0]aux;
  wire \aux_reg[0]_0 ;
  wire \aux_reg[1]_0 ;
  wire [2:0]sreg_1;
  wire \sreg_1_reg[0]_0 ;
  wire \sreg_1_reg[0]_1 ;
  wire [2:0]sreg_2;
  wire \sreg_2_reg[0]_0 ;
  wire \sreg_2_reg[0]_1 ;
  wire \total[4]_i_3_n_0 ;
  wire \total_reg[0] ;
  wire \total_reg[0]_0 ;

  LUT3 #(
    .INIT(8'hFB)) 
    \FSM_sequential_current[0]_i_2 
       (.I0(sreg_2[0]),
        .I1(sreg_2[2]),
        .I2(sreg_2[1]),
        .O(\sreg_2_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \FSM_sequential_current[1]_i_2 
       (.I0(sreg_1[0]),
        .I1(sreg_1[2]),
        .I2(sreg_1[1]),
        .O(\sreg_1_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \aux_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\aux_reg[0]_0 ),
        .Q(aux[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \aux_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(aux[0]),
        .Q(aux[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \aux_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(aux[1]),
        .Q(aux[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_1_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\sreg_1_reg[0]_1 ),
        .Q(sreg_1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_1_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg_1[0]),
        .Q(sreg_1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_1_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg_1[1]),
        .Q(sreg_1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_2_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\sreg_2_reg[0]_1 ),
        .Q(sreg_2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_2_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg_2[0]),
        .Q(sreg_2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_2_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg_2[1]),
        .Q(sreg_2[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAA8AAA8AAA800A8)) 
    \total[0]_i_1 
       (.I0(\aux_reg[1]_0 ),
        .I1(SW_IBUF[0]),
        .I2(SW_IBUF[2]),
        .I3(Q),
        .I4(SW_IBUF[1]),
        .I5(SW_IBUF[3]),
        .O(D));
  LUT3 #(
    .INIT(8'h8A)) 
    \total[4]_i_1 
       (.I0(act_saldo),
        .I1(\total[4]_i_3_n_0 ),
        .I2(\aux_reg[1]_0 ),
        .O(E));
  LUT5 #(
    .INIT(32'h01160000)) 
    \total[4]_i_3 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[3]),
        .I2(SW_IBUF[0]),
        .I3(SW_IBUF[2]),
        .I4(\sreg_1_reg[0]_0 ),
        .O(\total[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0004000400000004)) 
    \total[4]_i_4 
       (.I0(aux[1]),
        .I1(aux[2]),
        .I2(aux[0]),
        .I3(\total_reg[0] ),
        .I4(\total_reg[0]_0 ),
        .I5(\sreg_2_reg[0]_0 ),
        .O(\aux_reg[1]_0 ));
endmodule

module Saldo
   (ONE_EUR,
    Q,
    \total_reg[4]_0 ,
    \total_reg[2]_0 ,
    act_saldo,
    \total_reg[1]_0 ,
    SW_IBUF,
    E,
    CLK_IBUF_BUFG,
    D);
  output ONE_EUR;
  output [0:0]Q;
  output \total_reg[4]_0 ;
  output \total_reg[2]_0 ;
  input act_saldo;
  input \total_reg[1]_0 ;
  input [3:0]SW_IBUF;
  input [0:0]E;
  input CLK_IBUF_BUFG;
  input [0:0]D;

  wire CLK_IBUF_BUFG;
  wire [0:0]D;
  wire [0:0]E;
  wire ONE_EUR;
  wire ONE_EUR_reg_i_1_n_0;
  wire [0:0]Q;
  wire [4:1]SALIDA;
  wire [3:0]SW_IBUF;
  wire act_saldo;
  wire \total[1]_i_1_n_0 ;
  wire \total[1]_i_2_n_0 ;
  wire \total[2]_i_1_n_0 ;
  wire \total[2]_i_2_n_0 ;
  wire \total[3]_i_1_n_0 ;
  wire \total[3]_i_2_n_0 ;
  wire \total[3]_i_3_n_0 ;
  wire \total[3]_i_4_n_0 ;
  wire \total[4]_i_2_n_0 ;
  wire \total[4]_i_5_n_0 ;
  wire \total[4]_i_6_n_0 ;
  wire \total[4]_i_7_n_0 ;
  wire \total_reg[1]_0 ;
  wire \total_reg[2]_0 ;
  wire \total_reg[4]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFEEEAAAA)) 
    \FSM_sequential_current[1]_i_4 
       (.I0(SALIDA[4]),
        .I1(SALIDA[2]),
        .I2(SALIDA[1]),
        .I3(Q),
        .I4(SALIDA[3]),
        .O(\total_reg[4]_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    ONE_EUR_reg
       (.CLR(1'b0),
        .D(ONE_EUR_reg_i_1_n_0),
        .G(act_saldo),
        .GE(1'b1),
        .Q(ONE_EUR));
  LUT6 #(
    .INIT(64'h0000100000000000)) 
    ONE_EUR_reg_i_1
       (.I0(SALIDA[4]),
        .I1(Q),
        .I2(act_saldo),
        .I3(SALIDA[1]),
        .I4(SALIDA[2]),
        .I5(SALIDA[3]),
        .O(ONE_EUR_reg_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000AAA0AAA22222)) 
    \total[1]_i_1 
       (.I0(\total_reg[1]_0 ),
        .I1(\total[1]_i_2_n_0 ),
        .I2(SW_IBUF[2]),
        .I3(SW_IBUF[0]),
        .I4(Q),
        .I5(SALIDA[1]),
        .O(\total[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \total[1]_i_2 
       (.I0(SW_IBUF[3]),
        .I1(SW_IBUF[1]),
        .O(\total[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h88A8A8A8A8888888)) 
    \total[2]_i_1 
       (.I0(\total_reg[1]_0 ),
        .I1(\total[2]_i_2_n_0 ),
        .I2(SW_IBUF[0]),
        .I3(Q),
        .I4(SALIDA[1]),
        .I5(SALIDA[2]),
        .O(\total[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEEF0FEF0EE00EE0)) 
    \total[2]_i_2 
       (.I0(SW_IBUF[1]),
        .I1(SW_IBUF[3]),
        .I2(SALIDA[2]),
        .I3(SALIDA[1]),
        .I4(Q),
        .I5(SW_IBUF[2]),
        .O(\total[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h888AAAA888888888)) 
    \total[3]_i_1 
       (.I0(\total_reg[1]_0 ),
        .I1(\total[3]_i_2_n_0 ),
        .I2(SALIDA[2]),
        .I3(\total[3]_i_3_n_0 ),
        .I4(SALIDA[3]),
        .I5(SW_IBUF[2]),
        .O(\total[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFCF8FF44FCF800)) 
    \total[3]_i_2 
       (.I0(Q),
        .I1(SW_IBUF[0]),
        .I2(SW_IBUF[1]),
        .I3(\total[3]_i_4_n_0 ),
        .I4(SALIDA[3]),
        .I5(SW_IBUF[3]),
        .O(\total[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \total[3]_i_3 
       (.I0(Q),
        .I1(SALIDA[1]),
        .O(\total[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \total[3]_i_4 
       (.I0(SALIDA[1]),
        .I1(SALIDA[2]),
        .O(\total[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hA8AAAAA8A8A8A8A8)) 
    \total[4]_i_2 
       (.I0(\total_reg[1]_0 ),
        .I1(\total[4]_i_5_n_0 ),
        .I2(\total[4]_i_6_n_0 ),
        .I3(\total[4]_i_7_n_0 ),
        .I4(SALIDA[4]),
        .I5(SW_IBUF[2]),
        .O(\total[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \total[4]_i_5 
       (.I0(SW_IBUF[0]),
        .I1(Q),
        .I2(SALIDA[1]),
        .I3(SALIDA[2]),
        .I4(SALIDA[3]),
        .I5(SALIDA[4]),
        .O(\total[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h3EEEECCC22222888)) 
    \total[4]_i_6 
       (.I0(SW_IBUF[3]),
        .I1(SALIDA[4]),
        .I2(SALIDA[1]),
        .I3(SALIDA[2]),
        .I4(SALIDA[3]),
        .I5(SW_IBUF[1]),
        .O(\total[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hAA80)) 
    \total[4]_i_7 
       (.I0(SALIDA[3]),
        .I1(Q),
        .I2(SALIDA[1]),
        .I3(SALIDA[2]),
        .O(\total[4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \total[4]_i_8 
       (.I0(SALIDA[2]),
        .I1(SALIDA[1]),
        .I2(Q),
        .I3(SALIDA[4]),
        .I4(SALIDA[3]),
        .O(\total_reg[2]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \total_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(ONE_EUR_reg_i_1_n_0),
        .D(D),
        .Q(Q));
  FDCE #(
    .INIT(1'b0)) 
    \total_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(ONE_EUR_reg_i_1_n_0),
        .D(\total[1]_i_1_n_0 ),
        .Q(SALIDA[1]));
  FDCE #(
    .INIT(1'b0)) 
    \total_reg[2] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(ONE_EUR_reg_i_1_n_0),
        .D(\total[2]_i_1_n_0 ),
        .Q(SALIDA[2]));
  FDCE #(
    .INIT(1'b0)) 
    \total_reg[3] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(ONE_EUR_reg_i_1_n_0),
        .D(\total[3]_i_1_n_0 ),
        .Q(SALIDA[3]));
  FDCE #(
    .INIT(1'b0)) 
    \total_reg[4] 
       (.C(CLK_IBUF_BUFG),
        .CE(E),
        .CLR(ONE_EUR_reg_i_1_n_0),
        .D(\total[4]_i_2_n_0 ),
        .Q(SALIDA[4]));
endmodule

(* ECO_CHECKSUM = "9e9450ff" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module TOP
   (CLK,
    SW,
    RST,
    MONEDA,
    PROD,
    LED);
  input CLK;
  input [3:0]SW;
  input RST;
  input MONEDA;
  input PROD;
  output [3:0]LED;

  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire [3:0]LED;
  wire [3:0]LED_OBUF;
  wire MONEDA;
  wire MONEDA_IBUF;
  wire ONE_EUR;
  wire PROD;
  wire PROD_IBUF;
  wire RST;
  wire RST_IBUF;
  wire [0:0]SALIDA;
  wire [3:0]SW;
  wire [3:0]SW_IBUF;
  wire act_saldo;
  wire inst_edge_n_0;
  wire inst_edge_n_1;
  wire inst_edge_n_3;
  wire inst_edge_n_4;
  wire inst_saldo_n_2;
  wire inst_saldo_n_3;
  wire inst_sync_n_0;
  wire inst_sync_n_1;
  wire inst_sync_n_2;
  wire total0;

initial begin
 $sdf_annotate("Maq_exp_tb_time_impl.sdf",,,,"tool_control");
end
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF[0]),
        .O(LED[0]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF[1]),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF[2]),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF[3]),
        .O(LED[3]));
  IBUF MONEDA_IBUF_inst
       (.I(MONEDA),
        .O(MONEDA_IBUF));
  IBUF PROD_IBUF_inst
       (.I(PROD),
        .O(PROD_IBUF));
  IBUF RST_IBUF_inst
       (.I(RST),
        .O(RST_IBUF));
  IBUF \SW_IBUF[0]_inst 
       (.I(SW[0]),
        .O(SW_IBUF[0]));
  IBUF \SW_IBUF[1]_inst 
       (.I(SW[1]),
        .O(SW_IBUF[1]));
  IBUF \SW_IBUF[2]_inst 
       (.I(SW[2]),
        .O(SW_IBUF[2]));
  IBUF \SW_IBUF[3]_inst 
       (.I(SW[3]),
        .O(SW_IBUF[3]));
  EDGEDCTR inst_edge
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D(inst_edge_n_0),
        .E(total0),
        .Q(SALIDA),
        .SW_IBUF(SW_IBUF),
        .act_saldo(act_saldo),
        .\aux_reg[0]_0 (inst_sync_n_2),
        .\aux_reg[1]_0 (inst_edge_n_1),
        .\sreg_1_reg[0]_0 (inst_edge_n_3),
        .\sreg_1_reg[0]_1 (inst_sync_n_0),
        .\sreg_2_reg[0]_0 (inst_edge_n_4),
        .\sreg_2_reg[0]_1 (inst_sync_n_1),
        .\total_reg[0] (inst_saldo_n_2),
        .\total_reg[0]_0 (inst_saldo_n_3));
  maq_exp inst_maq
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .\FSM_sequential_current_reg[0]_0 (inst_edge_n_4),
        .\FSM_sequential_current_reg[1]_0 (inst_saldo_n_2),
        .\FSM_sequential_current_reg[1]_1 (inst_edge_n_3),
        .LED_OBUF(LED_OBUF),
        .ONE_EUR(ONE_EUR),
        .act_saldo(act_saldo));
  Saldo inst_saldo
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .D(inst_edge_n_0),
        .E(total0),
        .ONE_EUR(ONE_EUR),
        .Q(SALIDA),
        .SW_IBUF(SW_IBUF),
        .act_saldo(act_saldo),
        .\total_reg[1]_0 (inst_edge_n_1),
        .\total_reg[2]_0 (inst_saldo_n_3),
        .\total_reg[4]_0 (inst_saldo_n_2));
  synchrnzr inst_sync
       (.CLK_IBUF_BUFG(CLK_IBUF_BUFG),
        .MONEDA_IBUF(MONEDA_IBUF),
        .PROD_IBUF(PROD_IBUF),
        .RST_IBUF(RST_IBUF),
        .\aux_reg[0]_0 (inst_sync_n_2),
        .\sreg_1_reg[0]_0 (inst_sync_n_0),
        .\sreg_2_reg[0]_0 (inst_sync_n_1));
endmodule

module maq_exp
   (act_saldo,
    LED_OBUF,
    \FSM_sequential_current_reg[1]_0 ,
    \FSM_sequential_current_reg[0]_0 ,
    ONE_EUR,
    \FSM_sequential_current_reg[1]_1 ,
    CLK_IBUF_BUFG);
  output act_saldo;
  output [3:0]LED_OBUF;
  input \FSM_sequential_current_reg[1]_0 ;
  input \FSM_sequential_current_reg[0]_0 ;
  input ONE_EUR;
  input \FSM_sequential_current_reg[1]_1 ;
  input CLK_IBUF_BUFG;

  wire CLK_IBUF_BUFG;
  wire \FSM_sequential_current[0]_i_1_n_0 ;
  wire \FSM_sequential_current[1]_i_1_n_0 ;
  wire \FSM_sequential_current[1]_i_3_n_0 ;
  wire \FSM_sequential_current_reg[0]_0 ;
  wire \FSM_sequential_current_reg[1]_0 ;
  wire \FSM_sequential_current_reg[1]_1 ;
  wire \FSM_sequential_current_reg_n_0_[1] ;
  wire [3:0]LED_OBUF;
  wire ONE_EUR;
  wire act_saldo;
  wire act_saldo_reg_i_1_n_0;
  wire [0:0]current;
  wire drink_out;
  wire refresco_reg_i_1_n_0;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h0CDD0C11)) 
    \FSM_sequential_current[0]_i_1 
       (.I0(\FSM_sequential_current_reg[0]_0 ),
        .I1(\FSM_sequential_current_reg_n_0_[1] ),
        .I2(drink_out),
        .I3(current),
        .I4(ONE_EUR),
        .O(\FSM_sequential_current[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h22FFC000)) 
    \FSM_sequential_current[1]_i_1 
       (.I0(ONE_EUR),
        .I1(current),
        .I2(\FSM_sequential_current_reg[1]_1 ),
        .I3(\FSM_sequential_current[1]_i_3_n_0 ),
        .I4(\FSM_sequential_current_reg_n_0_[1] ),
        .O(\FSM_sequential_current[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF0FF3F3FF0FA3A3)) 
    \FSM_sequential_current[1]_i_3 
       (.I0(\FSM_sequential_current_reg[1]_0 ),
        .I1(\FSM_sequential_current_reg[0]_0 ),
        .I2(\FSM_sequential_current_reg_n_0_[1] ),
        .I3(drink_out),
        .I4(current),
        .I5(ONE_EUR),
        .O(\FSM_sequential_current[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "s1:01,s2:10,s0:00,s3:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_current[0]_i_1_n_0 ),
        .Q(current),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s1:01,s2:10,s0:00,s3:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_current_reg[1] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_current[1]_i_1_n_0 ),
        .Q(\FSM_sequential_current_reg_n_0_[1] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \LED_OBUF[0]_inst_i_1 
       (.I0(\FSM_sequential_current_reg_n_0_[1] ),
        .I1(current),
        .O(LED_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \LED_OBUF[1]_inst_i_1 
       (.I0(current),
        .I1(\FSM_sequential_current_reg_n_0_[1] ),
        .O(LED_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \LED_OBUF[2]_inst_i_1 
       (.I0(\FSM_sequential_current_reg_n_0_[1] ),
        .I1(current),
        .O(LED_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \LED_OBUF[3]_inst_i_1 
       (.I0(\FSM_sequential_current_reg_n_0_[1] ),
        .I1(current),
        .O(LED_OBUF[3]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    act_saldo_reg
       (.CLR(1'b0),
        .D(LED_OBUF[1]),
        .G(act_saldo_reg_i_1_n_0),
        .GE(1'b1),
        .Q(act_saldo));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    act_saldo_reg_i_1
       (.I0(current),
        .I1(\FSM_sequential_current_reg_n_0_[1] ),
        .O(act_saldo_reg_i_1_n_0));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    refresco_reg
       (.CLR(1'b0),
        .D(\FSM_sequential_current_reg_n_0_[1] ),
        .G(refresco_reg_i_1_n_0),
        .GE(1'b1),
        .Q(drink_out));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    refresco_reg_i_1
       (.I0(\FSM_sequential_current_reg_n_0_[1] ),
        .I1(current),
        .O(refresco_reg_i_1_n_0));
endmodule

module synchrnzr
   (\sreg_1_reg[0]_0 ,
    \sreg_2_reg[0]_0 ,
    \aux_reg[0]_0 ,
    CLK_IBUF_BUFG,
    MONEDA_IBUF,
    PROD_IBUF,
    RST_IBUF);
  output \sreg_1_reg[0]_0 ;
  output \sreg_2_reg[0]_0 ;
  output \aux_reg[0]_0 ;
  input CLK_IBUF_BUFG;
  input MONEDA_IBUF;
  input PROD_IBUF;
  input RST_IBUF;

  wire CLK_IBUF_BUFG;
  wire MONEDA_IBUF;
  wire PROD_IBUF;
  wire RST_IBUF;
  wire \aux_reg[0]_0 ;
  wire \aux_reg_n_0_[0] ;
  wire \sreg_1_reg[0]_0 ;
  wire \sreg_1_reg_n_0_[0] ;
  wire \sreg_2_reg[0]_0 ;
  wire \sreg_2_reg_n_0_[0] ;

  (* srl_name = "\\inst_sync/RST_OUT_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    RST_OUT_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK_IBUF_BUFG),
        .D(\aux_reg_n_0_[0] ),
        .Q(\aux_reg[0]_0 ));
  (* srl_name = "\\inst_sync/SYNC_OUT_1_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    SYNC_OUT_1_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK_IBUF_BUFG),
        .D(\sreg_1_reg_n_0_[0] ),
        .Q(\sreg_1_reg[0]_0 ));
  (* srl_name = "\\inst_sync/SYNC_OUT_2_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    SYNC_OUT_2_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(CLK_IBUF_BUFG),
        .D(\sreg_2_reg_n_0_[0] ),
        .Q(\sreg_2_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \aux_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(RST_IBUF),
        .Q(\aux_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_1_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(MONEDA_IBUF),
        .Q(\sreg_1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_2_reg[0] 
       (.C(CLK_IBUF_BUFG),
        .CE(1'b1),
        .D(PROD_IBUF),
        .Q(\sreg_2_reg_n_0_[0] ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
