button .hello -text "Hello, world" -command {
    puts stdout "Hello, world"; destroy .
}
pack .hello