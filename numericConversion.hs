romanToArabic :: String -> Int
romanToArabic "" = 0
romanToArabic (x:xs)
	| x == 'C' && not (null xs) && head xs == 'M' = 900 + romanToArabic (tail xs)
	| x == 'C' && not (null xs) && head xs == 'D' = 400 + romanToArabic (tail xs)
	| x == 'X' && not (null xs) && head xs == 'C' = 90 + romanToArabic (tail xs)
	| x == 'X' && not (null xs) && head xs == 'L' = 40 + romanToArabic (tail xs)
	| x == 'I' && not (null xs) && head xs == 'X' = 9 + romanToArabic (tail xs)
	| x == 'I' && not (null xs) && head xs == 'V' = 4 + romanToArabic (tail xs)
	| x == 'M' = 1000 + romanToArabic xs
	| x == 'D' = 500 + romanToArabic xs
	| x == 'C' = 100 + romanToArabic xs
	| x == 'L' = 50 + romanToArabic xs
	| x == 'X' = 10 + romanToArabic xs
	| x == 'V' = 5 + romanToArabic xs
	| x == 'I' = 1 + romanToArabic xs
	| otherwise = 0

arabicToRomain :: Int -> String
arabicToRomain x
	| x `quot` 1000 > 0 = (replicate (x `quot` 1000) 'M') ++ arabicToRomain (x - (x `quot` 1000) * 1000)
	| x `quot` 900 > 0 = "CM" ++ arabicToRomain (x - 900)
	| x `quot` 500 > 0 = "D" ++ arabicToRomain (x - 500)
	| x `quot` 400 > 0 = "CD" ++ arabicToRomain (x - 400)
	| x `quot` 100 > 0 = (replicate (x `quot` 100) 'C') ++ arabicToRomain (x - (x `quot` 100) * 100)
	| x `quot` 90 > 0 = "XC" ++ arabicToRomain (x - 90)
	| x `quot` 50 > 0 = "L" ++ arabicToRomain (x - 50)
	| x `quot` 40 > 0 = "XL" ++ arabicToRomain (x - 40)
	| x `quot` 10 > 0 = (replicate (x `quot` 10) 'X') ++ arabicToRomain (x - (x `quot` 10) * 10)
	| x `quot` 9 > 0 = "IX" ++ arabicToRomain (x - 9)
	| x `quot` 5 > 0 = "V" ++ arabicToRomain (x - 5)
	| x `quot` 4 > 0 = "IV" ++ arabicToRomain (x - 4)
	| x `quot` 1 > 0 = (replicate (x `quot` 1) 'I') ++ arabicToRomain (x - (x `quot` 1))
	| otherwise = ""
 