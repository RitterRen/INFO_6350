//
//  sendMsgProtocal.swift
//  Assignment4
//
//  Created by 任耀坤 on 3/28/22.
//

import Foundation

protocol SendMessageDelegate {
    func sendWelcomeMsg(message: String)
}

protocol SendFirstAndLastNameDelegate{
    func setFirstAndLastName(firstName: String, lastName: String)
    func setWelcomeMsg(welcomMsg: String)
}

