extends Node

var playerScore = 0
var opponentScore = 0

func _ready() -> void:
	$Scores/PlayerScore.text = str(playerScore)
	$Scores/OpponentScore.text = str(opponentScore)
	
func _process(_delta: float) -> void:
	$Scores/PlayerScore.text = str(playerScore)
	$Scores/OpponentScore.text = str(opponentScore)
