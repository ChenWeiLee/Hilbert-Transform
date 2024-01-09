t = 0:0.01:10;
x = 0.2 * t + cos(2 * pi * t) + 0.4 * cos(10 * pi * t);

noise   = 0.05 * randn(size(t));  % add noise
x_noisy = x + noise


thr = 0.2;
y = hilbert_huang_transform(x_noisy, t, thr, 100);

figure(1)
plot(t, x_noisy)
plot(t, y)
axis([0, 10, -2, 2])
hold on;
