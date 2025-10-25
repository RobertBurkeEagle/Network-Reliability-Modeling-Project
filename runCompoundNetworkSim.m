% runCompoundNetworkSim()
% Simulates the number of transmissions required to send K packets
% across a compound network consisting of:
% Path A: two links in series
% Path B: one link in parallel with Path A
%
% Each link has probability p of failure.
%
% Parameters:
%   K - number of packets
%   p - probability of failure per link
%   N - number of simulations
%
% Returns:
%   result - average total number of transmissions required
function result = runCompoundNetworkSim(K, p, N)
    simResults = zeros(1, N);

    for i = 1:N
        txAttemptCount = 0;
        pktSuccessCount = 0;

        while pktSuccessCount < K
            success = false;

            % Keep trying until this packet successfully transmits
            while ~success
                txAttemptCount = txAttemptCount + 1;

                % Path A: two series links
                linkA1 = rand > p;
                linkA2 = rand > p;
                pathA_success = linkA1 && linkA2;

                % Path B: single link
                linkB = rand > p;

                % --- Parallel success: either path works
                if pathA_success || linkB
                    success = true;
                end
            end

            pktSuccessCount = pktSuccessCount + 1;
        end

        simResults(i) = txAttemptCount;
    end

    result = mean(simResults);
end
