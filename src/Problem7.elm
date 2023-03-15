module Problem7 exposing (flatten, main, nl1, nl2)

import Browser.Dom exposing (Element)
import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


type NestedList a
    = Elem a
    | SubList (List (NestedList a))


flatten : NestedList a -> List a
flatten nl =
    case nl of
        SubList a ->
            List.concatMap (\nestedList -> flatten nestedList) a

        Elem a ->
            [ a ]


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]



-- nl0 : NestedList a


nl0 =
    SubList [ Elem 1, Elem 2 ]



-- nl1 : NestedList a


nl1 =
    SubList
        [ Elem 1
        , SubList
            [ SubList
                [ Elem 2
                , SubList [ Elem 3, Elem 4 ]
                ]
            , Elem 5
            ]
        , Elem 6
        , SubList [ Elem 7, Elem 8, Elem 9 ]
        ]


nl2 =
    SubList
        [ Elem 1
        , SubList
            [ SubList
                [ Elem 2
                , SubList [ Elem 3, Elem 4 ]
                ]
            , Elem 5
            ]
        , Elem 6
        , SubList [ SubList [ Elem 7, SubList [ Elem 8 ] ], SubList [ Elem 9, SubList [ Elem 10 ] ], SubList [ Elem 11, SubList [ Elem 12 ] ] ]
        ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ flatten nl1 == List.range 1 9
            , flatten (SubList [ Elem 1, Elem 2 ]) == [ 1, 2 ]
            , flatten (SubList [ Elem "a", Elem "b" ]) == [ "a", "b" ]
            , flatten nl1 == [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
            , flatten nl2 == [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ]
            , flatten (SubList []) == []
            ]
