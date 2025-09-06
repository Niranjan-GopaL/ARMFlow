//Compilation time: 2025-03-17 16:17:21
//Compilation SHA256 message digest: a3b96163f4df0c250d004b4f2251d595f41e522f2c4c62c3e7bbdda690c221f0
/*----------------------------------------------------------------------------
Copyright (c) 2019-2020 University of Bremen, Germany.
Copyright (c) 2020 Johannes Kepler University Linz, Austria.
This file has been generated with GenMul.
You can find GenMul at: http://www.sca-verification.org/genmul
Contact us at genmul@sca-verification.org

  First input length: 34
  second input length: 4
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
module U_SP_34_4(IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36);
  input [33:0] IN1;
  input [3:0] IN2;
  output [0:0] P0;
  output [1:0] P1;
  output [2:0] P2;
  output [3:0] P3;
  output [3:0] P4;
  output [3:0] P5;
  output [3:0] P6;
  output [3:0] P7;
  output [3:0] P8;
  output [3:0] P9;
  output [3:0] P10;
  output [3:0] P11;
  output [3:0] P12;
  output [3:0] P13;
  output [3:0] P14;
  output [3:0] P15;
  output [3:0] P16;
  output [3:0] P17;
  output [3:0] P18;
  output [3:0] P19;
  output [3:0] P20;
  output [3:0] P21;
  output [3:0] P22;
  output [3:0] P23;
  output [3:0] P24;
  output [3:0] P25;
  output [3:0] P26;
  output [3:0] P27;
  output [3:0] P28;
  output [3:0] P29;
  output [3:0] P30;
  output [3:0] P31;
  output [3:0] P32;
  output [3:0] P33;
  output [2:0] P34;
  output [1:0] P35;
  output [0:0] P36;
  assign P0[0] = IN1[0]&IN2[0];
  assign P1[0] = IN1[0]&IN2[1];
  assign P2[0] = IN1[0]&IN2[2];
  assign P3[0] = IN1[0]&IN2[3];
  assign P1[1] = IN1[1]&IN2[0];
  assign P2[1] = IN1[1]&IN2[1];
  assign P3[1] = IN1[1]&IN2[2];
  assign P4[0] = IN1[1]&IN2[3];
  assign P2[2] = IN1[2]&IN2[0];
  assign P3[2] = IN1[2]&IN2[1];
  assign P4[1] = IN1[2]&IN2[2];
  assign P5[0] = IN1[2]&IN2[3];
  assign P3[3] = IN1[3]&IN2[0];
  assign P4[2] = IN1[3]&IN2[1];
  assign P5[1] = IN1[3]&IN2[2];
  assign P6[0] = IN1[3]&IN2[3];
  assign P4[3] = IN1[4]&IN2[0];
  assign P5[2] = IN1[4]&IN2[1];
  assign P6[1] = IN1[4]&IN2[2];
  assign P7[0] = IN1[4]&IN2[3];
  assign P5[3] = IN1[5]&IN2[0];
  assign P6[2] = IN1[5]&IN2[1];
  assign P7[1] = IN1[5]&IN2[2];
  assign P8[0] = IN1[5]&IN2[3];
  assign P6[3] = IN1[6]&IN2[0];
  assign P7[2] = IN1[6]&IN2[1];
  assign P8[1] = IN1[6]&IN2[2];
  assign P9[0] = IN1[6]&IN2[3];
  assign P7[3] = IN1[7]&IN2[0];
  assign P8[2] = IN1[7]&IN2[1];
  assign P9[1] = IN1[7]&IN2[2];
  assign P10[0] = IN1[7]&IN2[3];
  assign P8[3] = IN1[8]&IN2[0];
  assign P9[2] = IN1[8]&IN2[1];
  assign P10[1] = IN1[8]&IN2[2];
  assign P11[0] = IN1[8]&IN2[3];
  assign P9[3] = IN1[9]&IN2[0];
  assign P10[2] = IN1[9]&IN2[1];
  assign P11[1] = IN1[9]&IN2[2];
  assign P12[0] = IN1[9]&IN2[3];
  assign P10[3] = IN1[10]&IN2[0];
  assign P11[2] = IN1[10]&IN2[1];
  assign P12[1] = IN1[10]&IN2[2];
  assign P13[0] = IN1[10]&IN2[3];
  assign P11[3] = IN1[11]&IN2[0];
  assign P12[2] = IN1[11]&IN2[1];
  assign P13[1] = IN1[11]&IN2[2];
  assign P14[0] = IN1[11]&IN2[3];
  assign P12[3] = IN1[12]&IN2[0];
  assign P13[2] = IN1[12]&IN2[1];
  assign P14[1] = IN1[12]&IN2[2];
  assign P15[0] = IN1[12]&IN2[3];
  assign P13[3] = IN1[13]&IN2[0];
  assign P14[2] = IN1[13]&IN2[1];
  assign P15[1] = IN1[13]&IN2[2];
  assign P16[0] = IN1[13]&IN2[3];
  assign P14[3] = IN1[14]&IN2[0];
  assign P15[2] = IN1[14]&IN2[1];
  assign P16[1] = IN1[14]&IN2[2];
  assign P17[0] = IN1[14]&IN2[3];
  assign P15[3] = IN1[15]&IN2[0];
  assign P16[2] = IN1[15]&IN2[1];
  assign P17[1] = IN1[15]&IN2[2];
  assign P18[0] = IN1[15]&IN2[3];
  assign P16[3] = IN1[16]&IN2[0];
  assign P17[2] = IN1[16]&IN2[1];
  assign P18[1] = IN1[16]&IN2[2];
  assign P19[0] = IN1[16]&IN2[3];
  assign P17[3] = IN1[17]&IN2[0];
  assign P18[2] = IN1[17]&IN2[1];
  assign P19[1] = IN1[17]&IN2[2];
  assign P20[0] = IN1[17]&IN2[3];
  assign P18[3] = IN1[18]&IN2[0];
  assign P19[2] = IN1[18]&IN2[1];
  assign P20[1] = IN1[18]&IN2[2];
  assign P21[0] = IN1[18]&IN2[3];
  assign P19[3] = IN1[19]&IN2[0];
  assign P20[2] = IN1[19]&IN2[1];
  assign P21[1] = IN1[19]&IN2[2];
  assign P22[0] = IN1[19]&IN2[3];
  assign P20[3] = IN1[20]&IN2[0];
  assign P21[2] = IN1[20]&IN2[1];
  assign P22[1] = IN1[20]&IN2[2];
  assign P23[0] = IN1[20]&IN2[3];
  assign P21[3] = IN1[21]&IN2[0];
  assign P22[2] = IN1[21]&IN2[1];
  assign P23[1] = IN1[21]&IN2[2];
  assign P24[0] = IN1[21]&IN2[3];
  assign P22[3] = IN1[22]&IN2[0];
  assign P23[2] = IN1[22]&IN2[1];
  assign P24[1] = IN1[22]&IN2[2];
  assign P25[0] = IN1[22]&IN2[3];
  assign P23[3] = IN1[23]&IN2[0];
  assign P24[2] = IN1[23]&IN2[1];
  assign P25[1] = IN1[23]&IN2[2];
  assign P26[0] = IN1[23]&IN2[3];
  assign P24[3] = IN1[24]&IN2[0];
  assign P25[2] = IN1[24]&IN2[1];
  assign P26[1] = IN1[24]&IN2[2];
  assign P27[0] = IN1[24]&IN2[3];
  assign P25[3] = IN1[25]&IN2[0];
  assign P26[2] = IN1[25]&IN2[1];
  assign P27[1] = IN1[25]&IN2[2];
  assign P28[0] = IN1[25]&IN2[3];
  assign P26[3] = IN1[26]&IN2[0];
  assign P27[2] = IN1[26]&IN2[1];
  assign P28[1] = IN1[26]&IN2[2];
  assign P29[0] = IN1[26]&IN2[3];
  assign P27[3] = IN1[27]&IN2[0];
  assign P28[2] = IN1[27]&IN2[1];
  assign P29[1] = IN1[27]&IN2[2];
  assign P30[0] = IN1[27]&IN2[3];
  assign P28[3] = IN1[28]&IN2[0];
  assign P29[2] = IN1[28]&IN2[1];
  assign P30[1] = IN1[28]&IN2[2];
  assign P31[0] = IN1[28]&IN2[3];
  assign P29[3] = IN1[29]&IN2[0];
  assign P30[2] = IN1[29]&IN2[1];
  assign P31[1] = IN1[29]&IN2[2];
  assign P32[0] = IN1[29]&IN2[3];
  assign P30[3] = IN1[30]&IN2[0];
  assign P31[2] = IN1[30]&IN2[1];
  assign P32[1] = IN1[30]&IN2[2];
  assign P33[0] = IN1[30]&IN2[3];
  assign P31[3] = IN1[31]&IN2[0];
  assign P32[2] = IN1[31]&IN2[1];
  assign P33[1] = IN1[31]&IN2[2];
  assign P34[0] = IN1[31]&IN2[3];
  assign P32[3] = IN1[32]&IN2[0];
  assign P33[2] = IN1[32]&IN2[1];
  assign P34[1] = IN1[32]&IN2[2];
  assign P35[0] = IN1[32]&IN2[3];
  assign P33[3] = IN1[33]&IN2[0];
  assign P34[2] = IN1[33]&IN2[1];
  assign P35[1] = IN1[33]&IN2[2];
  assign P36[0] = IN1[33]&IN2[3];

endmodule
module AR(IN0, IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8, IN9, IN10, IN11, IN12, IN13, IN14, IN15, IN16, IN17, IN18, IN19, IN20, IN21, IN22, IN23, IN24, IN25, IN26, IN27, IN28, IN29, IN30, IN31, IN32, IN33, IN34, IN35, IN36, Out1, Out2);
  input [0:0] IN0;
  input [1:0] IN1;
  input [2:0] IN2;
  input [3:0] IN3;
  input [3:0] IN4;
  input [3:0] IN5;
  input [3:0] IN6;
  input [3:0] IN7;
  input [3:0] IN8;
  input [3:0] IN9;
  input [3:0] IN10;
  input [3:0] IN11;
  input [3:0] IN12;
  input [3:0] IN13;
  input [3:0] IN14;
  input [3:0] IN15;
  input [3:0] IN16;
  input [3:0] IN17;
  input [3:0] IN18;
  input [3:0] IN19;
  input [3:0] IN20;
  input [3:0] IN21;
  input [3:0] IN22;
  input [3:0] IN23;
  input [3:0] IN24;
  input [3:0] IN25;
  input [3:0] IN26;
  input [3:0] IN27;
  input [3:0] IN28;
  input [3:0] IN29;
  input [3:0] IN30;
  input [3:0] IN31;
  input [3:0] IN32;
  input [3:0] IN33;
  input [2:0] IN34;
  input [1:0] IN35;
  input [0:0] IN36;
  output [36:0] Out1;
  output [2:0] Out2;
  wire w137;
  wire w138;
  wire w139;
  wire w140;
  wire w141;
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
  wire w233;
  wire w234;
  wire w235;
  wire w236;
  wire w237;
  wire w238;
  wire w239;
  wire w240;
  wire w241;
  wire w242;
  wire w243;
  wire w244;
  wire w245;
  wire w246;
  wire w247;
  wire w248;
  wire w249;
  wire w250;
  wire w251;
  wire w252;
  wire w253;
  wire w254;
  wire w255;
  wire w256;
  wire w257;
  wire w258;
  wire w259;
  wire w260;
  wire w261;
  wire w262;
  wire w263;
  wire w264;
  wire w265;
  wire w266;
  wire w267;
  wire w269;
  wire w271;
  wire w273;
  wire w275;
  wire w277;
  wire w279;
  wire w281;
  wire w283;
  wire w285;
  wire w287;
  wire w289;
  wire w291;
  wire w293;
  wire w295;
  wire w297;
  wire w299;
  wire w301;
  wire w303;
  wire w305;
  wire w307;
  wire w309;
  wire w311;
  wire w313;
  wire w315;
  wire w317;
  wire w319;
  wire w321;
  wire w323;
  wire w325;
  wire w327;
  wire w329;
  wire w331;
  HalfAdder U0 (IN1[0], IN1[1], Out1[1], w137);
  FullAdder U1 (w137, IN2[0], IN2[1], w138, w139);
  FullAdder U2 (w139, IN3[0], IN3[1], w140, w141);
  FullAdder U3 (w141, IN4[0], IN4[1], w142, w143);
  FullAdder U4 (w143, IN5[0], IN5[1], w144, w145);
  FullAdder U5 (w145, IN6[0], IN6[1], w146, w147);
  FullAdder U6 (w147, IN7[0], IN7[1], w148, w149);
  FullAdder U7 (w149, IN8[0], IN8[1], w150, w151);
  FullAdder U8 (w151, IN9[0], IN9[1], w152, w153);
  FullAdder U9 (w153, IN10[0], IN10[1], w154, w155);
  FullAdder U10 (w155, IN11[0], IN11[1], w156, w157);
  FullAdder U11 (w157, IN12[0], IN12[1], w158, w159);
  FullAdder U12 (w159, IN13[0], IN13[1], w160, w161);
  FullAdder U13 (w161, IN14[0], IN14[1], w162, w163);
  FullAdder U14 (w163, IN15[0], IN15[1], w164, w165);
  FullAdder U15 (w165, IN16[0], IN16[1], w166, w167);
  FullAdder U16 (w167, IN17[0], IN17[1], w168, w169);
  FullAdder U17 (w169, IN18[0], IN18[1], w170, w171);
  FullAdder U18 (w171, IN19[0], IN19[1], w172, w173);
  FullAdder U19 (w173, IN20[0], IN20[1], w174, w175);
  FullAdder U20 (w175, IN21[0], IN21[1], w176, w177);
  FullAdder U21 (w177, IN22[0], IN22[1], w178, w179);
  FullAdder U22 (w179, IN23[0], IN23[1], w180, w181);
  FullAdder U23 (w181, IN24[0], IN24[1], w182, w183);
  FullAdder U24 (w183, IN25[0], IN25[1], w184, w185);
  FullAdder U25 (w185, IN26[0], IN26[1], w186, w187);
  FullAdder U26 (w187, IN27[0], IN27[1], w188, w189);
  FullAdder U27 (w189, IN28[0], IN28[1], w190, w191);
  FullAdder U28 (w191, IN29[0], IN29[1], w192, w193);
  FullAdder U29 (w193, IN30[0], IN30[1], w194, w195);
  FullAdder U30 (w195, IN31[0], IN31[1], w196, w197);
  FullAdder U31 (w197, IN32[0], IN32[1], w198, w199);
  FullAdder U32 (w199, IN33[0], IN33[1], w200, w201);
  HalfAdder U33 (w138, IN2[2], Out1[2], w203);
  FullAdder U34 (w203, w140, IN3[2], w204, w205);
  FullAdder U35 (w205, w142, IN4[2], w206, w207);
  FullAdder U36 (w207, w144, IN5[2], w208, w209);
  FullAdder U37 (w209, w146, IN6[2], w210, w211);
  FullAdder U38 (w211, w148, IN7[2], w212, w213);
  FullAdder U39 (w213, w150, IN8[2], w214, w215);
  FullAdder U40 (w215, w152, IN9[2], w216, w217);
  FullAdder U41 (w217, w154, IN10[2], w218, w219);
  FullAdder U42 (w219, w156, IN11[2], w220, w221);
  FullAdder U43 (w221, w158, IN12[2], w222, w223);
  FullAdder U44 (w223, w160, IN13[2], w224, w225);
  FullAdder U45 (w225, w162, IN14[2], w226, w227);
  FullAdder U46 (w227, w164, IN15[2], w228, w229);
  FullAdder U47 (w229, w166, IN16[2], w230, w231);
  FullAdder U48 (w231, w168, IN17[2], w232, w233);
  FullAdder U49 (w233, w170, IN18[2], w234, w235);
  FullAdder U50 (w235, w172, IN19[2], w236, w237);
  FullAdder U51 (w237, w174, IN20[2], w238, w239);
  FullAdder U52 (w239, w176, IN21[2], w240, w241);
  FullAdder U53 (w241, w178, IN22[2], w242, w243);
  FullAdder U54 (w243, w180, IN23[2], w244, w245);
  FullAdder U55 (w245, w182, IN24[2], w246, w247);
  FullAdder U56 (w247, w184, IN25[2], w248, w249);
  FullAdder U57 (w249, w186, IN26[2], w250, w251);
  FullAdder U58 (w251, w188, IN27[2], w252, w253);
  FullAdder U59 (w253, w190, IN28[2], w254, w255);
  FullAdder U60 (w255, w192, IN29[2], w256, w257);
  FullAdder U61 (w257, w194, IN30[2], w258, w259);
  FullAdder U62 (w259, w196, IN31[2], w260, w261);
  FullAdder U63 (w261, w198, IN32[2], w262, w263);
  FullAdder U64 (w263, w200, IN33[2], w264, w265);
  FullAdder U65 (w265, w201, IN34[0], w266, w267);
  HalfAdder U66 (w204, IN3[3], Out1[3], w269);
  FullAdder U67 (w269, w206, IN4[3], Out1[4], w271);
  FullAdder U68 (w271, w208, IN5[3], Out1[5], w273);
  FullAdder U69 (w273, w210, IN6[3], Out1[6], w275);
  FullAdder U70 (w275, w212, IN7[3], Out1[7], w277);
  FullAdder U71 (w277, w214, IN8[3], Out1[8], w279);
  FullAdder U72 (w279, w216, IN9[3], Out1[9], w281);
  FullAdder U73 (w281, w218, IN10[3], Out1[10], w283);
  FullAdder U74 (w283, w220, IN11[3], Out1[11], w285);
  FullAdder U75 (w285, w222, IN12[3], Out1[12], w287);
  FullAdder U76 (w287, w224, IN13[3], Out1[13], w289);
  FullAdder U77 (w289, w226, IN14[3], Out1[14], w291);
  FullAdder U78 (w291, w228, IN15[3], Out1[15], w293);
  FullAdder U79 (w293, w230, IN16[3], Out1[16], w295);
  FullAdder U80 (w295, w232, IN17[3], Out1[17], w297);
  FullAdder U81 (w297, w234, IN18[3], Out1[18], w299);
  FullAdder U82 (w299, w236, IN19[3], Out1[19], w301);
  FullAdder U83 (w301, w238, IN20[3], Out1[20], w303);
  FullAdder U84 (w303, w240, IN21[3], Out1[21], w305);
  FullAdder U85 (w305, w242, IN22[3], Out1[22], w307);
  FullAdder U86 (w307, w244, IN23[3], Out1[23], w309);
  FullAdder U87 (w309, w246, IN24[3], Out1[24], w311);
  FullAdder U88 (w311, w248, IN25[3], Out1[25], w313);
  FullAdder U89 (w313, w250, IN26[3], Out1[26], w315);
  FullAdder U90 (w315, w252, IN27[3], Out1[27], w317);
  FullAdder U91 (w317, w254, IN28[3], Out1[28], w319);
  FullAdder U92 (w319, w256, IN29[3], Out1[29], w321);
  FullAdder U93 (w321, w258, IN30[3], Out1[30], w323);
  FullAdder U94 (w323, w260, IN31[3], Out1[31], w325);
  FullAdder U95 (w325, w262, IN32[3], Out1[32], w327);
  FullAdder U96 (w327, w264, IN33[3], Out1[33], w329);
  FullAdder U97 (w329, w266, IN34[1], Out1[34], w331);
  FullAdder U98 (w331, w267, IN35[0], Out1[35], Out1[36]);
  assign Out1[0] = IN0[0];
  assign Out2[0] = IN34[2];
  assign Out2[1] = IN35[1];
  assign Out2[2] = IN36[0];

endmodule
module RC_3_3(IN1, IN2, Out);
  input [2:0] IN1;
  input [2:0] IN2;
  output [3:0] Out;
  wire w7;
  wire w9;
  HalfAdder U0 (IN1[0], IN2[0], Out[0], w7);
  FullAdder U1 (IN1[1], IN2[1], w7, Out[1], w9);
  FullAdder U2 (IN1[2], IN2[2], w9, Out[2], Out[3]);

endmodule
module NR_34_4(IN1, IN2, Out);
  input [33:0] IN1;
  input [3:0] IN2;
  output [37:0] Out;
  wire [0:0] P0;
  wire [1:0] P1;
  wire [2:0] P2;
  wire [3:0] P3;
  wire [3:0] P4;
  wire [3:0] P5;
  wire [3:0] P6;
  wire [3:0] P7;
  wire [3:0] P8;
  wire [3:0] P9;
  wire [3:0] P10;
  wire [3:0] P11;
  wire [3:0] P12;
  wire [3:0] P13;
  wire [3:0] P14;
  wire [3:0] P15;
  wire [3:0] P16;
  wire [3:0] P17;
  wire [3:0] P18;
  wire [3:0] P19;
  wire [3:0] P20;
  wire [3:0] P21;
  wire [3:0] P22;
  wire [3:0] P23;
  wire [3:0] P24;
  wire [3:0] P25;
  wire [3:0] P26;
  wire [3:0] P27;
  wire [3:0] P28;
  wire [3:0] P29;
  wire [3:0] P30;
  wire [3:0] P31;
  wire [3:0] P32;
  wire [3:0] P33;
  wire [2:0] P34;
  wire [1:0] P35;
  wire [0:0] P36;
  wire [36:0] R1;
  wire [2:0] R2;
  wire [37:0] aOut;
  U_SP_34_4 S0 (IN1, IN2 , P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36);
  AR S1 (P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18, P19, P20, P21, P22, P23, P24, P25, P26, P27, P28, P29, P30, P31, P32, P33, P34, P35, P36, R1, R2);
  RC_3_3 S2 (R1[36:34], R2, aOut[37:34]);
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
  assign Out = aOut[37:0];
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
