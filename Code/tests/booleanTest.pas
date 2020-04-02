begin

var a : boolean := true;
var b : boolean := false;
var aANDb : boolean := a AND b;
var aORb : boolean := a OR b;
var notB : boolean := not b;
var c: boolean := (not(a AND b) AND b);
c := a AND b;

end.