module ps2_receiver (
    input  wire       clk,        
    input  wire       rst_n,      // active-low reset
    input  wire       ps2_clk,    // clock line (board)
    input  wire       ps2_dat,    // data line  (board)
    output reg  [7:0] scan_code,  // 8-bit scaned code
    output reg        scan_ready, // high when code is recieved from keyboard
    output reg        frame_error // parity/framing error
);

   
    // 2-flip-flops for the two asynchronous PS data and clock lines
    reg ps2_clk_ff1, ps2_clk_ff2;
    reg ps2_dat_ff1, ps2_dat_ff2;

    always @(posedge clk or negedge rst_n) 
	 begin
        if (!rst_n) 
		  begin
            ps2_clk_ff1 <= 1'b1;
            ps2_clk_ff2 <= 1'b1;
            ps2_dat_ff1 <= 1'b1;
            ps2_dat_ff2 <= 1'b1;  //store value 1 in both the flip-flops if the value of reset is 0 (active low)
        end 
		  else 
		  begin
            ps2_clk_ff1 <= ps2_clk;
            ps2_clk_ff2 <= ps2_clk_ff1;
            ps2_dat_ff1 <= ps2_dat;
            ps2_dat_ff2 <= ps2_dat_ff1; //pass the values coming from the keyboard when reset is 1
        end
    end

    // Falling-edge detection
    reg  ps2_clk_prev;
    wire ps2_clk_falling = ps2_clk_prev & ~ps2_clk_ff2;

    always @(posedge clk) 
	 begin
        if (!rst_n) ps2_clk_prev <= 1'b1;
        else        ps2_clk_prev <= ps2_clk_ff2;
    end


    //FSM
    parameter S_IDLE   = 3'd0,
               S_START  = 3'd1,
               S_DATA   = 3'd2,
               S_PARITY = 3'd3,
               S_STOP   = 3'd4;

    reg [2:0] state;
    reg [2:0] bit_cnt;     // counts the 8 data bits serially
    reg [7:0] shift_reg;   // accumulates data bits, LSB first
    reg       parity_calc; // running XOR of the 8 data bits (odd parity expected)

    always @(posedge clk or negedge rst_n) 
	 begin
        if (!rst_n) 
		  begin
            state       <= S_IDLE;
            bit_cnt     <= 3'd0;
            shift_reg   <= 8'd0;
            parity_calc <= 1'b0;
            scan_code   <= 8'd0;
            scan_ready  <= 1'b0;
            frame_error <= 1'b0;
        end 
		  else 
		  begin
            
            scan_ready  <= 1'b0;
            frame_error <= 1'b0;

            if (ps2_clk_falling) begin
                case (state)
                    // Wait for the start bit 
                    S_IDLE: begin
                        if (ps2_dat_ff2 == 1'b0) 
								begin
                            state       <= S_DATA;
                            bit_cnt     <= 3'd0;
                            shift_reg   <= 8'd0;
                            parity_calc <= 1'b0;
                        end
                       
                    end

                    // Shifting operation considering the keyboard sends LSB first
                    S_DATA: begin
                        shift_reg   <= {ps2_dat_ff2, shift_reg[7:1]};
                        parity_calc <= parity_calc ^ ps2_dat_ff2;
                        if (bit_cnt == 3'd7)
                            state <= S_PARITY;
                        else
                            bit_cnt <= bit_cnt + 3'd1;
                    end

                    
                    // keyboard sends odd parity therefor output must equal 1
                    S_PARITY: begin
                        if ((parity_calc ^ ps2_dat_ff2) == 1'b1)
                            state <= S_STOP; // parity OK
                        else 
								begin
                            state       <= S_IDLE; // parity error
                            frame_error <= 1'b1;   // don't store data
                        end
                    end

                    // Stop bit must be 1
                    S_STOP: begin
                        state <= S_IDLE;
                        if (ps2_dat_ff2 == 1'b1)
								begin
                            scan_code  <= shift_reg;
                            scan_ready <= 1'b1;
                        end 
								else 
								begin
                            frame_error <= 1'b1; // framing error
                        end
                    end

                    default: state <= S_IDLE;
                endcase
            end
        end
    end

endmodule
