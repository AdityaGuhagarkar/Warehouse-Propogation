classdef PropagationSimulator < handle
    properties
        Config
        Scene
        PropModel
    end

    methods
        function obj = PropagationSimulator(config, scene)
            obj.Config = config;
            obj.Scene = scene;

            obj.PropModel = propagationModel( ...
                "raytracing", ...
                CoordinateSystem="cartesian", ...
                SurfaceMaterial=obj.Config.SurfaceMaterial);
        end

        function configure(obj, numReflections, numDiffractions)
            obj.PropModel.MaxNumReflections = numReflections;
            obj.PropModel.MaxNumDiffractions = numDiffractions;
        end

        function traceDemoRays(obj)
            raytrace(obj.Scene.Tx, [obj.Scene.RxDesk obj.Scene.RxShelf], obj.PropModel);
        end

        function traceSweepRays(obj)
            raytrace(obj.Scene.Tx, obj.Scene.RxSweep, obj.PropModel);
        end

        function ss = computeSweepSignalStrength(obj)
            ss = sigstrength(obj.Scene.RxSweep, obj.Scene.Tx, obj.PropModel);
            ss = reshape(ss, 1, []);
        end

        function d = computeSweepDistances(obj)
            txPos = obj.Scene.Tx.AntennaPosition;
            P = obj.Scene.SweepPoints;
            d = vecnorm(P - txPos, 2, 1);
        end
    end
end