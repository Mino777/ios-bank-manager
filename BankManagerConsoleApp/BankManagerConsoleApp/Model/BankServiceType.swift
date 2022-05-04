//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by 허윤영 on 02/05/2022.
//

import Foundation

enum BankServiceType: CaseIterable {
    case deposit
    case loan
}

extension BankServiceType: CustomStringConvertible {
    var description: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }
    
    var requiredTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

extension BankServiceType {
    static var randomBankService: BankServiceType {
        guard let bankService = self.allCases.randomElement() else {
            return .deposit
        }
        return bankService
    }
}