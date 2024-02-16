import numpy as np
from scipy import stats

def find_crossings(y_values, target_value):
    crossings = []
    for i in range(1, len(y_values)):
        if (y_values[i-1] < target_value and y_values[i] > target_value) or \
           (y_values[i-1] > target_value and y_values[i] < target_value):
            crossings.append(i)
    return crossings

def autocorrelation(y_values):
    ytilde = y_values - np.mean(y_values)
    a = np.correlate(ytilde, ytilde, 'full')
    a = a[a.size//2:]
    a /= np.max(a)
    return a

def eff_sample_size(y_values):
    a=autocorrelation(y_values)
    taus = find_crossings(a, np.exp(-1))
    # assert len(taus)==1, 'taus has {} elements'.format(len(taus))
    tau = taus[0]
    return len(y_values)//tau

def ttest(mean1, mean2, std1, std2, n1, n2):

    # Calculate pooled standard deviation
    pooled_std = np.sqrt(((n1 - 1) * std1 ** 2 + (n2 - 1) * std2 ** 2) / (n1 + n2 - 2))

    # Calculate t-statistic
    t_statistic = (mean1 - mean2) / (pooled_std * np.sqrt(1/n1 + 1/n2))

    # Calculate degrees of freedom
    df = n1 + n2 - 2

    # Calculate p-value using cumulative distribution function (CDF)
    p_value = 2 * (1 - stats.t.cdf(np.abs(t_statistic), df))

    return t_statistic, p_value

def ttest_error(std, n, alpha):

    t_critical = stats.t.ppf((2-alpha) / 2, n-1)
    return t_critical * (std / np.sqrt(n))