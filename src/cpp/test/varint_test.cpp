/*
	varint_test.cpp - Test for the ByteBauble variable byte integer API.
	
	Revision 0
	
	Features:
			- 
		
	Notes:
			- 
			
	2019/05/31, Maya Posch
*/


#include "../src/bytebauble.h"

#include <iostream>
#include <string>


int main() {
	// Create ByteBauble instance, perform API operations.
	ByteBauble bb;
	
	// Test various lengths packed inputs.
	uint32_t in0 = 0x02;
	
	uint32_t output;
	uint32_t bytecount = bb.readPackedInt(in0, output);
	
	std::cout << "[1] " << std::hex << "0x" <<  in0 << " -> 0x" << output << " (" << bytecount 
						<< ")" << std::endl;
						
	std::string str0 = { 0x20, 0x02, 0x00, 0x00 };
	uint32_t in1 = (uint32_t) str0[1];
	bytecount = bb.readPackedInt(in1, output);
	
	std::cout << "[2] " << std::hex << "0x" <<  in1 << " -> 0x" << output << " (" << bytecount 
						<< ")" << std::endl;
	
	return 0;
}