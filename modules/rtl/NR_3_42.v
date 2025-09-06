//Compilation time: 2025-03-17 16:17:21
//Compilation SHA256 message digest: a3b96163f4df0c250d004b4f2251d595f41e522f2c4c62c3e7bbdda690c221f0
/*----------------------------------------------------------------------------
Copyright (c) 2019-2020 University of Bremen, Germany.
Copyright (c) 2020 Johannes Kepler University Linz, Austria.
This file has been generated with GenMul.
You can find GenMul at: http://www.sca-verification.org/genmul
Contact us at genmul@sca-verification.org

  First input length: 3
  second input length: 42
  Partial product generator: Unsigned simple partial product generator [U_SP]
  Partial product accumulator: Array [AR]
  Final stage adder: Ripple carry adder [RC]
----------------------------------------------------------------------------*/
module FullAdder(X, Y, Z, S, C);
  output C;
  output S;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
endmodule
module FullAdderProp(X, Y, Z, S, C, P);
  output C;
  output S;
  output P;
  input X;
  input Y;
  input Z;
  assign C = ( X & Y ) | ( Y & Z ) | ( Z & X );
  assign S = X ^ Y ^ Z;
  assign P = X ^ Y;
endmodule
module HalfAdder(X, Y, S, C);
  output C;
  output S;
  input X;
  input Y;
  assign C = X & Y;
  assign S = X ^ Y;
endmodule
module ConstatntOne(O);
  output O;
  assign O = 1;
endmodule
module Counter(X1, X2, X3, X4, X5, X6, X7, S3, S2, S1);
output S1;
output S2;
output S3;
input X1;
input X2;
input X3;
input X4;
input X5;
input X6;
input X7;
wire W1;
wire W2;
wire W3;
wire W4;
wire W5;
wire W6;
assign W1 = X1 ^ X2 ^ X3;
assign W2 = X4 ^ X5 ^ ( X6 ^ X7 );
assign W3 = ~ ( ( ~ ( X1 & X2 ) ) & ( ~ ( X1 & X3 ) ) & ( ~ ( X2 & X3 ) ) );
assign W4 = ~ ( ( ~ ( ( X4 | X5 ) & ( X6 | X7 ) ) ) & ( ~ ( ( X4 & X5 ) | ( X6 & X7 ) ) ) );
assign W5 = ~ ( X4 & X5 & X6 & X7 );
assign W6 = ~ ( ( ~ ( W4 & W5 ) ) ^ W3 );
assign S3 = W1 ^ W2;
assign S2 = ~ ( W6 ^ ( ~ ( W1 & W2 ) ) );
assign S1 = ~ ( W5 & ( ~ ( W3 & W4 ) ) & ( ~ ( W1 & W2 & W6 ) ) );
endmodule
module U_SP_3_42(IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43);
  input [2:0] IN1;
  input [41:0] IN2;
  output [0:0] P0;
  output [1:0] P1;
  output [2:0] P2;
  output [2:0] P3;
  output [2:0] P4;
  output [2:0] P5;
  output [2:0] P6;
  output [2:0] P7;
  output [2:0] P8;
  output [2:0] P9;
  output [2:0] P10;
  output [2:0] P11;
  output [2:0] P12;
  output [2:0] P13;
  output [2:0] P14;
  output [2:0] P15;
  output [2:0] P16;
  output [2:0] P17;
  output [2:0] P18;
  output [2:0] P19;
  output [2:0] P20;
  output [2:0] P21;
  output [2:0] P22;
  output [2:0] P23;
  output [2:0] P24;
  output [2:0] P25;
  output [2:0] P26;
  output [2:0] P27;
  output [2:0] P28;
  output [2:0] P29;
  output [2:0] P30;
  output [2:0] P31;
  output [2:0] P32;
  output [2:0] P33;
  output [2:0] P34;
  output [2:0] P35;
  output [2:0] P36;
  output [2:0] P37;
  output [2:0] P38;
  output [2:0] P39;
  output [2:0] P40;
  output [2:0] P41;
  output [1:0] P42;
  output [0:0] P43;
  assign P0[0] = IN1[0]&IN2[0];
  assign P1[0] = IN1[0]&IN2[1];
  assign P2[0] = IN1[0]&IN2[2];
  assign P3[0] = IN1[0]&IN2[3];
  assign P4[0] = IN1[0]&IN2[4];
  assign P5[0] = IN1[0]&IN2[5];
  assign P6[0] = IN1[0]&IN2[6];
  assign P7[0] = IN1[0]&IN2[7];
  assign P8[0] = IN1[0]&IN2[8];
  assign P9[0] = IN1[0]&IN2[9];
  assign P10[0] = IN1[0]&IN2[10];
  assign P11[0] = IN1[0]&IN2[11];
  assign P12[0] = IN1[0]&IN2[12];
  assign P13[0] = IN1[0]&IN2[13];
  assign P14[0] = IN1[0]&IN2[14];
  assign P15[0] = IN1[0]&IN2[15];
  assign P16[0] = IN1[0]&IN2[16];
  assign P17[0] = IN1[0]&IN2[17];
  assign P18[0] = IN1[0]&IN2[18];
  assign P19[0] = IN1[0]&IN2[19];
  assign P20[0] = IN1[0]&IN2[20];
  assign P21[0] = IN1[0]&IN2[21];
  assign P22[0] = IN1[0]&IN2[22];
  assign P23[0] = IN1[0]&IN2[23];
  assign P24[0] = IN1[0]&IN2[24];
  assign P25[0] = IN1[0]&IN2[25];
  assign P26[0] = IN1[0]&IN2[26];
  assign P27[0] = IN1[0]&IN2[27];
  assign P28[0] = IN1[0]&IN2[28];
  assign P29[0] = IN1[0]&IN2[29];
  assign P30[0] = IN1[0]&IN2[30];
  assign P31[0] = IN1[0]&IN2[31];
  assign P32[0] = IN1[0]&IN2[32];
  assign P33[0] = IN1[0]&IN2[33];
  assign P34[0] = IN1[0]&IN2[34];
  assign P35[0] = IN1[0]&IN2[35];
  assign P36[0] = IN1[0]&IN2[36];
  assign P37[0] = IN1[0]&IN2[37];
  assign P38[0] = IN1[0]&IN2[38];
  assign P39[0] = IN1[0]&IN2[39];
  assign P40[0] = IN1[0]&IN2[40];
  assign P41[0] = IN1[0]&IN2[41];
  assign P1[1] = IN1[1]&IN2[0];
  assign P2[1] = IN1[1]&IN2[1];
  assign P3[1] = IN1[1]&IN2[2];
  assign P4[1] = IN1[1]&IN2[3];
  assign P5[1] = IN1[1]&IN2[4];
  assign P6[1] = IN1[1]&IN2[5];
  assign P7[1] = IN1[1]&IN2[6];
  assign P8[1] = IN1[1]&IN2[7];
  assign P9[1] = IN1[1]&IN2[8];
  assign P10[1] = IN1[1]&IN2[9];
  assign P11[1] = IN1[1]&IN2[10];
  assign P12[1] = IN1[1]&IN2[11];
  assign P13[1] = IN1[1]&IN2[12];
  assign P14[1] = IN1[1]&IN2[13];
  assign P15[1] = IN1[1]&IN2[14];
  assign P16[1] = IN1[1]&IN2[15];
  assign P17[1] = IN1[1]&IN2[16];
  assign P18[1] = IN1[1]&IN2[17];
  assign P19[1] = IN1[1]&IN2[18];
  assign P20[1] = IN1[1]&IN2[19];
  assign P21[1] = IN1[1]&IN2[20];
  assign P22[1] = IN1[1]&IN2[21];
  assign P23[1] = IN1[1]&IN2[22];
  assign P24[1] = IN1[1]&IN2[23];
  assign P25[1] = IN1[1]&IN2[24];
  assign P26[1] = IN1[1]&IN2[25];
  assign P27[1] = IN1[1]&IN2[26];
  assign P28[1] = IN1[1]&IN2[27];
  assign P29[1] = IN1[1]&IN2[28];
  assign P30[1] = IN1[1]&IN2[29];
  assign P31[1] = IN1[1]&IN2[30];
  assign P32[1] = IN1[1]&IN2[31];
  assign P33[1] = IN1[1]&IN2[32];
  assign P34[1] = IN1[1]&IN2[33];
  assign P35[1] = IN1[1]&IN2[34];
  assign P36[1] = IN1[1]&IN2[35];
  assign P37[1] = IN1[1]&IN2[36];
  assign P38[1] = IN1[1]&IN2[37];
  assign P39[1] = IN1[1]&IN2[38];
  assign P40[1] = IN1[1]&IN2[39];
  assign P41[1] = IN1[1]&IN2[40];
  assign P42[0] = IN1[1]&IN2[41];
  assign P2[2] = IN1[2]&IN2[0];
  assign P3[2] = IN1[2]&IN2[1];
  assign P4[2] = IN1[2]&IN2[2];
  assign P5[2] = IN1[2]&IN2[3];
  assign P6[2] = IN1[2]&IN2[4];
  assign P7[2] = IN1[2]&IN2[5];
  assign P8[2] = IN1[2]&IN2[6];
  assign P9[2] = IN1[2]&IN2[7];
  assign P10[2] = IN1[2]&IN2[8];
  assign P11[2] = IN1[2]&IN2[9];
  assign P12[2] = IN1[2]&IN2[10];
  assign P13[2] = IN1[2]&IN2[11];
  assign P14[2] = IN1[2]&IN2[12];
  assign P15[2] = IN1[2]&IN2[13];
  assign P16[2] = IN1[2]&IN2[14];
  assign P17[2] = IN1[2]&IN2[15];
  assign P18[2] = IN1[2]&IN2[16];
  assign P19[2] = IN1[2]&IN2[17];
  assign P20[2] = IN1[2]&IN2[18];
  assign P21[2] = IN1[2]&IN2[19];
  assign P22[2] = IN1[2]&IN2[20];
  assign P23[2] = IN1[2]&IN2[21];
  assign P24[2] = IN1[2]&IN2[22];
  assign P25[2] = IN1[2]&IN2[23];
  assign P26[2] = IN1[2]&IN2[24];
  assign P27[2] = IN1[2]&IN2[25];
  assign P28[2] = IN1[2]&IN2[26];
  assign P29[2] = IN1[2]&IN2[27];
  assign P30[2] = IN1[2]&IN2[28];
  assign P31[2] = IN1[2]&IN2[29];
  assign P32[2] = IN1[2]&IN2[30];
  assign P33[2] = IN1[2]&IN2[31];
  assign P34[2] = IN1[2]&IN2[32];
  assign P35[2] = IN1[2]&IN2[33];
  assign P36[2] = IN1[2]&IN2[34];
  assign P37[2] = IN1[2]&IN2[35];
  assign P38[2] = IN1[2]&IN2[36];
  assign P39[2] = IN1[2]&IN2[37];
  assign P40[2] = IN1[2]&IN2[38];
  assign P41[2] = IN1[2]&IN2[39];
  assign P42[1] = IN1[2]&IN2[40];
  assign P43[0] = IN1[2]&IN2[41];

endmodule
module AR(IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8, IN9, IN10, IN11, IN12, IN13, IN14, IN15, IN16, IN17, IN18, IN19, IN20, IN21, IN22, IN23, IN24, IN25, IN26, IN27, IN28, IN29, IN30, IN31, IN32, IN33, IN34, IN35, IN36, IN37, IN38, IN39, IN40, IN41, IN42, IN43, Out1, Out2);
  input [0:0] IN0;
  input [1:0] IN1;
  input [2:0] IN2;
  input [2:0] IN3;
  input [2:0] IN4;
  input [2:0] IN5;
  input [2:0] IN6;
  input [2:0] IN7;
  input [2:0] IN8;
  input [2:0] IN9;
  input [2:0] IN10;
  input [2:0] IN11;
  input [2:0] IN12;
  input [2:0] IN13;
  input [2:0] IN14;
  input [2:0] IN15;
  input [2:0] IN16;
  input [2:0] IN17;
  input [2:0] IN18;
  input [2:0] IN19;
  input [2:0] IN20;
  input [2:0] IN21;
  input [2:0] IN22;
  input [2:0] IN23;
  input [2:0] IN24;
  input [2:0] IN25;
  input [2:0] IN26;
  input [2:0] IN27;
  input [2:0] IN28;
  input [2:0] IN29;
  input [2:0] IN30;
  input [2:0] IN31;
  input [2:0] IN32;
  input [2:0] IN33;
  input [2:0] IN34;
  input [2:0] IN35;
  input [2:0] IN36;
  input [2:0] IN37;
  input [2:0] IN38;
  input [2:0] IN39;
  input [2:0] IN40;
  input [2:0] IN41;
  input [1:0] IN42;
  input [0:0] IN43;
  output [43:0] Out1;
  output [40:0] Out2;
  wire w127;
  wire w128;
  wire w129;
  wire w131;
  wire w132;
  wire w133;
  wire w135;
  wire w136;
  wire w137;
  wire w139;
  wire w140;
  wire w141;
  wire w143;
  wire w144;
  wire w145;
  wire w147;
  wire w148;
  wire w149;
  wire w151;
  wire w152;
  wire w153;
  wire w155;
  wire w156;
  wire w157;
  wire w159;
  wire w160;
  wire w161;
  wire w163;
  wire w164;
  wire w165;
  wire w167;
  wire w168;
  wire w169;
  wire w171;
  wire w172;
  wire w173;
  wire w175;
  wire w176;
  wire w177;
  wire w179;
  wire w180;
  wire w181;
  wire w183;
  wire w184;
  wire w185;
  wire w187;
  wire w188;
  wire w189;
  wire w191;
  wire w192;
  wire w193;
  wire w195;
  wire w196;
  wire w197;
  wire w199;
  wire w200;
  wire w201;
  wire w203;
  wire w204;
  wire w205;
  wire w207;
  wire w208;
  wire w209;
  wire w211;
  wire w212;
  wire w213;
  wire w215;
  wire w216;
  wire w217;
  wire w219;
  wire w220;
  wire w221;
  wire w223;
  wire w224;
  wire w225;
  wire w227;
  wire w228;
  wire w229;
  wire w231;
  wire w232;
  wire w233;
  wire w235;
  wire w236;
  wire w237;
  wire w239;
  wire w240;
  wire w241;
  wire w243;
  wire w244;
  wire w245;
  wire w247;
  wire w248;
  wire w249;
  wire w251;
  wire w252;
  wire w253;
  wire w255;
  wire w256;
  wire w257;
  wire w259;
  wire w260;
  wire w261;
  wire w263;
  wire w264;
  wire w265;
  wire w267;
  wire w268;
  wire w269;
  wire w271;
  wire w272;
  wire w273;
  wire w275;
  wire w276;
  wire w277;
  wire w279;
  wire w280;
  wire w281;
  wire w283;
  wire w284;
  wire w285;
  wire w287;
  HalfAdder U0 (IN1[0], IN1[1], Out1[1], w127);
  FullAdder U1 (w127, IN2[0], IN2[1], w128, w129);
  HalfAdder U2 (w128, IN2[2], Out1[2], w131);
  FullAdder U3 (w131, w129, IN3[0], w132, w133);
  HalfAdder U4 (w132, IN3[1], Out1[3], w135);
  FullAdder U5 (w135, w133, IN4[0], w136, w137);
  HalfAdder U6 (w136, IN4[1], Out1[4], w139);
  FullAdder U7 (w139, w137, IN5[0], w140, w141);
  HalfAdder U8 (w140, IN5[1], Out1[5], w143);
  FullAdder U9 (w143, w141, IN6[0], w144, w145);
  HalfAdder U10 (w144, IN6[1], Out1[6], w147);
  FullAdder U11 (w147, w145, IN7[0], w148, w149);
  HalfAdder U12 (w148, IN7[1], Out1[7], w151);
  FullAdder U13 (w151, w149, IN8[0], w152, w153);
  HalfAdder U14 (w152, IN8[1], Out1[8], w155);
  FullAdder U15 (w155, w153, IN9[0], w156, w157);
  HalfAdder U16 (w156, IN9[1], Out1[9], w159);
  FullAdder U17 (w159, w157, IN10[0], w160, w161);
  HalfAdder U18 (w160, IN10[1], Out1[10], w163);
  FullAdder U19 (w163, w161, IN11[0], w164, w165);
  HalfAdder U20 (w164, IN11[1], Out1[11], w167);
  FullAdder U21 (w167, w165, IN12[0], w168, w169);
  HalfAdder U22 (w168, IN12[1], Out1[12], w171);
  FullAdder U23 (w171, w169, IN13[0], w172, w173);
  HalfAdder U24 (w172, IN13[1], Out1[13], w175);
  FullAdder U25 (w175, w173, IN14[0], w176, w177);
  HalfAdder U26 (w176, IN14[1], Out1[14], w179);
  FullAdder U27 (w179, w177, IN15[0], w180, w181);
  HalfAdder U28 (w180, IN15[1], Out1[15], w183);
  FullAdder U29 (w183, w181, IN16[0], w184, w185);
  HalfAdder U30 (w184, IN16[1], Out1[16], w187);
  FullAdder U31 (w187, w185, IN17[0], w188, w189);
  HalfAdder U32 (w188, IN17[1], Out1[17], w191);
  FullAdder U33 (w191, w189, IN18[0], w192, w193);
  HalfAdder U34 (w192, IN18[1], Out1[18], w195);
  FullAdder U35 (w195, w193, IN19[0], w196, w197);
  HalfAdder U36 (w196, IN19[1], Out1[19], w199);
  FullAdder U37 (w199, w197, IN20[0], w200, w201);
  HalfAdder U38 (w200, IN20[1], Out1[20], w203);
  FullAdder U39 (w203, w201, IN21[0], w204, w205);
  HalfAdder U40 (w204, IN21[1], Out1[21], w207);
  FullAdder U41 (w207, w205, IN22[0], w208, w209);
  HalfAdder U42 (w208, IN22[1], Out1[22], w211);
  FullAdder U43 (w211, w209, IN23[0], w212, w213);
  HalfAdder U44 (w212, IN23[1], Out1[23], w215);
  FullAdder U45 (w215, w213, IN24[0], w216, w217);
  HalfAdder U46 (w216, IN24[1], Out1[24], w219);
  FullAdder U47 (w219, w217, IN25[0], w220, w221);
  HalfAdder U48 (w220, IN25[1], Out1[25], w223);
  FullAdder U49 (w223, w221, IN26[0], w224, w225);
  HalfAdder U50 (w224, IN26[1], Out1[26], w227);
  FullAdder U51 (w227, w225, IN27[0], w228, w229);
  HalfAdder U52 (w228, IN27[1], Out1[27], w231);
  FullAdder U53 (w231, w229, IN28[0], w232, w233);
  HalfAdder U54 (w232, IN28[1], Out1[28], w235);
  FullAdder U55 (w235, w233, IN29[0], w236, w237);
  HalfAdder U56 (w236, IN29[1], Out1[29], w239);
  FullAdder U57 (w239, w237, IN30[0], w240, w241);
  HalfAdder U58 (w240, IN30[1], Out1[30], w243);
  FullAdder U59 (w243, w241, IN31[0], w244, w245);
  HalfAdder U60 (w244, IN31[1], Out1[31], w247);
  FullAdder U61 (w247, w245, IN32[0], w248, w249);
  HalfAdder U62 (w248, IN32[1], Out1[32], w251);
  FullAdder U63 (w251, w249, IN33[0], w252, w253);
  HalfAdder U64 (w252, IN33[1], Out1[33], w255);
  FullAdder U65 (w255, w253, IN34[0], w256, w257);
  HalfAdder U66 (w256, IN34[1], Out1[34], w259);
  FullAdder U67 (w259, w257, IN35[0], w260, w261);
  HalfAdder U68 (w260, IN35[1], Out1[35], w263);
  FullAdder U69 (w263, w261, IN36[0], w264, w265);
  HalfAdder U70 (w264, IN36[1], Out1[36], w267);
  FullAdder U71 (w267, w265, IN37[0], w268, w269);
  HalfAdder U72 (w268, IN37[1], Out1[37], w271);
  FullAdder U73 (w271, w269, IN38[0], w272, w273);
  HalfAdder U74 (w272, IN38[1], Out1[38], w275);
  FullAdder U75 (w275, w273, IN39[0], w276, w277);
  HalfAdder U76 (w276, IN39[1], Out1[39], w279);
  FullAdder U77 (w279, w277, IN40[0], w280, w281);
  HalfAdder U78 (w280, IN40[1], Out1[40], w283);
  FullAdder U79 (w283, w281, IN41[0], w284, w285);
  HalfAdder U80 (w284, IN41[1], Out1[41], w287);
  FullAdder U81 (w287, w285, IN42[0], Out1[42], Out1[43]);
  assign Out1[0] = IN0[0];
  assign Out2[0] = IN3[2];
  assign Out2[1] = IN4[2];
  assign Out2[2] = IN5[2];
  assign Out2[3] = IN6[2];
  assign Out2[4] = IN7[2];
  assign Out2[5] = IN8[2];
  assign Out2[6] = IN9[2];
  assign Out2[7] = IN10[2];
  assign Out2[8] = IN11[2];
  assign Out2[9] = IN12[2];
  assign Out2[10] = IN13[2];
  assign Out2[11] = IN14[2];
  assign Out2[12] = IN15[2];
  assign Out2[13] = IN16[2];
  assign Out2[14] = IN17[2];
  assign Out2[15] = IN18[2];
  assign Out2[16] = IN19[2];
  assign Out2[17] = IN20[2];
  assign Out2[18] = IN21[2];
  assign Out2[19] = IN22[2];
  assign Out2[20] = IN23[2];
  assign Out2[21] = IN24[2];
  assign Out2[22] = IN25[2];
  assign Out2[23] = IN26[2];
  assign Out2[24] = IN27[2];
  assign Out2[25] = IN28[2];
  assign Out2[26] = IN29[2];
  assign Out2[27] = IN30[2];
  assign Out2[28] = IN31[2];
  assign Out2[29] = IN32[2];
  assign Out2[30] = IN33[2];
  assign Out2[31] = IN34[2];
  assign Out2[32] = IN35[2];
  assign Out2[33] = IN36[2];
  assign Out2[34] = IN37[2];
  assign Out2[35] = IN38[2];
  assign Out2[36] = IN39[2];
  assign Out2[37] = IN40[2];
  assign Out2[38] = IN41[2];
  assign Out2[39] = IN42[1];
  assign Out2[40] = IN43[0];

endmodule
module RC_41_41(IN1, IN2, Out);
  input [40:0] IN1;
  input [40:0] IN2;
  output [41:0] Out;
  wire w83;
  wire w85;
  wire w87;
  wire w89;
  wire w91;
  wire w93;
  wire w95;
  wire w97;
  wire w99;
  wire w101;
  wire w103;
  wire w105;
  wire w107;
  wire w109;
  wire w111;
  wire w113;
  wire w115;
  wire w117;
  wire w119;
  wire w121;
  wire w123;
  wire w125;
  wire w127;
  wire w129;
  wire w131;
  wire w133;
  wire w135;
  wire w137;
  wire w139;
  wire w141;
  wire w143;
  wire w145;
  wire w147;
  wire w149;
  wire w151;
  wire w153;
  wire w155;
  wire w157;
  wire w159;
  wire w161;
  HalfAdder U0 (IN1[0], IN2[0], Out[0], w83);
  FullAdder U1 (IN1[1], IN2[1], w83, Out[1], w85);
  FullAdder U2 (IN1[2], IN2[2], w85, Out[2], w87);
  FullAdder U3 (IN1[3], IN2[3], w87, Out[3], w89);
  FullAdder U4 (IN1[4], IN2[4], w89, Out[4], w91);
  FullAdder U5 (IN1[5], IN2[5], w91, Out[5], w93);
  FullAdder U6 (IN1[6], IN2[6], w93, Out[6], w95);
  FullAdder U7 (IN1[7], IN2[7], w95, Out[7], w97);
  FullAdder U8 (IN1[8], IN2[8], w97, Out[8], w99);
  FullAdder U9 (IN1[9], IN2[9], w99, Out[9], w101);
  FullAdder U10 (IN1[10], IN2[10], w101, Out[10], w103);
  FullAdder U11 (IN1[11], IN2[11], w103, Out[11], w105);
  FullAdder U12 (IN1[12], IN2[12], w105, Out[12], w107);
  FullAdder U13 (IN1[13], IN2[13], w107, Out[13], w109);
  FullAdder U14 (IN1[14], IN2[14], w109, Out[14], w111);
  FullAdder U15 (IN1[15], IN2[15], w111, Out[15], w113);
  FullAdder U16 (IN1[16], IN2[16], w113, Out[16], w115);
  FullAdder U17 (IN1[17], IN2[17], w115, Out[17], w117);
  FullAdder U18 (IN1[18], IN2[18], w117, Out[18], w119);
  FullAdder U19 (IN1[19], IN2[19], w119, Out[19], w121);
  FullAdder U20 (IN1[20], IN2[20], w121, Out[20], w123);
  FullAdder U21 (IN1[21], IN2[21], w123, Out[21], w125);
  FullAdder U22 (IN1[22], IN2[22], w125, Out[22], w127);
  FullAdder U23 (IN1[23], IN2[23], w127, Out[23], w129);
  FullAdder U24 (IN1[24], IN2[24], w129, Out[24], w131);
  FullAdder U25 (IN1[25], IN2[25], w131, Out[25], w133);
  FullAdder U26 (IN1[26], IN2[26], w133, Out[26], w135);
  FullAdder U27 (IN1[27], IN2[27], w135, Out[27], w137);
  FullAdder U28 (IN1[28], IN2[28], w137, Out[28], w139);
  FullAdder U29 (IN1[29], IN2[29], w139, Out[29], w141);
  FullAdder U30 (IN1[30], IN2[30], w141, Out[30], w143);
  FullAdder U31 (IN1[31], IN2[31], w143, Out[31], w145);
  FullAdder U32 (IN1[32], IN2[32], w145, Out[32], w147);
  FullAdder U33 (IN1[33], IN2[33], w147, Out[33], w149);
  FullAdder U34 (IN1[34], IN2[34], w149, Out[34], w151);
  FullAdder U35 (IN1[35], IN2[35], w151, Out[35], w153);
  FullAdder U36 (IN1[36], IN2[36], w153, Out[36], w155);
  FullAdder U37 (IN1[37], IN2[37], w155, Out[37], w157);
  FullAdder U38 (IN1[38], IN2[38], w157, Out[38], w159);
  FullAdder U39 (IN1[39], IN2[39], w159, Out[39], w161);
  FullAdder U40 (IN1[40], IN2[40], w161, Out[40], Out[41]);

endmodule
module NR_3_42(IN1, IN2, Out);
  input [2:0] IN1;
  input [41:0] IN2;
  output [44:0] Out;
  wire [0:0] P0;
  wire [1:0] P1;
  wire [2:0] P2;
  wire [2:0] P3;
  wire [2:0] P4;
  wire [2:0] P5;
  wire [2:0] P6;
  wire [2:0] P7;
  wire [2:0] P8;
  wire [2:0] P9;
  wire [2:0] P10;
  wire [2:0] P11;
  wire [2:0] P12;
  wire [2:0] P13;
  wire [2:0] P14;
  wire [2:0] P15;
  wire [2:0] P16;
  wire [2:0] P17;
  wire [2:0] P18;
  wire [2:0] P19;
  wire [2:0] P20;
  wire [2:0] P21;
  wire [2:0] P22;
  wire [2:0] P23;
  wire [2:0] P24;
  wire [2:0] P25;
  wire [2:0] P26;
  wire [2:0] P27;
  wire [2:0] P28;
  wire [2:0] P29;
  wire [2:0] P30;
  wire [2:0] P31;
  wire [2:0] P32;
  wire [2:0] P33;
  wire [2:0] P34;
  wire [2:0] P35;
  wire [2:0] P36;
  wire [2:0] P37;
  wire [2:0] P38;
  wire [2:0] P39;
  wire [2:0] P40;
  wire [2:0] P41;
  wire [1:0] P42;
  wire [0:0] P43;
  wire [43:0] R1;
  wire [40:0] R2;
  wire [44:0] aOut;
  U_SP_3_42 S0 (IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43);
  AR S1 (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, R1, R2);
  RC_41_41 S2 (R1[43:3], R2, aOut[44:3]);
  assign aOut[0] = R1[0];
  assign aOut[1] = R1[1];
  assign aOut[2] = R1[2];
  assign Out = aOut[44:0];
endmodule

/*---------------------------------------------------------------------------------------------------
This are SHA256 message digests computed for all source files to see the version of a file in genmul.
4164f841dcd2afb1341b584b40f40d82ef4c3d0830615503b45c13f9ff1f0b99 Array.cpp
b66c13355402b785b10523902060ea2b13495e0139581e3e1f9eb511b63091d0 Array.hpp
049f660c454752c510b8d2d7d5474b271804a3f2ef3bbd08b201b27cf5aa953c BrentKungAdder.cpp
542006e2bd9fe43a38fbd454d79c40216e2222968ee81d61ccb8b9f5f7c2cfc0 BrentKungAdder.hpp
dd0e0628729b9c228e1e3e2d8c759e3c5d548b2a7fc7a0ecf965f77c057f8982 CarryLookAhead.cpp
acab3bf6b24f0596013dfce2d21a56d16bc4565d810d7521bef6b645b6192ddf CarryLookAhead.hpp
929ba8b159d43cd1483702c39adf3f3c01a0e029393157d2dff1e576c3784ba2 CarryPredictor.cpp
c674a6131475e399d67794664958ce3992e34ad5a8a276b258f3b65179dbb0d2 CarryPredictor.hpp
7ad1df61ce6dec8970320cdbb0cd1b9d9e1b1aaed8337fad2ba9dc15bebade69 CarrySkipAdder.cpp
ce45d117e5a45c141acb0a305a0a6eaf30ccdc4b387a55bd5ab330672bf3c03a CarrySkipAdder.hpp
227583b37ff516c46466fc5c918ee7605b0476c7e79e1b63b1fc28017046b0d2 CarrySkipAdderVariable.cpp
1812c7c9c45afa80da1317afd4c2210c3583748daed3177e247887653392a938 CarrySkipAdderVariable.hpp
6cb775e3f48c2bc7fe32ff327217939a020f17c5087cc13d0faee3452517d768 component.cpp
209f908d2f1fb45ff2ab578483ac59b4daf3db09b0623e939fe467d8c408a03c component.hpp
1448c3a20470e843c0e3d8e81150aa7ae966b01c0324366ad6d09973635eae33 Dadda.cpp
b409b894cf7e5dd8b1566ad65242d8204a3b10e09218cfdba51d6798420c3db4 Dadda.hpp
e2de7008e12d31cf28e87ddcc91be289718e8c57104720d626d739224e17d237 GenMul.cpp
ca6978e216edf5aa647ec0ac3ce023db92fac8b0514ff9494e53594d0f6870ea GenMul_Emscripten.cpp
59b5e2c157f082415d42add003c3f61c2a59ddcff55d4bce8b87b7769944c265 GenMul_Emscripten.hpp
9f7728b1956d663933ee8c2e36eedbfbf99e183f597155867c1b3ea7b518cfc7 GenMul.hpp
b6c44052471006782baa14f9ee553e9dd2befb5a48caaf3ea08ada0fa333a4b7 KoggeStoneAdder.cpp
39decce3c706b8eafdd039498cb80147312dc279cf9ac722df1d7c5e44ca1eb1 KoggeStoneAdder.hpp
8cd281edd6691072195380d088347b8080c00b9bdc903f9930b6f9b66343a532 LanderFischerAdder.cpp
5a7fd4ccf6aba5d41505bf471d36050ebc082c671b174d26d2afe89d8ab1424f LanderFischerAdder.hpp
e882c7b4ccf415774af64e8554a5d95bc8652feda0a36406f200e95b0228339b main.cpp
bc20681185e8c41a7f23ff828021720d345a078c484211fe91f92bc0bffc69e2 ModuleConnector.cpp
e1e43efd032bbdf2f7cde39e51a5ca384a6f7dbe2bbb2d60b2ce379cba5c5a61 ModuleConnector.hpp
287f82e4c4496d55e1bfa8679ee9e55e472790befa8efd8632594da9f222bcc6 partial.cpp
0f936d14fa3aa23fae3171e401a240bea867f3be47b3cf7302cfabd3cb016a2a partial.hpp
8ce42bf2a0b4a30bf2a9b1371c7e59d94c8b71af34319211923ebc0acae9f0d0 PartialProductGenerator.cpp
0ec3b8793327e4b4e723a90196524386697346d2ab66595de11ae34a7ed16ae2 PartialProductGenerator.hpp
049b30b6e146bee3b19fa21ee9d78e1fba8caf3bf38b0e4a99bc6e35110f8cef PartialProductGeneratorSigned.cpp
b3fd13d4dc90c5708b5905c73a6437578e972e9929a8f5ef40d224277a72b3eb PartialProductGeneratorSigned.hpp
b4d8f357fdd48208ab4dbec18a26d3dd8091c289f388f9bfe66dfe22793c005c RippleCarryAdder.cpp
7a68cc632729d6a10a87e0d6750a3b6bc38ffea3c1adefbb6c04f5c81d6821fd RippleCarryAdder.hpp
02ad7291a8c88d72769d019fcfcb63f20595eeb7f97880174f7080c433adc827 SerialPrefixAdder.cpp
34c8850d96db902dcf9124b07b854739c311e1b984f27ae2cba2c97dac68b528 SerialPrefixAdder.hpp
ce0ae8c29d242e8eda47cc3e9ff06bb052ce1a90f3c8e0cf21ee13c63ddd30e9 VerilogGen.cpp
60865ceaeae304e64ad944fb7b83fda22058c3e042b9e5ad1e2b35effcb79918 VerilogGen.hpp
421854807ffbed49e9450453ff4d7b2fb6cbcff53c1e8cca3299cc3c49d5bb6f Wallace5.cpp
ae5f879f4f6fda292e6394ba3e8df4a50b38d2c1c8f590fbf5752c2109deb398 Wallace5.hpp
53e7bc2a228005f30c0349cd8f1e2f68498141e175ee1c140d3465823cfc44ec Wallace.cpp
f00fd621015cfcf54cda85815dce343d8526c1fee0f7e22a9d98041195b72e1a Wallace.hpp
---------------------------------------------------------------------------------------------------*/
