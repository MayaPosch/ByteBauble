/*
	bytebauble.h - Header for the ByteBauble library.
	
	Revision 0
	
	Features:
			- 
			
	Notes:
			- 
			
	2019/05/31, Maya Posch
*/


//#include <algorithm>
#include <climits>
#include <cstdint>

#ifdef _MSC_VER
#include <stdlib.h>
#endif


enum BBEndianness {
	BB_BE,	// Big Endian
	BB_LE	// Little Endian
};


class ByteBauble {
	BBEndianness globalEndian = BB_LE;
	
public:
	//
	void setEndianness(BBEndianness end);
	void setBytes(void* bytes);
	void setBytes(void* bytes, BBEndianness end);
	void* getBytes();
	void* getBytes(BBEndianness end);
	
	void setGlobalEndianness(BBEndianness end) { globalEndian = end; }
	
	// --- TO GLOBAL ---
	// 
	template <typename T>
	T toGlobal(T in, BBEndianness end) {
		// Convert to requested format, if different from global.
		if (end == globalEndian) {
			// Endianness matches, return input.
			return in;
		}
		
		// Perform the conversion.
		// Flip the bytes, so that the MSB and LSB are switched.
		// Compiler intrinsics in GCC/MinGW exist since ~4.3, for MSVC
		size_t bytesize = sizeof(in);
#if defined(__GNUC__) || defined(__MINGW32__) || defined(__MINGW64__)
		if (bytesize == 2) {
			return __builtin_bswap16(in);
		}
		else if (bytesize == 4) {
			return __builtin_bswap32(in);
		}
		else if (bytesize == 8) {
			return __builtin_bswap64(in);
		}
#elif defined(_MSC_VER)
		if (bytesize == 2) {
			return _byteswap_ushort(in);
		}
		else if (bytesize == 4) {
			return _byteswap_ulong(in);
		}
		else if (bytesize == 8) {
			return _byteswap_uint64(in);
		}
#endif

		// Fallback for other compilers.
		// TODO: implement.
		return 0;
	}
};
