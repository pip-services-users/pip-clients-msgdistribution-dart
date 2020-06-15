import 'package:pip_clients_msgdistribution/pip_clients_msgdistribution.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';

Future<void> main(List<String> argument) async {
  try {
    var correlationId = '123';
    var config = ConfigParams.fromTuples([
      'connection.type',
      'http',
      'connection.host',
      'localhost',
      'connection.port',
      8080
    ]);
    var client = MessageDistributionHttpClientV1();
    client.configure(config);
    var message = MessageV1(
        subject: 'Test subject', text: 'Test text', html: 'Test html');

    var recipient = RecipientV1(
        name: 'Test user',
        email: 'somebody@somewhere.com',
        phone: '+12345349458');
    await client.open(correlationId);
    // Send message
    await client.sendMessage(
        null, recipient, message, null, DeliveryMethodV1.All);

    await client.close(correlationId);
  } catch (ex) {
    print(ex);
  }
}
