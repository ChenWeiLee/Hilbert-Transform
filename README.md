# Signal Analysis and Hilbert-Huang Transform Implementation
## Introduction
This repository contains MATLAB scripts for performing signal analysis, specifically focusing on the Hilbert Transform and Hilbert-Huang Transform. These transforms are useful for analyzing non-linear and non-stationary time series data.
* Using the Hilbert Transform to determine the instantaneous Frequency 
* Hilbert-Huang Transform with pre-Denoising

## Files Description
1. main.m:
* Demonstrates the calculation of instantaneous frequency using the Hilbert Transform.
* Visualizes both the input signal and its instantaneous frequency.

2. hilbert_transform.m:
* Implements the Hilbert Transform and calculates instantaneous frequency.
* hilbert_transform function computes the Hilbert Transform of a given signal.
* instantaneous_frequency function calculates the instantaneous frequency of a signal based on its Hilbert Transform.

3. main_hht.m:
* Shows an application of the Hilbert-Huang Transform (HHT).
* Generates a sample signal with added Gaussian noise and visualizes it.
* Applies the Hilbert-Huang Transform to the noisy signal.

4. hilbert_huang_transform.m:
* Implements the Hilbert-Huang Transform.
* Includes functions for finding Intrinsic Mode Functions (IMFs), checking for IMF conditions, finding local extrema, and checking monotonicity of a sequence.
* Incorporates a low-pass filter function lowpass_filter_fn to pre-process the input signal.

## Usage
1. Running the Hilbert Transform Example:
* Open main.m.
* Run the script to visualize the input signal and its instantaneous frequency.

2. Using the Hilbert-Huang Transform:
* Open main_hht.m.
* Run the script to see how the HHT is applied to a noisy signal and view the output.

## Functions
1. Hilbert Transform:
* **hilbert_transform(x)**: Computes the Hilbert Transform of the signal x.
* **instantaneous_frequency(x)**: Calculates the instantaneous frequency of x using its Hilbert Transform.

2. Hilbert-Huang Transform:
* **hilbert_huang_transform(x, t, thr, ls_m)**: Applies the HHT to the signal x with time vector t, threshold thr, and low-pass filter parameter ls_m.
* **findIMF(y, t, length, thr, maxIter)**: Identifies Intrinsic Mode Functions in the signal y.
* **isIMF(h, t, length, thr)**: Checks if a signal h is an IMF.
* **findExtrema(data, length)**: Finds local maxima and minima in data.
* **checkMonotonic(data, length)**: Checks if a signal data is monotonic.
* **lowpass_filter_fn(x, m)**: Applies a low-pass filter to x with cutoff m.

## Requirements
MATLAB

## Notes
The scripts are designed for educational purposes and demonstration of the Hilbert and Hilbert-Huang Transforms.
For more complex applications, consider optimizing and adapting the code accordingly.