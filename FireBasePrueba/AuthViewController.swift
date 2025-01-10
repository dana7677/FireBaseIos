//
//  AuthViewController.swift
//  FireBasePrueba
//
//  Created by Tardes on 10/1/25.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var CreateButton: UIButton!
    @IBOutlet weak var UserPassword: UITextField!
    @IBOutlet weak var UserEmail: UITextField!
    
    @IBAction func CreatePressed(_ sender: UIButton) {
        
        if let email = UserEmail.text,let password =
            UserPassword.text{
            
            Auth.auth().createUser(withEmail: email, password: password){
                (result,error)in
                if let result = result , error == nil{
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                    
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true,completion: nil)
                }
                
            }
            
        }
    }
    @IBAction func LoginPressed(_ sender: Any) {
        
        if let email = UserEmail.text,let password =
            UserPassword.text{
            
            Auth.auth().signIn(withEmail: email, password: password){
                (result,error)in
                if let result = result , error == nil{
                    self.navigationController?
                        .pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                    
                }else{
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true,completion: nil)
                }
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Authenticaton"
        
        Analytics.logEvent("InitScreen", parameters: ["Message":"Integracion de FireBase Completa"])
    }


}

