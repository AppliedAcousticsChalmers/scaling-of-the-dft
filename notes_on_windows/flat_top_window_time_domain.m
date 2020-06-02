clear;

% This script plots a flat top window.

N = 101;

win = flattopwin(N); 

figure('Color', [1, 1, 1], 'Position', [500 500 250 150]);

plot(0:N-1, win, 'k', 'Linewidth', 2);

xlim([0 N-1]);
ylim([-.2 1.2]);
set(gca, 'YTick', (-.2 : .2 : 1.2));
grid on;
xlabel('$n$', 'interpreter', 'latex');    
ylabel('$w_\mathrm{flattop}(n)$', 'interpreter', 'latex'); 

%saveas(gcf, 'fig_3.png');