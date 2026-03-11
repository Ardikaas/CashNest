import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashnest/core/values/colors.dart';
import 'package:cashnest/core/utils/currency_formatter.dart';
import '../controllers/dompet_detail_controller.dart';

class DompetDetailView extends GetView<DompetDetailController> {
  const DompetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    // Basic mock arguments or default values for demonstration
    final title = Get.arguments?['title'] ?? 'Tabungan Utama';
    final amount = Get.arguments?['amount'] ?? 45250000.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Detail Tabungan',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.textPrimary),
            onPressed: () {
              // Pass current values to allow pre-filling the form
              Get.toNamed(
                '/dompet-settings',
                arguments: {
                  'title': title,
                  'bankName': 'Bank Mandiri',
                  'accountNumber': '1234567890',
                  'adminFee': 15000.0,
                },
              );
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWalletHeader(title, amount),
            const SizedBox(height: 32),
            _buildActionButtons(),
            const SizedBox(height: 32),
            _buildHistorySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletHeader(String title, double amount) {
    return Column(
      children: [
        const SizedBox(height: 16),
        // Icon Circle
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primaryBg,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance_wallet,
                color: AppColors.primary,
                size: 32,
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          CurrencyFormatter.convertToIdr(amount),
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.account_balance,
              size: 16,
              color: AppColors.textSecondary,
            ),
            SizedBox(width: 8),
            Text(
              'Bank Mandiri',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.credit_card, size: 16, color: AppColors.textSecondary),
            SizedBox(width: 8),
            Text(
              '1234567890',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sync, size: 14, color: AppColors.textSecondary),
            SizedBox(width: 8),
            Text(
              'Terakhir sinkron: 2 menit yang lalu',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.info_outline, size: 14, color: AppColors.primary),
            SizedBox(width: 8),
            Text(
              'Biaya admin: Rp 15.000 / bulan',
              style: TextStyle(color: AppColors.primary, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.account_balance_wallet_outlined),
              label: const Text('Penarikan'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBg,
                foregroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  'Riwayat Dompet',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Lihat\nSemua',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'OKTOBER 2023',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          _buildHistoryItem(
            title: 'Alokasi Gaji',
            date: '12 Okt 2023 • 10:00',
            amount: '+Rp 15.000.000',
            isIncome: true,
          ),
          _buildHistoryItem(
            title: 'Withdrawal Cash',
            date: '10 Okt 2023 • 18:30',
            amount: '-Rp 500.000',
            isIncome: false,
          ),
          _buildHistoryItem(
            title: 'Transfer Masuk',
            date: '05 Okt 2023 • 14:30',
            amount: '+Rp 2.500.000',
            isIncome: true,
          ),
          // Additional padding for bottom nav if needed, but this is a inner view without it maybe
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Widget _buildHistoryItem({
    required String title,
    required String date,
    required String amount,
    required bool isIncome,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isIncome
                  ? AppColors.badgeGreenBg
                  : Colors.red.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isIncome ? Icons.south_west : Icons.north_east,
              color: isIncome ? AppColors.badgeGreenText : Colors.red,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: isIncome ? AppColors.badgeGreenText : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
