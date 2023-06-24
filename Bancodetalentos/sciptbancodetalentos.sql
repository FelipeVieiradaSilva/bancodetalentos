
CREATE TABLE projetos (
                projeto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(150) NOT NULL,
                descricao VARCHAR NOT NULL,
                periodo_de_execucao VARCHAR NOT NULL,
                funcao_desempenhada VARCHAR NOT NULL,
                CONSTRAINT projetos_pk PRIMARY KEY (projeto_id)
);
COMMENT ON TABLE projetos IS 'tabela referente aos projetos realizados';
COMMENT ON COLUMN projetos.projeto_id IS 'ID do projeto sendo a pk da tabela projetos';
COMMENT ON COLUMN projetos.nome IS 'nome do projeto';
COMMENT ON COLUMN projetos.descricao IS 'Descrição sobre o projeto feito';
COMMENT ON COLUMN projetos.periodo_de_execucao IS 'Período de execução do projeto';
COMMENT ON COLUMN projetos.funcao_desempenhada IS 'Função desempenhda pelo funcionário no projeto';


CREATE TABLE cursos (
                curso_id NUMERIC(38) NOT NULL,
                nome VARCHAR(150) NOT NULL,
                instituicao VARCHAR(150) NOT NULL,
                carga_horaria VARCHAR NOT NULL,
                certificacoes VARCHAR NOT NULL,
                CONSTRAINT cursos_pk PRIMARY KEY (curso_id)
);
COMMENT ON TABLE cursos IS 'tabela referente ao curso que o funcionário está fazendo';
COMMENT ON COLUMN cursos.curso_id IS 'ID do curso sendo a pk da tabela cursos';
COMMENT ON COLUMN cursos.nome IS 'nome referente ao curso';
COMMENT ON COLUMN cursos.instituicao IS 'A instituição em que o funcionário realizou o curso';
COMMENT ON COLUMN cursos.carga_horaria IS 'Tempo de curso que o funcionário tem que realizar';
COMMENT ON COLUMN cursos.certificacoes IS 'Certificações do curso realizado';


CREATE TABLE funcionarios (
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR(150) NOT NULL,
                cargo VARCHAR(150) NOT NULL,
                experiencia VARCHAR(15) NOT NULL,
                hard_skills VARCHAR NOT NULL,
                soft_skills VARCHAR NOT NULL,
                formacao_academica VARCHAR(30) NOT NULL,
                hobbies VARCHAR,
                cep NUMERIC(15) NOT NULL,
                numero NUMERIC(10) NOT NULL,
                complemento NUMERIC,
                CONSTRAINT funcionarios_pk PRIMARY KEY (funcionario_id)
);
COMMENT ON TABLE funcionarios IS 'É a tabela que guarda os dados dos funcionários.';
COMMENT ON COLUMN funcionarios.funcionario_id IS 'ID que representa o funcionário sendo a pk da tabela funcionários';
COMMENT ON COLUMN funcionarios.nome IS 'Nome completo do funcionário';
COMMENT ON COLUMN funcionarios.cargo IS 'cargo referente a cada funcionário';
COMMENT ON COLUMN funcionarios.experiencia IS 'Grau de experiência do funcionário';
COMMENT ON COLUMN funcionarios.hard_skills IS 'Habilidades técnicas de cada funcionário';
COMMENT ON COLUMN funcionarios.soft_skills IS 'Competências subjetivas dos funcionários';
COMMENT ON COLUMN funcionarios.formacao_academica IS 'Nível de ensino que o funcionário obteve';
COMMENT ON COLUMN funcionarios.hobbies IS 'interesses pessoais do funcionário';
COMMENT ON COLUMN funcionarios.cep IS 'CEP referente ao funcionário';
COMMENT ON COLUMN funcionarios.numero IS 'Número do prédio ou da casa de onde o funcionário mora';
COMMENT ON COLUMN funcionarios.complemento IS 'o complemento que o funcionário quiser colocar';


CREATE TABLE departamentos (
                departamento_id NUMERIC NOT NULL,
                funcionario_id NUMERIC(38) NOT NULL,
                nome VARCHAR NOT NULL,
                CONSTRAINT departamento_pk PRIMARY KEY (departamento_id)
);
COMMENT ON TABLE departamentos IS 'tabela referente aos departamentos ';
COMMENT ON COLUMN departamentos.departamento_id IS 'ID do departamento';
COMMENT ON COLUMN departamentos.funcionario_id IS 'ID que representa o funcionário sendo a pk da tabela funcionários';
COMMENT ON COLUMN departamentos.nome IS 'nome do departamento ';


CREATE TABLE funcionarios_contato (
                email VARCHAR NOT NULL,
                funcionario_id NUMERIC(38) NOT NULL,
                telefone NUMERIC(11) NOT NULL,
                github VARCHAR,
                linkedin VARCHAR,
                instagram VARCHAR,
                twitter VARCHAR,
                facebook VARCHAR,
                CONSTRAINT contato_pk PRIMARY KEY (email)
);
COMMENT ON TABLE funcionarios_contato IS 'tabela referente aos tipos de contatos do funcionario';
COMMENT ON COLUMN funcionarios_contato.email IS 'email do funcionario';
COMMENT ON COLUMN funcionarios_contato.funcionario_id IS 'ID que representa o funcionário sendo a fk da tabela contato
';
COMMENT ON COLUMN funcionarios_contato.telefone IS 'coluna referente ao numero de telefone do funcionario';
COMMENT ON COLUMN funcionarios_contato.github IS 'coluna que da o github do funcionario caso ele queira colocar';
COMMENT ON COLUMN funcionarios_contato.linkedin IS 'coluna que da o linkedin do funcionario caso ele queira';
COMMENT ON COLUMN funcionarios_contato.instagram IS 'instagram do funcionario';
COMMENT ON COLUMN funcionarios_contato.twitter IS 'twitter do funcionario';
COMMENT ON COLUMN funcionarios_contato.facebook IS 'facebook do funcionario';


CREATE TABLE associacao_funcionarios_cursos (
                associacao_funcionarios_cursos_id NUMERIC(38) NOT NULL,
                funcionario_id NUMERIC(38) NOT NULL,
                curso_id NUMERIC(38) NOT NULL,
                data_de_conclusao DATE NOT NULL,
                CONSTRAINT associacao_funcionarios_cursos_pk PRIMARY KEY (associacao_funcionarios_cursos_id)
);
COMMENT ON TABLE associacao_funcionarios_cursos IS 'tabela refente a associacao entre os funcionarios e os cursos realizados';
COMMENT ON COLUMN associacao_funcionarios_cursos.associacao_funcionarios_cursos_id IS 'ID da associacao entre os funcionarios e os cursos';
COMMENT ON COLUMN associacao_funcionarios_cursos.funcionario_id IS 'ID que representa o funcionário sendo a fk da tabela funcionário_cursos';
COMMENT ON COLUMN associacao_funcionarios_cursos.curso_id IS 'ID do curso sendo a fk da tabela funcionário_cursos';
COMMENT ON COLUMN associacao_funcionarios_cursos.data_de_conclusao IS 'Data em que o funcionário terminou o curso';


CREATE TABLE associacao_funcionario_projeto (
                associacao_funcionario_projeto_id NUMERIC(38) NOT NULL,
                funcionario_id NUMERIC(38) NOT NULL,
                projeto_id NUMERIC(38) NOT NULL,
                data_de_inicio DATE NOT NULL,
                data_de_termino DATE NOT NULL,
                CONSTRAINT associacao_funcionario_projeto_pk PRIMARY KEY (associacao_funcionario_projeto_id)
);
COMMENT ON TABLE associacao_funcionario_projeto IS 'tabela que interliga os funcionários com os projetos';
COMMENT ON COLUMN associacao_funcionario_projeto.associacao_funcionario_projeto_id IS 'ID da associacao entre os funcionarios e os projetos sendo a pk da tabela';
COMMENT ON COLUMN associacao_funcionario_projeto.funcionario_id IS 'ID que representa o funcionário sendo a fk da tabela funcionário_projeto';
COMMENT ON COLUMN associacao_funcionario_projeto.projeto_id IS 'ID do projeto sendo a fk da tabela funcionário_projeto';
COMMENT ON COLUMN associacao_funcionario_projeto.data_de_inicio IS 'Data em que o funcionário começou a realizar o projeto';
COMMENT ON COLUMN associacao_funcionario_projeto.data_de_termino IS 'Data em que o funcionário terminou o projeto';


ALTER TABLE associacao_funcionario_projeto ADD CONSTRAINT projetos_associacao_funcionario_projeto_fk
FOREIGN KEY (projeto_id)
REFERENCES projetos (projeto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE associacao_funcionarios_cursos ADD CONSTRAINT cursos_associacao_funcionarios_cursos_fk
FOREIGN KEY (curso_id)
REFERENCES cursos (curso_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE associacao_funcionario_projeto ADD CONSTRAINT funcionarios_associacao_funcionario_projeto_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE associacao_funcionarios_cursos ADD CONSTRAINT funcionarios_associacao_funcionarios_cursos_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE funcionarios_contato ADD CONSTRAINT funcionarios_funcionarios_contato_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamentos ADD CONSTRAINT funcionarios_departamentos_fk
FOREIGN KEY (funcionario_id)
REFERENCES funcionarios (funcionario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
