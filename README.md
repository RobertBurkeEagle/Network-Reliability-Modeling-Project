**LAN Reliability Modeling Project**
Welcome to my LAN Reliability Modeling Project! This repository contains MATLAB code for a network engineering project where I explored how many attempts are needed to send messages (made up of K packets) through various network setups, including single-link, two-series-link, two-parallel-link, compound, and custom compound networks with varying failure probabilities. I ran simulations for K values (1, 5, 15, 50, 100 and 1, 5, 10) and failure probabilities from 0 to 0.99, with 1000 iterations each, generating graphs with logarithmic y-axes for clarity.
What’s Inside

runSingleLinkSim.m: Simulates a single-link network.
runTwoSeriesLinkSim.m: Simulates a two-series-link network.
runTwoParallelLinkSim.m: Simulates a two-parallel-link network.
runCompoundNetworkSim.m: Simulates a compound network.
runCustomCompoundNetworkSim.m: Simulates a custom compound network with per-link probabilities.
Program files (e.g., singleLinkNetworkSim.m, twoLinkNetworkSim.m, etc.): Generate the required output figures.

How to Use

Open MATLAB and go to New -> Project -> From Git.
Clone this repository: https://github.com/RobertBurkeEagle/Network-Reliability-Modeling-Project.git.
Once the project opens, run the program files (e.g., singleLinkNetworkSim.m) to generate the graphs. Ensure all function files are in your MATLAB path.

Feel free to explore the code, which includes comments for clarity, and check out the accompanying report for details on the simulations and results!
