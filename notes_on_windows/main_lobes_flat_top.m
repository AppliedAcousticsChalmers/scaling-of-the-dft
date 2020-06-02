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

% create the windows
win_1 = hann(N);
win_2 = flattopwin(N);

% values of k to compute
k = (2 : 0.1 : 18).';

% Allocate memory
spec_11 = zeros(length(k), 1);
spec_21 = zeros(length(k), 1);
spec_12 = zeros(length(k), 1);
spec_22 = zeros(length(k), 1);

% -------------------- compute the DFT manually ---------------------------
%
%            N-1
% X(k) = \sum      x(n) * exp(-i * 2*pi*n/N * k) 
%           n = 0
%
%
for m = 1 : length(k)
    spec_11(m) = sum(sig_1 .* win_1 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
    spec_21(m) = sum(sig_2 .* win_1 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
    spec_12(m) = sum(sig_1 .* win_2 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
    spec_22(m) = sum(sig_2 .* win_2 .* exp(-1i .* 2*pi/N .* k(m) .* n), 1);
end

% normalize to amplitude spectra
spec_11 = spec_11 ./ sum(win_1, 1);
spec_21 = spec_21 ./ sum(win_1, 1);
spec_12 = spec_12 ./ sum(win_2, 1);
spec_22 = spec_22 ./ sum(win_2, 1);

% convert to single-sided spectra (there are no DC or Nyquist bins in this case)
spec_11 = 2 * spec_11;
spec_21 = 2 * spec_21;
spec_12 = 2 * spec_12;
spec_22 = 2 * spec_22;

% ------------------------- Plot everything -------------------------------
figure('Color', [1, 1, 1], 'Position', [500 500 500 200]);

subplot(1, 2, 1);

plot(k, abs(spec_11), 'k:', 'Linewidth', 1);
% Use this: plot(k, 20*log10(abs(spec_11)), 'k:', 'Linewidth', 1); to plot
% logarihtmically

hold on;
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_11(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
plot(k, abs(spec_12), 'k', 'Linewidth', 1);
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_12(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
hold off;
xlim([k(1) k(end)]);
ylim([-.1 1.1]); % Use this ylim([-100 10]); if you plot things logarihtmically
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{w,\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');


subplot(1, 2, 2);

plot(k, abs(spec_21), 'k:', 'Linewidth', 1);

hold on;
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_21(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
plot(k, abs(spec_22), 'k', 'Linewidth', 1);
% mark values for integer k
plot(k(rem(k, 1) == 0), abs(spec_22(rem(k, 1) == 0)), 'ko', 'Linewidth', 1);
% mark the maximum of the hann windowed signal that occurs at integer k
plot(k(81), abs(spec_21(81)), 'ro');
% mark the maximum of the flat-top windowed signal that occurs at integer k
plot(k(81), abs(spec_22(81)), 'go');
hold off;
xlim([k(1) k(end)]);
ylim([-.1 1.1]);
grid on;
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_{w,\mathrm{SS}}(k)\right|$', 'interpreter', 'latex');

%saveas(gcf, 'fig_4.png');

