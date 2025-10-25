% customCompoundNetworkSim.m
% Simulates average number of transmissions to send K packets
% through the compound network with per-link failure probabilities.

clear; clc; close all;

% Simulation parameters
K_values = [1 5 10];
p_values = 0:0.01:0.99;
figures_data = {
    struct('p1', 0.10, 'p2', 0.60, 'p3', p_values, 'var_param', 'p3'),
    struct('p1', 0.60, 'p2', 0.10, 'p3', p_values, 'var_param', 'p3'),
    struct('p1', 0.10, 'p2', p_values, 'p3', 0.60, 'var_param', 'p2'),
    struct('p1', 0.60, 'p2', p_values, 'p3', 0.10, 'var_param', 'p2'),
    struct('p1', p_values, 'p2', 0.10, 'p3', 0.60, 'var_param', 'p1'),
    struct('p1', p_values, 'p2', 0.60, 'p3', 0.10, 'var_param', 'p1')
};
N = 1000;
colors = {'red', 'magenta', 'green'};

% Store results
simulated_results = cell(length(figures_data), 1);

% Run simulations for each figure
for fig_i = 1:length(figures_data)
    data = figures_data{fig_i};
    var_param = data.var_param;
    p1 = data.p1; p2 = data.p2; p3 = data.p3;
    
    % Set p_vals based on the varying parameter
    if length(p1) > 1
        p_vals = p1(1):0.01:p1(end);
    elseif length(p2) > 1
        p_vals = p2(1):0.01:p2(end);
    elseif length(p3) > 1
        p_vals = p3(1):0.01:p3(end);
    else
        p_vals = data.(var_param);
    end
    
    % Initialize results array
    results = zeros(length(K_values), length(p_vals));
    
    % Run simulations
    for k_i = 1:length(K_values)
        K = K_values(k_i);
        for p_i = 1:length(p_vals)
            p_var = p_vals(p_i);
            [p1_val, p2_val, p3_val] = deal(p1, p2, p3); % Default to fixed values
            if var_param == 'p1', p1_val = p_var;
            elseif var_param == 'p2', p2_val = p_var;
            else, p3_val = p_var;
            end
            results(k_i, p_i) = runCustomCompoundNetworkSim(K, p1_val, p2_val, p3_val, N);
        end
    end
    
    % Store results
    simulated_results{fig_i} = results;
end

% Plotting each figure
for fig_i = 1:length(figures_data)
    figure;
    hold on;
    for k_i = 1:length(K_values)
        plot(simulated_results{fig_i}(k_i, :), 'o', ...
             'MarkerFaceColor', 'none', 'Color', colors{k_i}, ...
             'DisplayName', ['K = ', num2str(K_values(k_i))]);
    end
    hold off;
    title(['Figure ', num2str(fig_i), ' Average Transmissions']);
    xlabel('Index (representing varying probability)');
    ylabel('Average Number of Transmissions');
    legend('show');
    grid on;
    set(gca, 'YScale', 'log');
end