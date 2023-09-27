with numeros as (
select numero 
from gedo_ged.gedo_documento
where fechacreacion > trunc(sysdate)
)
select *
from numeros
order by dbms_random.value
fetch next 30 rows only;