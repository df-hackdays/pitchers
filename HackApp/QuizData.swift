//
//  QuizData.swift
//  HackApp
//
//  Created by Nirmal Patel on 2018-09-29.
//  Copyright © 2018 Nirmal Patel. All rights reserved.
//

import Foundation

final class QuizData {
    
    static var quizArray: [Quiz] = []
    static var photoArray: [String] = []
    
    static func saveQuizData(quizes: [Quiz], photos: [String]) {
        quizArray = quizes
        photoArray = photos
    }
}
