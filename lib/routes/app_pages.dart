import 'dart:developer';

import 'package:GCPay/GCPay/manage_page/gc_add_payment.dart';
import 'package:GCPay/GCPay/order_page/gc_order_page.dart';
import 'package:GCPay/GCPay/scan/scanner_page.dart';
import 'package:GCPay/GCPay/wallet_history_page/wallet_history_page.dart';
import 'package:GCPay/bindings/editPW_Binding.dart';
import 'package:GCPay/bindings/login_binding.dart';
import 'package:GCPay/bindings/signup_binding.dart';
import 'package:GCPay/business/exchange_page/exchange_page.dart';
import 'package:GCPay/controllers/auth_controller.dart';
import 'package:GCPay/middlewares/auth_middleware.dart';
import 'package:GCPay/routes/app_routes.dart';
import 'package:GCPay/screens/EditPw/editPw_Screen.dart';
import 'package:GCPay/screens/signup/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:GCPay/utils/theme_page.dart';

import '../GCPay/siteinfo_page/gc_messagedetail_page.dart';
import '../GCPay/user_center_page/gc_googleauthorization_page.dart';
import '../GCPay/user_center_page/gc_modpaymentpass_page.dart';
import '../GCPay/user_center_page/gc_startscreen_page.dart';
import '../GCPay/user_center_page/gc_verify_page.dart';
import '../GCPay/manage_page/gc_add_payment.dart';
import '../GCPay/user_center_page/gc_aboutus_page.dart';
import '../GCPay/buy_page/gc_buy_page.dart';
import '../GCPay/user_center_page/gc_devicemanager_page.dart';
import '../GCPay/user_center_page/gc_feedback_page.dart';
import '../GCPay/manage_page/gc_management_page.dart';
import '../GCPay/manage_page/gc_management_page.dart';
import '../GCPay/home_page/gc_home_page.dart';
import '../GCPay/user_center_page/gc_modifypass_page.dart';
import '../GCPay/manage_page/gc_paymentinfo_page.dart';
import '../GCPay/manage_page/gc_paymentinfo_page.dart';
import '../GCPay/mybuyorder/gc_mybuyorder_page.dart';
import '../GCPay/mysellorder/gc_mysellorder_page.dart';
import '../GCPay/orderpay_page/gc_orderpay_page.dart';
import '../GCPay/order_page/gc_orderlobby_page.dart';
import '../GCPay/preorder_page/gc_preorder_page.dart';
import '../GCPay/sellcoin_page/gc_sellcoin_page.dart';
import '../GCPay/siteinfo_page/gc_siteinfo_page.dart';
import '../GCPay/user_center_page/gc_user_center.dart';
import '../adobexd/bind_walletaddress_page.dart';
import '../adobexd/gameprocess_bingo_page.dart.dart';
import '../adobexd/gameprocess_buy_page.dart';
import '../adobexd/gameprocess_register_page.dart';
import '../adobexd/gameprocess_transfer_page.dart';
import '../adobexd/my_info_page.dart';
import '../adobexd/promotion_earn_page.dart';
import '../adobexd/record_page.dart';
import '../adobexd/share_page.dart';
import '../bindings/mod_pay_Biding.dart';
import '../bindings/password_binding.dart';
import '../business/activity_page/activity_detail_page.dart';
import '../business/activity_page/activity_page.dart';
import '../business/home_page/home_page.dart';
import '../business/main_page.dart';
import '../business/mine_page/mine_page.dart';
import '../business/record_page/betrecord_page/bet_record_amount_page.dart';
import '../business/record_page/betrecord_page/bet_record_bonus_page.dart';
import '../business/record_page/betrecord_page/bet_record_inferior_page.dart';
import '../business/record_page/betrecord_page/bet_record_page.dart';
import '../business/record_page/rebaterecord_page/rebate_record_page.dart';
import '../business/record_page/record_page.dart';
import '../business/record_page/withdraw_page/withdraw_record_page.dart';
import '../screens/login/login_screen.dart';
import '../screens/password/password_screen.dart';
import '../widget/webview_page.dart';

// part 'routes.dart';
// This file will contain your array routing
class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => StartScreenPage(),
      binding: StartScreenBinding(),
    ),
    GetPage(
        name: AppRoutes.LoginPage,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: AppRoutes.SignupPage,
        page: () => const SignupScreen(),
        binding: SignupBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.PasswordPage,
        page: () => const PasswordScreen(),
        binding: PasswordBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.EditPassword,
        page: () => const ModifyPassPage(),
        binding: EditPwBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoutes.ModPaymentPw,
        page: () => const ModPaymentPassPage(),
        binding: ModpayBinding(),
        transition: Transition.rightToLeft),

    ///主入口
    GetPage(
      name: AppRoutes.MainPage,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),

    ///首页Tab
    GetPage(
      name: AppRoutes.HomePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.ExchangePage,
      page: () => ExchangePage(),
      binding: ExchangeBinding(),
    ),

    ///活动Tab
    GetPage(
      name: AppRoutes.ActivityPage,
      page: () => const ActivityPage(),
      binding: ActivityBinding(),
    ),

    ///活动详情Tab
    GetPage(
      name: AppRoutes.ActivityDetailPage,
      page: () => ActivityDetailPage(),
      binding: ActivityDetailBinding(),
    ),

    ///记录Tab
    GetPage(
      name: AppRoutes.RecordPage,
      page: () => const RecordPage(),
      binding: RecordBinding(),
    ),

    ///我的Tab
    GetPage(
        name: AppRoutes.MinePage,
        page: () => MinePage(),
        binding: MineBinding()),

    ///主题色Tab
    GetPage(
      name: AppRoutes.ThemePage,
      page: () => const ThemePage(),
      binding: ThemePageBinding(),
    ),

    ///游戏流程-购买页面
    GetPage(
      name: AppRoutes.ProcessbuyPage,
      page: () => const GameProcessBuyPage(),
      binding: GameProcessBuyPageBinding(),
    ),

    ///游戏流程-注册页面
    GetPage(
      name: AppRoutes.ProcessregisterPage,
      page: () => const GameProcessRegisterPage(),
      binding: GameProcessRegisterPageBinding(),
    ),

    ///游戏流程-转账页面
    GetPage(
      name: AppRoutes.ProcessregisterPage,
      page: () => const GameProcessTransferPage(),
      binding: GameProcessTransferPageBinding(),
    ),

    ///游戏流程-中奖页面
    GetPage(
      name: AppRoutes.ProcessregisterPage,
      page: () => const GameProcessBingoPage(),
      binding: GameProcessBingoPageBinding(),
    ),

    ///绑定钱包地址
    GetPage(
      name: AppRoutes.BindwalletaddressPage,
      page: () => BindWalletaddressPage(),
      binding: WalletAddressBinding(),
    ),

    ///推广赚钱页面
    GetPage(
      name: AppRoutes.PromotionEarnPage,
      page: () => PromotionEarnPage(),
      binding: PromotionEarnPageBinding(),
    ),

    ///记录页面
    GetPage(
      name: AppRoutes.RecordBetPage,
      page: () => RecordBetPage(),
    ),

    ///提现记录页面
    GetPage(
      name: AppRoutes.WithdrawRecordPage,
      page: () => WithdrawRecordPage(),
      binding: WithdrawRecordBinding(),
    ),

    ///投注记录页面
    GetPage(
      name: AppRoutes.BetRecordPage,
      page: () => BetRecordPage(),
      binding: BetRecordBinding(),
    ),

    ///投注记录金额明细页面
    GetPage(
      name: AppRoutes.BetRecordAmountPage,
      page: () => BetRecordAmountPage(),
      binding: BetRecordAmountBinding(),
    ),

    ///投注记录历史明细页面
    GetPage(
      name: AppRoutes.BetRecordHistoryPage,
      page: () => BetRecordBonusPage(),
      binding: BetRecordHistoryBinding(),
    ),

    ///下级投注记录历史明细页面
    GetPage(
      name: AppRoutes.BetRecordInferiorPage,
      page: () => BetRecordInferiorPage(),
      binding: BetRecordInferiorBinding(),
    ),

    ///返佣记录页面
    GetPage(
      name: AppRoutes.RebateRecordPage,
      page: () => RebateRecordPage(),
      binding: RebateRecordBinding(),
    ),

    ///返佣记录页面
    GetPage(
      name: AppRoutes.MyInfoPage,
      page: () => MyInfoPage(),
    ),

    ///分享页面
    GetPage(
      name: AppRoutes.SharePage,
      page: () => SharePage(),
    ),
    GetPage(
      name: AppRoutes.SellcoinPage,
      page: () => SellCoinPage(),
      binding: SellCoinBinding(),
    ),
    GetPage(
      name: AppRoutes.BuyPage,
      page: () => BuyPage(),
      binding: BuyBinding(),
    ),
    GetPage(
      name: AppRoutes.GCHomePage,
      page: () => GCHomePage(),
      binding: GCHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.PreOrderPage,
      page: () => PreOrderPage(),
      binding: PreOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.PaymentInfo,
      page: () => PaymentInfoPage(),
      binding: PaymentInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.SiteInfoPage,
      page: () => SiteInfoPage(),
      binding: SiteInfoBinding(),
    ),
    GetPage(
      name: AppRoutes.ScanPage,
      page: () => ScannerPage(),
    ),
    GetPage(
      name: AppRoutes.UserCenterPage,
      page: () => UserCenterPage(),
      binding: UserCenterBinding(),
    ),
    GetPage(
      name: AppRoutes.FeedbackPage,
      page: () => FeedbackPage(),
    ),
    GetPage(
      name: AppRoutes.AboutUsPage,
      page: () => AboutUsPage(),
    ),
    GetPage(
      name: AppRoutes.AddPayment,
      page: () => AddPayment(),
      binding: AddPaymentBinding(),
    ),
    GetPage(
      name: AppRoutes.DeviceManagerPage,
      page: () => DeviceManagerPage(),
      binding: DeviceManagerBinding(),
    ),
    GetPage(
      name: AppRoutes.ModifyPassPage,
      page: () => ModifyPassPage(),
      binding: EditPwBinding(),
    ),
    GetPage(
      name: AppRoutes.ModPaymentPassPage,
      page: () => ModPaymentPassPage(),
      binding: EditPwBinding(),
    ),
    GetPage(
      name: AppRoutes.VerifyPage,
      page: () => VerifyPage(),
      binding: VerifyPageBinding(),
    ),
    GetPage(
      name: AppRoutes.OrderPage,
      page: () => OrderPage(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: AppRoutes.OrderLobbyPage,
      page: () => OrderLobbyPage(),
      binding: OrderLobbyBinding(),
    ),
    GetPage(
      name: AppRoutes.ManagementPage,
      page: () => ManagementPage(),
      binding: ManageBinding(),
    ),
    GetPage(
      name: AppRoutes.MySellOrderPage,
      page: () => MySellOrderPage(),
      binding: MySellOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.OrderPayPage,
      page: () => OrderPayPage(),
      binding: OrderPayBinding(),
    ),
    GetPage(
      name: AppRoutes.MyBuyOrderPage,
      page: () => MyBuyOrderPage(),
      binding: MyBuyOrderBinding(),
    ),
    GetPage(
      name: AppRoutes.StartScreenPage,
      page: () => StartScreenPage(),
      binding: StartScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.WalletHistoryPage,
      page: () => WalletHistoryPage(),
      binding: WalletHistoryBinding(),
    ),
    GetPage(
      name: AppRoutes.GoogleAuthorizationPage,
      page: () => GoogleAuthorizationPage(),
      binding: GoogleAuthorizationBinding(),
    ),
    GetPage(
      name: AppRoutes.MessageDetailPage,
      page: () => MessageDetailPage(),
      binding: MessageDetailBinding(),
    ),
  ];
}
