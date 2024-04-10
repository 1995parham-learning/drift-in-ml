---
theme: seriph
background: https://cover.sli.dev
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

### Data Drift

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
