function data_filtered = nlm_mask(data,search_window,close_window,sigm,alfa)

FUNCTION= @(data_,local_window_,sigm_) local_nlm(data_,close_window,sigm_);
alf=alfa;
s=size(data);
Nx=s(2);

data_filtered=zeros(1,Nx);

for i=1:Nx
    
    patch=reshape(data(:,i),search_window);

    
    mask=colfilt(patch,close_window,'sliding',FUNCTION,close_window,sigm);
    [Y, X]=size(mask);
    mid=mask(round(Y/2),round(X/2));
    
    points=exp(-(mask-mid).^2/(alf*sigm^2));
    norm=sum(sum(points));
    points=points/norm;
    
    data_filtered(1,i)=sum(sum(patch.*points));
end





end


