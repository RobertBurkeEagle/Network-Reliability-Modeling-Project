% runTwoSeriesLinkSim()
% Simulates number of transmissions required to send K packets
% across two series links, each with failure probability p.
%
% Parameters:
%   K - number of packets in the message
%   p - probability of failure per link
%   N - number of simulation runs
%
% Returns:
%   result - average number of total transmissions across all simulations

function result = runTwoSeriesLinkSim(K, p, N)
    simResults = zeros(1, N);

    for i = 1:N
        txAttemptCount = 0;
        pktSuccessCount = 0;

        while pktSuccessCount < K
            success = false;
            while ~success
                txAttemptCount = txAttemptCount + 1;
                % Both links must succeed
                link1 = rand > p;
                link2 = rand > p;

                if link1 && link2
                    success = true;
                end
            end
            pktSuccessCount = pktSuccessCount + 1;
        end

        simResults(i) = txAttemptCount;
    end

    result = mean(simResults);
end
