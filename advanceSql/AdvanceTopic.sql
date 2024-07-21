#Local ---> Solo pueden ser usadas dentro del begin and end

#Session --> Solo pueden ser usadas durante la sesion

set @s_var1 = 3;
select @s_var1;

#Global ---> Aplica para todas las conecciones

set global max_connections = 1;
