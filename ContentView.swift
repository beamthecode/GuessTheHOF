//
//  ContentView.swift
//  GuessTheHOF
//
//  Created by Brent Beamer on 11/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var questionCounter = 1
    @State private var questionsLeft = 8
    @State private var showingScore = false
    @State private var showingResults = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var players = allPlayers.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var selectedPlayer = -1
    
    
    static let allPlayers = ["Alex Wojciechowicz", "Art Monk", "Bert Bell", "Bill Hewitt", "Bob Brown", "Brian Dawkins", "Chris Carter", "Chuck Bednarik", "Claude Humphrey", "Dick Vermeil", "Earle Greasy Neale", "Harold Carmichael", "James Lofton", "Jim Ringo", "Mike Ditka", "Norm Van Brocklin", "Ollie Matson", "Pete Pihos", "Reggie White", "Richard Dent", "Sonny Jurgensen", "Steve Van Buren", "Terrell Owens", "Tommy McDonald", "Walt Kiesling"]
    
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.green, .gray, .black, .green, .gray, .black, .green]), center: .center)
                .ignoresSafeArea()
               VStack {
                Spacer()
                Text("NFL HOF Eagles")
                    .font(.custom("Philosopher-Bold", size: 38).bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the NFL Hall of Fame Eagle that is")
                            .font(.custom("Philosopher-Bold", size: 20))
                            .foregroundStyle(.black.opacity(0.5))
                            
                        Text(players[correctAnswer])
                            .font(.custom("Philosopher-Bold", size: 36))
                            .foregroundStyle(.black.opacity(0.5))
                        
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            playerTapped(number)
                        } label: {
                            Image(players[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                .rotation3DEffect(.degrees(selectedPlayer == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(selectedPlayer == -1 || selectedPlayer == number ? 1 : 0.25)
                                .scaleEffect(selectedPlayer == -1 || selectedPlayer == number ? 1  : 0.70)
                                .blur(radius: selectedPlayer == -1 || selectedPlayer == number ? 0 : 3)
                                .animation(.default, value: selectedPlayer)
                                
                        }
                    }
                }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                   
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .font(.custom("Philosopher-Bold", size: 34).bold())
                    .foregroundStyle(.white)
                Spacer()
                Text("All images are the property of the NFL Hall of Fame")
                    .font(.custom("Philosopher-Bold", size: 11))
                    .foregroundStyle(.white)
                Text("Not for commercial use")
                    .font(.custom("Philosopher-Bold", size: 11))
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score) with \(questionsLeft) questions remaining!")
        }
        .alert("Game over!", isPresented: $showingResults) {
            Button("Play again", action: newGame)
        } message: {
            Text("Your final score was \(score).")
        }
    }
    
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
    
    
    
    func askQuestion() {
        players.remove(at: correctAnswer)
        players.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
        selectedPlayer = -1
    }
    
    func newGame() {
        questionCounter = 0
        questionsLeft = 8
        score = 0
        players = Self.allPlayers
        askQuestion()
        
    }
    
}
      

#Preview {
    ContentView()
}
