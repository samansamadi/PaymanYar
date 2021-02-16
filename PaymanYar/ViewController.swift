//
//  ViewController.swift
//  PaymanYar
//
//  Created by Saman Samadi on 10/29/1399 AP.
//  Copyright © 1399 TDAApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var cards:[UIImageView] = []
    var slides:[Slider] = []
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var card13: UIImageView!
    @IBOutlet weak var card12: UIImageView!
    @IBOutlet weak var card11: UIImageView!
    @IBOutlet weak var card10: UIImageView!
    @IBOutlet weak var card9: UIImageView!
    @IBOutlet weak var card8: UIImageView!
    @IBOutlet weak var card7: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var sample: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShadows()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        sample.isUserInteractionEnabled = true
        sample.addGestureRecognizer(tapGestureRecognizer)
        
        slides=createSlides()
        scrollView.delegate = self
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y>0 {
            scrollView.contentOffset.y = 0
        }
        
        /*
         
         
            let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
            pageControl.currentPage = Int(pageIndex)
            
            let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
            let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
            
            // vertical
            let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
            let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
            
            let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
            let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
            */
            
            /*
             * below code changes the background color of view on paging the scrollview
             */
    //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
       
        }
        
        
    func setupSlideScrollView(slides : [Slider]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        scrollView.isDirectionalLockEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func createSlides() -> [Slider] {

        let slide1:Slider = Bundle.main.loadNibNamed("Slider", owner: self, options: nil)?.first as! Slider
        slide1.adImageView.image=UIImage(named: "ad")
        
        let slide2:Slider = Bundle.main.loadNibNamed("Slider", owner: self, options: nil)?.first as! Slider
        slide2.adImageView.image=UIImage(named: "ad2")
        
        return [slide1, slide2]
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIStackView
        
        print("Clicked card1")
        // Your action
    }

    private func setShadows(){
        
        cards.append(card1)
        cards.append(card2)
        cards.append(card3)
        cards.append(card4)
        cards.append(card5)
        cards.append(card6)
        cards.append(card7)
        cards.append(card8)
        cards.append(card9)
        cards.append(card10)
        cards.append(card11)
        cards.append(card12)
        cards.append(card13)
        
        for card in cards{
            card.layer.cornerRadius = 20.0
            card.layer.shadowColor = UIColor.gray.cgColor
            card.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            card.layer.shadowRadius = 2
            card.layer.shadowOpacity = 0.7
        }
        
    }

}

