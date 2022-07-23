

import UIKit


struct Damagochi {
    enum Characters: Int {
        case ddageum = 1, bangsil, banjjack
    }
    
    var image: UIImage?
    var name: String
    var introduce: String
    var description: [String] = []
    static var rice: Int = 0
    static var water: Int = 0
    static var level: Int = 1
    
    static var exp: Double {
        get {
            let rice = Double(rice) / Double(5)
            let water = Double(water) / Double(2)
            
            let result = rice + water
            return result
            
        }
        
    }
   
}


struct DamagochiInfo {
    
    var damagochi: [Damagochi] = [
        
        Damagochi(image: UIImage(named: "1-\(Damagochi.level)"), name: "따끔따끔 다마고치", introduce: "저는 선인장 다마고치 입니당.\n키는 2cm, 몸무게는 150g이에요.\n성격은 소심하지만 마음은 따뜻해요.\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", description: []),
        Damagochi(image: UIImage(named: "\(Damagochi.Characters.RawValue.self)-\(Damagochi.level)"), name: "방실방실 다마고치", introduce: "저는 방실방실 다마고치 입니당.\n키는 100km 몸무게는 150톤이에용!\n성격은 화끈하고 따뜻하답니당~!\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", description: []),
        Damagochi(image: UIImage(named: "\(Damagochi.Characters.RawValue.self)-\(Damagochi.level)"), name: "반짝반짝 다마고치", introduce: "저는 반짝반짝 다마고치 입니당.\n키는 50km 몸무게는 100톤이에용!\n성격은 따뜻하지만 화나면 무서워용!\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", description: [])
        
    ]
}











