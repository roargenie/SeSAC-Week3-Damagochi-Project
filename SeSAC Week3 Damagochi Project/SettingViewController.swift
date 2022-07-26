

import UIKit

class SettingViewController: UIViewController {
    
    static let identifier = "SettingViewController"
    
    @IBOutlet weak var nameChangeTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.title = "\(Damagochi.userName)님의 다마고치"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        nameChangeTextField.placeholder = "변경하실 이름을 입력해주세용!"
        
    }
    
    @objc func rightBarButtonTapped() {
        guard let name = nameChangeTextField.text else { return }
        self.title = "\(name)님의 다마고치"
        Damagochi.userName = name
        
        // 저장하고 전 화면이 나왔을때 디테일레이블 텍스트가 바로 변경되지 않음. 생명주기 관련인거 같은데 잘 모르겠다.
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: nameChangeTextField.frame.height - 2, width: nameChangeTextField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 0.3).cgColor
        
        nameChangeTextField.borderStyle = .none
        nameChangeTextField.layer.addSublayer(bottomLine)
    }
    
    
    
    
}
