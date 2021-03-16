//
//  FirebaseHandlerProtocol.swift
//  AudioPlayer
//
//  Created by Titov, Evgeny on 16.03.21.
//

import Foundation

protocol FirebaseHandlerProtocol {
    init(_ value: Codable?)
    
    @discardableResult
    func read<T: Codable>(closure: ((T?) -> Void)?) -> Self
    func to(_ value: String) -> Self
    func autoUUID() -> Self
    func setValue() -> Self
}
