module ProblemExtra1 exposing (dropWhile, isEven, isOdd, main)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


dropWhile : (a -> Bool) -> List a -> List a
dropWhile predicate list =
    case list of
        [] ->
            []

        x :: xs ->
            if predicate x then
                dropWhile predicate xs

            else
                x :: xs


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
            [ dropWhile isOdd [ 1, 2, 1 ] == [ 2, 1 ]
            , dropWhile isEven [ 1, 2, 1 ] == [ 1, 2, 1 ]
            , dropWhile isEven [ 2, 4, 5, 6, 7 ] == [ 5, 6, 7 ]
            , dropWhile isEven [] == []
            , dropWhile isEven [ 2, 4, 100000, 1 ] == [ 1 ]
            , dropWhile ((>) 5) (List.range 1 10) == [ 5, 6, 7, 8, 9, 10 ]
            , dropWhile ((>) 50) (List.range 1 10) == []
            ]


isEven x =
    remainderBy 2 x == 0


isOdd x =
    remainderBy 2 x /= 0
