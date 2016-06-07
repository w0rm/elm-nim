import Html exposing (Html, div, button, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html.App
import Styles


type alias Model =
  { isPlaying : Bool
  , player : Int
  , heaps : List Int
  }


type Msg = Take Int Int | Start


main : Program Never
main =
  Html.App.beginnerProgram
    { model = initialModel
    , view = view
    , update = update
    }


update : Msg -> Model -> Model
update msg {isPlaying, player, heaps} =
  case msg of
    Take heap coins ->
      let
        newHeaps = List.indexedMap (\n c ->
          if n == heap then
            c - coins
          else
            c
        ) heaps
        gameOver = newHeaps == [0, 0, 0]
      in
        { isPlaying = not gameOver
        , heaps = newHeaps
        , player = if gameOver then player else if player == 1 then 2 else 1
        }
    Start ->
      initialModel


initialModel : Model
initialModel =
  { isPlaying = True
  , player = 1
  , heaps = [3, 4, 5]
  }


view : Model -> Html Msg
view {isPlaying, player, heaps} =
  if isPlaying then
    gameView
      ("Player " ++ toString player)
      ( div
          [style Styles.board]
          (List.indexedMap heapView heaps)
      )
  else
    gameView
      ("Player " ++ toString player ++ " has won!")
      (button [onClick Start] [text "Start the new game"])


gameView : String -> Html Msg -> Html Msg
gameView title content =
  div
    [style Styles.game]
    [ div [style Styles.title] [text title]
    , content
    ]


heapView : Int -> Int -> Html Msg
heapView heap coins =
  div
    [style Styles.heap]
    (List.map (coinView heap) [1..coins])


coinView : Int -> Int -> Html Msg
coinView heap coins =
  button
    [ style Styles.coin
    , onClick (Take heap coins)
    ]
    [text (toString coins)]
