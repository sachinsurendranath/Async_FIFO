# Asynchronous FIFO using Gray Code Counters

📄 For detailed documentation, please refer to:  
- `Asynchronous_FIFO_using_Gray_Code_Counters.pdf`

---

## 🔑 Project Overview
This project implements an **Asynchronous FIFO** designed using **Gray Code Counters** and dual flip-flop synchronizers to ensure safe clock-domain crossing.

### Key Features
- **Asynchronous Operation**: Separate write (64 MHz) and read (32 MHz) clock domains.  
- **16-bit Data Width** with burst size up to 128.  
- **FIFO Depth = 64** (power of two chosen for Gray-code synchronization).  
- **Dual-Flop Synchronizers** to safely transfer read and write pointers across clock domains.  
- **Gray-Code Counters** ensure only one bit changes per transition, minimizing metastability issues.  
- **Full & Empty Conditions** derived using Gray-coded pointers.  
- **Verilog Implementation & Testbench** for functional and gate-level verification.  

---

## 📐 Design Highlights
- **Meta-stability Handling**: Achieved through synchronizers at the pointer boundaries.  
- **Pointer Logic**:
  - Binary counter for memory addressing.  
  - Binary-to-Gray conversion for synchronization.  
- **Full Condition**: Write pointer wrapped around and caught up with the read pointer.  
- **Empty Condition**: Read pointer caught up with the write pointer.  

---

## 🧪 Verification
- Simulated in **Vivado** with gate-level verification.  
- Verified with:
  - **Write bursts of 50 @ 50 MHz**  
  - **Read operations @ 10 MHz**  
- FIFO was observed to:
  - Never overflow for the given burst.  
  - Correctly empty once all data was read out.  

---

## 📂 Repository Link
The project source is hosted at:  
👉 [Async_FIFO GitHub Repository](https://github.com/sachinsurendranath/Async_FIFO.git)

---

## 📧 Author
**Sachin Krishna K S** 
M.Tech (ICS), IIT Bombay
