module Book.Book exposing (..)

import Book.Typography exposing (docs, docsMd)
import ElmBook exposing (..)


main : Book ()
main =
    book "Components"
        |> withChapterGroups
            [ ( "Typography"
              , [ docs
                , docsMd
                ]
              )
            ]
