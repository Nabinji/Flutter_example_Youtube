class ProjectModel {
  final String imgURL;
  final String projectName;
  final String? shortDescription;
  final String actionLink;

  ProjectModel({
    required this.imgURL,
    required this.projectName,
    this.shortDescription,
    required this.actionLink,
  });
}

class Constants {
  static final List<ProjectModel> projects = [
    ProjectModel(
      actionLink: '#',
      imgURL:
          'https://eager-williams-af0d00.netlify.app/assets/images/expenseTracker.png',
      projectName: 'Expense Tracker',
    ),
    ProjectModel(
      actionLink: '#',
      imgURL:
          'https://eager-williams-af0d00.netlify.app/assets/images/netflixClone.png',
      projectName: 'Netflix Clone',
    ),
    ProjectModel(
      actionLink: '#',
      imgURL:
          'https://eager-williams-af0d00.netlify.app/assets/images/greenyEarth.png',
      projectName: 'Greeny Earth',
    ),
  ];
}
