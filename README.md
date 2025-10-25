# 📡 LAN Reliability Modeling Project

**LAN Reliability Modeling Project** is a MATLAB-based exploration of network reliability, where I simulate the number of attempts needed to send messages (composed of K packets) through various network configurations. This project visualizes how single-link, two-series-link, two-parallel-link, compound, and custom compound networks perform under different failure probabilities.

This project offers an educational dive into network engineering concepts, with interactive simulations and detailed graphs using logarithmic y-axes.

---

## ✨ Features

- 📊 **Simulated Network Topologies** – Analyze single-link, series, parallel, compound, and custom networks in real time.
- 🔍 **Variable Failure Probabilities** – Test K values (1, 5, 15, 50, 100, and 1, 5, 10) with p from 0 to 0.99.
- 📈 **Detailed Graphs** – View calculated (solid lines) vs. simulated (hollow circles) results with logarithmic y-axes.
- ⚙️ **1000 Iterations** – Ensures reliable averages for each simulation.
- 📝 **Educational Focus** – Designed to help learners grasp network reliability through visualization.

---

## 🛠️ Technology Stack

- **Language/Environment:** [MATLAB](https://www.mathworks.com/)
- **Version Control:** [Git](https://git-scm.com/)

---

## 🚀 Getting Started

### Prerequisites

- [MATLAB](https://www.mathworks.com/products/matlab.html) (any recent version)

### Installation & Running

Instructions to Run:
1. Open Matlab and go to new -> project -> from Git 

2. Clone the repository: https://github.com/RobertBurkeEagle/Network-Reliability-Modeling-Project.git

3. After that the project will open and you can begin running the models

## 📂 Project Structure

- runSingleLinkSim.m: Simulates a single-link network.
- runTwoSeriesLinkSim.m: Simulates a two-series-link network.
- runTwoParallelLinkSim.m: Simulates a two-parallel-link network.
- runCompoundNetworkSim.m: Simulates a compound network.
- runCustomCompoundNetworkSim.m: Simulates a custom compound network with per-link probabilities.
- Program files (e.g., singleLinkNetworkSim.m, twoLinkNetworkSim.m, etc.): Generate output figures with comments for clarity.

### 🖼️ Screenshots

![SingleLinkSimComboGraph](https://github.com/user-attachments/assets/1ee39168-b7a8-4464-a9e2-ce9f3ea0d191) ![CompoundComboGraph](https://github.com/user-attachments/assets/9124b8f1-57ac-4d56-931a-7efca33b78b4)


👤 Author
Robert Burke

Oklahoma Christian University
