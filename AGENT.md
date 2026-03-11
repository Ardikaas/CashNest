# CashNest - Business Logic & Agent Context

This document serves as the primary context for AI agents, frontend developers, and backend developers working on CashNest. It explains the core business logic, user flows, and planned features.

**IMPORTANT FOR AGENTS:** Read this document carefully to understand the context of the app before making architectural decisions or creating database models.

## 1. App Introduction

* **Name**: CashNest
* **Goal**: Manage income (monthly salaries or sudden/unexpected income like freelance, gifts, THR) to assist users in achieving financial freedom.
* **Core Philosophy**: "Pemecahan Dompet" (Wallet Allocation/Breakdown). Money should not sit idle in a single general balance. It must be purposefully allocated into specific virtual buckets (Dompet) based on user-defined percentages.

## 2. Core Entities

When designing the backend or data models, keep these primary entities in mind:

1. **User**: The account owner who configures percentages and tracks their finances.
2. **Rekening (Real-World Bank Account / Source of Fund)**: Actual accounts where the physical money resides (e.g., "BCA", "Mandiri", "Gopay", "Dompet Fisik/Cash").
3. **Dompet (Virtual Wallet/Bucket)**: Internal allocation buckets within the app. By default, there are four main types:
    * **Dompet Harian (Daily Expenses)**: For day-to-day spending (food, transport, groceries).
    * **Dompet Tabungan (Savings)**: For short-to-mid term goals (buying a gadget, holiday).
    * **Dompet Investasi (Investment)**: For long-term wealth growth (stocks, mutual funds).
    * **Dompet Darurat (Emergency Fund)**: A strict safety net for unforeseen circumstances.
4. **Kategori Pemasukan (Income Type)**:
    * *Rutin (Monthly/Regular)*: e.g., Monthly Salary.
    * *Dadakan (Unexpected)*: e.g., Freelance payments, gifts, bonuses, THR.
5. **Transaksi (Transactions)**: Records of money flowing in (Pemasukan), flowing out (Pengeluaran), or moving between buckets/accounts.

## 3. Key Workflows & Features

### 3.1 Setup / Onboarding

* User defines their base `Dompet` configurations. They can set the percentage allocation for each wallet type.
  * *Example Default Profile*: Harian (50%), Tabungan (20%), Investasi (20%), Darurat (10%).
* User adds their existing `Rekening` (Bank Accounts/Cash) and inputs their current actual balances so the app matches reality.

### 3.2 Feature: Income Allocation (Pemecahan Pemasukan) - *THE CORE FEATURE*

1. **Input Income**: User inputs new income. They can select whether it's a Monthly Salary or an Unexpected Income. (e.g., Rp 10,000,000 from Freelance).
2. **Preview Allocation**: Before saving, the app automatically calculates and shows a visually appealing preview of how this Rp 10,000,000 will be distributed based on the wallet percentages.
    * Harian (50%): Rp 5,000,000
    * Tabungan (20%): Rp 2,000,000
    * Investasi (20%): Rp 2,000,000
    * Darurat (10%): Rp 1,000,000
3. **Adjust & Confirm**: The user can manually adjust the nominal value / slider in the preview if they want to deviate from the standard percentage for this specific income.
4. **Execution and Assignment**: The user selects which `Rekening` (e.g., "BCA") received this money in the real world. Once confirmed, the total amount is added to `Rekening BCA`, and internally, the virtual `Dompet` balances are successfully updated.

### 3.3 Dashboard / Overview

* **Total Balance Overview**: Shows the total accumulated wealth across all accounts.
* **Dompet View**: A section showing the user how much money is currently sitting in each virtual purpose wallet.
* **Rekening View**: A section showing the actual real-world location of the money (Bank accounts balances).

### 3.4 (Pending) Future Features

* *Other features will be described by the user as development progresses. Agents must update this document when the user introduces new core features.*

## 4. Technical Constraints & Logic Rules

* **The Golden Rule of Balance**: `SUM(All Dompet Balances) MUST EXACTLY EQUAL SUM(All Rekening Balances)`.
* Any expense transaction must always deduct from **TWO** places simultaneously:
    1. Which `Dompet` it is deducting from (e.g., "Buying food" deducts from `Dompet Harian`).
    2. Which `Rekening` was used to pay for it (e.g., paid using `Rekening OVO`).
* The application must always prioritize showing the preview of the breakdown whenever income is recorded to reinforce the psychological aspect of financial planning.

---
*Note: Maintain this file and update it diligently. If the user changes business requirements, reflect them here immediately so future agents do not hallucinate outdated flows.*
