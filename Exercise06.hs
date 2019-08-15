module CIS194.Homework01.Exercise06 (hanoi4Pegs) where

import CIS194.Homework01.Exercise05 (hanoi)

type Disks = Integer
type Peg   = String
type Move  = (Peg, Peg)

hanoi3Pegs = hanoi

sqrtInt :: Integer -> Double
sqrtInt = sqrt . fromIntegral

{-
  Tower Of Hanoi & Reve Puzzles (Page 5 ~ 6)
  https://cs.nyu.edu/courses/summer07/G22.2340-001/Presentations/McCann.pdf

  Selection of k:
  In 1939, J.S. Frame and B. M. Stewart claimed that for certain N,
  if N is a triangular number, then k can be chosen such that this algorithm is
  in fact an optimal solution (when n = k * (k+1) / 2 ). (n > 3)
  This claim became known as “Frame’s conjecture”.

  That translates to:
    k ≈ (2 ^ √2n) * (√n − 1) + 1

  Variations on the Four-Post Tower of Hanoi Puzzle
  http://www.cs.wm.edu/~pkstoc/boca.pdf
-}
optimalKFor4Pegs :: Disks -> Disks
optimalKFor4Pegs n
  | 3 >= n    = floor (2 ** sqrtInt (2 * n) * sqrtInt (n - 1)) + 1
  | otherwise = floor (2 ** sqrtInt (2 * n) * sqrtInt (n - 1))

{-
  Frame-Stewart Algorithm:
  * Let n be the number of disks.
  * Let r be the number of pegs.
  * Define T(n, r) as the minimum moves required to move n disks to the destination peg.

  Steps:
  * For some k, 1 <= k < n, transfer the top k disks to a single other peg.
  * Without disturbing the peg that now contains the top k disks,
    transfer the bottom (n - k) disks to the destination peg (with 1 less temp peg).
  * Transfer the top k disks to the destination peg.
-}
hanoi4Pegs :: Disks -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4Pegs n start destination temp1 temp2
  | 0 >= n    = []
  | n == 1    = [(start, destination)]
  | n == 2    = [(start, temp1), (start, destination), (temp1, destination)]
  | n == 3    = [(start, temp1), (start, temp2), (start, destination), (temp1, destination), (temp2, destination)]
  | otherwise =
      hanoi4Pegs k start temp1 destination temp2 ++
      hanoi3Pegs (n - k) start destination temp2 ++
      hanoi4Pegs k temp1 destination start temp2
      where k = optimalKFor4Pegs n
