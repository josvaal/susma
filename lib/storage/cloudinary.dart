import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final cloudinary = Cloudinary.signedConfig(
  apiKey: dotenv.env['CLOUDINARY_API_KEY'] ?? '',
  apiSecret: dotenv.env['CLOUDINARY_API_SECRET'] ?? '',
  cloudName: dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '',
);
