extends Node

@onready var sfx1:AudioStreamPlayer = $SFX1
@onready var sfx2:AudioStreamPlayer = $SFX2
var rand_a = RandomNumberGenerator.new()

func play(audio:AudioStream):
	if !sfx1.playing:
		sfx1.stream = audio
		sfx1.pitch_scale = rand_a.randf_range(.9,1.3)
		sfx1.play()
	else:
		sfx2.stream = audio
		sfx2.pitch_scale = rand_a.randf_range(.9,1.3)
		sfx2.play()
