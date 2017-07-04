# ObserverPatternExample
Swift내에서 Observer패턴에 대한 예제

> *옵저버 패턴 설명은 [wikipedia](https://ko.wikipedia.org/wiki/%EC%98%B5%EC%84%9C%EB%B2%84_%ED%8C%A8%ED%84%B4)를 토대로 작성하였습니다.*


## Observer 패턴
[옵저버 패턴(observer pattern)](https://ko.wikipedia.org/wiki/%EC%98%B5%EC%84%9C%EB%B2%84_%ED%8C%A8%ED%84%B4)은 객체의 상태 변화를 관찰하는 관찰자들, 즉 옵저버들의 목록을 객체에 등록하여 상태 변화가 있을 때마다 메서드 등을 통해 객체가 직접 목록의 각 옵저버에게 통지하도록 하는 디자인 패턴이다.

## Example
각 옵저버를 등록 및 해제할 수 있는 protocol 생성
```
protocol Observable {
    func addObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
}

protocol Observer: class {
    func update(_ temp: Float, density: Float)
}
```

옵저버의 등록 및 해제를 실제로 담당하는 클래스 생성
```
class Observation: Observable {
    var observers = [Observer]()

    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        observers = observers.filter({ $0 !== observer })
    }
}
```

미세먼지 농도를 측정하여 알림을 보내는 클래스
```
class DustMeter: Observation {
    var temperature: Float = 0.0
    var density: Float = 0.0

    func notify() {
        for observer in observers {
            observer.update(temperature, density: density)
        }
    }
}
```

미세면지 농도 상태를 측정하는 클래스
```
class User: Observer {

    var name: String = ""

    func update(_ temp: Float, density: Float) {
        print("name: \(name), temp: \(temp) density: \(density)")
    }

    init(name: String) {
        self.name = name
    }
}
```

위의 구성을 토대로 구현한 Controller
```
class ViewController: UIViewController {
    let dustMeter = DustMeter()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 관찰자
        let user1 = User(name: "Tom")
        let user2 = User(name: "Sam")
        let _ = User(name: "Kim")

        // 알림을 받을 유저 추가
        dustMeter.addObserver(user1)
        dustMeter.addObserver(user2)

        // 알림을 더이상 받지 않을 유저
        dustMeter.removeObserver(user1)
    }
}

extension ViewController {
    @IBAction func clickedButton() {
        dustMeter.temperature = 32
        dustMeter.density = 80


        dustMeter.notify()
    }
}
```

## 
자세한 설명은 블로그 참고
https://magicmon.github.io/2017/07/04/Observer-Pattern
