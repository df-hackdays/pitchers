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
    var questions: [Question1] = []
    
    init?(document: Document) {
        self.quizName = document["quizName"] as? String ?? ""
        self.shortDescription = document["shortDescription"] as? String ?? ""
        self.points = document["points"] as? String ?? ""
        self.questions = document["questions"] as? [Question1] ?? []
    }
}

struct Question1: Codable {
    var question: String = ""
    var options: [String] = []
    var correctAnswer: String = ""
    var info: String = ""

}

class ManagePageViewController: UIPageViewController {
    var photos: [String] = []
    var photoName: [String] = []
  var currentIndex: Int!
  var quizArray: [Quiz] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Get a previously defined client
//    do {
//        let client = try Stitch.initializeDefaultAppClient(
//            withClientAppID: "digiknow-mcfek"
//        )
//        // Log-in using an Anonymous authentication provider from Stitch
//        // Then create a connection to a remote MongoDB instance
//        // Finally pull documents from the remote instance and add them to MongoDB Mobile
//        client.auth.login(withCredential: AnonymousCredential()) { result in
//            switch result {
//            case .success:
//                let atlasMongoClient = client.serviceClient(fromFactory: remoteMongoClientFactory, withName: "mongodb-atlas")
//
//                // let queryDoc = Document()
//
//                atlasMongoClient.db("digilearn").collection("digiquiz")
//                    .find(Document()).asArray({ result in
//                    switch result {
//                    case .success(let result):
//
//                        for eachDoc in result {
////                            var quiz = Quiz(document: eachDoc)
//                            if let quiz = Quiz(document: eachDoc) {
//                                self.quizArray.append(quiz)
//                            }
//
////                            if let type = eachDoc["questions"] {
////                                let x = Document(arrayLiteral: type)
////                                if let q = Question1(document: x) {
////                                    question1 = q
////                                    quiz?.questions.append(question1)
////                                }
////                            }
////                            if let quizName = eachDoc["quizName"] as? String {
////                                quiz.quizName = quizName
////                            }
//
////                            if let shortDescription = eachDoc["shortDescription"] as? String {
////                                quiz.shortDescription = shortDescription
////                            }
//                        }
//
//                        print(self.quizArray)
//
//                        for (index, _) in self.quizArray.enumerated() {
//                            self.photos.append("photo\(index + 1)")
//                        }
//                        if self.photos.count > 0 {
//                            self.goToNextStep()
//                        }
//                    case .failure(let error):
//                        print("failed to find documents: \(error)")
//                    }
//                    })
//            case .failure(let error):
//                print("failed to login: \(error)")
//            }
//        }
//    } catch _ {
//        print("error")
//    }

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
        page.quizName = self.quizArray[index].quizName
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

