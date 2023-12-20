import numpy as np
import matplotlib.pyplot as plt

desired_freq = np.array([5000, 10000, 15000]) #desired frequencies in Hz
sampling_freq = 100000 #Hz
n = 16
step = 2**n * desired_freq / sampling_freq

sin1 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin1.npy')
sin2 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin2.npy')
sin3 = np.load('/home/roman/Documents/fpga/Lab3/NCO/sin3.npy')

plt.figure(1)
plt.plot(sin1[0:100])
plt.plot(sin2[0:100])
plt.plot(sin3[0:100])
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin.png')

plt.figure(2)
plt.psd(sin1, 100000, sampling_freq)
plt.title(f'freq = {desired_freq[0]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[0]}dither.png')
plt.show()



plt.figure(3)
plt.psd(sin2, 100000, sampling_freq)
plt.title(f'freq = {desired_freq[1]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[1]}dither.png')
plt.show()



plt.figure(4)
plt.psd(sin3, 100000, sampling_freq)
plt.title(f'freq = {desired_freq[2]}')
plt.xlabel('freq, Hz')
plt.ylabel('amlplitude, db')
plt.grid('on')
plt.savefig(f'/home/roman/Documents/fpga/Lab3/NCO/img/sin_step{step[2]}dither.png')
plt.show()
