# 3D Particle Simulation

A real-time 3D physics simulation featuring gravitational attraction, electrostatic forces, magnetic fields, spring-bonded links, collisions, and more -- all rendered with a custom graphic enginer software built on Java AWT.

Originally written as a Java Applet, now runnable as a standalone desktop application.
Forked from https://github.com/jaymz07/particle-simulation-java

## Features

- **Newtonian Gravity** between all particles (inverse-square law)
- **Downward Gravity** (constant field, like Earth's surface)
- **Electrostatic (Coulomb) Forces** between charged particles
- **Magnetic Forces** -- both uniform external fields and inter-particle Biot-Savart-style forces
- **Spring Links** -- automatic bonding with configurable tension and breaking strength
- **Elastic Collisions** with proper momentum transfer
- **Air Resistance** (linear drag)
- **Two Integration Modes**: 4th-order Runge-Kutta (RK4) and Forward Euler
- **Adaptive Time Stepping** that scales the timestep to match the fastest particle, preventing blowup
- **3D Navigation** with WASD movement, mouse look, and camera follow
- **Multiple Universe Shapes**: Cube, Sphere, or Cylinder boundaries
- **Pre-built Structures**: N-pendulums, spinning tops, grids/membranes, spinning blocks
- **Electric Field Visualization**: field lines (RK4-traced), vector fields, equipotential surfaces
- **Fancy Rendering Mode**: depth-sorted filled polygons with basic lighting
- **FPS Graph** and performance stats overlay

## Requirements

- **Java Development Kit (JDK) 8** or later (needs `javac` and `java`)

## Building and Running

```bash
# Compile all source files
make

# Run the simulation
make run
```

Or manually:

```bash
javac -g *.java
java Balls3D
```

The application opens a 1120x600 window. The window is resizable.

## Controls

### Camera

| Key | Action |
|-----|--------|
| W / S | Move camera forward / backward (or zoom when following a sphere) |
| A / D | Move camera left / right |
| Page Up / Page Down | Move camera up / down |
| Arrow Keys | Rotate the view |
| Mouse Drag | Rotate the view |

### Simulation

| Key | Action |
|-----|--------|
| R | Randomly place a new sphere |
| Backspace | Remove the last added sphere |
| Space | Cycle sphere placement type (Normal / Stationary / Random-walk) |
| Q | Delete all spheres |
| Z | Zero out all velocities |
| C | Clear all paths and field lines |
| I | Toggle integration mode (RK4 / Forward Euler) |
| P | Generate an N-pendulum (length = Counter value) |
| T | Generate a spinning top (detail = Counter) |
| B | Generate a spinning block |
| U | Cycle universe shape (Cube / Sphere) |
| L | Reduce link equilibrium distances (tighten bonds) |
| O | Print simulation info to console |

### Display

| Key | Action |
|-----|--------|
| F | Toggle fancy (filled polygon) rendering |
| F1 | Toggle FPS stats overlay |
| F2 | Toggle coordinate axes |
| F3 | Toggle electric field lines (slow) |
| F4 | Toggle equipotential surfaces (slow) |
| F5 | Place charged ring structures |
| F6 | Generate grid/membrane |
| F7 | Place charge quadrupole |
| F11 | Toggle link visibility |
| F12 | Toggle sphere visibility |
| V | Toggle electric vector field |
| M | Toggle menu visibility |

### Adjustments

| Key | Action |
|-----|--------|
| 9 / 0 | Decrease / increase Counter variable |
| 1 / 2 | Decrease / increase path length |
| 3 / 4 | Decrease / increase path draw interval (detail vs. speed) |
| 7 / 8 | Adjust link color sensitivity |
| Numpad 9 / 3 | Double / halve universe size |
| Numpad 7 / 1 | Increase / decrease sphere radius |
| Numpad 6 / 4 | Increase / decrease sphere polygon detail |
| Numpad 8 / 2 | Double / halve WASD movement speed |

### Mouse

- **Click on a sphere** to select and follow it. Click empty space to deselect.
- **Drag sliders** in the on-screen menu to adjust parameters in real time.

## On-Screen Menu

Toggle with **M**. Contains sliders for:

- **Grav Const** -- gravitational constant
- **Down Grav** -- downward gravity strength
- **Init Velocity** -- initial velocity for placed spheres and pendulum tips
- **Link Tension** -- spring constant for bonds
- **Bond Dist** -- maximum distance for automatic bonding
- **Charge Const** -- Coulomb constant
- **Breaking Strength** -- link breaking threshold
- **Permeability** -- magnetic permeability constant
- **Universe Size** -- boundary radius (log scale, powers of 2)
- **Air Resistance** -- linear drag coefficient
- **Time Step** -- simulation speed (log scale)

Toggle buttons for: Collisions, Bonding, Charges, Rigid Links, Mag Field, Center of Mass, Vector Field, Field Lines, Show Axes, Draw Paths, Show FPS, Hide Spheres, Constant Step.

Action buttons for: Add Sphere, Remove Last, Delete All, Make Stationary, Clear Paths, Insert Top, Insert Grid, Spinning Block.

## Tips

- Start by pressing **R** a few times to add spheres, then watch them interact.
- Use the **Time Step** slider to speed up or slow down the simulation.
- Press **I** to switch between RK4 (more stable at larger time steps) and Forward Euler (faster per frame).
- For pendulums, set the **Counter** (keys 9/0) to desired chain length, then press **P**.
- If the simulation becomes unstable, press **Z** to zero velocities, or lower the time step.

## Project Structure

All source files are in the root directory:

| File | Description |
|------|-------------|
| `Balls3D.java` | Main application: simulation loop, rendering, input handling, JFrame launcher |
| `VSphere.java` | Physics sphere: forces, collisions, motion integration |
| `Vect3D.java` | 3D vector math |
| `Vect.java` | 2D vector math |
| `Matrix.java` | 3x3 matrix operations, rotation matrices |
| `Point3D.java` | 3D point with rotation and screen projection |
| `Point.java` | 2D point |
| `Link3D.java` | Spring link between two spheres |
| `Polygon.java` | Base 3D wireframe shape |
| `Sphere.java` | Sphere mesh geometry |
| `Cube.java` | Cube mesh geometry |
| `Prism.java` | N-gon prism geometry |
| `Pyramid.java` | N-gon pyramid geometry |
| `Arrow3D.java` | 3D arrow (prism + pyramid cap) |
| `Plane.java` | Filled quadrilateral with lighting |
| `PixelShader.java` | Depth-sorted polygon renderer |
| `Line3D.java` | 3D line segment |
| `LineArray.java` | Polyline in 3D |
| `LineP.java` | Single-segment polygon |
| `PointP.java` | Single-point polygon |
| `Label.java` | 3D text label |
| `RegularPolygon.java` | 2D regular polygon in 3D space |
| `DataSet.java` | 2D data set with stats, integration, spectrum analysis |
| `Graph.java` | Plots a DataSet |
| `NumMenu.java` / `NumBar.java` | Slider-based parameter menu |
| `ToggleBar.java` / `ToggleButton.java` | Toggle button bar |
| `SelectMenu.java` | Mutually exclusive selection menu |
| `ActionMenu.java` / `ActionButton.java` | Action button menu |


