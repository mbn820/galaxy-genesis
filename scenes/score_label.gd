extends Label

var score: int = 0
var timer: Timer = Timer.new()

func _ready() -> void:
	GlobalEvents.on_enemy_killed.connect(update_score)
	
func update_score(points: int) -> void:
	score += points
	text = 'Score: ' + str(score)
