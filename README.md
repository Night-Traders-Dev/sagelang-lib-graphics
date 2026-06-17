# graphics

## Purpose
Advanced 3D graphics rendering library, supporting Vulkan and OpenGL.

## Features
- **Rendering**: Vulkan and OpenGL renderers.
- **Scene**: Scene graph and camera management.
- **Resources**: Mesh, Material, Texture, and PBR support.
- **UI/Text**: Debug UI and text rendering.

## Usage Example
```sage
import graphics.renderer
import graphics.scene

let renderer = Renderer("vulkan")
let scene = Scene()
renderer.render(scene)
```
