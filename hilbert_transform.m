function y = hilbert_transform(x)
    n = numel(x);
    center = floor(n / 2);
    sequence = zeros(1, n);
    sequence(1:center-1) = -1j;
    sequence(center + 2:end) = 1j;
    hilbert_transform = ifft(fft(x) .* sequence);
    y = hilbert_transform;
end

function y = instantaneous_frequency(x)
    ht_x = hilbert_transform(x)
    instantaneous_phase = atan(imag(ht_x) ./ x); 
    frequency = diff(instantaneous_phase) / (2 * pi);
    y = frequency
end