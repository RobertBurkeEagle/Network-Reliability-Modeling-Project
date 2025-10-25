% runCustomCompoundNetworkSim
% Simulates number of transmissions needed to send K packets through
% a compound network with three links (p1, p2, p3) each having its own failure probability.
%
% K – number of packets
% p1, p2, p3 – individual link failure probabilities
% numIterations – number of Monte Carlo simulation runs
%
% Returns: avgTransmissions – average transmissions required

function avgTransmissions = runCustomCompoundNetworkSim(K, p1, p2, p3, numIterations)
    totalTransmissions = zeros(1, numIterations);

    for iter = 1:numIterations
        transmissions = 0;
        for pkt = 1:K
            success = false;
            while ~success
                transmissions = transmissions + 1;

                % Parallel section (p1, p2)
                successParallel = (rand > p1) || (rand > p2);

                % Serial section (p3)
                successSerial = rand > p3;

                % Full path success
                success = successParallel && successSerial;
            end
        end
        totalTransmissions(iter) = transmissions;
    end

    avgTransmissions = mean(totalTransmissions);
end
