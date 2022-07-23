

import UIKit

class ChoicePopupViewController: UIViewController {
    
    var damagochiDatas: Damagochi?
    
    static let identifier = "ChoicePopupViewController"
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var damagochiImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var aceptButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = damagochiDatas?.name
        damagochiImage.image = damagochiDatas?.image
        descriptionLabel.text = damagochiDatas?.introduce
        
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        
        view.backgroundColor = #colorLiteral(red: 0.09957252358, green: 0.09957252358, blue: 0.09957252358, alpha: 0.5)
        mainView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        lineView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        lineView.layer.borderWidth = 1
        
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabel.font = .boldSystemFont(ofSize: 14)
        nameLabel.layer.cornerRadius = 8
        nameLabel.textAlignment = .center
        
        descriptionLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14)
        
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        cancelButton.backgroundColor = .systemGray5
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        cancelButton.tag = 0
        
        aceptButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        aceptButton.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        aceptButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        aceptButton.tag = 1
        
        cancelButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    @objc func buttonTapped() {
        self.dismiss(animated: true)
    }
    
    
}
