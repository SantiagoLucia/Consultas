select 
systimestamp,
CAST(SYSTIMESTAMP AS DATE) AS datetimestamp,

to_char(cast(systimestamp as DATE), 'DD/MM/YYYY') as fecha,
to_char(cast(systimestamp as DATE), 'HH24:MM:SS') as hora

from dual;