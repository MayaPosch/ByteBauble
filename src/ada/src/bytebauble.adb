--
-- bytebauble.adb - Body of the ByteBauble package.
--
--
-- 2021/03/05, Maya Posch


with Ada.Text_IO; use Ada.Text_IO;
with System; use System;


package body ByteBauble is
	-- DETECT HOST ENDIAN --
	procedure detectHostEndian is
	-- type uint16 is mod 2 ** 16;
	-- type uint8 is mod 2 ** 8;
	-- bytes	: uint16	:= 1;
	-- check	: uint8;
	begin
		--check := bytes(0 .. 7);
		Put_Line ("Endianness " & Bit_Order'Image(Default_Bit_Order));
		--if check > 0 then
		if Default_Bit_Order = LOW_ORDER_FIRST then
			hostEndian := BB_LE;
			Put_Line(Standard_Output, "Detected Host Little Endian.");
		else
			hostEndian := BB_BE;
			Put_Line(Standard_Output, "Detected Host Big Endian.");
		end if;
	end detectHostEndian;
	
	
	-- GET HOST ENDIAN --
	function getHostEndian return BBEndianness is 
	begin
		return hostEndian;
	end getHostEndian;
	
	
	-- SET GLOBAL ENDIANNESS --
	procedure setGlobalEndianness(endian : in BBEndianness) is
	begin
		globalEndian := endian;
	end setGlobalEndianness;
	
	
	function toGlobal(value : in uint16; endian : in BBEndianness) return uint16 is
	begin
		if globalEndian = endian then
			-- -- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_16(value);
	end toGlobal;
	
	function toGlobal(value : in uint32; endian : in BBEndianness) return uint32 is
	begin
		if globalEndian = endian then
			-- -- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_32(value);
	end toGlobal;
	
	function toGlobal(value : in uint64; endian : in BBEndianness) return uint64 is
	begin
		if globalEndian = endian then
			-- -- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_64(value);
	end toGlobal;
	
	
	function toHost(value : in uint16; endian : in BBEndianness) return uint16 is
	begin
		if hostEndian = endian then
			-- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_16(value);
	end toHost;
	
	function toHost(value : in uint32; endian : in BBEndianness) return uint32 is
	begin
		if hostEndian = endian then
			-- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_32(value);
	end toHost;
	
	function toHost(value : in uint64; endian : in BBEndianness) return uint64 is
	begin
		if hostEndian = endian then
			-- Same endianness, just return the value.
			return value;
		end if;
		
		return Bswap_64(value);
	end toHost;
end ByteBauble;
