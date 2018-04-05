module sign_extend8(result, number);
	input[7:0] number;
	output[15:0] result;
	assign result = { {8{number[7]}}, number};
endmodule

module sign_extend4(result, number);
	input[11:0] number;
	output[15:0] result;
	assign result = { {4{number[11]}}, number};
endmodule
	
module zero_pad8(result, number);
        input[7:0] number;
	output[15:0] result;
	assign result = { 8'h00, number};
endmodule

module zero_pad4(result, number);
        input[11:0] number;
        output[15:0] result;
	assign result = { 4'h0, number};
endmodule

		
