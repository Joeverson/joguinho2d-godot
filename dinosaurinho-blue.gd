extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const INITIAL_SPEED = 0
const JUMP_HEIGHT = -800
var velocity = Vector2()

func _ready():
    $sprites/AnimationPlayer.play("stoped")
    # Called when the node is added to the scene for the first time.
    # Initialization here
    pass
    


func _physics_process(delta):
    velocity = move_and_slide(velocity, UP)

func _on_AnimationPlayer_animation_finished(anim_name):
    pass # replace with function body
