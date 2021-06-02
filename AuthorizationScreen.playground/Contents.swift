//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    // MARK: - Private properties UI Elements
    private let mainTitllLabel = UILabel()
    private let noAccountLabel = UILabel()
    
    private let mailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let logInButton = UIButton()
    private let logInWithVKButton = UIButton()
    private let registrationButton = UIButton()
    
    private let stackView = UIStackView()
    
    private var scrollView = UIScrollView()
        
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        configureViews()
        setConstraints()
    }
    
    // MARK: - Configure UI Elements
    private func configureMainTitle() {
        mainTitllLabel.text = "Авторизация"
        mainTitllLabel.textAlignment = .center
        mainTitllLabel.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    private func configureMailField() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 35
        mailTextField.defaultTextAttributes = [.paragraphStyle: paragraphStyle]
        
        mailTextField.placeholder = "Электронная почта"
        mailTextField.borderStyle = .roundedRect
        mailTextField.keyboardType = .emailAddress
    }
    
    private func configurePasswordTextField() {
        passwordTextField.placeholder = "Пароль"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
    }
    
    private func configureLogIn() {
        logInButton.setTitle("Авторизоваться", for: .normal)
        logInButton.backgroundColor = UIColor.Custom.purple
        logInButton.layer.cornerRadius = 5
    }
    
    private func configureLogInWithVK() {
        logInWithVKButton.setTitle("Войти с помощью VK", for: .normal)
        logInWithVKButton.setTitleColor(UIColor(red: 81/255,
                                                green: 129/255,
                                                blue: 194/255,
                                                alpha: 1),
                                        for: .normal)
        logInWithVKButton.layer.cornerRadius = 5
        logInWithVKButton.layer.borderWidth = 1
        logInWithVKButton.layer.borderColor = UIColor(red: 224/255,
                                                      green: 224/255,
                                                      blue: 224/255,
                                                      alpha: 1).cgColor
    }
    
    private func configureNoAccountLabel() {
        noAccountLabel.text = "Нет аккаунта?"
        noAccountLabel.font = UIFont.systemFont(ofSize: 14)
        noAccountLabel.textColor = UIColor(red: 210/255,
                                           green: 210/255,
                                           blue: 210/255,
                                           alpha: 1)
    }
    
    private func configureRegistration() {
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.setTitleColor(UIColor.Custom.purple, for: .normal)
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        stackView.addArrangedSubview(mailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(logInButton)
        stackView.addArrangedSubview(logInWithVKButton)
        
        view.addSubview(stackView)
    }
    
    private func configureViews() {
        configureMainTitle()
        configureMailField()
        configurePasswordTextField()
        configureLogIn()
        configureStackView()
        configureLogInWithVK()
        configureNoAccountLabel()
        configureRegistration()
        configureScrollView()
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainTitllLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(noAccountLabel)
        scrollView.addSubview(registrationButton)
    }

    // MARK: - Setting constraints
    private func setConstraints() {
        mainTitllLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        mailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInWithVKButton.translatesAutoresizingMaskIntoConstraints = false
        noAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainTitllLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainTitllLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,
                                                   constant: -20),

            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: scrollView.leadingAnchor,
                                               constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: scrollView.trailingAnchor,
                                                constant: -20),
            stackView.widthAnchor.constraint(greaterThanOrEqualToConstant: 400),
            
            registrationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            registrationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            noAccountLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            noAccountLabel.topAnchor.constraint(greaterThanOrEqualTo: logInWithVKButton.bottomAnchor,
                                                constant: 40),
            noAccountLabel.bottomAnchor.constraint(equalTo: registrationButton.topAnchor)
        ])
    }
}

extension UIColor {
    enum Custom {
        static let purple = UIColor(red: 137/255,
                                    green: 4/255,
                                    blue: 255/255,
                                    alpha: 1)
    }
}

PlaygroundPage.current.liveView = MyViewController()

