


# GuessTheHOF

![Image](https://img.shields.io/badge/SwiftUI-%20green
) ![Image](https://img.shields.io/badge/Swift-%20green
) ![Image](https://img.shields.io/badge/Guessing%20Game-%20green
) ![Image](https://img.shields.io/badge/Gameplay%20Functionality-%20green
) ![Image](https://img.shields.io/badge/Custom%20Design-%20green
) ![Image](https://img.shields.io/badge/Custom%20Font-%20green
) ![Image](https://img.shields.io/badge/Gradient-%20green
)


---

## Motivation
I wanted to build a **fun** application that could showcase my evolving [SwiftUI](https://developer.apple.com/xcode/swiftui/) design skills that would also show a good understanding of **functionality**. I decided to create a **guessing game** that would incorporate both of these aspects. In thinking about game topics, I decided to incorporate my love for the Philadelphia Eagles! 🦅 Sorry if you are a Cowboys ⭐️ fan and you happen to be reading this! *The whole concept around this project build out was to have fun. It was a good vibe.* 


---

## Project Description
![Image](https://img.shields.io/badge/Guessing%20Game%20-%20green
) ![Image](https://img.shields.io/badge/Functions%20-%20green
) ![Image](https://img.shields.io/badge/Custom%20Design%20-%20green
) ![Image](https://img.shields.io/badge/User%20Alerts%20-%20green
)  ![Image](https://img.shields.io/badge/Philadelphia%20Eagles%20-%20green
) ![Image](https://img.shields.io/badge/Images-%20green
) ![Image](https://img.shields.io/badge/Have%20Fun-%20green
)

This application is a guessing game. The premise is that the user will be presented three images of historic Philadelphia Eagles players who are in the NFL Hall of Fame. At the same time the user will be asked to guess the specific player based on their image. *If the user guesses the correct image of the three a point will be added to their score.  If the user gets the question wrong a point will be deducted from their score, but only if they have a score above zero.* There will be eight questions. Each time a player picks an answer for the question an alert will be presented to the user with a message. This message will be different depending on if they guessed correctly or incorrectly. Additionally, once the game is over the user will receive an alert with a message that includes their final score, and a button that displays the option to play again!


---

## Objectives
![Image](https://img.shields.io/badge/PrePlanning-%20green
) ![Image](https://img.shields.io/badge/Architecture-%20green
) ![Image](https://img.shields.io/badge/Gameplay%20functionality-%20green
) ![Image](https://img.shields.io/badge/Alert%20functionality-%20green
) ![Image](https://img.shields.io/badge/Design-%20green
) ![Image](https://img.shields.io/badge/Test%20Test%20Test-%20green
) ![Image](https://img.shields.io/badge/Fun!-%20green
)

* Arrange / build out the fundamental architecture
* Build the gameplay functionality
* Build the alert functionality
* Add custom font and custom design features
* Test the gameplay functionality
* Have fun!


---

## Architecture

![Image](https://img.shields.io/badge/ZStack%20-%20green
) ![Image](https://img.shields.io/badge/VStack%20-%20green
) ![Image](https://img.shields.io/badge/ForEach%20-%20green
) ![Image](https://img.shields.io/badge/Text-%20green
) ![Image](https://img.shields.io/badge/Button-%20green
) ![Image](https://img.shields.io/badge/Image-%20green
)

In thinking about how to present the layout to the user I knew that I wanted to present the following to the user:

* The name of the application
* A simple gameplay instruction of how to play the game
* The name of the player who's image should be tapped
* Three images of the different players to choose from
* The score
* A message stating that all images are NFL HOF property / not for commercial use. 

When determining which layout would be best I had to consider the design as well. This is a simple game, but I wanted it to feature the Philadelphia Eagles team colors, and the design to be aesthetically pleasing. 

I started by adding a [ZStack](https://developer.apple.com/documentation/swiftui/zstack/). Inside this ZStack I planned on adding an [Angular Gradient](https://developer.apple.com/documentation/swiftui/angulargradient/). (More on this below in the **Design Aspects** section.) Next I nested a [VStack](https://developer.apple.com/documentation/swiftui/vstack/) in the ZStack that included a [Spacer()](https://developer.apple.com/documentation/swiftui/spacer/) and a [Text()](https://developer.apple.com/documentation/swiftui/text/) field for the application title. Inside that VStack I nested another VStack. Inside that new VStack I nested yet another VStack that would include two Text fields. One for the gameplay directions, and one for the players name. Below that VStack I would add a [ForEach](https://developer.apple.com/documentation/realitykit/entity/childcollection/foreach(_:)/) that would include a [Button](https://developer.apple.com/documentation/swiftui/button/) that would display the three random player selections [Image](https://developer.apple.com/documentation/swiftui/image/). 

Beneath that VStack I added two **Spacers()** and three **Text()** fields. One for the score, and the other two for our legal notices about the images being the property of the NFL Hall of Fame. 

*I liked this architecture and I thought that it would provide a great user experience once the game functionality and design features were completed!* 

Here is the syntax layout I just described:

```
ZStack {
		AngularGradient()
	VStack {
		Spacer()
		Text()
			.modifiers()
		VStack {
			VStack {
				Text()
					.modifiers()
				Text()
					.modifiers()
		}

		ForEach() {
			Button {
			} label: {
				Image()
					.modifiers()
				}
			}
		}
			.modifiers()
		
		Spacer()
		Spacer()
		Text()
			.modifiers()
		Text()
			.modifiers()
		Text()
			.modifiers()
	}
}
```
---

## Gameplay Functionality

![Image](https://img.shields.io/badge/Variables%20-%20Bools%20-%20green
) ![Image](https://img.shields.io/badge/Functions%20-%20green
) ![Image](https://img.shields.io/badge/%40State%20-%20green
) ![Image](https://img.shields.io/badge/ForEach()%20-%20green
) ![Image](https://img.shields.io/badge/.alert()%20-%20green
) ![Image](https://img.shields.io/badge/playerTapped()%20-%20green
) ![Image](https://img.shields.io/badge/askQuestion()%20-%20green
) ![Image](https://img.shields.io/badge/newGame()%20-%20green
)

Before I started adding properties I thought about the gameplay. Here are the gameplay requirements:

* Present three images to the player asking them to guess the correct player image
* Present eight questions
* Add one point to the score with every question guessed correctly
* Substract one point from the score with every questions guessed incorrectly
* Present the current score throughout the game
* Present alerts after each guess, and at the end of the game
* End the game after all eight questions are asked and answered
* Ask the player if they want to play again when the game is over

---

### @State Properties
---
I started by adding the following [@State](https://developer.apple.com/documentation/swiftui/state/) properties: 

```
 @State private var questionCounter 
 @State private var questionsLeft 
 @State private var showingScore = false
 @State private var showingResults = false
 @state private var score = 0
```
The variables for **questionCounter**, **questionsLeft** and **score** will assist in keeping track of where we are at in gameplay sequence as well as assist in keeping track of the score.

The variables for **showingScore** and **showingResults** will be used in our alerts as well as in the functions that we build for the gameplay itself. As long as **showingScore** is set to true the game is active. Whenever **showingResults** is set to true the game is over. As I said above both of these bools factor into the three functions that I built out to support gameplay. 

Next I added a [static](https://developer.apple.com/documentation/scenekit/scnphysicsbody/1514791-static/) constant variable that is an [array](https://developer.apple.com/documentation/swift/array/) of strings representing the player names. (Important note: the string items included in the array of player names are the same as the file names of the jpg images of the players. These images are included in assets.) I called this variable **allPlayers**

`static let allPlayers = [string of player names]`

Then I added an @State property that would assist in the ForEach() loop of random player images that would be presented. 

`@State private var players = allPlayers.shuffled()`

This would shuffle the array of players so that each time our ForEach() looped through the first three players in the array it would be randomly different. 

Next, I added another @State property for the correctAnswer. This would be a random integer from 0...2. (First three)

`@State private var correctAnswer = Int.random(in: 0...2)`

This variable would be used in the gameplay functions.

Lastly, I added another @State property for the users selected player.  

`@State private var selectedPlayer`

Now I could start building out the [functions](https://developer.apple.com/documentation/foundation/nsexpression/1416200-function/) that would support our gameplay. In conjunction with this I added the detail for the **ForEach()** that would present the images to the player. 

---

### Functions / ForEach()
---

In looking at the gameplay and determining which functions we would need to build, I had to decide what tasks we needed to satisfy for a great user experience: 

* Which player image the user tapped
* Is the user guess a correct or incorrect answer?
* The questions left need to decrease with every question asked
* The score needs to increase or decrease depending on user answer
* Ask a new question to move the game along
* Ability to start a new game when the current game has ended


*These tasks could be accomplished with three functions.*

* One function would be called **playerTapped** that takes in (number: Int) that provides the basic functionality for our ForEach(). This function would handle whether the player guessed correctly, adding points to the score, removing points from the score, as well as decrementing the questions left. I would also use this function to assist with the alert that is presented to the player after each guess. 

* One function would be called **askQuestion** and would handle generating the player a new question. This function would be used to move the game along. 

* The last function would be called **newGame** and would generate a new game if the player chose to play another game after their current game had ended.

---

#### playerTapped() 

This function really is the meat of the matter. Absolutely crucial to effective gameplay, this function will be presented in the Button in our **ForEach()**.

The function itself takes in a **number**, which is an Integer. Inside of the function **selectedPlayer** is set to **number**. Then if **number** == **correctAnswer** the **scoreTitle** is changed to "Correct" (*Presented in alert - more in the Alerts section*) and one is added to the score. **Else** the player answers incorrectly we create a constant variable **theirAnswer** and set it to equal players[number]. We then set **scoreTitle** as "Wrong! That's Eagles legend \(theirAnswer)." This will be presented with an alert. Pretty cool! At that point in the function I added the **if else** statements that would handle the question count and whether the game was over. Here is the **playerTapped** function syntax: 


```
func playerTapped(_ number: Int) {
	selectedPlayer = number
	if number == correctAnswer {
		scoreTitle = "Correct"
		score += 1
	} else {
		let theirAnswer = players[number]
			scoreTitle = "Wrong! That's Eagles legend \(theirAnswer)."
		if score > 0 {
			score -= 1
		}
	}
		if questionCounter == 8 {
			showingResults = true
		} else {
			showingScore = true
		}
	if questionsLeft > 0 {
		questionsLeft -= 1
	}
}
```
Once I had the **playerTapped()**  function build out I passed it in to the **ForEach()**. Here is the syntax:

```
ForEach(0..<3) { number in
	Button {
		playerTapped(number)
	} label: {
		Image(players[number])
			.modifiers()
	}
}
```



---
#### askQuestion()

The **askQuestion()** function generates a new question to be presented to the player. After the player answers the first question an alert is presented to the player that includes the **scoreTitle** featured in the **playerTapped** function as well as a **Button** with the text "Continue". The action provided by the button is **askQuestion**. This is where the function goes into action. 

First the function removes and returns the player at **correctAnswer** from the **players** array. Then it shuffles the **players** array. Then **correctAnswer** is set to be a random integer between 0...2. (3) One is added to the **questionCounter** and **selectedPlayer** is set to -1. This then allows the player to tap on their selected player which initiates the **playerTapped()** function into action. 

This is the function that presents three random player images to the player. This function is only called while **showingScore** is true, meaning game is active. Ask a new question, and so on and so on.  As soon as **showingResults** is set to true the game is over. **askQuestion()** will no longer be called unless the player chooses to play again. Here is the syntax for **askQuestion()**

```
func askQuestion() {
	players.remove(at: correctAnswer)
	players.shuffle()
	correctAnser = Int.random(in: 0...2)
	questionCounter += 1
	selectedPlayer = -1
}
```
---
#### newGame()

Once the player has been asked and has answered eight questions, **showingResults** is set to true in our **playerTapped()** function. This effectively means the game is over. An alert will be presented to the player that states that the game is over, includes their final score, and a Button that says "Play Again". If the player taps the play again button the **newGame()** function goes into action. 

The function starts by setting the **questionCounter** to 0. It sets **questionsLeft** to 8. The score is set to 0. The **players** array is set to equal **Self.allPlayers**. Finally **askQuestion()** is called to generate the first question of the game. 

This is effectively the reset button. It returns all variables to their original state. Here is the syntax for **newGame()** 

```
func newGame() {
	questionCounter = 0
	questionsLeft = 8
	score = 0
	players = Self.allPlayers
	askQuestion()
```
---

### Alerts
I wanted to touch on [alerts](https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l) as they play an integral role in the gameplay and the functions that I build for this guessing game. 

Three **@State** variables (**showingScore, showingResults, & scoreTitle**) play a role in the alerts we will present to the player. These are all incorporated into the three functions that I built out. 

Remember in **playerTapped()** I set **scoreTitle** to either "Correct" or "Wrong! That's Eagles legend \(theirAnswer)." depending on whether the player answered correctly or not. **scoreTitle** is then presented in an [alert](https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:presenting:actions:message:)-8584l). In that same alert **showingScore** is presented meaning the game is active, The button presented has the text "Continue", and the action of **askQuestion**. There is also a text message presented that states "Your score is \(score) with \(questionsLeft) questions remaining!" This gives the player information on how far through the game they have advanced. If the player clicks continue a new question is generated. Boom!

*Correct answer alert*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/AlertCorrect.jpg?raw=true)


*Incorrect answer alert*

![image](https://github.com/beamthecode/GuessTheHOF/blob/main/AlertIncorrect.jpg?raw=true)


The second alert that is presented is when the game is over. This happens when **showingResults** is set to true. Remember this was done in the **playerTapped()** function. If **questionCounter** equals 8, **showingResults** is true. Game over. When this happens an alert is sent to the player with the text "Game over!". **showingResults** is presented meaning the game is over. A button is presented with the text "Play again" and the action of **newGame**. There is also a text message presented that states "Your final score was \(score)." This lets the player know their results and gives them the option to play again. Fantastic!

*Game over alert*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/AlertGameOver.jpg?raw=true)

---

### Design Aspects

In looking at the presentation of this application, I wanted this guessing game to feature the prominent colors of the Philadelphia Eagles. Green, Black, Gray. I also wanted to pull in a custom font.

First I pulled in my custom font from [Google Fonts](https://developer.apple.com/documentation/swiftui/angulargradient). I chose [Philosopher-Bold](https://fonts.google.com/specimen/Philosopher?query=Philosopher) for its somewhat regal appearance. All text in the application is styled with this font. Each with different .size and [.foregroundStyle](https://developer.apple.com/documentation/swiftui/text/foregroundstyle(_:))

I decided to go with an [AngularGradient](https://developer.apple.com/documentation/swiftui/angulargradient) featuring the primary colors of green, black, and gray. This would provide a fantastic background. I added this to the **ZStack** before the initial **VStack**. I loved the look.

The main design would be centered around the **ForEach()** that presented the three Eagles player images to choose from to the player. The **label** for the **Button** in the **ForEach()** includes the three player images. I planned on adding a ton of cool modifiers below this [Image](https://developer.apple.com/documentation/swiftui/image/). 

I started by applying some modifiers to the **VStack** that contained the question, **correctAnswer** and the players images. I set these modifiers.

```
.frame(maxWidth: .infinity)
.padding(.vertical, 20)
.background(.regularMaterial)
.clipShape(RoundedRectangle(cornerRadius: 20))
```

*I really liked the look of the regular material background as it allowed some of the angular gradient colors to shine through from underneath. The clip shape rounded the VStack out and I thought it looked great.*

Next, back under our **Image** in the **ForEach()** I added these modifiers to adjust our image presentation.

```
.renderingMode(.original)
.clipShape(Capsule())
.shadow(radius: 5)
```

The images would be presented in a nice little capsule shape with a slight shadow that allowed them to better stand out against the regular material background. This game them a somewhat 3-D effect. 

When the player selected the image of their choosing I wanted to add some cool effects to the images. This would liven the game up and provide a much more active gameplay experience. 

* The image the player chose would spin around 360 degrees
* The images the player did not choose would shrink, blur, and lose their color. 

I added the [.rotation3DEffect()](https://developer.apple.com/documentation/swiftui/view/rotation3deffect(_:axis:anchor:anchorz:perspective:)) modifier below the .shadow() modifier. Within this modifier I set the .degrees(), .opacity(), .scaleEffect(), .blur(), and .animation() to the desired settings. 

Here is the syntax for the .rotation3DEffect() modifier

```
.rotation3DEffect(.degrees(selectedPlayer == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
.opacity(selectedPlayer == -1 || selectedPlayer == number ? 1 : 0.25)
.scaleEffect(selectedPlayer == -1 || selectedPlayer == number ? 1  : 0.70)
.blur(radius: selectedPlayer == -1 || selectedPlayer == number ? 0 : 3)
.animation(.default, value: selectedPlayer)
```

Special shout out to [@TwoStraws](https://github.com/twostraws) for teaching me how to use this modifier. I love the effect that this modifier provides. I look forward to exploring this functionality further in future projects!

With that last touch the guessing game functionality and design layout was completed. I was ready to start testing. Here is a visual of how the application looks on iPhone 15 Pro when you open it!

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/NewGameTest.jpg?raw=true)



---

## Testing 

I opened the app and started my first game. 

*The first question presented on an iPhone 15 Pro*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/FirstQuestion.jpg?raw=true)

*I guessed incorrectly. This was a tough one!*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/FirstQuestionAnswer.jpg?raw=true)

*The second question*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/QuestionTwo.jpg?raw=true)


*I answered correctly!*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/QuestionTwoAnswer.jpg?raw=true)

*Now that I knew the gameplay was functioning how it should I progressed through the game. Here is my final score!*

![Image](https://github.com/beamthecode/GuessTheHOF/blob/main/FinalScore.jpg?raw=true)


Testing went as planned and I now had a fully functional guessing game that featured my favorite pro sports team and cool design graphics. I legit have fun playing this game! It was a joy to bring this concept to life!


## Notes

![Image](https://img.shields.io/badge/All%20images%20are%20property%20of%20the%20NFL%20Hall%20of%20Fame-%20green
) ![Image](https://img.shields.io/badge/Not%20for%20commercial%20use-%20green
) ![Image](https://img.shields.io/badge/Thank%20you!-%20green
) ![Image](https://img.shields.io/badge/Continuous%20Improvement-%20green
)

*All images are property of the NFL Hall of Fame and are not subject to commercial use.* This is explicitly stated in the application as well as in the project description. This project is merely for personal use in my portfolio. Otherwise, the functionality in the application is fair use for use in other projects!

Lastly, thank you for checking out this project repo. This was a very fun application to build and it really got my creative juices flowing in terms of gameplay functionality, design and the power of using gradients. If you have any feedback on how I can improve my code please reach out! I want to actively grow my knowledge. Thank you!

---

## Credit
![Image](https://img.shields.io/badge/Thank%20you%20%40TwoStraws-%20green
) ![Image](https://img.shields.io/badge/100%20Days%20of%20SwiftUI-%20green
) ![Image](https://img.shields.io/badge/Hacking%20with%20Swift-%20green
) ![Image](https://img.shields.io/badge/Good%20Fundamentals-%20green
) ![Image](https://img.shields.io/badge/Gratitude-%20green
)

I would like to give credit to Paul Hudson [@TwoStraws.](https://github.com/twostraws) I first learned how to create a guessing game and how to use custom design modifiers while taking the [100 Days of SwiftUI](https://www.hackingwithswift.com/100/swiftui) course. I am very grateful for the course, and for the different fundamentals that I have learned along the way. Check out [Hacking with Swift!](https://www.hackingwithswift.com)


---

## License

**2023 MIT License**


