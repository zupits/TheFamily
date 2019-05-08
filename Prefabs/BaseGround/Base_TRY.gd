extends StaticBody2D

var baseHeight = 0
var baseWidth = 0

func _ready():
	baseHeight = $Sprite.texture.get_height()
	baseWidth = $Sprite.texture.get_width()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
