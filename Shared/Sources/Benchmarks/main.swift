import Benchmark
import Shapes

var shapesP: [ShapeProtocol] = []

for v in (0..<1_000_000) {
    let i = Float(v)
    shapesP.append(SquareP(side: i))
    shapesP.append(RectangleP(width: i, height: i * 2))
    shapesP.append(TriangleP(base: i, height: i * 2))
    shapesP.append(CircleP(radius: i))
}

benchmark("Clean swift protocols") {
    _ = totalAreaP(shapes: shapesP)
}

var shapesC: [ShapeBase] = []

for v in (0..<1_000_000) {
    let i = Float(v)
    shapesC.append(Square(side: i))
    shapesC.append(Rectangle(width: i, height: i * 2))
    shapesC.append(Triangle(base: i, height: i * 2))
    shapesC.append(Circle(radius: i))
}

benchmark("Clean") {
    _ = totalArea(shapes: shapesC)
}

var shapesN: [Shape] = []

for v in (0..<1_000_000) {
    let i = Float(v)
    shapesN.append(Shape(type: .sq, width: i, height: i))
    shapesN.append(Shape(type: .rect, width: i, height: i * 2))
    shapesN.append(Shape(type: .triangle, width: i, height: i * 2))
    shapesN.append(Shape(type: .circle, width: i, height: i))
}

benchmark("Clean no polymorphism") {
    _ = totalArea(shapes: shapesN)
}

var shapesI: [Shape] = []

for v in (0..<1_000_000) {
    let i = Float(v)
    shapesI.append(Shape(type: .sq, width: i, height: i))
    shapesI.append(Shape(type: .rect, width: i, height: i * 2))
    shapesI.append(Shape(type: .triangle, width: i, height: i * 2))
    shapesI.append(Shape(type: .circle, width: i, height: i))
}

benchmark("Clean no polymorphism inline") {
    _ = totalAreaInline(shapes: shapesI)
}

Benchmark.main()
