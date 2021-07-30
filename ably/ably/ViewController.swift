//
//  ViewController.swift
//  ably
//
//  Created by YOUNG on 2021/07/12.
//

import UIKit
import PagingKit

class ViewController: UIViewController {
    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    static var viewController: (UIColor) -> UIViewController = { (color) in
           let vc = UIViewController()
            vc.view.backgroundColor = color
            return vc
        }
    
//    var dataSource = [(menuTitle: "test1", vc: viewController(.red)), (menuTitle: "test2", vc: viewController(.blue)),(menuTitle: "test3", vc: viewController(.yellow))]
    
    var dataSource = [(menu: String, content: UIViewController)](){
        didSet{
            menuViewController.reloadData()
            contentViewController.reloadData()
        }
    }

    
    

    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // 라벨 글씨 두껍게
        let namelabel = label
        namelabel?.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
//

        tabBarController?.tabBar.tintColor = #colorLiteral(red: 1, green: 0.4136740565, blue: 0.4518144131, alpha: 1)
        tabBarController?.tabBar.unselectedItemTintColor = UIColor.lightGray
        
        
        
        // paging menu와 focussing 연결
        menuViewController.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
//        제공하는 메뉴라벨
//        menuViewController.register(type: TitleLabelMenuViewCell.self, forCellWithReuseIdentifier: "TitleLabelMenu")
        
//        제공하는 포커스뷰
//        menuViewController.registerFocusView(view: UnderlineFocusView())
        
        menuViewController.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        
        // load를 하겠다
        menuViewController.reloadData()
        contentViewController.reloadData()
        
        //메뉴가 정 가운데로 오게끔
        menuViewController.cellAlignment = .center
        
        dataSource = makeDataSource()
    }
        
    



    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self // <- set menu data source
            menuViewController.delegate = self // <- set menu delegate
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self // <- set content data source
            contentViewController.delegate = self // <- set content delegate
        }
    }
}

fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)]{
    let myMenuArray = ["투데이","BEST","NEW","핫딜"]
    
    return myMenuArray.map {
        let title = $0
        
        switch title {
        case "투데이":
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "image") as! imageVC
            return (menu: title, content: vc)
        case "BESt":
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "image") as! imageVC
            return (menu: title, content: vc)
        case "NEW":
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "image") as! imageVC
            return (menu: title, content: vc)
        case "핫딜":
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "image") as! imageVC
            return (menu: title, content: vc)
        default:
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "image") as! imageVC
            return (menu: title, content: vc)
            
            }
        }
    }






// 메뉴 데이터 소스
extension ViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return 100
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        // let cell = viewController.dequeueReusableCell(withReuseIdentifier: "TitleLabelMenu", for: index) as! TitleLabelMenuViewCell
        
        // 일반적인사용
        // cell.titleLabel.text = dataSource[index].menuTitle
        
        cell.titleLabel.text = dataSource[index].menu
        cell.titleLabel.textColor = .lightGray
        
        return cell
    }
}

// 컨텐트 데이터 소스
extension ViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        // 일반적인 사용
        // return dataSource[index].vc
        
        // 타이틀 switch 문
        return dataSource[index].content
    }
}


// 메뉴 컨트롤 델리게이트 확장
extension ViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

// 컨텐트 컨트롤 델리게이트 확장
extension ViewController: PagingContentViewControllerDelegate {
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        // 내용이 스크롤 되면 메뉴를 스크롤 한다.
        menuViewController.scroll(index: index, percent: percent, animated: false)
    }
}
