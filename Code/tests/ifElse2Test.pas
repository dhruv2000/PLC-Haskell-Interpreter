begin
var condition : boolean := true;

if(condition) then
begin
    var x : real := 12.0;
    var result : boolean := true;
end
else
begin
    var x : real := 33.0;
    var result : boolean := false;
end


if(not condition) then
begin
    var temp : boolean := true;
    var x : real := 12.0;
end
else
begin
    var temp : boolean := false;
    var x : real := 33.0;
end

end.