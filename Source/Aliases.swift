﻿public typealias NSObject = Object

#if CLR || JAVA
public typealias Int = Int64
public typealias UInt = UInt64
#elseif ISLAND
	#if X86_64
	public typealias Int = Int64
	public typealias UInt = UInt64
	#elseif I386
	public typealias Int = Int32
	public typealias UInt = UInt32
	#else
	#hint Unexpected bitness
	public typealias Int = Int64
	public typealias UInt = UInt64
	#endif
#elseif COCOA
public typealias Int = NSInteger
public typealias UInt = NSUInteger
#endif
public typealias Int8 = SByte
public typealias UInt8 = Byte

public typealias IntMax = Int64
public typealias UIntMax = UInt64

public typealias Bool = Boolean

public typealias UnicodeScalar = UTF32Char
public typealias UTF16Char = Char // UInt16
public typealias UTF32Char = UInt32
#if !COCOA
public typealias AnsiChar = Byte
public typealias UTF8Char = Byte
#else
// Cocoa has AnsiChar already
public typealias UTF8Char = AnsiChar
#endif

public typealias StaticString = NativeString

public typealias Float = Single
public typealias Float32 = Single
public typealias Float64 = Double

public typealias Any = protocol<> //Dynamic;
public typealias AnyObject = protocol<> //Dynamic;
#if CLR
public typealias AnyClass = System.`Type`
#elseif COCOA
public typealias AnyClass = rtl.Class
#elseif JAVA
public typealias AnyClass = java.lang.Class
#endif

#if COCOA
public typealias Selector = SEL
#endif

/* more obscure aliases */

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
#if COCOA
public typealias COpaquePointer = UnsafePointer<Void>
#endif
public typealias CShort = Int16
public typealias CSignedChar = Int8
public typealias CUnsignedChar = UInt8
public typealias CUnsignedInt = UInt32
public typealias CUnsignedLong = UInt
public typealias CUnsignedLongLong = UInt64
public typealias CUnsignedShort = UInt16
public typealias CWideChar = UnicodeScalar
public typealias ExtendedGraphemeClusterType = NativeString
public typealias FloatLiteralType = Double
public typealias IntegerLiteralType = Int
public typealias StringLiteralType = NativeString
public typealias UWord = UInt16
public typealias UnicodeScalarType = NativeString
//public typealias Void = () // defined by Compiler
public typealias Word = Int