extends Node2D

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var label = $Label

const base_text = "[E] to "

var active_areas = [] #hold all actions available
var can_interact = Globals.player_canInteract #todo : check if it's ref or copy of value 

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	if(index != -1):
		active_areas.remove_at(index)
		
func _process(_delta: float) -> void:
	if(active_areas.size()>0 && can_interact):
		active_areas.sort_custom(_sort_by_distance_to_player)
		var firstActiveAreas = active_areas[0]
		label.text = base_text + firstActiveAreas.action_name #since we sorted the active areas, the first item is the one closest to player 
		label.global_position = firstActiveAreas.global_position
		label.global_position.y -= 36 
		label.global_position.x -= label.size.x / 2 
		label.show()
	else:
		label.hide()

func _sort_by_distance_to_player(area1, area2):
	if(player != null):
		var area1_to_player = player.global_position.distance_to(area1.global_position)
		var area2_to_player = player.global_position.distance_to(area2.global_position)
		return area1_to_player < area2_to_player
	
func _input(event):
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			label.hide()
		
			await active_areas[0].interact.call()		
			can_interact = true
