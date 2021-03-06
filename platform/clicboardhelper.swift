//
//  main.swift
//  clipboard-event
//
//  Created by Joonhee Lee on 2021/01/30.
//

import Foundation
import Cocoa

let pasteboard: NSPasteboard = NSPasteboard.general
var count: Int = pasteboard.changeCount
var saved: String = pasteboard.string(forType: .string) ?? "null"

repeat{
    usleep(500)
    if(count < pasteboard.changeCount && saved != pasteboard.string(forType: .string)){
        usleep(100)
        count = pasteboard.changeCount
        saved = pasteboard.string(forType: .string) ?? "null"
        print("CLIPBOARD_CHANGE")
        fflush(stdout)
    }
}while true
