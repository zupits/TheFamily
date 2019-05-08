extends Node2D

export(PackedScene) var BasePrefab
export var defaultGenerate = 5

var baseCount = 0
var lastBasePosition = Vector2.ZERO

func _ready():
	_calculateFirstBasePosition()
	while baseCount < defaultGenerate:
		_spawnBase()
	

#-----------------------------------------Calculate the First Base Position -------------------#
func _calculateFirstBasePosition():
	var ScreenHeight = get_viewport().size.y
	lastBasePosition.x = 0
	lastBasePosition.y = ScreenHeight

#----------------------------------------Function for spawning the base ----------------------#
func _spawnBase():
	var base = BasePrefab.instance()
	add_child(base)
	#Now position this base
	var baseHeight = base.baseHeight
	var baseWidth = base.baseWidth
	base.position = lastBasePosition
	if baseCount == 0:
		base.position.y -= baseHeight/2
	if baseCount != 0:
		base.position.x += baseWidth
	lastBasePosition = base.position
	baseCount += 1
