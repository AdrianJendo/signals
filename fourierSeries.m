clear
close all
clc

% Define domain and variables
% w0 = 2pi/t0
w0 = 2 * pi / 6;
t0 = 6;
a = -2;
N = 100;

% ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Helper variables
b = a + t0;
syms t n

% Compute fourier series
a0 = 1 / t0 * int(f(t), t, a, b);
an = 2 / t0 * int(f(t) * cos(n * w0 * t), t, a, b);
bn = 2 / t0 * int(f(t) * sin(n * w0 * t), t, a, b);

% Plot fourier series
series = a0;
for i = 1:N
    series = series + subs(an, i) * cos(i * w0 * t) + subs(bn, i) * sin(i * w0 * t);
end

fplot(series, [-2 2])