% singleLinkNetworkSim.m
% Simulates the average number of transmissions required to transmit
% K packets through a single-link network for different values of K and p.
%
% Each simulation runs for 1000 iterations and is compared against
% the calculated expected number of transmissions.

clear; clc; close all;

% Simulation parameters
K_values = [1 5 15 50 100];
p_values = 0:0.01:0.99;
N = 1000;
colors = {'red', 'magenta', 'green', 'blue', 'cyan'};

% Storage for results
calculated_results = zeros(length(K_values), length(p_values));
simulated_results  = zeros(length(K_values), length(p_values));

% Loop over K and p
for k_i = 1:length(K_values)
    K = K_values(k_i);

    for p_i = 1:length(p_values)
        p = p_values(p_i);

        % Theoretical expected transmissions (single link)
        calculated_results(k_i, p_i) = K / (1 - p);

        % Simulated result using Appendix A function
        simulated_results(k_i, p_i) = runSingleLinkSim(K, p, N);
    end

    % Plot per K
    figure;
    semilogy(p_values, calculated_results(k_i, :), '-', ...
             'Color', colors{k_i}, 'LineWidth', 2, 'DisplayName', 'Calculated');
    hold on;
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, 'DisplayName', 'Simulated');
    hold off;

    title(['Average Transmissions for Single-Link Network (K = ', num2str(K), ')']);
    xlabel('Failure Probability (p)');
    ylabel('Average Number of Transmissions');
    legend('show');
    grid on;
    set(gca, 'YScale', 'log');
end

% Combined plot for all K values
figure;
hold on;
for k_i = 1:length(K_values)
    semilogy(p_values, calculated_results(k_i, :), '-', ...
             'Color', colors{k_i}, 'LineWidth', 2, ...
             'DisplayName', ['Calculated, K = ', num2str(K_values(k_i))]);
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['Simulated, K = ', num2str(K_values(k_i))]);
end
hold off;

title('Average Transmissions for All K Values (Single-Link Network)');
xlabel('Failure Probability (p)');
ylabel('Average Number of Transmissions');
legend('show', 'Location', 'northwest');
grid on;
set(gca, 'YScale', 'log');
