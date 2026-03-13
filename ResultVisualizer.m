classdef ResultVisualizer
    methods (Static)
        function plotSignalStrength(distance, signalStrength, plotTitle)
            figure;
            plot(distance, signalStrength, 'o-', 'LineWidth', 2, 'MarkerSize', 5);
            grid on;
            xlabel('Distance from TX (m)');
            ylabel('Signal strength (dBm)');
            title(plotTitle);
        end

        function plotAblation(distance, ss0, ss1, ss2)
            figure;
            plot(distance, ss0, 'o-', 'LineWidth', 2); hold on;
            plot(distance, ss1, 's-', 'LineWidth', 2);
            plot(distance, ss2, 'd-', 'LineWidth', 2);
            grid on;
            xlabel('Distance from TX (m)');
            ylabel('Signal strength (dBm)');
            legend('LOS only', '1 reflection', '1 refl + 1 diffr', 'Location', 'best');
            title('Ablation: multipath complexity vs received power');
        end
    end
end