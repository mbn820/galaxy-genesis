extends Node2D

@onready var green_alien_spawner: SpawnerComponent = $GreenAlienSpawner as SpawnerComponent
@onready var yellow_alien_spawner: SpawnerComponent = $YellowAlienSpawner as SpawnerComponent
@onready var pink_alien_spawner: SpawnerComponent = $PinkAlienSpawner as SpawnerComponent
@onready var spawners: Array = [green_alien_spawner, yellow_alien_spawner, pink_alien_spawner]

@onready var spawn_point: Marker2D = $SpawnPoint
@onready var spawn_point_2: Marker2D = $SpawnPoint2
@onready var spawn_point_3: Marker2D = $SpawnPoint3
@onready var spawn_point_4: Marker2D = $SpawnPoint4
@onready var spawn_point_5: Marker2D = $SpawnPoint5
@onready var spawn_points: Array = [spawn_point, spawn_point_2, spawn_point_3, spawn_point_4, spawn_point_5]

var timer: Timer = Timer.new()
var spawn_rate_seconds: float = 2.0

func _ready() -> void:
	add_child(timer)
	timer.start(spawn_rate_seconds)
	timer.timeout.connect(generate_random_enemy)

func generate_random_enemy() -> void:
	var random_spawn_location: Marker2D = spawn_points.pick_random() as Marker2D
	var random_spawner: SpawnerComponent = spawners.pick_random() as SpawnerComponent
	
	random_spawner.spawn(random_spawn_location.global_position)
