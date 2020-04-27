//
//  ViewController.swift
//  programmaticConstarints
//
//  Created by Kalin Balabanov on 14/01/2020.
//  Copyright © 2020 Kalin Balabanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK: - UI Elements
    
    let cameraImageView: UIImageView = {
        
        let cameraButton = "camera_button.png"
        let firstImage = UIImage(named: cameraButton)
        let firstImageView = UIImageView(image: firstImage)
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
        return button
        
    }()
    
    private let nextButton: UIButton = {
       
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
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
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
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
