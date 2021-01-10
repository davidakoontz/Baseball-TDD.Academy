//
//  RingBuffer.swift
//  Baseball
//
//  Created by David on 1/9/21.
//

import Foundation

// see: https://www.izixia.cn/swift-algorithm-club-cn/Ring%20Buffer/
//
//var buffer = RingBuffer<Int>(count: 5)
//
//buffer.write(123)
//buffer.write(456)
//buffer.write(789)
//buffer.write(666)
//
//buffer.read()   // 123
//buffer.read()   // 456
//buffer.read()   // 789
//
//buffer.write(333)
//buffer.write(555)
//
//buffer.read()   // 666
//buffer.read()   // 333
//buffer.read()   // 555
//buffer.read()   // nil

public struct RingBuffer<T> {
  fileprivate var array: [T?]
  fileprivate var readIndex = 0
  fileprivate var writeIndex = 0

  public init(count: Int) {
    array = [T?](repeating: nil, count: count)
  }

  public mutating func write(_ element: T) -> Bool {
    if !isFull {
      array[writeIndex % array.count] = element
      writeIndex += 1
      return true
    } else {
      return false
    }
  }

  public mutating func read() -> T? {
    if !isEmpty {
      let element = array[readIndex % array.count]
      readIndex += 1
      return element
    } else {
      return nil
    }
  }

  fileprivate var availableSpaceForReading: Int {
    return writeIndex - readIndex
  }

  public var isEmpty: Bool {
    return availableSpaceForReading == 0
  }

  fileprivate var availableSpaceForWriting: Int {
    return array.count - availableSpaceForReading
  }

  public var isFull: Bool {
    return availableSpaceForWriting == 0
  }
}
