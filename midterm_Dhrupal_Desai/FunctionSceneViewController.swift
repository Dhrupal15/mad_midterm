//
//  FunctionSceneViewController.swift
//  midterm_Dhrupal_Desai
//
//  Created by user204862 on 3/12/22.
//

import UIKit

class FunctionSceneViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputA: UITextField!
    @IBOutlet weak var inputB: UITextField!
    @IBOutlet weak var output: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        inputA.delegate = self
        inputA.isEnabled = true
        inputA.keyboardAppearance = .default
        inputA.returnKeyType = .done
        inputB.delegate = self
        inputB.isEnabled = true
        inputB.keyboardAppearance = .default
        inputB.returnKeyType = .done
        
        if(inputA.text! == "" || inputB.text! == ""){
            output.text = "Enter the value of A and B"
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hiding keypoard on press return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        if(inputA.text! == "" || inputB.text! == ""){
            output.text = "Enter the value of A and B"
        }
        else{
            let a: Int? = Int(inputA.text!)
            let b: Int? = Int(inputB.text!)
            let aSquare = a! * a!
            let bSquare = b! * b!
            let square = aSquare + bSquare
            let total = sqrt(Double(square))
            let convertText = String(total)
            output.text = "The value of C according to Pythagorean is " + convertText
        }
        
    }
    @IBAction func reset(_ sender: Any) {
        inputA.text = ""
        inputB.text = ""
        output.text = "Enter the value of A and B"
    }
    @IBAction func goBackToButtonScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "ButtonScene")as! ButtonSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    
    @IBAction func goToInitialScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "InitialScene")as! InitialSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    @IBAction func goToMapScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "MapScene")as! MapSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
