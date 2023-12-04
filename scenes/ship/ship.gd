extends Node2D

@export var ship_stats: ShipStats

@onready var move_component: MoveComponent = $MoveComponent as MoveComponent
@onready var move_input_component: MoveInputComponent = $MoveInputComponent as MoveInputComponent
@onready var ship_sprite: AnimatedSprite2D = $ShipSprite
@onready var after_burner_sprite: AnimatedSprite2D = $AfterBurnerSprite
@onready var left_cannon: SpawnerComponent = $LeftCannon as SpawnerComponent
@onready var right_cannon: SpawnerComponent = $RightCannon as SpawnerComponent
@onready var fire_rate_timer: Timer = $FireRateTimer
@onready var scale_component: ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent as HurtBoxComponent

func _ready() -> void:
	move_component.speed = ship_stats.speed
	
	fire_rate_timer.wait_time = ship_stats.fire_rate_seconds
	fire_rate_timer.timeout.connect(fire_cannons)
	hurt_box_component.hitbox_entered.connect(func(hitbox: HitBoxComponent):
		if hitbox.tag == 'enemy':
			receive_damage(hitbox.damage)
	)

func _physics_process(delta: float) -> void:
	animate_ship()
	
func animate_ship():
	if move_component.is_moving_right():
		ship_sprite.play("bank_right")
		after_burner_sprite.play("bank_right")
	elif move_component.is_moving_left():
		after_burner_sprite.play("bank_left")
		ship_sprite.play("bank_left")
	else:
		ship_sprite.play("center")
		after_burner_sprite.play("center")
		
func fire_cannons() -> void:
	scale_component.tween_scale(self)
	
	left_cannon.spawn()
	right_cannon.spawn()
	
func receive_damage(damage: float):
	# TODO: damage calc
	flash_component.flash()
