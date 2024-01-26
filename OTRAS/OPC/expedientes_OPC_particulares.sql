with tabla_expedientes as (
select 
ee.id as id_expediente,
t.codigo_trata,
t.descripcion as descripcion_trata
from ee_ged.ee_expediente_electronico ee
inner join ee_ged.trata t on ee.id_trata = t.id
where ee.id in (
1387532,1554860,1763639,1814525,2056261,2086382,2151746,2141084,2221897,
2251513,2463255,2485120,2488380,2479918,2520883,2527505,2532589,2545434,
2546973,2542355,2580898,2581030,2568599,2585481,2631438,2598475,2648171,
2684938,2662000,2688400,2684939,2675944,2680330,2781370,2693239,2773302,
2760817,2769717,2768940,2765675,2709671,2756476,2726872,2740402,2743816,
2743608,2743772,2747786,2782627,2787569,2796430,2812944,2807816,2799268,
2805795,2796369,2813453,2847119,2868998,2878722,2904678,2883157,3156604,
3169418,3178078,3172519,3190280,3172355,3199004,3274011,3305326,3303489,
3320961,3326023,3350469,3375656,3371118,3378737,3394641,3395826,3383978,
3394766,3412778,3442392,3469188,3473553,3509499,3484273,3493169,3525363,
3514470,3539130,3530201,3534895,3514560,3580946,3603085,3647955,3671135,
3675156,3687440,3687393,3690774,3679881,3753942,3742183,3789711,3783063,
3803191,3807796,3861263,3896978,3907449,3941542,3935670,3920169,3931001,
4450239,4624579,5103585,4902795,5094396,5069873,4927295,4695701,4945937,
4928269,4883010,4855108,4880814,4891451,5176216,5160877,4369524,4785540,
4411212,4443035,4356347,4408508,4385114,4655601,4723901,4701624,4733801,
4685246,4477117,4626780,4484121,4325912,4629018,5178595,5144748,4697064,
4712317,4687649,4663730,4682059,4501687,4477149,4477366,4489110,4506647,
4362524,4632991,4446349,4459439,4581947,5035517,4730855,5104436,5187585,
5027695,5208705,5218865,5098790,4666697,4403647,5231007,5214724,4978899,
5232472,5152386,5134635,5141810,4834617,4828184,5060371,5132851,5120529,
4772882,4798688,4568231,4736581,4897005,4899871,4899581,4882164,4666256,
4672511,5306558,5044902,5232237,5335667,5208228,5232715,5094761,5206193,
4798568,4806191,4771875,4737299,4736542,4653100,4744805,4801771,4743149,
4964496,5014382,5038149,4990038,5033193,5040515,5039994,5040032,4759127,
5058398,4998906,4970248,4977008,4901605,5018764,5028143,4986752,4910008,
5289597,5338400,5277931,5337399,5306551,5345238,5624154,5511016,5526797,
5290519,5315875,5314788,5465660,5335071,5453069,5415432,5457134,5426959,
5532545,5520268,5527572,5338922,5474032,5286716,5458468,5764315,5388236,
5427763,5457364,5459638,5800777,5400168,5503682,5429933,5387479,5343859,
5303395,5413164,5343261,5999004,6037737,5881367,6026658,5960308,5928275,
5996203,5963999,5909533,5900198,5894657,5904184,5914669,5885290,5863655,
5915548,5830165,5837156,5972575,5976125,5970140,5989242,5834920,6165870,
6210884,6159139,6105985,5881398,6027418,6040806,6052457,6120842,6012492,
6001914,6045560,5910027,6061415,6107632,6033733,5947974,5901586,5856704,
5908948,5862343,5845667,5851669,5836662,5823227,5833891,6005339,6012271,
6037183,6000052,5941654,5917240,6043251,5998935,5977858,5969528,5988159,
5945234,5931107,5957279,5924087,6340374,6362143,6240358,6366305,6363209,
6321204,6362887,6219704,6368531,6345572,6366944,6368480,6457504,6455034,
6423981,6431093,6427894,6388840,6330136,6109416,6379508,6398307,6377042,
6349305,6382666,6338217,6400476,6379581,6336982,6258742,6219393,6242721,
6217587,6314152,6293488,6242641,6257828,6219409,6427911,6378697,6325329,
6434316,6408583,6421806,6368507,6395103,6326004,6440687,6298242,6163812,
6245021,6453756,6331836,6431420,6373466,6441773,6465156,6459661,6455150,
6252491,6319976,6414632,6445987,6279237,6253546,6292659,6321235,6314043,
6407393,6384714,6370679,6417443,6415777,6719726,6720301,6736745,6722925,
6753519,6622962,6760674,6731833,6765026,6765030,6760374,6720326,6513028,
6667940,6668861,6654277,6567505,6477417,6645349,6784100,6741387,6660848,
6538611,6533696,6520755,6572539,6537134,6524513,6574867,6525909,6494376,
6610551,6484172,6489851,6597668,6475445,6475810,6504985,6563227,6563299,
6538569,6504511,6549108,6530284,6533196,6486569,6566706,6493759,6493378,
6766304,6704438,6767826,6705358,6715993,6579524,6707139,6715391,6765245,
6739839,6487229,6593995,6599087,6578710,6585791,6546880,6598640,6568680,
6598470,6607037,6478017,6794191,6783378,6816227,6772387,6801509,6812634,
6832271,6769366,6783631,6666485,6810478,6574204,6729463,6665653,6801596,
6780225,6782466,6508335,6771536,6858984,6533941,6730235,6837408,6574332,
6673049,6661650,6653976,6637032,6544183,6689317,6678082,6621607,6639169,
6646918,6769685,6476457,6850733,6800883,6706889,6688883,6887528,6550722,
6743903,6544742,6834818,6758068,6872941,6521239,6697062,6873568,6654292,
6846094)
)
select
h.id_expediente,
CASE WHEN h.expediente IS NOT NULL THEN
   'EX'||'-'||REGEXP_SUBSTR(h.expediente,'[0-9]{4}',3)||'-'||
   REGEXP_SUBSTR(h.expediente,'[0-9]{1,8}',7) ||'- -'||
   'GDEBA' || REGEXP_SUBSTR(h.expediente,'-.+') END AS nro_expediente,
te.codigo_trata,
te.descripcion_trata,
h.tipo_operacion,
h.fecha_operacion,
h.motivo,
sr.nombre_reparticion as jurisdiccion_destino,
h.descripcion_reparticion_destin as reparticion_destino,
h.descripcion_sector_destino as sector_destino

from tabla_expedientes te
inner join ee_ged.historialoperacion h on te.id_expediente = h.id_expediente
inner join track_ged.sade_reparticion sr on h.codigo_jurisdiccion_destino
   = sr.codigo_reparticion
where h.fecha_operacion > trunc(sysdate)-7
order by h.id_expediente, h.fecha_operacion desc;