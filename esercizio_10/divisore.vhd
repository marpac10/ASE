library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity divisore is
port(clk : in std_logic;
reset:in std_logic;
start:in std_logic;
dvsr :in std_logic_vector(3 downto 0);
dvnd:in std_logic_vector(3 downto 0);
ready,done_tick:out std_logic;
quo : out std_logic_vector (3 downto 0);
rmd:out std_logic_vector(3 downto 0)
);
end divisore;

architecture behavioral of divisore is
type state_type is(idle,op,last,done);
signal state,state_next:state_type; -- stato attuale e stato prossimo
signal rh_reg,rh_next:unsigned(3 downto 0);  -- rh registro con i bit più significativi del dividendo
signal rl_reg,rl_next:std_logic_vector(3 downto 0);  -- rl registro con i bit meno significativi del dividendo
signal rh_tmp:unsigned(3 downto 0); -- registro temporaneo per il divisore
signal d_reg,d_next:unsigned(3 downto 0); -- registro del divisore
signal n_reg,n_next:unsigned(2 downto 0); -- 
signal q_bit:std_logic; -- bit di uscita
begin
--fsmd state and data register
--rappresenta l' elemento di ritardo della Fsm
process(clk,reset) --sensibile al clock e al reset
begin
if reset ='1' then
state<=idle;
rh_reg<=(others=>'0');
rl_reg<=(others=>'0');
d_reg<=(others=>'0');
n_reg<=(others=>'0');
--sensibile al clock di salita
elsif(clk' event and clk='1')then
state<=state_next;
rh_reg<=rh_next;
rl_reg<=rl_next;
d_reg<=d_next;
n_reg<=n_next;
end if;
end process;
--fsmd next-state logic and data path logic
--Parte Combinatoria
--Parte Combinatoria
process(state,n_reg,rh_reg,rl_reg,d_reg,start,dvsr,dvnd,q_bit,rh_tmp,n_next)
begin
ready<='0';
done_tick<='0';
state_next<=state;
rh_next<=rh_reg;
rl_next<=rl_reg;
d_next<=d_reg;
n_next<=n_reg;
case state is
when idle=>
ready<='1';
if start='1' then
rh_next<=(others=>'0');
rl_next<=dvnd;
d_next<=unsigned(dvsr);
n_next<=to_unsigned(5,3);
state_next<=op;
end if;
when op=>
--spostamento rh e rl a sinistra
rl_next<=rl_reg(2 downto 0)&q_bit;
rh_next<=rh_tmp(2 downto 0)&rl_reg(3);
--decremento l' indice
n_next <=n_reg -1;
if(n_next=1)then
state_next<=last;
end if;
when last => --ultima iterazione
rl_next<=rl_reg(2 downto 0)& q_bit;
rh_next<=rh_tmp;
state_next<=done;
when done=>
state_next<=idle;
done_tick<='1';
end case;
end process;
--confronta e sottrai
process(rh_reg,d_reg)
begin

if rh_reg >= d_reg then
rh_tmp <=rh_reg - d_reg;
q_bit<='1';
else
rh_tmp<=rh_reg; -- dovrei prima sottrarre e poi sommare per fare il restoring, faccio una sola operazione per evitare di dover introdurre un'altra variabile temporanea
q_bit<='0';
end if;
end process;


--uscita
quo<=rl_reg;
rmd<=std_logic_vector(rh_reg);
end behavioral;