% Part (a) - Plotting the PMFs
alpha = 10;
n_values = [10, 100, 1000];
figure; % Create a new figure window for part (a)
for i = 1:length(n_values)
    n = n_values(i);
    x = 0:30; % A range of x values to compute the PMF over.
    binom_pmf = binopdf(x, n, alpha/n);
    poisson_pmf = poisspdf(x, alpha);
    
    subplot(1, length(n_values), i);
    plot(x, binom_pmf, 'o-', 'LineWidth', 2);
    hold on;
    plot(x, poisson_pmf, 'x-', 'LineWidth', 2);
    hold off;
    xlabel('x');
    ylabel('PMF');
    title(['n = ', num2str(n)]);
    legend('Binomial PMF', 'Poisson PMF');
end

% Part (b) - Generating Poisson samples without using poissrnd or poissinv
lambda = 5;
n_samples = [100, 1000, 10000];
figure;
for i = 1:length(n_samples)
    n = n_samples(i);
    u = rand(n, 1); % Generate n uniform random numbers
    y = zeros(n, 1); % Initialize array for Poisson samples

    for j = 1:n
        sum_pmf = exp(-lambda); % Initialize sum of PMF
        cumulative_pmf = sum_pmf; % Initialize cumulative PMF
        k = 0;
        % Continue summing until the cumulative PMF exceeds the random number
        while u(j) > cumulative_pmf
            k = k + 1;
            sum_pmf = sum_pmf * lambda / k;
            cumulative_pmf = cumulative_pmf + sum_pmf;
        end
        y(j) = k;
    end

    % Relative frequency
    edges = -0.5:1:(max(y)+0.5); % Define edges for bins
    counts = histcounts(y, edges); % Bin the data
    relative_freq = counts / n;
    centers = edges(1:end-1) + 0.5; % Calculate the center of the bins
    
    % Theoretical PMF
    poisson_pmf = poisspdf(centers, lambda);
    
    subplot(1, length(n_samples), i);
    bar(centers, relative_freq, 'r');
    hold on;
    plot(centers, poisson_pmf, 'bx-', 'LineWidth', 2, 'MarkerSize', 10);
    hold off;
    xlabel('x');
    ylabel('Frequency/PMF');
    title(['n = ', num2str(n)]);
    legend('Relative frequency', 'Theoretical PMF');
end