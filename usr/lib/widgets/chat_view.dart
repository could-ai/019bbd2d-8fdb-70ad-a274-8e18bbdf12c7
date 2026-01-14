import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scrollable Content
        Positioned.fill(
          bottom: 80, // Leave space for the input area
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting / Header
                    Text(
                      'Good morning, Alex.',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: const Color(0xFF334155),
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Context Summary Card
                    const _ContextSummaryCard(),
                    
                    const SizedBox(height: 32),
                    
                    // Suggested Actions
                    Text(
                      'Suggested Actions',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const _ActionButtonsGrid(),
                    
                    const SizedBox(height: 40),
                    // Placeholder for chat history or empty state could go here
                  ],
                ),
              ),
            ),
          ),
        ),
        
        // Bottom Input Area
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _ChatInputArea(),
        ),
      ],
    );
  }
}

class _ContextSummaryCard extends StatelessWidget {
  const _ContextSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _SummaryItem(
                label: 'Degree Target',
                value: 'Undergraduate',
                subValue: 'USA, UK, Canada',
                icon: Icons.school_outlined,
              ),
              _VerticalSeparator(),
              _SummaryItem(
                label: 'Applications',
                value: '3 In Progress',
                subValue: '2 Submitted',
                icon: Icons.description_outlined,
              ),
              _VerticalSeparator(),
              _SummaryItem(
                label: 'Scholarship Potential',
                value: 'High',
                subValue: 'Match Score: 85%',
                icon: Icons.monetization_on_outlined,
                valueColor: Colors.green[700],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),
          // Alerts Section
          Row(
            children: [
              const Icon(Icons.notifications_active_outlined, size: 20, color: Color(0xFFEF4444)),
              const SizedBox(width: 8),
              const Text(
                'Missed Deadline: Stanford Early Action (Yesterday)',
                style: TextStyle(color: Color(0xFFEF4444), fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: Color(0xFF3B82F6)),
                    SizedBox(width: 6),
                    Text(
                      'Upcoming: MIT Regular Decision (14 days)',
                      style: TextStyle(color: Color(0xFF3B82F6), fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final String subValue;
  final IconData icon;
  final Color? valueColor;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.subValue,
    required this.icon,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF64748B), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF94A3B8),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: valueColor ?? const Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subValue,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerticalSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: const Color(0xFFE2E8F0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ActionButtonsGrid extends StatelessWidget {
  const _ActionButtonsGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ActionButton(
          label: 'Review missed deadline',
          icon: Icons.warning_amber_rounded,
          color: const Color(0xFFFEF2F2),
          textColor: const Color(0xFFB91C1C),
          borderColor: const Color(0xFFFECACA),
        ),
        _ActionButton(
          label: 'Prepare for upcoming deadline',
          icon: Icons.edit_calendar_rounded,
        ),
        _ActionButton(
          label: 'Find open scholarships',
          icon: Icons.search_rounded,
        ),
        _ActionButton(
          label: 'Improve my profile',
          icon: Icons.auto_graph_rounded,
        ),
        _ActionButton(
          label: 'Plan next 30 days',
          icon: Icons.calendar_view_month_rounded,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  const _ActionButton({
    required this.label,
    required this.icon,
    this.color,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor ?? const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: textColor ?? const Color(0xFF475569),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor ?? const Color(0xFF475569),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatInputArea extends StatelessWidget {
  const _ChatInputArea();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
          ],
          stops: const [0.6, 1.0],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.auto_awesome, color: Color(0xFF94A3B8), size: 20),
                const SizedBox(width: 12),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask me anything about your admissions journey...',
                      hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F5F9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_upward_rounded),
                    color: const Color(0xFF64748B),
                    onPressed: () {},
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
