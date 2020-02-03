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

@inlinable internal func inverseSquareRoot<F>(_ x: F) -> F where F: FloatingPoint & ExpressibleByFloatLiteral {
    // TODO: Evaluate. Check. Evaluate. Try the 1/sqrt() alternative. Evaluate....
    // For the details on the following implementation check the fast inverse square root thread:
    // https://stackoverflow.com/questions/33643881/fastest-inverse-square-root-on-iphone-swift-not-objectc
    let halfx = x * 0.5
    var y = x
    var i : Int32 = 0
    memcpy(&i, &y, 4)
    i = 0x5f3759df - (i >> 1)
    memcpy(&y, &i, 4)
    y = y * (1.5 - (halfx * y * y))
    return y
}
