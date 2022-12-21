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

    private lazy var userNameTF: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Your name"
        textField.font = UIFont(name: "Inter-Regular", size: 14)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        UITextField.shadowSetting(textField)
        return textField
    }()

    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Your password"
        textField.font = UIFont(name: "Inter-Regular", size: 14)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 25
        UITextField.shadowSetting(textField)
        return textField
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupIcons()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubviews([imageBackground, titleLabel, userNameTF, passwordTF])
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(130)
            make.centerX.equalTo(view)
        }

        userNameTF.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }

        passwordTF.snp.makeConstraints { make in
            make.top.equalTo(userNameTF.snp.bottom).offset(20)
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }
    }

    private func setupIcons() {
        if let imageLeftIconInUserName = UIImage(systemName: "person") {
            userNameTF.setLeftIcon(imageLeftIconInUserName)
        }

        if let imageRightIconInUserName = UIImage(systemName: "checkmark.circle.fill") {
            userNameTF.setRightIcon(imageRightIconInUserName)
        }


        if let imageLeftIconInPassword = UIImage(systemName: "exclamationmark.lock") {
            passwordTF.setLeftIcon(imageLeftIconInPassword)
        }

    }



}



extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 20, y: 5, width: 20, height: 20))
        iconView.image = image
        iconView.tintColor = .systemGray2
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 50, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        iconView.tintColor = .systemGreen
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 50, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }

    static func shadowSetting(_ textField: UITextField) {
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = .zero
        textField.layer.shadowRadius = 10
        textField.layer.shouldRasterize = true
        textField.layer.rasterizationScale = UIScreen.main.scale
    }
}

