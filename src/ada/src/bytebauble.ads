-- bytebauble.ads - Specification for the ByteBauble package.

-- Revision 0

-- Features:
--		- 

-- Notes:
--		- 

-- 2019/06/10, Maya Posch



package ByteBauble is
	type BBEndianness is (BB_LE, BB_BE);
	
	type ByteBauble is tagged record;
		--
		globalEndian: BBEndianness := BB_LE;
		hostEndian: BBEndianness := detectHostEndian;
	end record;
	

	function detectHostEndian return BBEndianness;
	procedure detectHostEndian(Self: in out ByteBauble);
	procedure setGlobalEndianness(Self: in out ByteBauble, endian: in BBEndianness);
	

end ByteBauble;