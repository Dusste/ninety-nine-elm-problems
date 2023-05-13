module Problem14 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


duplicate : List a -> List a
duplicate list =
    case list of
        [] ->
            []

        x :: xs ->
            List.repeat 2 x ++ duplicate xs


main : Html a
main =
    if test then
        Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

    else
        Html.p [ style "color" "red" ] [ text "Your implementation failed at least one test." ]


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( duplicate [ 1, 2, 3, 5, 8, 8 ], [ 1, 1, 2, 2, 3, 3, 5, 5, 8, 8, 8, 8 ] )
        , ( duplicate [], [] )
        , ( duplicate [ 1 ], [ 1, 1 ] )
        ]
        && List.all (\( result, expect ) -> result == expect)
            [ ( duplicate [ "1", "2", "5" ]
              , [ "1", "1", "2", "2", "5", "5" ]
              )
            ]
