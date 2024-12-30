module dual_port_ram #(
    parameter DATA_WIDTH = 8,          
    parameter ADDR_WIDTH = 4           
)(
    input wire clk,                    
    // Port A
    input wire we_a,                    
    input wire [ADDR_WIDTH-1:0] addr_a, 
    input wire [DATA_WIDTH-1:0] din_a,  // Data input for Port A
    output reg [DATA_WIDTH-1:0] dout_a, // Data output for Port A
    // Port B
    input wire we_b,                    // Write Enable for Port B
    input wire [ADDR_WIDTH-1:0] addr_b, // Address for Port B
    input wire [DATA_WIDTH-1:0] din_b,  // Data input for Port B
    output reg [DATA_WIDTH-1:0] dout_b  // Data output for Port B
);

    // Memory declaration
    reg [DATA_WIDTH-1:0] mem [(2**ADDR_WIDTH)-1:0];

    // Port A: Synchronous Write/Read
    always @(posedge clk) begin
        if (we_a) begin
            mem[addr_a] <= din_a;        // Write operation
        end
        dout_a <= mem[addr_a];           // Read operation
    end

    // Port B: Synchronous Write/Read
    always @(posedge clk) begin
        if (we_b) begin
            mem[addr_b] <= din_b;        // Write operation
        end
        dout_b <= mem[addr_b];           // Read operation
    end
endmodule
