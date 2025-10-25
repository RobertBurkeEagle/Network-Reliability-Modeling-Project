% twoParallelLinkNetworkSim.m
% Simulates the average number of transmissions required to transmit
% K packets through a two-parallel-link network.

clear; clc; close all;

K_values = [1 5 15 50 100];
p_values = 0:0.01:0.99;
N = 1000;
colors = {'red', 'magenta', 'green', 'blue', 'cyan'};

% Storage
simulated_results = zeros(length(K_values), length(p_values));

% Run simulations
for k_i = 1:length(K_values)
    K = K_values(k_i);
    for p_i = 1:length(p_values)
        p = p_values(p_i);
        simulated_results(k_i, p_i) = runTwoParallelLinkSim(K, p, N);
    end

    % Plot per K
    figure;
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['Simulated, K = ', num2str(K)]);
    title(['Average Transmissions for Two-Parallel-Link Network (K = ', num2str(K), ')']);
    xlabel('Failure Probability (p)');
    ylabel('Average Number of Transmissions');
    legend('show');
    grid on;
    set(gca, 'YScale', 'log');
end

% Combined plot for all K
figure;
hold on;
for k_i = 1:length(K_values)
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['Simulated, K = ', num2str(K_values(k_i))]);
end
hold off;

title('Average Transmissions for All K Values (Two-Parallel-Link Network)');
xlabel('Failure Probability (p)');
ylabel('Average Number of Transmissions');
legend('show', 'Location', 'northwest');
grid on;
set(gca, 'YScale', 'log');
