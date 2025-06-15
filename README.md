# 🎫 EventContract - Ethereum Smart Contract for Event Ticketing

A Solidity-based smart contract that allows users to **create events**, **buy tickets**, and **transfer tickets** securely on the Ethereum blockchain.

---

## 🚀 Features

- ✅ **Create Events** with name, date, price, and ticket count
- ✅ **Buy Tickets** by sending Ether (only if the event is upcoming and enough tickets are available)
- ✅ **Transfer Tickets** to another user before the event date
- 🔒 Built-in checks for event validity, ticket availability, and payment accuracy

---

## 🛠️ Technologies Used

- **Solidity `>=0.5.0 <0.9.0`**
- Ethereum Blockchain
- [Remix IDE](https://remix.ethereum.org/) or Hardhat for testing
- Git & GitHub for version control

---

## 📄 Smart Contract Overview

### 🔧 `createEvent(string name, uint date, uint price, uint ticketcount)`

Creates a new event.

- `name`: Name of the event
- `date`: UNIX timestamp (must be in the future)
- `price`: Price per ticket (in **wei**)
- `ticketcount`: Total number of tickets

### 💸 `buyTicket(uint id, uint quantity)`

Buy a specified number of tickets for a given event ID by sending exact Ether.

- Checks:
  - Event exists and is upcoming
  - Sufficient tickets remaining
  - Ether sent = `price * quantity`

### 🔁 `transferTicket(uint id, uint quantity, address to)`

Transfer tickets from your address to another user.

- Checks:
  - You own enough tickets
  - Event is still upcoming

🛡️ Security Notes
Tickets can only be bought before the event date.

Users cannot transfer more tickets than they own.

Ether must match the total price exactly — no overpaying or underpaying allowed.

📚 License
This project is licensed under the MIT License.
Feel free to use, modify, and distribute it.

👤 Author
Inderjot Singh
