% runSingleLinkSim()
% Simulates the number of transmissions required to send
% K packets across a single unreliable link with failure probability p.
%
% Parameters:
%   K - number of packets in the message
%   p - probability of packet transmission failure
%   N - number of simulation runs
%
% Returns:
%   result - average total number of transmissions across all simulations

function result = runSingleLinkSim(K, p, N)
    simResults = zeros(1, N); % store result of each simulation

    for i = 1:N
        txAttemptCount = 0;    % total number of transmissions
        pktSuccessCount = 0;   % number of successfully sent packets

        while pktSuccessCount < K
            success = false;

            % Keep sending the packet until it succeeds
            while ~success
                txAttemptCount = txAttemptCount + 1;
                if rand > p
                    success = true; % successful transmission
                end
            end

            pktSuccessCount = pktSuccessCount + 1;
        end

        simResults(i) = txAttemptCount; % record result of this simulation
    end

    result = mean(simResults); % average number of transmissions
end
