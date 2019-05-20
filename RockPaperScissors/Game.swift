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
    var secondPlayerInput: hand
    var result: results
    func play() {
        let hands = [hand.rock:0, hand.paper:1, hand.scissors:2]
        let firstPlayer = hands[firstPlayerInput]
        let secondPlayer = hands[secondPlayerInput]
        if let firstPlayer = firstPlayer, let secondPlayer = secondPlayer {
            switch firstPlayer - secondPlayer {
            case 1, -2:
                self.result = results.win
            case -1, 2:
                self.result = results.lose
            case 0:
                self.result = results.draw
            default:
                print("input error")
            }
            }
        }
    init() {
        self.firstPlayerInput = hand.none
        self.secondPlayerInput = hand.none
        self.result = results.none
    }
}

class onePlayerGame: Game {
    override init() {
        super.init()
        let HandArr = [hand.rock, hand.paper, hand.scissors]
        self.secondPlayerInput = HandArr[Int.random(in: 0...2)]
    }
}
