% Calculates the power uncertainty based on the formula P = VIcos(f). 
% Parameters:
%   V, I, f: voltage, current and frequency of the circuit.
%   V_s, I_s, f_s: uncertainties for the measurements of V, I and f
%   respectively.
% The quantities V and f are considered to be correlated with correlation coefficient correlation_V_f.
% For correlation_V_f = 0, V and f are uncorrelated.
function s_P = calculate_power_uncertainty(V, I, f, V_s, I_s, f_s, correlation_V_f)
    covariance_V_f = correlation_V_f*V_s*f_s;
    s_P = sqrt((V*cos(f)*I_s)^2 + (I*cos(f)*V_s)^2 + (V*I*sin(f)*f_s)^2) + 2 * I*cos(f) * V*I*sin(f) * covariance_V_f;
end