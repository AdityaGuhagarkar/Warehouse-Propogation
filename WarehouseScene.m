classdef WarehouseScene < handle
    properties
        Config
        Viewer
        Tx
        RxDesk
        RxShelf
        RxSweep
        SweepPoints
    end

    methods
        function obj = WarehouseScene(config)
            obj.Config = config;
        end

        function initialize(obj)
            if ~isfile(obj.Config.SceneFile)
                error("Scene STL file not found: %s", obj.Config.SceneFile);
            end

            obj.Viewer = siteviewer( ...
                SceneModel=obj.Config.SceneFile, ...
                ShowOrigin=obj.Config.ShowOrigin);

            obj.Tx = SiteFactory.createTx( ...
                obj.Config.TxPosition, ...
                obj.Config.TransmitterFrequency, ...
                obj.Config.TransmitterPower);

            obj.RxDesk  = SiteFactory.createRx(obj.Config.RxDeskPosition);
            obj.RxShelf = SiteFactory.createRx(obj.Config.RxShelfPosition);

            obj.RxSweep = SiteFactory.createSweepRx( ...
                obj.Config.RxShelfPosition, ...
                obj.Config.RxDeskPosition, ...
                obj.Config.SweepNumPoints);

            obj.SweepPoints = SiteFactory.createSweepPoints( ...
                obj.Config.RxShelfPosition, ...
                obj.Config.RxDeskPosition, ...
                obj.Config.SweepNumPoints);
        end

        function showSites(obj)
            show(obj.Tx);
            show(obj.RxDesk);
            show(obj.RxShelf);
            show(obj.RxSweep);
        end

        function showLos(obj)
            los(obj.Tx, [obj.RxDesk obj.RxShelf]);
        end

        function clear(obj)
            clearMap(obj.Viewer);
        end
    end
end