{-# LANGUAGE DerivingStrategies #-}

module TypeClasses (module TypeClasses) where

import Control.Applicative (Applicative (liftA2))
import Data.Foldable
import Data.Functor ((<&>))

-- OCaml be like:
-- +
incrementInt :: Int -> Int
incrementInt n = n + 1

-- +.
incrementFloat :: Float -> Float
incrementFloat n = n + 1

-- Haskell be like:
increment :: (Num a) => a -> a
increment n = n + 1

-- >>> increment 1
-- 2
-- >>> increment 1.1
-- 2.1

data Nat = Zero | Succ Nat
  deriving stock (Show)

instance Num Nat where
  -- Add
  (+) :: Nat -> Nat -> Nat
  Zero + b = b
  (Succ a) + b = Succ (a + b)

  -- Mul
  (*) :: Nat -> Nat -> Nat
  Zero * _ = Zero
  (Succ a) * b = b + (a * b)

  -- Sub
  (-) :: Nat -> Nat -> Nat
  Zero - _ = Zero
  m - Zero = m
  (Succ m) - (Succ n) = m - n

  -- Abs
  abs :: Nat -> Nat
  abs n = n

  -- Signum
  signum :: Nat -> Nat
  signum Zero = Zero
  signum (Succ _) = Succ Zero

  -- Conversion
  fromInteger :: Integer -> Nat
  fromInteger n
    | n <= 0 = Zero
    | otherwise = Succ (fromInteger (n - 1))

zero, one, two, three :: Nat
zero = Zero
one = Succ zero
two = Succ one
three = Succ two

-- >>> zero + one
-- Succ Zero
-- >>> one + two
-- Succ (Succ (Succ Zero))

instance Eq Nat where
  (==) :: Nat -> Nat -> Bool
  Zero == Zero = True
  Zero == _ = False
  _ == Zero = False
  (Succ m) == (Succ n) = m == n

instance Ord Nat where
  compare Zero Zero = EQ
  compare Zero _ = LT
  compare _ Zero = GT
  compare (Succ m) (Succ n) = compare m n

--

-- Semigroup
-- Monoid
-- Functor
-- Applicative
-- Monad
-- Foldable
-- Traversable

data List a = Nil | Cons a (List a)
  deriving stock (Show)

-- <> :: a -> a -> a
instance Semigroup (List a) where
  (<>) :: List a -> List a -> List a
  Nil <> ys = ys
  (Cons x xs) <> ys = Cons x (xs <> ys)

xs', ys' :: List Int
xs' = Cons 10 (Cons 20 (Cons 30 Nil))
ys' = Cons 40 (Cons 60 Nil)

-- >>> xs' <> ys'
-- Cons 10 (Cons 20 (Cons 30 (Cons 40 Nil)))
-- mempty :: a
instance Monoid (List a) where
  mempty :: List a -- unit
  mempty = Nil

-- >>> mempty :: List a
-- Nil

-- foldr :: (a -> b -> b) -> b -> List a -> b
instance Foldable List where
  foldr :: (a -> b -> b) -> b -> List a -> b
  foldr _ z Nil = z
  -- foldr f z (Cons x xs) = foldr f (f x z) xs
  foldr f z (Cons x xs) = f x (foldr f z xs)

instance Semigroup Int where
  a <> b = a + b

instance Monoid Int where
  mempty = 0

-- >>> foldr (+) 0 xs'
-- 60
-- >>> fold xs'
-- 60

-- fmap : (a -> b) -> List a -> List b
instance Functor List where
  fmap _ Nil = Nil
  fmap f (Cons x xs) = Cons (f x) (fmap f xs)

fmapResult = fmap show xs'

-- >>> fmap show xs'
-- Cons "10" (Cons "20" (Cons "30" Nil))
-- List Integer -> List String

-- pure : a -> List a
-- liftA2 : (a -> b -> c) -> List a -> List b -> List c
instance Applicative List where
  pure a = Cons a Nil

  liftA2 f (Cons x xs) (Cons y ys) = Cons (f x y) (liftA2 f xs ys)
  liftA2 _ _ Nil = Nil
  liftA2 _ Nil _ = Nil

-- >>> pure 10 :: List Int
-- Cons 10 Nil

-- >>> liftA2 (+) (xs') (ys')
-- Cons 50 (Cons 80 Nil)

-- Monad
-- >>=: bind, flatMap
instance Monad List where
  (>>=) :: List a -> (a -> List b) -> List b
  Nil >>= _ = Nil
  -- (Cons x xs) >>= f = case f x of
  --   Nil -> xs >>= f
  --   -- Cons y ys -> Cons y (ys <> (xs >>= f))
  --   ys -> ys <> (xs >>= f)
  (Cons x xs) >>= f = f x <> (xs >>= f)

-- >>> [[1, 2, 3], [1, 2, 3]] >>= (\x -> x)
-- [1,2,3,1,2,3]

-- 1 : 2 : 3 : []
-- Cons 1 (Cons 2 (Cons 3 Nil))

xss :: List (List Int)
xss = Cons (Cons 1 (Cons 2 (Cons 3 Nil))) (Cons (Cons 1 (Cons 2 (Cons 3 Nil))) Nil)

-- >>> xss >>= id
-- Cons 1 (Cons 2 (Cons 3 (Cons 1 (Cons 2 (Cons 3 Nil)))))

-- >>> (Just 42) >>= (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)
-- >>> Nothing >>= (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)
-- Just 50
-- Nothing
-- >>> (Just 41) >>= (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)
-- Nothing

foo = ((Just 42) >>= (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)) >>= (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)
bar = ((Just 42) <&> (\x -> if x `mod` 2 == 0 then Just 50 else Nothing)) <&> (\x -> case x of Just n -> Just x; Nothing -> Nothing)

--- >>> foo
-- Just 50
-- >>> bar
-- Just (Just (Just 50))

data Option a = None | Some a
  deriving stock (Show)

instance (Semigroup a) => Semigroup (Option a) where
  (Some a) <> (Some b) = Some (a <> b)
  None <> (Some b) = Some b
  (Some a) <> None = Some a
  None <> None = None

instance (Monoid a) => Monoid (Option a) where
  mempty = None

combineResult :: Option Int
combineResult = Some 41 <> Some 1

optionMempty :: Option Int
optionMempty = mempty

-- >>> combineResult
-- Some 42

-- >>> optionMempty
-- Some 0

instance Functor Option where
  fmap _ None = None
  fmap f (Some a) = Some (f a)

instance Applicative Option where
  pure a = Some a

  liftA2 f (Some a) (Some b) = Some (f a b)
  liftA2 _ _ None = None
  liftA2 _ None _ = None

instance Monad Option where
  (>>=) :: Option a -> (a -> Option b) -> Option b
  None >>= _ = None
  (Some a) >>= f = f a

instance Foldable Option where
  foldr _ z None = z
  foldr f z (Some a) = f a z

-- List (Option Int) -> Option (List Int)

fun :: Int -> Maybe Int
fun x = if even x then Just x else Nothing

sequenceUseCase :: [Maybe Int]
sequenceUseCase = fmap fun [1, 2, 3]
sequenceUseCaseResult :: Maybe [Int]
sequenceUseCaseResult = sequenceA sequenceUseCase

-- >>> sequenceUseCase
-- >>> sequenceUseCaseResult
-- [Nothing,Just 2,Nothing]
-- Nothing

instance Traversable Option where
  traverse _ None = pure None
  traverse f (Some a) = Some <$> f a
  sequenceA xs = traverse id xs

instance Traversable List where
  traverse :: (Applicative f) => (a -> f b) -> List a -> f (List b)
  traverse _ Nil = pure Nil
  traverse f (Cons x xs) = liftA2 Cons (f x) (traverse f xs)

-- List (Option Int) -> Option (List Int)

tfoo = Cons None (Cons (Some 20) Nil)

-- >>> traverse id tfoo
-- None

-- (Traversable t, Applicative f) => t a -> (a -> f b) -> f (t b)
-- (Traversable t, Applicative f) => (a -> f b) -> t a -> f (t b)

