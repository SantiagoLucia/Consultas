--X REGISTROS QUE NO EXISTEN EN Y:
SELECT COL_A, COL_B, COL_C
  FROM TAB_X
MINUS
SELECT COL_A, COL_B, COL_C
  FROM TAB_Y
  
--Y REGISTROS QUE NO EXISTEN EN X:
SELECT COL_A, COL_B, COL_C
  FROM TAB_Y
MINUS
SELECT COL_A, COL_B, COL_C
  FROM TAB_X
  
--IDÉNTICOS ENTRE x e Y:
SELECT COL_A, COL_B, COL_C
   FROM TAB_X
INTERSECT
SELECT COL_A, COL_B, COL_C
   FROM TAB_Y