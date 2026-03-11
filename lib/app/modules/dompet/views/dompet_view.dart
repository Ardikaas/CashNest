import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashnest/core/values/colors.dart';
import '../controllers/dompet_controller.dart';
import 'widgets/wallet_card.dart';
import '../../../../global_widgets/custom_bottom_nav_bar.dart';

class DompetView extends GetView<DompetController> {
  const DompetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // removes default back arrow
        title: const Text('Dompet Saya'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                top: 24.0,
                bottom: 100.0,
              ), // increased bottom padding for nav bar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Notice Bar "Kebiasaan dimulai sejak Jan 2024"
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBg.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Kebiasaan dimulai sejak Jan 2024',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Mock List Data based exactly on design
                  WalletCard(
                    item: WalletItem(
                      title: 'Tabungan Utama',
                      subtitle: 'BANK MANDIRI • 1234567890',
                      balanceLabel: 'Saldo Tersedia',
                      balance: 45250000,
                      icon: Icons.account_balance_wallet,
                    ),
                  ),
                  WalletCard(
                    item: WalletItem(
                      title: 'Dana Darurat',
                      subtitle: 'BCA • 0987654321',
                      balanceLabel: 'Saldo Tersedia',
                      balance: 120000000,
                      icon: Icons.shield,
                    ),
                  ),
                  WalletCard(
                    item: WalletItem(
                      title: 'Jajan',
                      subtitle: 'BANK JAGO • 5544332211',
                      balanceLabel: 'Saldo Tersedia',
                      balance: 2450000,
                      icon: Icons.shopping_bag,
                    ),
                  ),
                  WalletCard(
                    item: WalletItem(
                      title: 'Investasi Saham',
                      subtitle: 'BNI SEKURITAS • 9988776655',
                      balanceLabel: 'Nilai Portofolio',
                      balance: 85700000,
                      icon: Icons.trending_up,
                    ),
                  ),

                  const SizedBox(height: 16),
                  // Tambah Dompet Baru Dotted Button
                  _buildAddWalletButton(),
                  const SizedBox(height: 48), // Bottom padding
                ],
              ),
            ),
          ),
          const CustomBottomNavBar(currentIndex: 1),
        ],
      ),
    );
  }

  Widget _buildAddWalletButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryBg.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          style:
              BorderStyle.none, // Can use dotted border package later if needed
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Tambah Dompet Baru',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
