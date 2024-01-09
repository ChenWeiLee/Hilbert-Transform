t = 0:0.001:0.999; 
frequencies = 5;
x = sin(2 * pi * frequencies .* t);  
cht = -cos(2 * pi * frequencies .* t);  

frequency = instantaneous_frequency(x);

subplot(2, 1, 1);
plot(t, x);
xlabel('Time');
ylabel('幅度');
title('Input');

subplot(2, 1, 2);
plot(t(1:end-1), frequency);
xlabel('Time');
ylabel('f (Hz)');
title('instantaneous frequency');

