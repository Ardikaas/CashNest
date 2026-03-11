import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashnest/core/values/colors.dart';
import 'package:cashnest/app/routes/app_routes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
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
            _navItem(Icons.home, 'Beranda', 0, Routes.HOME),
            _navItem(Icons.account_balance_wallet, 'Dompet', 1, Routes.DOMPET),
            _navItem(Icons.pie_chart, 'Laporan', 2, ''),
            _navItem(Icons.person, 'Profil', 3, ''),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index, String routeName) {
    final isActive = currentIndex == index;
    final color = isActive ? AppColors.primary : AppColors.textSecondary;
    return GestureDetector(
      onTap: () {
        if (!isActive && routeName.isNotEmpty) {
          Get.offAllNamed(routeName); // Avoid infinitely stacking pages
        }
      },
      child: Container(
        color: Colors.transparent, // expand tap area
        width: 60,
        child: Column(
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
        ),
      ),
    );
  }
}
