import XCTest
@testable import Shapes

final class CleanShapesTests: XCTestCase {

    func testCleanSwift() {
        var shapes: [ShapeProtocol] = []

        for v in (0..<1_000_000) {
            let i = Float(v)
            shapes.append(SquareP(side: i))
            shapes.append(RectangleP(width: i, height: i * 2))
            shapes.append(TriangleP(base: i, height: i * 2))
            shapes.append(CircleP(radius: i))
        }

        measure {
            _ = totalAreaP(shapes: shapes)
        }
    }
    func testClean() {
        var shapes: [ShapeBase] = []

        for v in (0..<1_000_000) {
            let i = Float(v)
            shapes.append(Square(side: i))
            shapes.append(Rectangle(width: i, height: i * 2))
            shapes.append(Triangle(base: i, height: i * 2))
            shapes.append(Circle(radius: i))
        }

        measure {
            _ = totalArea(shapes: shapes)
        }
    }

    func testCleanNoPoly() {

        var shapes: [Shape] = []

        for v in (0..<1_000_000) {
            let i = Float(v)
            shapes.append(Shape(type: .sq, width: i, height: i))
            shapes.append(Shape(type: .rect, width: i, height: i * 2))
            shapes.append(Shape(type: .triangle, width: i, height: i * 2))
            shapes.append(Shape(type: .circle, width: i, height: i))
        }

        measure {
            _ = totalArea(shapes: shapes)
        }
    }

    func testCleanNoPolyInline() {

        var shapes: [Shape] = []

        for v in (0..<1_000_000) {
            let i = Float(v)
            shapes.append(Shape(type: .sq, width: i, height: i))
            shapes.append(Shape(type: .rect, width: i, height: i * 2))
            shapes.append(Shape(type: .triangle, width: i, height: i * 2))
            shapes.append(Shape(type: .circle, width: i, height: i))
        }

        measure {
            _ = totalAreaInline(shapes: shapes)
        }
    }
}
