module tb_half_adder;
  
  reg a,b;
  wire sum,carry;

  half_adder DUT (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );

  initial begin
// In Verilog, lines starting with a $ are called system tasks. These are not parts of an actual hardware circuit; instead, they are
// special commands built into the simulator to help you log data, debug, and watch what your circuit is doing.
    
    $dumpfile("dump.vcd");  // Requests software to create a empty file for storing data
    $dumpvars(0, tb_half_adder);  //Module that has to be tested

    $monitor("a=%b b=%b | sum=%b carry=%b", a, b, sum, carry); // %b - Placeholder , prints the text on console

    a=0,b=0;
    #10;    //means "wait for 10 units of simulation time before moving on to the next line of code."
    a=0,b=1;
    #10;
    a=1,b=0;
    #10;
    a=1,b=1;
    #10;
$finish;
  end
endmodule
