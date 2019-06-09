# ByteBauble #

This is a small library containing a number of utility methods for handling endianness and other common byte & bit-related operations.

At this point it supports:

* Converting to a preset endianness (BE/LE).
* Converting to the host's endianness, with automatic host endianness detection.


C++ demonstration application (provided in the source):

	#include "../src/bytebauble.h"

	#include <iostream>


	int main() {
		// Create ByteBauble instance, perform API operations.
		ByteBauble bb;
		
		// Default global: should return LE result.
		uint16_t testValue16 = 0x0102;
		uint32_t testValue32 = 0x01020304;
		uint64_t testValue64 = 0x01020304080A0B0C;
		uint32_t resVal = bb.toGlobal<uint32_t>(testValue32, BB_BE); // assume it's BE.
		
		std::cout << "[1] Result: 0x" << std::hex << resVal << std::endl;
		
		// Set new global (BE), should return BE result.
		bb.setGlobalEndianness(BB_BE);
		uint16_t resVal16 = bb.toGlobal(testValue16, BB_LE);
		uint16_t resVal16a = bb.toGlobal(testValue16, BB_BE);
		
		std::cout << "[2a] Result: 0x" << std::hex << resVal16 << ", 0x" << resVal16a << std::endl;
		
		uint32_t resVal32 = bb.toGlobal(testValue32, BB_LE);
		uint32_t resVal32a = bb.toGlobal(testValue32, BB_BE);
		
		std::cout << "[2b] Result: 0x" << std::hex << resVal32 << ", 0x" << resVal32a << std::endl;
		
		uint64_t resVal64 = bb.toGlobal(testValue64, BB_LE);
		uint64_t resVal64a = bb.toGlobal(testValue64, BB_BE);
		
		std::cout << "[2c] Result: 0x" << std::hex << resVal64 << ", 0x" << resVal64a << std::endl;
		
		// Set to LE, pass in BE values (16, 32 & 64 bit).
		bb.setGlobalEndianness(BB_LE);
		resVal16 = bb.toGlobal(testValue16, BB_LE);
		resVal16a = bb.toGlobal(testValue16, BB_BE);
		
		std::cout << "[3a] Result: 0x" << std::hex << resVal16 << ", 0x" << resVal16a << std::endl;
		
		resVal32 = bb.toGlobal(testValue32, BB_LE);
		resVal32a = bb.toGlobal(testValue32, BB_BE);
		
		std::cout << "[3b] Result: 0x" << std::hex << resVal32 << ", 0x" << resVal32a << std::endl;
		
		resVal64 = bb.toGlobal(testValue64, BB_LE);
		resVal64a = bb.toGlobal(testValue64, BB_BE);
		
		std::cout << "[3c] Result: 0x" << std::hex << resVal64 << ", 0x" << resVal64a << std::endl;
		
		// Convert to host endianness. This test's output will vary depending on the CPU.
		resVal16 = bb.toHost(testValue16, BB_LE);
		resVal16a = bb.toHost(testValue16, BB_BE);
		
		std::cout << "[4a] Result: 0x" << std::hex << resVal16 << ", 0x" << resVal16a << std::endl;
		
		resVal32 = bb.toHost(testValue32, BB_LE);
		resVal32a = bb.toHost(testValue32, BB_BE);
		
		std::cout << "[4b] Result: 0x" << std::hex << resVal32 << ", 0x" << resVal32a << std::endl;
		
		resVal64 = bb.toHost(testValue64, BB_LE);
		resVal64a = bb.toHost(testValue64, BB_BE);
		
		std::cout << "[4c] Result: 0x" << std::hex << resVal64 << ", 0x" << resVal64a << std::endl;
		
		
		return 0;
	}

This produces the following output on an x86_64 (Intel) system:


	$ ./api_test.exe
	Detected Host Little Endian.
	[1] Result: 0x4030201
	[2a] Result: 0x201, 0x102
	[2b] Result: 0x4030201, 0x1020304
	[2c] Result: 0xc0b0a0804030201, 0x1020304080a0b0c
	[3a] Result: 0x102, 0x201
	[3b] Result: 0x1020304, 0x4030201
	[3c] Result: 0x1020304080a0b0c, 0xc0b0a0804030201
	[4a] Result: 0x102, 0x201
	[4b] Result: 0x1020304, 0x4030201
	[4c] Result: 0x1020304080a0b0c, 0xc0b0a0804030201



## C++ & Ada version status ##

The C++ library is currently in progress, but contains working code. Feel free to suggest additional features and offer PRs.

The Ada port is currently being planned.


## Dependencies ##

Each port of ByteBauble is designed to only require the language's standard library (C++: C++11+ STL - Ada: Ada packages). 

## Limitations ##

The C++ version of ByteBauble currently works with any slightly modern (4.3+) version of GCC/MinGW, as well as MSVC. Support for other compilers is being worked on.