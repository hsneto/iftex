# IFTEX - Modelo de TCC do Ifes
Template de Trabalho de Conclusão de Curso de acordo com as [Normas para Apresentação de Trabalhos Acadêmicos e Científicos de 2017](https://www.ci.ifes.edu.br/images/stories/2017/biblioteca/caderno_normas_tcc_2017-277_rev_27-11.pdf) do Instituto Federal de Educação, Ciência e Tecnologia do Espírito Santo.

## Overleaf Gallery
[**IFTEX - Modelo de TCC do Ifes**](https://www.overleaf.com/latex/templates/iftex-modelo-de-tcc-do-ifes/cqxwcjyhkzkp)


## Dicas de uso

### Elementos visuais:

* [Figuras](https://github.com/hsneto/iftex/blob/master/textuais/testes.tex#L10)
* [Tabelas](https://github.com/hsneto/iftex/blob/master/textuais/testes.tex#L38)
* [Quadros](https://github.com/hsneto/iftex/blob/master/textuais/testes.tex#L60)

> Ferramenta para criação de tabelas e quadros: [LaTeX Table Generator](https://www.tablesgenerator.com/). Em caso de necessidade, faça os ajustes necessários.

> Em caso de tabelas e quadros ultrapassando a margem da página, utilize `tabularx` conforme o [exemplo](https://github.com/hsneto/iftex/blob/master/textuais/testes.tex#L60).


### Referências cruzadas:

Clique [aqui](https://github.com/hsneto/iftex/blob/master/textuais/testes.tex#L85) para exemplos de referências cruzadas.


### BibTex:

Em função das [Normas para apresentação de referências NBR 6023](ftp://ftp.sm.ifes.edu.br/rec/Normas%20de%20est%E1gio/Norma%20para%20apresentacao%20de%20referencias%20academicas.pdf), siga as recomendações abaixo:

* É aconselhável que todas as referências tenham a URL e data de acesso. Para tal utilize os campos `url`, `urlaccessdate`.
    * O campo `urlaccessdate` deve ser informado com o seguinte padrão: `urlaccessdate = {01 jan. 20xx}`
* Atente-se para o preenchimento dos nomes dos autores.
    * Acompanham o último sobrenome palavras indicativas de grau de parentesco como “Filho”, “Neto”, “Júnior”; Neste caso, o campo `author` deve ser preechido da seguinte forma `author = {Fulano da Silva{ }Júnior}`.
    * Altere o campo `abnt-full-initials` do pacote `abntex2cite` para `no` no arquivo [iftex.cls](https://github.com/hsneto/iftex/blob/master/iftex.cls#L52) para exibir os nomes contraídos ao invés do nome completo de todos os autores. 
* Em casos de referências com subtítulos, utilize os campos `title` e `subtitle` para a correta formatação.
* Em casos de monografias, teses de mestrado e phd utilize as seguintes referências `@monography`, `@@masterthesis`, `@phdthesis` respectivamente.
    * Em casos de erro, tente inserir os campos `pages` e `pagename`.
* Normas não utilizam o campo `author`, mas sim `organization` e `org-short`.


## Autores

* **Humberto da Silva Neto**
* Daniel Campos Pompermayer (contribuição)

## Licença

Este projeto está licenciado sob a licença LPPL - consulte o arquivo [LICENSE](LICENSE) para detalhes.