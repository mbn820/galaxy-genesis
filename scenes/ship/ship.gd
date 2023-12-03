extends CharacterBody2D

@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var move_input_component: MoveInputComponent = $MoveInputComponent as MoveInputComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	animate_ship()
	
func animate_ship():
	if move_component.is_moving_right():
		animated_sprite_2d.play("bank_right")
	elif move_component.is_moving_left():
		animated_sprite_2d.play("bank_left")
	else:
		animated_sprite_2d.play("center")
