function RMSE=get_rmse(X,Y)

%%%Y is truth;

RMSE=1-sqrt(mean((X-Y).^2))./std(Y);