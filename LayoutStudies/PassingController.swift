//
//  PassingController.swift
//  LayoutStudies
//
//  Created by alican on 15.03.2022.
//

import Foundation
import UIKit

class PassingController : UICollectionViewController , UICollectionViewDelegateFlowLayout{

    private let previousButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnPreviousClicked), for: .touchUpInside)
        return button
    }()
    
    @objc private func btnPreviousClicked(){
        pageController.currentPage -= 1
        let indexPath = IndexPath(item: pageController.currentPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("number of pages : \(pageController.numberOfPages)")
    }
    
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(btnNextClicked), for: .touchUpInside)
        return button
    }()
    
    @objc private func btnNextClicked(){
        pageController.currentPage += 1
        let indexPath = IndexPath(item: pageController.currentPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        print("number of pages : \(pageController.numberOfPages)")
    }
    
    private let pageController : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.numberOfPages = Page.pages.count
        pageControl.currentPageIndicatorTintColor = UIColor.midRed
        pageControl.pageIndicatorTintColor = UIColor.softRed
        return pageControl
    }()
    
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(PassingCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.isPagingEnabled = true
        setStackViewConstraints()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Page.pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PassingCell
        //cell.companyImage.image = UIImage(named: Page.pages[indexPath.row].company)
        //cell.companyName.text = Page.pages[indexPath.row].explanation
        cell.page = Page.pages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let screenWidth = targetContentOffset.pointee.x
        pageController.currentPage = Int(screenWidth/view.frame.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageController.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }) { (_) in
            
        }
    }
    
    private func setStackViewConstraints(){
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(pageController)
        stackView.addArrangedSubview(nextButton)
        view.addSubview(stackView)
       
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
