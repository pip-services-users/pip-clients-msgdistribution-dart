class MessageV1 {
  String template;
  String from;
  String cc;
  String bcc;
  String reply_to;
  var subject;
  var text;
  var html;

  MessageV1(
      {this.template,
      this.from,
      this.cc,
      this.bcc,
      this.reply_to,
      this.subject,
      this.text,
      this.html});

  factory MessageV1.fromJson(Map<String, dynamic> json) {
    var c = MessageV1();

    c.fromJson(json);
    return c;
  }

  void fromJson(Map<String, dynamic> json) {
    template = json['template'];
    from = json['from'];
    cc = json['cc'];
    bcc = json['bcc'];
    reply_to = json['reply_to'];
    subject = json['subject'];
    text = json['text'];
    html = json['html'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'template': template,
      'from': from,
      'cc': cc,
      'bcc': bcc,
      'reply_to': reply_to,
      'subject': subject,
      'text': text,
      'html': html
    };
  }
}
