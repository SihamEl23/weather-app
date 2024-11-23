
# Weather App 🌤️

The **Weather App** is a Flutter application that provides real-time weather information based on the user's current location. It uses geolocation services to determine the user's position, fetches city details, and displays weather data such as temperature and weather description.

---

## Features 📋

- 🌍 Automatically detects your location using GPS.
- ☀️ Displays weather information (temperature, description) for your current city.
- 🎥 **Loading animations** using Lottie.
- 🏙️ Fetches city names using reverse geocoding.
- 📡 Fetches weather data using the [Weatherbit API](https://www.weatherbit.io/).

---

## Installation 🛠️

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/weather-app.git
   cd weather-app
2. Install dependencies:
   ```bash
   flutter pub add http
   flutter pub add geolocator
   flutter pub add geocoding
3. Add your Weatherbit API key:
- Open _WeathePageState in weather_page.dart.
- Replace YOUR_WEATHERBIT_API_KEY with your actual API key.
4. Ensure your Flutter environment is set up:
   ```bash
   flutter doctor
---

## Usage 🚀

- Run the app on an emulator or a physical device. 
- Note: If you are running the app on an emulator, there might be issues with fetching weather data due to the API key not being properly accessed. For the best experience, use a physical device:

  ```bash
  flutter run
---

## API Reference 🌐
This app uses the Weatherbit API to fetch weather data. Here’s an example API request:

Endpoint: https://api.weatherbit.io/v2.0/current
#### Request Example:
- https://api.weatherbit.io/v2.0/current?key=YOUR_API_KEY&lat=35.6895&lon=139.6917
- {
  "data": [
    {
      "temp": 22.5,
      "weather": {
        "description": "Clear Sky"
      }
    }
  ]
}

---
## License 📜
This project is licensed under the MIT License.

---
## Attributions 🙌
- Lottie Animations: LottieFiles
- Weather API: Weatherbit
- Geolocation: Geolocator Plugin
---
## Support ❤️
If you find this project helpful, feel free to give it a ⭐ on GitHub!