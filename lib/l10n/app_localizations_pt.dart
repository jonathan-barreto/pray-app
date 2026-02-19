// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get loginTitle => 'Acesse o Pray!';

  @override
  String get loginSubtitle =>
      'Entre para viver momentos de fé e inspiração todos os dias.';

  @override
  String get loginButton => 'Entrar';

  @override
  String get loginForgotPassword => 'Esqueci minha senha';

  @override
  String get loginNoAccount => 'Não tem uma conta? ';

  @override
  String get loginSignUp => 'Crie agora';

  @override
  String get registerTitle => 'Crie sua conta';

  @override
  String get registerSubtitle =>
      'Junte-se a nós e comece sua jornada de fé e inspiração.';

  @override
  String get registerButton => 'Cadastrar';

  @override
  String get registerHaveAccount => 'Já tem uma conta? ';

  @override
  String get registerSignIn => 'Entre agora';

  @override
  String get forgotPasswordAppBar => 'Recuperar Senha';

  @override
  String get forgotPasswordTitle => 'Esqueceu sua senha?';

  @override
  String get forgotPasswordSubtitle =>
      'Digite seu email e enviaremos um código de verificação para redefinir sua senha.';

  @override
  String get forgotPasswordButton => 'Enviar Código';

  @override
  String get verifyCodeAppBar => 'Verificar Código';

  @override
  String get verifyCodeTitle => 'Digite o código';

  @override
  String verifyCodeSubtitle(String email) {
    return 'Enviamos um código de 6 dígitos para $email';
  }

  @override
  String get verifyCodeLabel => 'Código de Verificação';

  @override
  String get verifyCodeHint => '123456';

  @override
  String get verifyCodeEmpty => 'Digite o código';

  @override
  String get verifyCodeInvalid => 'O código deve ter 6 dígitos';

  @override
  String get verifyCodeButton => 'Verificar Código';

  @override
  String get resetPasswordAppBar => 'Nova Senha';

  @override
  String get resetPasswordTitle => 'Criar nova senha';

  @override
  String get resetPasswordSubtitle =>
      'Digite sua nova senha. Certifique-se de que seja segura e fácil de lembrar.';

  @override
  String get resetPasswordNewLabel => 'Nova Senha';

  @override
  String get resetPasswordConfirmLabel => 'Confirmar Senha';

  @override
  String get resetPasswordConfirmEmpty => 'Confirme sua senha';

  @override
  String get resetPasswordMismatch => 'As senhas não coincidem';

  @override
  String get resetPasswordButton => 'Redefinir Senha';

  @override
  String get emailLabel => 'E-mail';

  @override
  String get passwordLabel => 'Senha';

  @override
  String get nameLabel => 'Nome';

  @override
  String get todaySubtitle =>
      'Mantenha sua chama acesa, cada dia é uma nova oportunidade de se conectar com Deus.';

  @override
  String greetingMorning(String name) {
    return 'Bom dia, $name!';
  }

  @override
  String greetingAfternoon(String name) {
    return 'Boa tarde, $name!';
  }

  @override
  String greetingEvening(String name) {
    return 'Boa noite, $name!';
  }

  @override
  String get personalizedDevotionalTitle => 'Devocional Personalizado';

  @override
  String get personalizedDevotionalSubtitle =>
      'Como você está se sentindo hoje?';

  @override
  String get personalizedDevotionalHint =>
      'Ex: Estou ansioso com o trabalho...';

  @override
  String get personalizedDevotionalButton => 'Gerar Devocional';

  @override
  String get myFavoritesTitle => 'Meus Favoritos';

  @override
  String get myFavoritesDescription =>
      'Devocionais personalizados que você marcou como favoritos';

  @override
  String get myFavoritesViewMore => 'Ver Mais Devocionais';

  @override
  String get myFavoritesEmpty => 'Nenhum favorito ainda';

  @override
  String get settingsAccountSection => 'Conta';

  @override
  String get settingsProfile => 'Perfil';

  @override
  String get settingsProfileSubtitle => 'Editar informações pessoais';

  @override
  String get settingsEmail => 'E-mail';

  @override
  String get settingsEmailSubtitle => 'Editar e-mail';

  @override
  String get settingsPassword => 'Senha';

  @override
  String get settingsPasswordSubtitle => 'Editar senha';

  @override
  String get settingsFavoritesSection => 'Favoritos';

  @override
  String get settingsDailyDevotionals => 'Devocionais Diários Favoritos';

  @override
  String get settingsDailyDevotionalsSubtitle =>
      'Ver e gerenciar devocionais diários favoritos';

  @override
  String get settingsDailyPassages => 'Passagens Diárias Favoritas';

  @override
  String get settingsDailyPassagesSubtitle =>
      'Ver e gerenciar passagens diárias favoritas';

  @override
  String get settingsSupportSection => 'Suporte';

  @override
  String get settingsHelp => 'Ajuda';

  @override
  String get settingsHelpSubtitle => 'Central de ajuda e FAQ';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsAboutSubtitle => 'Versão e informações do app';

  @override
  String get settingsPrivacy => 'Privacidade';

  @override
  String get settingsPrivacySubtitle => 'Política de privacidade';

  @override
  String get settingsTerms => 'Termos de Uso';

  @override
  String get settingsTermsSubtitle => 'Termos e condições';

  @override
  String get settingsSessionSection => 'Sessão';

  @override
  String get settingsLogout => 'Sair';

  @override
  String get settingsLogoutSubtitle => 'Desconectar da conta';

  @override
  String settingsLogoutError(String error) {
    return 'Erro ao fazer logout: $error';
  }

  @override
  String get logoutDialogTitle => 'Sair da conta';

  @override
  String get logoutDialogMessage => 'Tem certeza que deseja sair?';

  @override
  String get logoutDialogCancel => 'Cancelar';

  @override
  String get logoutDialogConfirm => 'Sair';

  @override
  String get profileCardRanking => 'Ranking';

  @override
  String get profileCardStreak => 'Sequência';

  @override
  String get profileCardCompleted => 'Completos';

  @override
  String get profileCardViewMetrics => 'Ver minhas métricas';

  @override
  String get metricsAppBar => 'Minhas Métricas';

  @override
  String get metricsProgress => 'Progresso';

  @override
  String get metricsDevotionalsCompleted => 'Devocionais Completos';

  @override
  String get metricsDevotionalsCompletedSubtitle =>
      'Total de devocionais concluídos';

  @override
  String get metricsPassagesCompleted => 'Passagens Completas';

  @override
  String get metricsPassagesCompletedSubtitle =>
      'Total de passagens concluídas';

  @override
  String get metricsRanking => 'Ranking';

  @override
  String get metricsRankingSubtitle => 'Sua posição no ranking global';

  @override
  String get helpAppBar => 'Ajuda';

  @override
  String get helpFaqTitle => 'Perguntas Frequentes (FAQ)';

  @override
  String get helpQ1 => 'O que é o Pray?';

  @override
  String get helpA1 =>
      'O Pray é um aplicativo de devocionais cristãos que utiliza tecnologia para ajudar você a refletir sobre a Bíblia e a orar a partir do que está sentindo no momento. Ele não substitui a leitura bíblica, a oração pessoal ou o acompanhamento pastoral, mas serve como apoio espiritual diário.';

  @override
  String get helpQ2 => 'Como funcionam os devocionais personalizados?';

  @override
  String get helpA2 =>
      'Ao informar como você está se sentindo, o Pray gera um devocional baseado nas Escrituras, com uma reflexão e uma oração que ajudam a contextualizar a Palavra à sua experiência atual. O conteúdo é sempre fundamentado na Bíblia e apresentado como uma leitura possível, não como uma revelação absoluta.';

  @override
  String get helpQ3 => 'O Pray \"fala por Deus\"?';

  @override
  String get helpA3 =>
      'Não. O Pray não oferece profecias, revelações ou mensagens diretas de Deus. O aplicativo atua como um facilitador de reflexão bíblica, incentivando você a orar, pensar e buscar a Deus pessoalmente.';

  @override
  String get helpQ4 => 'Meus devocionais privados são realmente privados?';

  @override
  String get helpA4 =>
      'Sim. Os devocionais privados são visíveis apenas para você. Eles não são publicados, compartilhados ou exibidos para outros usuários.';

  @override
  String get helpQ5 =>
      'Qual a diferença entre devocionais públicos e privados?';

  @override
  String get helpA5 =>
      'Devocionais públicos: conteúdos diários gerados para toda a comunidade do app.\n\nDevocionais privados: conteúdos personalizados gerados exclusivamente a partir do sentimento que você compartilha.';

  @override
  String get helpQ6 => 'O que são streaks, métricas e conquistas?';

  @override
  String get helpA6 =>
      'São recursos opcionais que ajudam a acompanhar sua constância e engajamento com o app. Eles não medem espiritualidade, fé ou maturidade cristã — apenas registram uso e hábitos.';

  @override
  String get helpQ7 => 'Posso excluir minha conta?';

  @override
  String get helpA7 =>
      'Sim. Você pode solicitar a exclusão da sua conta a qualquer momento. Ao fazer isso, seus dados pessoais e devocionais privados serão removidos conforme descrito na política de privacidade.';

  @override
  String get helpQ8 =>
      'O Pray substitui aconselhamento pastoral ou psicológico?';

  @override
  String get helpA8 =>
      'Não. O Pray não substitui líderes espirituais, aconselhamento pastoral, terapia ou acompanhamento profissional. Em situações de sofrimento intenso, ansiedade persistente ou crise emocional, é importante buscar ajuda qualificada.';

  @override
  String get aboutAppBar => 'Sobre';

  @override
  String get aboutVersion => 'Versão 1.0.0';

  @override
  String get aboutTitle => 'Sobre o Pray';

  @override
  String get aboutDescription =>
      'O Pray nasceu do desejo de criar um espaço simples, respeitoso e profundo para quem quer se aproximar de Deus em meio às emoções reais da vida.\n\nAcreditamos que a fé cristã não ignora sentimentos como ansiedade, dúvida ou cansaço, mas os traz honestamente diante de Deus. Por isso, o Pray utiliza a tecnologia como ferramenta para apontar para a Escritura, estimular a oração e favorecer momentos de escuta e reflexão.\n\nO Pray não oferece respostas prontas, promessas fáceis ou soluções mágicas. Ele convida à pausa, à leitura bíblica e à oração pessoal, reconhecendo que cada jornada espiritual é única.\n\nNosso compromisso é unir cuidado teológico, linguagem responsável e experiência humana, respeitando tanto a fé quanto a consciência de cada usuário.';

  @override
  String get aboutDevelopedWith => 'Desenvolvido com';

  @override
  String get aboutCopyright => '© 2025 Pray. Todos os direitos reservados.';

  @override
  String get aboutLastUpdate => 'Última atualização';

  @override
  String get aboutLastUpdateValue => 'Dezembro 2025';

  @override
  String get languageAppBar => 'Idioma';

  @override
  String get languageDescription =>
      'Selecione o idioma do aplicativo. As alterações serão aplicadas imediatamente.';

  @override
  String get notificationsAppBar => 'Notificações';

  @override
  String get notificationsDescription =>
      'Personalize suas notificações para não perder nenhum conteúdo importante.';

  @override
  String get notificationsPushSection => 'Notificações Push';

  @override
  String get notificationsDailyDevotional => 'Devocional Diário';

  @override
  String get notificationsDailyDevotionalSubtitle =>
      'Receba lembretes do devocional do dia';

  @override
  String get notificationsNewContent => 'Novo Conteúdo';

  @override
  String get notificationsNewContentSubtitle =>
      'Notificações sobre novos devocionais';

  @override
  String get notificationsAchievements => 'Conquistas';

  @override
  String get notificationsAchievementsSubtitle =>
      'Receba notificações de conquistas';

  @override
  String get notificationsReminders => 'Lembretes';

  @override
  String get notificationsRemindersSubtitle => 'Lembretes personalizados';

  @override
  String get notificationsEmailSection => 'E-mail';

  @override
  String get notificationsEmailToggle => 'Notificações por E-mail';

  @override
  String get notificationsEmailToggleSubtitle =>
      'Receba atualizações por e-mail';

  @override
  String devotionalCongrats(String name) {
    return 'Parabéns, $name!';
  }

  @override
  String get devotionalCompleteMessage =>
      'Você concluiu o devocional de hoje. Que as reflexões e ensinamentos permaneçam com você ao longo do dia.';

  @override
  String get devotionalRateQuestion => 'Como você avalia este devocional?';

  @override
  String get devotionalFeedbackHint =>
      'Deixe um comentário sobre este devocional (opcional)';

  @override
  String get devotionalSubmitting => 'Enviando...';

  @override
  String get devotionalSubmitButton => 'Avaliar';

  @override
  String get devotionalBackHome => 'Voltar ao início';

  @override
  String get errorLikePassage => 'Erro ao curtir passagem';

  @override
  String get errorLikeDevotional => 'Erro ao curtir devocional';

  @override
  String get errorServerError =>
      'Ocorreu um erro no servidor. Tente novamente mais tarde.';

  @override
  String get errorNoConnection =>
      'Sem conexão com a internet. Verifique sua conexão e tente novamente.';

  @override
  String get errorNotAuthenticated =>
      'Não foi possível autenticar. Por favor, faça login novamente.';

  @override
  String get errorInvalidRequest =>
      'Requisição inválida. Verifique os dados e tente novamente.';

  @override
  String get errorParsingError =>
      'Erro ao processar os dados. Tente novamente.';

  @override
  String get errorGeneric => 'Ocorreu um erro. Tente novamente mais tarde.';

  @override
  String get welcomeHeadline => 'Bem-vindo(a)\nao Pray!';

  @override
  String get welcomeDescription =>
      'Descubra devocionais criados especialmente para você. Reflita, ore e fortaleça sua caminhada com Deus todos os dias.';

  @override
  String get welcomeButton => 'Começar';

  @override
  String get privacyAppBar => 'Privacidade';

  @override
  String get privacyBanner => 'A sua privacidade é levada a sério.';

  @override
  String get privacyDataTitle => 'Quais dados coletamos?';

  @override
  String get privacyDataContent =>
      'O Pray coleta apenas os dados necessários para o funcionamento do aplicativo, como:\n\n• Nome e e-mail\n• Informações de autenticação\n• Sentimentos informados para geração de devocionais\n• Interações dentro do app (curtidas, conclusões, feedbacks)';

  @override
  String get privacyUsageTitle => 'Como seus dados são usados?';

  @override
  String get privacyUsageContent =>
      'Seus dados são utilizados exclusivamente para:\n\n• Autenticar sua conta\n• Personalizar sua experiência no app\n• Gerar devocionais privados\n• Melhorar a qualidade do conteúdo e do serviço\n\nNunca utilizamos seus dados para fins comerciais externos ou venda a terceiros.';

  @override
  String get privacySharedTitle => 'Devocionais privados são compartilhados?';

  @override
  String get privacySharedContent =>
      'Não. Devocionais privados e sentimentos informados não são compartilhados com outros usuários. Eles são tratados como conteúdo pessoal.';

  @override
  String get privacyAiTitle => 'Uso de inteligência artificial';

  @override
  String get privacyAiContent =>
      'O Pray utiliza inteligência artificial para gerar conteúdos devocionais a partir de parâmetros definidos. Esses conteúdos não representam revelações divinas nem substituem a fé, a Bíblia ou a oração pessoal.';

  @override
  String get privacyDeleteTitle => 'Posso apagar meus dados?';

  @override
  String get privacyDeleteContent =>
      'Sim. Você pode solicitar a exclusão da sua conta a qualquer momento. Após a exclusão, seus dados pessoais e conteúdos privados serão removidos de forma permanente, respeitando obrigações legais aplicáveis.';

  @override
  String get privacySecurityTitle => 'Segurança';

  @override
  String get privacySecurityContent =>
      'Adotamos medidas técnicas e organizacionais para proteger seus dados contra acessos não autorizados, perdas ou usos indevidos.';

  @override
  String get privacyLastUpdate => 'Última atualização: Dezembro 2025';

  @override
  String get termsAppBar => 'Termos de Uso';

  @override
  String get termsBanner => 'Termos e Condições de Uso';

  @override
  String get termsIntro =>
      'Ao utilizar o aplicativo Pray, você concorda com os termos e condições descritos abaixo. Caso não concorde com algum ponto, recomendamos que não utilize o aplicativo.';

  @override
  String get termsSection1Title => '1. Sobre o Pray';

  @override
  String get termsSection1Content =>
      'O Pray é um aplicativo que utiliza tecnologia, incluindo inteligência artificial, para auxiliar usuários na reflexão bíblica e na prática da oração cristã.\n\nO Pray não oferece aconselhamento pastoral, psicológico, médico ou espiritual individualizado, nem substitui a leitura da Bíblia, a oração pessoal, o acompanhamento pastoral ou profissional.\n\nO conteúdo disponibilizado tem caráter reflexivo e devocional, não sendo apresentado como revelação divina, profecia ou orientação absoluta.';

  @override
  String get termsSection2Title => '2. Elegibilidade';

  @override
  String get termsSection2Content =>
      'Ao utilizar o Pray, você declara que:\n\n• Possui capacidade legal para aceitar estes Termos\n• As informações fornecidas no cadastro são verdadeiras e atualizadas\n• Utilizará o aplicativo de forma ética, respeitosa e em conformidade com estes Termos';

  @override
  String get termsSection3Title => '3. Conta do Usuário';

  @override
  String get termsSection3Content =>
      'Para acessar determinadas funcionalidades, é necessário criar uma conta.\n\nVocê é responsável por:\n\n• Manter a confidencialidade de suas credenciais\n• Todas as atividades realizadas em sua conta\n• Informar imediatamente qualquer uso não autorizado\n\nO Pray reserva-se o direito de suspender ou encerrar contas em caso de uso indevido ou violação destes Termos.';

  @override
  String get termsSection4Title => '4. Uso de Inteligência Artificial';

  @override
  String get termsSection4Content =>
      'O Pray utiliza inteligência artificial para gerar conteúdos devocionais com base em parâmetros definidos, incluindo sentimentos informados pelo usuário.\n\nVocê reconhece que:\n\n• O conteúdo gerado é uma leitura possível das Escrituras, não uma interpretação definitiva\n• A inteligência artificial não fala em nome de Deus\n• Nenhum conteúdo deve ser entendido como promessa específica de ação divina\n\nO uso da IA tem como objetivo auxiliar a reflexão e a oração, não substituir a experiência espiritual pessoal do usuário.';

  @override
  String get termsSection5Title =>
      '5. Devocionais Personalizados e Limites de Uso';

  @override
  String get termsSection5Content =>
      'O Pray pode estabelecer limites na geração de devocionais personalizados, com o objetivo de:\n\n• Preservar um ritmo saudável de uso\n• Manter a qualidade da experiência\n• Garantir a sustentabilidade técnica do serviço\n\nEsses limites podem ser ajustados a qualquer momento, mediante comunicação no aplicativo.';

  @override
  String get termsSection6Title => '6. Conteúdos Privados e Públicos';

  @override
  String get termsSection6Content =>
      'Devocionais privados são gerados exclusivamente para o usuário e não são compartilhados publicamente.\n\nDevocionais públicos são disponibilizados para toda a comunidade do aplicativo.\n\nO usuário é responsável pelo conteúdo emocional ou textual que informar ao utilizar o app.';

  @override
  String get termsSection7Title => '7. Uso Adequado do Aplicativo';

  @override
  String get termsSection7Content =>
      'É vedado ao usuário:\n\n• Utilizar o Pray para fins ilegais ou abusivos\n• Tentar explorar falhas técnicas ou de segurança\n• Utilizar o conteúdo do app como substituto para aconselhamento profissional em situações graves\n\nEm casos de sofrimento intenso, ansiedade persistente ou crises emocionais, recomenda-se buscar ajuda especializada.';

  @override
  String get termsSection8Title => '8. Propriedade Intelectual';

  @override
  String get termsSection8Content =>
      'Todo o conteúdo disponibilizado no Pray, incluindo textos, design, estrutura e funcionalidades, é protegido por direitos autorais.\n\nÉ proibida a reprodução, distribuição ou modificação do conteúdo sem autorização prévia, salvo nos limites permitidos por lei.';

  @override
  String get termsSection9Title => '9. Exclusão de Conta';

  @override
  String get termsSection9Content =>
      'O usuário pode solicitar a exclusão de sua conta a qualquer momento.\n\nApós a exclusão:\n\n• Dados pessoais e conteúdos privados serão removidos, respeitando obrigações legais aplicáveis\n• O acesso ao aplicativo será encerrado de forma permanente';

  @override
  String get termsSection10Title => '10. Limitação de Responsabilidade';

  @override
  String get termsSection10Content =>
      'O Pray não se responsabiliza por:\n\n• Decisões pessoais tomadas com base no conteúdo do aplicativo\n• Interpretações individuais do conteúdo gerado\n• Eventuais indisponibilidades técnicas temporárias\n\nO uso do aplicativo é de responsabilidade exclusiva do usuário.';

  @override
  String get termsSection11Title => '11. Alterações nos Termos';

  @override
  String get termsSection11Content =>
      'O Pray pode atualizar estes Termos de Uso periodicamente.\n\nO uso contínuo do aplicativo após alterações implica concordância com os novos termos.';

  @override
  String get termsSection12Title => '12. Contato';

  @override
  String get termsSection12Content =>
      'Em caso de dúvidas, sugestões ou solicitações relacionadas a estes Termos, o usuário pode entrar em contato pelos canais oficiais disponibilizados no aplicativo.';

  @override
  String get termsLastUpdate => 'Última atualização: Dezembro 2025';

  @override
  String get appearanceAppBar => 'Aparência';

  @override
  String get appearanceTheme => 'Tema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Escuro';

  @override
  String get appearanceSystem => 'Sistema';

  @override
  String get appearanceFontSize => 'Tamanho da Fonte';

  @override
  String get appearanceSmall => 'Pequeno';

  @override
  String get appearanceLarge => 'Grande';

  @override
  String get profileAppBar => 'Perfil';

  @override
  String get profilePersonalInfo => 'Informações Pessoais';

  @override
  String get profileNameHint => 'Nome completo';

  @override
  String get profileNameEmpty => 'Por favor, insira seu nome';

  @override
  String get profileSaveButton => 'Salvar Alterações';

  @override
  String get profileUpdateSuccess => 'Perfil atualizado com sucesso!';

  @override
  String get emailUpdateAppBar => 'Atualizar Email';

  @override
  String get emailUpdateTitle => 'Atualizar Email';

  @override
  String get emailUpdateSubtitle =>
      'Insira seu novo endereço de email e sua senha atual para verificação.';

  @override
  String get emailUpdateNewHint => 'Novo email';

  @override
  String get emailUpdateEmpty => 'Por favor, insira seu email';

  @override
  String get emailUpdateInvalid => 'Por favor, insira um email válido';

  @override
  String get emailUpdateCurrentPassword => 'Senha atual';

  @override
  String get emailUpdatePasswordEmpty => 'Por favor, insira sua senha';

  @override
  String get emailUpdateButton => 'Atualizar Email';

  @override
  String get emailUpdateSuccess =>
      'Email atualizado com sucesso. Por favor, verifique seu novo email.';

  @override
  String get passwordUpdateAppBar => 'Atualizar Senha';

  @override
  String get passwordUpdateTitle => 'Atualizar Senha';

  @override
  String get passwordUpdateSubtitle =>
      'Insira sua senha atual e a nova senha que deseja utilizar.';

  @override
  String get passwordUpdateCurrentLabel => 'Senha atual';

  @override
  String get passwordUpdateCurrentEmpty => 'Por favor, insira sua senha atual';

  @override
  String get passwordUpdateNewLabel => 'Nova senha';

  @override
  String get passwordUpdateNewEmpty => 'Por favor, insira sua nova senha';

  @override
  String get passwordUpdateMinLength =>
      'A senha deve ter pelo menos 6 caracteres';

  @override
  String get passwordUpdateConfirmLabel => 'Confirmar nova senha';

  @override
  String get passwordUpdateConfirmEmpty => 'Por favor, confirme sua nova senha';

  @override
  String get passwordUpdateMismatch => 'As senhas não coincidem';

  @override
  String get passwordUpdateButton => 'Atualizar Senha';

  @override
  String get passwordUpdateSuccess => 'Senha atualizada com sucesso.';

  @override
  String get devotionalAppBar => 'Devocional';

  @override
  String get devotionalFeedbackSuccess =>
      'Avaliação enviada! Obrigado pelo feedback.';

  @override
  String get passageAppBar => 'Passagem Bíblica';

  @override
  String get sharePassageFeature => 'Compartilhar passagem';

  @override
  String get listenPassageFeature => 'Ouvir passagem';

  @override
  String get favoritePassagesAppBar => 'Passagens Favoritas';

  @override
  String get favoritePassagesEmpty => 'Nenhuma passagem favorita';

  @override
  String get favoritePassagesEmptyDescription =>
      'Você ainda não favoritou nenhuma passagem bíblica. Explore e favorite suas passagens preferidas!';

  @override
  String get retryButton => 'Tentar Novamente';

  @override
  String get searchNoResults => 'Nenhum resultado encontrado';

  @override
  String get searchTryAnother => 'Tente buscar por outro termo';

  @override
  String get searchPassagesHint => 'Buscar passagens...';

  @override
  String get searchFavoritesHint => 'Buscar favoritos...';

  @override
  String get searchDevotionalsHint => 'Buscar devocionais...';

  @override
  String get filtersInDevelopment => 'Filtros em desenvolvimento';

  @override
  String get publicDevotionalsAppBar => 'Devocionais Favoritos';

  @override
  String get publicDevotionalsEmpty => 'Nenhum favorito ainda';

  @override
  String get publicDevotionalsEmptyDescription =>
      'Toque no ícone de coração nos devocionais para salvá-los aqui e acessá-los facilmente depois.';

  @override
  String get privateDevotionalsAppBar => 'Meus Devocionais';

  @override
  String get privateDevotionalsEmpty => 'Nenhum devocional encontrado';

  @override
  String get privateDevotionalsEmptyDescription =>
      'Gere seu primeiro devocional personalizado';

  @override
  String get streakCurrentTitle => 'Sequência Atual';

  @override
  String get streakDays => 'Dias';

  @override
  String get streakMonths => 'Meses';

  @override
  String get streakYears => 'Anos';

  @override
  String get streakLongest => 'Maior sequência: ';

  @override
  String streakLongestValue(int days) {
    return '$days dias';
  }

  @override
  String readingTimeMin(int minutes) {
    return '$minutes min';
  }

  @override
  String get swipeToContinue => 'Deslize para continuar';

  @override
  String get featureInDevTitle => 'Em Desenvolvimento';

  @override
  String featureInDevMessage(String featureName) {
    return 'A funcionalidade \"$featureName\" está sendo desenvolvida e estará disponível em breve.';
  }

  @override
  String get featureInDevButton => 'Entendi';

  @override
  String get metricsHeaderSubtitle => 'Seu progresso espiritual';

  @override
  String get devotionalReflection => 'Reflexão';

  @override
  String get devotionalApplication => 'Aplicação';

  @override
  String get devotionalPrayer => 'Oração';

  @override
  String get devotionalShare => 'Compartilhar';

  @override
  String get passageContext => 'Contexto';

  @override
  String get passageListen => 'Ouvir';

  @override
  String get passageShare => 'Compartilhar';

  @override
  String get passageOfTheDay => 'Passagem do Dia';

  @override
  String get loading => 'Carregando...';

  @override
  String get loadingVerseText => 'Carregando texto do versículo...';

  @override
  String get dailyQuote => 'Citação diária';

  @override
  String get loadingDescription => 'Carregando descrição...';

  @override
  String get viewMyMetrics => 'Ver minhas métricas';

  @override
  String get listenFeature => 'Ouvir';

  @override
  String get readAction => 'Ler';

  @override
  String get dailyDevotional => 'Devocional diário';

  @override
  String get viewHistory => 'Ver Histórico';

  @override
  String get myDevotionalHeaderDescription =>
      'Crie devocionais personalizados e acompanhe sua jornada espiritual.';

  @override
  String get emptyDevotionalTitle => 'Nenhum devocional gerado ainda';

  @override
  String get emptyDevotionalDescription =>
      'Gere seu primeiro devocional personalizado e ele aparecerá aqui para você acessar sempre que quiser.';

  @override
  String get historyTitle => 'Histórico';

  @override
  String get historyDescription =>
      'Acesse todos os devocionais personalizados que você já criou. Seu último devocional aparecerá aqui.';

  @override
  String get generatingPhase1 => 'Analisando seus sentimentos...';

  @override
  String get generatingPhase2 =>
      'Tecendo uma reflexão feita especialmente para você...';

  @override
  String get generatingPhase3 =>
      'Aprimorando cada detalhe em um devocional único...';

  @override
  String get generatingTimeEstimate => 'Isso pode levar até 1 minuto';

  @override
  String get dailyLimitTitle => 'Limite Diário Atingido';

  @override
  String get dailyLimitMessage =>
      'Você já criou um devocional personalizado hoje. Volte amanhã para criar um novo!';

  @override
  String get dailyLimitButton => 'Entendi';

  @override
  String get logoSemanticLabel => 'Logo da Pray';

  @override
  String get devotionalGeneratedTitle => 'Devocional Gerado!';

  @override
  String get devotionalGeneratedMessage =>
      'Seu devocional personalizado está pronto. Você será redirecionado para a leitura.';

  @override
  String get comingSoonTitle => 'Em breve';

  @override
  String get comingSoonDescription =>
      'Estamos preparando um espaço especial para você compartilhar suas experiências de fé e se conectar com outros membros da comunidade.';

  @override
  String get successTitle => 'Sucesso!';

  @override
  String get continueButton => 'Continuar';

  @override
  String get devotionalLabel => 'Devocional';

  @override
  String get noDevotionalsYet => 'Nenhum devocional ainda';

  @override
  String get seeMoreDevotionals => 'Ver Mais Devocionais';

  @override
  String get tabToday => 'Hoje';

  @override
  String get tabMyDevotional => 'Meu Devocional';

  @override
  String get tabCommunity => 'Comunidade';

  @override
  String get tabSettings => 'Configurações';

  @override
  String get dateFormatterToday => 'HOJE';
}
