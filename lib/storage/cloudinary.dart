import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final cloudinary = Cloudinary.signedConfig(
  apiKey: dotenv.get('CLOUDINARY_API_KEY'),
  apiSecret: dotenv.get('CLOUDINARY_API_SECRET'),
  cloudName: dotenv.get('CLOUDINARY_CLOUD_NAME'),
);
