extends Control


func _physics_process(delta):
	update_kmh()
	update_coins()
	update_life()

func update_coins():
	$CoinLabel.text = String(Global.coins)

func update_life():
	$LifeLabel.text = String(Global.global_hp)

func update_kmh():
	var previous_value = int($VelocimetroControl/VelocityLabel.text)
	if not(abs(previous_value - Global.kmh) > 30 and Global.kmh > previous_value):
		$VelocimetroControl/VelocityLabel.text = String(Global.kmh)
