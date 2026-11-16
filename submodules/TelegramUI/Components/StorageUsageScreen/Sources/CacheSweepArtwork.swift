import UIKit

enum CacheSweepArtwork {
    struct Shape {
        let path: CGPath
        let fill: UIColor?
        let stroke: UIColor?
        let width: CGFloat
    }

    private static func color(_ hex: UInt32) -> UIColor {
        UIColor(red: CGFloat((hex >> 16) & 255) / 255, green: CGFloat((hex >> 8) & 255) / 255, blue: CGFloat(hex & 255) / 255, alpha: 1)
    }

    static let front: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -25, y: 10))
            path.addQuadCurve(to: CGPoint(x: -23, y: 29), control: CGPoint(x: -34, y: 23))
            path.addQuadCurve(to: CGPoint(x: 24, y: 28), control: CGPoint(x: 0, y: 37))
            path.addQuadCurve(to: CGPoint(x: 25, y: 9), control: CGPoint(x: 34, y: 23))
            path.addCurve(to: CGPoint(x: 0, y: -33), control1: CGPoint(x: 37, y: -8), control2: CGPoint(x: 26, y: -33))
            path.addCurve(to: CGPoint(x: -25, y: 10), control1: CGPoint(x: -26, y: -33), control2: CGPoint(x: -37, y: -8))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xffdc19), stroke: color(0xf99412), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -21, y: -17))
            path.addQuadCurve(to: CGPoint(x: -8, y: -28), control: CGPoint(x: -18, y: -25))
            return Shape(path: path, fill: nil, stroke: color(0xfff1a3), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -16, y: -4))
            path.addQuadCurve(to: CGPoint(x: -7, y: -4), control: CGPoint(x: -12, y: 2))
            path.move(to: CGPoint(x: 7, y: -4))
            path.addQuadCurve(to: CGPoint(x: 16, y: -5), control: CGPoint(x: 12, y: 2))
            return Shape(path: path, fill: nil, stroke: color(0x261a14), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -5, y: 7))
            path.addQuadCurve(to: CGPoint(x: 5, y: 7), control: CGPoint(x: 0, y: -1))
            path.addQuadCurve(to: CGPoint(x: 0, y: 13), control: CGPoint(x: 6, y: 13))
            path.addQuadCurve(to: CGPoint(x: -5, y: 7), control: CGPoint(x: -6, y: 13))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xff6533), stroke: color(0xdf4819), width: 2.8)
        }(),
    ]

    static let back: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -24, y: 9))
            path.addCurve(to: CGPoint(x: -26, y: 30), control1: CGPoint(x: -28, y: 16), control2: CGPoint(x: -33, y: 24))
            path.addCurve(to: CGPoint(x: 26, y: 30), control1: CGPoint(x: -17, y: 37), control2: CGPoint(x: 17, y: 37))
            path.addCurve(to: CGPoint(x: 24, y: 9), control1: CGPoint(x: 33, y: 24), control2: CGPoint(x: 28, y: 16))
            path.addCurve(to: CGPoint(x: 21, y: -24), control1: CGPoint(x: 32, y: 1), control2: CGPoint(x: 31, y: -14))
            path.addCurve(to: CGPoint(x: -22, y: -24), control1: CGPoint(x: 10, y: -35), control2: CGPoint(x: -10, y: -35))
            path.addCurve(to: CGPoint(x: -24, y: 9), control1: CGPoint(x: -32, y: -14), control2: CGPoint(x: -33, y: 1))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xffda1b), stroke: color(0xf99412), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -24, y: -12))
            path.addCurve(to: CGPoint(x: -8, y: -27), control1: CGPoint(x: -21, y: -21), control2: CGPoint(x: -14, y: -26))
            return Shape(path: path, fill: nil, stroke: color(0xfff5b4), width: 2)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -23, y: 16))
            path.addQuadCurve(to: CGPoint(x: -14, y: 28), control: CGPoint(x: -25, y: 24))
            path.move(to: CGPoint(x: 23, y: 16))
            path.addQuadCurve(to: CGPoint(x: 14, y: 28), control: CGPoint(x: 25, y: 24))
            return Shape(path: path, fill: nil, stroke: color(0xee9c13), width: 2.4)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -9, y: 27))
            path.addQuadCurve(to: CGPoint(x: 0, y: 25), control: CGPoint(x: -6, y: 22))
            path.addQuadCurve(to: CGPoint(x: 9, y: 27), control: CGPoint(x: 6, y: 22))
            path.addQuadCurve(to: CGPoint(x: 0, y: 32), control: CGPoint(x: 8, y: 32))
            path.addQuadCurve(to: CGPoint(x: -9, y: 27), control: CGPoint(x: -8, y: 32))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xffde21), stroke: color(0xf6a41b), width: 2)
        }(),
    ]

    static let side: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -24, y: 8))
            path.addCurve(to: CGPoint(x: -40, y: 15), control1: CGPoint(x: -28, y: 13), control2: CGPoint(x: -34, y: 17))
            path.addCurve(to: CGPoint(x: -19, y: 33), control1: CGPoint(x: -41, y: 24), control2: CGPoint(x: -31, y: 32))
            path.addCurve(to: CGPoint(x: 24, y: 27), control1: CGPoint(x: -4, y: 37), control2: CGPoint(x: 17, y: 34))
            path.addCurve(to: CGPoint(x: 22, y: 11), control1: CGPoint(x: 29, y: 22), control2: CGPoint(x: 25, y: 15))
            path.addCurve(to: CGPoint(x: 29, y: -9), control1: CGPoint(x: 29, y: 5), control2: CGPoint(x: 30, y: -2))
            path.addCurve(to: CGPoint(x: 3, y: -32), control1: CGPoint(x: 27, y: -23), control2: CGPoint(x: 16, y: -32))
            path.addCurve(to: CGPoint(x: -29, y: -5), control1: CGPoint(x: -14, y: -34), control2: CGPoint(x: -29, y: -20))
            path.addCurve(to: CGPoint(x: -24, y: 8), control1: CGPoint(x: -29, y: 0), control2: CGPoint(x: -28, y: 5))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xffda1b), stroke: color(0xf99412), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 24, y: -5))
            path.addCurve(to: CGPoint(x: 37, y: -1), control1: CGPoint(x: 29, y: -7), control2: CGPoint(x: 36, y: -5))
            path.addCurve(to: CGPoint(x: 24, y: 8), control1: CGPoint(x: 38, y: 3), control2: CGPoint(x: 32, y: 7))
            path.addCurve(to: CGPoint(x: 24, y: -5), control1: CGPoint(x: 21, y: 6), control2: CGPoint(x: 21, y: -1))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xff722a), stroke: color(0xec4e19), width: 2.3)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 27, y: 2))
            path.addQuadCurve(to: CGPoint(x: 36, y: 1), control: CGPoint(x: 33, y: 3))
            return Shape(path: path, fill: nil, stroke: color(0xeb4f1b), width: 1.5)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 10, y: -6))
            path.addQuadCurve(to: CGPoint(x: 18, y: -6), control: CGPoint(x: 14, y: -1))
            return Shape(path: path, fill: nil, stroke: color(0x201710), width: 2.8)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -21, y: -15))
            path.addQuadCurve(to: CGPoint(x: -6, y: -27), control: CGPoint(x: -16, y: -24))
            return Shape(path: path, fill: nil, stroke: color(0xfff5b4), width: 2)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -14, y: 14))
            path.addCurve(to: CGPoint(x: 7, y: 17), control1: CGPoint(x: -7, y: 10), control2: CGPoint(x: 3, y: 12))
            path.addCurve(to: CGPoint(x: -16, y: 23), control1: CGPoint(x: 3, y: 26), control2: CGPoint(x: -10, y: 28))
            return Shape(path: path, fill: color(0xffdc1c), stroke: color(0xf5a217), width: 2.2)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -9, y: 15))
            path.addQuadCurve(to: CGPoint(x: -2, y: 16), control: CGPoint(x: -5, y: 14))
            return Shape(path: path, fill: nil, stroke: color(0xfff39a), width: 1.6)
        }(),
    ]

    static let broom: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 0, y: 1))
            path.addLine(to: CGPoint(x: 0, y: -32))
            return Shape(path: path, fill: nil, stroke: color(0x864517), width: 6)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 0, y: 1))
            path.addLine(to: CGPoint(x: 0, y: -32))
            return Shape(path: path, fill: nil, stroke: color(0xc77b29), width: 2)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -3, y: -34))
            path.addQuadCurve(to: CGPoint(x: -11, y: -47), control: CGPoint(x: -8, y: -37))
            path.addQuadCurve(to: CGPoint(x: 11, y: -47), control: CGPoint(x: 0, y: -51))
            path.addQuadCurve(to: CGPoint(x: 3, y: -34), control: CGPoint(x: 8, y: -37))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xfff095), stroke: color(0xc2aa58), width: 2)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: -5, y: -40))
            path.addLine(to: CGPoint(x: -7, y: -47))
            path.move(to: CGPoint(x: 0, y: -40))
            path.addLine(to: CGPoint(x: 0, y: -48))
            path.move(to: CGPoint(x: 5, y: -40))
            path.addLine(to: CGPoint(x: 7, y: -47))
            return Shape(path: path, fill: nil, stroke: color(0xb59a4b), width: 1.4)
        }(),
        {
            let path = CGMutablePath()
            path.addEllipse(in: CGRect(x: -6, y: -18, width: 12, height: 8))
            return Shape(path: path, fill: color(0xffe345), stroke: color(0xf89417), width: 2)
        }(),
    ]

    static let dust: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 7, y: 24))
            path.addCurve(to: CGPoint(x: 9, y: 17), control1: CGPoint(x: 3, y: 22), control2: CGPoint(x: 4, y: 18))
            path.addCurve(to: CGPoint(x: 16, y: 13), control1: CGPoint(x: 9, y: 13), control2: CGPoint(x: 13, y: 11))
            path.addCurve(to: CGPoint(x: 25, y: 16), control1: CGPoint(x: 19, y: 9), control2: CGPoint(x: 25, y: 11))
            path.addCurve(to: CGPoint(x: 26, y: 24), control1: CGPoint(x: 30, y: 17), control2: CGPoint(x: 31, y: 22))
            path.addCurve(to: CGPoint(x: 7, y: 24), control1: CGPoint(x: 21, y: 26), control2: CGPoint(x: 12, y: 26))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xbec2ad), stroke: color(0x929780), width: 1.5)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 10, y: 18))
            path.addQuadCurve(to: CGPoint(x: 16, y: 17), control: CGPoint(x: 13, y: 16))
            return Shape(path: path, fill: nil, stroke: color(0xdce0cd), width: 1.5)
        }(),
    ]

    static let paper: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 5, y: 16))
            path.addLine(to: CGPoint(x: 10, y: 12))
            path.addLine(to: CGPoint(x: 11, y: 7))
            path.addLine(to: CGPoint(x: 17, y: 9))
            path.addLine(to: CGPoint(x: 22, y: 7))
            path.addLine(to: CGPoint(x: 27, y: 13))
            path.addLine(to: CGPoint(x: 26, y: 17))
            path.addLine(to: CGPoint(x: 29, y: 23))
            path.addLine(to: CGPoint(x: 21, y: 26))
            path.addLine(to: CGPoint(x: 15, y: 25))
            path.addLine(to: CGPoint(x: 10, y: 27))
            path.addLine(to: CGPoint(x: 5, y: 21))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xfff1d4), stroke: color(0xbaaa90), width: 1.5)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 10, y: 12))
            path.addLine(to: CGPoint(x: 16, y: 15))
            path.addLine(to: CGPoint(x: 17, y: 9))
            path.move(to: CGPoint(x: 16, y: 15))
            path.addLine(to: CGPoint(x: 13, y: 21))
            path.addLine(to: CGPoint(x: 19, y: 24))
            path.move(to: CGPoint(x: 16, y: 15))
            path.addLine(to: CGPoint(x: 23, y: 18))
            path.addLine(to: CGPoint(x: 26, y: 23))
            path.move(to: CGPoint(x: 13, y: 21))
            path.addLine(to: CGPoint(x: 6, y: 19))
            return Shape(path: path, fill: nil, stroke: color(0xd4bfa1), width: 1.5)
        }(),
    ]

    static let document: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 8, y: 5))
            path.addLine(to: CGPoint(x: 23, y: 7))
            path.addLine(to: CGPoint(x: 27, y: 11))
            path.addLine(to: CGPoint(x: 25, y: 27))
            path.addLine(to: CGPoint(x: 22, y: 24))
            path.addLine(to: CGPoint(x: 19, y: 27))
            path.addLine(to: CGPoint(x: 16, y: 24))
            path.addLine(to: CGPoint(x: 13, y: 26))
            path.addLine(to: CGPoint(x: 10, y: 23))
            path.addLine(to: CGPoint(x: 6, y: 25))
            path.closeSubpath()
            return Shape(path: path, fill: color(0xf3f7ff), stroke: color(0x91a4c0), width: 1.5)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 23, y: 7))
            path.addLine(to: CGPoint(x: 22, y: 12))
            path.addLine(to: CGPoint(x: 27, y: 11))
            return Shape(path: path, fill: color(0xdce9ff), stroke: color(0x91a4c0), width: 1.5)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 11, y: 12))
            path.addLine(to: CGPoint(x: 18, y: 13))
            path.move(to: CGPoint(x: 10, y: 16))
            path.addLine(to: CGPoint(x: 21, y: 18))
            path.move(to: CGPoint(x: 9, y: 20))
            path.addLine(to: CGPoint(x: 15, y: 21))
            return Shape(path: path, fill: nil, stroke: color(0x9ab1d2), width: 1.5)
        }(),
    ]

    static let clips: [Shape] = [
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 11, y: 20))
            path.addLine(to: CGPoint(x: 20, y: 9))
            path.addCurve(to: CGPoint(x: 25, y: 13), control1: CGPoint(x: 24, y: 5), control2: CGPoint(x: 28, y: 9))
            path.addLine(to: CGPoint(x: 16, y: 24))
            path.addCurve(to: CGPoint(x: 10, y: 19), control1: CGPoint(x: 12, y: 29), control2: CGPoint(x: 6, y: 24))
            path.addLine(to: CGPoint(x: 18, y: 9))
            path.move(to: CGPoint(x: 13, y: 20))
            path.addLine(to: CGPoint(x: 20, y: 12))
            return Shape(path: path, fill: nil, stroke: color(0x8f82aa), width: 2.4)
        }(),
        {
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 6, y: 15))
            path.addLine(to: CGPoint(x: 11, y: 9))
            path.addCurve(to: CGPoint(x: 14, y: 11), control1: CGPoint(x: 13, y: 7), control2: CGPoint(x: 16, y: 9))
            path.addLine(to: CGPoint(x: 9, y: 17))
            path.addCurve(to: CGPoint(x: 5, y: 15), control1: CGPoint(x: 7, y: 20), control2: CGPoint(x: 3, y: 18))
            path.addLine(to: CGPoint(x: 9, y: 10))
            return Shape(path: path, fill: nil, stroke: color(0xa4b5cc), width: 1.8)
        }(),
    ]

    private static func litterShape(_ points: [CGPoint], fill: UInt32?, stroke: UInt32) -> Shape {
        let path = CGMutablePath()
        if let first = points.first {
            path.move(to: first)
            for point in points.dropFirst() { path.addLine(to: point) }
            if fill != nil { path.closeSubpath() }
        }
        return Shape(path: path, fill: fill.map(color), stroke: color(stroke), width: 1.5)
    }

    static let photo = [
        litterShape([.init(x: 5, y: 6), .init(x: 27, y: 5), .init(x: 28, y: 24), .init(x: 6, y: 26)], fill: 0xe3efff, stroke: 0x92abc5),
        litterShape([.init(x: 8, y: 21), .init(x: 13, y: 14), .init(x: 17, y: 18), .init(x: 22, y: 11), .init(x: 25, y: 20)], fill: 0xb9d7c8, stroke: 0x8dae9d)
    ]

    static let wrapper = [
        litterShape([.init(x: 4, y: 10), .init(x: 12, y: 12), .init(x: 21, y: 9), .init(x: 28, y: 7), .init(x: 26, y: 15), .init(x: 29, y: 22), .init(x: 21, y: 20), .init(x: 12, y: 23), .init(x: 5, y: 26), .init(x: 7, y: 18)], fill: 0xffddc9, stroke: 0xc38d83),
        litterShape([.init(x: 12, y: 12), .init(x: 11, y: 17), .init(x: 12, y: 23)], fill: nil, stroke: 0xc38d83),
        litterShape([.init(x: 21, y: 9), .init(x: 22, y: 15), .init(x: 21, y: 20)], fill: nil, stroke: 0xc38d83)
    ]

    static let ticket = [
        litterShape([.init(x: 4, y: 11), .init(x: 27, y: 7), .init(x: 28, y: 12), .init(x: 25, y: 15), .init(x: 29, y: 17), .init(x: 29, y: 21), .init(x: 7, y: 25), .init(x: 6, y: 21), .init(x: 8, y: 17), .init(x: 5, y: 15)], fill: 0xfce8ae, stroke: 0xb5a168),
        litterShape([.init(x: 13, y: 15), .init(x: 22, y: 13)], fill: nil, stroke: 0xb5a168),
        litterShape([.init(x: 14, y: 19), .init(x: 20, y: 18)], fill: nil, stroke: 0xb5a168)
    ]

    static func draw(_ shapes: [Shape], in context: CGContext) {
        context.setLineCap(.round)
        context.setLineJoin(.round)
        for shape in shapes {
            if let fill = shape.fill {
                context.setFillColor(fill.cgColor)
                context.addPath(shape.path)
                context.fillPath()
            }
            if let stroke = shape.stroke {
                context.setStrokeColor(stroke.cgColor)
                context.setLineWidth(shape.width)
                context.addPath(shape.path)
                context.strokePath()
            }
        }
    }
}
