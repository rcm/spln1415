# Before 'make install' is performed this script should be runnable with
# 'make test'. After 'make install' it should work as 'perl Entidades-Reconhecer.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

#use Test::More tests => 13;
#use Test::More qw(no_plan);
use Test::More;

use utf8::all;
BEGIN { use_ok('Entidades::Reconhecer') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

sub testar {
	my ($texto, $resultado, $ignorar, $prep) = @_;

	my $t = Entidades::Reconhecer->new();
	$t->ignorar(@$ignorar) if defined $ignorar;
	if(defined $prep) {
		$t->preposicao(@$prep) 
	} else {
		$t->preposicao(qw(da de do das dos));
	}

	$t->reconhecer($texto);
	is_deeply([$t->entidades()], $resultado) or diag explain $t;
}

can_ok('Entidades::Reconhecer', qw(new reconhecer preposicao ignorar entidades));

my $t = Entidades::Reconhecer->new();
isa_ok($t, 'Entidades::Reconhecer');

testar('O Primeiro Ministro foi ao mercado', ['Primeiro Ministro']);
testar('O Primeiro Ministro foi à Assembleia da Republica', ['Assembleia da Republica', 'Primeiro Ministro']);
testar('Outros dois processos em curso contra funcionários da AT dizem respeito à consulta de dados de Cavaco Silva e de Paulo Portas, diz o Sindicato dos Trabalhadores dos Impostos.', ['AT', 'Cavaco Silva', 'Paulo Portas', 'Sindicato dos Trabalhadores dos Impostos']);
testar(<<EOF, ['António Costa', 'Comissão Europeia', 'Congresso do Partido Socialista Europeu', 'François Hollande', 'João Galamba', 'Matteo Renzi', 'Nuno Sá Lourenço', 'PS', 'Tratado Orçamental'], [qw{PÚBLICO}]);
Socialistas preparam a sua “leitura inteligente do Tratado Orçamental”

Nuno Sá Lourenço

28/03/2015 - 09:35

Congresso a nível europeu agendado para Junho deverá trazer novas propostas sobre o assunto.

Os partidos socialistas europeus estão a preparar um documento que pretende concretizar uma “visão diferente” da aplicação do Tratado Orçamental. O objectivo é definir uma “agenda de reformas estruturais diferente” da que tem sido defendida e aplicada pela direita europeia ao longo dos últimos anos.

De acordo com João Galamba, deputado e secretário-nacional do PS, a intenção é ter a proposta pronta a tempo do Congresso do Partido Socialista Europeu, agendado para 13 de Junho deste ano.

Até lá os diferentes líderes europeus da esfera socialista têm como meta a definição de propostas num conjunto de temas. João Galamba explicou ao PÚBLICO o caderno de encargos. “Emprego com direitos e salários dignos, definindo uma base abaixa da qual não se pode descer”, “investimento em factores de competitividade” e a denominada “leitura inteligente do Tratado Orçamental”.

É aqui que os socialistas pretendem marcar a diferença em relação à direita. A proposta que está a ser trabalhada é de fazer uma espécie de discriminação positiva que favoreça a despesa de investimento. “Dar tratamento diferente, no Orçamento, a despesas correntes e despesas de investimento”, explica Galamba.

Apoiados na “nova interpretação da Comissão Europeia sobre as regras orçamentais”, os socialistas querem aprofundar esse passo com uma proposta que reflicta o princípio de que “as despesas com o investimento não seja contabilizado nas metas orçamentais” dos governos nacionais.

A proposta dos socialistas tenciona ainda abordar a questão da harmonização fiscal. Com o argumento de que, como Galamba defende, “a concorrência fiscal entre Estados-membros, levada ao extremo é destrutiva”.

Estas propostas explicam melhor as declarações que o secretário-geral do PS, António Costa, fez nos últimos dias no seu périplo europeu. “É urgente uma inversão de política e é necessário dar um novo impulso para a convergência", afirmou na passada quarta-feira, em Roma, após uma reunião com o Primeiro-ministro de Itália, Matteo Renzi.

Os contactos e a preparação destas propostas fazem também luz sobre a estratégia com que Costa tenciona levar a cabo na frente continental. "Todos temos percebido nos últimos meses que a política europeia implica a constituição de alianças, a articulação de posições de forma que possamos ter uma posição eleitoral sólida, mas que não esteja em contradição com o que temos que fazer a seguir às eleições", disse o líder do PS depois do encontro com o presidente francês, François Hollande.

E foi após esse encontro que Costa admitiu que para construir o seu programa eleitoral tinha de o testar antes na Europa. “Considero que o princípio da confiança e da credibilidade é o valor mais importante que pode existir na política e entendo que, no processo de construção de um programa de Governo, é preciso avaliar as condições de execução desse programa, designadamente ao nível europeu."
EOF

testar(<<'EOF',['Ayo Johnson', 'Baidu Lawan', 'Birin Bolawa', 'Birin Fulani', 'Boko Haram', 'CNN', 'Christian Purefoy', 'Deutsche Bank', 'Energy Information Administration', 'Felix Aladeotan', 'House of Assembly', 'Human Rights Watch', 'INEC', 'ISIS', 'Ibrahim Adamu', 'Independent National Electoral Commission', 'Michael Martinez', 'Muhammadu Buhari', 'Nigeria Independent Electoral Commission', 'Nigerian Borno', 'Nigerian Cyber Army', 'President Goodluck Jonathan', 'President Jonathan', 'South Africa', 'Stephanie Busari', 'TeaM Nigerian Cyber Army', 'Victoria Island'], [qw{Why Many By}], [qw(of)]);
Nigerian election extended one day in some areas amid problems

By Michael Martinez, Christian Purefoy and Stephanie Busari, CNN

Nigerians debate presidential elections on streets

Lagos, Nigeria (CNN) Voting in Nigeria's presidential elections was extended one day, until Sunday, in several areas because ballot paper arrived late or new digital voting card readers failed, officials said Saturday.

The reading devices were being used for the first time in Nigeria to combat vote fraud, but it took even President Goodluck Jonathan more than 20 minutes to cast a ballot in his home state of Bayelsa because the scanner struggled to read his fingerprint.

Other areas saw delays in the delivery of ballot paper.

Further marring the presidential race were attacks by suspected Boko Haram militants on polling stations that killed at least 11 people, including voters waiting at polls. Also, hackers broke into the election commission's website.
Hackers breached Nigeria's election commission website.

But many polling stations reported no problems and began publicly counting ballots after voting ended Saturday night.

Continent's No. 1 economy

The haphazard balloting comes in a country that's now Africa's biggest economy and strives to hold a hotly contested presidential election without fraud. Such accusations plagued prior races.

Because of the failures with the card readers, Nigeria's Independent National Electoral Commission allowed some polling stations on Saturday to use "manual accreditation" of voters: Officials verified voters' identity by eyeballing their photos on voting cards -- a practice that some claimed led to fraud in the past.

Despite the setbacks, voters turned out in big numbers in many parts of the country, including in the north, where Boko Haram terrorists are based.

Nigeria's Independent National Electoral Commission was determined to accommodate every voter.

"We will be here until the last person casts their votes. We have to extend the poll because the ballot papers were late arriving," Felix Aladeotan, a volunteer INEC official, said in Lagos.

In one district without problems, officials began counting ballot results in ward 20 on Lagos' Victoria Island and, in a common practice, held up each ballot before a crowd of onlookers on Saturday. The crowd counted aloud, and police and representatives of political parties monitored the tabulation.

After a winner is declared for that ward, all ballots are later sent to a national collation center for verification.

Overall results are expected 48 hours after voting is completed, which now translates to Tuesday.

Boko Haram-blamed attacks

At least 11 people were killed Saturday and two more injured in attacks apparently by Boko Haram extremists at polling stations in the northeastern state of Gombe, residents said.

Boko Haram is a terrorist group in Nigeria seeking to create Sharia, or Islamic law.

In the Dukku village, three voters were killed at a polling station, and a lawmaker in the Gombe state House of Assembly was killed in his home, residents said. A chief of the nearby Tilen village was also killed at home.

A voter and two other people were killed in the Birin Fulani village, residents and police said.
Boko Haram: What you need to know

Boko Haram: What you need to know 01:57

In the Shole village in the Nafada district, two people were killed as residents lined up to vote in morning, residents said.

In the Birin Bolawa village, one person was killed, and election materials were set afire after officials fled a polling station, according to one official who escaped.

"They kept saying, 'Didn't we warn you to stay clear of polling stations?' " said Birin Fulani resident Baidu Lawan, who confirmed the killing of one resident.

In other attacks not related to voting, suspected Boko Haram militants decapitated 23 people in a raid Saturday night on Buratai village in northeast Nigerian Borno state, according to residents and Ibrahim Adamu, a local politician in the village.

A hacking

A group of hackers took responsibility for taking over the website of the Nigeria Independent Electoral Commission.

"[!] Strucked by Nigerian Cyber Army[!]," the hackers' message said on the website, until the site was taken down entirely late Saturday afternoon. "Sorry xD Your site has been stamped by TeaM Nigerian Cyber Army. Feel some shame admin!! Security is just an illusion."

Curiously, the lengthy message then encouraged Nigerians to "go and cast your vote."

The website remained inaccessible late Saturday afternoon.

The commission took to Twitter to acknowledge the hack: "We are aware of the recent hack of our website, we are currently investigating this incident."

Intense election in oil-rich nation

The vote for a Nigerian leader comes after weeks of delays caused by the Islamist insurgency, and analysts see it as the most tightly contested since military rule ended 16 years ago.

There are 14 presidential candidates on the ballot, but the race comes down to a rematch between incumbent President Jonathan and former military ruler Muhammadu Buhari. The two faced off in the last election in 2011.

In addition to the presidential elections, Nigerians are voting for governors in 36 states.

Though the stakes are high in this election amid intensified attacks by Boko Haram, there are other issues at play, including the economy and corruption.

Nigeria overtook South Africa as the continent's largest economy last year.

It relies on oil for 70% of its income and needs a price of nearly $120 a barrel to balance its budget, according to Deutsche Bank.

The oil slump, however, has taken world prices below $43 a barrel, their lowest level in six years, and that has placed the economy under severe strain.

Why Boko Haram isn't the only issue for Nigerians 02:07

Also, U.S. imports of crude oil and petroleum products from Nigeria plunged to just 1.7 million barrels in November, compared to 36.4 million barrels in July 2010, according to the U.S. Energy Information Administration.

Many complain the country's vast wealth from oil exports does not trickle down to the average citizen.

As many as 70% of Nigerians live below the poverty line and survive on less than a dollar a day.

Security takes center stage

Nigeria is also under economic pressure because of a weakened currency. Corruption has been a hindrance to building a stable economy despite years of democracy, analysts say.

But security has taken center stage as Boko Haram seeks to extend its tentacles with its recent pledge of allegiance to ISIS.

Just this year alone, the extremists have killed at least 1,000 civilians, Human Rights Watch says.

One of the militants' most brutal acts was the kidnapping of nearly 300 schoolgirls last April, a majority of whom are still missing. Boko Haram has become increasingly brazen, seizing towns in bloody attacks and declaring them Islamic caliphates.

'Successes here and there'

Nigeria has teamed up with neighboring Chad and Cameroon in a counteroffensive against the terror group. It appears to be working, with its military saying it has recaptured several key cities.

Although the current government is "having successes here and there" in its fight against Boko Haram, it's not winning the war, says Ayo Johnson, a documentary filmmaker and analyst on African affairs.

"This election will come down to who can protect Nigeria, who can make Nigerians feel safe," Johnson says.

Postponed for weeks.

Jonathan rode a wave of popularity in 2011, when he portrayed himself as a man of the people. During campaigns, he talked about growing up without shoes, a message that resonated with average Nigerians. But in recent years his popularity has plummeted, with Nigerians saying he has not delivered on his promises for change.

Buhari, a retired general, has unsuccessfully campaigned three times. He ruled Nigeria in the 1980s after a military coup, and has appealed to those who have run out of patience with the current government.

His military background could be a plus or a minus.

"Many Nigerians will not forget he was a military leader, during a dictatorship," Johnson says. "Or maybe they will feel that they need a military leader to address fundamental problems such as terrorism."

The election originally was scheduled for February 14, but was delayed for six weeks amid attacks by the Islamist terror group.

To avoid a runoff, a candidate must get more than 50% of the vote and at least a quarter in two-thirds of the states.

If no candidate wins, a runoff election will be held seven days later. 
EOF

testar(<<EOF, ['Associação Nacional de Municípios Portugueses', 'Câmara de Coimbra', 'Manuel Machado', 'Ministério do Ambiente', 'Miranda do Corvo', 'SIMLIS', 'SIMRIA', 'Vila Nova de Poiares', 'Águas de Portugal', 'Águas do Mondego'], [qw(Para)]);
Águas de Portugal tem tido "gestão ruinosa", acusa autarca de Coimbra.

Manuel Machado é mais uma voz contra a reforma no sector das Águas que o Governo pretende levar a cabo.
O presidente da Câmara de Coimbra, Manuel Machado, disse esta quarta-feira que a fusão dos sistemas multimunicipais de água e saneamento do Mondego, do Lis e da Ria representa um "confisco" dos bens municipais e públicos.

 "O que está a acontecer é um embuste que prejudica os municípios e os munícipes do nosso território, que afecta gravemente os bens patrimoniais que os municípios há muito anos vêm construindo e suportando", considerou o autarca socialista, que falava em conferência de imprensa a propósito da proposta do Governo.

 Para Manuel Machado, que lidera também a Associação Nacional de Municípios Portugueses, o Governo prepara-se para fazer, com a operação legislativa em curso, "um confisco" ao património dos municípios e assim agravar as tarifas do preço da água. O presidente do município de Coimbra disse que os municípios que integram a sociedade Águas do Mondego (AdM) vão usar todos os "mecanismos legais legítimos nas instituições e, se necessário, noutras, para que seja posta a ordem neste esbulho" que foi desencadeado pelo Governo.

 O autarca considera que o Governo está a preparar a fusão das Águas do Mondego, SIMLIS e SIMRIA "com artifícios que visam enriquecer a empresa Águas de Portugal, que tem tido uma gestão ruinosa ao longo do tempo, com base em estudos intencionalmente errados". Na contestação ao Ministério do Ambiente, os municípios da AdM vão também, segundo Manuel Machado, invocar o direito comercial, na medida em que são accionistas da empresa cujo accionista maioritário Águas de Portugal "está falido".

 "Não é aceitável que à custa da apropriação, diria ilegítima, de bens municipais, as empresas estatais que têm agravado a dívida pública e que não têm feito uma gestão racional dos bens com responsabilidade, tenha como objetivo apenas a transferência de património municipal para resolver os problemas que foram criados", frisou. Manuel Machado não aceita que os municípios sejam obrigados a abandonar uma posição na AdM, "que é rentável e uma das poucas que teve resultado positivo em 2013", para serem agrupados "à força e sob coação e ameaça dos fundos comunitários" numa empresa maior, "mas falida ou em situação de pré-ruptura operacional do ponto vista financeiro".

 O presidente da autarquia considerou a "situação de enorme gravidade" e ameaçou, no limite, usar do direito que prevê "o resgate da concessão do sistema multinacional e acabar com o embuste, que visa transferir os capitais para os cofres de uma entidade, em detrimento das populações que vão pagar a fatura da água mais cara".
 Além do presidente da Câmara de Coimbra, participaram na conferência de imprensa autarcas dos municípios de Condeixa-a-Nova, Lousã, Penacova, Mealhada e Vila Nova de Poiares.

 A AdM tem como accionistas a AdP (51%) e os municípios de Ansião e Leiria (distrito de Leiria), e Arganil, Coimbra, Condeixa-a-Nova, Góis, Lousã, Miranda do Corvo, Penacova e Vila Nova de Poiares (distrito de Coimbra), e Mealhada (distrito de Aveiro), que detêm 49% do capital social da empresa.
EOF

done_testing();
