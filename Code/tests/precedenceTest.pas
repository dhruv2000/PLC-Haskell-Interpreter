begin 

var a : real := 2.0;
var b : real := 4.0;
var c : real := 14.0;
var precedence : real := c + b * a;
precedence := b / a + c * a + b;
precedence := b / a + c * (a + b);

end.