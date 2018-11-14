let
    proc swap(var x: Integer, var y: Integer)
	let
	   var t: Integer
	in begin
    	t := x; x := y; y := t
    end;
	var a: Integer[5] := [7,3,1,9,2];
	var i: Integer;
	var j: Integer
in begin
    i := 0;
	while i < 4 do begin
    	j := i + 1;
		while j < 5 do begin
    		if a[i] > a[j] then
    			swap(a[i], a[j])
			else skip();
			j := j + 1 
		end;
		i := i + 1 
	end;
	i := 0;
	while i <= 4 do begin
		putint(a[i]);
		i := i + 1 
	end
end