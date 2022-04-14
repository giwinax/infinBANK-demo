//
//  AdressVC.swift
//  infinBANK-demo
//
//  Created by s b on 13.04.2022.
//

import UIKit

class AdressVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
 

    let backBT = UIButton()
    let adrTitle = UILabel()
    let listBT = UIButton()
    let settingsBT = UIButton()
    let allBT = UIButton()
    let atmBT = UIButton()
    let banksBT = UIButton()
    let searchField = UISearchBar()
    let tableView = UITableView()
    
    let tableDataSource:[(String,String,String,Int)] = [
        ("Банкомат","00:00 - 23:59", "г. Нукус, ул. Реджепов", 2175),
        ("Филиал","00:00 - 23:59", "г. Нукус, ул. Реджепов", 2174),
        ("Банкомат","09:00 - 22:00", "г. Нукус, ул. Е. Алакоз", 2176),
        ("Банкомат","09:00 - 22:00", "г. Нукус, ул. Е. Алакоз", 2165),
        ("Филиал","09:00 - 22:00", "г. Нукус, ул. Турткул гузары", 2145),
        ("Банкомат","09:00 - 18:00", "г. Нукус, ул. Реджепов", 2075)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView() {
        self.view.backgroundColor = .white
        
        //MARK: Back button setup
        backBT.setBackgroundImage(UIImage.init(named: "back")?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        backBT.tintColor = .black
        
        //MARK: Adress title setup
        adrTitle.text = "Адреса"
        adrTitle.textColor = .black
        adrTitle.font = .boldSystemFont(ofSize: 20)
        
        //MARK: Settings button setup
        settingsBT.setBackgroundImage(UIImage(named: "settings_icon"), for: .normal)
        
        //MARK: List button setup
        listBT.setBackgroundImage(UIImage(named: "list_icon"), for: .normal)
        
        //MARK: All button setup
        allBT.setTitle("Все", for: .normal)
        allBT.titleLabel?.font = .boldSystemFont(ofSize: 12)
        allBT.setTitleColor(.black, for: .normal)
        allBT.layer.cornerRadius = 14.0
        allBT.backgroundColor = .myLightGray
        allBT.titleLabel?.textAlignment = .center
        
        //MARK: ATM button setup
        atmBT.setTitle("Банкоматы", for: .normal)
        atmBT.titleLabel?.font = .boldSystemFont(ofSize: 12)
        atmBT.setTitleColor(.black, for: .normal)
        atmBT.layer.cornerRadius = 14.0
        atmBT.backgroundColor = .myLightGray
        atmBT.titleLabel?.textAlignment = .center
        
        //MARK: Banks button setup
        banksBT.setTitle("Филиалы", for: .normal)
        banksBT.titleLabel?.font = .boldSystemFont(ofSize: 12)
        banksBT.setTitleColor(.black, for: .normal)
        banksBT.layer.cornerRadius = 14.0
        banksBT.backgroundColor = .myLightGray
        banksBT.titleLabel?.textAlignment = .center

        //MARK: Search Field setup
        searchField.backgroundColor = .clear
        searchField.placeholder = "Поиск"
        searchField.searchTextField.font = .systemFont(ofSize: 14)
        searchField.searchBarStyle = .minimal
        searchField.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        
        //MARK: Table View setup
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(backBT)
        view.addSubview(adrTitle)
        view.addSubview(settingsBT)
        view.addSubview(listBT)
        view.addSubview(allBT)
        view.addSubview(atmBT)
        view.addSubview(banksBT)
        view.addSubview(searchField)
        view.addSubview(tableView)
        backBT.translatesAutoresizingMaskIntoConstraints = false
        adrTitle.translatesAutoresizingMaskIntoConstraints = false
        settingsBT.translatesAutoresizingMaskIntoConstraints = false
        listBT.translatesAutoresizingMaskIntoConstraints = false
        allBT.translatesAutoresizingMaskIntoConstraints = false
        atmBT.translatesAutoresizingMaskIntoConstraints = false
        banksBT.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            backBT.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            backBT.widthAnchor.constraint(equalToConstant: 23/1.6),
            backBT.heightAnchor.constraint(equalToConstant: 40/1.6),
            
            adrTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            adrTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settingsBT.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
            settingsBT.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            listBT.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
            listBT.rightAnchor.constraint(equalTo: settingsBT.leftAnchor, constant: -20),
                    
            allBT.topAnchor.constraint(equalTo: backBT.bottomAnchor, constant: 20),
            allBT.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
            allBT.widthAnchor.constraint(equalToConstant: 40),
            allBT.rightAnchor.constraint(equalTo: atmBT.leftAnchor, constant: -7),
            atmBT.rightAnchor.constraint(equalTo: banksBT.leftAnchor, constant: -7),
            atmBT.topAnchor.constraint(equalTo: backBT.bottomAnchor, constant: 20),
            atmBT.widthAnchor.constraint(equalToConstant: 95),
            banksBT.topAnchor.constraint(equalTo: backBT.bottomAnchor, constant: 20),
            banksBT.widthAnchor.constraint(equalToConstant: 80),
            
            searchField.topAnchor.constraint(equalTo: allBT.bottomAnchor),
            searchField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            searchField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
            tableView.topAnchor.constraint(equalTo: searchField.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        
        func formatNameTime(fullString: String) -> NSMutableAttributedString{
            let range = (fullString as NSString).range(of: fullString)
            var myMutableString = NSMutableAttributedString()
            myMutableString = NSMutableAttributedString(string: fullString)
            myMutableString.setAttributes([.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.black], range: range)
            return myMutableString
        }
        func formatAdress(fullString: String) -> NSMutableAttributedString{
            let range = (fullString as NSString).range(of: fullString)
            var myMutableString = NSMutableAttributedString()
            myMutableString = NSMutableAttributedString(string: fullString)
            myMutableString.setAttributes([.font: UIFont.boldSystemFont(ofSize: 12), .foregroundColor: UIColor.lightGray], range: range)
            return myMutableString
        }
        let nameTimeformated = formatNameTime(fullString: String(format: "\(tableDataSource[indexPath.row].0) \(tableDataSource[indexPath.row].1)\n"))
        let adressFormated = formatAdress(fullString: tableDataSource[indexPath.row].2)
        let combination = NSMutableAttributedString()
        combination.append(nameTimeformated)
        combination.append(adressFormated)
        
        cell.textLabel?.attributedText = combination
        cell.textLabel?.numberOfLines = 3
        
        var typeCellImg = ""
        if tableDataSource[indexPath.row].0 == "Банкомат" {
            typeCellImg = "atm"
        } else {
            typeCellImg = "bank"
        }
        
        let typeImg = UIImage(named: typeCellImg)
        
        cell.imageView?.largeContentImage = typeImg
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
