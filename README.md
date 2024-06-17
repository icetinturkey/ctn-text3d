## CTN Text 3D

Modular and standalone 3D in-game text plugin for Fivem with enhanced streamable graphics.

# ![Image](https://media.discordapp.net/attachments/974971714876375084/1252189810169352213/ctntext3d.jpg?ex=66715023&is=666ffea3&hm=63f9103b1607d5e5f398ff5114f8971dda1709ddd4f89d680dc6162cb16cd943&)
[Preview](https://media.discordapp.net/attachments/974971714876375084/1252168644058939392/ctntext3d2.gif?ex=66713c6c&is=666feaec&hm=10ad9b5ece6de671bfc5f25088134a84185181794b25bef3c6c6d3e4ecc56a1f&){:target="_blank" rel="noopener"}

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