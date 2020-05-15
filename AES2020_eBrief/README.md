The MATLAB scripts in this folder recreate the figures from our paper 

> J. Ahrens, C. Andersson, P. Höstmad, W. Kropp, “Tutorial on Scaling of the Discrete Fourier Transform and the Implied Physical Units of the Spectra of Time-Discrete Signals,” 148th Convention of the AES, e-Brief 56, May 2020.

---

Script `fig_1_unscaled_magnitude_spectrum.m`:

Fig 1: ![\left|X(k)\right|](https://render.githubusercontent.com/render/math?math=%5Cleft%7CX(k)%5Cright%7C) of a sine wave of frequency![f=1000](https://render.githubusercontent.com/render/math?math=f%3D1000)Hz and with amplitude ![A=1](https://render.githubusercontent.com/render/math?math=A%3D1) for![N=1\cdot 10^5](https://render.githubusercontent.com/render/math?math=N%3D1%5Ccdot%2010%5E5) (left) and ![N=1\cdot 10^5](https://render.githubusercontent.com/render/math?math=N%3D2%5Ccdot%2010%5E5)(right).

![fig_1](fig_1.png "fig_1")

---

Script `fig_2_single_sided_amplitude_spectrum_1.m`:

Fig 2: Illustration of single-sided amplitude spectra. The upper plot depicts ![x(n)](https://render.githubusercontent.com/render/math?math=x(n)), a sine wave of frequency ![f=1000](https://render.githubusercontent.com/render/math?math=f%3D1000)Hz, with amplitude ![A=1](https://render.githubusercontent.com/render/math?math=A%3D1)V, and a DC of 1 V. The lower plot depicts ![\left|\overline{X}_\text{SS}(k)\right|](https://render.githubusercontent.com/render/math?math=%5Cleft%7C%5Coverline%7BX%7D_%5Ctext%7BSS%7D(k)%5Cright%7C).

![fig_2](fig_2.png "fig_2")

---

Script `fig_3_single_sided_amplitude_spectrum_2`:

Fig. 3: Single-sided amplitude spectra ![\left|\overline{X}_\text{SS}(k)\right|](https://render.githubusercontent.com/render/math?math=%5Cleft%7C%5Coverline%7BX%7D_%5Ctext%7BSS%7D(k)%5Cright%7C) on a logarithmic scale of a sine of amplitude 1 and implied unit V with additive white noise. ![f_\text{s} = 100](https://render.githubusercontent.com/render/math?math=f_%5Ctext%7Bs%7D%20%3D%20100)kHz. Left: ![N = 2\cdot 10^5](https://render.githubusercontent.com/render/math?math=N%20%3D%202%5Ccdot%2010%5E5). Right: ![N = 2/8 \cdot 10^5](https://render.githubusercontent.com/render/math?math=N%20%3D%202%2F8%20%5Ccdot%2010%5E5).

![fig_3](fig_3.png "fig_3")

---

Script `fig_4_power_density_spectrum.m`:

Fig. 4: Single-sided power spectral density ![|\underline{\overline{\overline{X}}}_\text{SS}(k)|](https://render.githubusercontent.com/render/math?math=%7C%5Cunderline%7B%5Coverline%7B%5Coverline%7BX%7D%7D%7D_%5Ctext%7BSS%7D(k)%7C)of the signal from Fig. 3 for different sampling frequencies ![f_\text{s}](https://render.githubusercontent.com/render/math?math=f_%5Ctext%7Bs%7D) and lengths ![N](https://render.githubusercontent.com/render/math?math=N). Left: ![f_\text{s} = 100](https://render.githubusercontent.com/render/math?math=f_%5Ctext%7Bs%7D%20%3D%20100) kHz, ![N = 25000](https://render.githubusercontent.com/render/math?math=N%20%3D%2025000). Right: ![f_\text{s} = 12.5](https://render.githubusercontent.com/render/math?math=f_%5Ctext%7Bs%7D%20%3D%2012.5) kHz, ![N = 12500](https://render.githubusercontent.com/render/math?math=N%20%3D%2012500).

![fig_4](fig_4.png "fig_4")

---

The inline math expressions were created with [A hack for showing LaTeX formulas in GitHub markdown.md](https://gist.github.com/a-rodin/fef3f543412d6e1ec5b6cf55bf197d7b). 