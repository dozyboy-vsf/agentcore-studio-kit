---
id: studio.umbrella-contract
type: architecture-contract
status: draft
created: 2026-07-17
set: agentcore-studio
title: Mini-Studio Xưởng Create→Test→Trust — kiến trúc lõi + integration contract
  4 quadrant
---

# MINI-STUDIO XƯỞNG CREATE→TEST→TRUST — UMBRELLA CONTRACT
### Kiến trúc lõi chung 4 người xây · engine|recipe boundary · 4 schema contract · thứ tự ghép · mock boundary

> **Hợp đồng đọc:** đây là **HIẾN PHÁP kỹ thuật** của AgentCore Studio. Integration CHỈ qua **4 contract §3**.
> Contract **freeze cuối S1** (INV-5); đổi = **mini-RFC + 4/4 chữ ký** + ghi decision-log. Weekly
> integration-demo thứ 6 là evidence D1·Team. Mọi schema dưới đây là **hình dạng tối thiểu** —
> writer role-track chi tiết hoá field, KHÔNG đổi tên/nghĩa khoá đã freeze.
> **§2 là bảng ownership CANONICAL** — mọi expander đọc file này làm chuẩn.

---

## §1. Kiến trúc lõi — engine | recipe boundary made literal

**Recipe PTSP (khai báo, zero code):** `agent-config` + `DAG` + `kb-binding` + `golden-set` + `ngưỡng scorecard`.
**Engine PTNT (build một lần):** `schema/validator` + `interpreter` + `fence (chặn rò rỉ tại tầng truy xuất)` + `trace` + `gate`.

```
        recipe (PTSP — khai báo qua Workbench UI, ZERO code lõi)
   agent-config · DAG(6-node) · kb-binding · golden-set · scorecard-threshold
                              │
        ┌─────────────────────▼───────────────────────────────┐
        │   WORKBENCH UI (SWE):  form tạo agent + canvas       │
        │   palette 6-node + test-playground + publish flow    │
        │   recipe schema/validator/graph-lint + INV-1 wall    │
        └───────┬───────────────────────────────┬─────────────┘
                │ recipe (validated)             │ Publish? ──► eval-gate (AIE-2)
                ▼                                 │              PASS→named endpoint
        ┌───────────────────────────────┐        │              FAIL→block+rollback
        │  INTERPRETER MINI (AIE-1)      │        │
        │  6 node-type executor đóng:    │──emit─►│  trace sink (DE)  ──► cost dashboard
        │  kb-retrieve·llm-step·         │        │  (event/node/token/cost)   (3 surface,
        │  condition·tool-call·          │        │                             cùng 1 số)
        │  hitl-pause·end                │        │
        └───┬───────────────┬───────────┘        │
            │ kb-retrieve    │ llm-step/embed     │
            ▼                ▼                     │
   ┌─────────────────────┐  ┌──────────────────┐  │
   │  FENCED-KB (DE)     │  │ EmbeddingService │  │      ┌──────────────────────┐
   │  ingest→chunk→embed │  │ Protocol 2-impl  │  │      │ EVAL HARNESS (AIE-2) │
   │  →index per-tenant  │  │ (stub + gateway) │  │◄─────│ LLM-judge + scorecard│
   │  permission filter  │  └──────────────────┘  │      │ agreement-check      │
   │  TẠI RETRIEVAL      │  gateway-stub client   │      │ golden-set (từ DE)   │
   │  fail-closed·cited  │  (client_id per        │      └──────────────────────┘
   │  leakage=0          │   agent×env, K1/K2)    │
   └─────────────────────┘                        │
```

**6 node-type đóng (cap cứng — CẤM thêm):**

| Node-type | Vai | Hành vi | Owner chính |
|---|---|---|---|
| **`kb-retrieve`** | Truy hồi tri thức | Gọi `kb.search` per-tenant; **permission filter tại retrieval** fail-closed; trả cited chunks | AIE-1 (executor) / DE (kb.search) |
| **`llm-step`** | 1 bước LLM | Qua gateway-stub client (client_id per agent×env); embed/complete via EmbeddingService | AIE-1 |
| **`condition`** | Rẽ nhánh có điều kiện | Branch theo output (vd verdict/score) | AIE-1 / SWE |
| **`tool-call`** | Gọi tool stub whitelist | Dispatch theo config; tool-perm whitelist per recipe (rule-verdict / matching) | AIE-1 / SWE |
| **`hitl-pause`** | Dừng-chờ-người first-class | Flow pause trong playground → external approval → resume (INV-2) | SWE |
| **`end`** | Kết flow | Emit trace cuối + result | AIE-1 |

> Ghi chú thuật ngữ: canvas vẽ **DAG 3-node lõi demo** (`kb-retrieve → llm-step → condition → tool-call`) từ palette 6-node đóng. `hitl-pause` + `end` là node điều khiển. CẤM node ngoài 6 loại; CẤM DSL turing-complete.

**Fence luật cứng (INV-1 / DEC-E9):** permission filter nằm **TẠI RETRIEVAL** (chunk-level, cột `tenant_id`/`section_role` NOT NULL + mandatory filter fail-closed) — **KHÔNG** được nhờ LLM "đừng nói". Hỏi câu đáp án chỉ có ở KB Tenant-Y (khi đang scope Tenant-X) → **refusal + audit**, không hallucinate. Leak-test T1 IDOR + T6 label-spoof xanh CI; **leakage=0** là AC cứng.

---

## §2. Bảng "mảnh nào của ai" (OWNERSHIP CANONICAL — mỗi trainee own 1 quadrant)

> **BẢNG NÀY LÀ CHUẨN.** Mọi expander (sprint-writer, role-track, mentor-playbook) đọc §2 làm nguồn-sự-thật ownership. Ghi CHÍNH XÁC theo catalog bộ đề AgentCore Studio.

| Quadrant | Owner | Deliverable chấm độc lập được | Bút hợp đồng |
|---|---|---|---|
| **KB pipeline** (doc-factory + ground-truth annotation, chunk/embed/index/fence-data, consent-purge, re-index idempotent) **+ obs/eval data** (trace sink, cost table, golden-set từ chính doc-factory — 1 script 2 deliverable) | **DE** *(FLAGSHIP kép — lát rộng nhất mọi set)* | KB per-tenant có fence-data + trace sink + cost table + golden-set có nhãn (1 doc-factory nuôi cả KB lẫn golden-set) | **trace-event schema** + **`kb.search` API** |
| **Workbench UI** (form + canvas) + recipe schema/validator/graph-lint + publish flow + **INV-1 Tenant-Wall** | **SWE** | Form tạo agent + canvas 6-node + validator + publish qua eval-gate (cổng kiểm định chặn publish) + INV-1 leak-test xanh | **recipe schema** |
| **Interpreter + node executors** + retrieval quality (chunking×embedding trade-off có số) qua gateway | **AIE-1** | Interpreter mini chạy DAG 6-node + executor đầy đủ + số đo chunking×embedding trade-off | tiêu thụ `kb.search` + EmbeddingService Protocol |
| **Eval harness + LLM-judge** (agreement-check vs nhãn tay, cap ≤100 call/ngày, cache) + playground trace UX | **AIE-2** | Eval harness + scorecard + judge-agreement vs nhãn tay + eval-gate chặn + playground trace UX | **scorecard format** |

**Nguyên tắc:** mỗi quadrant **một owner duy nhất**; cộng tác qua contract + PR review, không "làm chung một file". **DE double-flagship** (KB + eval-data) là lát rộng nhất — bù cho mỗi cell nông hơn set chuyên sâu (charter §5 HONEST note).

---

## §3. Integration contract — 4 SCHEMA FREEZE CUỐI S1 (xương sống)

> **Luật:** integration CHỈ qua 4 contract dưới. Freeze cuối S1 (contract-negotiation workshop D11 → freeze).
> Đổi bất kỳ contract nào = **mini-RFC + 4/4 chữ ký** + decision-log. Weekly integration-demo thứ 6.

### 3.1 Contract #1 — recipe schema (**SWE bút**)

```yaml
recipe:                          # PTSP khai báo qua Workbench, zero code lõi
  agent_id: str
  tenant: str                    # scope tenant (ankor|borea)
  agent_config:
    instructions: str            # sửa tệ đi → eval-gate CHẶN (demo bước 7)
    model: str                   # provider whitelist + default
    tool_whitelist: [str]        # tool-perm: chỉ tool trong list (rule-verdict|matching)
  dag:                           # canvas → 6-node đóng
    nodes: [{id, type, params}]  # type ∈ {kb-retrieve,llm-step,condition,tool-call,hitl-pause,end}
    edges: [{from, to, when?}]
  kb_binding: {kb_id, scope}     # scope = tenant/section (role→KB section)
  golden_set_ref: str            # trỏ golden-set (AIE-2 dùng eval)
  scorecard_threshold: {success: float, citation_accuracy: float}  # ngưỡng gate
```
- **graph-lint (SWE):** DAG hợp lệ (node ∈ 6 loại, không chu trình cấm, edge có đích), tool ∈ whitelist. Recipe không qua validator = không interpret.

### 3.2 Contract #2 — trace-event schema (**DE bút**)

```yaml
trace_event:
  event_id: str
  run_id: str
  agent_id: str
  tenant: str                    # tenant_id NOT NULL (INV-1)
  node_id: str
  node_type: str                 # ∈ 6 loại
  ts: iso8601                    # monotonic trong run
  inputs_hash: str
  outputs: obj
  tokens: {prompt, completion}   # nguồn cost-lineage
  cost: float                    # CÙNG 1 số chảy ra 3 surface (UI test → trace → dashboard)
  citations: [chunk_id]?         # từ kb-retrieve (cited answer)
```
- **Cost-lineage invariant:** `cost` ở UI test == trace == dashboard (cùng nguồn, cùng số). Lệch = fail (điểm sư phạm riêng AgentCore Studio).
- **Ordering:** event trong 1 run monotonic `ts`; trace viewer render timeline từng node.

### 3.3 Contract #3 — `kb.search` API (**DE bút**)

```
kb.search(query, tenant, section_roles, top_k) -> [ {chunk_id, text, score, tenant, section_role} ]
```
- **Permission filter TẠI RETRIEVAL (INV-1 / DEC-E9):** filter theo `{tenant, section_role}` **trước khi** trả chunk — fail-closed. `section_roles` resolve **server-side** từ session_id; client tự khai = bị bỏ qua (chống T6 label-spoof). Chunk không khớp scope → KHÔNG bao giờ ra khỏi hàm. **CẤM** trả hết rồi nhờ LLM lọc.
- **Cited answer:** mọi chunk trả về mang `chunk_id` → llm-step trích dẫn → citation-accuracy chấm được. **leakage=0** (leak-test T1/T6).

### 3.4 Contract #4 — scorecard format (**AIE-2 bút**)

```yaml
scorecard:
  agent_id: str
  golden_set_ref: str            # 30 golden case (từ doc-factory DE)
  results:
    - {case_id, expected, actual, success: bool, citation_accuracy: float, judge: {label, agreement}}
  aggregate: {success_rate: float, citation_accuracy: float}
  gate: {threshold: {...}, verdict: PASS|FAIL}   # verdict FAIL → publish bị CHẶN + rollback
```
- **Eval-gate (INV-6):** `verdict` là **cổng cứng** cho Publish — FAIL → chặn + rollback version (demo bước 7). Không phải cảnh báo suông.
- **LLM-judge:** cap **≤100 call/ngày** + cache; **agreement-check vs nhãn tay** (đo judge có đáng tin). Descope-guard: judge → **exact-match** scorer (INV-7 nấc 3), scorecard vẫn PASS/FAIL bằng success + citation.

### 3.5 EmbeddingService Protocol (AIE-1 tiêu thụ — không phải 1 trong 4 freeze-contract, nhưng là seam bắt buộc)

```
EmbeddingService.embed(texts) -> [vector]     # 2 impl: stub local (fixtures) + gateway
```
- **Fixtures-first (INV-4 / DEC-E5):** CI chạy 100% recorded fixtures; gateway thật (Phase-2) là **tùy chọn** khi có ZTNA + credential + quota (K1/K2) — **không đổi Protocol**, không chặn Phase-1. AC không phụ thuộc IQ của LLM — chấm pipeline/fence/trace/gate.

### 3.6 Recipe surface (PTSP, zero-code)

| Khai báo | Nội dung | Đổi → đổi gì |
|---|---|---|
| `agent_config.instructions` | Chỉ dẫn agent | Sửa tệ đi → eval-gate CHẶN (demo bước 7) |
| `dag` (canvas) | Chuỗi node (6-type) + edge | Đổi luồng authoring |
| `kb_binding.scope` | tenant/section | Đổi phạm vi tri thức (role→KB section) |
| `scorecard_threshold` | ngưỡng success/citation | Đổi độ khắt khe gate |

---

## §4. Transport / storage ladder (SQLite → thật)

| Nấc | Khi nào | Cơ chế | Ghi chú |
|---|---|---|---|
| **L0 (S1)** | Walking-skeleton | In-memory + trace JSONL/SQLite; KB **stub tĩnh 5 doc** | Xâu-kim a→z, chưa fence |
| **L1 (S2, mặc định)** | KB thật | **SQLite** cho trace/cost/index-metadata; embed qua EmbeddingService stub; index per-tenant | Đủ dạy ingest→embed→retrieve + tenant filter; leak-test đứng ở đây |
| **L2 (stretch S3)** | Nếu S2 xong sớm | Vector store nhẹ (sqlite-vss / faiss local) + gateway embed (flag) | KHÔNG bắt buộc; vector-DB production-scale = OUT scope |

> Nguyên tắc: **SQLite + fence tại retrieval là điểm gãy demo**, không phải vector-DB xịn. Money-shot fence-proof (bước 5) + gate-chặn (bước 7) phải đứng vững ở L1. L2 chỉ mở khi mọi AC cứng (leakage=0, gate chặn, cost-lineage khớp) đã xanh.

---

## §5. Thứ tự ghép (assembly order)

1. **S1 (xâu-kim = GATE CỨNG):** SWE dựng form tạo agent → AIE-1 interpreter 3-node hardcode → DE cắm KB stub 5 doc + trace sink → AIE-2 smoke-eval 5 case in bảng điểm. **Walking-skeleton a→z qua CẢ 4 quadrant tồn tại cuối tuần 2** (D6 xâu-kim lần 1, D10 gate). INV-1 skeleton (D8).
2. **Cuối S1 (D11):** **contract-negotiation workshop** → **freeze 4 contract**: recipe schema (SWE) · trace-event schema (DE) · `kb.search` API (DE) · scorecard format (AIE-2) (INV-5).
3. **S2:** SWE thay form-only bằng canvas 6-node + validator; DE cắm KB thật (ingest→embed→index + tenant filter); AIE-1 executor đầy đủ + retrieval trade-off; AIE-2 eval harness v1 + golden-set 30 + trace viewer. Happy-path spine chạy lần đầu (G4/D20).
4. **S3:** thêm permission fence chunk-level + leak-test (leakage=0) + hitl-pause + eval-gate vào publish (chặn+rollback) + cost dashboard 3-surface + re-index idempotent. Hardening + cross-handover.

**Weekly integration-demo (T6):** ghép thật qua 4 contract, không mock lẫn nhau ngoài boundary §6 — evidence D1·Team + increment D3·Delivery.

---

## §6. Mock boundary (cái gì thật / cái gì stub)

| Thành phần | Trạng thái | Lý do |
|---|---|---|
| Workbench UI, interpreter, node executors, Fenced-KB, trace sink, eval harness, eval-gate, INV-1 | **THẬT (tự viết)** | Đây là learning goal + đối tượng chấm |
| Tool nghiệp vụ (rule-verdict, matching) | **STUB nội bộ / Tier-1 clone** | NDA: không gọi hệ thật (INV-3) |
| Embedding / LLM (`llm-step`) | **Fixtures/stub (mặc định)** + gateway (demo/flag) | INV-4; Phase-2 gateway thật là tùy chọn, không chặn |
| KB docs | **Callisto Handbook tự viết** (~40–60 doc md, 2 tenant) có ground-truth | NDA + chấm fence/citation bằng nhãn |
| Golden-set | **Sinh từ doc-factory DE** (nhãn tay agreement-check) | chấm eval bằng nhãn, không phụ thuộc IQ LLM |
| Tenant / user | `ankor`/`borea`, `alice`/`bob`/`carol` (mới sinh) | INV-3 |

> Ranh giới vàng: **4 quadrant của 4 người ghép THẬT với nhau** (qua 4 contract §3); chỉ **hệ đích bên ngoài** mới stub. Không được stub lẫn nhau để né integration — integration chính là cơ chế đo Influence (B3 §6.2) + đúng chất AgentCore Studio sống-nhờ-contract.

---

## §7. INV-1..7 delta cho AgentCore Studio

| INV | Floor chung | **Delta AgentCore Studio** |
|---|---|---|
| **INV-1** Tenant-Wall | session_id → resolve `{tenant,user,roles}` server-side; `tenant_id NOT NULL` + mandatory filter fail-closed; T1 IDOR + T6 label-spoof xanh CI | **Fence ở tầng KB chunk-level TẠI RETRIEVAL** (không chỉ row-level): `section_role` resolve server-side; `kb.search` không bao giờ trả chunk ngoài scope. **SWE own INV-1, cả team consume.** leakage=0 AC cứng |
| **INV-2** HITL | ≥1 điểm dừng-chờ-người first-class | **`hitl-pause` node** trong test-playground (demo bước 8): flow dừng chờ duyệt → resume |
| **INV-3** NDA | synthetic 100%, identifier mới, hệ thật stub | **Callisto Handbook tự viết** (~40–60 doc, 2 tenant); tool **Tier-1 clone**; secret-scan pre-commit |
| **INV-4** Fixtures-first | CI 100% recorded fixtures; live chỉ demo qua flag; AC không phụ thuộc IQ LLM | **EmbeddingService 2-impl** (stub + gateway); **LLM-judge cache + cap ≤100/ngày**; chấm pipeline/fence/trace/gate |
| **INV-5** Contract-freeze | schema freeze cuối S1; đổi = mini-RFC + review; weekly demo T6 | **4 contract** (recipe:SWE · trace-event:DE · kb.search:DE · scorecard:AIE-2) freeze cuối S1; đổi = **mini-RFC 4 chữ ký** |
| **INV-6** Rubric | chassis B1 nguyên trạng, skew manifest; security AC EXECUTABLE; walking-skeleton a→z cuối S1 gate cứng | Skew **D1·Team +0.8 / D3·Delivery −0.4** (KHÔNG Rigor); **eval-gate CHẶN + rollback** là AC executable; **S1 xâu-kim gate cứng** |
| **INV-7** Descope-ladder | drop-list viết sẵn Day 1 | **4 nấc:** KB→stub tĩnh · canvas→form+Mermaid · judge→exact-match · dashboard→bảng CLI — mỗi nấc demo 8 bước VẪN SỐNG |

*Hết umbrella-contract. Đọc tiếp: (tài liệu chấm điểm — mentor giữ, không công bố).*
