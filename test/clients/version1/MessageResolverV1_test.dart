import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_msgdistribution/pip_clients_msgdistribution.dart';

void main() {
  group('MessageResolverV1', () {
    MessageResolverV1 resolver;

    setUp(() async {
      resolver = MessageResolverV1();
    });

    test('Resolve hardcoded template', () async {
      resolver.configure(ConfigParams.fromTuples([
        'message_templates.template1.subject',
        'Subject1',
        'message_templates.template1.text',
        'Text1',
        'message_templates.template1.html',
        'Html1'
      ]));

      var template = await resolver.resolve('template1');
      expect(template, isNotNull);
      expect(template.subject, 'Subject1');
      expect(template.text, 'Text1');
      expect(template.html, 'Html1');
    });

    test('Resolve missing template', () async {
      resolver.configure(ConfigParams.fromTuples([
        'message_templates.template1.subject',
        'Subject1',
        'message_templates.template1.text',
        'Text1',
        'message_templates.template1.html',
        'Html1'
      ]));

      var template = await resolver.resolve('template2');
      expect(template, isNull);
    });

    test('Resolve template by id', () async {
      resolver.configure(
          ConfigParams.fromTuples(['message_templates.template1', '123']));

      var message = await resolver.resolve('template1');
      expect(message, isNotNull);
      expect(message.template, '123');
    });
  });
}
