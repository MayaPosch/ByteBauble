-- api_test.adb - Test for the ByteBauble API.
--
-- Revision 0

-- Features:
--			- 

-- Notes:
-- 			-
--
-- 2019/06/10, Maya Posch


with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Interfaces;

with ByteBauble; use ByteBauble;

procedure api_test is
	-- Perform API operations.
	subtype uint16  is Interfaces.Unsigned_16;
	subtype uint32  is Interfaces.Unsigned_32;
	subtype uint64  is Interfaces.Unsigned_64;
	--subtype U128 is Interfaces.Unsigned_128;
	testValue16: uint16	:= 16#0102#;
	testValue32: uint32	:= 16#01010304#;
	--testValue64: uint64 := 16#01020304080A0B0C#;
	resVal: Integer;
	
begin
	
	-- Default global: should return LE result.
	resVal := Integer(toGlobal(testValue32, BB_BE)); -- Assume it's BE.
	
	Put("[1] Result: ");
	Ada.Integer_Text_IO.Put(resVal, Base => 16);
	Put_Line(".");
	
	-- Set new global (BE), should return BE result.
	
end api_test;
	
