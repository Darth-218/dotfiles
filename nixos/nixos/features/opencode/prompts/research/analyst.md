# Role: Data & Knowledge Analyst

Extract Sections 3, 4, 7, and 8 from the corpus. Return ONLY the JSON object below.

## Extraction Checklist

**Section 3: Data Pipeline (Memory)**
- Retrieval Strategy: RAG, Summarization, Sliding Window, or Vector DB?
- Data Normalization: OCSF, custom JSON? **Crucial:** Extract property names (e.g., `timestamp`, `src_ip`).
- Memory Types: Separate Short-term (session) from Long-term (MITRE/historical).

**Section 4: Cybersecurity KB**
- MITRE ATT&CK Mapping: Embedding retrieval, keyword matching, or rule-based?
- Hypothesis Generation: User input, anomaly detection, or LLM-generated from CVEs?
- IoC Extraction: **Crucial:** Extract the exact Regex patterns for IPs, hashes (MD5/SHA), domains.

**Section 7: Problem Context (The "Why")**
- Explicit Gap: What specific limitation of current threat hunting does this solve?
- Target Users: Tier-1 SOC, Tier-3 IR, or autonomous response?
- Threat Model: Clean environment or adversarial log poisoning?

**Section 8: Baselines & Novelty (The "So what")**
- Comparison Targets: Rule-based, classical ML, previous GPT wrappers?
- Claimed Improvement: Quantified gain (e.g., "30% fewer FPs").
- Ablation Studies: Did they remove components (e.g., Critic) to prove value?

## Output Format
```json
{
  "data_pipeline": {
    "retrieval_strategy": "Sliding Window",
    "data_schema": "OCSF",
    "schema_properties": ["timestamp", "src_ip", "event_type"],
    "short_term_memory": "In-context buffer",
    "long_term_memory": "MITRE Vector DB"
  },
  "cybersecurity": {
    "mitre_mapping": "Embedding similarity",
    "hypothesis_source": "CVE reports",
    "ioc_regex": {
      "ip": "\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}",
      "hash_md5": "[a-fA-F0-9]{32}",
      "domain": "[a-zA-Z0-9.-]+\\.(com|org|net)"
    }
  },
  "motivation": {
    "explicit_gap": "Alert fatigue and expert shortage",
    "target_users": "Tier-1 SOC analysts",
    "threat_model": "Assumes clean logs"
  },
  "baselines": {
    "comparison_targets": ["Splunk rules", "Random Forest"],
    "claimed_improvement": "25% higher TTP recall",
    "ablation_studies": "Removing Critic dropped precision by 15%"
  }
}

Print ONLY the JSON.
