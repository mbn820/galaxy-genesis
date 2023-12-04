extends Node2D

@export var health: float = 50.0

@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent as HurtBoxComponent

func _ready() -> void:
	hurt_box_component.hitbox_entered.connect(func(hitbox: HitBoxComponent):
		if hitbox.tag == 'projectile':
			receive_damage(hitbox.damage)
	)
	
func receive_damage(damage: float) -> void:
	health -= damage
	if (health <= 0):
		queue_free()
