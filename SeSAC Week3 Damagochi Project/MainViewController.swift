

import UIKit

class MainViewController: UIViewController {
    
    static var identifier = "MainViewController"
    
    var damagochiData = DamagochiInfo()
    
    var level = Damagochi.level
    var rice = Damagochi.rice
    var water = Damagochi.water
    
    var descriptionArr: [Double] = [1, 0, 0]
    
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
        riceTextField.keyboardType = .numberPad
        waterTextField.keyboardType = .numberPad
        
        
        
        
        
        
        
        
    }
    
    func designLabel() {
        descriptionLabel.text = "Lv\(Int(level)) • 밥알\(Int(rice))개 • 물방울\(Int(water))개"
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            
            
            
            
            
        } else if sender.tag == 1 {
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        
        
        guard let riceCount = riceTextField.text, Int(riceCount) != nil, !riceCount.isEmpty else { return }
        rice += Double(riceCount)!
        
        descriptionLabel.text = "Lv\(Damagochi.exp) • 밥알\(Int(rice))개 • 물방울\(Int(water))개"
        
        
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        guard let waterCount = waterTextField.text, Int(waterCount) != nil else { return }
        
        
        
        
        
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    
    

    
}
