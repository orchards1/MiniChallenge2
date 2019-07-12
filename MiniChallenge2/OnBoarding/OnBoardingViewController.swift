//
//  OnBoardingViewController.swift
//  MiniChallenge2
//
//  Created by Michael Louis on 12/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController , UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides:[OnboardingSlide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
//        
//        slides = createSlides()
//        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
