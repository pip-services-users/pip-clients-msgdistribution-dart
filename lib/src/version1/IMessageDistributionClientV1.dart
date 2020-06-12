import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
//import 'package:pip_services_msgdistribution/pip_services_msgdistribution.dart';
import './MessageV1.dart';
import './RecipientV1.dart';

abstract class IMessageDistributionClientV1 {
  /// Send the message to recipient
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipient]            a recipient of the message.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  Future sendMessage(String correlationId, RecipientV1 recipient,
      MessageV1 message, ConfigParams parameters, String method);

  /// Send the messages to recipients
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipients]            a recipients of the message.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  Future sendMessages(String correlationId, List<RecipientV1> recipients,
      MessageV1 message, ConfigParams parameters, String method);

  /// Send the messages to recipient by its id
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipientId]            a recipient id.
  /// - [subscription]            a subscription.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  Future sendMessageToRecipient(
      String correlationId,
      String recipientId,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method);

  /// Send the messages to recipients by its ids
  ///
  /// - [correlationId]    (optional) transaction id to trace execution through call chain.
  /// - [recipientIds]            a recipient id.
  /// - [subscription]            a subscription.
  /// - [message]              a message to be send.
  /// - [parameters]              an additional parameters to be send.
  /// - [method]              a delivery method(email and/or sms).
  Future sendMessageToRecipients(
      String correlationId,
      List<String> recipientIds,
      String subscription,
      MessageV1 message,
      ConfigParams parameters,
      String method);
}
