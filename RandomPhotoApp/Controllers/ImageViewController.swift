//
//  ImageViewController.swift
//  RandomPhotoApp
//
//  Created by Nikolai Maksimov on 21.07.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Random Photo"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .systemGray
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        view.addSubview(button)
        
        getRandomPhoto()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height-100-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55
        )
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    func getRandomPhoto() {
        NetworkManager.shared.fetchImage { data in
            self.imageView.image = UIImage(data: data)
        }
    }
}

