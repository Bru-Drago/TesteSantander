//
//  LoginViewController.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 19/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passowordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doLoginButton(_ sender: Any) {
        
        var user = userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var password = passowordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // apagar senha do text field
        userTextField.text = nil
        passowordTextField.text = nil
        
        
        var passIsValid = Password(password: password!).isValid()
        var userIsValid = UserValidation(user: user!).isValid()
        
        if passIsValid  && userIsValid {
           //Se as condições para o Login forem atendidas , ir para a tela de Detalhes
            let detailVC = self.storyboard?.instantiateViewController(identifier: "DetailVC") as! DetailViewController
            self.navigationController?.pushViewController(detailVC, animated: true)
        }else{
            showAlert()
        }
        
    }
    func showAlert(){
    
    //Criando alerta para informar usuário que a senha ou login é invalido
    let alerta = UIAlertController(title: "Login Inválido", message: "Usuário ou senha inválido", preferredStyle: .alert)
    
        //Adicionando Botões
        let acaoOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            print("Apertou o Ok")
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel) { (action) in
            
            print("Apertou Cancelar")
        }
        
        alerta.addAction(acaoOk)
        alerta.addAction(acaoCancelar)
        
        //Apresentando o alerta
        self.present(alerta, animated: true) {
            
            print("Apresentou o alerta")
        }
    }
    
}
