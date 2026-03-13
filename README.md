# Indoor RF Propagation Simulation (MATLAB)

A modular MATLAB framework for simulating **indoor RF propagation** using **3D ray tracing**.  
The simulator models **line-of-sight (LOS), reflections, and diffraction** inside a 3D scene and analyzes how multipath complexity affects received signal strength.

This project demonstrates how indoor geometry impacts wireless communication systems such as **RAIN RFID deployments in warehouses or offices**.

---

## Key Features

- 3D indoor propagation using **STL scene geometry**
- MATLAB **ray tracing propagation model**
- **Receiver sweep experiment** to observe spatial fading
- **Multipath ablation study** (LOS vs reflections vs diffraction)
- **Object-oriented MATLAB design** for modular simulations

---

## Example Results

### Indoor Scene
![Office Scene](Figures/office.png)

### Ray Tracing Paths
![Ray Tracing](Figures/1r1d.png)

### Receiver Sweep
![Receiver Sweep](Figures/multiple_antenna_1r1d.png)

### Signal Strength Along Sweep
![Signal Strength](Figures/signal_strength.png)

### Multipath Ablation
![Ablation](Figures/ablation.png)

**Observations**

- LOS-only propagation produces smooth signal variation  
- Reflections introduce **destructive interference and deep fades**  
- Diffraction introduces additional propagation paths  

---

## Repository Structure

**main.m**  
Entry point that runs the complete simulation pipeline.

**WarehouseConfig.m**  
Stores configuration parameters (scene, transmitter, receivers, propagation settings).

**SiteFactory.m**  
Creates transmitter and receiver site objects.

**WarehouseScene.m**  
Loads the STL scene and visualizes transmitter/receiver placement.

**PropagationSimulator.m**  
Runs ray tracing propagation and computes received signal strength.

**ResultVisualizer.m**  
Generates signal strength and ablation plots.

---

## Simulation Pipeline
3D Scene (STL)
↓
Site Placement
↓
Ray Tracing Model
↓
Propagation Paths
↓
Signal Strength Analysis
↓
Visualization


---

## Mathematical Model

The received signal is modeled as a sum of multipath components:

h = Σ_{l=1..L} α_l · exp(-j2π f_c τ_l)

where

- α_l : path attenuation  
- τ_l : path delay  
- f_c : carrier frequency  

The received power is proportional to:

P_r ∝ |h|²

Multipath interference therefore produces:

- **constructive interference → signal peaks**
- **destructive interference → deep fades**

---

## Requirements

MATLAB with:

- Communications Toolbox
- Antenna / RF propagation functionality

---

## Running the Simulation

Run the main script:

```matlab
main
