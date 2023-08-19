//
//  ViewController.swift
//  segue
//
//  Created by Alihan Hoylu on 18.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var yoursNotice: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var yoursNoticeLabel: UILabel!
    var emailUser : String = ""
    var passwordUser : String = ""
    var loggined : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if UserDefaults.standard.object(forKey: "email") != nil{
        //       emailUser = UserDefaults.standard.object(forKey: "email") as! String
        //  }
        
        
        // passwordUser = UserDefaults.standard.object(forKey: "password") as! String
        
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if loggined == false{
        
        if UserDefaults.standard.object(forKey: "email") != nil && UserDefaults.standard.object(forKey: "password") != nil{
            
            
            if inputEmail.text == UserDefaults.standard.object(forKey: "email") as? String && inputPassword.text == UserDefaults.standard.object(forKey: "password") as? String{
                error(title: "Succes!", message: "You are loggined up")
                loggined = true
                emailUser = inputEmail.text!
                passwordUser = inputPassword.text!
                if UserDefaults.standard.object(forKey: emailUser) != nil{
                    yoursNoticeLabel.text = UserDefaults.standard.object(forKey: emailUser) as? String
                }
                cleanTextFields()
                
            }else if inputEmail.text != "" && inputPassword.text != "" {
                error(title: "Error!", message: "Your writed wrong email or password")
                cleanTextFields()
            }else{
                error(title: "Error!", message: "Write yours email and password")
            }
            
            
        }else{
            
            error(title: "Error!", message: "Before sign up")
            cleanTextFields()
        }
        
        }else{
            error(title: "Error!", message: "You are loggined up before")
            cleanTextFields()
        }
    }
    
    @IBAction func cleanUp(_ sender: Any) {
        
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "password")
        UserDefaults.standard.setValue(nil, forKey: emailUser)
        yoursNoticeLabel.text = "Yours notice..."
        error(title: "Succes", message: "You are cleaned up")
        loggined = false
        cleanTextFields()
        emailUser = ""
        passwordUser = ""
    }
    
    func error(title:String,message:String){
        let message = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let errorAction = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        message.addAction(errorAction)
        
        self.present(message, animated: true)
        
        
    }
    
    
    @IBAction func setNotice(_ sender: Any) {
        
        if emailUser != ""{
            let notice = yoursNotice.text
            UserDefaults.standard.setValue(notice, forKey: emailUser)
            yoursNoticeLabel.text = notice
            yoursNotice.text = ""
            
        }else{
            error(title: "Error!", message: "Before login up")
            yoursNotice.text = ""
        }
        
    }
    
    @IBAction func clearNotice(_ sender: Any) {
        if emailUser != ""{
            UserDefaults.standard.setValue(nil, forKey: emailUser)
            yoursNoticeLabel.text = "Yours notice..."
            yoursNotice.text = ""
        }else{
            error(title: "Error!", message: "Before login up")
            yoursNotice.text = ""
        }
    }
    
    func cleanTextFields() {
        inputEmail.text = ""
        inputPassword.text = ""
    }
}

