module Array where

{-| A library for manipulating arrays of values. Every value in a
array must have the same type. The arrays are implemented in Relaxed
Radix Balanced-Trees for fast updating and concating.

# Basics
@docs empty, length, get, map

# Putting Arrays Together
@docs fromList, concat, push, set

# Taking Arrays Apart
@docs toList, slice

# Folding Arrays
@docs foldl, foldr
-}

import Native.Array
import List

data Array a = Array

{-| Create an array from a list. -}
fromList : [a] -> Array a
fromList = List.foldl (Native.Array.push) Native.Array.empty

{-| Create a list from an array -}
toList : Array a -> [a]
toList = Native.Array.toList

{-| Apply a function on every item in an array. -}
map : (a -> b) -> Array a -> Array b
map = Native.Array.map

{-| Reduce an array from the left. -}
foldl : (a -> b -> b) -> b -> Array a -> b
foldl = Native.Array.foldl

{-| Reduce an array from the right. -}
foldr : (a -> b -> b) -> b -> Array a -> b
foldr = Native.Array.foldr

{-| Return an empty array. -}
empty : Array a
empty = Native.Array.empty

{-| Push an item to the end of an array. -}
push : a -> Array a -> Array a
push = Native.Array.push

{-| Return the value at the index. -}
get : Int -> Array a -> a
get = Native.Array.get

{-| Sets the value at the index. Returns the updated array. -}
set : Int -> a -> Array a -> Array a
set = Native.Array.set

{-| Slice an array given a range. The selection is inclusive, so the last
element in the selection will also be in the new array. This may change in the 
future.
You can select from the end by giving a negative Int. -}
slice : Int -> Int -> Array a -> Array a
slice = Native.Array.slice

{-| Return the length of an array. -}
length : Array a -> Int
length = Native.Array.length

{-| Concat two arrays to a new one. -}
concat : Array a -> Array a -> Array a
concat = Native.Array.concat
