

import UIKit


class ChoiceCollectionViewController: UICollectionViewController {
    
    static let identifier = "ChoiceCollectionViewController"
    
    var damagochiData = DamagochiInfo()
    
   
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "다마고치 선택하기"
        //view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
//        let nav = UINavigationController(rootViewController: self)
//        nav.title = "다마고치 선택하기"
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 16
        let width = (UIScreen.main.bounds.width - (spacing * 4)) / 3
        
        layout.itemSize = CGSize(width: width, height: width * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        
    }
    
}

extension ChoiceCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoiceCollectionViewCell.identifier, for: indexPath) as? ChoiceCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let data = damagochiData.damagochi[indexPath.row]

        cell.damagochiImage.image = UIImage(named: data.collectionImage)
        cell.nameLabel.text = data.name
        
        cell.damagochiImage.contentMode = .scaleAspectFit
        cell.nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        cell.nameLabel.textAlignment = .center
        cell.nameLabel.font = .boldSystemFont(ofSize: 14)
        cell.nameLabel.layer.borderWidth = 1
        cell.nameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        cell.nameLabel.layer.cornerRadius = 8
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return damagochiData.damagochi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: ChoicePopupViewController.identifier) as? ChoicePopupViewController else { return }
        let data = damagochiData.damagochi[indexPath.row]
        vc.damagochiDatas = data
        
        //let nav = UINavigationController(rootViewController: vc)
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: true)
        
    }
    
    
    
}
