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