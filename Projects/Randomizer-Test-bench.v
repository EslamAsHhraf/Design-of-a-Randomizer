module Randomizer_Tb();
reg clock;
reg Enable;
reg reset;
reg load;
reg [0:95]DataIn;
reg [14:0] seed;
reg [0:95]DataOut;
reg pi;
wire o;
reg [0:95]test;
integer i;
always 
#5 clock=~clock;
Randomizer rand(clock,Enable,reset,load,seed,pi,o );
initial
begin
clock=1'b0;
DataIn=96'hACBCD2114DAE1577C6DBF4C9;
Enable=1;
load=1'b0;
test=96'h558ac4a53a1724e163ac2bf9;
seed=15'b011_0111_0001_0101;
reset=1'b0;
pi=DataIn[0];
#1
DataOut[0]=o;
for(i=1;i<=95;i=i+1)
begin
#4 
pi=DataIn[i];
#6
DataOut[i]=o;
end
$display("%h",DataOut);
if(DataOut==test)
$display("success Expected: %h Recived: %h",test,DataOut);
else
$display("failure Expected: %h Recived: %h",test,DataOut);

#10
$finish;
end
endmodule




