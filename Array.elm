module Array where

{-| A library for manipulating arrays of values. Every value in a
array must have the same type. The arrays are implemented in Relaxed
Radix Balanced-Trees for fast updating and concating.

# Basics
@docs empty, length, get

# Putting Arrays Together
@docs fromList, concat, push, set

-}

import Basics (..)
import Native.Array

data Array a = Array

{-| Creates an array from a given list. -}
fromList : [a] -> Array a
fromList = foldl (Native.Array.push) Native.Array.empty

{-| Returns an empty array. -}
empty : Array a
empty = Native.Array.empty

{-| Pushes an item to the end of an array. -}
push : a -> Array a -> Array a
push = Native.Array.push

{-| Returns the value at an index of an array. -}
get : Int -> Array a -> a
get = Native.Array.get

{-| Sets the value at at an index. Returns the updated array. -}
set : Int -> a -> Array a -> Array a
set = Native.Array.set

{-| Returns the length of an array. -}
length : Array a -> Int
length = Native.Array.length

{-| Concats to arrays to a new one. -}
concat : Array a -> Array a -> Array a
concat = Native.Array.concat
