clear;

% This script creates a sine wave and plots its DFT magnitude spectrum for
% DFTs of two different lengths. 

N = 200000;         % signal length in samples; needs to be even
fs = 40000;         % sampling frequency in Hz
t = (0 : N-1).'/fs; % vector with time instants in s
f0 = 1000;          % frequency of the sine in Hz; note that it is not a 
                    % coincidence that f0 is an integer fraction of fs

% sine wave
sine = sin(2*pi*f0*t(1:end/2)); % length is N/2

% DFT
spec = fft(sine);

% convert to single-sided spectrum
spec = spec(1:end/2+1);
spec(2:end-1) = 2*spec(2:end-1);

% create a frequency axis in Hz for the plot
f = linspace(0, fs/2, length(spec)).';

% do the plotting
figure('Color', [242, 242, 242]/255, 'Position', [500 500 380 140]);

subplot(1, 2, 1);

plot(f, abs(spec), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([0 2.5e5]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');
ylabel('$\left|X(k)\right|$', 'interpreter', 'latex');

% -------------------------------------------------------------------------

% sine wave
sine = sin(2*pi*f0*t);

% DFT
spec = fft(sine); % length is N

% convert to single-sided spectrum
spec = spec(1:end/2+1);
spec(2:end-1) = 2*spec(2:end-1);

% create a frequency axis in Hz for the plot
f = linspace(0, fs/2, length(spec)).';

subplot(1, 2, 2);

plot(f, abs(spec), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([0 2.5e5]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');
ylabel('$\left|X(k)\right|$', 'interpreter', 'latex');

% make sure that background color is preserved when saving
set(gcf, 'InvertHardCopy', 'off'); 

saveas(gcf, 'fig_1.png');
