module ZipLists (applicativeZipList) where

import Control.Applicative (ZipList (ZipList))

zipList1 :: ZipList Int
zipList1 = ZipList [1, 2, 3]

zipList2 :: ZipList Int
zipList2 = ZipList [4, 5, 6]

applicativeZipList :: ZipList Int
applicativeZipList = (*) <$> zipList1 <*> zipList2
