# AHBExchangeRate – Real-Time Currency Tracker

---

## ⚠️ Token Limitation Notice

The **auto-refresh feature (every 5 seconds)** is implemented but **disabled** due to limitations of the free plan from `exchangerate.host`.  

---

## 💡 Overview

AHBExchangeRate is an iOS application that allows users to:

- View **real-time exchange rates**
- See **daily percentage changes** (+/-)
- **Add or remove** currencies to a personalized watchlist
- Group assets into **Popular Currencies** and **Cryptocurrencies**
- **Search** available assets dynamically
- Swipe to **delete** currencies
- Automatically **persist selections**

---

## 🧱 Architecture

The app is built using **Clean Swift (VIP)** architecture:

| Component     | Responsibility                                 |
|---------------|-------------------------------------------------|
| ViewController| Manages UI and user interaction                |
| Interactor    | Handles business logic                         |
| Presenter     | Transforms data into view-ready formats        |
| Router        | Manages scene transitions                      |
| Worker        | Executes API/network tasks                     |

The app also applies **Atomic Design** principles:

| Level      | Example                        |
|------------|--------------------------------|
| Atoms      | AHBLabel, CurrencyIconView     |
| Molecules  | AddAssetCell                   |
| Organisms  | AddAssetViewController         |

---

## 🔁 Networking

Exchange rate data is fetched from:

- `/live` endpoint: Real-time currency quotes
- `/change` endpoint: Daily change percentages

Responses are parsed into:

- `ExchangeRateAPIModel`
- `ChangeAPIModel`

---

## 💾 Data Persistence

User selection is stored locally using:

```swift
UserDefaultsManager.shared.selectedCurrencyCodes
- Ensures the list is persisted across launches
- Controlled by UserDefaultsManager.swift


## 💾 Data Persistence

| Feature                            | Details                              |
|-----------------------------------|--------------------------------------|
| Persistence Mechanism             | `UserDefaultsManager.swift`          |
| Key Used                          | `selectedCurrencyCodes`              |
| Purpose                           | Ensures list is persisted across launches |

---

## 💰 Currency Metadata

| Feature                     | Details                                              |
|----------------------------|------------------------------------------------------|
| Source File                | `CurrencyMetadata.swift`                             |
| Includes                   | Names and symbols for fiat and crypto currencies     |
| Exclusion Rule             | Currencies not in this list are excluded from display|
| Crypto Code List           | Defined in `let cryptoCodes: Set<String>`            |

---

## ✅ Assignment Requirements

| Requirement                           | Status |
|---------------------------------------|--------|
| Display exchange rates                | ✅     |
| Group currencies by type              | ✅     |
| Search through asset list             | ✅     |
| Add/remove assets                     | ✅     |
| Show change percentage                | ✅     |
| Clean Swift (VIP) architecture        | ✅     |
| Persistent selection (UserDefaults)   | ✅     |
| Atomic UI design                      | ✅     |

---

## 🚀 Getting Started

| Step                             | Instruction                          |
|----------------------------------|--------------------------------------|
| 1. Clone        `git clone https://github.com/Ahmad1717/AHBExchangeRate`|
| 2. Open                          | `AHBExchangeRate.xcodeproj` in Xcode |
| 3. Run                           | On simulator (iOS 14+)               |
| 4. Add API Token (optional)      | In `Environment.swift`               |

---

## 🛠 Technologies Used

| Tech          | Purpose                        |
|---------------|--------------------------------|
| Swift 5        | Programming language           |
| UIKit          | Interface building             |
| Alamofire      | Networking                     |
| UserDefaults   | Local persistence              |
| XIBs           | Component-based UI             |

---

## 🌱 Future Improvements

| Idea                              | Benefit                              |
|----------------------------------|--------------------------------------|
| Enable 5s auto-refresh            | Real-time rates (with premium token) |
| Offline caching                   | Reduce data usage & boost UX         |
| Localization (e.g., Arabic)       | Broader audience support             |
| Unit/UI tests                     | Improved reliability                 |
| Dark Mode support                 | Better user accessibility            |

