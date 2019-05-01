//
//  Game.swift
//  RockPaperScissors
//
//  Created by 劉學逸 on 4/30/19.
//  Copyright © 2019 劉學逸. All rights reserved.
//

import Foundation

enum hand {
    case rock, paper, scissors, none
}
enum results {
    case win, lose, draw, none
}

class Game {
    var firstPlayerInput: hand
    var result: results
    init() {
        self.firstPlayerInput = hand.none
        self.result = results.none
    }
}

class onePlayerGame: Game {
    var comInput:hand
    func play() {
        let hands = [hand.rock:0, hand.paper:1, hand.scissors:2]
        let playerOne:Int? = hands[firstPlayerInput]
        guard let com = hands[comInput] else { return }

        if let playerOne = playerOne{
            switch playerOne - com {
            case 1, -2:
                self.result = results.win
            case -1, 2:
                self.result = results.lose
            case 0:
                self.result = results.draw
            default:
                print("com hand input error")
            }
        }
    }
    override init() {
        let HandArr = [hand.rock, hand.paper, hand.scissors]
        self.comInput = HandArr[Int.random(in: 0...2)]
        super.init()
    }
}
