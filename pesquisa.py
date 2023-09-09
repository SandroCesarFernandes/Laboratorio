##############################################################################
# Alunos: ERICK CÉSAR DOMINGOS BARBOSA
#         SANDRO CESAR FERNANDES
# pesquisa.py - converte base de dados relacional em não relacional
##############################################################################

import sqlite3
from pymongo import MongoClient

cliente = MongoClient("localhost", 27017)
db = cliente["LabVI"]
colecao = db["Acidentes"]

conn = sqlite3.connect('/home/sandro/Documentos/Projetos/Lab VI/BD/Untitled')
cursor = conn.cursor()
query = """SELECT
    V.PLACA,
    M.MARCA,
    MD.MODELO,
    C.COR,
    V.OCUPANTES,
    V.VGRAVE,
    V.VLEVE,
    V.VFATAL,
    A.IDBO,
    A.DATA,
    VI.RODOVIA,
    A.IDVIA,
    A.SENTIDO,
    A.CLIMA,
    A.TRACADOVIA,
    A.VEICENVOLVIDO
FROM VEICULO V
INNER JOIN ACIDENTE A ON V.IDVEICULO = A.IDVEICULO
INNER JOIN MARCA M ON V.IDMARCA = M.IDMARCA
INNER JOIN MODELO MD ON V.IDMODELO = MD.IDMODELO
INNER JOIN COR C ON V.IDCOR = C.IDCOR
INNER JOIN VIA VI ON A.IDVIA = VI.IDVIA;
"""

cursor.execute(query)
documentos = []

for linha in cursor.fetchall():
    documento = {
        "PLACA": linha[0],
        "MARCA": linha[1],
        "MODELO": linha[2],
        "COR": linha[3],
        "OCUPANTES": linha[4],
        "VITIMA_GRAVE": linha[5],
        "VITIMA_LEVE": linha[6],
        "VITIMA_FATAL": linha[7],
        "BOLETIM": linha[8],
        "DATA": linha[9], 
        "RODOVIA": linha[10],
        "CLIMA": linha[13],  
        "TRAÇADO_VIA": linha[14],  
        "VEICULOS_ENVOLVIDOS": linha[15],  
    }
    documentos.append(documento)

colecao.insert_many(documentos)
conn.close()