clear;

% This script creates a sine wave and plots a segment of the sine and its
% DFT amplitude spectrum.

N  = 200000;         % signal length in samples; needs to be even
fs = 40000;          % sampling frequency in Hz
t  = (0 : N-1).'/fs; % vector with time instants in s
f0 = 1000;           % frequency of the sine in Hz; note that it is not a 
                     % coincidence that f0 is an integer fraction of fs

% sine with amplitude 1 and DC offset of 1
sig = sin(2*pi*f0*t) + 1;

% DFT
spec = fft(sig);

% normalize to an amplitude spectrum
spec = spec/N;

% convert to single-sided spectrum
spec = spec(1:end/2+1);
spec(2:end-1) = 2*spec(2:end-1);

% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% do the plotting
figure('Color', [1, 1, 1], 'Position', [500 500 380 200]);

subplot(2, 1, 1);

plot(sig, 'k', 'Linewidth', 2);

xlim([1000 1100]);
ylim([-.2 2.2]);
grid on;
xlabel('Time index $n$', 'interpreter', 'latex');
ylh = ylabel('$x(n)$ (V)', 'interpreter', 'latex');
ylh.Position(1) = ylh.Position(1) - 2.5;

subplot(2, 1, 2);

plot(f, abs(spec), 'k', 'Linewidth', 2);
xlim([0 2000]);
ylim([-.2 1.2]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');
ylabel('$\left|\overline{X}_\mathrm{SS}(k)\right|$ (V)', 'interpreter', 'latex');

%saveas(gcf, 'fig_2.png');
