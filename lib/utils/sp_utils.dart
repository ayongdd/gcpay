import 'package:get/get.dart';

class SPUtils {

  static String getGamePlayName(int intPlay)
  {
    if(intPlay == 9)
    {
      return 'LuckyNumber'.tr;
    }
    else if(intPlay == 3)
    {
      return 'Banker Player'.tr;
    }
    else if(intPlay == 4)
    {
      return 'lucky cow'.tr;
    }
    else if(intPlay == 5)
    {
      return 'Lucky Hash'.tr;
    }
    else if(intPlay == 6)
    {
      return 'Hash PK10'.tr;
    }
    else if(intPlay == 7)
    {
      return 'Hash PC10'.tr;
    }
    return '';
  }
}
