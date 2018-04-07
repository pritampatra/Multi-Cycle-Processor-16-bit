module reg_control(RegSrc1, RegSrc2, Op);
	input [3:0] Op;
	output [1:0] RegSrc1, RegSrc2;
	reg [1:0] RegSrc1, RegSrc2;

	always @(Op) begin
		if(Op==4'bxxx) begin
			RegSrc1 = 2'bxx;
			RegSrc2 = 2'bxx;
		end
	end
endmodule
