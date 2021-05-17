extends Node

var coins : int = 0
var global_coins : int = 0
var kmh : int = 0
var players : Dictionary = {
		"police_car": {
			name = "Carro de polícia",
			path = "res://assets/objects/vehicles/police_car.tscn"
		},
		"sport": {
			name = "Carro Esporte",
			path = "res://assets/objects/vehicles/sport.tscn"
		},
		"monster": {
			name = "Carro Monstro",
			path = "res://assets/objects/vehicles/monster.tscn"
		},
		"jeep": {
			name = "Jipe",
			path = "res://assets/objects/vehicles/jeep.tscn"
		}
	}
var vehicle_selected : Dictionary = players["monster"]
