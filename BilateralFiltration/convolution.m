
function data_filtered = convolution(data,local_window)
%COVOLUTION Function takes img(double) and window size [a b] 
%Calculates and returns spilce operation on the imagie wih given win size
% and gaussian mask with deviation=25 
FUNCTION= @(data_,local_window_) convolution_local(data_,local_window_);

data_filtered=colfilt(data,local_window,'sliding',FUNCTION,local_window);

end

