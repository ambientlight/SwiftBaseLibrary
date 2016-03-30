﻿public typealias NSObject = Object

#if ECHOES || COOPER
public typealias Int = Int64
public typealias UInt = UInt64
#elseif NOUGAT
public typealias Int = Int64//NSInteger
public typealias UInt = UInt64//NSUInteger
#endif
public typealias Int8 = SByte
public typealias UInt8 = Byte

public typealias IntMax = Int64
public typealias UIntMax = UInt64

public typealias Bool = Boolean

public typealias Character = Char // for now
public typealias UnicodeScalar = Character // for now
public typealias UTF16Char = Char // UInt16
public typealias UTF32Char = UInt32
#if !NOUGAT
public typealias AnsiChar = Byte
public typealias UTF8Char = Byte
#else
// Nougat has AnsiChar already
public typealias UTF8Char = AnsiChar
#endif


public typealias StaticString = String

public typealias Float = Single
public typealias Float32 = Single
public typealias Float64 = Double

public typealias Any = protocol<> //Dynamic;
public typealias AnyObject = protocol<> //Dynamic;
#if ECHOES
public typealias AnyClass = System.`Type`
#elseif NOUGAT
public typealias AnyClass = rtl.Class
#elseif COOPER
public typealias AnyClass = java.lang.Class
#endif

#if NOUGAT
public typealias Selector = SEL
#endif

/* more obsucre integer aliases */

public typealias BooleanLiteralType = Bool
public typealias CBool = Bool
public typealias CChar = Int8
public typealias CChar16 = UInt16
public typealias CChar32 = UnicodeScalar
public typealias CDouble = Double
public typealias CFloat = Float
public typealias CInt = Int32
public typealias CLong = Int
public typealias CLongLong = Int64
public typealias CShort = Int16
public typealias CSignedChar = Int8
public typealias CUnsignedChar = UInt8
public typealias CUnsignedInt = UInt32
public typealias CUnsignedLong = UInt
public typealias CUnsignedLongLong = UInt64
public typealias CUnsignedShort = UInt16
public typealias CWideChar = UnicodeScalar
public typealias ExtendedGraphemeClusterType = String
public typealias FloatLiteralType = Double
public typealias IntegerLiteralType = Int
public typealias StringLiteralType = String
public typealias UWord = UInt
public typealias UnicodeScalarType = String
//public typealias Void = () // define dby Compiler
public typealias Word = Int

public typealias COpaquePointer = UnsafePointer<Void>
public typealias UnsafeMutablePointer<T> = UnsafePointer<T>

//struct Float80 { // A record needs to have at least 1 field or a "StructLayoutAttribute" with "Size > 0"
//}