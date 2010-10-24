
            var KEYDOWN = false;
            var tmp = [undefined, 0];
            function RandomNumber ( max ) { return Math.floor(Math.random() * max); }
            function RandomNumberExcept ( max, except ) { var r = except; while (r == except) r = Math.floor(Math.random() * max); return r; }

            // Plugin default parameters - can be overriden with gSprite.initialize( arguments )
            function options() {
                this.params = {
                    data : Array (
                        "Aladdin64.gif", // image
                        8,               // number of sprites
                        64,              // sprite dimensions (square)
                        0,               // current frame index
                        0,               // interval timer object
                        0,               // animation delay counter
                        100              // animation delay
                    )
                };
            };

            var SelectedAnimation = 0;       // run right - default

            var AnimationMap = Array(
                    Array(0,8),              // run right
                    Array(8,16)              // right left
                );

            var TimerInterval = 0;

            // Plugin base object
            $.gSprite = function()
            {

            }

            var c = 0;

            // Runs the plugin
            $.gSprite.run = function( d )
            {
                if ( TimerInterval )
                    clearInterval( TimerInterval );
                TimerInterval = setInterval("$.gSprite.animate()", d);
            };

            $.gSprite.animate = function( )
            {
                var max    = AnimationMap[ SelectedAnimation ][ 1 ];
                var dim    = $.options.params.data[2];
                var c      = $.options.params.data[5];
                var frame  = $.options.params.data[3];

                if (c++ > 2)
                {
                    if (frame < max - 1)
                        $.options.params.data[3]++;
                    else
                        $.options.params.data[3] = AnimationMap[ SelectedAnimation ][ 0 ];

                    c = 0;
                }

                frame  = $.options.params.data[3];

                $("#Animation").css("background-position", -frame * dim + " 0");

                $.options.params.data[5] = c;
            };

            // Initializes plugin
            $.gSprite.initialize = function( ) /* assumes arguments are passed here to override default values in $.options.params.data */
            {
                // get options from the argument list
                $.options = new options();
                for(var i = 0; i < arguments.length; i++)
                    $.options.params.data[ i ] = arguments[ i ];

                var sprite = $.options.params.data[0];
                $("#Animation").css("background-image", "url(" + sprite + ")");
            }

            var keymap = Array(
                37, // 0  left
                39  // 1  right
                );

            $(window).keydown(function(event) {
                KEYDOWN = false;
                switch (event.keyCode) {
                    case keymap[0]: // left
                    {
                        SelectedAnimation = 1;
                        var curX = parseInt($("#Animation").css("left"));
                        $("#Animation").css("left", curX -= 2);

                        // move background
                        var bgCurX = parseInt($("#Background").css("left"));
                        $("#Background").css("left", bgCurX += 1);

                        $.gSprite.run( 0 );
                        KEYDOWN = true;
                        break;
                    };
                    case keymap[1]: // right
                    {
                        SelectedAnimation = 0;
                        var curX = parseInt($("#Animation").css("left"));
                        $("#Animation").css("left", curX += 2);

                        var bgCurX = parseInt($("#Background").css("left"));
                        $("#Background").css("left", bgCurX -= 1);

                        $.gSprite.run( 0 );
                        KEYDOWN = true;
                        break;
                    }
                    default:
                        KEYDOWN = true;
                        break;
                }
            });