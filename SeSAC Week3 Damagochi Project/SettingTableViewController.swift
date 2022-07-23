

import UIKit


class SettingTableViewController: UITableViewController {
    
    static let identifier = "SettingTableViewController"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "설정"
//        self.navigationItem.titleView?.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
//        self.navigationItem.titleView?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
//        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        designUI()
        
        
    }
    
    func designUI() {
        
        
    }
    
    
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell2.identifier, for: indexPath) as! SettingTableViewCell2
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell3.identifier, for: indexPath) as! SettingTableViewCell3
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: SettingViewController.identifier) as? SettingViewController else { return }
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }

   
}
