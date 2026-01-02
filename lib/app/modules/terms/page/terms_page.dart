import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Termos de Uso'),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Termos e Condições de Uso',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Ao utilizar o aplicativo Pray, você concorda com os termos e condições descritos abaixo. Caso não concorde com algum ponto, recomendamos que não utilize o aplicativo.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            title: '1. Sobre o Pray',
            content:
                'O Pray é um aplicativo que utiliza tecnologia, incluindo inteligência artificial, para auxiliar usuários na reflexão bíblica e na prática da oração cristã.\n\nO Pray não oferece aconselhamento pastoral, psicológico, médico ou espiritual individualizado, nem substitui a leitura da Bíblia, a oração pessoal, o acompanhamento pastoral ou profissional.\n\nO conteúdo disponibilizado tem caráter reflexivo e devocional, não sendo apresentado como revelação divina, profecia ou orientação absoluta.',
          ),
          _buildSection(
            context,
            title: '2. Elegibilidade',
            content:
                'Ao utilizar o Pray, você declara que:\n\n• Possui capacidade legal para aceitar estes Termos\n• As informações fornecidas no cadastro são verdadeiras e atualizadas\n• Utilizará o aplicativo de forma ética, respeitosa e em conformidade com estes Termos',
          ),
          _buildSection(
            context,
            title: '3. Conta do Usuário',
            content:
                'Para acessar determinadas funcionalidades, é necessário criar uma conta.\n\nVocê é responsável por:\n\n• Manter a confidencialidade de suas credenciais\n• Todas as atividades realizadas em sua conta\n• Informar imediatamente qualquer uso não autorizado\n\nO Pray reserva-se o direito de suspender ou encerrar contas em caso de uso indevido ou violação destes Termos.',
          ),
          _buildSection(
            context,
            title: '4. Uso de Inteligência Artificial',
            content:
                'O Pray utiliza inteligência artificial para gerar conteúdos devocionais com base em parâmetros definidos, incluindo sentimentos informados pelo usuário.\n\nVocê reconhece que:\n\n• O conteúdo gerado é uma leitura possível das Escrituras, não uma interpretação definitiva\n• A inteligência artificial não fala em nome de Deus\n• Nenhum conteúdo deve ser entendido como promessa específica de ação divina\n\nO uso da IA tem como objetivo auxiliar a reflexão e a oração, não substituir a experiência espiritual pessoal do usuário.',
          ),
          _buildSection(
            context,
            title: '5. Devocionais Personalizados e Limites de Uso',
            content:
                'O Pray pode estabelecer limites na geração de devocionais personalizados, com o objetivo de:\n\n• Preservar um ritmo saudável de uso\n• Manter a qualidade da experiência\n• Garantir a sustentabilidade técnica do serviço\n\nEsses limites podem ser ajustados a qualquer momento, mediante comunicação no aplicativo.',
          ),
          _buildSection(
            context,
            title: '6. Conteúdos Privados e Públicos',
            content:
                'Devocionais privados são gerados exclusivamente para o usuário e não são compartilhados publicamente.\n\nDevocionais públicos são disponibilizados para toda a comunidade do aplicativo.\n\nO usuário é responsável pelo conteúdo emocional ou textual que informar ao utilizar o app.',
          ),
          _buildSection(
            context,
            title: '7. Uso Adequado do Aplicativo',
            content:
                'É vedado ao usuário:\n\n• Utilizar o Pray para fins ilegais ou abusivos\n• Tentar explorar falhas técnicas ou de segurança\n• Utilizar o conteúdo do app como substituto para aconselhamento profissional em situações graves\n\nEm casos de sofrimento intenso, ansiedade persistente ou crises emocionais, recomenda-se buscar ajuda especializada.',
          ),
          _buildSection(
            context,
            title: '8. Propriedade Intelectual',
            content:
                'Todo o conteúdo disponibilizado no Pray, incluindo textos, design, estrutura e funcionalidades, é protegido por direitos autorais.\n\nÉ proibida a reprodução, distribuição ou modificação do conteúdo sem autorização prévia, salvo nos limites permitidos por lei.',
          ),
          _buildSection(
            context,
            title: '9. Exclusão de Conta',
            content:
                'O usuário pode solicitar a exclusão de sua conta a qualquer momento.\n\nApós a exclusão:\n\n• Dados pessoais e conteúdos privados serão removidos, respeitando obrigações legais aplicáveis\n• O acesso ao aplicativo será encerrado de forma permanente',
          ),
          _buildSection(
            context,
            title: '10. Limitação de Responsabilidade',
            content:
                'O Pray não se responsabiliza por:\n\n• Decisões pessoais tomadas com base no conteúdo do aplicativo\n• Interpretações individuais do conteúdo gerado\n• Eventuais indisponibilidades técnicas temporárias\n\nO uso do aplicativo é de responsabilidade exclusiva do usuário.',
          ),
          _buildSection(
            context,
            title: '11. Alterações nos Termos',
            content:
                'O Pray pode atualizar estes Termos de Uso periodicamente.\n\nO uso contínuo do aplicativo após alterações implica concordância com os novos termos.',
          ),
          _buildSection(
            context,
            title: '12. Contato',
            content:
                'Em caso de dúvidas, sugestões ou solicitações relacionadas a estes Termos, o usuário pode entrar em contato pelos canais oficiais disponibilizados no aplicativo.',
          ),
          const SizedBox(height: 16),
          Text(
            'Última atualização: Dezembro 2025',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.primaryContainer.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
