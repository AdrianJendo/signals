% Define hat function
% Use heaviside(t-T) for heaviside
function resp = f(t)
    resp = (heaviside(t) - heaviside(t - 1)) * (t);
%     resp = piecewise((t<0) & (t>=-1), -t.^2-t+0.25, (t<1) & (t>=0), t.^2-t+0.25, t>=1 | t<-1, 0);
%d    resp = (heaviside(t+pi)-heaviside(t+pi-1))*-(t+pi)+(heaviside(t+1)-heaviside(t))*-t+(heaviside(t-pi+1)-heaviside(t-pi))*(t-pi)+(heaviside(t)-heaviside(t-1))*t;
%e    resp = (heaviside(t+2)-heaviside(t+1))*-(t+2)+(heaviside(t+1)-heaviside(t-1))*t+(heaviside(t-1)-heaviside(t-2))*-(t-2);
%f    resp = (heaviside(t+pi)-heaviside(t+pi-1))*(-t-pi)+(heaviside(t)-heaviside(t-1))*t;
%     resp = 3+sqrt(3)*cos(2*t)+sin(2*t)+sin(3*t)-1/2*cos(5*t+pi/3);
end