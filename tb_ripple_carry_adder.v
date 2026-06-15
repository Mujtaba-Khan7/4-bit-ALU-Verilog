module tb_rca;
  reg  [3:0] a, b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;

  ripple_carry_adder DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_rca);

    $monitor("a=%d b=%d cin=%b | sum=%d cout=%b", a, b, cin, sum, cout);

    a=4'd3;  b=4'd5;  cin=0; #10;
    a=4'd7;  b=4'd8;  cin=0; #10;
    a=4'd15; b=4'd1;  cin=0; #10;  // overflow case
    a=4'd9;  b=4'd6;  cin=1; #10;
    a=4'd0;  b=4'd0;  cin=0; #10;

    $finish;
  end
endmodule
