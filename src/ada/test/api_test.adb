-- api_test.adb - Test for the ByteBauble API.
--
-- Revision 0

-- Features:
--			- 

-- Notes:
-- 			-
--
-- 2019/06/10, Maya Posch


with Ada.Text_IO;
use Ada.Text_IO;

with ByteBauble;
use ByteBauble;

procedure Main is
	-- Create ByteBauble instance, perform API operations.
	bb: ByteBauble;
	type uint16 is range 0 .. +(2 ** 16 - 1);
	type uint32 is range 0 .. +(2 ** 32 - 1);
	type uint64 is range 0 .. +(2 ** 64 - 1);
	testValue16: uint16	:= 0x0102;
	testValue32: uint32 := 0x01010304;
	testValue64: uint64 := 0x01020304080A0B0C;
	resVal: uint32;
	
begin:
	
	-- Default global: should return LE result.
	resVal := bb.toGlobal(testValue32, BB_BE); -- Assume it's BE.
	
	Put("[1] Result: 0x");
	Put(resVal, 16);
	Put_line;
	
	-- Set new global (BE), should return BE result.
	
end Main;
	
