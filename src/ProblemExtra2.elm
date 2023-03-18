module ProblemExtra2 exposing (main, takeWhile)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


takeWhile : (a -> Bool) -> List a -> List a
takeWhile predicate list =
    case list of
        [] ->
            []

        x :: xs ->
            if predicate x then
                x :: takeWhile predicate xs

            else
                []


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ takeWhile isOdd [ 1, 2, 1 ] == [ 1 ]
            , takeWhile isEven [ 1, 2, 1 ] == []
            , takeWhile isEven [] == []
            , takeWhile isEven [ 2, 4, 100000, 1 ] == [ 2, 4, 100000 ]
            , takeWhile ((>) 5) (List.range 1 10) == [ 1, 2, 3, 4 ]
            , takeWhile ((>) 50) (List.range 1 10) == List.range 1 10
            ]


isEven x =
    remainderBy 2 x == 0


isOdd x =
    remainderBy 2 x /= 0
