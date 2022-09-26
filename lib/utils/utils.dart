export 'common_util.dart';
export 'tile_servers.dart';

double clamp(double x, double min, double max) {
  if (x < min) x = min;
  if (x > max) x = max;

  return x;
}
