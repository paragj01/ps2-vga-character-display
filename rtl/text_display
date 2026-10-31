module text_display (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [6:0]  ascii_code,
    input  wire        ascii_ready,
    input  wire [9:0]  pixel_x,
    input  wire [9:0]  pixel_y,
    input  wire        video_on,
    output wire [7:0]  vga_r,
    output wire [7:0]  vga_g,
    output wire [7:0]  vga_b
);

    reg [6:0] history [0:15];
    integer i;
    reg [6:0] last_char;

    always @(posedge clk or negedge rst_n) 
	 begin
        if (!rst_n) 
		  begin
            for (i = 0; i < 16; i = i + 1)
                history[i] <= " ";
            last_char <= " ";
        end 
		  else if (ascii_ready) 
		  begin
            for (i = 15; i > 0; i = i - 1)
                history[i] <= history[i-1];
            history[0] <= ascii_code;
            last_char  <= ascii_code;
        end
    end

    // Big centered character dimensions
    parameter BIG_SCALE = 10;
    parameter BIG_W     = 5 * BIG_SCALE; // 50
    parameter BIG_H     = 7 * BIG_SCALE; // 70
    parameter BIG_X0    = (640 - BIG_W) / 2; // 295
    parameter BIG_Y0    = 150;

    wire big_area = (pixel_x >= BIG_X0) && (pixel_x < BIG_X0 + BIG_W) &&
                    (pixel_y >= BIG_Y0) && (pixel_y < BIG_Y0 + BIG_H);

    wire [2:0] big_row = (pixel_y - BIG_Y0) / BIG_SCALE;
    wire [2:0] big_col = (pixel_x - BIG_X0) / BIG_SCALE; // 0..4

    wire [4:0] big_font_row;
    font_rom u_font_big (
        .ascii (last_char),
        .row   (big_row),
        .pixels(big_font_row)
    );
    wire big_pixel_on = big_area && big_font_row[4 - big_col];
  
    // History line
    parameter HIST_SCALE = 2;
    parameter CELL_W     = 5 * HIST_SCALE + 6;
    parameter CELL_H     = 7 * HIST_SCALE;     
    parameter HIST_X0    = (640 - 16*CELL_W) / 2;
    parameter HIST_Y0    = 380;

    wire hist_area = (pixel_x >= HIST_X0) && (pixel_x < HIST_X0 + 16*CELL_W) &&
                     (pixel_y >= HIST_Y0) && (pixel_y < HIST_Y0 + CELL_H);

    wire [3:0] hist_index    = (pixel_x - HIST_X0) / CELL_W;      // 0..15
    wire [9:0] hist_cell_x   = (pixel_x - HIST_X0) % CELL_W;      // 0..15
    wire [2:0] hist_row      = (pixel_y - HIST_Y0) / HIST_SCALE;  // 0..6
    wire [2:0] hist_col      = hist_cell_x / HIST_SCALE;          // 0..4
    wire       hist_in_glyph = hist_cell_x < (5 * HIST_SCALE);

    wire [4:0] hist_font_row;
    font_rom u_font_hist (
        .ascii (history[15 - hist_index]), // oldest on the left, newest on the right
        .row   (hist_row),
        .pixels(hist_font_row)
    );
    wire hist_pixel_on = hist_area && hist_in_glyph && hist_font_row[4 - hist_col];

    // Color mixing: white text on dark-navy background
    wire pixel_on = big_pixel_on || hist_pixel_on;

    assign vga_r = !video_on ? 8'h00 : (pixel_on ? 8'hFF : 8'h10);
    assign vga_g = !video_on ? 8'h00 : (pixel_on ? 8'hFF : 8'h10);
    assign vga_b = !video_on ? 8'h00 : (pixel_on ? 8'hFF : 8'h30);

endmodule
