//
//  ButtonSceneViewController.swift
//  midterm_Dhrupal_Desai
//
//  Created by user204862 on 3/12/22.
//

import UIKit

class ButtonSceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     @IBAction func goToFunctionScene(_ sender: Any) {
     }
     */
    @IBAction func goToFunctionScene(_ sender: Any) {
        let page = storyboard?.instantiateViewController(withIdentifier : "FunctionScene")as! FunctionSceneViewController; page.modalPresentationStyle = .fullScreen
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
}
