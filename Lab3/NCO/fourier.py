import numpy as np
import matplotlib.pyplot as plt

desired_freq = np.array([5000, 10000, 15000]) #desired frequencies in Hz
sampling_freq = 1000000 #Hz
n = 16
step = 2**n * desired_freq / sampling_freq

sin1 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin1.npy')
sin2 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin2.npy')
sin3 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin3.npy')

plt.figure(1)
plt.plot(sin1[0:1000])
plt.plot(sin2[0:1000])
plt.plot(sin3[0:1000])
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin.png')

spectre = np.fft.fftshift(np.fft.fft(sin1))
amplitude = np.abs(spectre)

amp_db = 10 * np.log10(amplitude)
amps_num = amp_db.size
freqs = np.arange(start = -sampling_freq / 2, stop = sampling_freq/ 2, step = sampling_freq/amps_num)

plt.figure(2)
plt.plot(amp_db)
plt.title(f'Step = {step[0]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[0]}dither.png')
plt.show()

spectre = np.fft.fftshift(np.fft.fft(sin2))
amplitude = np.abs(spectre)

amp_db = 10 * np.log10(amplitude)
amps_num = amp_db.size
freqs = np.arange(start = -sampling_freq / 2, stop = sampling_freq/ 2, step = sampling_freq/amps_num)

plt.figure(3)
plt.plot(amp_db)
plt.title(f'Step = {step[1]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[1]}dither.png')
plt.show()

spectre = np.fft.fftshift(np.fft.fft(sin3))
amplitude = np.abs(spectre)

amp_db = 10 * np.log10(amplitude)
amps_num = amp_db.size
freqs = np.arange(start = -sampling_freq / 2, stop = sampling_freq/ 2, step = sampling_freq/amps_num)

plt.figure(4)
plt.plot(amp_db)
plt.title(f'Step = {step[2]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[2]}dither.png')
plt.show()
