clear;

% This script creates a sine wave with additive white noise and plots the
% signal's DFT pwoer density spectrum for two different lengths and two
% different sampling frequencies.

N  = 200000;         % signal length in samples; needs to be even
fs = 100000;         % sampling frequency in Hz
t  = (0 : N-1).'/fs; % vector with time instants in s
f0 = 1000;           % frequency of the sine in Hz; note that it is not a 
                     % coincidence that f0 is an integer fraction of fs
                    
fs_factor = 8; % we will change fs by this factor

% create sine (RMS = 1/sqrt(2) or -3 dB)
sine = 1 * sin(2*pi*f0*t);

% create white noise (RMS = 1 or 0 dB)
noise = randn(size(t));

% add sine and noise of that an SNR of -20 dB evolves
sig = sine + 10^(20/20) * 1/sqrt(2) .* noise;

% -------------------------------- fs -------------------------------------

% this time, use only the first 1/8th of the signal (we need the remainder 
% later to be able to perform resampling)
N = length(sig)/fs_factor;

% DFT
spec = fft(sig, N);

% scale to power density spectrum
spec = abs(spec).^2 / N / fs;

% convert to single-sided
spec = spec(1:end/2+1);
spec(2:end-1) = 2 * spec(2:end-1);  
        
% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% now do the plotting
figure('Color', [1, 1, 1], 'Position', [500 500 380 200]);

% -------------- now do the plotting --------------
subplot(1, 2, 1);

plot(f, 10*log10(abs(spec)), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([-30 10]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');    
ylabel('$10\log_{10} |\underline{\overline{\overline{X}}}_\mathrm{SS}(k)|$ re.~1 V$^2$/Hz', 'interpreter', 'latex');


% ----------------------------- fs/fs_factor -----------------------------

% Resample the signal. Note that the noise in the frequency band 0 - 2 kHz
% that we will plot is unaffected by this.
sig = resample(sig, 1, fs_factor);
fs = fs/fs_factor;

% this time, use only the first half of the signal
N = N/2;

% DFT
spec = fft(sig, N);

% scale to power density spectrum
spec = abs(spec).^2 / N / fs;

% convert to single-sided
spec = spec(1:end/2+1);
spec(2:end-1) = 2 * spec(2:end-1);  

% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% -------------- now do the plotting --------------
subplot(1, 2, 2);

plot(f, 10*log10(abs(spec)), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([-30 10]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');

ylabel('$10\log_{10} |\underline{\overline{\overline{X}}}_\mathrm{SS}(k)|$ re.~1 V$^2$/Hz', 'interpreter', 'latex');

%saveas(gcf, 'fig_4.png');
