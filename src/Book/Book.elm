module Book.Book exposing (..)

import Book.Input as Input
import Book.Typography as Typography
import ElmBook exposing (withChapterGroups)
import ElmBook.ElmCSS exposing (..)


main : Book ()
main =
    book "Components"
        |> withChapterGroups
            [ ( "Typography"
              , [ Typography.docs
                ]
              )
            , ( "Input", [ Input.docs ] )
            ]
