module Styles exposing (game, board, heap, coin, title)

type alias Style = List (String, String)


game : Style
game =
  [ ("margin", "50px auto")
  , ("width", "300px")
  ]


title : Style
title =
  [ ("font", "20px/1 sans-serif")
  , ("margin-bottom", "20px")
  ]


board : Style
board =
  [ ("display", "flex")
  , ("width", "300px")
  , ("height", "200px")
  , ("border-bottom", "2px solid #550")
  ]


heap : Style
heap =
  [ ("align-self", "flex-end")
  , ("flex-grow", "1")
  , ("width", "100px")
  ]


coin : Style
coin =
  [ ("display", "block")
  , ("margin", "1px auto")
  , ("color", "#550")
  , ("background", "#FF0")
  , ("min-width", "50px")
  , ("font", "20px/1 sans-serif")
  , ("border", "2px solid currentColor")
  ]
