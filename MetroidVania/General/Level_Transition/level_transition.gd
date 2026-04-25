@tool
@icon( "res://General/Icons/level_transition.svg" )
class_name LevelTransition extends Node2D

enum SIDE { LEFT, RIGHT, UP, DOWN }


@export_range(2, 12, 1, "or_greater" ) var size : int = 2

@export var location : SIDE = SIDE.LEFT

@export_file( "*.tscn" ) var target_level : String = ""
@export var target_area_name :  String = "LevelTransition"







