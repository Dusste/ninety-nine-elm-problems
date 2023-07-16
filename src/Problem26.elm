module Problem26 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


combinations : Int -> List a -> List (List a)
combinations n list =
    if n <= 0 then
        [ [] ]

    else
        case list of
            [] ->
                []

            x :: xs ->
                let
                    combinationsWithoutX =
                        combinations n xs

                    combinationsWithX =
                        List.map (\comb -> x :: comb) (combinations (n - 1) xs)
                in
                combinationsWithX ++ combinationsWithoutX


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
            [ combinations 2 [ 'a', 'b', 'c' ] == [ [ 'a', 'b' ], [ 'a', 'c' ], [ 'b', 'c' ] ]
            , combinations 2 (List.range 1 3) == [ [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
            , combinations 2 (List.range 1 4) == [ [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 2, 3 ], [ 2, 4 ], [ 3, 4 ] ]
            , combinations 1 (List.range 1 5) == [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ] ]
            , combinations 0 (List.range 1 10) == [ [] ]
            , combinations -1 (List.range 1 10) == [ [] ]
            , List.length (combinations 3 (List.range 1 12)) == 220
            , List.length (combinations 4 (List.range 1 15)) == 1365
            ]
