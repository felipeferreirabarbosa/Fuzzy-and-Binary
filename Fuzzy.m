function Fuzzy(obj)
    while(1)
        df = ReadSonar(obj,2);
        if(isempty(df))
            df=3;
        end   
        de = ReadSonar(obj,3);
        if(isempty(de))
            de=3;
        end   
        dd = ReadSonar(obj,1);
        if(isempty(dd))
            dd=3;
        end   
        [x y]= genOverhead(obj);
        plot(x,y,'r .');
        fuzzy = readfis('fuzzy');
        Y=evalfis([df,dd,de],fuzzy);
        SetDriveWheelsCreate(obj,Y(1),Y(2));
        pause(0.001);
    end
