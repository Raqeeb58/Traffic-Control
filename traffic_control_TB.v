module traffic_control_TB;
reg clk,rst;
wire [2:0]m1;
wire [2:0]m2;
wire [2:0]m3;
wire [2:0]m4;

traffic_control dut(clk,rst,m1,m2,m3,m4);
// Clock generation: Toggle every 10 time units
initial
begin
    clk=0;
    forever #10 clk=~clk;
end
initial
begin
    rst=1;             // Apply reset initially
    #10 rst=0;         // Release reset after 10 time units
    #100000 rst=0;     // Keep running simulation
    #10 rst=1;         // Apply reset again to check reset functionality
    #100000 $finish;   // End simulation after sufficient time
end   
endmodule
