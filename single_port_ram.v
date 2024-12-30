module single_port_ram #(
    parameter DATA_WIDTH = 8,           
    parameter ADDR_WIDTH = 4            
)(
    input wire clk,                     
    input wire we,                    
    input wire [ADDR_WIDTH-1:0] addr, 
    input wire [DATA_WIDTH-1:0] din,    
    output reg [DATA_WIDTH-1:0] dout    
);

    
    reg [DATA_WIDTH-1:0] mem [(2**ADDR_WIDTH)-1:0]; 

    
    always @(posedge clk) begin
        if (we) begin
          
            mem[addr] <= din;
        end else begin
          
            dout <= mem[addr];
        end
    end
endmodule
