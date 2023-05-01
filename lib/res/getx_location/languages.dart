import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter email',
          'email_validator': 'Enter email',
          'password_hint': 'Password',
          'password_validator': 'Enter Password',
          'password_name': 'Password',
          'internet_exception':
              "We're unable to show results.\nPlease check your data\nconenction.",
          'retry': "Retry",
          'general_exception':
              "We're unable to process your request.\n Please try again",
          'welcome_back': 'Welcome\nBack',
          'login': 'Login',
        },
        'pt_BR': {
          'email_hint': 'Entre com o email',
          'email_validator': 'Insira o email',
          'password_hint': 'Senha',
          'password_validator': 'Insira a senha',
          'password_name': 'Senha',
          'internet_exception':
              "Não foi possível mostrar os resultados.\nPor favor, verifique sua\nconexão de dados.",
          'retry': "Tente novamente",
          'general_exception':
              "Não foi possível processar sua solicitação.\n Tente novamente",
          'welcome_back': 'Bem vindo\nde volta',
          'login': 'Entrar',
        }
      };
}
