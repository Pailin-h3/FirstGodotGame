extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const WALK_SPEED = 200
const GRAVITY = 2000
const JUMP_FORCE = 600

var velocity = Vector2()
var key = 0


# Called when the node enters the scene tree for the first time.
func _ready():
#	print("Hello world from player!!")
	pass

func _process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
#	 This is for jumping
	if Input.is_action_pressed("key_x") and is_on_floor():
		$Sprite.play("jump")
		velocity.y = -JUMP_FORCE
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y = WALK_SPEED
#	else:
#		velocity.y = 0
	
	# This is for movement
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		if $Sprite.flip_h == false:
#			print("should anim turn left")
			$Sprite.play("turn")
			$Sprite.flip_h = true
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
		if $Sprite.flip_h == true:
#			print("should anim turn right")
			$Sprite.play("turn")
			$Sprite.flip_h = false
		$Sprite.play("run")
	else:
		velocity.x = 0
		$Sprite.play("idle")
		
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	
