class_name HurtBoxComponent extends Area2D

@export var tag: String

signal hitbox_entered(hitbox: HitBoxComponent)

func _ready() -> void:
	area_entered.connect(on_hitbox_entered)
	
func on_hitbox_entered(hitbox: Area2D) -> void:
	if not hitbox is HitBoxComponent: return
	hitbox_entered.emit(hitbox)
