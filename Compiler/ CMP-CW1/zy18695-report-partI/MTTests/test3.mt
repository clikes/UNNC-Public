let
    var x: Integer;
    var y: Integer;
    var z: Integer;
    const s: Integer = 0
in
    begin
        repeat
            begin
                x := 1<1 ? 2<2 ? 3 : 4 : 5;
                y := 1<1 ? 2 : 3<3 ? 4 : 5;
                z := 1<1 ? 2<2 ? 3 : 4<4 ? 5 : 6 : 7
            end
        until (x + s) > 42;
        a := '\n';
        a := '\\';
        a := '\t';
        a := '\''
    end
