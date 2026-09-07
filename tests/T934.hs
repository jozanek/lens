{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
-- | 'makeConstructors' on a type whose constructor name is reused by a type
-- in templates.hs, which must pick up the class declared here instead of
-- redeclaring it.
module T934 where

import Control.Lens

data T934 = T934One Int String | T934Two String
makeConstructors ''T934

checkT934One :: Prism' T934 (Int, String)
checkT934One = _T934One

checkT934Two :: AsT934Two t a => Prism' t a
checkT934Two = _T934Two
