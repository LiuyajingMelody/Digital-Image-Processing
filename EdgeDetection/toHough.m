function H = toHough(I,aMin,aMax,aStep,bMin,bMax,bStep)

    z=1;
    for i=aMin:aStep:aMax
        a(z)=i;
        z=z+1;
    end

    c=1;
    for i=bMin:bStep:bMax
        b(c)=i;
        c=c+1;
    end
    
    H=zeros(z,c);
    
    [Y X]=size(I);
    
    for x=1:X
       for y=1:Y 
           for q=1:(z-1)
            aa=a(q)
            if(I(y,x)==1)
                b_v=-aa*x+y;
                [v, bb]=min(abs(b_v-b));
                disp(aa);
                H(q,bb)=H(q,bb)+1;
            end
           end
       end
    end
    
end

