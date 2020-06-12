import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/MessageDistributionNullClientV1.dart';
import '../version1/MessageDistributionDirectClientV1.dart';
import '../version1/MessageDistributionHttpClientV1.dart';

class MessageDistributionClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-msgdistribution', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor = Descriptor(
      'pip-services-msgdistribution', 'client', 'direct', '*', '1.0');
  static final HttpClientDescriptor =
      Descriptor('pip-services-msgdistribution', 'client', 'http', '*', '1.0');

  MessageDistributionClientFactory() : super() {
    registerAsType(MessageDistributionClientFactory.NullClientDescriptor,
        MessageDistributionNullClientV1);
    registerAsType(MessageDistributionClientFactory.DirectClientDescriptor,
        MessageDistributionDirectClientV1);
    registerAsType(MessageDistributionClientFactory.HttpClientDescriptor,
        MessageDistributionHttpClientV1);
  }
}
