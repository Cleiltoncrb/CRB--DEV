create table tb_cliente(

    -- Dados Cliente
    id bigint not null auto_increment,
    ativo tinyint not null,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    cpf varchar(14) not null unique,
    telefone varchar(20) not null,

    -- Dados Endereço Cliente
    logradouro varchar(100) not null,
    bairro varchar(100) not null,
    cep varchar(9) not null,
    uf char(2) not null,
    cidade varchar(100) not null,
    numero varchar(20),
    complemento varchar(100),

    -- Dados Carro Cliente
    placa varchar(7) not null,
    marca varchar(100) not null,
    modelo varchar(100) not null,
    cor varchar(20) not null,
    anofabricacao varchar(4) not null,

    primary key(id)
);