library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moltiplicatore_somma_diagonali is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0));
end moltiplicatore_somma_diagonali;

architecture Structural of moltiplicatore_somma_diagonali is

component full_adder
Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC;
           c_out : out  STD_LOGIC);
end component;

signal m : std_logic_vector (63 downto 0);
signal r : std_logic_vector (63 downto 0);
signal s : std_logic_vector (63 downto 0);

begin



m(0) <= a(0) and b(0);
m(1) <= a(0) and b(1);
m(2) <= a(0) and b(2);
m(3) <= a(0) and b(3);
m(4) <= a(0) and b(4);
m(5) <= a(0) and b(5);
m(6) <= a(0) and b(6);
m(7) <= a(0) and b(7);
m(8) <= a(1) and b(0);
m(9) <= a(1) and b(1);
m(10) <= a(1) and b(2);
m(11) <= a(1) and b(3);
m(12) <= a(1) and b(4);
m(13) <= a(1) and b(5);
m(14) <= a(1) and b(6);
m(15) <= a(1) and b(7);
m(16) <= a(2) and b(0);
m(17) <= a(2) and b(1);
m(18) <= a(2) and b(2);
m(19) <= a(2) and b(3);
m(20) <= a(2) and b(4);
m(21) <= a(2) and b(5);
m(22) <= a(2) and b(6);
m(23) <= a(2) and b(7);
m(24) <= a(3) and b(0);
m(25) <= a(3) and b(1);
m(26) <= a(3) and b(2);
m(27) <= a(3) and b(3);
m(28) <= a(3) and b(4);
m(29) <= a(3) and b(5);
m(30) <= a(3) and b(6);
m(31) <= a(3) and b(7);
m(32) <= a(4) and b(0);
m(33) <= a(4) and b(1);
m(34) <= a(4) and b(2);
m(35) <= a(4) and b(3);
m(36) <= a(4) and b(4);
m(37) <= a(4) and b(5);
m(38) <= a(4) and b(6);
m(39) <= a(4) and b(7);
m(40) <= a(5) and b(0);
m(41) <= a(5) and b(1);
m(42) <= a(5) and b(2);
m(43) <= a(5) and b(3);
m(44) <= a(5) and b(4);
m(45) <= a(5) and b(5);
m(46) <= a(5) and b(6);
m(47) <= a(5) and b(7);
m(48) <= a(6) and b(0);
m(49) <= a(6) and b(1);
m(50) <= a(6) and b(2);
m(51) <= a(6) and b(3);
m(52) <= a(6) and b(4);
m(53) <= a(6) and b(5);
m(54) <= a(6) and b(6);
m(55) <= a(6) and b(7);
m(56) <= a(7) and b(0);
m(57) <= a(7) and b(1);
m(58) <= a(7) and b(2);
m(59) <= a(7) and b(3);
m(60) <= a(7) and b(4);
m(61) <= a(7) and b(5);
m(62) <= a(7) and b(6);
m(63) <= a(7) and b(7);


f_0 : full_adder 
PORT MAP (
x => m(1),
y => m(8),
c_in => '0' ,
s => s(0),
c_out => r(0)
);


f_1 : full_adder 
PORT MAP (
x => m(9),
y => m(16),
c_in => '0' ,
s => s(1),
c_out => r(1)
);

f_2 : full_adder 
PORT MAP (
x => m(17),
y => m(24),
c_in => '0' ,
s => s(2),
c_out => r(2)
);

f_3 : full_adder 
PORT MAP (
x => m(25),
y => m(32),
c_in => '0' ,
s => s(3),
c_out => r(3)
);

f_4 : full_adder 
PORT MAP (
x => m(33),
y => m(40),
c_in => '0' ,
s => s(4),
c_out => r(4)
);

f_5 : full_adder 
PORT MAP (
x => m(41),
y => m(48),
c_in => '0' ,
s => s(5),
c_out => r(5)
);

f_6 : full_adder 
PORT MAP (
x => m(49),
y => m(56),
c_in => '0' ,
s => s(6),
c_out => r(6)
);

f_7 : full_adder 
PORT MAP (
x => s(1),
y => m(2),
c_in => r(0),
s => s(7),
c_out => r(7)
);

f_8 : full_adder 
PORT MAP (
x => s(2),
y => m(10),
c_in => r(1),
s => s(8),
c_out => r(8)
);

f_9 : full_adder 
PORT MAP (
x => s(3),
y => m(18),
c_in => r(2),
s => s(9),
c_out => r(9)
);

f_10 : full_adder 
PORT MAP (
x => s(4),
y => m(26),
c_in => r(3),
s => s(10),
c_out => r(10)
);

f_11 : full_adder 
PORT MAP (
x => s(5),
y => m(34),
c_in => r(4),
s => s(11),
c_out => r(11)
);

f_12 : full_adder 
PORT MAP (
x => s(6),
y => m(42),
c_in => r(5),
s => s(12),
c_out => r(12)
);

f_13 : full_adder 
PORT MAP (
x => m(57),
y => m(50),
c_in => r(6),
s => s(13),
c_out => r(13)
);

f_14 : full_adder 
PORT MAP (
x => s(8),
y => m(3),
c_in => r(7),
s => s(14),
c_out => r(14)
);

f_15 : full_adder 
PORT MAP (
x => s(9),
y => m(11),
c_in => r(8),
s => s(15),
c_out => r(15)
);

f_16 : full_adder 
PORT MAP (
x => s(10),
y => m(19),
c_in => r(9),
s => s(16),
c_out => r(16)
);

f_17 : full_adder 
PORT MAP (
x => s(11),
y => m(27),
c_in => r(10),
s => s(17),
c_out => r(17)
);

f_18 : full_adder 
PORT MAP (
x => s(12),
y => m(35),
c_in => r(11),
s => s(18),
c_out => r(18)
);

f_19 : full_adder 
PORT MAP (
x => s(13),
y => m(43),
c_in => r(12),
s => s(19),
c_out => r(19)
);

f_20 : full_adder 
PORT MAP (
x => m(58),
y => m(51),
c_in => r(13),
s => s(20),
c_out => r(20)
);

f_21 : full_adder 
PORT MAP (
x => s(15),
y => m(4),
c_in => r(14),
s => s(21),
c_out => r(21)
);

f_22 : full_adder 
PORT MAP (
x => s(16),
y => m(12),
c_in => r(15),
s => s(22),
c_out => r(22)
);

f_23 : full_adder 
PORT MAP (
x => s(17),
y => m(20),
c_in => r(16),
s => s(23),
c_out => r(23)
);

f_24 : full_adder 
PORT MAP (
x => s(18),
y => m(28),
c_in => r(17),
s => s(24),
c_out => r(24)
);

f_25 : full_adder 
PORT MAP (
x => s(19),
y => m(36),
c_in => r(18),
s => s(25),
c_out => r(25)
);

f_26 : full_adder 
PORT MAP (
x => s(20),
y => m(44),
c_in => r(19),
s => s(26),
c_out => r(26)
);

f_27 : full_adder 
PORT MAP (
x => m(59),
y => m(52),
c_in => r(20),
s => s(27),
c_out => r(27)
);

f_28 : full_adder 
PORT MAP (
x => s(22),
y => m(5),
c_in => r(21),
s => s(28),
c_out => r(28)
);

f_29 : full_adder 
PORT MAP (
x => s(23),
y => m(13),
c_in => r(22),
s => s(29),
c_out => r(29)
);

f_30 : full_adder 
PORT MAP (
x => s(24),
y => m(21),
c_in => r(23),
s => s(30),
c_out => r(30)
);

f_31 : full_adder 
PORT MAP (
x => s(25),
y => m(29),
c_in => r(24),
s => s(31),
c_out => r(31)
);

f_32 : full_adder 
PORT MAP (
x => s(26),
y => m(37),
c_in => r(25),
s => s(32),
c_out => r(32)
);

f_33 : full_adder 
PORT MAP (
x => s(27),
y => m(45),
c_in => r(26),
s => s(33),
c_out => r(33)
);

f_34 : full_adder 
PORT MAP (
x => m(60),
y => m(53),
c_in => r(27),
s => s(34),
c_out => r(34)
);

f_35 : full_adder 
PORT MAP (
x => s(29),
y => m(6),
c_in => r(28),
s => s(35),
c_out => r(35)
);

f_36 : full_adder 
PORT MAP (
x => s(30),
y => m(14),
c_in => r(29),
s => s(36),
c_out => r(36)
);

f_37 : full_adder 
PORT MAP (
x => s(31),
y => m(22),
c_in => r(30),
s => s(37),
c_out => r(37)
);

f_38 : full_adder 
PORT MAP (
x => s(32),
y => m(30),
c_in => r(31),
s => s(38),
c_out => r(38)
);

f_39 : full_adder 
PORT MAP (
x => s(33),
y => m(38),
c_in => r(32),
s => s(39),
c_out => r(39)
);

f_40 : full_adder 
PORT MAP (
x => s(34),
y => m(46),
c_in => r(33),
s => s(40),
c_out => r(40)
);

f_41 : full_adder 
PORT MAP (
x => m(61),
y => m(54),
c_in => r(34),
s => s(41),
c_out => r(41)
);

f_42 : full_adder 
PORT MAP (
x => s(36),
y => m(7),
c_in => r(35),
s => s(42),
c_out => r(42)
);

f_43 : full_adder 
PORT MAP (
x => s(37),
y => m(15),
c_in => r(36),
s => s(43),
c_out => r(43)
);

f_44 : full_adder 
PORT MAP (
x => s(38),
y => m(23),
c_in => r(37),
s => s(44),
c_out => r(44)
);

f_45 : full_adder 
PORT MAP (
x => s(39),
y => m(31),
c_in => r(38),
s => s(45),
c_out => r(45)
);

f_46 : full_adder 
PORT MAP (
x => s(40),
y => m(39),
c_in => r(39),
s => s(46),
c_out => r(46)
);

f_47 : full_adder 
PORT MAP (
x => s(41),
y => m(47),
c_in => r(40),
s => s(47),
c_out => r(47)
);

f_48 : full_adder 
PORT MAP (
x => m(62),
y => m(55),
c_in => r(41),
s => s(48),
c_out => r(48)
);


f_49 : full_adder 
PORT MAP (
x => r(42),
y => s(43),
c_in => '0',
s => s(49),
c_out => r(49)
);

f_50 : full_adder 
PORT MAP (
x => r(43),
y => s(44),
c_in => r(49),
s => s(50),
c_out => r(50)
);


f_51 : full_adder 
PORT MAP (
x => r(44),
y => s(45),
c_in => r(50),
s => s(51),
c_out => r(51)
);

f_52 : full_adder 
PORT MAP (
x => r(45),
y => s(46),
c_in => r(51),
s => s(52),
c_out => r(52)
);

f_53 : full_adder 
PORT MAP (
x => r(46),
y => s(47),
c_in => r(52),
s => s(53),
c_out => r(53)
);

f_54 : full_adder 
PORT MAP (
x => r(47),
y => s(48),
c_in => r(53),
s => s(54),
c_out => r(54)
);

f_55 : full_adder 
PORT MAP (
x => r(48),
y => m(63),
c_in => r(54),
s => s(55),
c_out => r(55)
);

y(0) <= m(0);
y(1) <= s(0);
y(2) <= s(7);
y(3) <= s(14);
y(4) <= s(21);
y(5) <= s(28);
y(6) <= s(35);
y(7) <= s(42);
y(8) <= s(49);
y(9) <= s(50);
y(10) <= s(51);
y(11) <= s(52);
y(12) <= s(53);
y(13) <= s(54);
y(14) <= s(55);
y(15) <= r(55);

end Structural;

