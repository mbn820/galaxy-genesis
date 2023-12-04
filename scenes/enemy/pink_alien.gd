extends "res://scenes/enemy/enemy.gd"

@onready var projectile_spawner: SpawnerComponent = $ProjectileSpawner as SpawnerComponent

var fire_rate_timer: Timer = Timer.new()
var fire_rate_seconds: float = 1.5

func _ready() -> void:
	super._ready()
	add_child(fire_rate_timer)
	
	fire_rate_timer.start(fire_rate_seconds)
	fire_rate_timer.timeout.connect(fire_projectile)
	
func fire_projectile() -> void:
	projectile_spawner.spawn()
