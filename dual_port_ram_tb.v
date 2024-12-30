module dual_port_ram_tb;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    // Signals
    reg clk;
    reg we_a, we_b;
    reg [ADDR_WIDTH-1:0] addr_a, addr_b;
    reg [DATA_WIDTH-1:0] din_a, din_b;
    wire [DATA_WIDTH-1:0] dout_a, dout_b;

    // Instantiate Dual-Port RAM
    dual_port_ram #(DATA_WIDTH, ADDR_WIDTH) ram_inst (
        .clk(clk),
        .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a),
        .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 time units clock period

    initial begin
        // Initialize signals
        clk = 0; we_a = 0; we_b = 0;
        addr_a = 0; addr_b = 0;
        din_a = 0; din_b = 0;

        // Write data to Port A
        $display("\n--- Write Operations on Port A ---");
        we_a = 1; addr_a = 4'b0001; din_a = 8'hA5; #10;
        $display("Port A Write: Addr = %d, Data = %h", addr_a, din_a);

        addr_a = 4'b0010; din_a = 8'h5A; #10;
        $display("Port A Write: Addr = %d, Data = %h", addr_a, din_a);

        we_a = 0; // Disable write

        // Simultaneous Write/Read Operations
        $display("\n--- Simultaneous Write/Read Operations ---");
        we_b = 1; addr_b = 4'b0011; din_b = 8'h3C; #10; // Write at Port B
        $display("Port B Write: Addr = %d, Data = %h", addr_b, din_b);

        we_b = 0; addr_b = 4'b0010; #10; // Read from Port B
        $display("Port B Read: Addr = %d, Data = %h", addr_b, dout_b);

        addr_a = 4'b0001; #10; // Read from Port A
        $display("Port A Read: Addr = %d, Data = %h", addr_a, dout_a);

        // Final Read Check
        addr_a = 4'b0010; #10;
        addr_b = 4'b0011; #10;
        $display("\n--- Final Reads ---");
        $display("Port A Read: Addr = %d, Data = %h", addr_a, dout_a);
        $display("Port B Read: Addr = %d, Data = %h", addr_b, dout_b);

        $display("\n--- Simulation Complete ---");
        $finish; // End simulation
    end
endmodule
