# Vector

Defines the properties of space, an `EuclideanVector` protocol and `Vector2`, `Vector3` and `Vector4` as implementations of an euclidean
vector of known length. Vectors can be used to calculate 📦 [geometric values](https:/github.com/markuswntr/geometry), dot products or
cross products, and to interpolate between values. You can use vectors to modify data such as
🎨 [Color](https:/github.com/markuswntr/color), or positions in 2D or 3D space. Vector operations are inlined by 
[SIMD](https://en.wikipedia.org/wiki/SIMD) intrinsic functions of the target hardware whenever possible.  

The module has no platform restrictions nor hardware requirements.
There is a fallback in place for hardware targets with limit or no support for SIMD intrinsic functions.
It depends on the [apple/swift-numerics](https:/github.com/apple/swift-numerics) module.

## Overview

A vector is comparable to a fixed-length array containing numeric values (i.e. floating-point, signed integer or unsigned integer).
The key difference to a fixed-length array however, is that a vector is backed by an SIMD intrinsic, allowing all values to be processed in
parallel. Theoretically, this increases the throughput by the number of elements in the vector.
The library provides support for small vectors, that is, vectors that contain up to four numeric values – with longer vectors coming later. 

You can use the library to apply a single instruction to each element in the vector.
For example, consider two vectors, each containing four elements:

```
let lhs: Vector4<Float> = [2, 4, 5, 8]
let rhs: Vector4<Float> = [5, 6, 7, 8]
```

You can easily find, for example, the element-wise sum of the two vectors by using the `+` operator:

```
let sum = lhs + rhs    // sum = (7.0, 10.0, 12.0, 16.0)
```

## TODO

The module tries to follow (most of) the concepts defined in the
[Vector Manifesto](https://gist.github.com/kelvin13/9689ead534d8f2d4e8792a66690ea002).
Concepts that differ from the Manifesto may be considered deprecated and may change in the future.
Concepts not yet supported by the Swift Programming Language may differ from the Manifesto but will be
adjusted accordingly once Swift will support them.

Some of the mismatches are:

- [ ] EuclideanVector are `ExpressibleByArrayLiteral` rather than `ExpressibleByTupleLiteral`, as such protocol does not exist.
- [ ] ...

Additionally, the vector library tries to align closely with the Numeric Protocols of the Swift Standard Library and the Swift Numerics Package.
The SIMD module of the stdlib however has (as of now) limited support for Numeric Protocols, as the available intrinsics on the target hardware
are C-based and therefore limited/not designed for Swift. Read this [blog post](wntr.me/posts/) for further details. Given that a `Vector{Size}`
is backed by SIMD intrinsics, these restrictions apply to the module as well. The restrictions may be lifted in the future. 
