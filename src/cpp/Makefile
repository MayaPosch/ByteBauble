# Makefile for the ByteBauble tests.

# Makefile for the ChronoTrigger library.
#
# Allows one to build the library as a .a file, or
# build the test application.
#
# (c) 2019 Nyanko.ws

export TOP := $(CURDIR)

GCC = g++
MAKEDIR = mkdir -p
RM = rm
AR = ar

OUTPUT = libbytebauble.a
INCLUDE = -I src
CFLAGS := $(INCLUDE) -L lib/ -lbytebauble -g3 -std=c++11 -O0

# Check for MinGW
# The OS variable is only set on Windows.
ifdef OS
	#CFLAGS := $(CFLAGS) 
	#LIBS += -lws2_32
endif

SOURCES := $(wildcard src/*.cpp)
OBJECTS := $(addprefix obj/,$(notdir) $(SOURCES:.cpp=.o))

all: lib build_tests

lib: makedir $(OBJECTS) lib/$(OUTPUT)
	
obj/%.o: %.cpp
	$(GCC) -c -o $@ $< $(CFLAGS)
	
lib/$(OUTPUT): $(OBJECTS)
	-rm -f $@
	$(AR) rcs $@ $^
	
makedir:
	$(MAKEDIR) lib
	$(MAKEDIR) bin
	$(MAKEDIR) obj
	$(MAKEDIR) obj/src
	
test: lib build_tests

build_tests:
	$(GCC) -o bin/api_test test/api_test.cpp $(OBJECTS) $(CFLAGS) -g3
	$(GCC) -o bin/varint_test test/varint_test.cpp $(OBJECTS) $(CFLAGS) -g3

clean: clean-lib clean-test

clean-lib:
	$(RM) $(OBJECTS)
	
clean-test:
	$(RM) bin/api_test
	$(RM) bin/varint_test
	