% PART A:
n = 100;
m = 1000;
p = 0.5;
tracker = 0;
traces = zeros(m, n);
for i = 1:m
    trace = binornd(1, p, [1, n]);
    traces(i, :) = cumsum(trace) ./ (1:n);
end
standard_errors = 1 ./ (2 * sqrt(1:n));
mk = zeros(1, n);
ExpectedMean = p;
for k = 1:n
    mk(k) = sum(abs(traces(:, k) - ExpectedMean) <= standard_errors(k));
end
qk = mk / m;
green = [0, 0.5, 0];
figure;
plot(1:n, qk, 'Color', green, 'LineWidth', 1); 
xlabel('k');
ylabel('q_k');
title('qk = mk/m As A Function Of k');
grid on;

% PART B
pk = zeros(1, n);
for k = 1:n
    lower_bound = ceil((k / 2) - sqrt(k) / 2);
    upper_bound = floor((k / 2) + sqrt(k) / 2);
    if lower_bound < 0
        lower_bound = 0;
    end
    if upper_bound > k
        upper_bound = k;
    end
    pk(k) = binocdf(upper_bound, k, 0.5) - binocdf(lower_bound - 1, k, 0.5);
end
disp('Probabilities For p_k at k values:');
disp(pk([1, 10, 50, 100]));

% Part C
figure;
plot(1:n, pk, 'b', 'LineWidth', 1);
xlabel('k');
ylabel('p_k');
title('p_k As A Function Of k');
grid on;
