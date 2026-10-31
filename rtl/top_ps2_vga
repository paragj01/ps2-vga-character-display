module top_ps2_vga (
    input  wire        CLOCK_50,
    input  wire        KEY0,        //reset
    inout  wire        PS2_CLK,
    inout  wire        PS2_DAT,
    output wire [7:0]  VGA_R,
    output wire [7:0]  VGA_G,
    output wire [7:0]  VGA_B,
    output wire        VGA_HS,
    output wire        VGA_VS,
    output wire        VGA_CLK,
    output wire        VGA_BLANK_N,
    output wire        VGA_SYNC_N,
    output wire [17:0] LEDR       // LEDR[0] blinks once per received scan code
);

    wire rst_n = KEY0; //reset
    reg clk25;
    
	always @(posedge CLOCK_50) begin
        if (!rst_n) clk25 <= 1'b0;
        else        clk25 <= ~clk25;
    end
    assign VGA_CLK = clk25;


    wire ps2_clk_in = PS2_CLK;
    wire ps2_dat_in = PS2_DAT;

    wire [7:0] scan_code;
    wire       scan_ready;
    wire       frame_error;

    ps2_receiver u_ps2_rx (
        .clk        (CLOCK_50),
        .rst_n      (rst_n),
        .ps2_clk    (ps2_clk_in),
        .ps2_dat    (ps2_dat_in),
        .scan_code  (scan_code),
        .scan_ready (scan_ready),
        .frame_error(frame_error)
    );

    wire [6:0] ascii_code;
    wire       ascii_ready;
    wire       caps_lock_state;

    ps2_scan_decoder u_decoder (
        .clk             (CLOCK_50),
        .rst_n           (rst_n),
        .scan_code       (scan_code),
        .scan_ready      (scan_ready),
        .ascii_code      (ascii_code),
        .ascii_ready     (ascii_ready),
        .caps_lock_state (caps_lock_state)
    );

  
    reg        ascii_toggle_50;
    reg  [6:0] ascii_code_50;
    always @(posedge CLOCK_50) begin
        if (!rst_n) begin
            ascii_toggle_50 <= 1'b0;
            ascii_code_50   <= 7'd0;
        end else if (ascii_ready) begin
            ascii_toggle_50 <= ~ascii_toggle_50;
            ascii_code_50   <= ascii_code;
        end
    end

    reg ascii_toggle_25_ff1, ascii_toggle_25_ff2, ascii_toggle_25_ff3;
    always @(posedge clk25) begin
        if (!rst_n) begin
            ascii_toggle_25_ff1 <= 1'b0;
            ascii_toggle_25_ff2 <= 1'b0;
            ascii_toggle_25_ff3 <= 1'b0;
        end else begin
            ascii_toggle_25_ff1 <= ascii_toggle_50;
            ascii_toggle_25_ff2 <= ascii_toggle_25_ff1;
            ascii_toggle_25_ff3 <= ascii_toggle_25_ff2;
        end
    end
    wire ascii_ready_25 = ascii_toggle_25_ff2 ^ ascii_toggle_25_ff3;


    reg [6:0] ascii_code_25;
    always @(posedge clk25) begin
        if (ascii_ready_25) ascii_code_25 <= ascii_code_50;
    end

//VGA timing
    wire [9:0] pixel_x, pixel_y;
    wire       video_on;

    vga_timing u_vga_timing (
        .clk25   (clk25),
        .rst_n   (rst_n),
        .hsync   (VGA_HS),
        .vsync   (VGA_VS),
        .video_on(video_on),
        .pixel_x (pixel_x),
        .pixel_y (pixel_y)
    );

    text_display u_text_display (
        .clk        (clk25),
        .rst_n      (rst_n),
        .ascii_code (ascii_code_25),
        .ascii_ready(ascii_ready_25),
        .pixel_x    (pixel_x),
        .pixel_y    (pixel_y),
        .video_on   (video_on),
        .vga_r      (VGA_R),
        .vga_g      (VGA_G),
        .vga_b      (VGA_B)
    );

    assign VGA_BLANK_N = video_on;
    assign VGA_SYNC_N  = 1'b0;

    
    // LEDR[0] toggles each time a scan code is received,
    // LEDR[1] flags a parity/framing error, LEDR[2] shows Caps Lock state

    reg activity_led;
    always @(posedge CLOCK_50) begin
        if (!rst_n)          activity_led <= 1'b0;
        else if (scan_ready) activity_led <= ~activity_led;
    end

    reg error_led;
    always @(posedge CLOCK_50) begin
        if (!rst_n)            error_led <= 1'b0;
        else if (frame_error)  error_led <= 1'b1;
        else if (KEY0 == 1'b0) error_led <= 1'b0; 
    end

    assign LEDR[0]     = activity_led;
    assign LEDR[1]     = error_led;
    assign LEDR[2]     = caps_lock_state;
    assign LEDR[17:3]  = 15'd0;

endmodule
