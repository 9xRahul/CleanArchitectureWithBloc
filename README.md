🛒 Flutter Clean Architecture E-Commerce App

A modern Flutter e-commerce application built using Clean Architecture and BLoC to demonstrate scalable, maintainable, and production-ready app development practices.

🚀 Features
🔐 Authentication

User login with API

Secure token storage

Authorized API requests

Manual logout support

🏪 Products

Fetch all products from API

Grid-based product listing

Category-based filtering

Product search functionality

API result caching to reduce unnecessary calls

🧭 Categories

Horizontal scrollable category bar

“All” category support

Category selection handled using BLoC

Dynamic product reload on category change

🔍 Search

Real-time product search

Integrated with existing product repository, models, and entities

📄 Product Details

Image gallery

Price & discount display

Rating & stock information

Description

Brand, category, SKU

Dimensions, warranty & shipping info

Tags

Reviews

Meta data (barcode & QR code)

👤 Profile

Fetch logged-in user profile

Display essential user information

Logout functionality

🧠 Architecture Highlights

Clean Architecture (Presentation / Domain / Data / Core)

BLoC for state management

Repository pattern

Use cases for business logic

Mapper classes for model → entity conversion

Feature-based modular structure

Dio for networking

Secure local storage for tokens

🛡 Security

Tokens stored securely

Authorization headers added to protected API calls

Session cleared on logout

⚙ Tech Stack

Flutter

Dart

BLoC

Dio

Clean Architecture

Flutter Secure Storage

DummyJSON API

🎯 Purpose

This project is intended to:

Demonstrate clean architectural design in Flutter

Show scalable state management using BLoC

Implement real-world API handling

Serve as a reference for production-ready Flutter applications

📌 Notes

Uses DummyJSON as backend API

Designed to be easily extendable (cart, orders, payments, etc.)

📜 License

This project is open-source and available for learning and personal use.