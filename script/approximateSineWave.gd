extends Node2D


onready var perfectSineLine:Line2D = get_node("perfectSine")
onready var approxSinWave0:Line2D = get_node("approxSineWave0")
onready var approxSineWave1:Line2D = get_node("approxSineWave1")
onready var approxSineWave2:Line2D = get_node("approxSineWave2")
onready var approxSineWave3:Line2D = get_node("approxSineWave3")
onready var approxSineWave4:Line2D = get_node("approxSineWave4")
onready var point_scene = load("res://scene/point.tscn")
var upper_limitRange = 100
var width_range = 50
var approx_point = Vector2(140,50)
var speed =300
var dir = 1

var _0thorder_startPoint = rand_range(-300,300)
var _1storder_startPoint = rand_range(-300,300)
var _2ndorder_startPoint = rand_range(-300,300)
var _3rdorder_startPoint = rand_range(-300,300)
var _4thorder_startPoint = rand_range(-300,300)
# Called when the node enters the scene tree for the first time.
func _ready():
	
#	perfectSineLine.add_point(Vector2(0,0))
#	draw_Sine()
#	draw_0thorder()
#	draw_1stOrder()
#	draw_2ndOrder()
#	draw_3rdOrder()
#	draw_4thOrder()
#	perfectSineLine.add_point(Vector2(1000,1000))
	pass # Replace with function body.

var redraw_timer = 0
var redraw_time =0.05
func drawAll(delta,reset = false):
	
	if reset:
		_0thorder_startPoint = rand_range(-300,300)
		_1storder_startPoint = rand_range(-300,300)
		_2ndorder_startPoint = rand_range(-300,300)
		_3rdorder_startPoint = rand_range(-300,300)
		_4thorder_startPoint = rand_range(-300,300)
		
	draw_Sine()
	draw_0thorder(_0thorder_startPoint)
	draw_1stOrder(_1storder_startPoint)
	draw_2ndOrder(_2ndorder_startPoint)
	draw_3rdOrder(_3rdorder_startPoint)
	draw_4thOrder(_4thorder_startPoint)

func draw_Sine():
	for i in range(0,1000,20):
		var x = i
		var y = 100*sin((PI/180)*i)
#		print(x,y)
		var offset = 150
		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		perfectSineLine.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
		
		
		
func draw_0thorder(x_offset):
	var my_approx_point = approx_point+Vector2(x_offset,0)
	for i in range(my_approx_point.x-width_range,my_approx_point.x+width_range,20):
		var x = i 
		var y = 100*sin((PI/180)*my_approx_point.x)
#		print(x,y)
		var offset = 150
#		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		approxSinWave0.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
		
		
func draw_1stOrder(x_offset):
	var my_approx_point = approx_point+Vector2(x_offset,0)
	for i in range(my_approx_point.x-width_range,my_approx_point.x+width_range,20):
		
		var x = i 
		var y = 100*sin((PI/180)*my_approx_point.x)+100*(PI/180)*cos((PI/180)*my_approx_point.x-100)*(x - my_approx_point.x)
#		print(x,y)
		var offset = 200
#		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		approxSineWave1.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
		
		
func draw_2ndOrder(x_offset):
	var my_approx_point = approx_point+Vector2(x_offset,0)
	for i in range(my_approx_point.x-width_range,my_approx_point.x+width_range,20):
		var x = i 
		var y = 100*sin((PI/180)*my_approx_point.x)+PI*0.55*cos((PI/180)*my_approx_point.x)*(x - my_approx_point.x)\
		 - 100*pow(PI/180,2)*sin((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),2)
#		print(x,y)
		var offset = 250
#		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		approxSineWave2.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
		
		
func draw_3rdOrder(x_offset):
	var my_approx_point = approx_point+Vector2(x_offset,0)
	for i in range(my_approx_point.x-width_range,my_approx_point.x+width_range,20):
		var x = i 
		var y = 100*sin((PI/180)*my_approx_point.x)+PI*0.55*cos((PI/180)*my_approx_point.x)*(x - my_approx_point.x)\
		 - 100*pow(PI/180,2)*sin((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),2)\
		- 100*pow(PI/180,3)*cos((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),3)
#		print(x,y)
		var offset = 300
#		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		approxSineWave3.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
		
func draw_4thOrder(x_offset):
	var my_approx_point = approx_point+Vector2(x_offset,0)
	for i in range(my_approx_point.x-width_range,my_approx_point.x+width_range,20):
		var x = i 
		var y = 100*sin((PI/180)*my_approx_point.x)+PI*0.55*cos((PI/180)*my_approx_point.x)*(x - my_approx_point.x)\
		 - 100*pow(PI/180,2)*sin((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),2)\
		- 100*pow(PI/180,3)*cos((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),3)\
		+100*pow(PI/180,4)*sin((PI/180)*my_approx_point.x)*pow((x - my_approx_point.x),4)
#		print(x,y)
		var offset = 350
#		var point_instance = point_scene.instance()
#		point_instance.set_position(Vector2(x,y+offset))
		approxSineWave4.add_point(Vector2(x,y+offset))
#		add_child(point_instance)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func clear():
	for each in get_children():
		if each is Line2D:
			each.clear_points()
		if each is Sprite:
			each.queue_free()
			
		
	

func _process(delta):
	redraw_timer+=delta
	approx_point.x +=speed*dir*delta
	if approx_point.x>3000:
		approx_point.x =0
		clear()
		drawAll(delta,true)
	if approx_point.x<0:
		dir = 1
	if redraw_timer> redraw_time:
		redraw_timer = 0
		clear()
		drawAll(delta)
	else:
		pass
