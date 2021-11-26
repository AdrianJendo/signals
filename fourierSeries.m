clear
close all
clc

% Define domain and variables
% w0 = 2pi/t0
w0 = 2*pi;
t0 = 1;
a = 0;
N = 10;

% ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

% Helper variables
b = 1;
syms t n

% Compute fourier series
a0 = 1 / t0 * int(f(t), t, a, b);
an = 2 / t0 * int(f(t) * cos(n * w0 * t), t, a, b);
bn = 2 / t0 * int(f(t) * sin(n * w0 * t), t, a, b);
c0 = a0;
d0 = c0;
cn = sqrt(abs(an)+abs(bn));
theta = atan(-bn/an);
dn = 1 / t0 * int(f(t)*exp(-1*1i*n*w0*t), t, a, b);

% Plot fourier series
trigSeries = a0;
ci = sym('c',[1 N]); % for error
xi = sym('x',[1 N]);
for i = 1:N
    xi(i) = subs(an, i) * cos(i * w0 * t) + subs(bn, i) * sin(i * w0 * t);
    trigSeries = trigSeries + xi(i);
    ci(i) = int(f(t)*xi(i), t, a, b)/int(xi(i)^2, t, a, b);
end

expSeries = c0;
for i = -N:N
    if i ~= 0
        expSeries = expSeries + subs(dn, i) * exp(1i * i * w0 * t);
    end
end

En = int(f(t)^2, t, a, b) - a0^2;
for i = 1:N
    En = En - ci(i)^2*int(xi(i)^2, t, a, b);
end
fplot(trigSeries, [a b])
figure
fplot(expSeries, [a b])