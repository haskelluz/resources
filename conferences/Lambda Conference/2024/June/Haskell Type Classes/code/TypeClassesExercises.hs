module TypeClassesExercises (module TypeClassesExercises) where

{-
These might help you:
GHCi:
  :i <typeclass> - information about the typeclass.
  :t <value>     - get the type of the value.
-}

{-
   ____        __  _
  / __ \____  / /_(_)___  ____
 / / / / __ \/ __/ / __ \/ __ \
/ /_/ / /_/ / /_/ / /_/ / / / /
\____/ .___/\__/_/\____/_/ /_/
    /_/
-}

data Option a
  = None
  | Some a
  deriving (Show)

instance Eq (Option a) where
  -- Don't know which methods to implement? Use ':i Eq' Luke!

instance Ord (Option a) where
  -- Pay attention to MINIMAL requirements to save time.

instance Semigroup (Option a) where

instance Monoid (Option a) where

instance Functor Option where
  -- Where did the 'a' go?

instance Applicative Option where

instance Monad Option where

instance Foldable Option where

instance Traversable Option where
  -- Now you really have to use your brain to the full. Consider WHAT you have right now and WHAT you can GET with them.
  -- Hint: Make use of previously defined operations.

{-
    __    _      __
   / /   (_)____/ /_
  / /   / / ___/ __/
 / /___/ (__  ) /_
/_____/_/____/\__/
-}

data List a
  = Nil
  | Cons a (List a)
  deriving (Show)

-- Maybe you will find this more comfortable than Cons _ (Cons _ (Cons _ Nil))
infixr |:
(|:) :: a -> List a -> List a
(|:) = Cons
listEx :: List Int
listEx = 10 |: 20 |: 30 |: Nil

-- You know the drill. Write all the necessary instances by hand. Don't just copy and paste! Write all of them by hand!

{-
    ____                  ____
   / __ \___  _______  __/ / /_
  / /_/ / _ \/ ___/ / / / / __/
 / _, _/  __(__  ) /_/ / / /_
/_/ |_|\___/____/\__,_/_/\__/
-}

-- '-A' is intentional. Just keep reading.
data ResultA e a
  = ErrorA e
  | OkA a
  deriving (Show)

instance Eq (ResultA e a) where
instance Ord (ResultA e a) where
  -- 'Eq' and 'Ord' are essentially the same for all data types. Aren't you tired of writing them by hand?
  -- Maybe we can derive them automatically like 'Show'?
  -- Try deriving it automatically. If successful, then you can remove these ('Eq' and 'Ord') instance blocks.
  -- Food for thought: Is there any other type classes that can be derived automatically?

instance (Semigroup a, Semigroup e) => Semigroup (ResultA e a) where
  -- Which one to combine 'a' or 'e'?

instance (Semigroup a, Semigroup e) => Monoid (ResultA e a) where
  -- Don't just blindly implement the instances. Maybe some of the instances CANNOT be implemented?

instance Functor (ResultA e) where
  -- Where did the 'a' go? Maybe those stars (* -> *) mean something?

instance Applicative (ResultA e) where

instance Monad (ResultA e) where

instance Foldable (ResultA e) where

instance Traversable (ResultA e) where

-- What do you think, are the instances going to be the same if you defined ResultA differently? Swapped the order of
-- of type parameters from 'e a' to 'a e'?
data ResultE a e
  = OkE a
  | ErrorE e
  deriving (Show)

instance Eq (ResultE a a) where
instance Ord (ResultE a a) where
  -- Same thing. Go in implement them by hand if you don't have anything better to do. Or try deriving automatically.

instance (Semigroup a, Semigroup e) => Semigroup (ResultE a e) where

instance (Semigroup a, Semigroup e) => Monoid (ResultE a e) where
  -- Did you even read the previous message about some impossible instances?

instance Functor (ResultE a) where
  -- Where did the 'e' go this time? Why 'e' is gone?

instance Applicative (ResultE a) where

instance Monad (ResultE a) where

instance Foldable (ResultE a) where

instance Traversable (ResultE a) where

-- Congrats! If you finished all the exercises then you are a big boy now! If you find a mistake, please open an issue.
