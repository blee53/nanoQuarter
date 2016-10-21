/*
* 	Nathan Chinn
* 	Minion CPU - NanoQuarter
*
*	Module:  Main Control
*	Inputs:  stall flag, opcode from instruction, function from instruction
*	Outputs: jump flag, branch flag, no op flag, mem read & write flag
*
*/

module MainControl( 	input	   stall_flg,
			input[1:0] opcode,
			input[2:0] funct,
			output reg jmp_flg,	brnch_flg,
				   nop_flg,	memRd_flg,
			   	   memWrt_flg
		   );

	parameter rType = 2'b00;
	parameter iType = 2'b01;
	parameter jType = 2'b10;
	parameter bType = 2'b11;

	parameter rdWrtJnct = 3'b010;


	always @ (*)
	begin
		jmp_flg   = 0;	brnch_flg  = 0;	
		memRd_flg = 0;	memWrt_flg = 0;
		
		nop_flg = stall_flg;

		case(opcode)
			rType:
				jmp_flg = 0; // have to do something I guess...
			iType:
				begin
					if (funct >= rdWrtJnct) memRd_flg = 0; memWrt_flg = 1;
				end
			
				begin
					if (funct <  rdWrtJnct) memRd_flg = 1; memWrt_flg = 0;
				end
			jType:
				jmp_flg = 1;
			bType:
				brnch_flg = 1;
		endcase
	end

endmodule // MainControll
