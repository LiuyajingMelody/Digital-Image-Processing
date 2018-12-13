function data_filtered = bilateral_filtration(data,local_window,sigm)

FUNCTION= @(data_,local_window_,sigm_) local_bilateral_filtra(data_,local_window_,sigm_);

data_filtered=colfilt(data,local_window,'sliding',FUNCTION,local_window,sigm);

end

