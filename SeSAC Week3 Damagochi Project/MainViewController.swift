

import UIKit
import Toast

class MainViewController: UIViewController {
    
    static var identifier = "MainViewController"
    
    var damagochiData = DamagochiInfo()
    
    var level = Damagochi.level
    var exp = Damagochi.exp
    var rice = Damagochi.rice
    var water = Damagochi.water
    
    
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
        self.title = "\(Damagochi.userName)님의 다마고치"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(personButtonTapped))
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        
        riceTextField.delegate = self
        waterTextField.delegate = self
        

        configureUI()
           
    }
    
    @objc func personButtonTapped() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: TestTableViewController.identifier) as? TestTableViewController else { return }
        
        
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
        print(level)
        switch sender.tag {
            
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
                    //descriptionLabel.text = "LV\(Int(result)) • 밥알\(rice)개 • 물방울\(water)개"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        case 1:
//            if waterTextField.text == nil {
//                water += 1
//            }
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
                    //descriptionLabel.text = "LV\(Int(result)) • 밥알\(rice)개 • 물방울\(water)개"
                    view.makeToast("이렇게 많이 먹을수 없어요!", duration: 1, position: .center)
                }
            }
        default:
            break
        }

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
