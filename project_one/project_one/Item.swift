import UIKit


class Item: Equatable, Codable {
    var thought: String?
    var prompt: String?
    let date: Date
    var question: String?
    
    init(thought: String, prompt: String, question: String) {
        self.prompt = prompt
        self.thought = thought
        self.date = Date()
        self.question = question
    }
    
    convenience init(random: Bool = false) {
        if random {
            let thoughts = ["I loved today!", "Today was okay", "Sincerely, Me"]
            let prompt = ["go to gym, drink water, do hw", "waking up early", "idk"]

            let questions = ["What was your favorite part of the day?", "What are you celebrating today?", "What are your 3 goals for today?", "What's your favorite color?", "What are your priorities today?"]
            
            let randomThought = thoughts.randomElement()
            let randomPrompt = prompt.randomElement()
            let randomQuestion = questions.randomElement()

            
            self.init(thought: randomThought!, prompt: randomPrompt!, question: randomQuestion!)
        }else{
            let questions = ["What was your favorite part of the day?", "What are you celebrating today?", "What are your 3 goals for today?", "What's your favorite color?", "What are your priorities today?"]
            let randomQuestion = questions.randomElement()
            self.init(thought: "", prompt: "", question: randomQuestion!)
        }
    }


    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.thought == rhs.thought
        && lhs.prompt == rhs.prompt
        && lhs.date == rhs.date
        && lhs.question == rhs.question
    }
}

