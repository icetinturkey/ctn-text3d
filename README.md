## CTN Text 3D

Modular and standalone 3D in-game text plugin for Fivem with enhanced streamable graphics.

![Image](https://media.discordapp.net/attachments/974971714876375084/1252189810169352213/ctntext3d.jpg?ex=66715023&is=666ffea3&hm=63f9103b1607d5e5f398ff5114f8971dda1709ddd4f89d680dc6162cb16cd943&)
[Preview](https://media.discordapp.net/attachments/974971714876375084/1252168644058939392/ctntext3d2.gif?ex=66713c6c&is=666feaec&hm=10ad9b5ece6de671bfc5f25088134a84185181794b25bef3c6c6d3e4ecc56a1f&)

## Installation

1) Copy/paste all files to your server's **resources** folder.
2) Add this line to server.cfg **ensure ctn-text3d**.

## Functions

Text3D = Starts drawing a ingame 3d text at the coordinates you give.
- **id**: (string) It has to be a unique name.
- **coords**: (vector3) Coordinates to draw the text.
- **key**: (string) Button value to appear in the title of the text. This button also triggers the event you specified.
- **message**: (string) Text that appears when the character approaches. More than 40 characters is not recommended.
- **r**: (number)(optional) Color of the text graphic.
- **g**: (number)(optional) Color of the text graphic.
- **b**: (number)(optional) Color of the text graphic.
- **event**: (string)(optional) Name of the function you want to trigger when you press the button.
- **values**: (string)(optional) Variables you want to send to the triggered function. At least the empty object has to be sent.

DeleteText3D = Removes the text in the current drawing from the drawing sequence.
- **id**: (string) It has to be a unique name.

## Basic Usage

If you are going to use your own trigger and only want to render the text, a simple usage is possible as follows.

```lua
exports['ctn-text3d']:Text3D({
	id = "RENTACAR001",
	coords = vector3(-103.59, 6313.2, 32.49),
	key = "E",
	message = "Rent a car"
})
```

## Advanced Usage