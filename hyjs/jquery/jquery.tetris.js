function RandomNumber ( max ) { return Math.floor(Math.random() * max); }
function RandomNumberExcept ( max, except ) { var r = except; while (r == except) r = Math.floor(Math.random() * max); return r; }
(function($) { //jquery tetris
    $.Shape = function() {}
    $.Shape.size = 16;
    var $x = 0,
        $y = 0;
    var TotalShapes = 8;
    var current_color = 0;
    var  left = 0,
        right = 1;
    var   Box = [1,1,0,1,1,-1],
        Stick = [0,0,0,1,1,1,-1],
       Diaper = [1,1,1,0,1,-1],
     LeftBoot = [1,1,1,1,-1],
    RightBoot = [1,1,1,0,0,1,-1],
          You = [1,1,1,1,0,1,-1],
          Zee = [1,1,0,0,1,0,0,1,1],
   Impossible = [0,1,0,1,1,1,-1], //*reversed diaper
      Current = [0,0,0,0,0,0,0,0,0];
    var color = ["red","green","yellow","blue","orange","purple"];
    $.Shape.list = [Box, Stick, Diaper, LeftBoot, RightBoot, You, Diaper, Impossible, Current];
    $.Shape.RotateLeft = [2,5,8,1,4,7,0,3,6];
    $.Shape.RotateRight = [6,3,0,7,4,1,8,5,2];
    $.Shape.rotatetype = [$.Shape.RotateLeft, $.Shape.RotateRight];
    $.Tetris = $.T = function() {}
    var grid_width   = 0,
        grid_height  = 1,
        square_size  = 2,
        game_score   = 3,
        game_level   = 4,
        bg_animation = 5;
    var grid_size    = 6;
    var parameters = function() {
        this.options = [ 10, 20, 16, 0, 0, false ];
    };
    $.T.CreateGrid = function() {
        var result = "";
        var size = $.T.params.options[grid_size];
        var sqSize = $.T.params.options[square_size];
        var width = $.T.params.options[grid_width];
        for (var i = 0; i < size; i++) {
            var pos = [ (i % width) * sqSize, Math.floor(i / width) * sqSize ];
            result += "<div id = 'square" + i + "' class = 'square' style = 'left: " + pos[0] + "px; top: " + pos[1] + "; width:" + sqSize + "px; height:" + sqSize + "px;'></div>";
        }
        $("#TetrisContainer").html( result );
        $x = (width / 2) - 2;
        var gy = 0;
        var h = -1;
        var height = $.T.params.options[grid_height];
        for (var i = 0; i < height; i++) {
           $("#square" + (i % height) * width).addClass("leftside");
           $("#square" + (h += width)).addClass("rightside");
        }
        for (var i = 0; i < width; i++) {
            $("#square" + ((width*height)-width+i)).addClass("solid");
            $("#square" + ((width*height)-width+i)).addClass("bottom");
        }
    }
    $.T.Next = function() {
        var ret = [];
        var obj = $.Shape.list[RandomNumber( TotalShapes )];
        for (var i = 0; i < 9; i++)
            obj[i] == 1 ? ret[i] = obj[i] : ret[i] = 0;
        current_color = RandomNumberExcept( 6, current_color );
        return ret;
    }
    $.T.Copy = function ( dx, dy ) {
        var needle = 0;
        var shape = $.Shape.list[ TotalShapes ];
        var width = $.T.params.options[grid_width];
        for (var i = 0; i < 9; i++) {
            needle = dx + (dy * width) + ((Math.floor(i / 3)) + ((i % 3) * width));
            var targetID = "#square" + needle;
            $(targetID).removeClass("on");
            if (shape[i] == 1) {
                $(targetID).addClass("on");
                $(targetID).addClass(color[current_color]);
            }
            else
            if (shape[i] == -1)
                break;
        }
    };
    $.T.Clear = function ( dx, dy ) {
        var needle = 0;
        var destination_width = $.T.params.options[grid_width];
        var start = dx + (dy * destination_width);
        for (var i = 0; i < 9; i++) {
            needle = dx + (dy * destination_width) + ((Math.floor(i / 3)) + ((i % 3) * destination_width));
            var targetID = "#square" + needle;
            $(targetID).removeClass("on");
            for (var j = 0; j < 6; j++)
                if ($(targetID).is("."+color[j]) && !$(targetID).is(".solid"))
                    $(targetID).removeClass(color[j]);
        }
    }
    $.T.Rotate = function( direction, shape ) {
        var clean = [0,0,0,0,0,0,0,0,0];
        var matrix = $.Shape.rotatetype[ direction ];
        for (var i = 0; i < $.Shape.size; i++)
            clean[i] = shape[ matrix[i] ];
        return clean;
    }
    $.T.Constrain = function( paste, left, right ) {
        var target_id = TotalShapes;
        var dx = $x;
        var dy = $y;
        var needle = 0;
        var shape = $.Shape.list[target_id];
        var width = $.T.params.options[grid_width];
        var next = false;
        for (var i = 0; i < 9; i++) {
            needle = $x + ($y * width) + ((Math.floor(i / 3)) + ((i % 3) * width));
            var targetID = "#square" + needle;
            if ($(targetID).is(".solid") && shape[i] == 1) {
                if (left)
                  $x++;
                if (right)
                  $x--;
                next = true;
            }
            if ($(targetID).is(".leftside") && shape[i] == 1 && next != true) {
                $x++;
                return false;
            }
            if ($(targetID).is(".rightside") && shape[i] == 1 && next != true) {
                $x--;
                return false;
            }
        }
        if (next && paste) {
            $y--;
            for (var i = 0; i < 9; i++) {
                needle = $x + ($y * width) + ((Math.floor(i / 3)) + ((i % 3) * width));
                var targetID = "#square" + needle;
                if (shape[i] == 1) {
                    $(targetID).addClass("on");
                    $(targetID).addClass("solid");
                    $(targetID).addClass(color[current_color]);
                }
            }
            $.Shape.list[TotalShapes] = $.T.Next();
            $x = (width / 2) - 2;
            $y = 0;
            return true;
        }
        return false;
    }
    $.T.Initialize = function() {
        $.T.params = new parameters();
        var _ = $.T.params.options;
        for (var i = 0; i < arguments.length; i++)
            _[i] = arguments[i];
        _[grid_size] = _[grid_width] * _[grid_height];
        // create grid
        $.T.CreateGrid();
        $.Shape.list[TotalShapes] = $.T.Next();
        $.T.Copy($x, $y);
        // get controls
        var kl = Array(37,39,40,90,88);
        var a = Array([-1,-1,0,false,true],[-1,1,0,false,false,true],[-1,0,1, true],[1,0,0],[0,0,0]);
        /*jquery tetris author: greg.sidelnikov@gmail.com*/
        $(document).keyup(function(event) {
            for (var i=0;i<5;i++) {
                if (event.keyCode == kl[i]) {
                    $.T.Clear($x, $y);
                    $x += a[i][1];
                    $y += a[i][2]
                    if (a[i][0] != -1)
                        $.Shape.list[TotalShapes] = $.T.Rotate( a[i][0], $.Shape.list[TotalShapes]);
                    $.T.Constrain( a[i][3], a[i][4], a[i][5]);
                    $.T.Copy($x, $y);
                    break;
                }
            }
            if (event.keyCode == 32)
                $.T.Drop();
        });
    };
    // drop current tetris piece
    $.T.Drop = function() {
        $.T.Clear($x, $y);
        while(!$.T.Constrain( true ))
            $y++;
    }
    $.T.Play = function() {
        setInterval(function(){ $.T.Clear($x, $y++); $.T.Constrain( true, false, false ); $.T.Copy($x, $y); }, 500);
    };
})(jQuery);