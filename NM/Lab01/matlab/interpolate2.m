function [Lx, Fx, delta] = interpolate2(X, Y, xx)
% Основная функция интерполяции
% Передаем два вектора узловых точек (X и Y) и интересующую точку xx

coef = polyfit(X, Y, size(X, 1)-1); % Вычисляем коэффициенты интерполяционного полинома
Lx = polyval(coef, xx); % Вычисляем значение в точке xx по найденному полиному
Fx = f(xx); % Вычисляем значение функции в точке xx
delta = abs(Lx - Fx); % Вычисляем ошибку

% Дальше будем строить графики:
xlabel('x'); ylabel('y'); hold on; grid on; % Подписываем оси, включаем сетку

plot (X, Y, 'ro'); % Печатаем узловые точки

XX = X(1):0.01:X(size(X, 1)); % Формируем точки для графика многочлена Лагранжа
LX = polyval(coef, XX); % И соответствующие им Y-ки
plot(XX, LX, 'b--'); % Печатаем график полинома (интерполирующей функции)

plot(xx, Lx, 'go'); % Печатаем точку полинома
plot(xx, Fx, 'rx'); % Печатаем точку функции

% И подписываем оси и легенду:
title('Полиномиальная интерполяция', 'FontName', 'Courier');
h1 = legend('Узловые точки', 'Интерполяция', 'Точка полинома', 'Точка функции');
set(h1, 'FontName', 'Courier');

end