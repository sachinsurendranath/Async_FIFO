`timescale 1ns/1ns

module testbench;

	reg [15:0] wrt_data;
	reg wrt_en, wrt_clk, wrt_rst_n;
	reg rd_en, rd_clk, rd_rst_n;
	wire [15:0] rd_data;
	wire full, empty;
	
	integer i;
	
	asynchronous_fifo fifo (rd_data,
				full,
				empty,
			    wrt_data,
			   	wrt_en,
				wrt_clk,
				wrt_rst_n,
			   	rd_en,
				rd_clk,
				rd_rst_n);
	
	always
	begin
		rd_clk = ~rd_clk; //10MHz
		#50;
	end
	
	always
	begin
		wrt_clk = ~wrt_clk;//50Mhz
		#10;
	end
	
	initial
	begin
		rd_clk = 0;
		wrt_clk = 0;
		rd_rst_n = 0;
		wrt_rst_n = 0;
		wrt_en = 0;
		rd_en = 0;
		#120;
		
		rd_rst_n = 1;
		wrt_rst_n = 1;
		#25;
		
		wrt_data = 420;
		wrt_en = 1;
		rd_en = 1;
		#20;
		for (i=1; i<50; i=i+1)
		begin
			wrt_data = i;
			#20;
		end
		wrt_en = 0;
		
		#5000;
		
		wrt_data = 619;
		wrt_en = 1;
		#20;
		for (i=1; i<50; i=i+1)
		begin
			wrt_data = 2*i + 3*i*i + 5;
			#20;
		end
		wrt_en = 0;
		
		#5000;
		$stop;
	end
endmodule
