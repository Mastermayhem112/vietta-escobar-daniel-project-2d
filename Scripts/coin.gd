extends Area2D

func on_body_entered(body: Node2D) -> void:
	var player:PlayerBody2D
	player = body as PlayerBody2D
	player.coinCount += 1
	print(player.coinCount)
	queue_free()
