//
//  ViewController.swift
//  infinBANK-demo
//
//  Created by s b on 13.04.2022.
//

import UIKit



class ViewController: UIViewController {

    let authBT = UIButton()
    let textLable = UILabel()
    let addressBT = UIButton()
    let helpBT = UIButton()
    let cardBT = UIButton()
    let backBT = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {

        
        //MARK: Back button setup
        backBT.setBackgroundImage(UIImage(named: "back"), for: .normal)
        
        //MARK: Войти button setup
        authBT.setTitle("Войти", for: .normal)
        authBT.layer.cornerRadius = 10.0
        authBT.titleLabel?.font = .boldSystemFont(ofSize: 17)
        authBT.titleLabel?.textColor = .white
        authBT.backgroundColor = .mainDarkBlueColor
        authBT.titleLabel?.textAlignment = .center

        //MARK: Main ad text setup
        textLable.text = """
- Возобновляемый кредитный лимит


- Процентная ставка 35.99 %


- Пользование лимитом 24 мес.


- Посещение банка 1 раз - только в момент получения кредитной карты
"""
        textLable.textColor = .black
        textLable.font = .systemFont(ofSize: 14)
        textLable.numberOfLines = 15
        
        //MARK: Оформить карту button setup
        cardBT.setTitle("Оформить карту", for: .normal)
        cardBT.layer.cornerRadius = 10.0
        cardBT.titleLabel?.font = .boldSystemFont(ofSize: 17)
        cardBT.titleLabel?.textColor = .white
        cardBT.backgroundColor = .mainDarkBlueColor
        cardBT.titleLabel?.textAlignment = .center
        
        //MARK: Adress button setup
        addressBT.setImage(UIImage(named: "locations_icon"), for: .normal)
        addressBT.setTitle("Адреса", for: .normal)
        addressBT.titleLabel?.font = .boldSystemFont(ofSize: 15)
        addressBT.setTitleColor(.gray, for: .normal)
        addressBT.titleLabel?.textAlignment = .center
        addressBT.addTarget(self, action: #selector(showAdresses), for: .touchUpInside)
        
        //MARK: Help button setup
        helpBT.setImage(UIImage(named: "help_icon"), for: .normal)
        helpBT.setTitle("Помощь", for: .normal)
        helpBT.titleLabel?.font = .boldSystemFont(ofSize: 15)
        helpBT.setTitleColor(.gray, for: .normal)
        helpBT.titleLabel?.textAlignment = .center
    
        //MARK: View Layout
        view.addSubview(backBT)
        view.addSubview(authBT)
        view.addSubview(textLable)
        view.addSubview(cardBT)
        view.addSubview(helpBT)
        view.addSubview(addressBT)
        backBT.translatesAutoresizingMaskIntoConstraints = false
        authBT.translatesAutoresizingMaskIntoConstraints = false
        textLable.translatesAutoresizingMaskIntoConstraints = false
        addressBT.translatesAutoresizingMaskIntoConstraints = false
        helpBT.translatesAutoresizingMaskIntoConstraints = false
        cardBT.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backBT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            backBT.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            backBT.widthAnchor.constraint(equalToConstant: 23/1.6),
            backBT.heightAnchor.constraint(equalToConstant: 40/1.6),
            
            authBT.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            authBT.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            authBT.heightAnchor.constraint(equalToConstant: 38),
            authBT.widthAnchor.constraint(equalToConstant: 100),
            
            textLable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            textLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            
            cardBT.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            cardBT.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            cardBT.heightAnchor.constraint(equalToConstant: 55),
            cardBT.bottomAnchor.constraint(equalTo: helpBT.topAnchor, constant: -30),
            
            helpBT.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            helpBT.leftAnchor.constraint(equalTo: view.centerXAnchor),
            helpBT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            addressBT.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            addressBT.rightAnchor.constraint(equalTo: view.centerXAnchor),
            addressBT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            
        ])
        
        
    }

    @objc func showAdresses (){
        let AdressVC = AdressVC()
        AdressVC.modalPresentationStyle = .fullScreen
        present(AdressVC, animated: true, completion: nil)
        navigationController?.pushViewController(AdressVC, animated: true)
    }
    
}

