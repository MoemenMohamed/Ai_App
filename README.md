# Ai_App
# AI Weather App with Authentication

## 🌦️ Overview
The **AI Weather App** is a Flutter-based mobile application that provides real-time weather information using AI-based predictions. It features user authentication with Firebase, allowing users to sign up and sign in securely. The app fetches weather data based on the user's location and predicts future weather conditions.

## 🚀 Features
### 🔐 Authentication
- User Sign Up & Sign In using Firebase Authentication.
- Secure password management with visibility toggle.
- Error handling for authentication failures.

### ☁️ AI-Powered Weather Forecasting
- Fetches real-time weather data.
- Predicts weather conditions based on AI models.
- Uses a service locator for dependency injection.

### 📍 Location-Based Weather
- Retrieves user location for precise weather updates.
- Uses a repository pattern for better data management.

### 🌍 Multi-Screen Navigation
- **Home Screen**: Overview of features.
- **Sign In & Sign Up Screens**: User authentication.
- **Weather Screen**: Displays current & predicted weather information.

## 🛠️ Tech Stack
- **Flutter** (UI Development)
- **Provider** (State Management)
- **Firebase Authentication** (User Sign In & Sign Up)
- **REST API** (Weather Data)
- **AI/ML Model** (Weather Prediction)
- **Dart** (Programming Language)

## 🔧 Installation & Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/ai-weather-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd ai-weather-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase:
   - Add your `google-services.json` (Android) or `GoogleService-Info.plist` (iOS).
5. Run the app:
   ```bash
   flutter run
   ```

## 📌 How It Works
1. Users sign up or log in to access weather features.
2. The app fetches the user's location and retrieves weather data.
3. AI-based predictions are generated for future weather conditions.
4. Users can view the latest weather updates and forecasts.

## 📜 Contribution Guidelines
We welcome contributions! To contribute:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch-name`.
3. Commit your changes: `git commit -m "Add feature XYZ"`.
4. Push to the branch: `git push origin feature-branch-name`.
5. Open a Pull Request.

## 🤖 Future Enhancements
- Implement AI model improvements for better predictions.
- Add user preferences for location-based weather alerts.
- Improve UI with animations and themes.

## 📄 License
This project is licensed under the MIT License.



