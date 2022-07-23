//
//  SettingTableViewCell.swift
//  SeSAC Week3 Damagochi Project
//
//  Created by 이명진 on 2022/07/23.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    static let identifier = "SettingTableViewCell"
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    
    @IBOutlet weak var firstDetailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        firstImage.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        firstTitleLabel.text = "내 이름 설정하기"
        firstTitleLabel.textColor = .black
        firstTitleLabel.font = .boldSystemFont(ofSize: 14)
        firstDetailLabel.text = "\(Damagochi.userName)"
        firstDetailLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
