clear;

% This script creates a sine wave with additive white noise and plots the
% signal's DFT amplitude spectrum for two different lengths.

N  = 200000;         % signal length in samples; needs to be even
fs = 100000;         % sampling frequency in Hz
t  = (0 : N-1).'/fs; % vector with time instants in s
f0 = 1000;           % frequency of the sine in Hz; note that it is not a 
                     % coincidence that f0 is an integer fraction of fs

% create sine (RMS = 1/sqrt(2) or -3 dB)
sine = 1 * sin(2*pi*f0*t);

% create white noise (RMS = 1 or 0 dB)
noise = randn(size(t));

% add sine and noise of that an SNR of -15 dB evolves
sig = sine + 10^(15/20) * 1/sqrt(2) .* noise;

% --------------------------- length N ------------------------------------

% DFT
spec = fft(sig, N);

% normalize to an amplitude spectrum
spec = spec/N;
        
 % convert to single-sided spectrum
spec = spec(1:end/2+1);
spec(2:end-1) = 2 * spec(2:end-1);   

% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% now do the plotting
figure('Color', [1, 1, 1], 'Position', [500 500 380 200]);

% -------------- now do the plotting --------------
subplot(1, 2, 1);

plot(f, 20*log10(abs(spec)), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([-30 10]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');
ylabel('$20\log_{10} |\overline{X}_\mathrm{SS}(k)|$ re.~1 V', 'interpreter', 'latex');


% ---------------------------- length N/8 ---------------------------------
N = round(N/8);

% DFT
spec = fft(sig, N);

% normalize to an amplitude spectrum
spec = spec/N;
        
 % convert to single-sided spectrum
spec = spec(1:end/2+1);
spec(2:end-1) = 2 * spec(2:end-1);   

% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% -------------- now do the plotting --------------
subplot(1, 2, 2);

plot(f, 20*log10(abs(spec)), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([-30 10]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');
ylabel('$20\log_{10} |\overline{X}_\mathrm{SS}(k)|$ re.~1 V', 'interpreter', 'latex');
    
%saveas(gcf, 'fig_3.png');

    

