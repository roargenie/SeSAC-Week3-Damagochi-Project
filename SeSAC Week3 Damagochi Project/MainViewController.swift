

import UIKit
import Toast



class MainViewController: UIViewController {
    
    static var identifier = "MainViewController"
    
    var damagochiData: Damagochi?
     
    @IBOutlet weak var mainSubView: UIView!
    
    @IBOutlet weak var textImage: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var damagochiImage: UIImageView!
    
    @IBOutlet weak var damagochiNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    
    @IBOutlet weak var riceButton: UIButton!
    
    @IBOutlet weak var waterTextField: UITextField!
    
    @IBOutlet weak var waterButton: UIButton!
    
    
    var balloonWords = [
        "\(Damagochi.userName)님 오늘은 깃허브 푸쉬하셨어용??", "테이블뷰와 컬렉션뷰의 차이는 무엇일까요??", "아직 배가 고파용!!", "\(Damagochi.userName)님 오늘 과제는 하셨어용??", "복습은 잘 하고계시죵??", "코딩이 쉽지않죵??", "식사는 하셨나용?", "저는 잘 자라고 있습니당!"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textLabel.text = balloonWords.randomElement()
        self.title = "\(Damagochi.userName)님의 다마고치"
        
    }
    
//    override func loadView() {
//        super.loadView()
//        textLabel.text = balloonWords.randomElement()
//        self.title = "\(Damagochi.userName)님의 다마고치"
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainSubView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(personButtonTapped))
        
        riceTextField.delegate = self
        waterTextField.delegate = self
        
        designUI()
        configureUI()
           
    }
    
    func designUI() {
        riceButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        riceButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        riceButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        riceButton.layer.cornerRadius = 10
        riceButton.layer.borderWidth = 2
        riceButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
                
        waterButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        waterButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        waterButton.titleLabel?.font = .boldSystemFont(ofSize: 14)
        waterButton.layer.cornerRadius = 10
        waterButton.layer.borderWidth = 2
        waterButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        descriptionLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .heavy)
        
        damagochiNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        damagochiNameLabel.font = .systemFont(ofSize: 14, weight: .heavy)
        damagochiNameLabel.layer.borderWidth = 1
        damagochiNameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        damagochiNameLabel.layer.cornerRadius = 8
        
        textLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        textLabel.font = .boldSystemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        textLabel.text = "안녕하세요! \(Damagochi.userName)님 반가워용!"
        
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        waterTextField.placeholder = "밥주세용"
        waterTextField.textAlignment = .center
         
    }
    
    @objc func personButtonTapped() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: SettingTableViewController.identifier) as? SettingTableViewController else { return }
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func configureUI() {
        
        damagochiImage.image = UIImage(named: damagochiData!.mainImage)
        damagochiNameLabel.text = damagochiData?.name
        descriptionLabel.text = damagochiData?.description
        
    }
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        
        if damagochiData!.level < 10 && damagochiData!.level > 0 {
            if let riceCount = Int(riceTextField.text!) {
                if riceCount < 100 {
                    damagochiData?.rice += riceCount
                    descriptionLabel.text = damagochiData?.description
                    damagochiImage.image = UIImage(named: damagochiData!.mainImage)
                    textLabel.text = balloonWords.randomElement()
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        } else if damagochiData!.level >= 10 {
            if let riceCount = Int(riceTextField.text!) {
                if riceCount < 100 {
                    damagochiData?.rice += riceCount
                    descriptionLabel.text = damagochiData?.description
                    damagochiImage.image = UIImage(named: damagochiData!.mainImage)
                    textLabel.text = "저는 이제 다 자랐어용!! 키워주셔서 감사합니당!"
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        }
        
        
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        
        if damagochiData!.level < 10 && damagochiData!.level > 0 {
            if let waterCount = Int(waterTextField.text!) {
                if waterCount < 50 {
                    damagochiData?.water += waterCount
                    descriptionLabel.text = damagochiData?.description
                    damagochiImage.image = UIImage(named: damagochiData!.mainImage)
                    textLabel.text = balloonWords.randomElement()
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        } else if damagochiData!.level >= 10 {
            if let waterCount = Int(waterTextField.text!) {
                if waterCount < 50 {
                    damagochiData?.water += waterCount
                    descriptionLabel.text = damagochiData?.description
                    damagochiImage.image = UIImage(named: damagochiData!.mainImage)
                    textLabel.text = "저는 이제 다 자랐어용!! 키워주셔서 감사합니당!"
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        }
        
          
    }

    
    override func viewDidLayoutSubviews() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: riceTextField.frame.height - 2, width: riceTextField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 0.3).cgColor
        
        riceTextField.borderStyle = .none
        riceTextField.layer.addSublayer(bottomLine)
        
        let bottomLine2 = CALayer()
        bottomLine2.frame = CGRect(x: 0, y: waterTextField.frame.height - 2, width: waterTextField.frame.width, height: 2)
        bottomLine2.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 0.3).cgColor

        waterTextField.borderStyle = .none
        waterTextField.layer.addSublayer(bottomLine2)
    }
  
}

extension MainViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        riceTextField.resignFirstResponder()
        waterTextField.resignFirstResponder()
    }
    
}

