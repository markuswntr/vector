// Copyright 2019 Markus Winter
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/// The projection of a vector (also known as vector components or vector resolution) describes
/// the properties of the vector when projected onto a coordinate system of same cardinality.
/// See: https://en.wikipedia.org/wiki/Vector_projection
public protocol Projection {

    /// The storage type of the vector to be projected
    associatedtype Storage: SIMD

    /// The unprojected vector storage
    var storage: Storage { get }

    /// Initializes a projected view on given unprojected vector storage.
    init(on storage: Storage)
}
