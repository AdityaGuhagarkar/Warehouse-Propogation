clear; clc; close all;

config = WarehouseConfig();
scene = WarehouseScene(config);
scene.initialize();
scene.showSites();
scene.showLos();

sim = PropagationSimulator(config, scene);

% LOS only
scene.clear();
sim.configure(0, 0);
sim.traceDemoRays();
disp("Showing LOS-only rays. Press any key to continue...");
pause;

% 1 reflection
scene.clear();
sim.configure(1, 0);
sim.traceDemoRays();
disp("Showing 1-reflection rays. Press any key to continue...");
pause;

% 1 reflection + 1 diffraction
scene.clear();
sim.configure(1, 1);
sim.traceDemoRays();
disp("Showing 1-reflection + 1-diffraction rays. Press any key to continue...");
pause;

% Sweep rays
scene.clear();
sim.configure(1, 1);
sim.traceSweepRays();

% Plot sweep signal strength
ss = sim.computeSweepSignalStrength();
d  = sim.computeSweepDistances();

disp("Signal strength values:");
disp(ss);

disp("Distance values:");
disp(d);

ResultVisualizer.plotSignalStrength(d, ss, ...
    'Signal strength along receiver sweep');

% Ablation
sim.configure(0, 0);
ss0 = sim.computeSweepSignalStrength();

sim.configure(1, 0);
ss1 = sim.computeSweepSignalStrength();

sim.configure(1, 1);
ss2 = sim.computeSweepSignalStrength();

ResultVisualizer.plotAblation(d, ss0, ss1, ss2);