import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
//import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
import './MessageV1.dart';
import './RecipientV1.dart';
import './IMessageDistributionClientV1.dart';

class MessageDistributionHttpClientV1 extends CommandableHttpClient
    implements IMessageDistributionClientV1 {
  ConfigParams _defaultParameters = ConfigParams();

  MessageDistributionHttpClientV1([config]) : super('v1/msg_distribution') {
    var thisConfig = ConfigParams.fromValue(config);
    _defaultParameters = thisConfig.getSection('parameters');
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
    parameters = _defaultParameters.override(parameters);
    return callCommand('send_message', correlationId, {
      'recipient': recipient,
      'message': message,
      'parameters': parameters,
      'method': method
    });
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
    parameters = _defaultParameters.override(parameters);
    return callCommand('send_messages', correlationId, {
      'recipients': recipients,
      'message': message,
      'parameters': parameters,
      'method': method
    });
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
    parameters = _defaultParameters.override(parameters);
    return callCommand('send_message_to_recipient', correlationId, {
      'recipient_id': recipientId,
      'subscription': subscription,
      'message': message,
      'parameters': parameters,
      'method': method
    });
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
    parameters = _defaultParameters.override(parameters);
    return callCommand('send_message_to_recipients', correlationId, {
      'recipient_ids': recipientIds,
      'subscription': subscription,
      'message': message,
      'parameters': parameters,
      'method': method
    });
  }
}
