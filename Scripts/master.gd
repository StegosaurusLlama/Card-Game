extends Node

var deck:Deck
var hand:Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !deck:
		deck = Deck.new([1,2,3,4,5]);
	if !hand:
		hand = Hand.new();
