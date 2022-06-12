//
//  StopwatchPageViewController.swift
//  Clock
//
//  Created by 임윤휘 on 2022/05/30.
//

import UIKit

class StopwatchPageViewController: UIPageViewController {
    lazy var pages: [UIViewController] = {
        return [
            getViewControllerInstance("TimeLabelViewController"),
            getViewControllerInstance("ClockImageViewController")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        setViewControllers([pages[0]], direction: .forward, animated: true)
    }
    
    //MARK: - Function
    private func getViewControllerInstance(_ identifier: String) -> UIViewController{
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {return UIViewController()}
        
        return viewController
    }
}

//MARK: - UIPageViewController
extension StopwatchPageViewController: UIPageViewControllerDataSource {
    //이전 화면에 해당하는 뷰 컨드롤러 반환
    //viewController는 이동 전 현재 페이지를 의미한다
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil} //현재 페이지의 인덱스 구하기
        
        let beforeIndex = currentIndex - 1
        if beforeIndex < 0 {return nil} //현재 페이지가 첫 번째일 경우
        
        let viewControllerBefore = pages[beforeIndex]
        
        return viewControllerBefore
        
        //맨 처음 before, after 메서드가 여러번 호출되어 전역변수로 currentPageIndex를 저장해 사용하면 인덱스 오류 발생
        //인자로 받을 수 있는 현재 페이지 뷰 컨트롤러를 확인 사용하면 정확도가 높다
        //O(n) 시간 소요
    }
    
    //다음 화면에 해당하는 뷰 컨트롤러 반환
    //viewController는 이동 전 현재 페이지를 의미한다
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil} //현재 페이지의 인덱스 구하기
        
        let afterIndex = currentIndex + 1
        if afterIndex >= pages.count {return nil} //현재 페이지가 마지막일 경우
        let viewControllerAfter = pages[afterIndex]
        
        return viewControllerAfter
    }
    
    //페이지인디케이터에 반영될 페이지 개수 설정
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    //페이지 인디케이터에 반영될 선택 인덱스, 해당 선택 인덱스를 기준으로 before, after 인덱스 이동
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
