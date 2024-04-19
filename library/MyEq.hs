{-# LANGUAGE InstanceSigs #-}

module MyEq (TrafficLight (..)) where

data TrafficLight = Red | Yellow | Green

instance Eq TrafficLight where
  (==) :: TrafficLight -> TrafficLight -> Bool
  Red == Red = True
  Green == Green = True
  Yellow == Yellow = True
  _ == _ = False
  (/=) :: TrafficLight -> TrafficLight -> Bool
  a /= b = not (a == b)
