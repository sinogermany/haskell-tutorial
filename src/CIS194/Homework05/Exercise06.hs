{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module CIS194.Homework05.Exercise06 (HasVars(..), withVars) where

import qualified Data.Map as M

import CIS194.Homework05.Exercise03 (Expr(..))

class HasVars a where
  var :: String -> a

{-
data VarExprT = Lit Integer
              | Add VarExprT VarExprT
              | Mul VarExprT VarExprT
              | Var String
  deriving (Show, Eq)

instance HasVars VarExprT where
  var = Var

instance Expr VarExprT where
  lit = Lit
  add = Add
  mul = Mul
-}

instance HasVars (M.Map String Integer -> Maybe Integer) where
  var = M.lookup

instance Expr (M.Map String Integer -> Maybe Integer) where
  lit         = const . Just
  add f1 f2 m = (+) <$> f1 m <*> f2 m
  mul f1 f2 m = (*) <$> f1 m <*> f2 m

withVars :: [(String, Integer)]
         -> (M.Map String Integer -> Maybe Integer)
         -> Maybe Integer
withVars vs expr = expr $ M.fromList vs
