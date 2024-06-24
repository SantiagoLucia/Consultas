select 
'alter table '||a.owner||'.'||a.table_name||' disable constraint '||a.constraint_name||';',
'alter table '||a.owner||'.'||a.table_name||' enable constraint '||a.constraint_name||';'

from all_constraints a, all_constraints b
where a.constraint_type = 'R' and a.status='ENABLED'
and a.r_constraint_name = b.constraint_name
and b.owner = 'GEDO_GED'
and b.table_name = 'JBPM4_EXECUTION';