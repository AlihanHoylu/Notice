//
//  secondViewController.swift
//  segue
//
//  Created by Alihan Hoylu on 19.08.2023.
//

import UIKit

class secondViewController: UIViewController {

    
    @IBOutlet weak var retryPasswordInput : UITextField!
    
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var emailInput: UITextField!
    
    var email:String = ""
    var password : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailInput.text == ""{
            error(title: "Error!", message: "You are not write email")
        }else if passwordInput.text == ""{
            error(title: "Error!", message: "You are not write password")
        }else if retryPasswordInput.text == ""{
            error(title: "Error!", message: "You are not write password retrey")
        }else if passwordInput.text != retryPasswordInput.text{
            error(title: "Error", message: "Yours password and retry password not same")
        }else {
            if UserDefaults.standard.object(forKey: "email") == nil && UserDefaults.standard.object(forKey: "password") == nil
            {
                    email = emailInput.text!
                    password = passwordInput.text!
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(password, forKey: "password")
                    error(title: "Congratulations!", message: "You are signed up")
                
                    
            }else{
                error(title: "Error!", message: "Before clean up")
            }
        }
        
        
    }
    
    func error(title:String,message:String){
        let message = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let errorAction = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        message.addAction(errorAction)
        
        self.present(message, animated: true)
        cleanTextFields()
        
    }
    
    func cleanTextFields(){
        emailInput.text = ""
        passwordInput.text = ""
        retryPasswordInput.text = ""
    }
    
}
