% runTwoParallelLinkSim()
% Simulates the number of transmissions required to send K packets
% across two parallel unreliable links (each fails with probability p).
%
% Parameters:
%   K - number of packets in the application message
%   p - probability of failure per link
%   N - number of simulation runs
%
% Returns:
%   result - average total number of transmissions required

function result = runTwoParallelLinkSim(K, p, N)
    simResults = zeros(1, N);

    for i = 1:N
        txAttemptCount = 0;
        pktSuccessCount = 0;

        while pktSuccessCount < K
            success = false;

            while ~success
                txAttemptCount = txAttemptCount + 1;

                % Both links attempt transmission
                linkA = rand > p;
                linkB = rand > p;

                % Packet succeeds if either link succeeds
                if linkA || linkB
                    success = true;
                end
            end

            pktSuccessCount = pktSuccessCount + 1;
        end

        simResults(i) = txAttemptCount;
    end

    result = mean(simResults);
end
