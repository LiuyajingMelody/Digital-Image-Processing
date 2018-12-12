function data_filtered = convolution_local(data,local_window)

s=size(data);
Nx=s(2);
h=fspecial('gaussian',local_window,25);

data_filtered=zeros(1,Nx);

for i=1:Nx
    
    patch=reshape(data(:,i),local_window);
    
    data_filtered(1,i)=sum(sum(patch .* h));
    

end

