% twoLinkNetworkSim.m
% Simulates and compares calculated vs simulated transmissions
% for a two-series-link network.

clear; clc; close all;

K_values = [1 5 15 50 100];
p_values = 0:0.1:0.9;
N = 1000;
colors = {'red', 'magenta', 'green', 'blue', 'cyan'};

calculated_results = zeros(length(K_values), length(p_values));
simulated_results = zeros(length(K_values), length(p_values));

for k_i = 1:length(K_values)
    K = K_values(k_i);
    for p_i = 1:length(p_values)
        p = p_values(p_i);

        % Calculated expected transmissions (two links in series)
        calculated_results(k_i, p_i) = K / ((1 - p)^2);

        % Simulated result
        simulated_results(k_i, p_i) = runTwoSeriesLinkSim(K, p, N);
    end

    % Plot individual K results
    figure;
    semilogy(p_values, calculated_results(k_i, :), '-', ...
             'Color', colors{k_i}, 'LineWidth', 2, 'DisplayName', 'Calculated');
    hold on;
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, 'DisplayName', 'Simulated');
    hold off;

    title(['Average Transmissions for Two-Link Network (K = ', num2str(K), ')']);
    xlabel('Failure Probability (p)');
    ylabel('Average Number of Transmissions');
    legend('show');
    grid on;
    set(gca, 'YScale', 'log');
end

% Combined figure for all K
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

title('Average Transmissions for All K Values (Two-Link Network)');
xlabel('Failure Probability (p)');
ylabel('Average Number of Transmissions');
legend('show', 'Location', 'northwest');
grid on;
set(gca, 'YScale', 'log');
