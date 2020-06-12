// import 'dart:async';
// import 'package:pip_clients_email/pip_clients_email.dart';
// import 'package:pip_clients_emailsettings/pip_clients_emailsettings.dart';
// import 'package:pip_clients_smssettings/pip_clients_smssettings.dart';
// import 'package:pip_services_emailsettings/pip_services_emailsettings.dart';
// import 'package:pip_services_smssettings/pip_services_smssettings.dart';
// import 'package:test/test.dart';
// import 'package:pip_services3_components/pip_services3_components.dart';
// import 'package:pip_services3_commons/pip_services3_commons.dart';
// import 'package:pip_clients_msgdistribution/pip_clients_msgdistribution.dart';
// //import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
// import './MessageDistributionClientFixtureV1.dart';

// void main() {
//   group('MessageDistributionDirectClientV1', () {
//     MessageDistributionDirectClientV1 client;
//     MessageDistributionClientFixtureV1 fixture;
//     MessageDistributionController controller;

//     setUp(() async {
//       var logger = ConsoleLogger();
//       controller = MessageDistributionController();

//       var emailSettingsClient = EmailSettingsMemoryClientV1();
//       await emailSettingsClient.setSettings(
//           null,
//           EmailSettingsV1(
//               id: '1', name: 'User 1', email: 'somebody@somewhere.com'));

//       var smsSettingsClient = SmsSettingsMemoryClientV1();
//       await smsSettingsClient.setSettings(
//           null, SmsSettingsV1(id: '1', name: 'User 1', phone: '+12345678901'));

//       var emailDeliveryClient = EmailNullClientV1();
//       //var smsDeliveryClient = SmsNullClientV1();

//       var references = References.fromTuples([
//             Descriptor('pip-services', 'logger', 'console', 'default', '1.0'), logger,
//             Descriptor('pip-services-emailsettings', 'client', 'memory', 'default', '1.0'), emailSettingsClient,
//             Descriptor('pip-services-smssettings', 'client', 'memory', 'default', '1.0'), smsSettingsClient,
//             Descriptor('pip-services-email', 'client', 'null', 'default', '1.0'), emailDeliveryClient,
//             //Descriptor('pip-services-sms', 'client', 'null', 'default', '1.0'), smsDeliveryClient,
//             Descriptor('pip-services-msgdistribution', 'controller', 'default', 'default', '1.0'), controller
//       ]);
//       controller.setReferences(references);

//       client = MessageDistributionDirectClientV1();
//       client.setReferences(references);

//       fixture = MessageDistributionClientFixtureV1(client);
//       await client.open(null);
//     });

//     tearDown(() async {
//       await client.close(null);
//       await Future.delayed(Duration(milliseconds: 2000));
//     });

//     test('Send Message', () async {
//       await fixture.testSendMessage();
//     });

//     test('Send Message to Recipient', () async {
//       await fixture.testSendMessageToRecipient();
//     });
//   });
// }
