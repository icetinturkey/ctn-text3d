## CTN Text 3D

Modular and standalone 3D in-game text plugin for Fivem with enhanced streamable graphics.

<img src="https://download.ismailcetin.dev/ctntext3d2.gif" width="400" height="400" />

## Installation

1) Copy/paste all files to your server's **resources** folder.
2) Add this line to server.cfg **ensure ctn-text3d**.

## Basic Usage

If you are going to use your own trigger and only want to render the text, a simple usage is possible as follows.

```lua
exports['ctn-text3d']:Text3D({
	id = "rentacar",
	coords = vector3(-103.59, 6313.2, 32.49),
	key = "E",
	message = "Rent a car"
})
```

## Advanced Usage