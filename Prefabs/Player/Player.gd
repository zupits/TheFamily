extends KinematicBody2D

# Declare member variables here. Examples:
const UP_VECTOR = Vector2(0,-1)
const GRAVITY = 1000
const JUMP = 500


var playerState = "IDLE"
var playerMotion = Vector2.ZERO
var motionSpeed = 200

var jumpNo = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Player_IDLE")
	
func _input(event):
	if Input.is_action_just_pressed("feed"):
		print("Player wants to feed")
	
func _physics_process(delta):
	_fall(delta)
	_walkPlayer()
	_jump()
	move_and_slide(playerMotion, UP_VECTOR)
	
	#reset the jump
	if is_on_floor():
		jumpNo = 0
	
func _walkPlayer():
	if Input.is_action_pressed("ui_right"):
		playerMotion.x = motionSpeed
		$Body.flip_h = false
		$AnimationPlayer.play("Player_Walk")
		
	elif Input.is_action_pressed("ui_left"):
		playerMotion.x = -motionSpeed
		$Body.flip_h = true
		$AnimationPlayer.play("Player_Walk")
		
	else:
		playerMotion.x = 0
		$AnimationPlayer.play("Player_IDLE")
func _fall(delta):
	if is_on_floor() or is_on_ceiling():
		playerMotion.y = 0
	else:
		playerMotion.y += GRAVITY * delta
func _jump():
	if Input.is_action_just_pressed("ui_up"):
		if jumpNo < 2:
			playerMotion.y -= JUMP
			jumpNo += 1