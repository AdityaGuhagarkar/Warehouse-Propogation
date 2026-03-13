classdef SiteFactory
    methods (Static)
        function tx = createTx(position, freq, power)
            tx = txsite("cartesian", ...
                AntennaPosition=position, ...
                TransmitterFrequency=freq, ...
                TransmitterPower=power);
        end

        function rx = createRx(position)
            rx = rxsite("cartesian", AntennaPosition=position);
        end

        function rxArray = createSweepRx(startPos, endPos, N)
            t = linspace(0,1,N);
            rxArray(1,N) = rxsite("cartesian", AntennaPosition=startPos); % preallocate

            for k = 1:N
                p = startPos + (endPos - startPos)*t(k);
                rxArray(k) = rxsite("cartesian", AntennaPosition=p);
            end
        end

        function P = createSweepPoints(startPos, endPos, N)
            t = linspace(0,1,N);
            P = zeros(3,N);
            for k = 1:N
                P(:,k) = startPos + (endPos - startPos)*t(k);
            end
        end
    end
end