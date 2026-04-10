import '../models/day_plan.dart';
import '../models/exercise.dart';

class DummyData {
  static List<Exercise> _getMockExercises() {
    return [
      Exercise(
        id: 'e1',
        title: 'Chống đẩy thẳng',
        description: 'Giữ lưng thẳng và hạ thấp cơ thể cho đến khi ngực gần chạm sàn. Đẩy ngược lên vị trí ban đầu.',
        reps: 15,
        isTimeBased: false,
        imageUrl: 'assets/images/chongday.jpg',
      ),
      Exercise(
        id: 'e2',
        title: 'Gập bụng',
        description: 'Nằm xấp và gập người lên trên.',
        durationSeconds: 30,
        isTimeBased: true,
        imageUrl: 'assets/images/gapbung.jpg',
      ),
      Exercise(
        id: 'e3',
        title: 'Plank',
        description: 'Chống khuỷu tay và giữ thân mình thẳng.',
        durationSeconds: 40,
        isTimeBased: true,
        imageUrl: 'assets/images/plank.jpg',
      ),
      Exercise(
        id: 'e4',
        title: 'Nâng cao đùi',
        description: 'Chạy tại chỗ và đẩy đầu gối lên cao nhất có thể.',
        durationSeconds: 30,
        isTimeBased: true,
        imageUrl: 'assets/images/nangcaodui.jpg',
      ),
      Exercise(
        id: 'e5',
        title: 'Leo núi',
        description: 'Động tác leo núi trên mặt phẳng.',
        durationSeconds: 20,
        isTimeBased: true,
        imageUrl: 'assets/images/leonui.jpg',
      ),
      Exercise(
        id: 'e6',
        title: 'Squad',
        description: 'Gánh đùi, hạ thấp hông.',
        durationSeconds: 20,
        isTimeBased: true,
        imageUrl: 'assets/images/squad.jpg',
      ),
    ];
  }

  static List<DayPlan> get30DaysPlan() {
    List<DayPlan> plans = [];
    for (int i = 1; i <= 30; i++) {
      // Ngày 4, 8, 12... là ngày nghỉ
      if (i % 4 == 0) {
        plans.add(DayPlan(
          dayNumber: i,
          title: 'Ngày nghỉ ngơi',
          totalKcal: 0,
          durationMinutes: 0,
          exercises: [],
          isCompleted: false,
        ));
      } else {
        plans.add(DayPlan(
          dayNumber: i,
          title: 'Bài tập toàn thân',
          totalKcal: 150 + (i * 2), // Tăng dần độ khó
          durationMinutes: 15 + (i % 5),
          exercises: _getMockExercises(),
          isCompleted: i < 3, // Giả sử đã tập 2 ngày đầu
        ));
      }
    }
    return plans;
  }
}
