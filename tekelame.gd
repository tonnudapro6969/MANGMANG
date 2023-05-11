extends KinematicBody2D

var motion = Vector2()
const SPEED = 500
const ACCEL = 50
const UP = Vector2(0,-1)
const GRAV = 100
const JUMPHIGH = -1500


func _physics_process(_delta):
	motion.y += GRAV





func run():
	if Input.is_action_pressed("walk right") and not Input.is_action_pressed("walk left"):
		motion.x += ACCEL
		motion.x = min(SPEED, motion.x)
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("walk left") and not Input.is_action_pressed("walk right"):
		motion.x -= ACCEL
		motion.x = max(-SPEED, motion.x)
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
		
func jump():
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			motion.y = JUMPHIGH
	else:
		$AnimatedSprite.play("jump")
















