clear variables; close all;

%% (a)
fprintf('->Question A\n')
width_s = 5;
length_s = 5;

length = 500;
width = 300;

s_area = sqrt(length^2*width_s^2 + width^2*length_s^2);
fprintf('Uncertainty of Area measurement: %f\n', s_area)

% Για αβεβαιότητα μήκους = αβεβαιότητα πλάτους = 5 m, η αβεβαιότητα
% μέτρησης είναι ίδια για μήκη l και πλάτη w που έχουν ίση την ποσότητα
% sqrt(w^2 + l^2), αφού s_area = 5*sqrt(w^2 + l^2)

%% (b)

s_w = 5;
s_l = 5;
l_ = 0:50:1000;
w_ = 0:50:1000;
[l, w] = meshgrid(l_, w_);
s = sqrt(l.^2.*s_w.^2 + w.^2.*s_l^2);
surf(l, w, s)
xlabel('length')
ylabel('width')
zlabel('Area Uncertainty')
title('Area Uncertainty')
