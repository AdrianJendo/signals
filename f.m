% Define hat function
% Use heaviside(t-T) for heaviside
function resp = f(t)
    resp = (heaviside(t + 2) - heaviside(t + 1)) * (t + 2) + (heaviside(t + 1) - heaviside(t - 1)) + (heaviside(t - 1) - heaviside(t - 2)) * (2 - t);
end