# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br> Message Distribution Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-msgdistribution](https://github.com/pip-services-users/pip-services-msgdistribution-dart) microservice.
It provides an easy to use abstraction over communication protocols:

* HTTP client
* Direct client for monolythic deployments
* Null client to be used in testing

In addition to the microservice functionality the client SDK supports message templates 
that can be configured by client user. 

## Install

Add **pip-services3-commons-dart** and **pip_clients_msgdistribution** packages
```dart
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_msgdistribution/pip_clients_msgdistribution.dart';
```

## Use

Define client configuration parameters that match configuration of the microservice external API
```dart
// Client configuration
var config = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = MessageDistributionHttpClientV1(config);

// Connect to the microservice
await client.open(null);
    
    // Work with the microservice
    ...
});
```

Now the client is ready to perform operations
```dart
// Send message to address
    var message = MessageV1(
        subject: 'Test subject', text: 'Test text', html: 'Test html');

    var recipient = RecipientV1(
        name: 'Test user',
        email: 'somebody@somewhere.com',
        phone: '+12345349458');

await client.sendMessage(
    null, recipient, message, null, DeliveryMethodV1.All
);
```

```dart
// Send message to users
var recipient1 = RecipientV1(id: '1', email: 'user1@somewhere.com', phone: '+1234567890');
var recipient2 = RecipientV1(id: '2', email: 'user2@somewhere.com', phone: '+0987654321');
var message = MessageV1(subject: 'Test', 
                             text: 'This is a test message. Please, ignore it');
await client.sendMessages(
    null,
    [
        recipient1,
        recipient2
    ],
    message,
    null,
    DeliveryMethod.All
);
```

To use templates for sent messages you need to put template files
under configured template folder. Inside template you shall use &lt;%= property %&gt; syntax
to insert properties from provided **content** defined in client configuration and request parameters.

Example of **message.txt** template
```text
Hello <%= user_name %>!

This is a test message from <%= client_name %> sent on <%= today %>.
Please, ignore it.
```

Example of **message.html** template
```html
Hello <%= user_name %>!
<p>
This is a test message from <%= client_name %> sent on <%= today %>. 
<br/>
Please, ignore it.
</p>
```

Now you can send a message using the templates stored in files. 
**subjectTemplate**, **textTemplate** and **htmlTemplate** parameters shall contain the template file paths.
Client will automatically load their content and parse.

```dart
// Send msgdistribution message to address using template
var message = MessageV1(subject: File('./templates/message_subject.txt').readAsStringSync(),
                             text: File('./templates/message.txt').readAsStringSync(),
                             html: File('./templates/message.html').readAsStringSync());
var recipient = RecipientV1(id: '1', email: 'user1@somewhere.com', phone: '+1234567890');
var parameters = ConfigParams.fromTuples([
        'user_name', 'Somebody',
        'today': DateTime.now().toIso8601String()
    ]);
await client.sendMessage(
    null,
    recipient,
    message,
    parameters,
    DeliveryMethodV1.All
);
```

This microservice was created and currently maintained by
- **Sergey Seroukhov**
- **Nuzhnykh Egor**.