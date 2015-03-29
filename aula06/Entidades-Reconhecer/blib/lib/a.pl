use Entidades::Reconhecer;
use utf8::all;

my  $t = Entidades::Reconhecer->new();

$t->ignorar(qw{Além A As Aos Ao O Os Na Nas No Nos Daqui De Destes Há Já Esta Em Nessa Não São});

while(<DATA>) {
	$t->reconhecer($_);
}

for my $e ($t->entidades()) {
	print "$e\n";
}

__DATA__
Acessos a dados de Passos Coelho levaram a 35 processos disciplinares

Luís Villalobos

27/03/2015 - 15:15

Outros dois processos em curso contra funcionários da AT dizem respeito à consulta de dados de Cavaco Silva e de Paulo Portas, diz o Sindicato dos Trabalhadores dos Impostos.

Há 37 processos disciplinares aplicados a funcionários da Autoridade Tributária e Aduaneira (AT), e, de acordo com o presidente do Sindicato dos Trabalhadores dos Impostos (STI), Paulo Ralha, 35 estão ligados à consulta de dados fiscais do primeiro-ministro, Pedro Passos Coelho. Os outros dois dizem respeito ao Presidente da República, Cavaco Silva, e ao vice-primeiro-ministro, Paulo Portas.

Além destes processos (por suspeita de acesso indevido, fora das suas funções), que Paulo Ralha diz terem começado em Novembro, há ainda cinco processos de averiguação (que podem conduzir a processos disciplinares) e mais 111 notificações (que podem transformar-se em averiguações).

De acordo com o STI, todas estas diligências de responsáveis da AT surgiram na sequência da “lista VIP”, que teria alertas automáticos quando havia consultas a dados fiscais de determinadas personalidades políticas. Paulo Ralha garante que esta lista era composta por apenas quatro nomes, e que, além de Passos Coelho, Paulo Portas e Cavaco Silva, incluiria também o nome do secretário de Estado dos Assuntos Fiscais, Paulo Núncio.

Já Brigas Afonso, anterior director geral da AT, afirmou, na sua carta de demissão de 18 de Março (onde negou a existência de uma “lista VIP”) que todos os processos disciplinares em curso “resultam exclusivamente de notícias publicadas nos jornais com violações consumadas do direito ao sigilo e de queixas de contribuintes individuais sobre acessos indevidos aos seus dados pessoais”. “Não foi aberto nenhum processo contra funcionários que efectuaram consultas no exercício das suas funções”, garantiu.

Em Setembro do ano passado, quando surgiram notícias sobre a situação fiscal do primeiro-ministro, a área de segurança informática “propôs um procedimento de controlo de acesso aos dados, com mecanismos de alerta de determinados contribuintes em que o risco de tentativas de acesso indevido seja mais elevado”.

Daqui, assegurou Brigas Afonso, avançou-se para a elaboração de “uma proposta de implementação de uma medida definitiva de salvaguarda do sigilo fiscal”. O ex-director-geral garante, no entanto, que não se chegou a uma “proposta definitiva de concretização” de medidas de controlo e “nunca foi constituída qualquer lista de contribuintes para este feito”.

O que Brigas Afonso diz ter feito foi proceder à abertura de uma auditoria para apurar se tinha havido quebra de sigilo fiscal relacionada com Passos Coelho. Não referiu número de acessos, mas avançou que 69,7% das consultas aos registos do primeiro-ministro “foram feitas por mera curiosidade” e não por questões de trabalho. Nessa auditoria, diz o próprio, havia referência à “implementação da referida medida de controlo”, ou seja, à lista VIP, mas, garante, devido a um erro.

Esta quinta-feira, a Visão publicou um trabalho onde relata o conteúdo da auditoria pedida por Brigas Afonso. A revista refere que entre Janeiro e 26 de Setembro de 2014 “houve 106 registos de consulta ao processo fiscal de Pedro Passos Coelho, efectuados por 34 trabalhadores”. Destes, 23 (os tais 69,7%) justificaram o acesso “por mera curiosidade”. 


Co-piloto aproveitou medidas antiterrorismo e lançou o avião contra os Alpes
Na manhã desta quinta-feira, as autoridades francesas transformaram o mistério da queda do Airbus nos Alpes numa conclusão alarmante. O desastre foi deliberadamente provocado pelo co-piloto, o alemão Andreas Lubitz, de 27 anos, que aproveitou a saída do comandante para se trancar no cockpit e precipitar a aeronave contra as montanhas, matando assim as 150 pessoas que iam a bordo.

Não são conhecidas ainda as razões que levaram Andreas Lubitz a fazer despenhar-se o Airbus da Germanwings. As autoridades francesas dizem que nada aponta para que se tratasse de um acto terrorista e existe também alguma resistência a rotular as acções do co-piloto como um suicídio. O procurador-geral de Marselha, Brice Robin, o primeiro a dar a conhecer as conclusões da investigação, disse que não podia usar esse termo: “Não posso chamar a isto um suicídio, mas essa é uma pergunta legítima a fazer”.

Horas depois de as autoridades francesas anunciarem a conclusão imprevisível foi o CEO da Lufthansa – a operadora alemã que detém a subsidiária low cost Germanwings – que se recusou a usar o termo suicídio. Mas por outras razões. “Não sou um especialista legal”, começou por dizer Carsten Spohr, “mas quando alguém leva mais 149 pessoas para a morte com ele, não é propriamente aquilo a que chamaria suicídio”, concluiu.

Estas conclusões foram produzidas a partir do registo sonoro do que se passou na cabine do Airbus A320 nos minutos que antecederam o impacto. Segundo Brice Robin, as gravações encontradas na caixa negra do avião contam a história do desastre.

Tudo aconteceu nos últimos dez minutos do voo. Até a esse momento, nada apontava para o que viria a passar-se. O procurador francês diz que ambos os pilotos conversaram normalmente – até de forma “animada”, nas suas palavras – durante 20 minutos. Começaram depois a preparar os planos para a aterragem em Düsseldorf. Nesta fase da conversa, Lubitz tornou-se “lacónico”. Mal o avião atinge a altitude cruzeiro, o comandante pede a Lubitz que tome o controlo. Ouve-se o deslizar de uma cadeira e o som da porta da cabine a fechar-se. O comandante saíra e não voltaria a entrar.

A sós na cabine, Lubitz accionou quase imediatamente um mecanismo que fez com que o avião começasse a perder altitude a uma média de 1000 metros por minuto, segundo os dados avançados pela agência de segurança aérea francesa na quarta-feira. Algo que só pode ser feito “voluntariamente”, explicou Brice Robin. A partir desse momento, o avião demorou dez minutos a embater contra as montanhas, a uma velocidade de cerca de 700 quilómetros por hora. São dez minutos em que se ouve Lubitz respirar normalmente, sem responder aos apelos do comandante para que abrisse a porta do cockpit ou às tentativas de contacto de operadores aéreos que recebiam informações de que o avião estava perigosamente próximo ao solo. Lubitz ficou em silêncio até ao embate final. 

As gravações recolhidas da caixa negra mostram que o comandante tentou repetidamente voltar ao cockpit, mas sem sucesso. As autoridades francesas acreditam que terá sido Lubitz quem impediu a entrada do comandante, embora não se saiba ao certo quais os mecanismos de segurança que foram activados. Sabe-se, no entanto, que a porta do cockpit só pode ser aberta a partir do interior e que o comandante bateu várias vezes à porta. Chegou a tentar arrombá-la, pouco antes de o avião se despenhar.

Desde o 11 de Setembro que os procedimentos de segurança impedem o acesso ao cockpit pelo exterior. Existe um mecanismo de recurso, através de um código introduzido na porta, para o caso de os ocupantes da cabine não estarem conscientes. Mas este mecanismo pode ser anulado no interior e renovado por períodos de cinco minutos, como as autoridades acreditam que aconteceu.  

A caixa negra registou ainda os gritos da tripulação e um grande estrondo. Acredita-se que este tenha sido o som de o avião embater parcialmente numa montanha antes de se despenhar por completo. “A morte terá sido repentina, imediata”, disse Brice Robin aos jornalistas.

Sistema tem perigos
Apenas nos EUA é exigida a chamada “regra dos dois”. Esta obriga a que estejam sempre pelo menos duas pessoas no cockpit. De outra maneira, alertam os pilotos, existe a possibilidade de se tirar proveito do próprio mecanismo de segurança que impede o acesso vindo do exterior ao cockpit, concebido para impedir ataques terroristas. A TAP não segue necessariamente a “regra dos dois”. Ao PÚBLICO a operadora do Estado português apontou apenas para a “prática generalizada da indústria”, que é a de deixar para o comandante a decisão sobre “a necessidade de chamar ao cockpit um tripulante de cabina perante a ausência de um membro da tripulação técnica”.
