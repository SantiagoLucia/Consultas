select
    ac.owner||'.'||ac.table_name as tabla,
    ac.constraint_name as nombre_constraint,
    'alter table '||ac.owner||'.'||ac.table_name||' disable constraint '||ac.constraint_name||';' as deshabilitar_constraint,
    'alter table '||ac.owner||'.'||ac.table_name||' enable constraint '||ac.constraint_name||';' as habilitar_constraint    

from all_constraints ac 
where 
    ac.constraint_type = 'R' and 
    ac.status = 'ENABLED' and
    exists (select 0
            from all_constraints
            where 
            ac.r_constraint_name = constraint_name 
            and owner = 'GEDO_GED'
            and table_name = 'GEDO_DOCUMENTO');

------------------------------------------------------------------------------------------------			

select 
acc.owner,
acc.constraint_name,
acc.table_name,
acc.column_name,
'delete from '||acc.owner||'.'||acc.table_name||' where '||acc.column_name||' = ' as sentencia_delete 

from all_constraints ac1
inner join all_constraints ac2 
    on ac2.constraint_name = ac1.r_constraint_name
inner join all_cons_columns acc
    on ac1.constraint_name = acc.constraint_name    
where 
ac1.constraint_type = 'R'
and ac2.constraint_type = 'P'
and ac2.owner = 'TRACK_GED'
and ac2.table_name = 'SADE_SECTOR_INTERNO'
;			