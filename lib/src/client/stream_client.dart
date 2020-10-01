import 'package:stream_feed_dart/src/client/batch_operations_client.dart';
import 'package:stream_feed_dart/src/client/collections_client.dart';
import 'package:stream_feed_dart/src/client/reactions_client.dart';
import 'package:stream_feed_dart/src/client/stream_client_impl.dart';
import 'package:stream_feed_dart/src/client/stream_client_options.dart';
import 'package:stream_feed_dart/src/client/users_client.dart';
import 'package:stream_feed_dart/src/core/http/token.dart';

import 'feed/index.dart';

abstract class StreamClient {
  factory StreamClient.connect(
    String apiKey,
    String secret, {
    StreamClientOptions options,
  }) =>
      StreamClientImpl(secret, apiKey, options: options);

  BatchOperationsClient get batch;

  CollectionsClient get collections;

  ReactionsClient get reactions;

  UsersClient get users;

  FlatFeet flatFeed(String slug, String userId);

  AggregatedFeed aggregatedFeed(String slug, String userId);

  NotificationFeed notificationFeed(String slug, String userId);

  Token frontendToken(
    String userId, {
    DateTime expiresAt,
  });
}
