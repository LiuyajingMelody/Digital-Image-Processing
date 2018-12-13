function data_filtered = nlm(data,search_window,close_window,sigm,alfa)

FUNCTION= @(data_,search_window_,local_window_,sigm_,alfa_) nlm_mask(data_,search_window_,local_window_,sigm_,alfa_);

data_filtered=colfilt(data,search_window,'sliding',FUNCTION,search_window,close_window,sigm,alfa);

end

