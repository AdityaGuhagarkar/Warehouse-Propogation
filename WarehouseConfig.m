classdef WarehouseConfig
    properties
        SceneFile string = "office.stl"
        ShowOrigin logical = false

        % Explicit RF settings
        TransmitterFrequency double = 915e6   % Hz
        TransmitterPower double = 30          % dBm

        % Known-good office.stl coordinates from MathWorks example
        TxPosition double = [2; 1.3; 2.5]
        RxDeskPosition double = [3.6; 7.5; 1.0]
        RxShelfPosition double = [0.4; 3.3; 1.0]

        SurfaceMaterial string = "wood"
        MaxNumReflections double = 1
        MaxNumDiffractions double = 1

        SweepNumPoints double = 25
    end
end