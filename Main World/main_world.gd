extends Node2D

@onready var Enemy = $"Dungen Foe"
@onready var For_HP_Bar = $"Extra UI/Dungen GUI/Foe HP Bar"
@onready var Attack_Button = $"Extra UI/Dungen GUI/GridContainer/Attack"

func _process(delta: float) -> void:
	For_HP_Bar.value = Enemy.HP
	Attack_Button.disabled = Enemy.Foe_Die
	
func _on_attack_pressed() -> void:
	if Enemy.state != "die":
		Enemy.play_attack()
	Enemy.HP -= 1
	
	
	
