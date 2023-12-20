import cocotb
import numpy as np
from cocotb.triggers import FallingEdge, Timer
from cocotb.clock import Clock

desired_freq = np.array([500, 1000, 1500]) #desired frequencies in Hz
sampling_freq = 10000 #Hz
n = 8
step = 2**n * desired_freq / sampling_freq
print(step)


@cocotb.test()
async def sin_freq1(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    sample_num = 10000
    sin_table = np.zeros(sample_num)

    dut.step.value = int(step[0])
    dut.rst.value = 1
    await Timer(100, units="ns")
    dut.rst.value = 0

    for i in range(sample_num):
        await FallingEdge(dut.clk)
        if not ( ('x' in dut.out.value.binstr) or ('z' in dut.out.value.binstr)):
            sin_table[i] = dut.out.value.signed_integer

    np.save("sin1", sin_table)

@cocotb.test()
async def sin_freq2(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    sample_num = 10000
    sin_table = np.zeros(sample_num)

    dut.step.value = int(step[1])
    dut.rst.value = 1
    await Timer(100, units="ns")
    dut.rst.value = 0

    for i in range(sample_num):
        await FallingEdge(dut.clk)
        if not ( ('x' in dut.out.value.binstr) or ('z' in dut.out.value.binstr)):
            sin_table[i] = dut.out.value.signed_integer

    np.save("sin2", sin_table)

@cocotb.test()
async def sin_freq3(dut):
    cocotb.start_soon(Clock(dut.clk, 1, units="ns").start())

    sample_num = 10000
    sin_table = np.zeros(sample_num)

    dut.step.value = int(step[2])
    dut.rst.value = 1
    await Timer(100, units="ns")
    dut.rst.value = 0

    for i in range(sample_num):
        await FallingEdge(dut.clk)
        if not ( ('x' in dut.out.value.binstr) or ('z' in dut.out.value.binstr)):
            sin_table[i] = dut.out.value.signed_integer

    np.save("sin3", sin_table)



    