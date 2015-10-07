A simple adapter to jquery's [PEP](https://github.com/jquery/PEP) for [FramerJS](http://framerjs.com/). A **P**ointer**E**vent **P**olyfill makes it possible to use the W3C's PointerEvent specification today. PointerEvents let you handle mouse, touch, and pen input through a single set of event handlers.

# Example Usage

This has only been tested in [framer-cli](https://github.com/peteschaffner/framer-cli), but should work in Framer Studio, following [this example](http://framerjs.com/docs/#modules-npm-example).

1. Run `npm install framer-pep` in your prototype's directory
2. Reference framer-pep by adding `pep = require("framer-pep")` to your app.coffee
3. The `pep` variable has two properties, `pep.PointerEvents` and `pep.PointerEventLayer`

Here's how I like to use it:

```coffeescript
pep = require("framer-pep")

# Replace the standard Framer objects with PEP objects
window.Events = _.extend(Events, pep.PointerEvents)
window.Layer = pep.PointerEventLayer

TestLayer = new Layer
TestLayer.center()

TestLayer.on Events.PointerDown, (e) ->
    # Will print on mouse, touch, and pen
    print "Hello from pointerdown!"
```

# Known Issues

Dragging and ScrollComponents don't work because they're hard-coded to use touch events. You can get dragging to work (hackily) like so:

```coffeescript
window.Events.TouchStart = Events.PointerDown
window.Events.TouchMove = Events.PointerMove
window.Events.TouchEnd = Events.PointerUp
```