begin

var a : real;
var b : real;
var year : real := 1.0;
var months : real := 12.0;
var weeks : real := 52.0;
var daysInWeek : real := 7.0;
var first : boolean := true;
var second : boolean := false;
// const constantA : real := 3.0;
// const constantB : real := 7.0;
// const thisWorks : boolean := true;

var daysInYear : real := 1.0 + weeks * daysInWeek;

if(weeks > months) then
begin
a := daysInWeek + year;
b := 6.0;
end

else
begin
a := year + year;
b := 9.0;
end

var firstANDsecond : boolean := first AND second;
var firstORsecond : boolean := first OR second;
var notFirst : boolean := not first;
var notSecond : boolean := not second;

writeln(firstANDsecond);
writeln(a);

var c : real := cos(3.14159265358979323);
var d : real := ln(1.0);
var e : real := exp(2.0);

end.