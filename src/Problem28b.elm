module Problem28b exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List
import List.Extra as List


sortByLengthFrequency : List (List a) -> List (List a)
sortByLengthFrequency lst =
    lst
        |> List.sortBy List.length
        |> List.groupWhile (\a b -> List.length a == List.length b)
        |> List.map
            (\( l1, l2 ) ->
                if List.isEmpty l1 && List.isEmpty l2 then
                    ( 0, [ [] ] )

                else
                    ( List.length (l1 :: l2), l1 :: l2 )
            )
        |> List.sortBy Tuple.first
        |> List.concatMap (\( _, list ) -> list)


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
                sortByLengthFrequency [ [ 1, 2, 3, 4 ], [ 4, 7 ], [ 1 ], [ 4, 7 ], [ 2 ], [ 3 ], [ 6, 7, 8 ], [ 9 ], [ 2, 34, 5 ], [ 4, 7 ], [], [ 4, 7 ], [ 1, 2, 3, 4, 5 ] ]
              )
                == [ 0, 4, 5, 3, 3, 1, 1, 1, 1, 2, 2, 2, 2 ]
            , (List.map List.length <|
                sortByLengthFrequency [ [ 1, 2, 3, 4 ], [ 4, 7 ], [ 1, 2, 3, 4 ], [ 1, 2, 3, 4 ], [ 1 ], [ 4, 7 ], [ 2 ], [ 5, 6, 7, 8 ], [ 3 ], [ 6, 7, 8 ], [ 9 ], [ 2, 34, 5 ], [], [ 1, 2, 3, 4 ] ]
              )
                == [ 0, 2, 2, 3, 3, 1, 1, 1, 1, 4, 4, 4, 4, 4 ]
            , (List.map List.length <|
                sortByLengthFrequency [ [ 1 ], [ 2 ], [ 6, 7, 8 ], [ 9 ], [ 2, 34, 5 ], [], [ 3 ] ]
              )
                == [ 0, 3, 3, 1, 1, 1, 1 ]
            , (List.map List.length <|
                sortByLengthFrequency [ [ 1 ], [ 2 ], [ 3 ], [ 6 ], [ 2 ], List.range 1 100000 ]
              )
                == [ 100000, 1, 1, 1, 1, 1 ]
            , (List.map List.length <|
                sortByLengthFrequency [ [ 1, 2, 3 ], [ 6, 7, 8 ], [ 0 ], [ 2, 3, 5 ] ]
              )
                == [ 1, 3, 3, 3 ]
            , (List.map List.length <|
                sortByLengthFrequency [ [] ]
              )
                == [ 0 ]
            ]
