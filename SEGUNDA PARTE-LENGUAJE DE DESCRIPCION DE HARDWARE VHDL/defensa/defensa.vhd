--Autor: Ricardo Meza Díaz
--Fecha: 21 Diciembre 2017
--Defensa VHDL
library ieee;
use ieee.std_logic_1164.all;

entity defensa is
port	(
	--2 arrays de tipo bit de 8 y uno de tipo bit de 3.
	entrada: in bit_vector(0 to 7);
	control: in bit_vector (0 to 2);
	salida: out bit_vector (0 to 7));
begin	
end ENTITY;

--When..else
architecture flujo1 of defensa is
begin           
				--Deszplazamiento a la derecha de 1 bit.
	salida <=	entrada(1 to 7) & '0' when control = B"001" else 
				--Desplazamiento a la derecha de 1 bit.
				'0' & entrada(0 to 6) when control = B"010" else 
				--Rotación a la izquierda de 1 bit.
		   		entrada(7)& entrada(0 to 6) when control = B"100" else 
		   		--Rotacion a la derecha de 1 bit.
				entrada(1 to 7)&entrada(0) when control = B"101" else 
				--Rotacion de dos bits a la izquierda.
				entrada(6)&entrada(7)&entrada(0 to 5) when control = B"110" else  
				--Rotacion de dos bits a la derecha. 
				entrada(2 to 7)&entrada(0)&entrada(1) when control = B"111" else 
				--Inicializar el vector a 0.
				B"00000000" when control=B"000"else
				--Inicializar el vector a 1.
				B"11111111"when control =B"011"else
				null;
end flujo1; 

--With..select..when
architecture flujo2 of defensa is
begin
	 with control select 
	 	  --Deszplazamiento a la derecha de 1 bit.
			salida<= entrada(1 to 7)& '0' when B"001", 
				--Desplazamiento a la derecha de 1 bit.
				'0' & entrada(0 to 6) when B"010", 
				--Rotación a la izquierda de 1 bit.
		   		entrada(7)& entrada(0 to 6) when B"100", 
				--Rotacion a la derecha de 1 bit.
				entrada(1 to 7)&entrada(0) when  B"101",
				--Rotacion de dos bits a la izquierda. 
				entrada(6)&entrada(7)&entrada(0 to 5) when B"110",
				--Rotacion de dos bits a la derecha.
				entrada(2 to 7)&entrada(0)&entrada(1) when B"111",
				--Inicializa el vector a 0.
				B"00000000" when B"000",
				--Inicializa el vector a 1.
				B"11111111" when B"011",
				entrada(0 to 7) when others;	
end flujo2;





