//
//  ViewController.swift
//  LayoutStudies
//
//  Created by alican on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    let appleImage : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "apple"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let companyName : UITextView = {
        let textView = UITextView()
        //textView.text = "Apple Company Inc."
        //textView.font = UIFont.boldSystemFont(ofSize: 15)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        let attributedText = NSMutableAttributedString(string: "Apple", attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSMutableAttributedString(string: "\n\nApple was founded as Apple Computer Company on April 1, 1976, by Steve Jobs, Steve Wozniak and Ronald Wayne to develop and sell Wozniak's Apple I personal computer. It was incorporated by Jobs and Wozniak as Apple Computer, Inc. in 1977 and the company's next computer, the Apple II became a best seller.", attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.darkGray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        return textView
    }()
    
    let baseView : UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("previous", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(companyName)
        view.addSubview(baseView)
        
       setAppleImageConstraints()
       setCompanyNameConstraints()
       setBaseViewConstraints()
       
    }
    
    private func setAppleImageConstraints(){
        /*
        appleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        appleImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        appleImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        */
        baseView.addSubview(appleImage)
        //appleImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        //appleImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        appleImage.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        appleImage.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        appleImage.heightAnchor.constraint(equalTo: baseView.heightAnchor,multiplier: 0.3).isActive = true
        appleImage.widthAnchor.constraint(equalTo: baseView.heightAnchor,multiplier: 0.3).isActive = true
        
    }
    
    private func setCompanyNameConstraints(){
        companyName.topAnchor.constraint(equalTo: baseView.bottomAnchor,constant: 10).isActive = true
        companyName.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 30).isActive = true
        companyName.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -30).isActive = true
        companyName.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
    }
    
    private func setBaseViewConstraints(){

        //baseView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //baseView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        baseView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        baseView.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.5).isActive = true
        baseView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    private func setpreviousButtonConstraints(){
        view.addSubview(previousButton)
        NSLayoutConstraint.activate([
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previousButton.topAnchor.constraint(equalTo: view.topAnchor),
            previousButton.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
}

