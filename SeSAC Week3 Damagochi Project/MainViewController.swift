

import UIKit
import Toast



class MainViewController: UIViewController {
    
    static var identifier = "MainViewController"
    
    var damagochiData: Damagochi?
    
    var level = Damagochi.level
    var exp = Damagochi.exp
    var rice = Damagochi.rice
    var water = Damagochi.water
    
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
        "\(Damagochi.userName)님 오늘은 깃허브 푸쉬하셨어용??", "테이블뷰와 컬렉션뷰의 차이는 무엇일까요??", "아직 배가 고파용!!", "\(Damagochi.userName)님 오늘 과제는 하셨어용??", "복습은 잘 하고계시죵??", "코딩이 쉽지않죵??"
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "\(Damagochi.userName)님의 다마고치"
        
    }
    
    override func loadView() {
        super.loadView()
        textLabel.text = balloonWords.randomElement()
        self.title = "\(Damagochi.userName)님의 다마고치"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainSubView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        UserDefaults.standard.object(forKey: "Saved")
        
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
        
        //textLabel.text =
        damagochiImage.image = damagochiData?.image
        damagochiNameLabel.text = damagochiData?.name
        descriptionLabel.text = "LV\(level) • 밥알\(rice)개 • 물방울\(water)"
        
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let result = ((Double(rice) / 5.0 + Double(water) / 2.0).rounded(.down)) / 10
        level = Int(result)
        print("눌렸습니다")
        textLabel.text = balloonWords.randomElement()
        
        switch sender.tag {
                    // 스위치문으로 level당 케이스 지정해서 열거하는게 더 정확할것 같음.⭐️
                    // 이미지가 왜 안바뀔까.........................
        case 0:
            
            if let riceCount = Int(riceTextField.text!) {
                if riceCount < 100 {
                    rice += riceCount
                    
                    if level <= 10 && level >= 1 {
                        descriptionLabel.text = "LV\(level) • 밥알\(rice)개 • 물방울\(water)개"
                        print(level)
                        damagochiImage.image = damagochiData?.image
                        // 타입 저장속성으로 선언해놓은 Damagochi.level 변하지가 않음.
                        
                    } else if level > 10 {
                        textLabel.text = "저는 이제 다 자랐어용!! 키워주셔서 감사합니당!"
                        //view.makeToast("더 이상 자라면 안돼요!", duration: 1, position: .center)
                    } else {
                        descriptionLabel.text = "LV1 • 밥알\(rice)개 • 물방울\(water)개"
                    }
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
                
            }
        case 1:

            if let waterCount = Int(waterTextField.text!) {
                if waterCount < 50 {
                    water += waterCount
                    
                    if level <= 10 && level >= 1 {
                        descriptionLabel.text = "LV\(level) • 밥알\(rice)개 • 물방울\(water)개"
                        
                        damagochiImage.image = damagochiData?.image
                    } else if result > 10 {
                        textLabel.text = "저는 이제 다 자랐어용!! 키워주셔서 감사합니당!"
                        //view.makeToast("더 이상 자라면 안돼요!", duration: 1, position: .center)
                    } else {
                        descriptionLabel.text = "LV1 • 밥알\(rice)개 • 물방울\(water)개"
                    }
                } else {
                    textLabel.text = "배가 터질거 가타요ㅠㅁㅠ"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
                
            }
        default:
            break
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
        print(string)
        
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

