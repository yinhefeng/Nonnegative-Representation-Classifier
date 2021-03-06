para = 1:1:Par.maxIter;
% set(gca, 'YScale', 'log')
plot(para,err1(2:end),'--s','LineWidth',1.5,...
    'MarkerFaceColor','k',...
    'MarkerSize',3);
hold on;
plot(para,err2(2:end),'-.s','LineWidth',1.5,...
    'MarkerFaceColor','k',...
    'MarkerSize',3);
plot(para,err3(2:end),'s','LineWidth',1.5,...
    'MarkerFaceColor','k',...
    'MarkerSize',3);
axis([1 Par.maxIter 0 10]);
legend('|c_{k+1}-z_{k+1}|','|c_{k+1}-c_{k}|','|z_{k+1}-z_{k}|');
xlabel({'Iteration k'});
ylabel('Error');
grid on;