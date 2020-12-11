//
//  DiamondView.swift
//  Baseball-TDD
//
//  Created by David on 11/4/20.
//
//  See:  https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui

import SwiftUI

struct FieldView: View {
    var body: some View {
        BallField()
            .stroke(Color.blue, lineWidth: 1)
            .frame(width: 100, height: 100)
        
    }
    
}

struct BallField: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startAngle: Angle = Angle.degrees(-45)
        let endAngle: Angle = Angle.degrees(45)
        let clockwise: Bool = true
        
        // Diamond
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))      // top point
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))   // left center
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))   // bottom
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))   // right point
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))   // top point

        // In-Field line
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))      //  start point
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                    radius: rect.height * 1.3,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd, clockwise: !clockwise)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))   // home plate point

        // Out-Field line the Fence
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))      //  start point
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                    radius: rect.height * 2,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd, clockwise: !clockwise)
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))   // home plate point

                
        // a baseball field path
        return path

    }
}
    



struct FieldView_Previews: PreviewProvider {
    static var previews: some View {
        FieldView()
    }
}

// Unused - Geometry

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))      // top point
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))   // left bottom
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))   // right bottom
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))   // top point

        return path
    }
}

struct Square: Shape {
    func path(in rect: CGRect) -> Path {
        var square = Path()

        square.move(to: CGPoint(x: rect.minX, y: rect.minY))      // top left point
        square.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))   // left bottom
        square.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))   // right bottom
        square.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))   // right top
        square.addLine(to: CGPoint(x: rect.minX, y: rect.minY))   // top left point

        return square
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var diamond = Path()

        diamond.move(to: CGPoint(x: rect.midX, y: rect.minY))      // top point
        diamond.addLine(to: CGPoint(x: rect.minX, y: rect.midY))   // left center
        diamond.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))   // bottom
        diamond.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))   // right point
        diamond.addLine(to: CGPoint(x: rect.midX, y: rect.minY))   // top point

        
        return diamond
    }
}


struct OutFieldLine: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                    radius: rect.height * 2,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd,
                    clockwise: !clockwise)

        return path
    }
}


struct InFieldLine: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.maxY),
                    radius: rect.height * 1.3,
                    startAngle: modifiedStart,
                    endAngle: modifiedEnd,
                    clockwise: !clockwise)

        return path
    }
}
