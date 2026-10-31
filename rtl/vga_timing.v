module vga_timing (
    input  wire        clk25,
    input  wire        rst_n,
    output wire         hsync,
    output wire         vsync,
    output wire         video_on,
    output reg  [9:0]   pixel_x,   // 0..639 valid when video_on
    output reg  [9:0]   pixel_y    // 0..479 valid when video_on
);

    parameter H_SYNC   = 96,  H_BACK = 48, H_ACTIVE = 640, H_FRONT = 16;
    parameter H_TOTAL  = H_SYNC + H_BACK + H_ACTIVE + H_FRONT; // 800

    parameter V_SYNC   = 2,   V_BACK = 33, V_ACTIVE = 480, V_FRONT = 10;
    parameter V_TOTAL  = V_SYNC + V_BACK + V_ACTIVE + V_FRONT; // 525

    reg [9:0] h_cnt;
    reg [9:0] v_cnt;

    always @(posedge clk25) begin
        if (!rst_n) begin
            h_cnt <= 10'd0;
            v_cnt <= 10'd0;
        end else begin
            if (h_cnt == H_TOTAL - 1) begin
                h_cnt <= 10'd0;
                v_cnt <= (v_cnt == V_TOTAL - 1) ? 10'd0 : v_cnt + 10'd1;
            end else begin
                h_cnt <= h_cnt + 10'd1;
            end
        end
    end

    // Active-low sync pulses, asserted during the sync interval
    assign hsync = ~((h_cnt >= 0) && (h_cnt < H_SYNC));
    assign vsync = ~((v_cnt >= 0) && (v_cnt < V_SYNC));

    wire h_active = (h_cnt >= (H_SYNC + H_BACK)) && (h_cnt < (H_SYNC + H_BACK + H_ACTIVE));
    wire v_active = (v_cnt >= (V_SYNC + V_BACK)) && (v_cnt < (V_SYNC + V_BACK + V_ACTIVE));

    assign video_on = h_active && v_active;

    always @(posedge clk25) begin
        pixel_x <= h_active ? (h_cnt - (H_SYNC + H_BACK)) : 10'd0;
        pixel_y <= v_active ? (v_cnt - (V_SYNC + V_BACK)) : 10'd0;
    end

endmodule
