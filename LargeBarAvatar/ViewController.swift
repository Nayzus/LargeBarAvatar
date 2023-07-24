//
//  ViewController.swift
//  RectangleGradient
//
//  Created by Pavel Parshutkin on 02.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = configureScrollView()
    private lazy var avatarView: UIImageView = configureAvatarView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        self.title = "Avatar"
        
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.setupConstraints()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.addItemToLargeNavigationBar(itemView: avatarView)
    }
    
    private func configureAvatarView() -> UIImageView {
        let imageView = UIImageView()
        
        let image = UIImage(systemName: "person.crop.circle.fill")
        
        imageView.image = image
        imageView.tintColor = .gray
        imageView.clipsToBounds = true
        imageView.layer.zPosition = 0
        return imageView
    }
    
    private func configureScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.contentSize = .init(width: view.frame.width, height: 2000)
     
        return view
    }
    
    
    private func addItemToLargeNavigationBar(itemView: UIView) {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return
            
        }
        
        navigationBar.subviews.forEach { subview in
            
                if subview.isKind(of: UINavigationBarLargeTitleView.self) {
    
                    subview.addSubview(itemView)
        
                    itemView.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([
                        itemView.bottomAnchor.constraint(
                            equalTo: subview.bottomAnchor,
                            constant: -8
                        ),
                        itemView.trailingAnchor.constraint(
                            equalTo: subview.trailingAnchor,
                            constant: -16
                        )
                    ])
                }
            }
        

    }
    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatarView.widthAnchor.constraint(equalToConstant: 36),
            avatarView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
