#include <stdio.h>

#include <tcl.h>

/*
 * Static global data
 */

static Tcl_Interp * tcl_interp ; /* Script interpreter */

int InitScript(void)
{
    char *pstr;
    FILE *infile;
    int retval;
    int rc;
    size_t  filesize ;

    tcl_interp = Tcl_CreateInterp() ;

    if ( tcl_interp == NULL )
    {
        fprintf( stderr, "Could not create interpreter!\n" ) ;
        return 1 ;
    }

    // Register the commands specific to my application 

    //Tcl_CreateObjCommand( tcl_interp, "session", GppSessionCmd,
    //        (ClientData) NULL, GppDummyDestroy ) ;

    // Read the configuration file with specific script code
    // (in reality, I use a function that searches for the file and opens it!
    // Hence I need to do more work ... If you have the file name, then use
    // Tcl_EvalFile()!)
    //infile = fopen( "scripts.conf", "r" ) ;

    //if ( infile == NULL )
    //{
    //    return 1 ;
    //}

    //// Now, read the whole file ...

    //fseek( infile, 0L, SEEK_END ) ;
    //filesize = ftell( infile ) ;
    //pstr     = (char *) malloc( (filesize+1) * sizeof(char) ) ;
    //fseek( infile, 0L, SEEK_SET ) ;

    //fread( pstr, filesize, 1, infile ) ;
    //pstr[filesize] = '\0' ;

    //rc = Tcl_Eval( tcl_interp, pstr ) ;

    //if ( rc != TCL_OK )
    //{
    //    fprintf( stderr, "Error loading script library\n" ) ;
    //    return 1 ;
    //}

    //free( pstr ) ;

    return 0;
}

/* Function for encapsulating the details
*/
int EvalScriptCommand( char *command )
{
    if ( Tcl_Eval( tcl_interp, command ) == TCL_OK )
    {
        return 0 ;
    }
    else
    {
        return 1 ;
    }
}

int main()
{
    char *command = "puts \"Hello world!\"";

    if (!InitScript())
    {
        EvalScriptCommand(command);
    }

    getchar();
    return 0;
}

