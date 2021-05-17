extends Control


func _physics_process(delta):
	update_kmh()
	update_coins()

func update_coins():
	$CoinLabel.text = String(Global.coins)

func update_kmh():
	var previous_value = int($VelocimetroControl/VelocityLabel.text)
	if not(abs(previous_value - Global.kmh) > 30 and Global.kmh > previous_value):
		$VelocimetroControl/VelocityLabel.text = String(Global.kmh)
