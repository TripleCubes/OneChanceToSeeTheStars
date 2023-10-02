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

	Branch.new("I am thinking of one", true).ab0("Do you?").ab1("Maybe I will just wish for a good month") \
	.ab1("Thinking of a wish is hard").ab0("Mhm").ab0("Last time I see a shooting star I wished for luck") \
	.ab0("The next day my coworker give me a discount coupon").ab0("So I guess the wish came true") \
	.ab1("Then I hope my wish will also come true").ab0("I want to wish for something more specific this time tho") \
	.asf1("How about wish for money?").asf1("How about just wish for more shooting stars?") \
	.asf1("Can we wish for this shooting star to be a really beautiful one?")
	OT.gb("You plan to make a wish?").a("I am thinking of one")

	#
	Branch.new("Nah that is a lame wish", true)
	OT.gb("How about wish for money?").a("Nah that is a lame wish")

	#
	Branch.new("That is a nice one", true)
	OT.gb("How about just wish for more shooting stars?").a("That is a nice one")

	#
	Branch.new("We will need to make the wish before the shooting stars start", true) \
	.ab1("I mean who say we cant right?").ab0("Yeah").ab0("Guess that is my wish then")
	OT.gb("Can we wish for this shooting star to be a really beautiful one?").a("We will need to make the wish before the shooting star start")



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
	OT.gb("Sometime the color of the cloud is nice too").a("Yeah the blue clouds are really pretty")

	#
	Branch.new("I know right?", true)
	OT.gb("Sheeps are so cute").a("I know right?")

	Branch.new("Mhm, fluffy stuff are so cute", true).ab0("I have a lot of plushies") \
	.ab0("I always get the fluffies one") \
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

	Branch.new("Is she a close friend?", true).ab1("She is").ab1("She also like plushs") \
	.ab1("Everytime she see one she like she will wait for me at work to pull me to the arcade") \
	.ab0("What work do you do?").ab1("Im a game dev").ab0("And she is").ab1("An artist") \
	.ab0("Then you two are fit for each other huh").ab1("I guess so").ab0("Are you two, in romantic relationship?") \
	.asf1("Um... no").asf1("It is one side from me, I think")
	OT.gb("My friend like to go there, I just go with her").a("Is she a close friend?")

	# ->
	Branch.new("Oh... So, she doesnt work with you?", true).ab1("No. She is indie. She do live stream and stuff") \
	.ab0("I would like to get into art too").ab1("Why dont you?").ab0("It seem hard to me") \
	.ab1("I mean everything seem hard at first").ab0("Yeah.") \
	.ab0("It is just, I have these cool ideas I want to draw,") \
	.ab0("And when I tried to draw them, they doesnt look as good").ab0("That just make me lost motivation") \
	.ab1("Well that happen to everyone of us").ab0("Yeah. I guess I just need to keep trying")
	OT.gb("Um... no").a("Oh... So, she doesnt work with you?")

	#
	Branch.new("You think?", true)
	OT.gb("It is one side from me, I think").a("You think?")



	##
	Branch.new("Who doesnt like cat?", true)
	OT.gb("You like cats?").a("Who doesnt like cat?")

	#
	Branch.new("Mhm. Sheep are sooooo cute", true)
	OT.gb("You like sheeps?").a("Mhm. Sheep are sooooo cute")

	OT.current_branch = GV.root_dialogue
	OT.previous_branch = GV.root_dialogue
