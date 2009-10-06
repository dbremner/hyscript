#
CC = gcc.exe -g
CXX = g++.exe
WINDRES = windres.exe
#
SRCEXT = .c
OBJEXT = .o
BINEXT = .exe

#
CFLAGS =
CXXFLAGS =
INC = -I"../../inc"
LIB = -L"../../lib" -ltcl84

#
SRCDIR = .
INCDIR = .
IN  = test.c
SRC = $(addprefix $(SRCDIR)/, $(IN))

#
OBJ = ${IN:$(SRCEXT)=$(OBJEXT)}
BIN = test.exe
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
