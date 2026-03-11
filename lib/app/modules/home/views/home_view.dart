import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/values/colors.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../controllers/home_controller.dart';
import 'widgets/dompet_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        title: const Text('Pemisah Pendapatan'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.primaryBg,
              child: const Icon(Icons.person, color: AppColors.primary),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                _buildDompetList(context),
                // Extra space for FAB at bottom
                const SizedBox(height: 100),
              ],
            ),
          ),
          _buildFloatingActionButton(),
          _buildBottomNavBar(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Center(
        child: Column(
          children: [
            Text(
              'TOTAL SALDO',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                CurrencyFormatter.convertToIdr(controller.totalBalance.value),
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(fontSize: 36),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.badgeGreenBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.trending_up,
                    color: AppColors.badgeGreenText,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '+12% bulan ini',
                    style: TextStyle(
                      color: AppColors.badgeGreenText,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDompetList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dompet Saya',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Lihat Semua',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Mock Data exactly like the design
          DompetCard(
            item: DompetItem(
              title: 'Tabungan',
              amount: 10000000,
              percentage: 40,
              icon: Icons.savings,
              iconColor: AppColors.tabunganIcon,
              bgColor: AppColors.tabunganBg,
              progressBarColor: AppColors.tabunganIcon,
            ),
          ),
          DompetCard(
            item: DompetItem(
              title: 'Dana Darurat',
              amount: 7500000,
              percentage: 30,
              icon: Icons.medical_services_outlined,
              iconColor: AppColors.daruratIcon,
              bgColor: AppColors.daruratBg,
              progressBarColor: AppColors.daruratIcon,
            ),
          ),
          DompetCard(
            item: DompetItem(
              title: 'Harian (Daily)',
              amount: 2500000,
              percentage: 10,
              icon: Icons.account_balance_wallet_outlined,
              iconColor: AppColors.harianIcon,
              bgColor: AppColors.harianBg,
              progressBarColor: AppColors.harianIcon,
            ),
          ),
          DompetCard(
            item: DompetItem(
              title: 'Investasi',
              amount: 5000000,
              percentage: 20,
              icon: Icons.show_chart,
              iconColor: AppColors.investasiIcon,
              bgColor: AppColors.investasiBg,
              progressBarColor: AppColors.investasiIcon,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Positioned(
      bottom: 80, // Above bottom nav
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 300,
          height: 56,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add, size: 24),
                SizedBox(width: 8),
                Text('Tambah Pendapatan', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    // Basic bottom nav mock
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 'Beranda', true),
            _navItem(Icons.account_balance_wallet, 'Dompet', false),
            _navItem(Icons.pie_chart, 'Laporan', false),
            _navItem(Icons.person, 'Profil', false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool isActive) {
    final color = isActive ? AppColors.primary : AppColors.textSecondary;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
