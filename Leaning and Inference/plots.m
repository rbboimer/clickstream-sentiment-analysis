
close all
plot(errorRate)
M = movmean(errorRate, 20);
hold on
plot(M)
legend('Test Error Ratio','Moving Average')

%title('Error Rate vs. Self Training Iteration [C = 0.9999]')
title('Error Rate without Self Training Iteration')
%xlabel('Self Training Iteration') 
xlabel('NN Iteration') 
ylabel('Test Vector Error Rate') 