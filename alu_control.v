module alu_control(alu_op,f_field,alu_ctrl);
input [1:0]f_field;
input [2:0]alu_op;
output [2:0]alu_ctrl;
wire w0,w1,w2,w3,w4,w5,w6,w7,w8;
not n1(w0,alu_op[2]),
    n2(w3,alu_op[1]);
and a1(w1,alu_op[0],w0,alu_op[1]),
    a2(w2,w1,f_field[0]),
	a3(w4,w3,alu_op[2]),
	a4(w6,alu_op[1],alu_op[2]),
	a5(w8,f_field[1],w1);
nor n0(w5,alu_op[1],alu_op[2]);	
or  o1(w7,w6,w5,w2,w4),
    o2(alu_ctrl[1],w8,w6);
and	a6(alu_ctrl[0],alu_op[0],w7),
    a7(alu_ctrl[2],w1,1'b1);
endmodule	


   	
	