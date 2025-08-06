# Acme Widget Co

A Ruby implementation of a shopping basket with products, delivery charge rules and special offers.

## Features

- Product catalogue management
- Configurable delivery charge rules
- Special offer/discount system
- Item addition/removal and total calculation

## Assumptions

- The system assumes infinite product availability - no inventory checks are performed.
- Offers are only applied to multiple quantities of the same product.
- Delivery charges are calculated based solely on the subtotal.
- All product prices are positive non-zero values
- Single currency system (no conversion)

## Installation

1. Ensure you have Ruby installed (version 2.7+ recommended)
2. Clone this repository

## Usage

Run below command to verify all scenarios. 
```
ruby runner.rb
```
