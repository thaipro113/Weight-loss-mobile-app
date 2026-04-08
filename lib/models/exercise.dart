class Exercise {
  final String id;
  final String title;
  final String description;
  final int durationSeconds; // Cho timer
  final int reps; // Hoặc số vòng lặp
  final String imageUrl; // placeholder
  final bool isTimeBased;

  Exercise({
    required this.id,
    required this.title,
    required this.description,
    this.durationSeconds = 0,
    this.reps = 0,
    // Sử dụng assets hoặc network image, ta dùng network tạm
    this.imageUrl = 'https://via.placeholder.com/150',
    this.isTimeBased = true,
  });
}
