---
id: studio.charter
type: program-charter
status: draft
created: 2026-07-17
set: agentcore-studio
title: AgentCore Studio — Xưởng Create→Test→Trust (AgentCore Authoring / paved-path
  trọn vòng đời)
---

# CHARTER — AGENTCORE STUDIO "XƯỞNG CREATE→TEST→TRUST"
### AgentCore Authoring · paved path trọn vòng đời tạo agent · 4 trainee × 3 sprint × 2 tuần · synthetic-only

> **Hợp đồng đọc:** đây là 1 trong 4 file SSOT của AgentCore Studio (charter · roadmap · umbrella-contract).
> Mọi mở rộng (sprint-writer, role-track, mentor-playbook, bản trình sếp) phải nhất quán với file này.
> Không phát minh capability ngoài nguồn; mọi quyết định đã chốt ở §4 coi như **luật**.

---

## §1. Đề bài chung (góc dự án) — engine | recipe | NDA

**Bối cảnh.** PTNT (platform team) xây **AgentCore Authoring** một lần; PTSP (business team) **consume bằng recipe khai báo**, dựng agent nghiệp vụ mà **không chạm code lõi** (brief §1 — ranh giới Engine build-once | Config/recipe PTSP tự chỉnh, đã đứng vững trên 11 module thật).

**AgentCore Studio dựng phần lõi nào — một LUỒNG, không phải 3 tính năng rời.** PTNT ship **paved path trọn vòng đời authoring**: tạo agent bằng **form** (không viết code lõi), gắn **2 tool + 1 KB có fence (chặn rò rỉ tại tầng truy xuất)**, vẽ **3-node workflow trên canvas** (palette đóng 6 node + test-playground), bấm **Test** xem **trace**, **qua eval-gate (cổng kiểm định chặn publish) mới Publish**. Recipe từ UI chạy trên **interpreter mini**, retrieve từ **Fenced-KB** (ingest→chunk→embed→index per-tenant; permission filter **TẠI RETRIEVAL** — không phải nhờ LLM "đừng nói"; cited answer; leakage=0), mọi run phát **trace** + mọi publish qua **eval-gate scorecard**.

| Lằn ranh | PTNT (Engine — team build một lần) | PTSP (Recipe — khai báo, zero code) |
|---|---|---|
| Tạo agent | Workbench form + schema/validator/graph-lint | `recipe` = agent-config (instructions, model, tool-whitelist) |
| Điều phối | Interpreter mini + 6 node-type executor đóng | DAG 3-node vẽ trên canvas (kb-retrieve→llm-step→condition→tool-call…) |
| Tri thức | Fenced-KB engine (ingest→chunk→embed→index + permission filter tại retrieval) | `kb-binding` (scope tenant/section) + golden-set |
| Kiểm định | eval harness + LLM-judge + scorecard format | `golden-set` + ngưỡng scorecard (declared) |
| Tin cậy | trace sink + eval-gate chặn publish + cost-lineage | ngưỡng gate; đọc trace/scorecard |
| Model | `EmbeddingService` Protocol + gateway-stub client (per agent×env) | provider whitelist + default model |

**Recipe PTSP = agent-config + DAG + kb-binding + golden-set + ngưỡng scorecard — TẤT CẢ khai báo.**
**Engine = schema/validator/interpreter/fence/trace/gate.**

**Ràng buộc học tập (bất di bất dịch).** Palette **đúng 6 node-type đóng** (`kb-retrieve` · `llm-step` · `condition` · `tool-call` · `hitl-pause` · `end`) — CẤM thêm node lạ, CẤM DSL turing-complete. Permission fence phải nằm **TẠI RETRIEVAL** (chunk-level filter fail-closed), **KHÔNG** được "nhờ LLM đừng nói" (đó là fake fence, leak-test sẽ bắt). Zero dòng code lõi bị chạm khi PTSP dựng agent — **engine|recipe boundary made literal**.

**NDA floor (INV-3).** Dữ liệu **100% synthetic** — **Callisto Handbook tự viết** (~40–60 doc md, 2 tenant); tool Tier-1 **clone**. 2 tenant giả `ankor` / `borea`; users `alice`/`bob`/`carol`; mọi hệ đích là **stub**; hostname `*.mock.local`; secret-scan pre-commit; **mọi identifier sinh mới — cấm chép từ tài liệu tham khảo**; no PII; no tên dự án/đối tác thật. Vi phạm NDA = cổng pass/fail, không phải trừ điểm.

---

## §2. Goal + hình hài sản phẩm + demo tốt nghiệp a→z (10')

**Goal chương trình.** Cuối 6 tuần, team ship **một Mini-Studio authoring KHÔNG đồ chơi**: PTSP tạo agent bằng form + canvas, gắn tool + KB fence, bấm Test xem trace, **qua eval-gate mới Publish** — mọi thuộc tính tin cậy (fence leakage=0, citation-accuracy, cost-lineage khớp 3 surface, eval-gate CHẶN được bản tệ) đều **chứng minh bằng test**; **zero code lõi** bị chạm khi dựng agent.

**Hình hài sản phẩm.** Workbench UI (form + canvas palette 6 node + test-playground) + Interpreter mini + Fenced-KB (ingest→embed→retrieve per-tenant) + trace sink + eval-gate scorecard + cost dashboard mini.

**Demo tốt nghiệp a→z (10 phút, 8 bước — money-shot = bước 5 fence-proof + bước 7 gate-chặn):**

| # | Bước demo | Chứng minh |
|---|---|---|
| 1 | Mở Workbench → tạo agent **"Payment-Doc Checker"** bằng **form** | authoring không code |
| 2 | Gắn **2 tool** (rule-verdict + matching) + **1 KB** scope Tenant-X | tool-perm whitelist + kb-binding |
| 3 | Vẽ flow trên canvas: **kb-retrieve → llm-step → condition → tool-call** | DAG palette đóng |
| 4 | Bấm **Test** → **trace timeline** từng node, tokens/cost **live** | trace + cost-lineage |
| 5 | Hỏi câu đáp án **chỉ có trong KB Tenant-Y** → **refusal + audit**, không hallucinate | **fence proof (money-shot), leakage=0** |
| 6 | Chạy **Eval** → scorecard **30 golden case** (success + citation-accuracy) → **PASS gate** → **Publish** → named endpoint | eval-gate + publish |
| 7 | **Cú kết:** sửa instructions cho tệ đi → re-eval → **gate CHẶN** → **rollback version** | **gate là thật (money-shot)** |
| 8 | **hitl-pause node** dừng flow chờ duyệt trong playground | HITL first-class (INV-2) |

> **Zero dòng code lõi bị chạm trong cả 8 bước** — engine|recipe boundary made literal.

---

## §3. Phạm vi in / out

| ✅ IN scope | ❌ OUT scope (cắt tường minh) |
|---|---|
| Workbench form tạo agent + recipe schema/validator/graph-lint | Multi-agent handoff (thuộc Set A/D; R3 không tách demand class) |
| Canvas palette **6 node đóng** + test-playground trace | RBAC per-resource sâu (chỉ Tenant-Wall floor + KB-perm — xem §4) |
| Interpreter mini chạy DAG (3-node lõi demo) | Distributed orchestration / workflow bền qua restart sâu (thuộc Set A) |
| **Fenced-KB**: ingest→chunk→embed→index per-tenant + permission filter **tại retrieval** + cited answer + leak-test | Vector-DB production-scale / re-rank nâng cao; multimodal KB |
| Eval harness + LLM-judge + scorecard + **eval-gate chặn publish** | LLM-gateway server thật, virtual-key K3/K4 (chỉ K1/K2 credential) |
| Trace sink + cost-lineage 3 surface (UI test → trace → dashboard) | Cost FinOps đầy đủ / billing thật |
| `EmbeddingService` Protocol 2-impl (stub local + gateway) fixtures-first | React Flow bắt buộc (fallback form+Mermaid theo descope-ladder) |
| Tenant-Wall floor INV-1 + hitl-pause node INV-2 | Canvas UX cao cấp / real-time collab editor |

---

## §4. Các quyết định đã chốt (coi như luật — nhúng vào mọi doc con)

| # | Quyết định | Nội dung chốt | Nguồn |
|---|---|---|---|
| **DEC-E1** | Team | 4 ứng viên mới ra trường: **1 DE · 1 SWE · 2 AIE** (AIE-1, AIE-2). Mentor = Senior/near-Principal, shadow-working, **là người chấm duy nhất** | brief §10 / OD-6 |
| **DEC-E2** | Thời lượng | 6 tuần = **30 ngày làm việc = 3 sprint × 2 tuần**. Day 1 = **Thứ Hai**; lịch **schedule-agnostic** (pin ngày khi batch được xếp) | B3 §3.5 |
| **DEC-E3** | Gate | S1 gate **Day 10** · S2 gate **Day 20** · S3 gate **Day 30** — gate cuối mỗi sprint | B3 §3.5 |
| **DEC-E4** | Tuần 0 | Mentor dựng kit + provisioning (trước Day 1) | — |
| **DEC-E5** | Model access | **Phase-1 fixtures-first** (CI 100% recorded fixtures, không phụ thuộc model thật). **Phase-2** LLM gateway nội bộ thật là **tùy chọn** khi có **ZTNA + credential + quota** (điều kiện, **không chặn** Phase-1). Embedding qua `EmbeddingService` Protocol **2-impl** (stub local + gateway) | OD-1 / INV-4 |
| **DEC-E6** | Skew chấm | Cách chấm chi tiết do mentor giữ — không công bố trong đề bài. | §E.7 / B1 |
| **DEC-E7** | Python | Pin **3.14** (khớp venv skill) | OD-5 |
| **DEC-E8** | UI | Canvas **React Flow** ở S2; **fallback form + Mermaid** theo descope-ladder (SWE chưa React → tụt nấc, demo 8 bước vẫn sống) | INV-7 |
| **DEC-E9** | Fence | Permission filter **TẠI RETRIEVAL** (chunk-level, fail-closed) — **CẤM** "nhờ LLM đừng nói". Leak-test T1 IDOR + T6 label-spoof xanh CI; **leakage=0** là AC cứng | INV-1 / OD-3 |
| **DEC-E10** | Dữ liệu | **100% synthetic/mock, KHÔNG PII**; **Callisto Handbook tự viết** (~40–60 doc, 2 tenant); tool Tier-1 clone; hệ thật chỉ stub | INV-3 |

---

## §5. Phân bổ 4 vai + không gian cá nhân (mỗi trainee own 1 quadrant)

**Nguyên tắc:** mỗi quadrant có **một owner duy nhất**; cộng tác qua **contract + PR review**, không "làm chung một file". **Bảng ownership canonical đầy đủ ở `umbrella-contract.md §2`** — dưới đây là bản tóm tắt.

| Vai | Quadrant own end-to-end (không gian cá nhân) | Điểm ghép chéo |
|---|---|---|
| **DE** (FLAGSHIP kép) | **KB pipeline** (doc-factory + ground-truth annotation, chunk/embed/index/fence-data, consent-purge, re-index idempotent) **+ obs/eval data** (trace sink, cost table, golden-set từ chính doc-factory — 1 script 2 deliverable) | golden-set → nuôi AIE-2; trace sink → AIE-2 playground |
| **SWE** | **Workbench UI** (form+canvas) + recipe schema/validator/graph-lint + publish flow + **INV-1 Tenant-Wall** | recipe schema (bút) → cả team consume |
| **AIE-1** | **Interpreter + node executors** + retrieval quality (chunking×embedding trade-off có số) qua gateway | tiêu thụ `kb.search` (DE) + EmbeddingService |
| **AIE-2** | **Eval harness + LLM-judge** (agreement-check vs nhãn tay, cap ≤100 call/ngày, cache) + playground trace UX | tiêu thụ golden-set + trace (DE); scorecard (bút) |

**Contract chung:** 4 schema freeze cuối S1 — recipe schema (SWE bút) · trace-event schema (DE bút) · `kb.search` API (DE bút) · scorecard format (AIE-2 bút). Integration CHỈ qua 4 contract. Chi tiết ở `umbrella-contract.md`.

**HONEST note (brief §10):** AgentCore Studio cho **DE lát rộng nhất mọi set** (double-flagship: KB pipeline + obs/eval data) — bù cho việc mỗi cell nông hơn set chuyên sâu. Đây là "right choice" đã chốt: demo 10' bán được cho **cả lãnh đạo lẫn engineer**, DE-slice rộng, bài học **team-contract thật nhất** — đổi lại **mỗi cell nông hơn** (đặc biệt eval nông hơn set chuyên eval).

---

## §6. Rủi ro chính + guardrail + descope-ladder tổng

| # | Rủi ro (breaks-freshgrads) | Guardrail |
|---|---|---|
| R1 | S1 KHÔNG xâu được kim qua cả 4 quadrant → 4 mảnh rời, spine không tồn tại | **S1 xâu-kim là GATE CỨNG** (walking-skeleton a→z cuối tuần 2); mỏng mà thông > dày mà đứt |
| R2 | Fake fence: nhờ LLM "đừng nói" thay vì filter tại retrieval | **CẤM tường minh** (DEC-E9); leak-test T1/T6 bắt; leakage=0 là AC cứng |
| R3 | Canvas React Flow ngốn thời gian (SWE chưa React) | **Descope-ladder**: canvas → form + Mermaid, demo 8 bước vẫn sống (DEC-E8) |
| R4 | KB pipeline over-engineer (vector-DB production) | **Descope**: KB → stub tĩnh 5 doc ở S1; embed thật chỉ S2 |
| R5 | LLM-judge tốn quota / nondeterminism | **Cap ≤100 call/ngày + cache + agreement-check vs nhãn tay**; descope judge → exact-match |
| R6 | Eval nông có chủ đích (không làm sâu kiểu research) | Eval-gate CHẶN được + judge-agreement là đủ DoD |
| R7 | Cost-lineage 3 surface lệch số | Cùng 1 nguồn số (trace sink DE) chảy ra 3 surface; **descope dashboard → bảng CLI** |
| R8 | 4 contract không freeze → integration hell | **4 schema freeze cuối S1**; đổi = mini-RFC 4 chữ ký (INV-5) |

**Descope-ladder tổng (viết sẵn Day 1 — INV-7; mỗi nấc tụt demo 8 bước VẪN SỐNG):**
1. **KB** thật (ingest→embed→retrieve) → **stub tĩnh** 5 doc (bước 5 fence vẫn chứng minh qua filter tại retrieval).
2. **Canvas** React Flow → **form + Mermaid** (bước 3 vẽ flow → khai báo + render Mermaid).
3. **LLM-judge** → **exact-match** scorer (bước 6 scorecard vẫn PASS/FAIL bằng success + citation).
4. **Cost dashboard** mini → **bảng CLI** (bước 4 tokens/cost vẫn hiện, cùng con số trace).

> Nguyên tắc descope: **cắt độ bóng, không cắt nhịp demo**. Mỗi nấc rơi xuống, cả 8 bước demo vẫn chạy — chỉ kém long lanh.

---

## §7. INV floor (bất biến dùng chung — delta AgentCore Studio ở `umbrella-contract.md`)

| INV | Nội dung floor | AgentCore Studio hiện thực |
|---|---|---|
| **INV-1** | Tenant-Wall: session_id → resolve `{tenant,user,roles}` server-side; `tenant_id NOT NULL` + mandatory filter fail-closed; ≥2 attack test (T1 IDOR + T6 label-spoof) xanh CI | **KB-perm chunk-level** tại retrieval; SWE own, cả team consume |
| **INV-2** | HITL floor: ≥1 điểm dừng-chờ-người first-class | **hitl-pause node** trong playground (demo bước 8) |
| **INV-3** | NDA floor (synthetic 100%, Callisto Handbook tự viết, tool clone, mọi identifier mới) | như §1 |
| **INV-4** | Fixtures-first: CI 100% recorded fixtures (VCR-style); model live chỉ demo qua opt-in flag. AC **không** phụ thuộc IQ của LLM — chấm pipeline/fence/state/trace/gate | EmbeddingService stub + LLM-judge cache |
| **INV-5** | Contract-freeze: 4 schema freeze cuối S1; đổi = mini-RFC + 4/4 review; weekly integration-demo thứ 6 | 4 contract §3 umbrella |
| **INV-6** | Security AC EXECUTABLE; walking-skeleton a→z cuối S1 là gate cứng. | — |
| **INV-7** | Descope-ladder: drop-list viết sẵn Day 1 | §6 trên |

*Hết charter. Đọc tiếp: `roadmap-3-sprint.md` · `umbrella-contract.md`.*
