extends Node2D

@export var health: float = 100.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hit_box_component: HitBoxComponent = $HitBoxComponent as HitBoxComponent
@onready var hurt_box_component: HurtBoxComponent = $HurtBoxComponent as HurtBoxComponent
@onready var flash_component: FlashComponent = $FlashComponent as FlashComponent
@onready var explosion_spawner_component: SpawnerComponent = $ExplosionSpawnerComponent as SpawnerComponent
@onready var hit_sound: AudioStreamPlayer = $HitSound
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hurt_box_component.hitbox_entered.connect(func(hitbox: HitBoxComponent):
		if hitbox.tag == 'projectile':
			hit_sound.play()
			flash_component.flash()
			receive_damage(hitbox.damage)
	)
	
func receive_damage(damage: float) -> void:
	health -= damage
	if (health <= 0):
		destroy()
		
func destroy() -> void:
	explosion_spawner_component.spawn()
	queue_free()
