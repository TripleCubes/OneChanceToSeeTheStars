extends Node

var OT: Node = OptionTree

func _ready():
	var root: = Branch.new("Hi", false)
	root.ab0("Um, hi").ab1("This is a test").ab0("What?").ab1("A test").ab0("Sorry what are you talking about?") \
	.asf1("Nothing").asf1("Option 1").asf1("Option 2").asf1("Option 3")

	Branch.new("You are weird bro", true).ab1("No you are weird").ab0("...").ab1("...").ab1("Sorry")
	OT.gb("Option 1").a("You are weird bro")
	OT.gb("Option 2").a("You are weird bro")
	OT.gb("Option 3").a("You are weird bro")

	OT.gb("Nothing").ab0("Nothing?").ab1("Nothing").ab0("...")

	OT.current_branch = root
