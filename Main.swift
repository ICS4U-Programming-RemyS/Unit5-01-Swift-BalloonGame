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
    private var xPosition: Int
    private var yPosition: Int
    private var balloonColor: BalloonColor
    private let id: Int
    private var isPopped: Bool = false

    // Constructor to initialize the balloon's attributes
    init(x: Int, y: Int, color: BalloonColor, id: Int) {
        self.xPosition = x
        self.yPosition = y
        self.balloonColor = color
        self.id = id
    }

    // Getter for x position
    func getXPosition() -> Int {
        return xPosition
    }

    // Getter for y position
    func getYPosition() -> Int {
        return yPosition
    }

    // Getter for balloon color (as a string)
    func getBalloonColor() -> String {
        return balloonColor.rawValue
    }

    // Getter for balloon ID
    func getId() -> Int {
        return id
    }

    // Getter to check if balloon is popped
    func getIsPopped() -> Bool {
        return isPopped
    }

    // Method to move the balloon by a certain number of spaces
    func moveBalloon(xSpaces: Int, ySpaces: Int) {
        xPosition += xSpaces
        yPosition += ySpaces
    }

    // Method to change the balloon's color
    func changeColor(newColor: BalloonColor) {
        balloonColor = newColor
    }

    // Method to pop the balloon
    func pop() {
        isPopped = true
        print("Balloon \(id) has popped!")
    }
}

// This is the Spike class for the Balloon Game
class Spike {
    // Variable to store spike's x position
    private var xPosition: Int
    // Constant y position for all spikes (ground level)
    static let Y_POSITION = 0

    // Constructor to set the initial x position of the spike
    init(x: Int) {
        self.xPosition = x
    }

    // Method to move the spike horizontally
    func moveSpikeHorizontally(xSpaces: Int) {
        xPosition += xSpaces
    }

    // Getter for x position
    func getXPosition() -> Int {
        return xPosition
    }

    // Method to check if a balloon is in line with the spike and on the ground, then pop it
    func popBalloon(_ balloon: Balloon) {
        if balloon.getXPosition() == xPosition &&
            balloon.getYPosition() == Spike.Y_POSITION &&
            !balloon.getIsPopped() {
            balloon.pop()
        } else {
            print("Balloon \(balloon.getId()) is safe!")
        }
    }
}

// Main game logic starts here

// Create balloonA and balloonB with starting positions, colors, and IDs
let balloonA = Balloon(x: 55, y: 41, color: .blue, id: 1)
let balloonB = Balloon(x: 25, y: 85, color: .pink, id: 2)

// Create a spike at x = 0
let spike = Spike(x: 0)

// Print initial positions and colors of balloons and spike
print("Balloon A is at (\(balloonA.getXPosition()), \(balloonA.getYPosition())) and is \(balloonA.getBalloonColor())")
print("Balloon B is at (\(balloonB.getXPosition()), \(balloonB.getYPosition())) and is \(balloonB.getBalloonColor())")
print("Spike is at x = \(spike.getXPosition())\n")

// Move balloons by a certain amount
balloonA.moveBalloon(xSpaces: 34, ySpaces: 12)
balloonB.moveBalloon(xSpaces: 43, ySpaces: 14)

// Print positions after movement
print("Balloon A is at (\(balloonA.getXPosition()), \(balloonA.getYPosition())) and is \(balloonA.getBalloonColor())")
print("Balloon B is at (\(balloonB.getXPosition()), \(balloonB.getYPosition())) and is \(balloonB.getBalloonColor())")
print("Spike is at x = \(spike.getXPosition())\n")

// Move spike to the same x position as balloonA
spike.moveSpikeHorizontally(xSpaces: 89)

// Print new position of spike
print("After moving spike to Balloon A:")
print("Spike is at x = \(spike.getXPosition())\n")

// Move balloonA vertically to the ground (y = 0)
balloonA.moveBalloon(xSpaces: 0, ySpaces: -53)

// Print final position before popping attempt
print("Balloon A is at (\(balloonA.getXPosition()), \(balloonA.getYPosition())) and is \(balloonA.getBalloonColor())")
print("Spike is at x = \(spike.getXPosition())\n")

// Attempt to pop balloonA and balloonB
spike.popBalloon(balloonA)
spike.popBalloon(balloonB)
