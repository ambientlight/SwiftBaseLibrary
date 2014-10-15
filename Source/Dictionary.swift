﻿#if COOPER
import java.util
import com.remobjects.elements.linq
#elseif ECHOES
import System.Collections.Generic
import System.Linq
#elseif NOUGAT
import Foundation
import RemObjects.Elements.Linq
#endif


#if NOUGAT
__mapped public class Dictionary<Key: class, INSCopying, Value: class> /*: INSFastEnumeration<T>*/ => Foundation.NSMutableDictionary {
#elseif COOPER
__mapped public class Dictionary<Key,Value> => java.util.HashMap<Key,Value> {
#elseif ECHOES
__mapped public class Dictionary<Key,Value> => System.Collections.Generic.Dictionary<Key,Value> {
#endif

	init() {
		#if COOPER
		//return java.util.HashMap<Key,Value>() // 70050: Silver: cannot new up a generic type
		#elseif ECHOES
		//return System.Collections.Generic.Dictionary<Key,Value>() // 70050: Silver: cannot new up a generic type
		#elseif NOUGAT
		return Foundation.NSMutableDictionary()
		#endif
	}

	init(minimumCapacity: Int) {
		#if COOPER
		//return java.util.HashMap<Key,Value>(minimumCapacity) // 70050: Silver: cannot new up a generic type
		#elseif ECHOES
		//return System.Collections.Generic.Dictionary<Key,Value>(minimumCapacity) // 70050: Silver: cannot new up a generic type
		#elseif NOUGAT
		return Foundation.NSMutableDictionary(capacity: minimumCapacity)
		#endif
	}

	/// Create an instance initialized with `elements`.
	/*init(dictionaryLiteral elements: (Key, Value)...) { // Language element not supported on this target platform
	}*/

	subscript (key: Key) -> Value? {
		get {
			#if COOPER
			if __mapped.containsKey(key) {
				return __mapped[key]
			}
			return nil
			#elseif ECHOES
			if __mapped.ContainsKey(key) {
				return __mapped[key]
			}
			return nil
			#elseif NOUGAT
			return __mapped[key]
			#endif
		}
		set {
			#if COOPER
			__mapped[key] = newValue
			#elseif ECHOES
			//__mapped[key] = newValue // 70037: Silver: can't assign nullable to .NET dictionary in mapped type
			#elseif NOUGAT
			if let val = newValue { // 70036: Silver: "if let" expression warns to "always evaluate to true"
				__mapped[key] = val
			} else {
				__mapped.removeObjectForKey(key)
			}
			#endif
		}
	}

	mutating func updateValue(value: Value, forKey key: Key) -> Value? {
			#if COOPER
			if __mapped.containsKey(key) {
				let old = __mapped[key]
				__mapped[key] = value
				return old
			}
			return nil
			#elseif ECHOES
			if __mapped.ContainsKey(key) {
				let old = __mapped[key]
				__mapped[key] = value
				return old
			}
			return nil
			#elseif NOUGAT
			let old = __mapped[key]
			if let val = value { // 70036: Silver: "if let" expression warns to "always evaluate to true"
				__mapped[key] = val
			} else {
				__mapped.removeObjectForKey(key)
			}
			return old
			#endif
	}

	mutating func removeValueForKey(key: Key) -> Value? {
			#if COOPER
			if __mapped.containsKey(key) {
				let old = __mapped[key]
				//__mapped[key] = nil // 70049: Silver: can't store nil mapped generic dictionary, Cooper only
				return old
			}
			return nil
			#elseif ECHOES
			if __mapped.ContainsKey(key) {
				let old = __mapped[key]
				__mapped[key] = nil
				return old
			}
			return nil
			#elseif NOUGAT
			let old = __mapped[key]
			__mapped.removeObjectForKey(key)
			return old
			#endif
	}

	mutating func removeAll(keepCapacity: Bool = default) {
		#if COOPER
		__mapped.clear()
		#elseif ECHOES
		__mapped.Clear()
		#elseif NOUGAT
		__mapped.removeAllObjects()
		#endif
	}

	var count: Int {
		#if COOPER
		return __mapped.keySet().Count()
		#elseif ECHOES
		return __mapped.Count()
		#elseif NOUGAT
		return __mapped.count
		#endif
	}

	var isEmpty: Bool { 
		#if COOPER
		return __mapped.isEmpty()
		#elseif ECHOES
		return __mapped.Count() == 0
		#elseif NOUGAT
		return __mapped.count == 0
		#endif
	}

	var keys: ISequence<Key> { // we deliberatey change this to return a sequence, not an array, for efficiency.
		#if COOPER
		return __mapped.keySet()
		#elseif ECHOES
		return __mapped.Keys
		#elseif NOUGAT
		//return __mapped.allKeys as ISequence<Key> // 70051: Silver: can't cast NSArray to ISequence
		#endif
	}

	var values: ISequence<Value> { // we deliberatey change this to return a sequence, not an array, for efficiency.
		#if COOPER
		return __mapped.values()
		#elseif ECHOES
		return __mapped.Values
		#elseif NOUGAT
		//return __mapped.allValues as ISequence<Value> // 70051: Silver: can't cast NSArray to ISequence
		#endif
	}
	
	// wont support:
	/*
	var startIndex: DictionaryIndex<Key, Value> { get }
	var endIndex: DictionaryIndex<Key, Value> { get }

	func indexForKey(key: Key) -> DictionaryIndex<Key, Value>? {
	}
	
	subscript (position: DictionaryIndex<Key, Value>) -> (Key, Value) { 
		get {
		}
	}
	mutating func removeAtIndex(index: DictionaryIndex<Key, Value>) {
	}

	/// Return a *generator* over the (key, value) pairs.
	///
	/// Complexity: O(1)
	func generate() -> DictionaryGenerator<Key, Value> {
	}
	*/

}