//
//  ViewController.swift
//  LayoutAuthorizationScreen
//
//  Created by Kristina Korotkova on 21/12/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var imageBackground: UIImageView = {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .top
        imageView.center = view.center
        return imageView
    }()

    // MARK: - Outlets

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubviews([imageBackground])


    }

}

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}


