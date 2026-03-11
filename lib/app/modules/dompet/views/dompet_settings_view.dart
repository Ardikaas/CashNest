import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashnest/core/values/colors.dart';
import '../controllers/dompet_settings_controller.dart';

class DompetSettingsView extends GetView<DompetSettingsController> {
  const DompetSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Reading passed arguments to pre-fill the TextFields easily
    final title = Get.arguments?['title'] ?? 'Tabungan Utama';
    final bankName = Get.arguments?['bankName'] ?? '';
    final accountNumber = Get.arguments?['accountNumber'] ?? '';
    final adminFee = Get.arguments?['adminFee']?.toString() ?? '0';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Atur $title',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detail Bank',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Nama Bank',
              initialValue: bankName,
              hint: 'Contoh: Bank Mandiri',
              icon: Icons.account_balance,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Nomor Rekening',
              initialValue: accountNumber,
              hint: 'Contoh: 1234567890',
              icon: Icons.credit_card,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            const Text(
              'Biaya / Potongan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Biaya Admin per Bulan (Rp)',
              initialValue: adminFee,
              hint: 'Contoh: 15000',
              icon: Icons.money_off,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Save logic would go here. For now go back.
                  Get.back();
                  Get.snackbar(
                    'Berhasil',
                    'Pengaturan dompet berhasil disimpan',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.badgeGreenBg,
                    colorText: AppColors.badgeGreenText,
                    margin: const EdgeInsets.all(16),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Simpan Perubahan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          keyboardType: keyboardType,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            ),
            prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
