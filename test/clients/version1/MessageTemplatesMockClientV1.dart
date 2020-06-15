import 'dart:async';

import 'package:pip_clients_msgtemplates/pip_clients_msgtemplates.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_msgtemplates/pip_services_msgtemplates.dart';

class MessageTemplatesMockClientV1 extends MessageTemplatesNullClientV1 {
  @override
  Future<MessageTemplateV1> getTemplateByIdOrName(
      String correlationId, String idOrName) async {
    if (idOrName != 'test') {
      return null;
    }

    return MessageTemplateV1(
        id: idOrName,
        name: idOrName,
        from: null,
        status: 'new',
        subject: MultiString({'en': 'Test subject'}),
        text: MultiString({'en': 'Test text'}),
        html: MultiString({'en': 'Test html'}));
  }
}
