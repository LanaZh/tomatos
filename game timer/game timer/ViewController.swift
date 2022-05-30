//
//  ViewController.swift
//  game timer
//
//  Created by Надежда Жукова on 29.05.2022.
//

import UIKit

 class ViewController: UIViewController {

     let lessonLabel : UILabel = {
         let label = UILabel()
         label.text = "Давай сконцентрируемся"
         label.font = UIFont.boldSystemFont(ofSize: 20)
         label.textColor = .black
         label.numberOfLines = 0
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
        
     let numberLabel : UILabel = {
         let label = UILabel()
         label.text = "10"
         label.font = UIFont.boldSystemFont(ofSize: 55)
         label.textColor = .black
         label.numberOfLines = 0
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     let addImage : UIImageView = {
         let imageView = UIImageView()
         imageView.image = UIImage(named: "timer")
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()

     @objc let startButton : UIButton = {
         let button = UIButton()
         button.layer.cornerRadius = 20
         button.setTitle("Начнем", for: .normal)
         button.backgroundColor = .black
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
     

     let timerLabel : UILabel = {
         let label = UILabel()
         label.text = "10"
         label.font = UIFont.boldSystemFont(ofSize: 84)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     var timer = Timer()
     var durationTimer = 10
     

     override func viewDidLoad() {
         super.viewDidLoad()

         view.backgroundColor = .white
         
         setConstraints()
         startButton.addTarget(self, action: #selector(getter: startButton), for: .touchUpInside)
     }
     
     @objc func actionButton() {
         
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
     }
     
     @objc func timerAction() {
         
         durationTimer -= 1
         numberLabel.text = "\(durationTimer)"
     }
 }

 extension ViewController {

     func setConstraints() {

         view.addSubview(lessonLabel)
         NSLayoutConstraint.activate([
             lessonLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
             lessonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
             lessonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
         ])

         view.addSubview(startButton)
         NSLayoutConstraint.activate([
             startButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
             startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             startButton.heightAnchor.constraint(equalToConstant: 70),
             startButton.widthAnchor.constraint(equalToConstant: 300)
         ])
         
         view.addSubview(addImage)
         NSLayoutConstraint.activate([
         addImage.heightAnchor.constraint(equalToConstant: 200),
         addImage.widthAnchor.constraint(equalToConstant: 200),
         addImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         addImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
         ])
         
         addImage.addSubview(numberLabel)
         NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: addImage.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: addImage.centerYAnchor),
         ])
    }
 }
