/*
	api_test.cpp - Test for the ByteBauble API.
	
	Revision 0
	
	Features:
			- 
		
	Notes:
			- 
			
	2019/05/31, Maya Posch
*/


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
	bb.setGlobalEndianness(BB_BE);
	resVal16 = bb.toGlobal(testValue16, BB_LE);
	resVal16a = bb.toGlobal(testValue16, BB_BE);
	
	std::cout << "[3a] Result: 0x" << std::hex << resVal16 << ", 0x" << resVal16a << std::endl;
	
	resVal32 = bb.toGlobal(testValue32, BB_LE);
	resVal32a = bb.toGlobal(testValue32, BB_BE);
	
	std::cout << "[3b] Result: 0x" << std::hex << resVal32 << ", 0x" << resVal32a << std::endl;
	
	resVal64 = bb.toGlobal(testValue64, BB_LE);
	resVal64a = bb.toGlobal(testValue64, BB_BE);
	
	std::cout << "[3c] Result: 0x" << std::hex << resVal64 << ", 0x" << resVal64a << std::endl;
	
	
	return 0;
}
	