

import UIKit
import Toast

class MainViewController: UIViewController {
    
    static var identifier = "MainViewController"
    
    var damagochiData = DamagochiInfo()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        mainSubView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.title = "\(Damagochi.userName)님의 다마고치"
        
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
        
        textLabel.text = damagochiData.damagochi[0].introduce
        damagochiImage.image = damagochiData.damagochi[0].image
        damagochiNameLabel.text = damagochiData.damagochi[0].name
        descriptionLabel.text = "LV\(level) • 밥알\(rice)개 • 물방울\(water)"
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let result = ((Double(rice) / 5.0 + Double(water) / 2.0).rounded(.down)) / 10
        level = Int(result)
        
        switch sender.tag {
                    // 스위치문으로 level당 케이스 지정해서 열거하는게 더 정확할것 같음. 바꿔야 함.⭐️
        case 0:
            if riceTextField.text == nil {
                rice += 1
            }
            if let riceCount = Int(riceTextField.text!) {
                if riceCount < 100 {
                    rice += riceCount
                    
                    if level <= 10 && level >= 1 {
                        descriptionLabel.text = "LV\(Int(result)) • 밥알\(rice)개 • 물방울\(water)개"
                        
                        damagochiImage.image = UIImage(named: "1-\(level)")
                    } else if result > 10 {
                        view.makeToast("더 이상 자라면 안돼요!", duration: 1, position: .center)
                    } else {
                        descriptionLabel.text = "LV1 • 밥알\(rice)개 • 물방울\(water)개"
                    }
                } else {
                    
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        case 1:

            if let waterCount = Int(waterTextField.text!) {
                if waterCount < 50 {
                    water += waterCount
                    
                    if level <= 10 && level >= 1 {
                        descriptionLabel.text = "LV\(Int(result)) • 밥알\(rice)개 • 물방울\(water)개"
                        
                        damagochiImage.image = UIImage(named: "1-\(level)")
                    } else if result > 10 {
                        view.makeToast("더 이상 자라면 안돼요!", duration: 1, position: .center)
                    } else {
                        descriptionLabel.text = "LV1 • 밥알\(rice)개 • 물방울\(water)개"
                    }
                } else {
                    
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

