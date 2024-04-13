---
theme: seriph
background: /background.jpg
title: Drift in Machine Learning
info: |
  Review on drift in machine learning
  By Elahe Dastan
class: text-center
highlighter: shiki
drawings:
  persist: false
transition: slide-left
mdc: true
favicon: "https://github.com/1995parham-me.png"
layout: cover
hideInToc: true
---

# Review on drift in machine learning

By Elahe Dastan

<div class="abs-br m-6 flex">
  <a href="https://github.com/1995parham-learning/drift-in-ml" target="_blank" alt="GitHub" title="Open in GitHub"
    class="text-xl slidev-icon-btn opacity-50 !border-none !hover:text-white">
    <carbon-logo-github />
  </a>
</div>

---

## Drift

Different types of issues that can cause our model's performance to decay (**model drift**).

<p class="text-center">
<q>Drift is a key issue because machine learning often relies on a key assumption: <em>the past == the future</em>.</q>
</p>

<div class="flex flex-row">
    <img alt="data-drift" src="/data-drift.webp" class="rounded shadow h-60 basis-1/4" />
    <div class="basis-1/2" ></div>
    <img alt="feature-drift" src="/feature-drift.png" class="rounded shadow h-60 basis-1/4" />
</div>

---

## Data drift

**Data drift**, also known as feature drift or covariate shift, occurs when the **distribution** of
the _production data_ is different from the _training data_.

The actual cause of drift can be attributed:

- Natural changes in the real-world
- Systemic issues such as:
  - Missing data
  - Pipeline errors
  - Schema changes
  - etc.

It's important to inspect the drifted data and trace it back along its pipeline
to identify when and where the drift was introduced.

---

## Target drift

Besides just the input data changing, as with data drift, we can also experience drift in our outcomes.
This can be:

- A shift in the distributions
- Removal or addition of new classes with categorical tasks

Though _retraining can mitigate the performance decay caused target drift_, it can often be avoided with proper
**inter-pipeline communication** about new classes, schema changes, etc.

> Re-training data can lead to model drift. This can be mitigated by enabling inter-pipeline communication
> for new classes, schema changes, and similar updates.

---

## Concept drift

Besides the input and output data drifting, we can have **the actual relationship between them drift as well**.
This concept drift renders our model ineffective because the patterns it learned to _map between the original
inputs and outputs are no longer relevant_. Concept drift can be something that occurs in various patterns:

- Gradually over a period of time
- Abruptly as a result of an external event
- Periodically as a result of recurring event

<img src="/concept-drift.png" alt="concept-drift" class="mx-auto h-60" />

---

## Identifying drift

The standard approach to identifying drift is to **measure model performance (accuracy or otherwise)**
or to _examine or measure differences in training and deployment distributions_ of:

- Predicted outputs
- Ground truth
- Individual input features
- Joint input features

However, in practice they have serious challenges that make measuring drift a hard problem.

- Curse of dimensionality
- Lack of ground truth
- Inconsequential drift

---

## Locating drift

- **Reference window**: the set of points to compare production data distributions with to identify drift.
- **Test window**: the set of points to compare with the reference window to determine if drift has occurred.

Since we're dealing with online drift detection (i.e. detecting drift in live production
data as opposed to past batch data),
we can employ either a _fixed or sliding window_ approach to identify our set of points for comparison.

<img src="/detecting-changes-using-a-sliding-reference-window.png"
alt="detecting-changes-using-a-sliding-reference-window" />

Detecting changes using a sliding reference window.
Change occurs at time `t` if the **reference window** is statistically different from the **test window**.

---

## SciKit MultiFlow

<img src="/skmultiflow-logo-wide.svg" alt="skmultiflow-logo-wide" class="bg-white mx-auto" />

> A machine learning package for streaming data in Python

<img src="/scikit-multiflow_map.png" alt="scikit-multiflow_map" class="mx-auto" />

---

## Why logs?

`whylogs` is an open source library for logging any kind of data. With `whylogs`, users are able
to generate summaries of their datasets (called `whylogs` profiles) which they can use to:

1. Track changes in their dataset
2. Create data constraints to know whether their data looks the way it should
3. Quickly visualize key summary statistics about their datasets

These three functionalities enable a variety of use cases for data scientists,
machine learning engineers, and data engineers:

- Detect data drift in model input features
- Detect training-serving skew, concept drift, and model performance degradation
- Validate data quality in model inputs or in a data pipeline
- Perform exploratory data analysis of massive datasets
- Track data distributions & data quality for ML experiments
- Enable data auditing and governance across the organization
- Standardize data documentation practices across the organization

---

## Why logs? (Cont'd)

WhyLabs is a managed service offering built for helping users make the most of their `whylogs` profiles.
With WhyLabs, users can ingest profiles and set up automated monitoring as well as gain full observability
into their data and ML systems. With WhyLabs, users can ensure the reliability of their data and models,
and debug any problems that arise with them.

<img src="/flask_whylogs_whylabs_flow.jpeg" alt="/flask_whylogs_whylabs_flow" class="mx-auto h-60" />

---

## Kolmogorov-Smirnov (K-S) test

The Kolmogorov-Smirnov (K-S) test is a non-parametric statistical test that is used to determine whether two
sets of data come from the same distribution.
It is often used to test whether a sample of data comes from a specific population or
to compare two samples to determine if they come from the same population.

The null hypothesis in this test is that the distributions are the same.
If this hypothesis is rejected, it suggests that there is a drift in the model.

The K-S test is a useful tool for comparing datasets and determining whether they come from the same distribution.
