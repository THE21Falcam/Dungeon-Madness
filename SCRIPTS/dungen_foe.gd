extends Node2D

var HP = 20
var Foe_Die = false
var Foe_hit = false

var Foe_Stats = {
	
}
@onready var sprite = $AnimatedSprite2D

var hp: int = 100
var state: String = "idle"

func play_spawn():
	state = "spawn"
	sprite.play_backwards("Demon_Die")

func play_idle():
	state = "idle"
	sprite.play("Demon_Normal")

func play_attack():
	state = "attack"
	sprite.play("Demon_Hurt")

func play_die():
	state = "die"
	sprite.play("Demon_Die")

func _ready() -> void:
	play_spawn()

func _process(delta: float) -> void:
	if state == "attack" and not sprite.is_playing():
		play_idle()
	
	if state == "spawn" and not sprite.is_playing():
		play_idle()
	
	if state == "idle" and not sprite.is_playing():
		play_idle()
	
	# Check health
	if HP <= 0 and state != "die":
		Foe_Die = true
		play_die()
	
	if state == "die" and not sprite.is_playing():
		sprite.hide()
