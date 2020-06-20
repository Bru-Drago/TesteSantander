//
//  DetailViewController.swift
//  Teste_BrunaDrago
//
//  Created by Bruna Fernanda Drago on 19/06/20.
//  Copyright © 2020 Bruna Fernanda Drago. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    var operations = [StatementList]()
    var detail:DetailService?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Atribuir o delegate e o datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        //Chamando o método que irá fazer o GET dos dados das operações
        getData()
    }
    

    @IBAction func doLogoutButton(_ sender: Any) {
    
     //TODO: - depois de configurar o userdefaults, fazer o logout dele
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    //Mark: - Método Get
    func getData(){
            let urlJsonString = "https://bank-app-test.herokuapp.com/api/statements/1"
            
            let url = URL(string: urlJsonString)
            
            guard url != nil else {
                print("Erro na URL")
                return
            }
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let data = data else {return}
                
                do{
                    self.detail =  try JSONDecoder().decode(DetailService.self, from: data)
                    self.operations = self.detail?.statementList as! [StatementList]
                    
                }catch let jsonErr{
                    print("Error : \(jsonErr)")
                }
                DispatchQueue.main.async {
                    print(self.detail?.statementList.count)
                               self.tableView.reloadData()
                           }
                
            }.resume()
            
            
        }
    }

extension DetailViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell", for: indexPath)as! TransactionsTableViewCell
        
        cell.operationLabel.text = operations[indexPath.row].title
        cell.dateLabel.text = operations[indexPath.row].date
        cell.descriptionLabel.text = operations[indexPath.row].desc
        
        let amount = String(format: "%.2f", operations[indexPath.row].value!)
        cell.amountLabel.text = "R$\(amount)"
        
        
        return cell
    }
}
