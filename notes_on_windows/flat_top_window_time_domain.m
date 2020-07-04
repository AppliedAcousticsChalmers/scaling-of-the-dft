clear;

% This script plots a flat top window.

N = 101;

win = flattopwin(N); 

figure('Color', [242, 242, 242]/255, 'Position', [500 500 250 150]);

plot(0:N-1, win, 'k', 'Linewidth', 2);

xlim([0 N-1]);
ylim([-.2 1.2]);
set(gca, 'YTick', (-.2 : .2 : 1.2));
grid on;
xlabel('$n$', 'interpreter', 'latex');    
ylabel('$w_\mathrm{flattop}(n)$', 'interpreter', 'latex'); 

% make sure that background color is preserved when saving
set(gcf, 'InvertHardCopy', 'off'); 

%saveas(gcf, 'fig_3.png');