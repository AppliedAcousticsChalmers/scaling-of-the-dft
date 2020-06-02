clear;

N = 101;

% Time indices
n = (0 : N-1).';

% create sine with amplitude 1 and a frequency on bin 10
f0 = 10; % in bins
sig_1 = sin(2*pi*f0/N*n);

% create sine with amplitude 1 and a frequency equivalent to 10.4 bins
f0 = 10.4; % in bins
sig_2 = sin(2*pi*f0/N*n);

% values of k to compute
k = (2 : 0.1 : 18).';

% Allocate memory
spec_1 = zeros(length(k), 1);
spec_2 = zeros(length(k), 1);


% -------------------- compute the DFT manually ---------------------------
%
%            N-1
% X(k) = \sum      x(n) * exp(-i * 2*pi*n/N * k) 
%           n = 0
%

% This implies a rectangular window
for m = 1 : length(k)
    spec_1(m) = sum(sig_1 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
    spec_2(m) = sum(sig_2 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
end

% normalize to amplitude spectra
spec_1 = spec_1 ./ N;
spec_2 = spec_2 ./ N;

% convert to single-sided spectra (there are no DC or Nyquist bins in this case)
spec_1 = 2 * spec_1;
spec_2 = 2 * spec_2;

% ----------------- Plot everything in a simple way -----------------------
figure('Color', [1, 1, 1], 'Position', [500 500 500 200]);

subplot(1, 2, 1);

% plot values for integer k
plot(k(rem(k, 1) == 0), abs(spec_1(rem(k, 1) == 0)), 'k', 'Linewidth', 1);

xlim([k(1) k(end)]);
ylim([-.1 1.1]);
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');


subplot(1, 2, 2);

% plot values for integer k
plot(k(rem(k, 1) == 0), abs(spec_2(rem(k, 1) == 0)), 'k', 'Linewidth', 1);

xlim([k(1) k(end)]);
ylim([-.1 1.1]);
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');

% saveas(gcf, 'fig_2a.png');

% ------------ Plot everything in a differentiated way --------------------
figure('Color', [1, 1, 1], 'Position', [500 500 500 200]);

subplot(1, 2, 1);

plot(k, abs(spec_1), 'Color', [1 1 1] * .7);

hold on;
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_1(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
hold off;
xlim([k(1) k(end)]);
ylim([-.1 1.1]);
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');

subplot(1, 2, 2);

plot(k, abs(spec_2), 'Color', [1 1 1] * .7);

hold on;
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_2(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
hold off;
xlim([k(1) k(end)]);
ylim([-.1 1.1]);
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');

% saveas(gcf, 'fig_2b.png');

