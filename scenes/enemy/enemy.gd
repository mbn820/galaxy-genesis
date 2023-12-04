extends Node2D

@export var health: float = 6.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_box_component: HitBoxComponent = $HitBoxComponent as HitBoxComponent
@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent as HurtBoxComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var explosion_spawner_component: SpawnerComponent = $ExplosionSpawnerComponent as SpawnerComponent
@onready var hit_sound: AudioStreamPlayer = $HitSound

func _ready() -> void:
	hurt_box_component.hitbox_entered.connect(func(hitbox: HitBoxComponent):
		if hitbox.tag == 'projectile':
			hit_sound.play()
			receive_damage(hitbox.damage)
	)
	
func receive_damage(damage: float) -> void:
	health -= damage
	flash_component.flash()
	if (health <= 0):
		destroy()
		
func destroy() -> void:
	explosion_spawner_component.spawn()
	queue_free()
