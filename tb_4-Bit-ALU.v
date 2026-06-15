module tb_alu;
  reg  [3:0] a, b;
  reg  [2:0] opcode;
  wire [3:0] result;
  wire       zero, carry;

  alu_4bit DUT (
    .a(a), .b(b), .opcode(opcode), .result(result),
    .zero(zero), .carry(carry));

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, tb_alu);    

    $monitor("op=%b a=%d b=%d | result=%d zero=%b carry=%b ",
              opcode, a, b, result, zero, carry);

    // ADD tests
    opcode=3'b000; a=4'd3;  b=4'd4;  #10;
    opcode=3'b000; a=4'd7;  b=4'd8;  #10;
    opcode=3'b000; a=4'd15; b=4'd1;  #10;  // carry out

    // SUB tests
    opcode=3'b001; a=4'd9;  b=4'd3;  #10;
    opcode=3'b001; a=4'd5;  b=4'd5;  #10;  // zero flag
    opcode=3'b001; a=4'd2;  b=4'd6;  #10;

    // AND tests
    opcode=3'b010; a=4'b1010; b=4'b1100; #10;
    opcode=3'b010; a=4'b1111; b=4'b0000; #10;

    // OR tests
    opcode=3'b011; a=4'b1010; b=4'b0101; #10;
    opcode=3'b011; a=4'b0000; b=4'b0000; #10;  // zero flag

    // XOR tests
    opcode=3'b100; a=4'b1010; b=4'b1010; #10;  // zero flag
    opcode=3'b100; a=4'b1100; b=4'b0011; #10;

    // SHL tests
    opcode=3'b101; a=4'b0001; b=4'd0; #10;
    opcode=3'b101; a=4'b0011; b=4'd0; #10;

    // SHR tests
    opcode=3'b110; a=4'b1000; b=4'd0; #10;
    opcode=3'b110; a=4'b1100; b=4'd0; #10;

     #10; 
    $finish;
  end
endmodule
