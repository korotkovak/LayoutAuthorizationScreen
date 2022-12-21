//
//  ViewController.swift
//  LayoutAuthorizationScreen
//
//  Created by Kristina Korotkova on 21/12/22.
//

import UIKit
import SnapKit

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

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Bold", size: 34)
        label.textColor = .white
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubviews([imageBackground, titleLabel])
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(130)
            make.centerX.equalTo(view)
        }
    }



}

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}


