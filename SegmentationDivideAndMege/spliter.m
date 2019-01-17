function spliter(I,y1,y2,x1,x2)
    global maxStd;
    global minSegSize;
    global Seg;
    global index;
    global mRes;
  
    area=I(y1:y2,x1:x2);

    m=mean(area(:));
    s=std(area(:));
    
    [sy,sx]=size(area);
    
    if sy>minSegSize && sx>minSegSize && s>=maxStd
        
        mx=floor((x1+x2)/2);
        my=floor((y1+y2)/2);

        spliter(I,y1,my,x1,mx);
        spliter(I,y1,my,mx,x2);

        spliter(I,my,y2,x1,mx);
        spliter(I,my,y2,mx,x2);     

    else
        
        Seg(y1:y2,x1:x2)=index;
        mRes(y1:y2,x1:x2)=m;        
        index=index+1;
                
    end
   
end

