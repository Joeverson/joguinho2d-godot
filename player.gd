extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
    velocity = Vector2(0, 500)
	
    if Input.is_action_pressed('ui_right'):
        get_node("player").set_flip_h(false)
        velocity.x += 1
		
    if Input.is_action_pressed('ui_left'):
        get_node("player").set_flip_h(true)
        velocity.x -= 1
		
    if Input.is_action_pressed('ui_down'):
        velocity.y += 1
		
    if Input.is_action_pressed('ui_up'):
        velocity.y -= 1
		
    velocity = velocity.normalized() * speed


func _physics_process(delta):
    get_input()
    move_and_slide(velocity)
	
