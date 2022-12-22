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

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Bold", size: 16)
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemIndigo
        UIButton.shadowSetting(button)
        return button
    }()

    private lazy var passwordRecoveryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 16)
        return button
    }()

    private lazy var separatorLeftView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 2
        return view
    }()

    private lazy var separatorRightView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 2
        return view
    }()

    private lazy var separatorLabel: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Regular", size: 14)
        label.textColor = .gray
        return label
    }()

    private lazy var stackSeparator: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.addArrangedSubview(separatorLeftView)
        stack.addArrangedSubview(separatorLabel)
        stack.addArrangedSubview(separatorRightView)
        return stack
    }()

    private lazy var facebookLabel: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 14)
        label.textColor = .white
        return label
    }()

    private lazy var facebookImageView: UIImageView = {
        let image = UIImage(named: "facebook")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var facebookStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 15
        stack.addArrangedSubview(facebookImageView)
        stack.addArrangedSubview(facebookLabel)
        return stack
    }()

    private lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .systemBlue
        UIButton.shadowSetting(button)
        return button
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
        view.addSubviews([
            imageBackground,
            titleLabel, userNameTF,
            passwordTF,
            loginButton,
            passwordRecoveryButton,
            stackSeparator,
            facebookButton
        ])

        facebookButton.addSubview(facebookStack)
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(110)
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

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTF.snp.bottom).offset(50)
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }

        passwordRecoveryButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }

        separatorLeftView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(100)
        }

        separatorRightView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(100)
        }

        stackSeparator.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-200)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
        }

        facebookImageView.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
        }

        facebookStack.snp.makeConstraints { make in
            make.left.equalTo(facebookButton.snp.left).offset(20)
            make.right.equalTo(facebookButton.snp.right).offset(-20)
            make.centerY.equalTo(facebookButton.snp.centerY)
        }

        facebookButton.snp.makeConstraints { make in
            make.top.equalTo(stackSeparator.snp.bottom).offset(30)
            make.left.equalTo(view).offset(30)
            make.height.equalTo(40)
            make.width.equalTo(150)
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

extension UIButton {
    static func shadowSetting(_ button: UIButton) {
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
    }
}
