import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var ThoughtField: UITextView!
    @IBOutlet var PromptField: UITextView!
    @IBOutlet var promptLabel: UILabel!
    
    
    var item: Item!
    
    
    var currentPromptIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ThoughtField.text = item.thought
        PromptField.text = item.prompt
        promptLabel.text = item.question
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        item.thought = ThoughtField.text
        item.prompt = PromptField.text
        item.question = promptLabel.text
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_sender:UITapGestureRecognizer){
        view.endEditing(true)
    }
//    @IBAction func showNextQuestion() {
//        currentPromptIndex += 1
//        if currentPromptIndex == item.question!.count {
//            currentPromptIndex = 0
//        }
//        let prompt: String = item.question![currentPromptIndex]
//        promptLabel.text = prompt
//    }
    
}
