function [outputArg1,outputArg2] = spliter(I,TH,BH,LV,RV)
    global maxStd;
    global minSegSize;
    global Seg;
    global index;
    global mRes;
    
    area=zeros((BH-TH)*(RV-LV));
    i=1;
    
    for y=TH:BH
       for x=LV:RV 
            area(i)=I(y,x);
            i=i+1;
       end
    end

    m=mean(area);
    s=std(are);
    
    if size(area)>minSegSize*minSegSize && s>maxStd
        MV=(LV+RV)/2;
        MH=(TH+BH)/2;

        spliter(I,TH,MH,LV,MV);
        spliter(I,TH,MH,MV,RV);

        spliter(I,MH,BH,LV,MV);
        spliter(I,MH,BH,MV,RV);     

    else
        for y=TH:BH
         for x=LV:RV 
            Seg(y,x)=index;
         end
        end
        mRes(index)=m;
        index=index+1;
                
    end
    [Y,X]=size(I);
    
    i=1;
    while i<=index
        cutted=zeros(Y,X);
        for y=1:Y
           for x=1:X 
                if Seg(y,x)==i
                   cutted(y,x)=1; 
                end
           end   
        end
     if sum(sum(cutted)) >0   
        [yF xF]=find(cutted,1,'first');
        mask=strel('square',3);
        cutted_dilate=imdilate(cutted,mask);
        dif=cutted_dilate-cutted;
        cut_out=Seg.*dif;
        nz=nonzeros(cut_out);
        uniq=unique(nz);
        l=size(uniq);
       
        for z-1:l
            for y=1:Y
                for x=1:X 
                    if Seg(y,x)==z
                    neigb(y,x)=1; 
                    end
                end
            end   
        
        
            
        end
            
     end
    i=i+1;
end

