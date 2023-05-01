import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nconenction.",
          'retry': "Retry",
          'general_exception':
              "We're unable to process your request.\n Please try again",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
          'password_hint': 'Password',
        },
        'pt_BR': {
          'email_hint': 'Entre com o email',
          'internet_exception':
              "Não foi possível mostrar os resultados.\nPor favor, verifique sua\nconexão de dados.",
          'retry': "Tente novamente",
          'general_exception':
              "Não foi possível processar sua solicitação.\n Tente novamente",
          'welcome_back': 'Bem vindo\nde volta',
          'login': 'Entrar',
          'password_hint': 'Senha',
        }
      };
}
