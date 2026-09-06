import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

// ============================================================
// ✏️  EDIT YOUR PORTFOLIO DATA HERE — nothing else needs to change
// ============================================================
class PortfolioData {
  static const String name = "G. Danny Prajwal Reddy ";
  static const String subtitle = "B.Tech 3rd Year • Computer Science Applied Mathematics";

  static const String aboutText =
      "Hello! I'm G. Danny Prajwal Reddy, a passionate Computer Science Engineering "
      "student from CR Rao AIMSCS.";

  static const List<Project> projects = [
    Project(
      title: "Movie Recommendation system",
      description:
          "A Python-based introductory project that leverages cloud data visualization techniques to analyze movie datasets. It delivers personalized movie suggestions based on user preferences and structured data insights ",
    ),
    Project(
      title: "Deep-Fake image generation",
      description:
          "A image generation model using DCGan(Generative Adverserial Networks)",
    ),
    // 👉 Add more projects by copying the block above:
    // Project(
    //   title: "Your Project Name",
    //   description: "A short description of what it does.",
    // ),
  ];

  // Avatar image: leave null to show a plain colored circle,
  // or set to an asset/network image path.
  static const String? avatarImagePath = null;
}

class Project {
  final String title;
  final String description;
  const Project({required this.title, required this.description});
}

// ============================================================
// THEME
// ============================================================
const Color kPrimaryColor = Color(0xFF4B4FBF);
const Color kBackgroundColor = Color(0xFFFAFAFC);
const Color kCardBackground = Colors.white;
const Color kAvatarBackground = Color(0xFFE6E1FA);

// ============================================================
// APP
// ============================================================
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// Reusable AppBar to match the design (centered title, back arrow when needed)
PreferredSizeWidget buildPortfolioAppBar(String title, {bool showBack = false}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: showBack,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}

// Reusable rounded button used across screens
class PortfolioButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;

  const PortfolioButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width = 160,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPortfolioAppBar("My Portfolio"),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: kAvatarBackground,
              backgroundImage: PortfolioData.avatarImagePath != null
                  ? AssetImage(PortfolioData.avatarImagePath!)
                  : null,
              child: PortfolioData.avatarImagePath == null
                  ? const Icon(Icons.person, size: 70, color: kAvatarBackground)
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              PortfolioData.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              PortfolioData.subtitle,
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
            PortfolioButton(
              label: "About Me",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutScreen()),
                );
              },
            ),
            const SizedBox(height: 14),
            PortfolioButton(
              label: "Projects",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProjectsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ABOUT ME SCREEN
// ============================================================
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPortfolioAppBar("About Me", showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            color: kAvatarBackground.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundColor: kPrimaryColor,
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 24),
              Text(
                PortfolioData.aboutText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 30),
              PortfolioButton(
                label: "Back to Home",
                width: 180,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PROJECTS SCREEN
// ============================================================
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPortfolioAppBar("My Projects", showBack: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: PortfolioData.projects.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final project = PortfolioData.projects[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kCardBackground,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          project.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            PortfolioButton(
              label: "Back to Home",
              width: 180,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}