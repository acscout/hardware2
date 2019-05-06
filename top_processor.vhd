----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/28/2019 07:26:27 PM
-- Design Name: 
-- Module Name: top_processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_processor is
Port (
clk : in std_logic := '0';
result : out std_logic_vector(31 downto 0);
counter : out std_logic_vector(31 downto 0)
);
end top_processor;

architecture Behavioral of top_processor is
component ALU_top
Port ( 
a,b : in std_logic_vector (31 downto 0);
func: in std_logic_vector(5 downto 0);
ALUop : in std_logic_vector(1 downto 0);
z : out std_logic_vector(31 downto 0);
overflow : out std_logic;
cout : out std_logic;
zeroflag : out std_logic
);
end component;

component Adder_top
Port (
a,b : in std_logic_vector(31 downto 0); --arguments
cin: in std_logic; --carry in
z: out std_logic_vector(31 downto 0); --32bit sum
cout: out std_logic --carry out
);
end component;

component MUX
Port ( 
x,y : in std_logic_vector(31 downto 0);
control : in std_logic;
z : out std_logic_vector(31 downto 0)
);
end component;

component MUX5_bit 
Port ( 
x,y : in std_logic_vector(4 downto 0);
control : in std_logic;
z : out std_logic_vector(4 downto 0)
);
end component;

component Shifting_entity
Port (
a : in std_logic_vector (31 downto 0);
dir : in std_logic;
z : out std_logic_vector (31 downto 0)
);
end component;

component top_controlUnit
Port (
    opcode: in STD_LOGIC_VECTOR(5 downto 0);
    regDst: out STD_LOGIC;
    jump  : out STD_LOGIC;
    branch: out STD_LOGIC;
    memRead: out STD_LOGIC;
    memToReg: out STD_LOGIC;
    ALUOp: out STD_LOGIC_VECTOR(1 downto 0);
    memWrite: out STD_LOGIC;
    ALUScr : out STD_LOGIC;
    regWrite: out STD_LOGIC
 );
 end component;
 
 component Instruction_memory
 Port(
 	addr_in : in std_logic_vector(31 downto 0); -- we use only 6 bits though here;
    instr_out : out std_logic_vector(31 downto 0)
 );
 end component;
 
 component Data_memory
 port ( 
      reset : in std_logic;
      clk : in std_logic;
      MW : in std_logic;
      MR : in std_logic;
      data_in : in std_logic_vector(31 downto 0);
      addr_in : in std_logic_vector(31 downto 0); -- we use only 4 bits though here;
      data_out : out std_logic_vector(31 downto 0) 
 );     
 end component;
 
 component RegFile
 port (
         ck: in std_logic;
         write_enabled: in std_logic;
         read_reg_1: in std_logic_vector(4 downto 0);
         read_reg_2: in std_logic_vector(4 downto 0);
         write_reg: in std_logic_vector(4 downto 0);
         write_data: in std_logic_vector(31 downto 0);
         read_data_1: out std_logic_vector(31 downto 0);
         read_data_2: out std_logic_vector(31 downto 0)
);
end component;     

signal  regDst,jump,branch,regWrite,ALUScr,memToReg,memRead,memWrite:  STD_LOGIC; --control ouputs
signal  ALUOp: STD_LOGIC_VECTOR(1 downto 0);
signal  read_data_1,read_data_2 : std_logic_vector(31 downto 0);
signal  zeroflag,overflow: std_logic;
signal  ALUout: std_logic_vector(31 downto 0);
signal  SFTLFT2out,SFTLFT25out,SFTADDRout,SFTLFT1out,SFTLFT15out: std_logic_vector(31 downto 0);
signal  JMPADDRout,PCADDRout: std_logic_vector(31 downto 0);
signal  discard: std_logic;
signal  instr,jmpaddress,tempinstr25: std_logic_vector(31 downto 0);
signal  instr25: std_logic_vector(25 downto 0);
signal  instr15: std_logic_vector(15 downto 0);
signal  instr25_21,instr20_16,instr15_11: std_logic_vector(4 downto 0);
signal  instr5,instr31_26 : std_logic_vector(5 downto 0);
signal  signextend: std_logic_vector(31 downto 0);
signal  mux1out : std_logic_vector(4 downto 0);
signal  mux2out,mux3out,mux4out,mux5out: std_logic_vector(31 downto 0);
signal  mux3control: std_logic;
signal PCaddress : std_logic_vector(31 downto 0);
signal PC,PCfinal: std_logic_vector(31 downto 0);
signal read_data: std_logic_Vector(31 downto 0);

begin
PCaddress <= "00000000000000000000000000111111";
PCMEMLD : Data_memory port map(reset=>'1',clk=>clk,MW=>'0',MR=>'1',data_in=>"00000000000000000000000000000000",addr_in=>PCaddress,data_out=>PC);
INSMEM  : Instruction_memory port map(addr_in=>PC,instr_out=>instr);
--result <= instr;

instr31_26 <=  instr(31 downto 26);
CONTROL : top_controlUnit port map(opcode=>instr31_26,regDst=>regDst,jump=>jump,branch=>branch,memRead=>memRead,memToReg=>memToReg,ALUOp=>ALUOp,memWrite=>memWrite,ALUScr=>ALUScr,regWrite=>regWrite);


instr25 <= instr(25 downto 0);
tempinstr25(31 downto 26) <= "000000";
tempinstr25(25 downto 0) <= instr25;
PCADDR  : Adder_top port map(a=>PC,b=>"00000000000000000000000000000100",cin=>'0',z=>PCADDRout,cout=>discard);
SFT1    : Shifting_entity port map(a=>tempinstr25,dir=>'0',z=>SFTLFT1out);
SFT15   : Shifting_entity port map(a=>SFTLFT1out,dir=>'0',z=>SFTLFT15out);
jmpaddress(31 downto 28) <= PCADDRout(31 downto 28);
jmpaddress(27 downto 0) <= SFTLFT15out(27 downto 0);


instr25_21 <= instr(25 downto 21);
instr20_16 <= instr(20 downto 16);
instr15_11 <= instr(15 downto 11);
MUX1    : MUX5_bit port map(x=>instr20_16,y=>instr15_11,control=>regDst,z=>mux1out);
RGFL    : RegFile  port map(ck=>clk,write_enabled=>RegWrite,read_reg_1=>instr25_21,read_reg_2=>instr20_16,write_reg=>mux1out,write_data=>mux5out,read_data_1=>read_data_1,read_data_2=>read_data_2);


instr15 <= instr(15 downto 0);
signextend(31 downto 16) <= "0000000000000000";
signextend(15 downto 0) <= instr15;


MUX2    : MUX port map(x=>read_data_2,y=>signextend,control=>ALUScr,z=>mux2out);
instr5 <= instr(5 downto 0);
SALU    : ALU_top port map (a=>read_data_1,b=>mux2out,func=>instr5,ALUop=>ALUOp,z=>ALUout,overflow=>overflow,cout=>discard,zeroflag=>zeroflag);


SFT2    : Shifting_entity port map(a=>signextend,dir=>'0',z=>SFTLFT2out);
SFT25   : Shifting_entity port map(a=>SFTLFT2out,dir=>'0',z=>SFTLFT25out);
JMPADDR : Adder_top port map(a=>PCADDRout,b=>SFTLFT25out,cin=>'0',z=>JMPADDRout,cout=>discard);
mux3control <= (branch AND zeroflag);
MUX3    : MUX port map(x=>PCADDRout,y=>JMPADDRout,control=>mux3control,z=>mux3out);


DTMEM   : Data_memory port map(reset=>'0',clk=>clk,MW=>memWrite,MR=>memRead,data_in=>read_data_2,addr_in=>ALUout,data_out=>read_data);
MUX5    : MUX port map(x=>ALUout,y=>read_data,control=>memToReg,z=>mux5out);
--result <= ALUout;

MUX4    : MUX port map(x=>mux3out,y=>jmpaddress,control=>jump,z=>mux4out);
PCMEMST : Data_memory port map(reset=>'0',clk=>clk,MW=>'1',MR=>'1',data_in=>mux4out,addr_in=>PCaddress,data_out=>PCfinal);


result <= mux5out;
counter <= PCfinal;
end Behavioral;
