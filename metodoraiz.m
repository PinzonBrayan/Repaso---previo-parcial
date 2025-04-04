clc; clear; close all;

% Definición de la función f(x) y su derivada
f1 = @(x) x.^3 - 6*x.^2 + 11*x - 6; % Función para el Ejercicio 1
f2 = @(x) x.^3 - 2*x - 5; % Función para el Ejercicio 2
df2 = @(x) 3*x.^2 - 2; % Derivada de f2(x) para Newton-Raphson

% Intervalo y valores iniciales
a = 1.5; b = 2.5; % Intervalo para bisección y regla falsa
x0 = 2; % Punto inicial para Newton-Raphson
x0_sec = 1; x1_sec = 2; % Puntos iniciales para la secante
max_iter = 3; % Número de iteraciones

%% Método de Bisección
fprintf('Método de Bisección:\n');
c = (a + b) / 2;
for i = 1:max_iter
    fprintf('Iteración %d: c = %.6f, f(c) = %.6f\n', i, c, f1(c));
    if f1(a) * f1(c) < 0
        b = c;
    else
        a = c;
    end
    c = (a + b) / 2;
end

%% Método de la Regla Falsa
fprintf('\nMétodo de la Regla Falsa:\n');
a = 1.5; b = 2.5;
for i = 1:max_iter
    c = (a*f1(b) - b*f1(a)) / (f1(b) - f1(a));
    fprintf('Iteración %d: c = %.6f, f(c) = %.6f\n', i, c, f1(c));
    if f1(a) * f1(c) < 0
        b = c;
    else
        a = c;
    end
end

%% Método de Newton-Raphson
fprintf('\nMétodo de Newton-Raphson:\n');
x = x0;
for i = 1:max_iter
    x = x - f2(x) / df2(x);
    fprintf('Iteración %d: x = %.6f, f(x) = %.6f\n', i, x, f2(x));
end

%% Método de la Secante
fprintf('\nMétodo de la Secante:\n');
x0 = x0_sec; x1 = x1_sec;
for i = 1:max_iter
    x2 = x1 - f2(x1)*(x1 - x0) / (f2(x1) - f2(x0));
    fprintf('Iteración %d: x = %.6f, f(x) = %.6f\n', i, x2, f2(x2));
    x0 = x1;
    x1 = x2;
end

%% Comparación de velocidad de convergencia
fprintf('\nComparación de velocidad de convergencia:\n');
fprintf('- Newton-Raphson y la Secante suelen converger más rápido.\n');
fprintf('- Bisección y Regla Falsa son más estables pero más lentos.\n');

%% Explicación sobre métodos cerrados y abiertos
fprintf('\nCuándo usar métodos cerrados vs abiertos:\n');
fprintf('- Métodos cerrados (Bisección, Regla Falsa) se usan cuando el intervalo garantiza una raíz.\n');
fprintf('- Métodos abiertos (Newton-Raphson, Secante) son más rápidos pero dependen de una buena elección de puntos iniciales.\n');
