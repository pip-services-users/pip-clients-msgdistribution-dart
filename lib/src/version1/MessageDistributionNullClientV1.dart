import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
//import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
import './MessageV1.dart';
import './RecipientV1.dart';
import './IMessageDistributionClientV1.dart';

class MessageDistributionNullClientV1 implements IMessageDistributionClientV1 {
  @override
  Future sendMessage(String correlationId, RecipientV1 recipient,
      MessageV1 message, ConfigParams parameters, String method) {
    return null;
  }

  @override
  Future sendMessages(String correlationId, List<RecipientV1> recipients,
      MessageV1 message, ConfigParams parameters, String method) {
    return null;
  }

  @override
  Future sendMessageToRecipient(
      String correlationId,
      String recipientId,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method) {
    return null;
  }

  @override
  Future sendMessageToRecipients(
      String correlationId,
      List<String> recipientIds,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method) {
    return null;
  }
}
