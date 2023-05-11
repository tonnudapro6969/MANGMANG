extends KinematicBody2D

#seaded
const SPEED = 500
const UP = Vector2(0,-1) #määrab taeva suuna
const GRAV = 50
const JUMPHIGH = -1500

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAV
	run()
	jump()
	motion = move_and_slide(motion, UP) #nullib y-koordinaadi ja määrab gravitatsiooni suuna
	
#funktsioonid
func run():
	if Input.is_action_pressed("walk right") and not Input.is_action_pressed("walk left"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("walk left") and not Input.is_action_pressed("walk right"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		
func jump():
#hüpata saab kui tegelaskuju puudub maad
	if is_on_floor() and Input.is_action_pressed("jump"):
		motion.y = JUMPHIGH
