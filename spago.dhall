{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name =
    "hedwig"
, dependencies =
    [ "aff"
    , "affjax"
    , "console"
    , "effect"
    , "integers"
    , "nullable"
    , "prelude"
    , "psci-support"
    , "random"
    , "signal"
    , "web-dom"
    , "web-events"
    , "web-html"
    ]
, packages =
    ./packages.dhall
, sources =
    -- [ "src/**/*.purs", "test/**/*.purs" ]
    [ "src/**/*.purs", "examples/**/*.purs" ]
}
