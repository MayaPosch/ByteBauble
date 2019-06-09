/*
	bytebauble.cpp - Implementation of the ByteBauble library.
	
	Revision 0
	
	Features:
			- 
			
	Notes:
			- 
			
	2019/05/31, Maya Posch
*/


#include "bytebauble.h"

#include <iostream>


// --- CONSTRUCTOR ---
ByteBauble::ByteBauble() {
	// Perform host endianness detection.
	detectHostEndian();
}


// --- DETECT HOST ENDIAN ---
// Perform a check for the endianness of the host system.
void ByteBauble::detectHostEndian() {
	// This check uses a single 16-bit integer, using it as a single byte after assignment.
	// Depending on which byte the (<255) value ended up on, we can determine the host endianness.
	uint16_t bytes = 1;
	if (*((uint8_t*) &bytes) == 1) {
		// Detected little endian.
		std::cout << "Detected Host Little Endian." << std::endl;
		hostEndian = BB_LE;
	}
	else {
		// Detected big endian.
		std::cout << "Detected Host Big Endian." << std::endl;
		hostEndian = BB_BE;
	}
}


/* void setEndianness(BBEndianness end);
void setBytes(void* bytes);
void setBytes(void* bytes, BBEndianness end);
void* getBytes();
void* getBytes(BBEndianness end); */
