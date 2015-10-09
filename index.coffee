# This touches the window object, breaking module encapsulation.
# Just make sure it's only require'd once.
require("./pepjs")

PepEvents = {
	PointerMove: "pointermove",
	PointerDown: "pointerdown",
	PointerUp: "pointerup",
	PointerOver: "pointerover",
	PointerOut: "pointerout",
	PointerEnter: "pointerenter",
	PointerLeave: "pointerleave",
	PointerCancel: "pointercancel"
}

exports.PointerEvents = PepEvents

class PepLayer extends Framer.Layer
	constructor: (options = {}) ->
		super(options)
		
		this._element.setAttribute("touch-action", "none")

		# needed to pass Framer's Utils.domValidEvent check
		this._element.onpointermove = null
		this._element.onpointerdown = null
		this._element.onpointerup = null
		this._element.onpointerover = null
		this._element.onpointerout = null
		this._element.onpointerenter = null
		this._element.onpointerleave = null
		this._element.onpointercancel = null

exports.PointerEventLayer = PepLayer