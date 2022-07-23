//
//  SettingTableViewCell2.swift
//  SeSAC Week3 Damagochi Project
//
//  Created by 이명진 on 2022/07/23.
//

import UIKit

class SettingTableViewCell2: UITableViewCell {
    
    static let identifier = "SettingTableViewCell2"
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        secondImage.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        secondTitleLabel.text = "다마고치 변경하기"
        secondTitleLabel.textColor = .black
        secondTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
