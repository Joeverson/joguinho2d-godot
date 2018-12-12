extends KinematicBody2D

export (int) var speed = 500

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const INITIAL_SPEED = 0
const JUMP_HEIGHT = -400

var velocity = Vector2()

func get_input():
    #Gravity
    velocity.y += GRAVITY
	
    if Input.is_action_pressed('ui_right'):        
        $lion.flip_h(false)
        $lion/AnimationPlayer.play('walking')
        velocity.x = SPEED
		
    elif Input.is_action_pressed('ui_left'):
        $lion.flip_h(true)   
        $lion/AnimationPlayer.play('walking')
        velocity.x = -SPEED
    else:
	    velocity.x = INITIAL_SPEED
        $lion/AnimationPlayer.play('stop')

    if is_on_floor():
	    if Input.is_action_pressed('ui_up'):
		    velocity.y = JUMP_HEIGHT
            $lion/AnimationPlayer.play('jump')
    else:
        $lion/AnimationPlayer.play('down')

    #velocity = velocity.normalized() * speed


func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity, UP)
	
