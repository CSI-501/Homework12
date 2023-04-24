import matplotlib.pyplot as plt

# Plot first two simultations

files = ['simulation1.txt', 'simulation2.txt']

plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

# Read through all our files
for file in files:
    fileread = open(file, 'r')
    lines = fileread.readlines()

    x = []
    y = []
    for line in lines:
        row = line.strip().split()
        x.append(float(row[1]))
        y.append(float(row[2]))

    # Plot the data for that estimation.
    plt.plot(x, y)

plt.plot(0, 0, marker="o", markersize=20, markeredgecolor="black", markerfacecolor="green")

plt.title('Plot of Orbital Simulation')
plt.xlabel('X')
plt.ylabel('Y')
plt.legend(['simulation1', 'simulation2'])
plt.savefig('orbital_sim')


# Plot second two simulations

files = ['simulation3.txt', 'simulation4.txt']

plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

# Read through all our files
for file in files:
    fileread = open(file, 'r')
    lines = fileread.readlines()

    x = []
    y = []
    for line in lines:
        row = line.strip().split()
        x.append(float(row[1]))
        y.append(float(row[2]))

    # Plot the data for that estimation.
    plt.plot(x, y)

plt.plot(0, 0, marker="o", markersize=20, markeredgecolor="black", markerfacecolor="green")

plt.title('Plot of Orbital Simulation')
plt.xlabel('X')
plt.ylabel('Y')
plt.legend(['simulation3', 'simulation4'])
plt.savefig('orbital_sim2')


# Plot energy levels of third run.
plt.style.use('seaborn-v0_8-whitegrid')
plt.figure(figsize=(15,10))

file = 'simulation3.txt'

fileread = open(file, 'r')
lines = fileread.readlines()

time = []
kinE = []
potE = []
totE = []
for line in lines:
    row = line.strip().split()
    time.append(float(row[0]))
    kinE.append(float(row[3]))
    potE.append(float(row[4]))
    totE.append(float(row[5]))

# Plot the data for that estimation.
plt.plot(time, kinE)
plt.plot(time, potE)
plt.plot(time, totE)
plt.legend(['Kinetic Energy', 'Potential Energy', 'Total Energy'])

plt.title('Plot of Time vs Energy')
plt.xlabel('Time')
plt.ylabel('Energy')
plt.savefig('orbital_sim3')

plt.ylim(-0.2, -0.1)
plt.savefig('orbital_sim4')
