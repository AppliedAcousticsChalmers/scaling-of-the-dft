clear;

% This script plots the amplitude spectra of a sine with a frequency that
% is identical to the center frequency of a bin as well as of a sine whose
% requency is precisely half-way between the center frequencies of two
% adjacent bins.

N  = 200000;         % signal length in samples; needs to be even
fs = 100000;         % sampling frequency in Hz
t  = (0 : N-1).'/fs; % vector with time instants in s
f0 = 1000;           % frequency of the sine in Hz; note that it is not a 
                     % coincidence that f0 is an integer fraction of fs
                                     
% create sine
sig = 1 * sin(2*pi*f0*t);

% DFT
spec = fft(sig, N);

% scale to amplitude spectrum
spec = spec/N;

% convert to single-sided
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
ylim([-10 5]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');    
ylabel('$20\log_{10} \left|\overline{X}_\mathrm{SS}(k)\right|$', 'interpreter', 'latex');

% change the frequency by half the frequency resolution
f0 = f0 + 0.5 * fs/N;

% create sine
sig = 1 * sin(2*pi*f0*t);

% DFT
spec = fft(sig, N);

% scale to amplitude spectrum
spec = spec/N;

% convert to single-sided
spec = spec(1:end/2+1);
spec(2:end-1) = 2 * spec(2:end-1);  
        
% create a frequency axis for the plot in Hz
f = linspace(0, fs/2, length(spec)).';

% -------------- now do the plotting --------------
subplot(1, 2, 2);

plot(f, 20*log10(abs(spec)), 'k', 'Linewidth', 2);

xlim([0 2000]);
ylim([-10 5]);
grid on;
xlabel('Frequency (Hz)', 'interpreter', 'latex');    
ylabel('$20\log_{10} \left|\overline{X}_\mathrm{SS}(k)\right|$', 'interpreter', 'latex');

%saveas(gcf, 'fig_1.png');
