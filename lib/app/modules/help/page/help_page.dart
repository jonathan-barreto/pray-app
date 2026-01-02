import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajuda'),
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
                  Icons.book_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Perguntas Frequentes (FAQ)',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildFaqItem(
            context,
            question: 'O que é o Pray?',
            answer:
                'O Pray é um aplicativo de devocionais cristãos que utiliza tecnologia para ajudar você a refletir sobre a Bíblia e a orar a partir do que está sentindo no momento. Ele não substitui a leitura bíblica, a oração pessoal ou o acompanhamento pastoral, mas serve como apoio espiritual diário.',
          ),
          _buildFaqItem(
            context,
            question: 'Como funcionam os devocionais personalizados?',
            answer:
                'Ao informar como você está se sentindo, o Pray gera um devocional baseado nas Escrituras, com uma reflexão e uma oração que ajudam a contextualizar a Palavra à sua experiência atual. O conteúdo é sempre fundamentado na Bíblia e apresentado como uma leitura possível, não como uma revelação absoluta.',
          ),
          _buildFaqItem(
            context,
            question: 'O Pray "fala por Deus"?',
            answer:
                'Não. O Pray não oferece profecias, revelações ou mensagens diretas de Deus. O aplicativo atua como um facilitador de reflexão bíblica, incentivando você a orar, pensar e buscar a Deus pessoalmente.',
          ),
          _buildFaqItem(
            context,
            question: 'Meus devocionais privados são realmente privados?',
            answer:
                'Sim. Os devocionais privados são visíveis apenas para você. Eles não são publicados, compartilhados ou exibidos para outros usuários.',
          ),
          _buildFaqItem(
            context,
            question: 'Qual a diferença entre devocionais públicos e privados?',
            answer:
                'Devocionais públicos: conteúdos diários gerados para toda a comunidade do app.\n\nDevocionais privados: conteúdos personalizados gerados exclusivamente a partir do sentimento que você compartilha.',
          ),
          _buildFaqItem(
            context,
            question: 'O que são streaks, métricas e conquistas?',
            answer:
                'São recursos opcionais que ajudam a acompanhar sua constância e engajamento com o app. Eles não medem espiritualidade, fé ou maturidade cristã — apenas registram uso e hábitos.',
          ),
          _buildFaqItem(
            context,
            question: 'Posso excluir minha conta?',
            answer:
                'Sim. Você pode solicitar a exclusão da sua conta a qualquer momento. Ao fazer isso, seus dados pessoais e devocionais privados serão removidos conforme descrito na política de privacidade.',
          ),
          _buildFaqItem(
            context,
            question:
                'O Pray substitui aconselhamento pastoral ou psicológico?',
            answer:
                'Não. O Pray não substitui líderes espirituais, aconselhamento pastoral, terapia ou acompanhamento profissional. Em situações de sofrimento intenso, ansiedade persistente ou crise emocional, é importante buscar ajuda qualificada.',
          ),
        ],
      ),
    );
  }

  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.primaryContainer.withValues(alpha: 0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        title: Text(
          question,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
