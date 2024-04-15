import Foundation

// MARK: - Clean swift
public protocol ShapeProtocol {
    func area() -> Float
}
public final class SquareP: ShapeProtocol {
    let side: Float
    public init(side: Float) { self.side = side }
    public func area() -> Float { side * side }
}
public final class RectangleP: ShapeProtocol {
    let width, height: Float
    public init(width: Float, height: Float) { self.width = width; self.height = height }
    public func area() -> Float { width * height }
}
public final class TriangleP: ShapeProtocol {
    let base, height: Float
    public init(base: Float, height: Float) { self.base = base; self.height = height }
    public func area() -> Float { 0.5 * base * height }
}
public final class CircleP: ShapeProtocol {
    let radius: Float
    public init(radius: Float) { self.radius = radius }
    public func area() -> Float { Float.pi * radius * radius }
}
public func totalAreaP(shapes: [ShapeProtocol]) -> Float {
    var accum: Float = 0
    for shape in shapes { accum += shape.area() }
    return accum
}

// MARK: - Clean
public class ShapeBase {
    public func area() -> Float { return 0 }
}
public final class Square: ShapeBase {
    let side: Float
    public init(side: Float) { self.side = side }
    public override func area() -> Float { side * side }
}
public final class Rectangle: ShapeBase {
    let width, height: Float
    public init(width: Float, height: Float) { self.width = width; self.height = height }
    public override func area() -> Float { width * height }
}
public final class Triangle: ShapeBase {
    let base, height: Float
    public init(base: Float, height: Float) { self.base = base; self.height = height }
    public override func area() -> Float { 0.5 * base * height }
}
public final class Circle: ShapeBase {
    let radius: Float
    public init(radius: Float) { self.radius = radius }
    public override func area() -> Float { Float.pi * radius * radius }
}
public func totalArea(shapes: [ShapeBase]) -> Float {
    var accum: Float = 0
    for shape in shapes { accum += shape.area() }
    return accum
}

// Clean but no polymorphism, just a switch
public enum ShapeType { case sq, rect, triangle, circle }
public struct Shape {
    let type: ShapeType
    let width: Float
    let height: Float
    public init(type: ShapeType, width: Float, height: Float) {
        self.type = type
        self.width = width
        self.height = height
    }
}
func areaSwitch(_ shape: Shape) -> Float {
    return switch shape.type {
        case .sq: shape.width * shape.height
        case .rect: shape.width * shape.height
        case .triangle: 0.5 * shape.width * shape.height
        case .circle: Float.pi * shape.width * shape.width
    }
}
public func totalArea(shapes: [Shape]) -> Float {
    var accum: Float = 0
    for shape in shapes { accum += areaSwitch(shape) }
    return accum
}

// Clean but no polymorphism and code does know about internals
public func totalAreaInline(shapes: [Shape]) -> Float {
    var accum: Float = 0
    for shape in shapes {
        let res = switch shape.type {
            case .sq: shape.width * shape.height // square
            case .rect: shape.width * shape.height
            case .triangle: 0.5 * shape.width * shape.height
            case .circle: Float.pi * shape.width * shape.width
        }
        accum += res
    }
    return accum
}
