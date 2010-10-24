/* Automatically generated code */
/* DO NOT EDIT */
#ifndef ET_TCLARGS
#include <tcl.h>
#ifdef __cplusplus
# define ET_TYPE "C"
#else
# define ET_TYPE
#endif
extern ET_TYPE char *mprintf(const char*,...);
extern ET_TYPE char *vmprintf(const char*,...);
extern ET_TYPE int Et_EvalF(Tcl_Interp*,const char *,...);
extern ET_TYPE int Et_GlobalEvalF(Tcl_Interp*,const char *,...);
extern ET_TYPE char *Et_DStringAppendF(Tcl_DString*,const char*,...);
extern ET_TYPE int Et_ResultF(Tcl_Interp*,const char*,...);
extern ET_TYPE int Et_Init(int,char**);
extern ET_TYPE Tcl_Interp *Et_Interp;
#if TCL_RELEASE_VERSION>=8
extern ET_TYPE int Et_AppendObjF(Tcl_Obj*,const char*,...);
#endif
#define ET_TCLARGS ClientData clientData,Tcl_Interp*interp,int argc,char**argv
#define ET_OBJARGS ClientData clientData,Tcl_Interp*interp,int objc,Tcl_Obj *CONST objv[]
#endif
