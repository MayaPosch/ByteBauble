--
-- bytebauble.ads - Specification for the ByteBauble package.
--
-- 2021/03/05, Maya Posch
--

with Interfaces;

package ByteBauble is
	type BBEndianness is (BB_BE, BB_LE);
	
	subtype uint16  is Interfaces.Unsigned_16;
	subtype uint32  is Interfaces.Unsigned_32;
	subtype uint64  is Interfaces.Unsigned_64;
	--subtype uint128  is Interfaces.Unsigned_128;
	
	function Bswap_16 (X : uint16) return uint16;
	pragma Import (Intrinsic, Bswap_16, "__builtin_bswap16");

	function Bswap_32 (X : uint32) return uint32;
	pragma Import (Intrinsic, Bswap_32, "__builtin_bswap32");

	function Bswap_64 (X : uint64) return uint64;
	pragma Import (Intrinsic, Bswap_64, "__builtin_bswap64");

	-- function Bswap_128 (X : uint128) return uint128;
	-- pragma Import (Intrinsic, Bswap_128, "__builtin_bswap128");
	
	procedure detectHostEndian;
	function getHostEndian return BBEndianness;
	procedure setGlobalEndianness(endian : in BBEndianness);
	
	function toGlobal(value : in uint16; endian : in BBEndianness) return uint16;
	function toGlobal(value : in uint32; endian : in BBEndianness) return uint32;
	function toGlobal(value : in uint64; endian : in BBEndianness) return uint64;
	
	function toHost(value : in uint16; endian : in BBEndianness) return uint16;
	function toHost(value : in uint32; endian : in BBEndianness) return uint32;
	function toHost(value : in uint64; endian : in BBEndianness) return uint64;
	
private
	globalEndian	: BBEndianness	:= BB_LE;
	hostEndian		: BBEndianness	:= BB_LE;
end ByteBauble;
