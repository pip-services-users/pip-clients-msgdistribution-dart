import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
import './IMessageDistributionClientV1.dart';

class MessageDistributionDirectClientV1 extends DirectClient<dynamic>
    implements IMessageDistributionClientV1 {
  MessageDistributionDirectClientV1([config]) : super() {
    dependencyResolver.put(
        'controller',
        Descriptor(
            'pip-services-msgdistribution', 'controller', '*', '*', '1.0'));
    var thisConfig = ConfigParams.fromValue(config);
    if (config != null) configure(thisConfig);
  }

  /// Send the message to recipient
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipient]            a recipient of the message.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  @override
  Future sendMessage(String correlationId, RecipientV1 recipient,
      MessageV1 message, ConfigParams parameters, String method) async {
    var timing = instrument(correlationId, 'msg_distribution.send_message');
    var result = await controller.sendMessage(
        correlationId, recipient, message, parameters, method);
    timing.endTiming();
    return result;
  }

  /// Send the messages to recipients
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipients]            a recipients of the message.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  @override
  Future sendMessages(String correlationId, List<RecipientV1> recipients,
      MessageV1 message, ConfigParams parameters, String method) async {
    var timing = instrument(correlationId, 'msg_distribution.send_messages');
    var result = await controller.sendMessages(
        correlationId, recipients, message, parameters, method);
    timing.endTiming();
    return result;
  }

  /// Send the messages to recipient by its id
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]            a recipient id.
  /// - [subscription]            a subscription.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  @override
  Future sendMessageToRecipient(
      String correlationId,
      String recipientId,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method) async {
    var timing =
        instrument(correlationId, 'msg_distribution.send_message_to_recipient');
    var result = await controller.sendMessageToRecipient(
        correlationId, recipientId, subscription, message, parameters, method);
    timing.endTiming();
    return result;
  }

  /// Send the messages to recipients by its ids
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipientIds]            a recipient id.
  /// - [subscription]            a subscription.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  @override
  Future sendMessageToRecipients(
      String correlationId,
      List<String> recipientIds,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method) async {
    var timing = instrument(
        correlationId, 'msg_distribution.send_message_to_recipients');
    var result = await controller.sendMessageToRecipients(
        correlationId, recipientIds, subscription, message, parameters, method);
    timing.endTiming();
    return result;
  }
}
