module traffic_control(clk,rst,m1,m2,m3,m4);
input clk,rst;                 // Input clock and reset signals
output reg [2:0]m1;            // Output signals for traffic lights at four locations
output reg [2:0]m2;            // Green--3'b001;Red-- 3'b100;Yellow-- 3'b010;          
output reg [2:0]m3;             //m1-->(straight from left to right),m2 -->(straight from left to right themn turn right)                                                    
output reg [2:0]m4;             //m3-->(straight from down to up then turn right),m4--> (straight from right to left then turn left as well as go straight) 

parameter s1=1,s2=2,s3=3,s4=4,s5=5,s6=6;   // State parameters representing different traffic light sequences
reg [2:0]count;                            // Counter to keep track of time spent in each state
reg [2:0]ps;                               // Present state variable


parameter sec7=7,sec2=2,sec3=3,sec4=4;    // Time duration for different traffic light states

always@(posedge clk or posedge rst)
begin
        if(rst)
            begin
            count<=0;                                  // Reset the counter
            ps<=s1;                                    // Set initial state to s1
            end
       else
            begin
                case(ps)
                    s1:if(count<sec7)                  // First state: main road green, others red
                            begin
                                ps<=s1;
                                count<=count+1;
                                m1=3'b001;            // Green
                                m2=3'b100;            // Red
                                m3=3'b100;            // Red
                                m4=3'b001;            // Green
                            end
                       else
                            begin
                                ps<=s2;               // Move to next state
                                count<=0;
                            end
                    s2:if(count<sec2)                  // Yellow transition for minor roads
                            begin
                                ps<=s2;
                                count<=count+1;
                                m1=3'b001;         // Green
                                m2=3'b100;         // Red
                                m3=3'b100;         // Red
                                m4=3'b010;         // Yellow
                            end
                       else
                            begin
                                ps<=s3;             // Move to next state
                                count<=0;
                            end
                    s3:if(count<sec3)
                            begin
                                ps<=s3;
                                count<=count+1;
                                m1=3'b001;          // Green
                                m2=3'b001;          // Green
                                m3=3'b100;          // Red
                                m4=3'b100;          // Red
                            end
                       else
                            begin
                                ps<=s4;             // Move to next state
                                count<=0;
                            end
                    s4:if(count<sec2)
                            begin
                                ps<=s4;
                                count<=count+1;
                                m1=3'b010;         // Yellow
                                m2=3'b010;         // Yellow
                                m3=3'b100;         // Red
                                m4=3'b100;         // Red
                            end
                       else
                            begin
                                ps<=s5;            // Move to next state
                                count<=0;
                            end
                    s5:if(count<sec4)
                            begin
                                ps<=s5;
                                count<=count+1;
                                m1=3'b100;            // Red
                                m2=3'b100;            // Red
                                m3=3'b001;            // Green
                                m4=3'b100;              // Red
                            end
                       else
                            begin
                                ps<=s6;             // Move to next state
                                count<=0;
                            end  
                    s6:if(count<sec2)
                            begin
                                ps<=s6;
                                count<=count+1;
                                m1=3'b100;           // Red
                                m2=3'b100;           // Red
                                m3=3'b101;           // Yellow
                                m4=3'b100;           // Red
                            end
                       else
                            begin
                                ps<=s1;             // Loop back to initial state
                                count<=0;
                            end    
                endcase
            end

end  
endmodule
