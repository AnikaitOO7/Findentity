# Findentity - App for Tracking Missing Persons

Findentity is an innovative mobile application designed to track and locate missing persons, including children, the elderly, and mentally challenged individuals, using Aadhaar-enabled biometric details and real-time geolocation services.

## Table of Contents

1. [About the Project](#about-the-project)
2. [Problem Statement](#problem-statement)
3. [Solution Approach](#solution-approach)
4. [Technology Stack](#technology-stack)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Contributing](#contributing)
8. [License](#license)
9. [Team](#team)
10. [Contact](#contact)

---

## About the Project

The Findentity app leverages biometric fingerprint scanners available on smartphones to identify missing persons through the Aadhaar database. It provides geolocation data to guardians or officials, ensuring real-time tracking and updates.

## Problem Statement

The app is aimed at solving the problem of missing persons, particularly:
- Children
- Elderly individuals
- Mentally challenged persons
- Drunken individuals

The app uses Aadhaar-enabled biometric identification to track these individuals and notify guardians or officials.

---

## Solution Approach

1. **Biometric Identification**:
   - Scans fingerprints using a mobile scanner.
   - Matches the biometric data with the Aadhaar database.
   
2. **Real-time Tracking**:
   - GPS services integrated for tracking live locations.
   - Parents/guardians receive SMS updates via PG-SMS (Parent Guidance Short Message Service).

3. **Data Security**:
   - End-to-end encryption ensures that all data is securely processed.
   - Special privileges are provided to officials for accessing detailed data.

---

## Technology Stack

- **Frontend**: Flutter with Flat Material (UI Kit)
- **Backend**: Django
- **Database**: PostgreSQL / MySQL
- **APIs**: Aadhaar API, Google Maps API, SMS Gateway
- **AI/ML**: Python for AI/ML model to analyze fingerprints
- **Hosting**: AWS

---

## Installation

### Prerequisites
- Flutter installed on your system
- Python (with Django) installed
- PostgreSQL or MySQL database set up
- AWS account for hosting

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repo/findentity.git
