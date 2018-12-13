function data_filtered =local_bilateral_filtra(data,local_window,sigm)

s=size(data);
Nx=s(2);
h=fspecial('gaussian',local_window,sigm);

data_filtered=zeros(1,Nx);

for i=1:Nx
    
    patch=reshape(data(:,i),local_window);
    
    
    [Y, X]=size(patch);
    mid=patch(round(Y/2),round(X/2));
    
    value=patch-mid;
    value_dists=zeros(Y,X);
    for y=1:Y
        for x=1:X
            value_dists(y,x)=exp( -((value(y,x))^2) / (2*(sigm^2)) );
        end
    end
    
    dists=zeros(Y,X);
    
    for y=1:Y
        for x=1:X
            dis=sqrt((round(X/2)-x)^2+(round(Y/2)-y)^2);
            
            dists(y,x)=dis;
        end
    end
    
    mask=dists.*h.*value_dists;
    norm=sum(sum(mask));
    mask=mask/norm;
        
    
    
    
    
    data_filtered(1,i)=sum(sum(patch.*mask));
    

end