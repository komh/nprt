##### Configuration parts that you can modify
SDK_INCLUDE = ./sdk/include

CC       = gcc
CFLAGS   = -Wall -DXP_OS2 -I$(SDK_INCLUDE)
CXX      = g++
CXXFLAGS = -Wall -DXP_OS2 -I$(SDK_INCLUDE)
LD       = g++
LDFLAGS  = -Zomf
LIBS     =

ifdef RELEASE
CFLAGS   += -O3
CXXFLAGS += -O3
STRIP     = lxlite /B- /L- /CS
else
CFLAGS   += -O0 -g -DDEBUG
CXXFLAGS += -O0 -g -DDEBUG
LDFLAGS  += -g
STRIP     = echo
endif

RC      = rc
RCFLAGS = -n -i $(SDK_INCLUDE)

RM = rm -f

PROGRAM     = nprt
PROGRAM_EXT = .dll

OBJ_EXT = .o

CSRCS   =
CXXSRCS = plugin.cpp np_entry.cpp npn_gate.cpp npp_gate.cpp

include Makefile.common

