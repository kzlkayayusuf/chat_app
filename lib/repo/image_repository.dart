
import 'dart:convert';
import 'dart:io';

import '../models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository{
  //get network images from api
  Future<List<PixelFordImage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('https://pixelford.com/api2/images');

      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;
        final List<PixelFordImage> _imageList = decodedList
            .map((listItem) => PixelFordImage.fromJson(listItem))
            .toList();

        print(_imageList[0].urlFullSize);
        return _imageList;
      } else {
        throw Exception('API not successful!');
      }
    }on SocketException{
      throw Exception('No internet connection :(');
    }on HttpException{
      throw Exception('Couldnt retrieve images! Sorry!');
    }on FormatException{
      throw Exception('Bad response format!');
    }

    catch(e){
      print(e);
      throw Exception('Unknown error!');
    }
  }
}