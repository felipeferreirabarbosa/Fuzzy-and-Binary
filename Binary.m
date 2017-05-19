%%Lógica Binária
function Binary(obj)
    javaaddpath('C:\Program Files\swipl\lib\jpl.jar');
    x=org.jpl7.Query('consult(''IABinary.pl'')');
    x.hasSolution;
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

        c = {{['blkD(' num2str(df) ',' num2str(de) ',' num2str(dd) ').']},{['blkE(' num2str(df) ',' num2str(de) ',' num2str(dd) ').']},{['fF(' num2str(df) ',' num2str(de) ',' num2str(dd) ').']}};
        
        x=org.jpl7.Query(c{1}{:});
        r = x.hasSolution;
    
        if (r) 
            SetDriveWheelsCreate(obj,0.5,-0.5);
        end
        
        x=org.jpl7.Query(c{2}{:});
        r = x.hasSolution;
        
        if (r) 
            SetDriveWheelsCreate(obj,-0.5,0.5);
        end
        x=org.jpl7.Query(c{3}{:});
        r = x.hasSolution;
        
        if (r) 
            SetDriveWheelsCreate(obj,0.5,0.5);
        end
        [x y]= genOverhead(obj);
        plot(x,y,'b .');
        pause(0.01);
    end   