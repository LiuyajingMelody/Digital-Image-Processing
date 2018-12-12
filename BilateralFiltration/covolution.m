
function [data_filtered] = covolution(data,local_window)
%COVOLUTION Summary of this function goes here
FUNCTION= @(data_,local_window_) convolution_local(data_,local_window_);

data_filtered=colfilt(data,local_window,'sliding',FUNCTION,local_window);

end

