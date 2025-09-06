(* techmap_celltype = "$fa" *)
module _tech_fa (A, B, C, X, Y);
  parameter WIDTH = 1;
  (* force_downto *)
    input [WIDTH-1 : 0] A, B, C;
  (* force_downto *)
    output [WIDTH-1 : 0] X, Y;

  /*wire [WIDTH-1 : 0] NX, NY;*/
    
  parameter _TECHMAP_CONSTVAL_A_ = WIDTH'bx;
  parameter _TECHMAP_CONSTVAL_B_ = WIDTH'bx;
  parameter _TECHMAP_CONSTVAL_C_ = WIDTH'bx;
  
  genvar i;
  generate for (i = 0; i < WIDTH; i = i + 1) begin
      if (_TECHMAP_CONSTVAL_A_[i] === 1'b0 || _TECHMAP_CONSTVAL_B_[i] === 1'b0 || _TECHMAP_CONSTVAL_C_[i] === 1'b0) begin
        if (_TECHMAP_CONSTVAL_C_[i] === 1'b0) begin
          HAxp5_ASAP7_75t_R halfadder_Cconst (
              .A(A[i]),
              .B(B[i]),
              .CON(X[i]), .SN(Y[i])
            );
            /*INVx1_ASAP7_75t_R inv_X (.A(NX[i]), .Y(X[i]));
          INVx1_ASAP7_75t_R inv_Y (.A(NY[i]), .Y(Y[i]));*/
        end 
        else begin
          if (_TECHMAP_CONSTVAL_B_[i] === 1'b0) begin
            HAxp5_ASAP7_75t_R halfadder_Bconst (
                .A(A[i]),
                .B(C[i]),
                .CON(X[i]), .SN(Y[i])
              );
              /*INVx1_ASAP7_75t_R inv_X (.A(NX[i]), .Y(X[i]));
          INVx1_ASAP7_75t_R inv_Y (.A(NY[i]), .Y(Y[i]));*/
          end
          else begin
            HAxp5_ASAP7_75t_R halfadder_Aconst (
                .A(B[i]),
                .B(C[i]),
                .CON(X[i]), .SN(Y[i])
              );
             /*INVx1_ASAP7_75t_R inv_X (.A(NX[i]), .Y(X[i]));
          INVx1_ASAP7_75t_R inv_Y (.A(NY[i]), .Y(Y[i]));*/
          end
        end
      end
      else begin
        FAx1_ASAP7_75t_R fulladder (
            .A(A[i]), .B(B[i]), .CI(C[i]), .CON(X[i]), .SN(Y[i])
          );
          /*INVx1_ASAP7_75t_R inv_X (.A(NX[i]), .Y(X[i]));
          INVx1_ASAP7_75t_R inv_Y (.A(NY[i]), .Y(Y[i]));*/
      end

      
    
    end endgenerate

endmodule