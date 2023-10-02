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

	Branch.new("I am thinking of one", true).ab1("Maybe I will just wish for a good month") \
	.ab1("Thinking of a wish is hard").ab0("Mhm").ab0("Last time I see a shooting star I wished for luck") \
	.ab0("The next day my coworker give me a discount coupon").ab0("So I guess the wish came true") \
	.ab1("Then I hope my wish will also come true").ab0("I want to wish for something more specific this time tho") \
	.asf1("How about wish for money?").asf1("How about just wish for more shooting stars?") \
	.asf1("Can we wish for this shooting star to be a really beautiful one?")
	OT.gb("You plan to make a wish?").a("I am thinking of one")

	Branch.new("Nah that is a lame wish", true).ab1("How is money lame?").ab0("Money is not lame, the wish is") \
	.ab1("Yeah... I guess so").ab0("I mean if I want money I would wish for having a job that I like that also make good money") \
	.ab1("Do you have any job in mind?").ab0("I have been trying art lately") \
	.ab1("Cool, I also have a friend who is doing art").ab0("Mhm").ab0("Im kinda suck at it tho") \
	.ab1("Well yeah you gonna keep trying until you are good at it").ab0("I mean, it is just I have these cool ideas I want to draw,")
	OT.gb("How about wish for money?").a("Nah that is a lame wish")

	Branch.new("That is a nice one", true).ab0("Large meteor shower like this are rare tho, so I doub the wish would come true") \
	.ab1("Who know?").ab1("And also we still have the small ones").ab0("Nah I will wish for a big one") \
	.ab1("Do you like shooting stars?").ab0("I do").ab0("I like the night sky and the stars") \
	.ab0("I dont know much about them but I like to watch them") \
	.asf1("I wonder if on one of those star there are people also looking at our planet") \
	.asf1("Do you know the light from the stars are from years away, so we are actually looking into the past?")
	OT.gb("How about just wish for more shooting stars?").a("That is a nice one")

	Branch.new("Well those are stars, they are like our sun, there wont be life on them", true) \
	.ab0("I do wonder if there are alien life tho") \
	.ab1("I mean the universe is so big, there must be another planet with life, right?") \
	.ab0("Yeah").ab0("Maybe they are waiting for shooting stars like us")
	OT.gb("I wonder if on one of those star there are people also looking at our planet").a("Well those are stars, they are like our sun, there wont be life on them")

	Branch.new("Yeah I heard those so many times", true).ab1("I mean that means if we go far enough we can look into our past") \
	.ab0("We will need to go faster than light for that tho,").ab0("And even if we managed to do that everything will be tiny") \
	.ab1("You think we managed to go faster than light but not getting a good picture from the telescope?") \
	.ab0("I mean you dont know what is hard and what is not") \
	.ab1("You sound like an engineer")
	OT.gb("Do you know the light from the stars are from years away, so we are actually looking into the past?") \
	.a("Yeah I heard those so many times")

	Branch.new("We will need to make the wish before the shooting stars start", true) \
	.ab1("I mean who say we cant right?").ab0("Yeah").ab0("Guess that is my wish then").ab0("...") \
	.ab1("The sky is really nice today").ab1("Only here do we get green color like this").ab0("Yup") \
	.ab0("I really like the afternoon orange too").ab0("Do you have a favorite color?") \
	.asf1("Maybe green?").asf1("Maybe light blue").asf1("I like pastel colors")
	OT.gb("Can we wish for this shooting star to be a really beautiful one?").a("We will need to make the wish before the shooting stars start")

	Branch.new("Come on you just pick today's color", true).ab1("I mean today's green is nice") \
	.ab0("Yeah but,").ab0("Let say you can choose a color for all book covers in the world,").ab0("What would you choose?") \
	.asf1("Um... I guess light green").asf1("Wow dont give me such big responsibility like that")
	OT.gb("Maybe green?").a("Come on you just pick today's color")

	Branch.new("... Alright...", true).ab1("Do you like books?").ab0("No. Too many letter make me dizzy") \
	.ab1("Wow how?").ab0("I dont like books").ab1("Then what do you like?").ab0("Um...").ab0("I collect a lot of plushies") \
	.ab1("Oh which one?")
	OT.gb("Um... I guess light green").a("... Alright...")



	Branch.new("Cool. I like pastel pink", true).ab1("A pastel color enjoyer I see").ab0("Mhm, those colors are so pleasing")
	OT.gb("Maybe light blue").a("Cool. I like pastel pink")

	Branch.new("Oh, me too. Those colors are so pleasing", true).ab1("Yeah. Whenever I draw something I always use pastel colors") \
	.ab0("Me toooooo!").ab0("You also do art?").ab1("No. That would be my friend. She is waaaay better in coloring than me") \
	.ab0("Oh. I have been trying to get into art").ab0("It is kinda hard tho")
	OT.gb("I like pastel colors").a("Oh, me too. Those colors are so pleasing")
	OT.gb("Mhm, those colors are so pleasing").a("Yeah. Whenever I draw something I always use pastel colors")



	Branch.new("Only small ones", true).ab1("Same").ab0("Those are nice tho").ab0("The stars are also beautiful") \
	.asf1("They feel unreal right?").asf1("Sometime the color of the cloud is nice too")
	OT.gb("Have you seen meteor shower before?").a("Only small ones")

	Branch.new("They do", true).ab0("So I am looking forward to this meteor shower").ab0("...") \
	.ab1("The sky is really nice today").ab1("Only here do we get green color like this").ab0("Yup") \
	.ab0("I really like the afternoon's orange too")
	OT.gb("They feel unreal right?").a("They do")

	OT.gb("I really like the afternoon's orange too").a("Do you have a favorite color?")

	Branch.new("Yeah the blue clouds are really pretty", true) \
	.ab0("I have seen some straight cloud shapes").ab0("I once seen a sheep shaped cloud") \
	.ab0("Like, it look like a sheep, with horns and stuff").asf1("Sheeps are so cute") \
	.asf1("Cloud and sheep are both fluffy")
	OT.gb("Sometime the color of the cloud is nice too").a("Yeah the blue clouds are really pretty")

	Branch.new("I know right?", true).ab0("Im a huge sheep fan").ab0("I have lots of sheep plushies at home") \
	.ab1("What do you like about them?").ab0("They just look really cute") \
	.ab0("You know Bouncy Sheeps? The way they draw the sheeps are sooooo adorable").ab1("Bouncy Sheeps the arcade game?") \
	.ab0("Yeah that one").ab1("Yeah the sheeps there are really cute").ab1("Do you go to the arcade alot?") \
	.ab0("I usually grab plushies there").ab1("Do you?")
	OT.gb("Sheeps are so cute").a("I know right?")

	Branch.new("Mhm, fluffy stuff are so cute", true).ab0("I have a lot of plushies") \
	.ab0("I always get the fluffies one") \
	.ab1("What type of plush do you have?").ab0("I have pony plush, cat plush, a lot of sheep plushs") \
	.asf1("You like ponies?").asf1("You like cats?").asf1("You like sheeps?")
	OT.gb("Cloud and sheep are both fluffy").a("Mhm, fluffy stuff are so cute")
	OT.gb("Oh which one?").a("I have pony plush, cat plush, a lot of sheep plushs")

	Branch.new("I get the pony plush from an arcade", true).ab0("The plush is soooo cute I need to get it") \
	.ab0("Took me more than 50 tries for it").ab1("Im pretty good at those games") \
	.ab0("And you dont have any plushies?").ab1("I get them for my friend") \
	.ab1("Maybe I can help you get one sometime").ab0("Mhm").ab0("Do you go to arcade much?") \
	.asf1("I do sometime").asf1("My friend like to go there, I just go with her")
	OT.gb("You like ponies?").a("I get the pony plush from an arcade")
	OT.gb("Do you?").a("I do sometime").a("My friend like to go there, I just go with her")

	Branch.new("What game are you usually play?", true).ab1("I dont play much, just there to grab plushies") \
	.ab1("I usually buy pet food at the store nearby too").ab0("Oh which pet?").ab1("I have a female cat") \
	.ab0("Awww").ab0("How is she like?").ab1("She is a playful one. She has destroyed my keyboard a couple of time") \
	.ab0("Haha that is cats for you").asf1("Unlike those cat on the internet she doesnt become a destroyer at night tho") \
	.asf1("She wake me up in the morning")
	OT.gb("I do sometime").a("What game are you usually play?")

	Branch.new("Is she a close friend?", true).ab1("She is").ab1("She also like plushs") \
	.ab1("Everytime she see one she like she will wait for me at work to pull me to the arcade") \
	.ab0("What work do you do?").ab1("Im a game dev").ab0("And she is").ab1("An artist") \
	.ab0("Then you two are fit for each other huh").ab1("I guess so").ab0("Are you two in a romantic relationship?") \
	.asf1("Um... no").asf1("It is one side from me, I think")
	OT.gb("My friend like to go there, I just go with her").a("Is she a close friend?")

	# ->
	Branch.new("Oh... So, she doesnt work with you?", true).ab1("No. She is indie. She do live stream and stuff") \
	.ab0("I would like to get into art too").ab1("Why dont you?").ab0("It seem hard to me") \
	.ab1("I mean everything seem hard at first").ab0("Yeah.") \
	.ab0("It is just, I have these cool ideas I want to draw,") \
	.ab0("And when I tried to draw them, they doesnt look as good").ab0("That just make me lost motivation") \
	.ab1("Well that happen to everyone of us").ab0("Yeah. I guess I just need to keep trying") \
	.asf1("What do you usually draw?").asf1("Are you using pen and paper or a drawing tablet?")
	OT.gb("Um... no").a("Oh... So, she doesnt work with you?")
	OT.gb("I mean, it is just I have these cool ideas I want to draw,").a("And when I tried to draw them, they doesnt look as good")
	OT.gb("It is kinda hard tho").a("I mean everything seem hard at first")

	Branch.new("You think?", true).ab0("What if she also like you?").ab1("Nah, it seem unlikely") \
	.ab0("And then she think the same thing as you,").ab0("And then we lost a good couple candidate") \
	.asf1("Idk, how am I supposed to know what she feel about me?").asf1("What if she is not?")
	OT.gb("It is one side from me, I think").a("You think?")

	Branch.new("I mean from what you tell about her, she seem to", true).ab0("Cant you just ask her out? You guys are close friends right?") \
	.ab1("Have you ever ask someone out? It is really hard").ab0("...").ab0("I guess...")
	OT.gb("Idk, how am I supposed to know what she feel about me?").a("I mean from what you tell about her, she seem to")

	Branch.new("What if she is?", true).ab0("If you are just going to think negatively like that where would you go?") \
	.ab0("....")
	OT.gb("What if she is not?").a("What if she is?")



	Branch.new("Who doesnt like cat?", true).ab1("Cat are so cute right?").ab1("I have a female cat at home")
	OT.gb("You like cats?").a("Who doesnt like cat?")
	
	OT.gb("I have a female cat at home").a("Awww")

	Branch.new("Mhm. Sheep are sooooo cute", true).ab0("Im a huuuuge sheep fan")
	OT.gb("You like sheeps?").a("Mhm. Sheep are sooooo cute")

	OT.gb("Im a huuuuge sheep fan").a("You know Bouncy Sheeps? The way they draw the sheeps are sooooo adorable")



	# ->
	Branch.new(".....", false).ab1("Oh, a bird").ab0("Oh").ab0("A cute little fella") \
	.ab0("Make me remember, I got attacked by birds once. They are crows tho") \
	.ab1("That must feel horrible").ab0("Nah. I just run into a nearby building") \
	.ab0("Birds can be both scary and cute").ab1("You think crows are cute?").ab0("They are sometime") \
	.ab0("I like when they are just sitting around")
	OT.gb("Wow dont give me such big responsibility like that").a(".....")
	OT.gb("Maybe they are waiting for shooting stars like us").a(".....")
	OT.gb("You sound like an engineer").a(".....")
	OT.gb("I guess...").a(".....")
	OT.gb("....").a(".....")





	# ->
	Branch.new("Does your cat sleep with you on the bed?", true).ab1("Sometimes").ab1("Some night she just going around") \
	.ab1("Maybe she is ghost busting").ab0("Do you think ghost is real?").ab1("Idk, I hope not") \
	.ab0("I like to think ghosts are cute like in those arcade games") \
	.asf1("Why cant everything be cute").asf1("Can something be both scary and cute?")
	OT.gb("Unlike those cat on the internet she doesnt become a destroyer at night tho").a("Does your cat sleep with you on the bed?")

	#
	Branch.new("Birds can", true).ab0("I got attacked by crows before").ab0("But they do be cute sometime")
	OT.gb("Can something be both scary and cute?").a("Birds can")

	OT.gb("But they do be cute sometime").a("You think crows are cute?")



	# ->
	Branch.new("That is better than the annoying alarm", false).ab0("What do you usually have for breakfast?") \
	.asf1("I just have some coffee").asf1("Anything I have in the fridge")
	OT.gb("She wake me up in the morning").a("That is better than the annoying alarm")

	OT.current_branch = GV.root_dialogue
	OT.previous_branch = GV.root_dialogue
