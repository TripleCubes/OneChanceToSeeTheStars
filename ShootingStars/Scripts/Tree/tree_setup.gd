extends Node

var OT: Node = OptionTree

func _ready():
	GV.root_dialogue = Branch.new("Hi", false)
	GV.root_dialogue.ab0("Um, hi").ab1("This is a test").ab0("What?").ab1("A test").ab0("Sorry what are you talking about?") \
	.asf1("Nothing").asf1("Option 1").asf1("Option 2222222222222222222222222222").asf1("Option 33333333333333333333333333333")

	Branch.new("You are weird bro", true).ab1("No you are weird").ab0("...").ab1("...").ab1("Sorry").ab1("...")
	OT.gb("Option 1").a("You are weird bro")
	OT.gb("Option 2222222222222222222222222222").a("You are weird bro")
	OT.gb("Option 33333333333333333333333333333").a("You are weird bro")

	OT.gb("Nothing").ab0("Nothing?").ab1("Nothing").ab0("...").ab0("...").ac(func(): GF.st(0)).ab0("...").ac(func(): GF.st(1)).ab0("...").ab0("...").ab0("...") \
	.ac(func(): GF.st(1)).ab0("0").ac(func(): GF.st(2)).ab0("...").ab0("0").ac(func(): GV.shooting_stars.started = true)

	OT.current_branch = GV.root_dialogue
	OT.previous_branch = GV.root_dialogue
