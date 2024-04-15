# Clean code example



## Results

```sh
name                         time            std        iterations
------------------------------------------------------------------
Clean swift protocols        18532063.000 ns ±  34.35 %        100
Clean                        29001875.000 ns ±   4.26 %        100
Clean no polymorphism         5762999.500 ns ±   3.49 %        100
Clean no polymorphism inline  5812583.500 ns ±  35.79 %        100
```

- Clean class + subclasses is slowest
- Clean protocol + classes implementing is second, ≈1.5× faster
- No polymorphism, just switches is ≈5× faster
- No polymorphism, just switches inline in method is like previous, but a bit slower

## How to run

```sh
cd Shared/
swift run -c release Benchmarks --iterations 100
```
