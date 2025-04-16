# Traffic-Control
1. traffic_control Module (Main FSM Controller)
 
Inputs:
clk: System clock.
rst: Asynchronous reset.

Outputs:
 m1, m2, m3, m4: 3-bit signals representing traffic lights on 4 different roads.
  3'b001 = Green
  3'b010 = Yellow
  3'b100 = Red
  
m1-->(straight from left to right),

m2 -->(straight from left to right themn turn right   

m3-->(straight from down to up then turn right),

m4--> (straight from right to left then turn left as well as go straight) 

States and Timing:
The FSM moves through 6 states, each representing a phase in traffic light control:

State	Duration	Lights

s1	7 cycles	m1 and m4 → Green; m2 and m3 → Red

s2	2 cycles	Yellow transition for m4

s3	3 cycles	m1 and m2 → Green; m3, m4 → Red

s4	2 cycles	Yellow for m1 and m2

s5	4 cycles	m3 → Green; others Red

s6	2 cycles	Yellow for m3, others Red

After s6, the FSM loops back to s1.



