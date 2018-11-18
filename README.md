# Vector

[![Swift Version](https://img.shields.io/badge/Swift-4.2-red.svg)](https://swift.org/)
[![Build Status](https://travis-ci.com/markuswntr/vector.svg?branch=master)](https://travis-ci.com/markuswntr/vector)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20linux-lightgrey.svg)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/803ddcc9676c4910bd11b804801eeca8)](https://app.codacy.com/app/markuswntr/vector)

Defines a fixed length collection, a vector collection, the properties of space, raw [SIMD](https://en.wikipedia.org/wiki/SIMD) vector and protocols for **Vector2** (e.g. Point2, Size2), **Vector3** (e.g. Point3, Size3, RGB Color) and **Vector4**  (e.g. RGBA Color).

The `Vector` module does not have any dependency and builds on macOS and Linux.

> Note: Protocol extensions on `Vector(2|3|4)` require **SIMD** to be available on the target hardware.

## 1. Collections

**TL;DR** The `Vector` module introduces new two collection types in order to seperate concerns.

### StaticCollection

A vector is defined by two or more values. So a `Collection` based implemention fits nicely into the ecosystem. Yet, vectors are not resizable and of known length at compile time. `Collection` does not restrict its length at compile time nor the resizing capabilities. So a new protocol `StaticCollection` is introduces by this module, that restricts the length of conforming type to a fixed and known length at compile time. It introduces a new `StaticCollectionIndex` that must define all indices of the collection at compile time (much like `CaseIterable`) and restricts `StaticCollection.Index` to this type.

> `FixedLengthCollection` and `StaticCollection` have been considered for the collection name. Swift, however, already defines `String` and `StaticString`, of which both target the same idea as `Collection` and `StaticCollection`. So `FixedLengthCollection` was dismissed.
>
> Alternate name considerations `FixedSizeCollection`, `FixedWidthCollection` have been rejected as they may be misleading (e.g. size = memory, width = ?).

### VectorCollection

There are more restrictions to a collection that define a vector than being non-resizeable and of fixed length, like allowing random access and defining the origin of the vector spaces. As these are not applicable to `StaticCollection` a new `VectorCollection` protocol is introduced by the module.
A `VectorCollection` is a non-resizable random access collection, conforming to `StaticCollection` and `RandomAccessCollection`, that defines vector spaces (`cardinality`) by the length of it.
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
