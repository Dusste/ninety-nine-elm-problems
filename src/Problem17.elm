module Problem17 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


split : List a -> Int -> ( List a, List a )
split list count =
    if count == 0 || count < 0 then
        ( [], list )

    else if count > List.length list then
        ( list, [] )

    else
        case list of
            [] ->
                ( [], [] )

            x :: xs ->
                ( List.take count (x :: xs), List.drop count (x :: xs) )


main : Html a
main =
    if test then
        Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

    else
        Html.p [ style "color" "red" ] [ text "Your implementation failed one test at least." ]


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( split (List.range 1 5) 0, ( [], [ 1, 2, 3, 4, 5 ] ) )
        , ( split (List.range 1 5) 2, ( [ 1, 2 ], [ 3, 4, 5 ] ) )
        , ( split (List.range 1 5) 3, ( [ 1, 2, 3 ], [ 4, 5 ] ) )
        , ( split [ 4, 9, 2, 9, 8, 6, 1, 3, 7 ] 7, ( [ 4, 9, 2, 9, 8, 6, 1 ], [ 3, 7 ] ) )
        , ( split (List.range 1 5) 4, ( [ 1, 2, 3, 4 ], [ 5 ] ) )
        , ( split (List.range 1 5) 5, ( [ 1, 2, 3, 4, 5 ], [] ) )
        , ( split (List.range 1 5) 6, ( [ 1, 2, 3, 4, 5 ], [] ) )
        , ( split (List.range 1 5) -1, ( [], [ 1, 2, 3, 4, 5 ] ) )
        ]
        && List.all (\( result, expect ) -> result == expect)
            [ ( split [ "aab", "b", "c", "aa" ] 2, ( [ "aab", "b" ], [ "c", "aa" ] ) )
            ]
