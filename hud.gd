extends CanvasLayer

var height_distance = 0
var time_remain_s = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Distance.text = "Distance: " + str(height_distance) + "m"
	$Time.text = "Time Left: " + str(time_remain_s) + "s"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
# Update the Label with the new Y position
func _on_y_position_changed(y_position):
	$Distance.text = "Distance: " + str(roundf((820 - y_position)/10)) + "m"
	
# Update time visual
func _on_timer_changed(time_left):
	$Time.text = "Time Left: " + str(roundf(time_left)) + "s"
	
