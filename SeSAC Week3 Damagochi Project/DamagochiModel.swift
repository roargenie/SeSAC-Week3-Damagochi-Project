

import UIKit


struct Damagochi {
    enum Characters: Int, CaseIterable {
        case ddageum = 1, bangsil, banjjack
        case none = 0
    }
    
    static var userName: String = "대장"
    
    var id: Int
    //    var image: UIImage?
    var name: String
    var introduce: String
    var rice: Int
    var water: Int
    
    var level: Int {
        let result = Int((Double(rice) / 5.0 + Double(water) / 2.0) / 10)
        if result < 2 {
            return 1
        } else if result >= 2 && result < 10 {
            return result
        } else {
            return 10
        }
    }
    
    var description: String {
        get {
            return "LV\(level) • 밥알\(rice)개 • 물방울\(water)"
        }
    }
    
    var mainImage: String {
        
        switch id {
        case 0:
            return "noImage"
        case 1:
            switch level {
            case 0..<2:
                return "\(id)-1"
            case 2...10:
                return "\(id)-\(level)"
            default:
                return ""
            }
        case 2:
            switch level {
            case 0..<2:
                return "\(id)-1"
            case 2...10:
                return "\(id)-\(level)"
            default:
                return ""
            }
        case 3:
            switch level {
            case 0..<2:
                return "\(id)-1"
            case 2...10:
                return "\(id)-\(level)"
            default:
                return ""
            }
        default:
            return ""
        }
        
//        for i in Characters.allCases {
//            if i.rawValue == 1 {
//                switch level {
//                case 0..<2:
//                    return "\(id)-1"
//                case 2...10:
//                    return "\(id)-\(level)"
//                default:
//                    break
//                }
//            } else if i.rawValue == 2 {
//                switch level {
//                case 0..<2:
//                    return "\(id)-1"
//                case 2...10:
//                    return "\(id)-\(level)"
//                default:
//                    break
//                }
//            } else if i.rawValue == 3 {
//                switch level {
//                case 0..<2:
//                    return "\(id)-1"
//                case 2...10:
//                    return "\(id)-\(level)"
//                default:
//                    break
//                }
//            } else if i.rawValue == 0 {
//                return "noImage"
//            }
//        }
//        return "noImage"
    }
        
    var collectionImage: String {
        switch id {
        case 0:
            return "noImage"
        case 1:
            return "\(id)-6"
        case 2:
            return "\(id)-6"
        case 3:
            return "\(id)-6"
        default:
            return ""
            
        }
        // 왜 이렇게 돌리면 noImage가 이미지가 안들어가는거지..?
//        for i in Characters.allCases {
//            if i.rawValue == 1 {
//                return "\(id)-6"
//            } else if i.rawValue == 2 {
//                return "\(id)-6"
//            } else if i.rawValue == 3 {
//                return "\(id)-6"
//            } else if i.rawValue == 0 {
//                return "noImage"
//            }
//        }
//        return "noImage"
    }
    
    
}


struct DamagochiInfo {
    
    var damagochi: [Damagochi] = [
        Damagochi(id: Damagochi.Characters.ddageum.rawValue, name: "따끔따끔 다마고치", introduce: "저는 선인장 다마고치 입니당.\n키는 2cm, 몸무게는 150g이에요.\n성격은 소심하지만 마음은 따뜻해요.\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.bangsil.rawValue, name: "방실방실 다마고치", introduce: "저는 방실방실 다마고치 입니당.\n키는 100km 몸무게는 150톤이에용!\n성격은 화끈하고 따뜻하답니당~!\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.banjjack.rawValue, name: "반짝반짝 다마고치", introduce: "저는 반짝반짝 다마고치 입니당.\n키는 50km 몸무게는 100톤이에용!\n성격은 따뜻하지만 화나면 무서워용!\n열심히 잘 먹고 잘 클 자신은 있답니당!\n반가워요 대장님!", rice: 0, water: 0),
        
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0),
        Damagochi(id: Damagochi.Characters.none.rawValue, name: "준비중이에요", introduce: "저를 키워주실 건가용??", rice: 0, water: 0)
        
    ]
    
}









