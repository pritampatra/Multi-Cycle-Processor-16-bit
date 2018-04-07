module controller (PCWriteCondEq, PCWriteCondNeq, PCWrite, IMRead, IMWrite, DMRead, DMWrite, MemtoReg, IRWrite, PCSrc, ALUOp, ALUSrcA, ALUSrcB, RegWrite, RegDst, Clk, Reset, Op);
	input [3:0] Op; 
	input Clk, Reset;
	output reg [2:0] ALUOp;
	output reg ALUSrcB, PCSrc, PCWriteCondEq, PCWriteCondNeq, PCWrite, IMRead, IMWrite, DMRead, DMWrite; 			   		output reg [1:0] MemtoReg;
	output reg IRWrite, ALUSrcA, RegWrite, RegDst;
	
	reg [4:0] state = 0, nextstate;
	
	parameter S0=0;
	parameter S1=1;
	parameter S2=2;
	parameter S3=3;
	parameter S4=4;
	parameter S5=5;
	parameter S6=6;
	parameter S7=7;
	parameter S8=8;
	parameter S9=9;
	parameter S10=10;
	parameter S11=11;
	parameter S12=12;
	parameter S13=13;
	parameter S14=14;
	parameter S15=15;
	parameter S16=16;
	parameter S17=17;
	parameter S18=18;
	parameter S19=19;
	parameter S20=20;
	
	always@(posedge Clk) begin
		state=nextstate;
	end
	
	always @(state, Op) begin
		case(state)
			S0: begin
					IMRead=1'b1;
					IRWrite=1'b1;
					ALUSrcA=1'b0;
					ALUSrcB=3'b011;
					ALUOp= 3'b000;
					PCWrite=1'b1;
					PCSrc=1'b0;
					RegWrite = 1'b0;
					IMWrite=1'b0;
					DMWrite= 1'b0;
					PCWriteCondEq= 1'b0;
					PCWriteCondNeq= 1'b0;
					MemtoReg=2'b00;
					nextstate=S1;
				end
				
			S1: begin
					IMRead=1'b0;
					IRWrite=1'b0;
					PCWrite=1'b0;
				
					if(Op==4'b1000) begin 
						nextstate=S2;
					end
					if(Op==4'b1100) begin 
						nextstate=S3;
					end
					if(Op==4'b1011) begin 
						nextstate=S4;
					end
					if(Op==4'b1111) begin 
						nextstate=S5;
					end
					
					if(Op==4'b0100) begin 
						nextstate=S6;
					end
					if(Op==4'b0101) begin 
						nextstate=S7;
					end
					
					if(Op==4'b0001 || Op==4'b0010) begin 
						nextstate=S8;
					end
					
					if(Op==4'b0011) begin 
						nextstate=S9;
					end
					
					if(Op==4'b0110) begin 
						nextstate=S10;
					end
					if(Op==4'b0111) begin 
						nextstate=S11;
					end
					if(Op==4'b1101) begin 
						nextstate=S12;
					end
					if(Op==4'b1001) begin 
						nextstate=S13;
					end
					
					if(Op==4'b1110) begin 
						nextstate=S14;
					end
					if(Op==4'b1010) begin 
						nextstate=S15;
					end
					
					if(Op==4'b0000) begin 
						nextstate=S16;
					end
				
				end

				S2: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S3: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S4: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S5: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				
				S6: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b011;
						PCSrc = 1'b1;
						PCWriteCondEq = 1'b1;
						nextstate = S0;
					end
				S7: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b011;
						PCSrc = 1'b1;
						PCWriteCondNeq = 1'b1;
						nextstate = S0;
					end
					
				S8: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b101;
						ALUOp = 3'b000;
						if(Op==4'b0001) begin
							nextstate = S18;
						end
						else begin
							nextstate = S19;
						end
					end
					
				S9: begin
						ALUSrcA = 1'b0;
						ALUSrcB= 3'b001;
						ALUOp = 3'b001;
						PCWrite = 1'b1;
						PCSrc = 1'b0;
						nextstate = S0;
					end
					
				S10: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b010;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S11: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b010;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S12: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b010;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S13: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b010;
						ALUOp = 3'b001;
						nextstate = S17;
					end
					
				S14: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b100;
						ALUOp = 3'b001;
						nextstate = S17;
					end
				S15: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b100;
						ALUOp = 3'b001;
						nextstate = S17;
					end
					
				S16: begin
						ALUSrcA = 1'b1;
						ALUSrcB= 3'b000;
						ALUOp = 3'b010;
						MemtoReg = 2'b01;
						RegWrite = 1'b1;
						RegDst = 1'b1;
						nextstate = S0;
					end
					
				S17: begin
						MemtoReg = 2'b10;
						RegWrite = 1'b1;
						RegDst = 1'b1;
						nextstate = S0;
					end
					
				S18: begin
						DMRead = 1'b1;
						nextstate = S20;
					end
				
				S19: begin
						DMWrite = 1'b1;
						nextstate = S0;
					end
					
				S20: begin
						MemtoReg = 2'b00;
						RegWrite = 1'b1;
						RegDst = 1'b0;
						nextstate = S0;
					end
			endcase
	end
endmodule
