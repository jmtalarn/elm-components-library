module Theme exposing (config, theme)

import Css exposing (..)
import Dict


config : { fontSize : number }
config =
    { fontSize = 16
    }


type alias Colors =
    { primary : Color
    , primaryLight : Color
    , primaryDark : Color
    , background : Color
    , surface : Color
    , surfaceDark : Color
    , surfaceLight : Color
    , text : Color
    , textMuted : Color
    , success : Color
    , error : Color
    }


themeColors : Colors
themeColors =
    { primary = rgb 212 175 55 -- Gold-like primary color
    , primaryLight = rgb 240 210 100
    , primaryDark = rgb 160 120 40
    , background = rgb 8 15 25 -- Dark blueish-black background
    , surface = rgb 15 25 40 -- Slightly lighter dark blue
    , surfaceDark = rgb 10 20 35 -- Even darker for deeper sections
    , surfaceLight = rgb 25 45 70 -- Lighter shade for contrast
    , text = rgb 52 58 64 -- Light gray text for contrast
    , textMuted = rgb 201 201 201 -- Muted text for less emphasis
    , success = rgb 50 200 100 -- Slightly softer green
    , error = rgb 200 60 60 -- A deep red for errors
    }


defaultColor : Maybe Color -> Color
defaultColor maybeColor =
    Maybe.withDefault (rgb 0 0 0) maybeColor



-- Default to black if no color is provided


type alias ShadowsType =
    { lg : Maybe Color -> Style, md : Maybe Color -> Style, sm : Maybe Color -> Style }


themeShadows : ShadowsType
themeShadows =
    { lg = \color -> boxShadow4 (px 0) (px 0) (px 15) (Maybe.withDefault (rgba 0 0 0 0.9) color)
    , md = \color -> boxShadow4 (px 0) (px 0) (px 10) (Maybe.withDefault (rgba 0 0 0 0.5) color)
    , sm = \color -> boxShadow4 (px 0) (px 0) (px 5) (Maybe.withDefault (rgba 0 0 0 0.3) color)
    }


type alias FontsType =
    { body : List Style, headers : Int -> List Style, input : List Style, error : List Style }


themeFonts : FontsType
themeFonts =
    let
        headingAttrs : number -> List Style
        headingAttrs headingSize =
            let
                factorSize =
                    Maybe.withDefault 1 <| Dict.get headingSize (Dict.fromList [ ( 1, 4 ), ( 2, 3.5 ), ( 3, 3 ), ( 4, 2.5 ), ( 5, 2 ), ( 6, 1.5 ) ])
            in
            [ fontWeight bold
            , Css.property "font-family" "var(--font-family)"
            , fontSize (px (config.fontSize * factorSize))
            ]
    in
    { body =
        [ Css.property "font-family" "var(--font-family)"
        , fontWeight (int 300)
        , color themeColors.text
        , fontSize (px config.fontSize)
        ]
    , headers = \x -> headingAttrs x
    , input =
        [ Css.property "font-family" "var(--font-family)"
        , fontWeight (int 300)
        , fontSize (px config.fontSize)
        , pseudoElement "placeholder"
            [ color themeColors.textMuted ]
        ]
    , error = [ fontFamilies [ .value monospace ], color themeColors.error ]
    }


theme : { colors : Colors, shadows : ShadowsType, fonts : FontsType }
theme =
    { colors = themeColors
    , shadows = themeShadows
    , fonts = themeFonts
    }
