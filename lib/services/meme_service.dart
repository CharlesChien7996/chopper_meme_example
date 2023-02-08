import 'package:chopper/chopper.dart';
import 'package:chopper_meme_example/models/meme_response.dart';

part 'meme_service.chopper.dart';

@ChopperApi()
abstract class MemeService extends ChopperService {
  @Get(path: 'get_memes')
  Future<Response<MemeResponse>> getPopularMemes();

  static MemeService create([ChopperClient? client]) => _$MemeService(client);
}
