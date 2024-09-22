# JD_Sen_Analysis 
Here's an enhanced and more detailed version of the README, tailored for your GitHub repository `JD_Sen_Analysis` under your account `Cheng02lema`. This version aims to present the project in a polished and professional way, making it attractive and informative for visitors to your repository.

---

# JD.com Mobile Reviews Sentiment Analysis using Naive Bayes Algorithm

Welcome to the JD.com Mobile Reviews Sentiment Analysis project! This repository hosts a comprehensive solution for analyzing sentiment in mobile phone reviews from JD.com, using the Naive Bayes algorithm. This project combines data collection, processing, statistical analysis, and machine learning to automatically classify user reviews as positive or negative, offering valuable insights that can enhance user experience on e-commerce platforms.

## Table of Contents

- [Project Overview](#project-overview)
- [Key Features](#key-features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Results](#results)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Project Overview

This project aims to build an automated sentiment analysis system that processes large-scale user reviews of mobile phones from JD.com, classifying them into positive and negative categories. The analysis provides valuable insights for e-commerce platforms, aiding in understanding customer feedback and improving overall service and product quality.

### Objectives:

- **Automate sentiment analysis** to reduce manual effort in understanding customer feedback.
- **Enhance data-driven decision-making** by providing actionable insights from review data.
- **Support e-commerce platforms** in refining user experience and addressing customer concerns.

## Key Features

1. **Data Collection**:
   - Utilizes Python web scraping techniques to collect mobile phone reviews from JD.com, forming the basis for analysis.

2. **Data Processing**:
   - Implements Kafka for real-time data streaming and cleaning.
   - Cleansed data is stored in Druid, enabling efficient querying and analysis.

3. **Data Analysis**:
   - Spark is employed for statistical analysis, including word frequency analysis and sentiment trend analysis, to generate key insights and prepare data for model training.

4. **Model Training and Prediction**:
   - Trains a sentiment classification model using the Naive Bayes algorithm, allowing for accurate prediction of review sentiments.

5. **Web Application**:
   - Built using the Django framework, the web app integrates data visualization and sentiment prediction, providing users with an interactive interface to explore analysis results.

## Tech Stack

- **Programming Language**: Python
- **Framework**: Django (Web Application)
- **Data Processing**: Kafka, Druid
- **Data Analysis**: Spark
- **Machine Learning**: Naive Bayes Algorithm
- **Database**: Druid (for storing processed data)
- **Web Scraping**: Beautiful Soup, Selenium

## Project Structure

- **`scraper/`**: Python scripts for scraping reviews from JD.com.
- **`processing/`**: Kafka and Druid setup scripts for data transmission and processing.
- **`analysis/`**: Spark scripts for conducting statistical analysis and preparing data for machine learning.
- **`model/`**: Naive Bayes model training and prediction scripts.
- **`web/`**: Django application code for the web platform, integrating data analysis and sentiment prediction.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Python 3.x
- Kafka
- Druid
- Spark
- Django

### Installation

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/Cheng02lema/JD_Sen_Analysis.git
   ```
   
2. Navigate to the project directory and install the required dependencies:
   ```bash
   cd JD_Sen_Analysis
   pip install -r requirements.txt
   ```

3. Set up Kafka, Druid, and Spark following the configuration guides provided in the `setup/` folder.

### Running the Application

1. Start the data processing pipeline with Kafka, Druid, and Spark.
2. Launch the Django web application:
   ```bash
   python manage.py runserver
   ```
3. Access the application in your browser at `http://127.0.0.1:8000/` to explore data analysis results and perform sentiment predictions.

## Usage

- **View Data Analysis**: Navigate to the analysis section to explore word frequency and sentiment trends from JD.com reviews.
- **Sentiment Prediction**: Use the prediction tool to classify new review texts as positive or negative based on the trained Naive Bayes model.

## Results

The system successfully analyzes and predicts the sentiment of JD.com mobile phone reviews, offering:

- **Comprehensive sentiment trends** to understand user opinions over time.
- **Accurate classification of reviews**, assisting in identifying key areas for improvement in products or services.

## Contributing

We welcome contributions! Please fork the repository, create a new branch for your features or bug fixes, and submit a pull request. Ensure your code adheres to the project’s style guidelines and includes appropriate tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Acknowledgments

- Thanks to the open-source community for the tools and libraries that made this project possible.
- Special thanks to contributors who provided feedback and improvements to the project.
- Inspired by the continuous effort to enhance user experience in the e-commerce domain.

---
