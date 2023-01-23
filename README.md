<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/sn2606/MetOps-frontend">
    <img src="assets/cloud.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">MetOps</h3>

  <p align="center">
    MetOps is a state-of-the-art, fully integrated comprehensive solution presented as a substitute for the traditional MET stations used for field artillery atmospheric data collection.
    <br />
    <a href="https://github.com/sn2606/MetOps-frontend"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/sn2606/MetOps-frontend">View Demo</a>
    ·
    <a href="https://github.com/sn2606/MetOps-frontend/issues">Report Bug</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<br>

<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot]](https://example.com)

This is an android application.


<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* [Open-Meteo](https://open-meteo.com/en/docs)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

* Follow [flutter installation instructions](https://docs.flutter.dev/get-started/install).
* The [backend](https://github.com/sn2606/MetOps-backend) should be up and running.
* VS Code
* Android Studio

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/sn2606/MetOps-frontend.git
   ```
2. Install packages
   ```sh
   flutter pub get
   ```
3. Start an android emulator (API 32+)
4. Start the [backend](https://github.com/sn2606/MetOps-backend) server
   ```sh
   python manage.py runserver
   ```
5. Run the app
   ```sh
   flutter run
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

[Backend](https://github.com/sn2606/MetOps-backend) to [this Flutter app](https://github.com/sn2606/MetOps-frontend)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Screens
  - [x] Splash
  - [x] Login
  - [x] Dashboard
  - [x] Query
    - [x] Result
  - [x] Records
    - [x] Result
- [x] Database Connected (PostgreSQL)
- [x] Connect to backend
    - [x] Authorization Login & Account
    - [x] Query Response from external API (Meteomatics)
    - [x] Query & Records Save
    - [x] Query & Records View
    - [x] Query & Records Delete
    - [x] Query & Response Export
- [x] Current Location Weather on Dashboard
- [ ] 2 factor authentication
- [ ] State management


See the [open issues](https://github.com/sn2606/MetOps-frontend/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Swaranjana Nayak - swaranjananayak@gmail.com

Project Link: [https://github.com/sn2606/MetOps-frontend](https://github.com/sn2606/MetOps-frontend)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Dart Documentation](https://dart.dev/guides)
* [Flutter Documentation](https://docs.flutter.dev/)
* [Flutter-Django tutorial](https://www.youtube.com/playlist?list=PLCcj7eWENylKcfgrh7SPqbSVjxVytW0r7)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/sn2606/MetOps-frontend.svg?style=for-the-badge
[contributors-url]: https://github.com/sn2606/MetOps-frontend/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/sn2606/MetOps-frontend.svg?style=for-the-badge
[forks-url]: https://github.com/sn2606/MetOps-frontend/network/members
[stars-shield]: https://img.shields.io/github/stars/sn2606/MetOps-frontend.svg?style=for-the-badge
[stars-url]: https://github.com/sn2606/MetOps-frontend/stargazers
[issues-shield]: https://img.shields.io/github/issues/sn2606/MetOps-frontend.svg?style=for-the-badge
[issues-url]: https://github.com/sn2606/MetOps-frontend/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/swaranjana
[product-screenshot]: assets/demo.gif
