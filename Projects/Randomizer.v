module Randomizer(clock,Enable,reset,load,seed,DataIn,DataOut );
input clock;
input Enable;
input reset;
input load;
input  [14:0]seed;
input DataIn;
output  DataOut;
wire si;
reg [14:0] re_seed;
assign re_seed=seed;
assign si= re_seed[0]^re_seed[1];
assign DataOut=DataIn^si;
always@(posedge clock)
begin
if(reset)
re_seed=0;
else if (load)
re_seed=seed;
else if(Enable)
begin
re_seed=re_seed>>1;
re_seed[14]=si;
end
else
re_seed=0;
end 
endmodule






