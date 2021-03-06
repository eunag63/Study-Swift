//
//  ViewController.swift
//  prTab
//
//  Created by 김은아 on 2021/09/08.
//

import Tabman
import Pageboy

class ViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
        let vc4 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController4") as! ViewController4
        let vc5 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController5") as! ViewController5
        let vc6 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController6") as! ViewController6
        
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        viewControllers.append(vc6)
        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        
        
        bar.layout.transitionStyle = .snap // Customize
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 50.0, bottom: 0.0, right: 20.0)
        
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = .orange
        }
        
        bar.indicator.weight = .light
        bar.indicator.overscrollBehavior = .bounce
        
        
        // Add to view
        addBar(bar, dataSource: self, at: .top)
    }
    
   
    
}

//탭에 보여질 글자 관리
extension ViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
//        let item = TMBarItem(title: "")
//        item.title = "Page \(index)"
//        item.image = UIImage(named: "image.png")
//        // ↑↑ 이미지는 이따가 탭바 형식으로 보여줄 때 사용할 것이니 "이미지가 왜 있지?" 하지말고 넘어가주세요.
//
//        return item
//
        
        switch index {
                case 0:
                    return TMBarItem(title: "전체")
                case 1:
                    return TMBarItem(title: "거실")
                case 2:
                    return TMBarItem(title: "주방")
                case 3:
                    return TMBarItem(title: "화장실")
                case 4:
                    return TMBarItem(title: "문/창문")
                default:
                    let title = "Page \(index)"
                    return TMBarItem(title: title)
                }

    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

