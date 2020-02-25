import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("timings.csv", sep=',')
clh = []
lamports = []
anderson = []
threads = []
for i in range(0, 5):
	clh.append(df.Time[i])
	threads.append(df.Threads[i])
for i in range(5, 10):
	lamports.append(df.Time[i])
for i in range(10, 15):
	anderson.append(df.Time[i])


plt.figure(figsize=(12,7))
plt.plot(threads, clh, label='CLH Lock')
plt.scatter(threads, clh)
plt.plot(threads, lamports, label = 'Lamports Mutex')
plt.scatter(threads, lamports)
plt.plot(threads, anderson, label = "Anderson's Lock")
plt.scatter(threads, anderson)
plt.xlabel('Number of Threads')
plt.ylabel("Time [ns]")
plt.legend(loc = 'upperleft')
plt.show()


# import pandas as pd
# import matplotlib.pyplot as plt
# import seaborn as sns
# import sys

# if len(sys.argv) != 3:
#     sys.exit("ERROR: " + sys.argv[0] + " file_name + output_file")

# csv_file = sys.argv[1]
# output_file = sys.argv[2]
# df = pd.read_csv(csv_file)

# lp = sns.lineplot(x="Threads", y="Time", hue="Method", style="Method",
#                     markers=True, dashes=False, data=df)

# lp.set(ylabel="Time [ns]")
# plot = lp.get_figure()
# plot.savefig(output_file)