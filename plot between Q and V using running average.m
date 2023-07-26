% fig-2b page-3 Q100 - Q10 vs voltage
Q_V = zeros(1000,0);
window_size = 110;
V=batch(15).cycles(100).V(1:1000);
[v1,I]=sort(V);
hold on
for cy = 104%:111
    for i = 1:1000
        Q_V(i) = batch(15).cycles(cy).Qd(i) - batch(15).cycles(10).Qd(i);
    end
    Q=Q_V(I);
    running_average_formulae(cy,:) = movmean(Q,window_size);
    plot(running_average_formulae(cy,:),v1);
    F = getframe(gca);
    %text(0.021,v1(250),int2str(cy) );
   % hold on
   %figure
  % plot(Q,V);

    
end
xlabel('Q[100] - Q[10]')
ylabel('Voltage')
title('V vs \DeltaQ(V)')
axis([-0.15 0.05 2 3.5])