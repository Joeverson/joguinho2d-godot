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
        get_node("lion").set_flip_h(false)
        velocity.x = SPEED
		
    elif Input.is_action_pressed('ui_left'):
        get_node("lion").set_flip_h(true)   
        velocity.x = -SPEED
    else:
	    velocity.x = INITIAL_SPEED

    if is_on_floor():
	    if Input.is_action_pressed('ui_up'):
		    velocity.y = JUMP_HEIGHT

    #velocity = velocity.normalized() * speed


func _physics_process(delta):
    get_input()
    velocity = move_and_slide(velocity, UP)
	
