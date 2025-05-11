// BalloonGame.swift
//
// Created by Remy Skelton
// Created on 2025-May-11
// Version 1.0
// Copyright (c) Remy Skelton. All rights reserved.
//
// This program simulates a simple balloon game. It creates balloons and a spike,
// moves them, prints their positions, and checks if the spike pops any balloons.

import Foundation

// Enum to represent balloon color
enum BalloonColor: String {
    case blue = "Blue"
    case pink = "Pink"
}

// This is the Balloon class for the Balloon Game
class Balloon {
    // Private variables to store position, color, ID, and pop state
    private var balloonXPosition: Int
    private var balloonYPosition: Int
    private var balloonColor: BalloonColor
    private let balloonID: Int
    private var isBalloonPopped: Bool = false

    // Constructor to initialize the balloon's attributes
    init(xPosition: Int, yPosition: Int, color: BalloonColor, id: Int) {
        self.balloonXPosition = xPosition
        self.balloonYPosition = yPosition
        self.balloonColor = color
        self.balloonID = id
    }

    // Getter for x position of the balloon
    func getXPosition() -> Int {
        return balloonXPosition
    }

    // Getter for y position of the balloon
    func getYPosition() -> Int {
        return balloonYPosition
    }

    // Getter for balloon color (as a string)
    func getBalloonColor() -> String {
        return balloonColor.rawValue
    }

    // Getter for balloon ID
    func getBalloonID() -> Int {
        return balloonID
    }

    // Getter to check if the balloon is popped
    func isBalloonPopped() -> Bool {
        return isBalloonPopped
    }

    // Method to move the balloon by a certain number of spaces
    func moveBalloonHorizontally(by xSpaces: Int, vertically ySpaces: Int) {
        balloonXPosition += xSpaces
        balloonYPosition += ySpaces
    }

    // Method to change the balloon's color
    func changeBalloonColor(to newColor: BalloonColor) {
        balloonColor = newColor
    }

    // Method to pop the balloon
    func popBalloon() {
        isBalloonPopped = true
        print("Balloon \(balloonID) has popped!")
    }
}

// This is the Spike class for the Balloon Game
class Spike {
    // Variable to store spike's x position
    private var spikeXPosition: Int
    // Constant y position for all spikes (ground level)
    static let groundYPosition = 0

    // Constructor to set the initial x position of the spike
    init(xPosition: Int) {
        self.spikeXPosition = xPosition
    }

    // Method to move the spike horizontally
    func moveSpikeHorizontally(by xSpaces: Int) {
        spikeXPosition += xSpaces
    }

    // Getter for spike's x position
    func getSpikeXPosition() -> Int {
        return spikeXPosition
    }

    // Method to check if a balloon is in line with the spike and on the ground, then pop it
    func attemptToPopBalloon(_ balloon: Balloon) {
        if balloon.getXPosition() == spikeXPosition &&
            balloon.getYPosition() == Spike.groundYPosition &&
            !balloon.isBalloonPopped() {
            balloon.popBalloon()
        } else {
            print("Balloon \(balloon.getBalloonID()) is safe!")
        }
    }
}

// Main game logic starts here

// Create two balloons with starting positions, colors, and IDs
let firstBalloon = Balloon(xPosition: 55, yPosition: 41, color: .blue, id: 1)
let secondBalloon = Balloon(xPosition: 25, yPosition: 85, color: .pink, id: 2)

// Create a spike at x = 0 (ground level)
let gameSpike = Spike(xPosition: 0)

// Print initial positions and colors of the balloons and spike
print("Balloon \(firstBalloon.getBalloonID()) is at (\(firstBalloon.getXPosition()), \(firstBalloon.getYPosition())) " +
      "and is \(firstBalloon.getBalloonColor())")
print("Balloon \(secondBalloon.getBalloonID()) is at (\(secondBalloon.getXPosition()), \(secondBalloon.getYPosition())) " +
      "and is \(secondBalloon.getBalloonColor())")
print("Spike is at x = \(gameSpike.getSpikeXPosition())\n")

// Move balloons by a certain amount
firstBalloon.moveBalloonHorizontally(by: 34, vertically: 12)
secondBalloon.moveBalloonHorizontally(by: 43, vertically: 14)

// Print positions after movement
print("Balloon \(firstBalloon.getBalloonID()) is now at (\(firstBalloon.getXPosition()), \(firstBalloon.getYPosition())) " +
      "and is \(firstBalloon.getBalloonColor())")
print("Balloon \(secondBalloon.getBalloonID()) is now at (\(secondBalloon.getXPosition()), \(secondBalloon.getYPosition())) " +
      "and is \(secondBalloon.getBalloonColor())")
print("Spike is at x = \(gameSpike.getSpikeXPosition())\n")

// Move the spike to the same x position as the first balloon
gameSpike.moveSpikeHorizontally(by: 89)

// Print new position of spike
print("After moving spike to Balloon \(firstBalloon.getBalloonID()):")
print("Spike is at x = \(gameSpike.getSpikeXPosition())\n")

// Move first balloon vertically to the ground (y = 0)
firstBalloon.moveBalloonHorizontally(by: 0, vertically: -53)

// Print final position before popping attempt
print("Balloon \(firstBalloon.getBalloonID()) is now at (\(firstBalloon.getXPosition()), \(firstBalloon.getYPosition())) " +
      "and is \(firstBalloon.getBalloonColor())")
print("Spike is at x = \(gameSpike.getSpikeXPosition())\n")

// Attempt to pop first and second balloons
gameSpike.attemptToPopBalloon(firstBalloon)
gameSpike.attemptToPopBalloon(secondBalloon)
