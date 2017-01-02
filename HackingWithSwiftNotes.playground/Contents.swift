//: Playground - noun: a place where people can play

import UIKit

var str = "Celia is learning "

for _ in 1...5 {
    str += "Swift "
}
print(str)

var counter = 0
while true {
    print("counter is now \(counter)")
    counter += 1
    if counter > 5 {
        break
    }
}

//unwrap optional value if let unwrappedValue = value { } else { }
//two places where you will use implicitly unwrapped optional the most: Apple's API with code pre-dates Swift, and UIKit elements that are declared up front and used after they are created

func albumReleased(year: Int) -> String? {
    switch year {
    case 2006:
        return "Taylor Swift"
    case 2008:
        return "Fearless"
    case 2010:
        return "Speak now"
    case 2012:
        return "Red"
    case 2014:
        return "1989"
    default:
        return nil
    }
}

let album2006 = albumReleased(year: 2006)?.uppercased()

//nil coalescing operator
let album2008 = albumReleased(year: 2008) ?? "Unknown"

enum WeatherType {
    case sun, cloud, rain, wind(speed: Int), snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch  weather {
    case .sun:
        return nil
    case .cloud, .rain, .snow:
        return "hater"
    case .wind(let speed) where speed < 100:
        return "move faster"
    default:
        return nil
    }
}

getHaterStatus(weather: WeatherType.wind(speed: 5))

struct Person {
    static var writtenInSwift = "A Person Struct created using swift"
    var clothes: String {
        willSet {
            updateUI(message: "I'm changing from \(clothes) to \(newValue)")
        }
        didSet {
            updateUI(message: "\(clothes) changed from \(oldValue)")
        }
    }
    var shoes: String
    var age: Int
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    func updateUI(message: String) {
        print(message)
    }
}

var adam = Person(clothes: "T-shirts", shoes: "sneakers", age: 22)
let billy = Person(clothes: "dress", shoes: "heels", age: 35)

adam.clothes = " Lace-up Sweater"
adam.clothes = "Cupcake dress"

Person.writtenInSwift


/*how classes are different from struct:
 no automatic memberwise initializer
 class behaviors: inheritance, polymorphism etc
 copy by reference vs. copy by value
 property observers: willSet(newValue), didSet(oldValue)
 */
class Album {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func  getPerformance() -> String {
        return "The studio album sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swoft", studio: "The castles studio")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    }else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

//closures: a data type holds lines of code, can be passed as parameters or stored as property, also capture(take copies) of values used inside
let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

//Note: print() is a variadic function, optional extra parameters avaliable: separator, terminator
print(1, 2, 3, 4, 5, separator: "-")
print("message", terminator: "")

//Note: assert() crashes your app during debugging, when shipped to App Store,l all assertions are disabled. assert() takes two params: check conditions, print messages.
assert(1 == 2, "Maths failure!")

//Note: View debugging: under debug menu choose View Debugging - Show View Frames, capture view frames

























