/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Jump_Calc.v
*	Input:	 reg 1 data, target, func
*	Output:	 Jump Address
*
*/

module JumpCalc( input[15:0]		reg1data,	// Register 1 data	
		 input[7:0]		jtarget,	// Target to jump to 
		 input[2:0]		funct,		// function code

		 output reg[7:0]	jaddr		// Jump Address
	  );
	parameter JMP = 3'b000;
	parameter JR  = 3'b001;

	always @(*)
	begin
		case (funct)
			JMP: jaddr = jtarget;
			JR : jaddr = reg1data[10:3];
			default: jaddr = 0;
		endcase
	end
endmodule
