//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 조민호 on 2022/04/27.
//

import Foundation

final class BankClerk {
    private let workSpeed: Double = 0.7
    private let name: String
    weak var delegate: BankDelegate?
    
    init(name: String) {
        self.name = name
    }
    
    func setDelegate(delegate: BankDelegate) {
        self.delegate = delegate
    }
    
    func work(_ queue: Queue<Client>) {
        let workQueue = DispatchQueue(label: name)
        
        let workItem = DispatchWorkItem {
            guard let client = queue.peek else {
                return
            }
            print("\(client.waitingNumber)번 고객 업무 시작")
            sleep(UInt32(self.workSpeed))
            print("\(client.waitingNumber)번 고객 업무 완료")
            
            queue.dequeue()
        }
                
        while queue.isEmpty == false {
            workQueue.async(execute: workItem)
        }
        
        endWork()
    }
    
    func endWork() {
        delegate?.close()
    }
}
