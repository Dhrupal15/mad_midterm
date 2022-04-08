//
//  ViewController.swift
//  midterm_Dhrupal_Desai
//
//  Created by user204862 on 3/10/22.
//

import UIKit

class InitialSceneViewController: UIViewController, UITextFieldDelegate {
    var myIndex = Int.random(in: 0..<6)
    var cities = ["Calgary", "Halifax", "Montreal", "Toronto", "Vancouver", "Winnipeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityName.delegate = self
        cityName.isEnabled = true
        cityName.keyboardAppearance = .default
        cityName.returnKeyType = .done
        cityImage.image =  UIImage(named: cities[myIndex])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hiding keypoard on press return.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    @IBOutlet weak var cityImage: UIImageView!
    
    @IBOutlet weak var cityName: UITextField!
    @IBAction func findCity(_ sender: Any) {
        
        let newIndex = findCity(cityName.text!)
              
            cityImage.image = UIImage(named: cities[newIndex])
    }
    func findCity(_ cityName: String) -> Int {
        return cities.firstIndex(of: cityName) ?? 0
    }
    @IBAction func goToButtonScenePage(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "ButtonScene")as! ButtonSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
    @IBAction func gotoMapPage(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "MapScene")as! MapSceneViewController; page.modalPresentationStyle = .fullScreen
        present(page, animated: true)
    }
}

