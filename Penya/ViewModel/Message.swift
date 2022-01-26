//
//  Message.swift
//  Penya
//
//  Created by Zachary Coriarty on 1/25/22.
//

import SwiftUI

enum MessageType : String {
    case sent
    case received
}

struct Message {
    let text: String
    let type: MessageType
    let created: String
}
