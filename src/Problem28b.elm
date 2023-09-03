module Problem28b exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (accept, style)
import List
import List.Extra as List


sortByLengthFrequency : List (List a) -> List (List a)
sortByLengthFrequency lst =
    lst
        |> List.groupWhile (\a b -> List.length a == List.length b)
        |> List.map (\( l1, l2 ) -> ( List.length <| l1 :: l2, l1 :: l2 ))
        |> List.sortBy (\( i, _ ) -> i)
        |> List.map Tuple.second
        |> List.concatMap (\l -> l)


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "orange" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ (List.map List.length <|
                sortByLengthFrequency [ [ 1 ], [ 2 ], [ 3 ], [ 6, 7, 8 ], [ 2, 34, 5 ], [] ]
              )
                == [ 0, 3, 3, 1, 1, 1 ]

            -- , (List.map List.length <|
            --     sortByLengthFrequency [ [ 1 ], [ 2 ], [ 3 ], [ 6 ], [ 2 ], List.range 1 10 ]
            --   )
            --     == [ 100000, 1, 1, 1, 1, 1 ]
            -- , (List.map List.length <|
            --     sortByLengthFrequency [ [ 1, 2, 3 ], [ 6, 7, 8 ], [ 0 ], [ 2, 3, 5 ] ]
            --   )
            --     == [ 1, 3, 3, 3 ]
            -- , (List.map List.length <|
            --     sortByLengthFrequency [ [] ]
            --   )
            --     == [ 0 ]
            ]
