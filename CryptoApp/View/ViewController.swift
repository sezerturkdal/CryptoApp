//
//  ViewController.swift
//  CryptoApp
//
//  Created by Sezer on 6.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tblView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
        self.colorArray = [
            UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.1),
            UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.3)
        ]
        
        getData()
    }
    
    func getData(){
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        CurrencyService().downloadCurrencies(url: url) { items in
            if let items = items{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: items)
                
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        cell.lblPrice.text = cryptoViewModel.price + " ₺"
        cell.lblName.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 2]
        
         return cell
    }


}

