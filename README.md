# Vector

[![Build Status](https://travis-ci.com/markuswntr/vector.svg?branch=master)](https://travis-ci.com/markuswntr/vector)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/803ddcc9676c4910bd11b804801eeca8)](https://app.codacy.com/app/markuswntr/vector)

Defines the properties of space, an euclidean `Vector` protocol and `Vector2`, `Vector3` and `Vector4` as implementations of an euclidean
vector with known length. Vectors can be used to calculate 📦 [geometric values](https:/github.com/markuswntr/geometry), dot products or 
cross products, and to interpolate between values. You can use vectors to modify data such as
🎨 [Color](https:/github.com/markuswntr/color), or positions in 2D or 3D space. Vector operations are inlined by 
[SIMD](https://en.wikipedia.org/wiki/SIMD) intrinsic functions of the target hardware whenever possible.  

The module has no dependencies, no platform restrictions nor hardware requirements. There is a fallback in place for hardware targets with
limit or no support for SIMD intrinsic functions.

## Overview

A vector is comparable to a fixed-length array containing numeric values (i.e. floating-point, signed integer or unsigned integer). The library
provides support for small vectors, that is, vectors that contain up to four numeric values – with longer vectors coming later. 

You can use the library to apply a single instruction to each element in the vector.
For example, consider two vectors, each containing four elements:

```
let lhs: Vector<Float> = [2, 4, 5, 8]
let rhs: Vector<Float> = [5, 6, 7, 8]
```

You can easily find, for example, the element-wise sum of the two vectors by using the `+` operator:

```
let sum = lhs + rhs    // sum = (7.0, 10.0, 12.0, 16.0)
```














## 1. Collections

**TL;DR** The `Vector` module introduces new two collection types in order to seperate concerns.

### StaticCollection

A vector is defined by two or more values. So a `Collection` based implemention fits nicely into the ecosystem. Yet, vectors are not resizable and of known length at compile time. `Collection` does not restrict its length at compile time nor the resizing capabilities. So a new protocol `StaticCollection` is introduces by this module, that restricts the length of conforming type to a fixed and known length at compile time. It introduces a new `StaticCollectionIndex` that must define all indices of the collection at compile time (much like `CaseIterable`) and restricts `StaticCollection.Index` to this type.

> `FixedLengthCollection` and `StaticCollection` have been considered for the collection name. Swift, however, already defines `String` and `StaticString`, of which both target the same idea as `Collection` and `StaticCollection`. So `FixedLengthCollection` was dismissed.
>
> Alternate name considerations `FixedSizeCollection`, `FixedWidthCollection` have been rejected as they may be misleading (e.g. size = memory, width = ?).

### VectorCollection

There are more restrictions to a collection that define a vector than being non-resizeable and of fixed length, like allowing random access and defining the origin of the vector spaces. As these are not applicable to `StaticCollection` a new `VectorCollection` protocol is introduced by the module.
A `VectorCollection` is a non-resizable random access collection, conforming to `StaticCollection` and `RandomAccessCollection`, that defines the number of vector spaces (`cardinality`) by the length of it.
It requires conforming types to implement the origin of the vector space, by defining a `zero` Vector.

## 2. RawVector & SIMD

TODO: Documentation

### RawVector

TODO: Documentation

### SIMD

TODO: Documentation

## 3. VectorProtocol

TODO: Documentation

### Vector2

TODO: Documentation

### Vector3

TODO: Documentation

### Vector4

TODO: Documentation
