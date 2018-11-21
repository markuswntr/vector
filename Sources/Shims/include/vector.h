#ifndef VectorShims_H
#define VectorShims_H

#if defined(__APPLE__) // Apple platform, use simd.h (for now, skip for actual values later on)
#include <simd/simd.h>

// CHAR
// * simd_charN   where N is 1, 2, 3, 4, 8, 16, 32, or 64.
// * simd_ucharN  where N is 1, 2, 3, 4, 8, 16, 32, or 64.
//  ---> There are `Character` in Swift but not sure if proper type, therefore skipped (as of now)

// SHORT
// * simd_shortN  where N is 1, 2, 3, 4, 8, 16, or 32.
// * simd_ushortN where N is 1, 2, 3, 4, 8, 16, or 32.
//  ---> There are no Numeric values in Swift for short, therefore skipped (as of now)

#pragma mark - 32bit Types
#include <immintrin.h>
// Int32: simd_intN    where N is 1, 2, 3, 4, 8, or 16.
typedef simd_int2 Int2;
typedef simd_int3 Int3;
typedef simd_int4 Int4;
typedef simd_int8 Int8;
typedef simd_int16 Int16;
// UInt32: simd_uintN   where N is 1, 2, 3, 4, 8, or 16.
typedef simd_uint2 UInt2;
typedef simd_uint3 UInt3;
typedef simd_uint4 UInt4;
typedef simd_uint8 UInt8;
typedef simd_uint16 UInt16;
// Float: simd_floatN  where N is 1, 2, 3, 4, 8, or 16.
typedef simd_float2 Float2;
typedef simd_float3 Float3;
typedef simd_float4 Float4;
typedef simd_float8 Float8;
typedef simd_float16 Float16;

#pragma mark - 64bit Types

// Int64: simd_longN   where N is 1, 2, 3, 4, or 8.
typedef simd_long2 Long2;
typedef simd_long3 Long3;
typedef simd_long4 Long4;
typedef simd_long8 Long8;
// UInt64: simd_ulongN  where N is 1, 2, 3, 4, or 8.
typedef simd_ulong2 ULong2;
typedef simd_ulong3 ULong3;
typedef simd_ulong4 ULong4;
typedef simd_ulong8 ULong8;
// Double: simd_doubleN where N is 1, 2, 3, 4, or 8.
typedef simd_double2 Double2;
typedef simd_double3 Double3;
typedef simd_double4 Double4;
typedef simd_double8 Double8;

#elif defined(__ARM_NEON) // None-apple ARM platform
#include <arm_neon.h>
#error Not yet supported
#else // INVALID!!! NEEDS PROPER elif CHECK!
#include <immintrin.h>
#error Not yet supported
#endif
//#else // INVALID!!! NEEDS PROPER elif CHECK!
//#error Not yet supported
// Write c implementation as fallback
//#endif

#endif
