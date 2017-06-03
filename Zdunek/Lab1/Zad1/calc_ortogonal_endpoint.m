function out = calc_ortogonal_endpoint(common_point, point2)

xes = [common_point(1), point2(1)];
yes = [common_point(2), point2(2)];

coeffs = polyfit(xes, yes, 1);
a1 = coeffs (1);
% b1 = coeffs (2);
a2 = -1/a1;
b2 = common_point(2) - a2*common_point(1);
x_out = -point2(1);
y_out = a2*x_out + b2;
out = [x_out, y_out];
