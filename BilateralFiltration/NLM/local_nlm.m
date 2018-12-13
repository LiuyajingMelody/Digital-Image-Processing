function data_filtered = local_nlm(data,close_window,sigm)

s=size(data);
Nx=s(2);

data_filtered=zeros(1,Nx);

h=fspecial('gaussian',close_window,sigm);


for i=1:Nx
    
    
    patch=reshape(data(:,i),close_window);
    
    
    
    data_filtered(1,i)=sum(sum(patch .* h));
    
    
    
end





end
