//
//  HttpErrors.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 21/06/22.
//

import Foundation

/*
 Respostas de informação (100-199),
 Respostas de sucesso (200-299),
 Redirecionamentos (300-399)
 Erros do cliente (400-499)
 Erros do servidor (500-599).
 */

enum HttpError : CaseIterable, Error {
     case informational
     case success
     case redirection
     case clientError
     case serverError
     case undefined
    func obtainError(errorCode : Int) -> HttpError {
        if (100..<200).contains(errorCode) {return HttpError.informational}
        if (200..<300).contains(errorCode) {return HttpError.success}
        if (300..<400).contains(errorCode) {return HttpError.informational}
        if (400..<500).contains(errorCode) {return HttpError.informational}
        if (500..<600).contains(errorCode) {return HttpError.informational}
        return HttpError.undefined
    }
}
