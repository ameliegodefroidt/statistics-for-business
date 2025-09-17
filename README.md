# Statistics for Business – Interactive Tools

This repository contains a set of **interactive apps and resources** to support the *Statistics for Business* course at IESEG School of Management.  

The aim is to complement lecture slides with hands-on tools that let students **explore data, visualize patterns, and understand key statistical concepts interactively**.

######## ⚠️ _Note: all plots update in real time as new data is entered, but data is anonymous and not saved permanently — once the app is restarted, all entries are lost._

##### 📂 Repository Structure

```text
statistics-for-business/
│
├── variability/app.R     # App on measures of variability
├── distributions/app.R   # App on distributions (normal, skewed, discrete)
├── correlation/app.R     # App on correlation
├── README.md             # Repository overview (this file)
```


-----

#### 🚀 App 1: Variability (work-in-progress)

This app introduces measures of **spread in data**:
- Range, variance, and standard deviation  
- How spread changes when outliers are present  
- Visual comparisons of datasets with the same mean but different variability  

**Learning goal:** understand how different measures capture variation around the mean and why variability matters in business decisions.


---

#### 🚀 App 2: Distributions

Students can enter their own values for three variables:
- Height (cm)
- Minutes spent on social media yesterday 
- Number of siblings

The app produces:
- A histogram of heights (with optional normal curve overlay)  
- A histogram of social media usage (to highlight skewness)  
- A bar chart of siblings (to highlight a discrete, non-normal distribution)  

**Learning goal:** recognize that some variables follow a normal distribution while others follow very different patterns.

- Height (cm) → continuous, usually bell-shaped ≈ normal  
- Minutes spent on social media yesterday → continuous, often right-skewed  
- Number of siblings → discrete, skewed count data


---

#### 🚀 App 3: Correlation (work-in-progress)

Students enter paired data (e.g., study hours vs exam grades). The app shows:
- A scatterplot of their data  
- The correlation coefficient  
- An optional line of best fit  

**Learning goal:** explore how correlation captures the strength and direction of relationships between two variables.

---

## 👩‍🏫 Instructor

This repository is maintained by **[Amélie Godefroidt]**, instructor of *Statistics for Business* at **IESEG School of Management**.  

The aim is to make statistics more **interactive, intuitive, and engaging** by letting students experiment with data themselves.
