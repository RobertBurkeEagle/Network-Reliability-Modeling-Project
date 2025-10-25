% compoundNetworkSim.m
% Simulates average number of transmissions to send K packets
% through the compound network shown in Figure 3.

clear; clc; close all;

% Simulation parameters
K_values = [1 5 15 50 100];
p_values = 0:0.01:0.99;
N = 1000;
colors = {'red', 'magenta', 'green', 'blue', 'cyan'};

% Store results
simulated_results = zeros(length(K_values), length(p_values));

% Run simulations
for k_i = 1:length(K_values)
    K = K_values(k_i);
    for p_i = 1:length(p_values)
        p = p_values(p_i);
        simulated_results(k_i, p_i) = runCompoundNetworkSim(K, p, N);
    end

    % Plot per K
    figure;
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['Simulated, K = ', num2str(K)]);
    title(['Average Transmissions for Compound Network (K = ', num2str(K), ')']);
    xlabel('Failure Probability (p)');
    ylabel('Average Number of Transmissions');
    legend('show');
    grid on;
    set(gca, 'YScale', 'log');
end

% Combined Plot for all K
figure;
hold on;
for k_i = 1:length(K_values)
    semilogy(p_values, simulated_results(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['Simulated, K = ', num2str(K_values(k_i))]);
end
hold off;

title('Average Transmissions for All K Values (Compound Network)');
xlabel('Failure Probability (p)');
ylabel('Average Number of Transmissions');
legend('show', 'Location', 'northwest');
grid on;
set(gca, 'YScale', 'log');
