/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import StitchCore
import StitchLocalMongoDBService
import StitchRemoteMongoDBService
import MongoSwiftMobile // required for BSON Documents

struct Quiz: Codable {
    var quizName: String = ""
    var shortDescription: String = ""
    var points: String = ""
    var q1: String = ""
    var options1: String = ""
    var a1: String = ""
    var q2: String = ""
    var options2: String = ""
    var a2: String = ""
    var q3: String = ""
    var options3: String = ""
    var a3: String = ""
    
    init?(document: Document) {
        self.quizName = document["quizName"] as? String ?? ""
        self.shortDescription = document["shortDescription"] as? String ?? ""
        self.points = document["points"] as? String ?? ""
        
        self.a1 = document["a1"] as? String ?? ""
        self.options1 = document["options1"] as? String ?? ""
        self.q1 = document["q1"] as? String ?? ""
        
        self.a2 = document["a2"] as? String ?? ""
        self.options2 = document["options2"] as? String ?? ""
        self.q2 = document["q2"] as? String ?? ""
        
        self.a3 = document["a3"] as? String ?? ""
        self.options3 = document["options3"] as? String ?? ""
        self.q3 = document["q3"] as? String ?? ""
    }
}

class ManagePageViewController: UIPageViewController {
    var photos: [String] = []
    var photoName: [String] = []
  var currentIndex: Int!
  var quizArray: [Quiz] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = self
    self.navigationItem.setHidesBackButton(true, animated: false)
    self.title = "CodeTrek"
    
    goToNextStep()
    
  }
  
    func goToNextStep() {
        
        DispatchQueue.main.async {
            // 1
            if let viewController = self.viewPhotoCommentController(self.currentIndex ?? 0) {
                let viewControllers = [viewController]
                // 2
                self.setViewControllers(viewControllers,
                                   direction: .forward,
                                   animated: false,
                                   completion: nil)
            }
        }
    }
    
  func viewPhotoCommentController(_ index: Int) -> PhotoCommentViewController? {
    if let storyboard = storyboard,
      let page = storyboard.instantiateViewController(withIdentifier: "PhotoCommentViewController") as? PhotoCommentViewController {
      page.photoName = photos[index]
      page.photoIndex = index
        page.quiz = self.quizArray[index]
      return page
    }
    return nil
  }
} 

//MARK: implementation of UIPageViewControllerDataSource
extension ManagePageViewController: UIPageViewControllerDataSource {
  // 1
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    if let viewController = viewController as? PhotoCommentViewController,
      let index = viewController.photoIndex,
      index > 0 {
      return viewPhotoCommentController(index - 1)
    }
    
    return nil
  }
  
  // 2
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    if let viewController = viewController as? PhotoCommentViewController,
      let index = viewController.photoIndex,
      (index + 1) < photos.count {
      return viewPhotoCommentController(index + 1)
    }
    
    return nil
  }
  
  // MARK: UIPageControl
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return photos.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return currentIndex ?? 0
  }
}

