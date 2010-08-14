#
CC = gcc.exe
CXX = g++.exe
WINDRES = windres.exe
#
SRCEXT = .c
OBJEXT = .o
BINEXT = .exe

#
TCL_DIR=D:/Progs/MinGW/ThirdParty/tcl84

#
CFLAGS = -DUSE_TCL_STUBS
CXXFLAGS =
INC = -I"$(TCL_DIR)/include"
LIB = -L"$(TCL_DIR)/lib" -shared -ltclstub84

#
SRCDIR = .
INCDIR = .
IN  = 	hello.c
SRC = $(addprefix $(SRCDIR)/, $(IN)) 

#
OBJ = ${IN:$(SRCEXT)=$(OBJEXT)}
BIN = libhello.dll
RC  = 
RES = ${RC:.rc=.res}
#
HEADER = 
#
all: $(BIN)

#
$(BIN) : $(OBJ) $(RES)
	$(CC) -o $(BIN) $(OBJ) $(LIB) $(RES)

#
$(OBJ) : $(SRC) $(HEADER)
	$(CC) -c -DBUILD_EXE $(SRC) $(CFLAGS) $(INC)

#
$(RES) : $(RC)
	$(WINDRES) -i $(RC) -o $(RES) -O coff 
    
#
clean :
	rm ${OBJ} ${BIN}
