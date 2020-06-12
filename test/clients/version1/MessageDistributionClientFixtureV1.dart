import 'package:test/test.dart';
//import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
import 'package:pip_clients_msgdistribution/pip_clients_msgdistribution.dart';

class MessageDistributionClientFixtureV1 {
  IMessageDistributionClientV1 _client;

  MessageDistributionClientFixtureV1(IMessageDistributionClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testSendMessage() async {
    var message = MessageV1(
        subject: 'Test subject', text: 'Test text', html: 'Test html');

    var recipient = RecipientV1(
        name: 'Test user',
        email: 'somebody@somewhere.com',
        phone: '+12345349458');

    await _client.sendMessage(
        null, recipient, message, null, DeliveryMethodV1.All);
  }

  void testSendMessageToRecipient() async {
    var message = MessageV1(
        subject: 'Test subject', text: 'Test text', html: 'Test html');

    await _client.sendMessageToRecipient(
        null, '1', null, message, null, DeliveryMethodV1.All);
  }
}
