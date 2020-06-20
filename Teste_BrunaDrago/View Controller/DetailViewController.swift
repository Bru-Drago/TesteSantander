//
//  DetailViewController.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 19/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doLogoutButton(_ sender: Any) {
    
     //TODO: - depois de configurar o userdefaults, fazer o logout dele
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    


}
