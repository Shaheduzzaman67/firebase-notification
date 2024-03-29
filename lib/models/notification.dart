class PushNotification{

  static String table = 'notifications';

  PushNotification({
    this.title,
    this.body,
    this.dataTitle,
    this.dataBody,
  });

  String? title;
  String? body;
  String? dataTitle;
  String? dataBody;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
    };
  }

  static PushNotification fromMap(Map<String, dynamic> map) {

    return PushNotification(
        title: map['title'],
        body: map['body']
    );
  }

  @override
  String toString() {
    return 'PushNotification{title: $title, body: $body}';
  }

}