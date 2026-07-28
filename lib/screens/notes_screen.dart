import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/evidence.dart';
import '../providers/game_provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  static const Evidence alteredStatementClue = Evidence(
    title: 'Altered Bank Statements',
    description:
        'Ruby believed someone changed her college account statements to hide several withdrawals totaling \$14,200.',
    icon: Icons.account_balance_outlined,
  );

  static const Evidence hoodieInDianesCarClue = Evidence(
    title: 'Red Hoodie in Diane’s SUV',
    description:
        'Ruby wrote that the red hoodie associated with Kayla was later seen in the back seat of Diane’s SUV.',
    icon: Icons.checkroom_outlined,
  );

  static const List<_RubyNote> notes = [
    _RubyNote(
      title: 'Tuition account',
      preview: 'The numbers still do not match...',
      date: 'Tuesday • 4:38 PM',
      icon: Icons.account_balance_outlined,
      body:
          'I checked the tuition account again.\n\n'
          'There are four withdrawals I do not recognize, and the total is '
          '\$14,200. The statement Mom showed me does not include them.\n\n'
          'I downloaded the real statement before anything else could be changed. '
          'Someone edited the copy she gave me.',
      clue: alteredStatementClue,
    ),
    _RubyNote(
      title: 'Tonight',
      preview: 'Mom wants to meet somewhere private...',
      date: 'Tuesday • 5:34 PM',
      icon: Icons.warning_amber_rounded,
      body:
          'Mom wants me to meet her tonight so we can “talk calmly.”\n\n'
          'She said not to involve Dad or the bank until she explains everything. '
          'I do not like how nervous she sounded.\n\n'
          'I am bringing copies of the real statements with me. If she lies again, '
          'I am reporting the withdrawals.',
    ),
    _RubyNote(
      title: 'The red hoodie',
      preview: 'Jordan borrowed it, but I saw it in Mom’s SUV...',
      date: 'Monday • 6:17 PM',
      icon: Icons.checkroom_outlined,
      body:
          'Kayla is known for wearing that red hoodie all the time.\n\n'
          'Jordan borrowed it after practice last week because it started raining. '
          'He said he returned it, but yesterday I saw the same hoodie folded in '
          'the back seat of Mom’s SUV.\n\n'
          'I asked her about it, and she said she had no idea how it got there.',
      clue: hoodieInDianesCarClue,
    ),
    _RubyNote(
      title: 'Jordan acting strange',
      preview: 'He keeps changing the subject...',
      date: 'Monday • 10:06 PM',
      icon: Icons.favorite_border,
      body:
          'Jordan has been acting strange all week. He keeps hiding his phone and '
          'changing the subject whenever I ask where he has been going.\n\n'
          'I know he is lying about something, but I do not think he is trying '
          'to hurt me. It feels like he is hiding a surprise.',
    ),
    _RubyNote(
      title: 'Kayla',
      preview: 'Her messages are getting worse...',
      date: 'Sunday • 8:43 PM',
      icon: Icons.person_off_outlined,
      body:
          'Kayla’s messages are getting worse. She said I would regret embarrassing '
          'her in front of everyone.\n\n'
          'She wants people to think she scares me. I saved the messages just in '
          'case she deletes them later.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
              decoration: const BoxDecoration(
                color: Color(0xFF11141B),
                border: Border(bottom: BorderSide(color: Colors.white12)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ruby’s Notes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Personal notes recovered from Ruby’s phone',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: notes.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final note = notes[index];

                  return _NoteCard(
                    note: note,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => _NoteDetailScreen(note: note),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  final _RubyNote note;
  final VoidCallback onTap;

  const _NoteCard({required this.note, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF171B24),
      borderRadius: BorderRadius.circular(17),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              color: note.clue != null
                  ? Colors.redAccent.withValues(alpha: 0.28)
                  : Colors.white12,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: Colors.redAccent.withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Icon(note.icon, color: Colors.redAccent),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            note.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (note.clue != null)
                          const Icon(
                            Icons.search,
                            color: Colors.redAccent,
                            size: 19,
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      note.preview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      note.date,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.chevron_right, color: Colors.white38),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoteDetailScreen extends StatefulWidget {
  final _RubyNote note;

  const _NoteDetailScreen({required this.note});

  @override
  State<_NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<_NoteDetailScreen> {
  bool clueRecorded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final clue = widget.note.clue;

    if (clue != null && !clueRecorded) {
      clueRecorded = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        context.read<GameProvider>().discoverClue(clue);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Evidence added: ${clue.title}'),
            backgroundColor: const Color(0xFF2A2F38),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080A0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Note',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF171B24),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: widget.note.clue != null
                        ? Colors.redAccent.withValues(alpha: 0.35)
                        : Colors.white12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(widget.note.icon, color: Colors.redAccent, size: 34),
                    const SizedBox(height: 17),
                    Text(
                      widget.note.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.note.date,
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Divider(color: Colors.white12),
                    const SizedBox(height: 16),
                    Text(
                      widget.note.body,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                        height: 1.65,
                      ),
                    ),
                    if (widget.note.clue != null) ...[
                      const SizedBox(height: 28),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.redAccent.withValues(alpha: 0.35),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.manage_search, color: Colors.redAccent),
                            SizedBox(width: 11),
                            Expanded(
                              child: Text(
                                'This note contains information relevant to the investigation.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RubyNote {
  final String title;
  final String preview;
  final String date;
  final IconData icon;
  final String body;
  final Evidence? clue;

  const _RubyNote({
    required this.title,
    required this.preview,
    required this.date,
    required this.icon,
    required this.body,
    this.clue,
  });
}
