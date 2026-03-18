extends Node

var deck:Deck
var hand:Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !deck:
		deck = Deck.new(["Smite","Un-Smite","Jab","Smack","Run Away", ""]);
	if !hand:
		hand = Hand.new();
