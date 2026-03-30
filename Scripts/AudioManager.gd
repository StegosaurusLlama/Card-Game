extends Node

@onready var sfx1:AudioStreamPlayer = $SFX1
@onready var sfx2:AudioStreamPlayer = $SFX2
var rand_a = RandomNumberGenerator.new()

func play(audio:AudioStream, pitch:float):
	if !sfx1.playing:
		sfx1.stream = audio
		sfx1.pitch_scale = pitch
		sfx1.play()
	else:
		sfx2.stream = audio
		sfx2.pitch_scale = pitch
		sfx2.play()
