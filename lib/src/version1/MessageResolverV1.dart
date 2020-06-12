import 'package:pip_services3_commons/pip_services3_commons.dart';
import './MessageV1.dart';

class MessageResolverV1 implements IReconfigurable {
  MessageResolverV1([ConfigParams config]) {
    if (config != null) {
      configure(config);
    }
  }

  ConfigParams _config = ConfigParams();
  final _messages = <String, MessageV1>{};

  @override
  void configure(ConfigParams config) {
    _config = config.getSection('message_templates');
  }

  void put(String name, dynamic template) {
    _config[name] = template;
  }

  MessageV1 resolve(String name) {
    if (name == null) {
      return null;
    }

    // Retrieve template first
    var message = _messages[name];
    if (message != null) return message;

    var template = _config.get(name);
    if (template is String && template != '') {
      // Construct a message
      message = MessageV1(template: template);

      // Cache the message
      _messages[name] = message;

      return message;
    } else {
      // Get configuration
      var config = _config.getSection(name);

      // Construct a message
      message = MessageV1(
          template: config.getAsString('template'),
          subject: config.getAsObject('subject'),
          text: config.getAsObject('text'),
          html: config.getAsObject('html'));

      // Check and cache the message
      if (message.template != null ||
          message.subject != null ||
          message.text != null ||
          message.html != null) {
        _messages[name] = message;
      } else {
        message = null;
      }

      return message;
    }
  }

  static MessageResolverV1 fromTuples(List tuples) {
    var result = MessageResolverV1();

    if (tuples == null || tuples.isEmpty) {
      return result;
    }

    for (var index = 0; index < tuples.length; index += 2) {
      if (index + 1 >= tuples.length) break;

      var name = StringConverter.toString2(tuples[index]);
      var template = tuples[index + 1];

      result.put(name, template);
    }

    return result;
  }
}
