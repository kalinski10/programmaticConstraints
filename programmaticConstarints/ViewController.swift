//
//  ViewController.swift
//  programmaticConstarints
//
//  Created by Kalin Balabanov on 14/01/2020.
//  Copyright © 2020 Kalin Balabanov. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainGold = UIColor(red: 207/255, green: 181/255, blue: 59/255, alpha: 1.0)
    
}

class ViewController: UIViewController {

// MARK: - UI Elements
    
    let cameraImageView: UIImageView = {
        
        let firstImageView = UIImageView(image: #imageLiteral(resourceName: "camera_button"))
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        return firstImageView
        
    }()
    
    let firstTextView: UITextView = {
      
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "This is a camera button! :)", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nThis buautiful peice of tech is revolutionary in the photography field!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
        
    }()
    
    private let previousButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.gray, for: .normal)
        return button
        
    }()
    
    private let nextButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.mainGold, for: .normal)
        return button
        
    }()
    
    private let pageControl: UIPageControl = {
        
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainGold
        pc.pageIndicatorTintColor = .lightGray
        return pc
        
    }()
    
// MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // here is our entry Point
        view.addSubview(firstTextView)
        setupLayout()
        setupBottomControlsLayoyut()
    }
    
// MARK: - Layout
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.addSubview(cameraImageView)
        
        NSLayoutConstraint.activate([
            
            // top image view conatiner constraints
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            
            // cameraImageView constraints
            cameraImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            cameraImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            cameraImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6),
            
            // text view constraints
            firstTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            firstTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            firstTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])

    }
    
    fileprivate func setupBottomControlsLayoyut() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            
            // prev button constarints
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
        
    }
    
}
