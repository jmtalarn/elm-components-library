module Book.Typography exposing (..)

import ElmBook.Chapter exposing (..)
import Typography exposing (..)



-- import ElmBook.Actions exposing (logAction)


componentsList =
    [ ( "Heading 1", heading1 "Heading 1" )
    , ( "Heading 2", heading2 "Heading 2" )
    , ( "Heading 3", heading3 "Heading 3" )
    , ( "Heading 4", heading4 "Heading 4" )
    , ( "Heading 5", heading5 "Heading 5" )
    , ( "Heading 6", heading6 "Heading 6" )
    , ( "Paragraph", paragraph "Minim sit esse anim irure ea voluptate est occaecat cupidatat tempor anim duis. Laboris officia esse sint voluptate. Ullamco magna ipsum esse occaecat qui sint sunt proident magna non magna mollit laboris. Magna esse ut ipsum consectetur Lorem. Nulla laborum sint velit aute aute aliquip occaecat aliqua quis voluptate adipisicing ipsum. Irure nostrud incididunt ad Lorem elit ea elit ad labore est cillum laborum." )
    , ( "Small Text", smallText "Small Text" )
    ]


docs : Chapter x
docs =
    chapter "Typography"
        |> renderComponentList
            componentsList


docsMd : Chapter x
docsMd =
    --let
    --     props =
    --         { label = "Click me!"
    --         , disabled = False
    --         , onClick = logAction "Clicked button!"
    --         }
    -- in
    chapter "Typography with MD"
        |> withComponentList
            componentsList
        |> render """
Typography components in this markdown.

<component-list />

"""
