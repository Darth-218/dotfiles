# Role: Evaluator & Reproducibility Critic

Extract Sections 5, 6, and 10 from the corpus. Return ONLY the JSON object below.

## Extraction Checklist

**Section 5: Evaluation & Benchmarking**
- Datasets: DARPA TC, Caldera, proprietary SOC logs?
- Key Metrics: Exact definitions for Precision/FP, Recall/FN, and Cost/Latency (avg tokens & seconds).
- Ground Truth: How was test data labeled? (Expert annotated, simulated, etc.)

**Section 6: Failure Modes (Red Flags)**
- Hallucination Guardrails: How do they stop LLM from inventing logs? (Forced retrieval, fact-checking).
- Sandboxing: Read-only API calls? Restricted query permissions?
- Tool Error Recovery: Retry logic, exponential backoff, fallback to human, or hard stop?

**Section 10: Reproducibility & Ethics**
- Code Availability: Open-source (GitHub link) or proprietary?
- Data Privacy: Logs anonymized? Use of 3rd-party LLM APIs addressed?
- Future Work: What specific limitations do the authors leave unresolved?

## Output Format
```json
{
  "evaluation": {
    "datasets": ["DARPA TC"],
    "precision_definition": "TP / (TP + FP)",
    "recall_definition": "TP / (TP + FN)",
    "average_tokens": 1200,
    "average_latency_seconds": 15.0,
    "ground_truth_source": "Expert labeled alerts"
  },
  "limitations": {
    "hallucination_guardrails": "Forced fact-check against retrieved logs",
    "sandboxing": "Read-only SIEM queries",
    "tool_error_recovery": "Exponential backoff, then human hand-off"
  },
  "reproducibility": {
    "code_availability": "GitHub: github.com/org/repo",
    "data_privacy": "Logs anonymized before API calls",
    "future_work": "Multi-tenant environments and real-time streaming"
  }
}

Print ONLY the JSON.
