% part A
x_axis = linspace(0, 1, 100);
y_axis = linspace(0, 1, 100);


figure;
plot(x_axis, x_axis, 'g', 'LineWidth', 2);
hold on;
fill([0, x_axis, 1], [0, x_axis, 0], 'b', 'LineStyle', 'none', 'FaceAlpha', 0.3);
hold off;


title('Part A: {(x, y) ∈ R2 : fXY (x, y) > 0}');
xlabel('x');
ylabel('y');
axis square; 
grid on;

% Part D
[x_axis, y_axis] = meshgrid(0:0.01:1, 0:0.01:1);

F_XY = 2 .* x_axis.^2 .* y_axis.^2;
F_XY(y_axis > x_axis) = 0; 


figure;
surf(x_axis, y_axis, F_XY);
shading interp; 


xlabel('x');
ylabel('y');
zlabel('F_{XY}(x, y)');
title('Part D: Joint CDF F_{XY}(x, y) = 2x^2y^2 for 0 <= y <= x <= 1');
colorbar; 
view(-30, 30);


