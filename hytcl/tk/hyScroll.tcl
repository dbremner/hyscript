#!/usr/bin/wish

proc ScrollListboxes {listboxes args} {
    foreach lb $listboxes {
        eval $lb yview $args
    }
}

scrollbar .scroll -command {ScrollListboxes {.lb1 .lb2 .lb3}}
listbox .lb1 -yscrollcommand {.scroll set}
listbox .lb2 -yscrollcommand {.scroll set}
listbox .lb3 -yscrollcommand {.scroll set}
pack .lb1 .lb2 .lb3 .scroll -side right -fill y -expand yes

.lb1 insert 0 1 2 3 4 5 6 7 8 9 10
.lb2 insert 0 a b c d e f g h i j
.lb3 insert 0 A B C D E F G H I J

