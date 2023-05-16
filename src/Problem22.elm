module Problem22 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


range : Int -> Int -> List Int
range start end =
    rangeHelper start end start


rangeHelper : Int -> Int -> Int -> List Int
rangeHelper st en cnt =
    if st == en then
        [ st ]

    else if st > en && cnt >= en then
        cnt :: rangeHelper st en (cnt - 1)

    else if st < en && cnt <= en then
        cnt :: rangeHelper st en (cnt + 1)

    else
        []


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ range 1 5 == [ 1, 2, 3, 4, 5 ]
            , range 0 5 == [ 0, 1, 2, 3, 4, 5 ]
            , range -1 5 == [ -1, 0, 1, 2, 3, 4, 5 ]
            , range 5 -1 == [ 5, 4, 3, 2, 1, 0, -1 ]
            , range 5 5 == [ 5 ]
            , List.length (range 1 999) == 999
            ]
