class ChatError implements Exception {
  final String message;
  final String chatTranslate;
  ChatError({
    this.message =
        'Ocorreu um erro ao conectar com o chat, por favor tente mais tarde',
    this.chatTranslate =
        'There was an error connecting to the chat, please try again later',
  });
}
