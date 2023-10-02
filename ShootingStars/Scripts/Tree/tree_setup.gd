extends Node

var OT: Node = OptionTree

func _ready():
	GV.root_dialogue = Branch.new("Hi", false)
	GV.root_dialogue.ab0("...").ab0("Hi").ab1("You waiting for the meteor shower?").ab0("You too?") \
	.ab1("Guess we both come too early").ab1("...").ab1("There are not much place to go around here") \
	.ab0("There are that store").ab1("I have been in there for 30 minutes").ab1("Didnt buy anything tho") \
	.ab0("They have good cake").ab1("Oh").ab1("I will try some later then").ab1("...").ab0("Nice weather today") \
	.ab1("It is").ab1("Gonna be nice like this for the whole week").ab0("Mhm") \
	.ab0("It is nice to just chill here in days like this").ab1("Yeah") \
	.ab1("I got here from work, decided to stay here since it seem pleasant") \
	.ab0("Im looking forward to the shooting stars").ab1("Yeah it seem to be a big meteor shower") \
	.ab1("You might only see these kind of stuff once in life").ab0("Mhm").asf1("You plan to make a wish?") \
	.asf1("Have you seen meteor shower before?")

	#
	Branch.new("I am thinking of one", true).ab0("Do you?").ab1("It is a secret").ab0("Mhm")
	OT.gb("You plan to make a wish?").a("I am thinking of one")

	Branch.new("Only small ones", true).ab1("Same").ab0("Those are nice tho").ab0("The stars are also beautiful") \
	.asf1("They feel unreal right?").asf1("Sometime the color of the cloud is nice too")
	OT.gb("Have you seen meteor shower before?").a("Only small ones")

	#
	Branch.new("They do", true)
	OT.gb("They feel unreal right?").a("They do")

	Branch.new("Yeah the blue clouds are really pretty", true) \
	.ab0("I have seen some straight cloud shapes").ab0("I once seen a sheep shaped cloud") \
	.ab0("Like, it look like a sheep, with horns and stuff").asf1("Sheeps are so cute") \
	.asf1("Cloud and sheep are both fluffy")
	OT.gb("Sometime the color of the cloud is nice too").a("Yeah the blue clouds are really nice")

	#
	Branch.new("I know right?", true)
	OT.gb("Sheeps are so cute").a("I know right?")

	Branch.new("Mhm, fluffy stuff are so cute", true).ab0("I have a lot of plushies") \
	.ab0("I always get the fluffies one").ab1("I dont have plushies but my pillow is really soft").ab0("Me too") \
	.ab1("What type of plush do you have?").ab0("I have pony plush, cat plush, a lot of sheep plushs") \
	.asf1("You like ponies?").asf1("You like cats?").asf1("You like sheeps?")
	OT.gb("Cloud and sheep are both fluffy").a("Mhm, fluffy stuff are so cute")

	Branch.new("I get the pony plush from an arcade", true).ab0("The plush is soooo cute I need to get it") \
	.ab0("Took me more than 50 tries for it").ab1("Im pretty good at those games") \
	.ab0("And you dont have any plushies?").ab1("I get them for my friend") \
	.ab1("Maybe I can help you get one sometime").ab0("Mhm").ab0("Do you go to arcade much?") \
	.asf1("I do sometime").asf1("My friend like to go there, I just go with her")
	OT.gb("You like ponies?").a("I get the pony plush from an arcade")

	#
	Branch.new("What game are you usually play?", true)
	OT.gb("I do sometime").a("What game are you usually play?")

	#
	Branch.new("Is she a close friend?", true).ab1("She is")
	OT.gb("My friend like to go there, I just go with her").a("Is she a close friend?")

	##
	Branch.new("Who doesnt like cat?", true)
	OT.gb("You like cats?").a("Who doesnt like cat?")

	#
	Branch.new("Mhm. Sheep are sooooo cute", true)
	OT.gb("You like sheeps?").a("Mhm. Sheep are sooooo cute")

	OT.current_branch = GV.root_dialogue
	OT.previous_branch = GV.root_dialogue
