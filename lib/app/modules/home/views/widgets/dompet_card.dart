import 'package:flutter/material.dart';
import 'package:cashnest/core/values/colors.dart';
import 'package:cashnest/core/utils/currency_formatter.dart';

class DompetItem {
  final String title;
  final double amount;
  final double percentage;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final Color progressBarColor;

  DompetItem({
    required this.title,
    required this.amount,
    required this.percentage,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.progressBarColor,
  });
}

class DompetCard extends StatelessWidget {
  final DompetItem item;

  const DompetCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item.bgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      CurrencyFormatter.convertToIdr(item.amount),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              Text(
                '${item.percentage.toInt()}%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: item.percentage / 100,
              backgroundColor: const Color(
                0xFFF1F5F9,
              ), // Very light gray from design
              valueColor: AlwaysStoppedAnimation<Color>(item.progressBarColor),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
