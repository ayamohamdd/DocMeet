# DocMeet

A Flutter application that enables users to book appointments with specialists (doctors, consultants, trainers) in a simple and efficient way.

## 🚀 Features

- **User Authentication**
  - Secure login and registration
  - Firebase authentication integration
  - User session management

- **Specialist Listing**
  - Browse available specialists
  - View specialist details (name, specialization, experience, rating)
  - See specialist availability
  - Filter specialists by category

- **Appointment Booking**
  - Select available time slots
  - Real-time availability updates
  - Instant booking confirmation
  - Appointment status tracking

## 🛠️ Tech Stack

- **Frontend**
  - Flutter 3.x
  - Dart
  - BLoC for state management
  - Responsive UI design

- **Backend**
  - Firebase Firestore
  - Firebase Authentication
  - Real-time data synchronization

## 📱 Demo

🎬 [Watch Demo Video on YouTube](https://youtube.com/shorts/BhVzTTaYByc?feature=share)

## 🏗️ Architecture

The app follows Clean Architecture principles with the following layers:

- **Presentation Layer**
  - UI components
  - Cubit state management

- **Domain Layer**
  - Use cases
  - Entities
  - Repository interfaces

- **Data Layer**
  - Repository implementations
  - Data sources
  - Models
  - Firebase integration

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or higher)
- Dart SDK
- Firebase account
- Android Studio / VS Code

### Installation

1. Clone the repository:
```bash
git clone https://github.com/ayamohamdd/DocMeet.git
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download and add the configuration files
   - Enable Authentication and Firestore

4. Run the app:
```bash
flutter run
```

## 📝 Business Understanding

### Business Goal
The app aims to simplify the process of booking medical appointments by connecting patients with qualified specialists. It provides detailed doctor profiles, including experience, ratings, and patient history, to help users make informed choices. Users can view available time slots in a weekly calendar and book appointments directly through the app. It also allows patients to track and manage their bookings efficiently.

### UX Improvement Suggestion
A helpful UX improvement would be a “Quick Booking” feature that remembers the user’s preferred days and time slots. This would speed up the process for frequent users by offering one-tap access to their usual appointment times, along with the option to set recurring bookings.

## ⚠️ Known Limitations

- No offline support
- Limited search functionality
- No appointment rescheduling feature
- No push notifications for appointment reminders
- No payment integration

## 🔜 Future Improvements

- [ ] Implement offline support
- [ ] Add appointment rescheduling
- [ ] Integrate push notifications
- [ ] Add payment processing
- [ ] Implement advanced search and filters
- [ ] Add specialist reviews and ratings
- [ ] Implement chat functionality

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- Aya Mohamed - Initial work

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for the backend services
- All contributors who have helped in the development
