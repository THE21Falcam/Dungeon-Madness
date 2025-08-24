extends Node2D

var HP = 20
var Foe_Die = false
var Foe_hit = false
@onready var sprite = $AnimatedSprite2D
var hp: int = 100
var state: String = "idle"
	
func play_idle():
	state = "idle"
	sprite.play("Demon_Normal")

func play_attack():
	state = "attack"
	sprite.play("Demon_Hurt")

func play_die():
	state = "die"
	sprite.play("Demon_Die")
	

func _process(delta: float) -> void:
	# Check health
	if HP <= 0 and state != "die":
		Foe_Die = true
		play_die()

	if state == "attack" and not sprite.is_playing():
		play_idle()

	if state == "die" and not sprite.is_playing():
		
		sprite.hide()
