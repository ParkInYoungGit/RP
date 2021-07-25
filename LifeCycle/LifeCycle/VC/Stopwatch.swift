//
//  Stopwatch.swift
//  LifeCycle
//
//  Created by YOUNG on 2021/07/20.
//

import Foundation

class Stopwatch: NSObject {
  var counter: Double
  var timer: Timer
  
  override init() {
    counter = 0.0
    timer = Timer()
  }
}
