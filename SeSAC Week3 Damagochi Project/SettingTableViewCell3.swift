//
//  SettingTableViewCell3.swift
//  SeSAC Week3 Damagochi Project
//
//  Created by 이명진 on 2022/07/23.
//

import UIKit

class SettingTableViewCell3: UITableViewCell {
    
    static let identifier = "SettingTableViewCell3"
    
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var thirdTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        thirdImage.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        thirdTitleLabel.text = "데이터 초기화"
        thirdTitleLabel.textColor = .black
        thirdTitleLabel.font = .boldSystemFont(ofSize: 14)
        
        
        
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    

}
