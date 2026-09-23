//
//  MemoryTestPractice.swift
//  test
//
//  Created by Jiun Sull on 6/12/24.
//

import SwiftUI

struct MemoryTestPractice: View {
    var name: String
    var math: String
    var math2: String
    var reaction: String
    var reaction2: String
    var number: String
    var number2: String
    var mathPP: String
    var reactionPP: String
    var numberPP: String
    @State private var memorizing = true
    @State private var originalWords: [String] = []
    @State private var currentWord: String = ""
    @State private var score = 0
    @State private var wordsGuessed = 0
    @State private var showResult = false
    @State private var timeRemaining = 30
    @State private var shouldNavigate = false
    
    let totalWordsToGuess = 10
    let wordPool = Array(words.shuffled().prefix(40))
    
    var body: some View {
        VStack {
            if memorizing {
                Text("Memorize these words:")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                ForEach(0..<20) { rowIndex in
                    HStack {
                        ForEach(0..<2) { colIndex in
                            Text(self.wordPool[rowIndex + colIndex * 20])
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30.0)
                            
                        }
                    }
                }
                
                Text("Time remaining: \(timeRemaining) seconds")
                    .padding()
                
            } else if showResult {
                Text("Test Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("Your Score: \(score) out of \(totalWordsToGuess)")
                Button(action: {
                    shouldNavigate = true
                }) {
                    Text("Start Real Test")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .fullScreenCover(isPresented: $shouldNavigate, content: {
                    MemoryTestView(name: name, math: math, math2: math2, reaction: reaction, reaction2: reaction2, number: number, number2: number2, mathPP: mathPP, reactionPP: reactionPP, numberPP: numberPP)
                })
            } else {
                Text("Was this word in the original list?")
                    .font(.title)
                    .padding()
                Text(currentWord)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                HStack {
                    Button("Yes") {
                        checkAnswer(isInOriginalList: true)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button("No") {
                        checkAnswer(isInOriginalList: false)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear(perform: startGame)
    }
    
    func startGame() {
        originalWords = wordPool
        startMemorizing()
    }
    
    func startMemorizing() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                timer.invalidate()
                self.memorizing = false
                self.startGuessing()
            }
        }
    }
    
    func startGuessing() {
        wordsGuessed = 0
        score = 0
        presentNextWord()
    }
    
    func presentNextWord() {
        if wordsGuessed < totalWordsToGuess {
            wordsGuessed += 1
            if Bool.random() {
                currentWord = originalWords.randomElement()!
            } else {
                var newWord: String
                repeat {
                    newWord = words.randomElement()!
                } while originalWords.contains(newWord)
                currentWord = newWord
            }
        } else {
            showResult = true
        }
    }
    
    func checkAnswer(isInOriginalList: Bool) {
        if (originalWords.contains(currentWord) && isInOriginalList) ||
            (!originalWords.contains(currentWord) && !isInOriginalList) {
            score += 1
        }
        presentNextWord()
    }
}


let words = [
    "apple", "apricot", "avocado", "antelope", "anchor", "archery", "arrow", "algae",
    "album", "almanac", "alarm", "aluminum", "angel", "animal", "ant", "apology",
    "appetite", "apricot", "attic", "august",
    "banana", "bandage", "bargain", "basket", "battery", "beacon", "beaver", "bicycle",
    "blizzard", "blossom", "boulder", "bounty", "bravery", "briefcase", "bubble",
    "buffalo", "building", "butterfly", "button", "buzzer",
    "cabbage", "cabin", "cable", "calculator", "calendar", "camel", "camera", "candle",
    "canyon", "caravan", "carousel", "castle", "caterpillar", "cauldron", "celebration",
    "cemetery", "century", "cereal", "chameleon", "champion",
    "daisy", "damage", "dance", "danger", "darkness", "daydream", "december", "defense",
    "delivery", "density", "desert", "design", "dessert", "diamond", "dictionary",
    "dinosaur", "direction", "discovery", "disease", "distance",
    "eagle", "earthquake", "echo", "eclipse", "education", "effect", "eggplant", "electricity",
    "elevator", "elephant", "embassy", "emotion", "engine", "envelope", "epidemic",
    "episode", "equator", "equipment", "escalator", "estuary",
    "factory", "falcon", "family", "fantasy", "farmhouse", "feather", "festival", "fiction",
    "field", "fingerprint", "fireplace", "fireworks", "fishery", "flamingo", "flashlight",
    "flood", "flower", "flute", "forest", "fortune",
    "galaxy", "garden", "garlic", "gateway", "gazelle", "geography", "geyser", "glacier",
    "gladiator", "globe", "goldfish", "gorilla", "government", "grain", "grapevine",
    "gravity", "greenhouse", "grenade", "grizzly", "guitar",
    "hamburger", "harmony", "harvest", "hatchet", "headline", "helicopter", "hemisphere",
    "honeycomb", "horizon", "hospital", "hummingbird", "hurricane", "hyacinth", "hydrant",
    "hypnosis", "hysteria", "hamburger", "harmony", "harvest", "hatchet",
    "icicle", "illusion", "imagination", "immigrant", "improvement", "infinity", "ingredient",
    "inhaler", "innovation", "insect", "instrument", "interview", "invention", "investor",
    "iris", "island", "ivory", "iceberg", "icicle", "illusion",
    "jacket", "jaguar", "janitor", "javelin", "jellyfish", "jigsaw", "journal", "journey",
    "joyful", "judgment", "juggernaut", "junction", "jungle", "justice", "juxtaposition",
    "jalapeno", "jellybean", "jewelry", "jukebox", "jumper",
    "kangaroo", "kayak", "keel", "kettle", "keyboard", "kickoff", "kidney", "kitchen",
    "kitten", "kiwi", "knapsack", "kneecap", "knight", "knock", "knowledge", "koala",
    "krypton", "kudos", "kaleidoscope", "kayak",
    "label", "labyrinth", "lacquer", "lakeside", "landscape", "language", "lantern", "laundry",
    "laughter", "lavender", "legend", "leopard", "library", "lightning", "limousine",
    "lighthouse", "limestone", "literature", "lobster", "lollipop",
    "macaroni", "magazine", "magnet", "mahogany", "mailbox", "mammoth", "mandolin", "mansion",
    "marathon", "margarine", "marigold", "marimba", "marmalade", "marshmallow", "masquerade",
    "masterpiece", "mayflower", "meadow", "mechanic", "medal",
    "nectar", "neon", "neutron", "nightmare", "nickname", "nocturnal", "nonsense", "noodle",
    "nostalgia", "notebook", "novel", "nucleus", "nugget", "number", "numeral", "nutcracker",
    "nylon", "nymph", "nectarine", "narrator",
    "oak", "oasis", "oatmeal", "obelisk", "ocean", "octagon", "octopus", "odyssey", "officer",
    "olive", "omelet", "onion", "opera", "orbit", "orchard", "origami", "orphan", "ostrich",
    "outback", "overcoat",
    "paddle", "painter", "palace", "pancake", "panther", "parachute", "paradise", "parrot",
    "passenger", "pastel", "pathway", "patriot", "peanut", "pearl", "pedestrian", "pelican",
    "penguin", "pension", "pepper", "petal",
    "quagmire", "quail", "quarantine", "quarrel", "quarry", "quarter", "quartet", "quasar",
    "queen", "quest", "question", "quicksand", "quiet", "quill", "quilt", "quiver", "quota",
    "quote", "quintet", "quiz",
    "rabbit", "raccoon", "radiator", "rainbow", "raindrop", "raven", "reindeer", "reptile",
    "restaurant", "reunion", "revolution", "rhinoceros", "ribbon", "river", "robot", "rocket",
    "rogue", "rosebud", "roulette", "runner",
    "saddle", "safari", "sailboat", "salad", "sandcastle", "sapphire", "satellite", "scarecrow",
    "scenery", "scepter", "scholar", "scorpion", "sculpture", "seagull", "seminar", "serenade",
    "shadow", "shamrock", "shark", "shingle",
    "tadpole", "tapestry", "tavern", "teacup", "teaspoon", "telephone", "telescope", "tenderloin",
    "terminator", "terrace", "textbook", "theater", "thermometer", "thunderstorm", "tiger",
    "tornado", "trampoline", "transcript", "traveler", "trophy",
    "umbrella", "unicorn", "uniform", "universe", "university", "upgrade", "upstairs", "uranium",
    "urban", "urchin", "utensil", "utility", "utopia", "utterance", "uvula", "umpire", "unison",
    "uranus", "username", "utility",
    "vacuum", "vaccine", "valentine", "valley", "vampire", "vanilla", "vapor", "variable",
    "velocity", "vendor", "venom", "verdict", "vertex", "vestibule", "veteran", "victory",
    "vineyard", "violin", "volcano", "vortex",
    "waffle", "wanderer", "warehouse", "warrior", "waterfall", "waveform", "wealth", "weather",
    "weaver", "webcam", "weekend", "weight", "werewolf", "whale", "wilderness", "windmill",
    "window", "wingnut", "winery", "wisdom",
    "yacht", "yak", "yammer", "yardstick", "yarn", "yearbook", "yearling", "yellow", "yeti",
    "yodel", "yoga", "yogurt", "yonder", "youthful", "yule", "yummy", "yawn", "yelp", "yeast",
    "yield",
    "zebra", "zenith", "zephyr", "zest", "zigzag", "zillion", "zinc", "zipper", "zircon",
    "zodiac", "zombie", "zone", "zoology"
]
#Preview {
    MainMenuView()
}
