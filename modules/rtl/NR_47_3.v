//Compilation time: 2025-03-17 16:17:21
//Compilation SHA256 message digest: a3b96163f4df0c250d004b4f2251d595f41e522f2c4c62c3e7bbdda690c221f0
/*----------------------------------------------------------------------------
Copyright (c) 2019-2020 University of Bremen, Germany.
Copyright (c) 2020 Johannes Kepler University Linz, Austria.
This file has been generated with GenMul.
You can find GenMul at: http://www.sca-verification.org/genmul
Contact us at genmul@sca-verification.org

  First input length: 47
  second input length: 3
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
module U_SP_47_3(IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, P44, P45, P46, P47, P48);
  input [46:0] IN1;
  input [2:0] IN2;
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
  output [2:0] P42;
  output [2:0] P43;
  output [2:0] P44;
  output [2:0] P45;
  output [2:0] P46;
  output [1:0] P47;
  output [0:0] P48;
  assign P0[0] = IN1[0]&IN2[0];
  assign P1[0] = IN1[0]&IN2[1];
  assign P2[0] = IN1[0]&IN2[2];
  assign P1[1] = IN1[1]&IN2[0];
  assign P2[1] = IN1[1]&IN2[1];
  assign P3[0] = IN1[1]&IN2[2];
  assign P2[2] = IN1[2]&IN2[0];
  assign P3[1] = IN1[2]&IN2[1];
  assign P4[0] = IN1[2]&IN2[2];
  assign P3[2] = IN1[3]&IN2[0];
  assign P4[1] = IN1[3]&IN2[1];
  assign P5[0] = IN1[3]&IN2[2];
  assign P4[2] = IN1[4]&IN2[0];
  assign P5[1] = IN1[4]&IN2[1];
  assign P6[0] = IN1[4]&IN2[2];
  assign P5[2] = IN1[5]&IN2[0];
  assign P6[1] = IN1[5]&IN2[1];
  assign P7[0] = IN1[5]&IN2[2];
  assign P6[2] = IN1[6]&IN2[0];
  assign P7[1] = IN1[6]&IN2[1];
  assign P8[0] = IN1[6]&IN2[2];
  assign P7[2] = IN1[7]&IN2[0];
  assign P8[1] = IN1[7]&IN2[1];
  assign P9[0] = IN1[7]&IN2[2];
  assign P8[2] = IN1[8]&IN2[0];
  assign P9[1] = IN1[8]&IN2[1];
  assign P10[0] = IN1[8]&IN2[2];
  assign P9[2] = IN1[9]&IN2[0];
  assign P10[1] = IN1[9]&IN2[1];
  assign P11[0] = IN1[9]&IN2[2];
  assign P10[2] = IN1[10]&IN2[0];
  assign P11[1] = IN1[10]&IN2[1];
  assign P12[0] = IN1[10]&IN2[2];
  assign P11[2] = IN1[11]&IN2[0];
  assign P12[1] = IN1[11]&IN2[1];
  assign P13[0] = IN1[11]&IN2[2];
  assign P12[2] = IN1[12]&IN2[0];
  assign P13[1] = IN1[12]&IN2[1];
  assign P14[0] = IN1[12]&IN2[2];
  assign P13[2] = IN1[13]&IN2[0];
  assign P14[1] = IN1[13]&IN2[1];
  assign P15[0] = IN1[13]&IN2[2];
  assign P14[2] = IN1[14]&IN2[0];
  assign P15[1] = IN1[14]&IN2[1];
  assign P16[0] = IN1[14]&IN2[2];
  assign P15[2] = IN1[15]&IN2[0];
  assign P16[1] = IN1[15]&IN2[1];
  assign P17[0] = IN1[15]&IN2[2];
  assign P16[2] = IN1[16]&IN2[0];
  assign P17[1] = IN1[16]&IN2[1];
  assign P18[0] = IN1[16]&IN2[2];
  assign P17[2] = IN1[17]&IN2[0];
  assign P18[1] = IN1[17]&IN2[1];
  assign P19[0] = IN1[17]&IN2[2];
  assign P18[2] = IN1[18]&IN2[0];
  assign P19[1] = IN1[18]&IN2[1];
  assign P20[0] = IN1[18]&IN2[2];
  assign P19[2] = IN1[19]&IN2[0];
  assign P20[1] = IN1[19]&IN2[1];
  assign P21[0] = IN1[19]&IN2[2];
  assign P20[2] = IN1[20]&IN2[0];
  assign P21[1] = IN1[20]&IN2[1];
  assign P22[0] = IN1[20]&IN2[2];
  assign P21[2] = IN1[21]&IN2[0];
  assign P22[1] = IN1[21]&IN2[1];
  assign P23[0] = IN1[21]&IN2[2];
  assign P22[2] = IN1[22]&IN2[0];
  assign P23[1] = IN1[22]&IN2[1];
  assign P24[0] = IN1[22]&IN2[2];
  assign P23[2] = IN1[23]&IN2[0];
  assign P24[1] = IN1[23]&IN2[1];
  assign P25[0] = IN1[23]&IN2[2];
  assign P24[2] = IN1[24]&IN2[0];
  assign P25[1] = IN1[24]&IN2[1];
  assign P26[0] = IN1[24]&IN2[2];
  assign P25[2] = IN1[25]&IN2[0];
  assign P26[1] = IN1[25]&IN2[1];
  assign P27[0] = IN1[25]&IN2[2];
  assign P26[2] = IN1[26]&IN2[0];
  assign P27[1] = IN1[26]&IN2[1];
  assign P28[0] = IN1[26]&IN2[2];
  assign P27[2] = IN1[27]&IN2[0];
  assign P28[1] = IN1[27]&IN2[1];
  assign P29[0] = IN1[27]&IN2[2];
  assign P28[2] = IN1[28]&IN2[0];
  assign P29[1] = IN1[28]&IN2[1];
  assign P30[0] = IN1[28]&IN2[2];
  assign P29[2] = IN1[29]&IN2[0];
  assign P30[1] = IN1[29]&IN2[1];
  assign P31[0] = IN1[29]&IN2[2];
  assign P30[2] = IN1[30]&IN2[0];
  assign P31[1] = IN1[30]&IN2[1];
  assign P32[0] = IN1[30]&IN2[2];
  assign P31[2] = IN1[31]&IN2[0];
  assign P32[1] = IN1[31]&IN2[1];
  assign P33[0] = IN1[31]&IN2[2];
  assign P32[2] = IN1[32]&IN2[0];
  assign P33[1] = IN1[32]&IN2[1];
  assign P34[0] = IN1[32]&IN2[2];
  assign P33[2] = IN1[33]&IN2[0];
  assign P34[1] = IN1[33]&IN2[1];
  assign P35[0] = IN1[33]&IN2[2];
  assign P34[2] = IN1[34]&IN2[0];
  assign P35[1] = IN1[34]&IN2[1];
  assign P36[0] = IN1[34]&IN2[2];
  assign P35[2] = IN1[35]&IN2[0];
  assign P36[1] = IN1[35]&IN2[1];
  assign P37[0] = IN1[35]&IN2[2];
  assign P36[2] = IN1[36]&IN2[0];
  assign P37[1] = IN1[36]&IN2[1];
  assign P38[0] = IN1[36]&IN2[2];
  assign P37[2] = IN1[37]&IN2[0];
  assign P38[1] = IN1[37]&IN2[1];
  assign P39[0] = IN1[37]&IN2[2];
  assign P38[2] = IN1[38]&IN2[0];
  assign P39[1] = IN1[38]&IN2[1];
  assign P40[0] = IN1[38]&IN2[2];
  assign P39[2] = IN1[39]&IN2[0];
  assign P40[1] = IN1[39]&IN2[1];
  assign P41[0] = IN1[39]&IN2[2];
  assign P40[2] = IN1[40]&IN2[0];
  assign P41[1] = IN1[40]&IN2[1];
  assign P42[0] = IN1[40]&IN2[2];
  assign P41[2] = IN1[41]&IN2[0];
  assign P42[1] = IN1[41]&IN2[1];
  assign P43[0] = IN1[41]&IN2[2];
  assign P42[2] = IN1[42]&IN2[0];
  assign P43[1] = IN1[42]&IN2[1];
  assign P44[0] = IN1[42]&IN2[2];
  assign P43[2] = IN1[43]&IN2[0];
  assign P44[1] = IN1[43]&IN2[1];
  assign P45[0] = IN1[43]&IN2[2];
  assign P44[2] = IN1[44]&IN2[0];
  assign P45[1] = IN1[44]&IN2[1];
  assign P46[0] = IN1[44]&IN2[2];
  assign P45[2] = IN1[45]&IN2[0];
  assign P46[1] = IN1[45]&IN2[1];
  assign P47[0] = IN1[45]&IN2[2];
  assign P46[2] = IN1[46]&IN2[0];
  assign P47[1] = IN1[46]&IN2[1];
  assign P48[0] = IN1[46]&IN2[2];

endmodule
module AR(IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8, IN9, IN10, IN11, IN12, IN13, IN14, IN15, IN16, IN17, IN18, IN19, IN20, IN21, IN22, IN23, IN24, IN25, IN26, IN27, IN28, IN29, IN30, IN31, IN32, IN33, IN34, IN35, IN36, IN37, IN38, IN39, IN40, IN41, IN42, IN43, IN44, IN45, IN46, IN47, IN48, Out1, Out2);
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
  input [2:0] IN42;
  input [2:0] IN43;
  input [2:0] IN44;
  input [2:0] IN45;
  input [2:0] IN46;
  input [1:0] IN47;
  input [0:0] IN48;
  output [48:0] Out1;
  output [1:0] Out2;
  wire w142;
  wire w143;
  wire w144;
  wire w145;
  wire w146;
  wire w147;
  wire w148;
  wire w149;
  wire w150;
  wire w151;
  wire w152;
  wire w153;
  wire w154;
  wire w155;
  wire w156;
  wire w157;
  wire w158;
  wire w159;
  wire w160;
  wire w161;
  wire w162;
  wire w163;
  wire w164;
  wire w165;
  wire w166;
  wire w167;
  wire w168;
  wire w169;
  wire w170;
  wire w171;
  wire w172;
  wire w173;
  wire w174;
  wire w175;
  wire w176;
  wire w177;
  wire w178;
  wire w179;
  wire w180;
  wire w181;
  wire w182;
  wire w183;
  wire w184;
  wire w185;
  wire w186;
  wire w187;
  wire w188;
  wire w189;
  wire w190;
  wire w191;
  wire w192;
  wire w193;
  wire w194;
  wire w195;
  wire w196;
  wire w197;
  wire w198;
  wire w199;
  wire w200;
  wire w201;
  wire w202;
  wire w203;
  wire w204;
  wire w205;
  wire w206;
  wire w207;
  wire w208;
  wire w209;
  wire w210;
  wire w211;
  wire w212;
  wire w213;
  wire w214;
  wire w215;
  wire w216;
  wire w217;
  wire w218;
  wire w219;
  wire w220;
  wire w221;
  wire w222;
  wire w223;
  wire w224;
  wire w225;
  wire w226;
  wire w227;
  wire w228;
  wire w229;
  wire w230;
  wire w231;
  wire w232;
  wire w234;
  wire w236;
  wire w238;
  wire w240;
  wire w242;
  wire w244;
  wire w246;
  wire w248;
  wire w250;
  wire w252;
  wire w254;
  wire w256;
  wire w258;
  wire w260;
  wire w262;
  wire w264;
  wire w266;
  wire w268;
  wire w270;
  wire w272;
  wire w274;
  wire w276;
  wire w278;
  wire w280;
  wire w282;
  wire w284;
  wire w286;
  wire w288;
  wire w290;
  wire w292;
  wire w294;
  wire w296;
  wire w298;
  wire w300;
  wire w302;
  wire w304;
  wire w306;
  wire w308;
  wire w310;
  wire w312;
  wire w314;
  wire w316;
  wire w318;
  wire w320;
  wire w322;
  HalfAdder U0 (IN1[0], IN1[1], Out1[1], w142);
  FullAdder U1 (w142, IN2[0], IN2[1], w143, w144);
  FullAdder U2 (w144, IN3[0], IN3[1], w145, w146);
  FullAdder U3 (w146, IN4[0], IN4[1], w147, w148);
  FullAdder U4 (w148, IN5[0], IN5[1], w149, w150);
  FullAdder U5 (w150, IN6[0], IN6[1], w151, w152);
  FullAdder U6 (w152, IN7[0], IN7[1], w153, w154);
  FullAdder U7 (w154, IN8[0], IN8[1], w155, w156);
  FullAdder U8 (w156, IN9[0], IN9[1], w157, w158);
  FullAdder U9 (w158, IN10[0], IN10[1], w159, w160);
  FullAdder U10 (w160, IN11[0], IN11[1], w161, w162);
  FullAdder U11 (w162, IN12[0], IN12[1], w163, w164);
  FullAdder U12 (w164, IN13[0], IN13[1], w165, w166);
  FullAdder U13 (w166, IN14[0], IN14[1], w167, w168);
  FullAdder U14 (w168, IN15[0], IN15[1], w169, w170);
  FullAdder U15 (w170, IN16[0], IN16[1], w171, w172);
  FullAdder U16 (w172, IN17[0], IN17[1], w173, w174);
  FullAdder U17 (w174, IN18[0], IN18[1], w175, w176);
  FullAdder U18 (w176, IN19[0], IN19[1], w177, w178);
  FullAdder U19 (w178, IN20[0], IN20[1], w179, w180);
  FullAdder U20 (w180, IN21[0], IN21[1], w181, w182);
  FullAdder U21 (w182, IN22[0], IN22[1], w183, w184);
  FullAdder U22 (w184, IN23[0], IN23[1], w185, w186);
  FullAdder U23 (w186, IN24[0], IN24[1], w187, w188);
  FullAdder U24 (w188, IN25[0], IN25[1], w189, w190);
  FullAdder U25 (w190, IN26[0], IN26[1], w191, w192);
  FullAdder U26 (w192, IN27[0], IN27[1], w193, w194);
  FullAdder U27 (w194, IN28[0], IN28[1], w195, w196);
  FullAdder U28 (w196, IN29[0], IN29[1], w197, w198);
  FullAdder U29 (w198, IN30[0], IN30[1], w199, w200);
  FullAdder U30 (w200, IN31[0], IN31[1], w201, w202);
  FullAdder U31 (w202, IN32[0], IN32[1], w203, w204);
  FullAdder U32 (w204, IN33[0], IN33[1], w205, w206);
  FullAdder U33 (w206, IN34[0], IN34[1], w207, w208);
  FullAdder U34 (w208, IN35[0], IN35[1], w209, w210);
  FullAdder U35 (w210, IN36[0], IN36[1], w211, w212);
  FullAdder U36 (w212, IN37[0], IN37[1], w213, w214);
  FullAdder U37 (w214, IN38[0], IN38[1], w215, w216);
  FullAdder U38 (w216, IN39[0], IN39[1], w217, w218);
  FullAdder U39 (w218, IN40[0], IN40[1], w219, w220);
  FullAdder U40 (w220, IN41[0], IN41[1], w221, w222);
  FullAdder U41 (w222, IN42[0], IN42[1], w223, w224);
  FullAdder U42 (w224, IN43[0], IN43[1], w225, w226);
  FullAdder U43 (w226, IN44[0], IN44[1], w227, w228);
  FullAdder U44 (w228, IN45[0], IN45[1], w229, w230);
  FullAdder U45 (w230, IN46[0], IN46[1], w231, w232);
  HalfAdder U46 (w143, IN2[2], Out1[2], w234);
  FullAdder U47 (w234, w145, IN3[2], Out1[3], w236);
  FullAdder U48 (w236, w147, IN4[2], Out1[4], w238);
  FullAdder U49 (w238, w149, IN5[2], Out1[5], w240);
  FullAdder U50 (w240, w151, IN6[2], Out1[6], w242);
  FullAdder U51 (w242, w153, IN7[2], Out1[7], w244);
  FullAdder U52 (w244, w155, IN8[2], Out1[8], w246);
  FullAdder U53 (w246, w157, IN9[2], Out1[9], w248);
  FullAdder U54 (w248, w159, IN10[2], Out1[10], w250);
  FullAdder U55 (w250, w161, IN11[2], Out1[11], w252);
  FullAdder U56 (w252, w163, IN12[2], Out1[12], w254);
  FullAdder U57 (w254, w165, IN13[2], Out1[13], w256);
  FullAdder U58 (w256, w167, IN14[2], Out1[14], w258);
  FullAdder U59 (w258, w169, IN15[2], Out1[15], w260);
  FullAdder U60 (w260, w171, IN16[2], Out1[16], w262);
  FullAdder U61 (w262, w173, IN17[2], Out1[17], w264);
  FullAdder U62 (w264, w175, IN18[2], Out1[18], w266);
  FullAdder U63 (w266, w177, IN19[2], Out1[19], w268);
  FullAdder U64 (w268, w179, IN20[2], Out1[20], w270);
  FullAdder U65 (w270, w181, IN21[2], Out1[21], w272);
  FullAdder U66 (w272, w183, IN22[2], Out1[22], w274);
  FullAdder U67 (w274, w185, IN23[2], Out1[23], w276);
  FullAdder U68 (w276, w187, IN24[2], Out1[24], w278);
  FullAdder U69 (w278, w189, IN25[2], Out1[25], w280);
  FullAdder U70 (w280, w191, IN26[2], Out1[26], w282);
  FullAdder U71 (w282, w193, IN27[2], Out1[27], w284);
  FullAdder U72 (w284, w195, IN28[2], Out1[28], w286);
  FullAdder U73 (w286, w197, IN29[2], Out1[29], w288);
  FullAdder U74 (w288, w199, IN30[2], Out1[30], w290);
  FullAdder U75 (w290, w201, IN31[2], Out1[31], w292);
  FullAdder U76 (w292, w203, IN32[2], Out1[32], w294);
  FullAdder U77 (w294, w205, IN33[2], Out1[33], w296);
  FullAdder U78 (w296, w207, IN34[2], Out1[34], w298);
  FullAdder U79 (w298, w209, IN35[2], Out1[35], w300);
  FullAdder U80 (w300, w211, IN36[2], Out1[36], w302);
  FullAdder U81 (w302, w213, IN37[2], Out1[37], w304);
  FullAdder U82 (w304, w215, IN38[2], Out1[38], w306);
  FullAdder U83 (w306, w217, IN39[2], Out1[39], w308);
  FullAdder U84 (w308, w219, IN40[2], Out1[40], w310);
  FullAdder U85 (w310, w221, IN41[2], Out1[41], w312);
  FullAdder U86 (w312, w223, IN42[2], Out1[42], w314);
  FullAdder U87 (w314, w225, IN43[2], Out1[43], w316);
  FullAdder U88 (w316, w227, IN44[2], Out1[44], w318);
  FullAdder U89 (w318, w229, IN45[2], Out1[45], w320);
  FullAdder U90 (w320, w231, IN46[2], Out1[46], w322);
  FullAdder U91 (w322, w232, IN47[0], Out1[47], Out1[48]);
  assign Out1[0] = IN0[0];
  assign Out2[0] = IN47[1];
  assign Out2[1] = IN48[0];

endmodule
module RC_2_2(IN1, IN2, Out);
  input [1:0] IN1;
  input [1:0] IN2;
  output [2:0] Out;
  wire w5;
  HalfAdder U0 (IN1[0], IN2[0], Out[0], w5);
  FullAdder U1 (IN1[1], IN2[1], w5, Out[1], Out[2]);

endmodule
module NR_47_3(IN1, IN2, Out);
  input [46:0] IN1;
  input [2:0] IN2;
  output [49:0] Out;
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
  wire [2:0] P42;
  wire [2:0] P43;
  wire [2:0] P44;
  wire [2:0] P45;
  wire [2:0] P46;
  wire [1:0] P47;
  wire [0:0] P48;
  wire [48:0] R1;
  wire [1:0] R2;
  wire [49:0] aOut;
  U_SP_47_3 S0 (IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, P44, P45, P46, P47, P48);
  AR S1 (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, P37, P38, P39, P40, P41, P42, P43, P44, P45, P46, P47, P48, R1, R2);
  RC_2_2 S2 (R1[48:47], R2, aOut[49:47]);
  assign aOut[0] = R1[0];
  assign aOut[1] = R1[1];
  assign aOut[2] = R1[2];
  assign aOut[3] = R1[3];
  assign aOut[4] = R1[4];
  assign aOut[5] = R1[5];
  assign aOut[6] = R1[6];
  assign aOut[7] = R1[7];
  assign aOut[8] = R1[8];
  assign aOut[9] = R1[9];
  assign aOut[10] = R1[10];
  assign aOut[11] = R1[11];
  assign aOut[12] = R1[12];
  assign aOut[13] = R1[13];
  assign aOut[14] = R1[14];
  assign aOut[15] = R1[15];
  assign aOut[16] = R1[16];
  assign aOut[17] = R1[17];
  assign aOut[18] = R1[18];
  assign aOut[19] = R1[19];
  assign aOut[20] = R1[20];
  assign aOut[21] = R1[21];
  assign aOut[22] = R1[22];
  assign aOut[23] = R1[23];
  assign aOut[24] = R1[24];
  assign aOut[25] = R1[25];
  assign aOut[26] = R1[26];
  assign aOut[27] = R1[27];
  assign aOut[28] = R1[28];
  assign aOut[29] = R1[29];
  assign aOut[30] = R1[30];
  assign aOut[31] = R1[31];
  assign aOut[32] = R1[32];
  assign aOut[33] = R1[33];
  assign aOut[34] = R1[34];
  assign aOut[35] = R1[35];
  assign aOut[36] = R1[36];
  assign aOut[37] = R1[37];
  assign aOut[38] = R1[38];
  assign aOut[39] = R1[39];
  assign aOut[40] = R1[40];
  assign aOut[41] = R1[41];
  assign aOut[42] = R1[42];
  assign aOut[43] = R1[43];
  assign aOut[44] = R1[44];
  assign aOut[45] = R1[45];
  assign aOut[46] = R1[46];
  assign Out = aOut[49:0];
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
