import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacidade'),
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
                  Icons.lock_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'A sua privacidade é levada a sério.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSection(
            context,
            title: 'Quais dados coletamos?',
            content:
                'O Pray coleta apenas os dados necessários para o funcionamento do aplicativo, como:\n\n• Nome e e-mail\n• Informações de autenticação\n• Sentimentos informados para geração de devocionais\n• Interações dentro do app (curtidas, conclusões, feedbacks)',
          ),
          _buildSection(
            context,
            title: 'Como seus dados são usados?',
            content:
                'Seus dados são utilizados exclusivamente para:\n\n• Autenticar sua conta\n• Personalizar sua experiência no app\n• Gerar devocionais privados\n• Melhorar a qualidade do conteúdo e do serviço\n\nNunca utilizamos seus dados para fins comerciais externos ou venda a terceiros.',
          ),
          _buildSection(
            context,
            title: 'Devocionais privados são compartilhados?',
            content:
                'Não. Devocionais privados e sentimentos informados não são compartilhados com outros usuários. Eles são tratados como conteúdo pessoal.',
          ),
          _buildSection(
            context,
            title: 'Uso de inteligência artificial',
            content:
                'O Pray utiliza inteligência artificial para gerar conteúdos devocionais a partir de parâmetros definidos. Esses conteúdos não representam revelações divinas nem substituem a fé, a Bíblia ou a oração pessoal.',
          ),
          _buildSection(
            context,
            title: 'Posso apagar meus dados?',
            content:
                'Sim. Você pode solicitar a exclusão da sua conta a qualquer momento. Após a exclusão, seus dados pessoais e conteúdos privados serão removidos de forma permanente, respeitando obrigações legais aplicáveis.',
          ),
          _buildSection(
            context,
            title: 'Segurança',
            content:
                'Adotamos medidas técnicas e organizacionais para proteger seus dados contra acessos não autorizados, perdas ou usos indevidos.',
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
