% fig-2b page-3 Q100 - Q10 vs voltage
Q_V = zeros(1000,0);
window_size = 50;
V=batch(15).cycles(100).V(1:1000);
hold on
for cy = 101:111
    for i = 1:1000
        Q_V(i) = batch(15).cycles(cy).Qd(i) - batch(15).cycles(10).Qd(i);
    end
    running_average_formulae(cy,:) = movmean(Q_V,window_size);
    plot(running_average_formulae(cy,:),V);
    F = getframe(gca);
end
xlabel('Q[100] - Q[10]')
ylabel('Voltage')
title('V vs \DeltaQ(V)')