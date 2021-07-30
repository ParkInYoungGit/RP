//
//  imageVC.swift
//  ably
//
//  Created by YOUNG on 2021/07/15.
//

import Foundation

import UIKit

class imageVC: UIViewController{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var numberLabel: UILabel!
    var images = ["main1.jpeg","main2.jpeg","main3.jpeg","main4.jpeg","main5.jpeg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                pageControl.numberOfPages = images.count
                pageControl.currentPage = 0 // 현재 페이지
        
                imgView.image = UIImage(named: images[0])
                        
                makeSingleTouch()
                numberLabel.text = " \(pageControl.currentPage+1) / \(images.count) "
                numberLabel.layer.cornerRadius = 8
                numberLabel.layer.masksToBounds = true
    }
    
    
        func makeSingleTouch(){
            // swipe 명령
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(imageVC.responseToSwipeGesture(_:)))
                    swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
                    self.view.addGestureRecognizer(swipeLeft)
    
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(imageVC.responseToSwipeGesture(_ :)))
                    swipeRight.direction = UISwipeGestureRecognizer.Direction.right
                    self.view.addGestureRecognizer(swipeRight)
        }



     
        @IBAction func pageChange(_ sender: UIPageControl) {
            imgView.image = UIImage(named: images[pageControl.currentPage])
            numberLabel.text = "\(pageControl.currentPage+1) / \(images.count) "
        }
    
        @objc func responseToSwipeGesture(_ gesture: UISwipeGestureRecognizer){
            // 발생한 이벤트가 각 방향의 스와이프 이벤트라면
            // pageControl이 가르키는 현재 페이지에 해당하는 이미지를 imageView에 할당
            if let swipeGesture = gesture as? UISwipeGestureRecognizer{
                switch swipeGesture.direction{
                    case UISwipeGestureRecognizer.Direction.right:
                    pageControl.currentPage -= 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                    numberLabel.text = " \(pageControl.currentPage+1) / \(images.count) "
                    case UISwipeGestureRecognizer.Direction.left:
                    pageControl.currentPage += 1
                    imgView.image = UIImage(named: images[pageControl.currentPage])
                    numberLabel.text = " \(pageControl.currentPage+1) / \(images.count) "
                    default:
                        break
                }
            }
        }
}
