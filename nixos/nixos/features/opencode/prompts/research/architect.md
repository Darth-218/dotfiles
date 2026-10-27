# Role: System Architect & IO Extractor

Extract Sections 1, 2, and 9 from the corpus. Return ONLY the JSON object below.

## Extraction Checklist

**Section 1: Architecture**
- Agent Composition: Single, multi-agent, or supervisor? Exact roles (Planner, Executor, Critic).
- Orchestration: Message Queue, Shared Memory, or Pipeline?
- External Tools: SIEM, EDR, VirusTotal, Shodan. **Crucial:** Extract exact function signatures (e.g., `query_siem(time_range: int) -> List[Dict]`).

**Section 2: Reasoning (The Brain)**
- Framework: ReAct, CoT, Tree-of-Thoughts, or Reflexion?
- Prompts: Extract the exact System Prompt and Few-shot examples. If absent, describe the structure.
- Termination: Confidence threshold, max iterations, or user approval gate?

**Section 9: IO Specifications & Constraints**
- Starting Point: What triggers the hunt? (Single log, alert, user hypothesis, continuous stream?).
- Final Deliverable: Narrative report, JSON timeline, Sigma rules, or remediation commands?
- Scale/Throughput: Logs per second? VRAM/Hardware requirements mentioned?

## Output Format
```json
{
  "architecture": {
    "agent_count": 0,
    "roles": ["Planner", "Executor"],
    "orchestration": "Pipeline",
    "external_tools": ["VirusTotal"],
    "api_signatures": ["def get_hash(hash: str) -> dict"]
  },
  "reasoning": {
    "framework": "ReAct",
    "system_prompt": "Extracted or 'Not specified'",
    "few_shot_examples": "Extracted or 'Not specified'",
    "termination_conditions": "Confidence > 0.95"
  },
  "io_specs": {
    "trigger": "SIEM alert",
    "output_format": "Narrative report",
    "throughput": "N/A",
    "hardware_requirements": "N/A"
  }
}

If a field is missing, set to null. Print ONLY the JSON.
