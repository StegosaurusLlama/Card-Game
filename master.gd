extends Node

var deck:Deck
var hand:Hand

func _ready():
	if !deck:
		deck = Deck.new([1,2,3,6,5])
	if !hand:
		hand = Hand.new()
		
