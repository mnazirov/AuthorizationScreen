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
    
    // MARK: - Private properties
    private let purpleColor = UIColor(red: 137/255,
                                     green: 4/255,
                                     blue: 255/255,
                                     alpha: 1)
    
    private let stackView = UIStackView()
        
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        configureViews()
        setConstraints()
    }
    
    // MARK: - Configure UI Elements
    private func configureMainTitle() {
        mainTitllLabel.text = "Авторизация"
        mainTitllLabel.textAlignment = .center
        mainTitllLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(mainTitllLabel)
    }
    
    private func configureMailField() {
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
        logInButton.backgroundColor = purpleColor
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
        view.addSubview(noAccountLabel)
    }
    
    private func configureRegistration() {
        registrationButton.setTitle("Зарегистрироваться", for: .normal)
        registrationButton.setTitleColor(purpleColor, for: .normal)
        registrationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        view.addSubview(registrationButton)
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
        
        NSLayoutConstraint.activate([
            mainTitllLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitllLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,
                                                   constant: -20),
            
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: 20),
            
            mailTextField.heightAnchor.constraint(equalToConstant: 43),
            
            registrationButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                       constant: -40),
            
            noAccountLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            noAccountLabel.topAnchor.constraint(greaterThanOrEqualTo: logInWithVKButton.bottomAnchor,
                                                constant: 10),
            noAccountLabel.bottomAnchor.constraint(equalTo: registrationButton.topAnchor)
        ])
    }
}

PlaygroundPage.current.liveView = MyViewController()
