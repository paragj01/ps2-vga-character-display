module ps2_scan_decoder (
    input  wire       clk,
    input  wire       rst_n,
    input  wire [7:0] scan_code,   // from ps2_receiver
    input  wire       scan_ready,  // 1-cycle pulse from ps2_receiver
    output reg  [6:0] ascii_code,  // decoded ASCII character
    output reg        ascii_ready, 
    output reg        caps_lock_state
);

    reg break_pending; 
    reg ext_pending;   
    reg shift_held;    
    reg caps_lock;     
  
    parameter SC_LSHIFT   = 8'h12;
    parameter SC_RSHIFT   = 8'h59;
    parameter SC_CAPSLOCK = 8'h58;
    parameter SC_BREAK    = 8'hF0;
    parameter SC_EXT      = 8'hE0;

    function [6:0] unshifted_ascii;
        input [7:0] sc;
        begin
            case (sc)
                8'h1C: unshifted_ascii = "a";
                8'h32: unshifted_ascii = "b";
                8'h21: unshifted_ascii = "c";
                8'h23: unshifted_ascii = "d";
                8'h24: unshifted_ascii = "e";
                8'h2B: unshifted_ascii = "f";
                8'h34: unshifted_ascii = "g";
                8'h33: unshifted_ascii = "h";
                8'h43: unshifted_ascii = "i";
                8'h3B: unshifted_ascii = "j";
                8'h42: unshifted_ascii = "k";
                8'h4B: unshifted_ascii = "l";
                8'h3A: unshifted_ascii = "m";
                8'h31: unshifted_ascii = "n";
                8'h44: unshifted_ascii = "o";
                8'h4D: unshifted_ascii = "p";
                8'h15: unshifted_ascii = "q";
                8'h2D: unshifted_ascii = "r";
                8'h1B: unshifted_ascii = "s";
                8'h2C: unshifted_ascii = "t";
                8'h3C: unshifted_ascii = "u";
                8'h2A: unshifted_ascii = "v";
                8'h1D: unshifted_ascii = "w";
                8'h22: unshifted_ascii = "x";
                8'h35: unshifted_ascii = "y";
                8'h1A: unshifted_ascii = "z";

                8'h45: unshifted_ascii = "0";
                8'h16: unshifted_ascii = "1";
                8'h1E: unshifted_ascii = "2";
                8'h26: unshifted_ascii = "3";
                8'h25: unshifted_ascii = "4";
                8'h2E: unshifted_ascii = "5";
                8'h36: unshifted_ascii = "6";
                8'h3D: unshifted_ascii = "7";
                8'h3E: unshifted_ascii = "8";
                8'h46: unshifted_ascii = "9";

                8'h29: unshifted_ascii = " ";        // space bar
                8'h5A: unshifted_ascii = 7'h0D;       // enter (CR)
                8'h66: unshifted_ascii = 7'h08;       // backspace
                8'h0D: unshifted_ascii = 7'h09;       // tab

                8'h4E: unshifted_ascii = "-";
                8'h55: unshifted_ascii = "=";
                8'h4C: unshifted_ascii = ";";
                8'h52: unshifted_ascii = "'";
                8'h41: unshifted_ascii = ",";
                8'h49: unshifted_ascii = ".";
                8'h4A: unshifted_ascii = "/";
				        8'h0E: unshifted_ascii = "`";
                8'h54: unshifted_ascii = "[";
                8'h5B: unshifted_ascii = "]";

                default: unshifted_ascii = 7'h00; // not decoded
            endcase
        end
    endfunction

    function [6:0] shifted_ascii;
        input [7:0] sc;
        reg   [6:0] base;
        begin
            base = unshifted_ascii(sc);
            if (base >= "a" && base <= "z")
                shifted_ascii = base - 8'h20; // to uppercase
            else begin
                case (sc)
                    8'h45: shifted_ascii = ")";
                    8'h16: shifted_ascii = "!";
                    8'h1E: shifted_ascii = "@";
                    8'h26: shifted_ascii = "#";
                    8'h25: shifted_ascii = "$";
                    8'h2E: shifted_ascii = "%";
                    8'h36: shifted_ascii = "^";
                    8'h3D: shifted_ascii = "&";
                    8'h3E: shifted_ascii = "*";
                    8'h46: shifted_ascii = "(";
                    8'h4E: shifted_ascii = "_";
                    8'h55: shifted_ascii = "+";
                    8'h4C: shifted_ascii = ":";
                    8'h52: shifted_ascii = "\"";
                    8'h41: shifted_ascii = "<";
                    8'h49: shifted_ascii = ">";
                    8'h4A: shifted_ascii = "?";
					          8'h0E: shifted_ascii = "~";
                    8'h54: shifted_ascii = "{";
                    8'h5B: shifted_ascii = "}";

                    default: shifted_ascii = base; // space/enter/etc unaffected
                endcase
            end
        end
    endfunction


    wire is_letter = (unshifted_ascii(scan_code) >= "a") &&
                      (unshifted_ascii(scan_code) <= "z");

    // effective "use shifted table" = shift XOR (caps_lock AND is a letter)
    wire use_shift = shift_held ^ (caps_lock && is_letter);

    always @(posedge clk) begin
        if (!rst_n) begin
            break_pending   <= 1'b0;
            ext_pending     <= 1'b0;
            shift_held      <= 1'b0;
            caps_lock       <= 1'b0;
            ascii_code      <= 7'd0;
            ascii_ready     <= 1'b0;
            caps_lock_state <= 1'b0;
        end else begin
            ascii_ready <= 1'b0; // default: 1-cycle pulse

            if (scan_ready) begin
                if (scan_code == SC_BREAK) begin
                    break_pending <= 1'b1;
                end else if (scan_code == SC_EXT) begin
                    ext_pending <= 1'b1;
                end else begin
                    
                    if (break_pending) begin
                       
                        if (scan_code == SC_LSHIFT || scan_code == SC_RSHIFT)
                            shift_held <= 1'b0;
                        
                        break_pending <= 1'b0;
                        ext_pending   <= 1'b0;
                    end else begin
                        
                        if (scan_code == SC_LSHIFT || scan_code == SC_RSHIFT) begin
                            shift_held <= 1'b1;
                        end else if (scan_code == SC_CAPSLOCK) begin
                            caps_lock <= ~caps_lock;
                        end else if (!ext_pending) begin
                            
                            if (unshifted_ascii(scan_code) != 7'h00) begin
                                ascii_code  <= use_shift ? shifted_ascii(scan_code)
                                                          : unshifted_ascii(scan_code);
                                ascii_ready <= 1'b1;
                            end
                        end
                        ext_pending <= 1'b0;
                    end
                end
            end

            caps_lock_state <= caps_lock;
        end
    end

endmodule
