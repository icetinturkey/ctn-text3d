## CTN Text 3D

Modular and standalone 3D in-game text plugin for Fivem with enhanced streamable graphics.

![Image](https://download.ismailcetin.dev/ctntext3d.jpg)
[Preview](https://download.ismailcetin.dev/ctntext3d2.gif)

## Installation

1) Copy/paste all files to your server's **resources** folder.
2) Add this line to server.cfg **ensure ctn-text3d**.

## Functions

`Text3D` = Starts drawing a ingame 3d text at the coordinates you give.
- **id**: (string) It has to be a unique name.
- **coords**: (vector3) Coordinates to draw the text.
- **key**: (string) Button value to appear in the title of the text. This button also triggers the event you specified.
- **message**: (string) Text that appears when the character approaches. More than 40 characters is not recommended.
- **r**: (number)(optional) Color of the text graphic.
- **g**: (number)(optional) Color of the text graphic.
- **b**: (number)(optional) Color of the text graphic.
- **event**: (string)(optional) Name of the function you want to trigger when you press the button.
- **values**: (string)(optional) Variables you want to send to the triggered function. At least the empty object has to be sent.

`DeleteText3D` = Removes the text in the current drawing from the drawing sequence.
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

```lua
AddEventHandler('onResourceStart', function(resourceName)
 if (GetCurrentResourceName() == resourceName) then
  exports['ctn-text3d']:Text3D({
   id = "SAYHELLO001",
   coords = vector3(1004.1, 4319.8, 47.5),
   key = "F",
   message = "Say Hello",
   r = 176,
   g = 66,
   b = 233,
   event = "ctn-customs:client:sayHello",
   values = { mymessage = "Hello World" }
  })
 end
end)

RegisterNetEvent("ctn-customs:client:sayHello", function(values)
 TriggerEvent("chatMessage", '', { 0, 0x99, 255}, "" .. values.mymessage)
end)
```

## :coffee: Buy me a cup of coffee

You can star my repo or donate to me to keep this sharing community growing.
* Litecoin
  ```sh
  LMuSGiA477Pw3DFaEixMoAaL8XBWJQmaAW
  ```
