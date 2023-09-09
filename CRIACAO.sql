CREATE TABLE MARCA
(
	IDMARCA INTEGER PRIMARY KEY AUTOINCREMENT,
	MARCA VARCHAR(20)
);

CREATE TABLE MODELO
(
	IDMODELO INTEGER PRIMARY KEY AUTOINCREMENT,
	MODELO VARCHAR(20)
);

CREATE TABLE COR
(
	IDCOR INTEGER PRIMARY KEY AUTOINCREMENT,
	COR VARCHAR(20)
);

CREATE TABLE VEICULO (
    IDVEICULO INTEGER PRIMARY KEY AUTOINCREMENT,
    PLACA VARCHAR(7) NOT NULL,
    IDMARCA INTEGER NOT NULL,
    IDMODELO INTEGER NOT NULL,
    IDCOR INTEGER NOT NULL,
    OCUPANTES INTEGER NOT NULL,
    VGRAVE INTEGER NOT NULL,
    VLEVE INTEGER NOT NULL,
    VFATAL INTEGER NOT NULL,
    FOREIGN KEY (IDMARCA) REFERENCES MARCA(IDMARCA),
    FOREIGN KEY (IDMODELO) REFERENCES MODELO(IDMODELO),
    FOREIGN KEY (IDCOR) REFERENCES COR(IDCOR)
);

CREATE TABLE VIA
(
	IDVIA INTEGER PRIMARY KEY AUTOINCREMENT,
	PREFIXO VARCHAR(5),
	RODOVIA VARCHAR(200)
);

CREATE TABLE ACIDENTE
(
	REGISTRO INTEGER PRIMARY KEY AUTOINCREMENT,
	IDBO INTEGER NOT NULL,
	IDVEICULO INTEGER NOT NULL,
	DATA DATE,
	IDVIA INTEGER NOT NULL,
	SENTIDO CHAR(1) NOT NULL,
	CLIMA CHAR(1) NOT NULL,
	TRACADOVIA CHAR(1)NOT NULL,
	VEICENVOLVIDO INTEGER NOT NULL,
	FOREIGN KEY (IDVIA) REFERENCES VIA(IDVIA),
	FOREIGN KEY (IDVEICULO) REFERENCES VEICULO(IDVEICULO),
	CHECK (SENTIDO IN('N','S','L','O')),
	CHECK (CLIMA IN('C','N','S')),
	CHECK (TRACADOVIA IN('R','C','A','D'))
);

