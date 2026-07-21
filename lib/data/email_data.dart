class Email {
  final String sender;
  final String subject;
  final String preview;
  final String body;
  final String date;
  final bool isRead;

  const Email({
    required this.sender,
    required this.subject,
    required this.preview,
    required this.body,
    required this.date,
    this.isRead = false,
  });
}

final List<Email> emails = [
  // ==========================================
  // Email 1 - University
  // ==========================================
  Email(
    sender: "Georgia State University",
    subject: "URGENT: Outstanding Tuition Balance",
    preview: "Our records indicate your tuition balance remains unpaid...",
    date: "Yesterday",
    body: """
Dear Ruby,

Our records indicate that your tuition balance of \$14,200 for the current semester remains unpaid.

We have also identified several withdrawals from your Education Savings Account that were either returned or transferred to another account.

Please contact Financial Services immediately to resolve this matter before your enrollment is affected.

Failure to resolve your balance may result in cancellation of your classes.

Sincerely,

Financial Services
Georgia State University
""",
  ),

  // ==========================================
  // Email 2 - Bank
  // ==========================================
  Email(
    sender: "Peachtree National Bank",
    subject: "Your Account Statement is Ready",
    preview:
        "Your monthly Education Savings Account statement is now available.",
    date: "2 Days Ago",
    body: """
Education Savings Account

Monthly Statement

--------------------------------------

Withdrawal            \$3,600

Withdrawal            \$2,900

Withdrawal            \$4,100

Withdrawal            \$3,600

--------------------------------------

TOTAL WITHDRAWN

\$14,200

Transferred To

Account Ending ****4428

If you do not recognize these transactions, please contact Peachtree National Bank immediately.

Thank you for banking with us.
""",
  ),

  // ==========================================
  // Email 3 - Fake Statement
  // ==========================================
  Email(
    sender: "statement",
    subject: "statement",
    preview: "Education Savings Account Statement (edited copy)",
    date: "2 Days Ago",
    body: """
Education Savings Account

Statement Summary

--------------------------------------

Current Balance

Normal

No unusual activity detected.

No withdrawals listed.

--------------------------------------

This document appears incomplete.

Several transaction entries have been removed or altered.
""",
  ),
];
