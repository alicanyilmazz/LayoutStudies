//
//  PassingCell.swift
//  LayoutStudies
//
//  Created by alican on 15.03.2022.
//

import Foundation
import UIKit

class PassingCell : UICollectionViewCell{

    var page : Page?{
        didSet{
            guard let page = page else { return }
            companyImage.image = UIImage(named: page.company)
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSMutableAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSMutableAttributedString(string: page.explanation, attributes: [NSMutableAttributedString.Key.font : UIFont.systemFont(ofSize: 12),NSMutableAttributedString.Key.foregroundColor : UIColor.darkGray]))
            companyName.attributedText = attributedText
            companyName.textAlignment = .center
        }
    }
    
   private let companyImage : UIImageView = {
       let imageView = UIImageView(image: UIImage(named: "apple"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    private let companyName : UITextView = {
        let textView = UITextView()
        //textView.text = "Apple Company Inc."
        //textView.font = UIFont.boldSystemFont(ofSize: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    private let baseView : UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(baseView)
        addSubview(companyName)
         
        setAppleImageConstraints()
        setCompanyNameConstraints()
        setBaseViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAppleImageConstraints(){
        /*
        appleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        appleImage.topAnchor.constraint(equalTo: view.topAnchor,constant: 150).isActive = true
        appleImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        appleImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        */
        baseView.addSubview(companyImage)
        //appleImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        //appleImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        companyImage.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
        companyImage.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true
        companyImage.heightAnchor.constraint(equalTo: baseView.heightAnchor,multiplier: 0.3).isActive = true
        companyImage.widthAnchor.constraint(equalTo: baseView.heightAnchor,multiplier: 0.3).isActive = true
        
    }
    
    private func setCompanyNameConstraints(){
        companyName.topAnchor.constraint(equalTo: baseView.bottomAnchor,constant: 10).isActive = true
        companyName.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        companyName.rightAnchor.constraint(equalTo: rightAnchor,constant: -30).isActive = true
        companyName.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0).isActive = true
    }
    
    private func setBaseViewConstraints(){

        //baseView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //baseView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        baseView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        baseView.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.5).isActive = true
        baseView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
    }
    
    private func setpreviousButtonConstraints(){
        /*
        NSLayoutConstraint.activate([
            previousButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
        ])*/
    }
}
