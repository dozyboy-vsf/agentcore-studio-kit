---
id: studio.roadmap
type: roadmap
status: draft
created: 2026-07-17
set: agentcore-studio
title: Roadmap AgentCore Studio — 3 sprint × 2 tuần · 30 ngày · macro-goal G1–G6 ·
  schedule-agnostic
---

# ROADMAP — AGENTCORE STUDIO "XƯỞNG CREATE→TEST→TRUST"
### 3 sprint × 2 tuần · scaffold-fade (spec→goal→problem) × artifact-ladder (code→plan+code→design+ops+handover)

> **Hợp đồng đọc:** bảng skeleton §5 chỉ là **1 dòng/ngày** (chủ đề + cognitive-target). Sprint-writer
> kế thừa file này + template day-goal 6-field (B3 §3.3) để nở thành 30 day-goal đầy đủ. Bậc thang
> 4 vector là **hằng số**; tải trọng là biến số (B3 §7.7). Skeleton bám LE 3-sprint fit.
> **Lịch schedule-agnostic:** Day 1 = Thứ Hai; gate cuối mỗi sprint (Day 10/20/30). Có thể **pin ngày
> cụ thể khi batch được xếp lịch** — đánh dấu `[T2]…[T6]` là thứ trong tuần, không phải ngày dương lịch.

---

## §1. Khung 6 macro-goal (G1–G6) — đặc hoá cho AgentCore Studio

Kế thừa khung B3 §3.4 (2 macro-goal/sprint), đặc hoá cho paved-path authoring:

| # | Tuần | Macro-goal AgentCore Studio | Definition-of-done (bằng chứng) |
|---|---|---|---|
| **G1** | 1 | **"Đứng được trong Xưởng"** | Onboarding 100% + env 3.14 chạy + NDA pledge (Callisto synthetic) + **teach-back 10'/người** (mỗi người 1 quadrant: KB-fence (chặn rò rỉ tại tầng truy xuất), Workbench/recipe, interpreter/executor, eval-gate (cổng kiểm định chặn publish)) + claim warm-up sau khi HỎI RÕ timeline/kỳ vọng/context |
| **G2** | 2 | **"Walking-skeleton xâu-kim a→z"** | **XÂU KIM qua CẢ 4 quadrant, mỏng mà thông**: form tạo agent (chưa canvas) + interpreter 3-node hardcode + KB stub 5 doc (chưa fence) + trace vào SQLite + smoke-eval 5 case in bảng điểm — **cả spine tồn tại cuối tuần 2** (GATE CỨNG walking-skeleton), 1 luồng chạy hết cỡ, PR merge qua review |
| **G3** | 3 | **"4 contract của tôi, được duyệt & freeze"** | Design-note ≤2 trang DO TRAINEE VIẾT (scope + phương án chọn + 1 phương án bỏ + trade-off + rủi ro) được duyệt; **4 schema contract freeze** (recipe/trace-event/kb.search/scorecard); canvas + KB thật bắt đầu |
| **G4** | 4 | **"Canvas + KB thật + trace + eval v1 + integrate lần đầu"** | Canvas React Flow palette 6 node (hoặc fallback form+Mermaid) + KB thật (ingest→embed→retrieve + tenant filter) + trace viewer + eval v1; **spine 4 quadrant happy-path end-to-end chạy lần đầu**; review ≤2 vòng. = Gate-2 giữa kỳ |
| **G5** | 5 | **"Trust-grade: fence + leak-test + eval-gate + cost"** | Permission fence chunk-level tại retrieval + leak-test (T1 IDOR + T6 label-spoof xanh, leakage=0) + hitl-pause node + eval-gate vào publish (chặn bản tệ + rollback) + cost dashboard mini (khớp 3 surface) |
| **G6** | 6 | **"Bàn giao & vận hành độc lập"** | Handover doc + failure-mode catalog + honest-TODO + **cross-handover test (vận hành quadrant người khác 30' không hỏi tác giả)** + demo a→z 10' (8 bước) chạy thật + final eval U/B/I/A + khối 30% |

---

## §2. Thang tiến hoá 4 vector × 3 sprint (L1 Follow → L2 Assist → L3 Apply)

Khung 4 vector B3 §1.2 (nhận thức / tư duy / kiến thức / kỹ năng), đặc hoá theo lõi AgentCore Studio:

| Vector | **S1 · L1 Follow** | **S2 · L2 Assist** | **S3 · L3 Apply** |
|---|---|---|---|
| **Nhận thức** | Thấy ranh giới engine\|recipe (PTNT\|PTSP); vì sao fence tại-retrieval / eval-gate / trace là luật; recipe = khai báo | Code của tôi = CONTRACT người khác tiêu thụ; giá của rework; 4 schema là hiến pháp; cost-lineage cùng-1-số | Agent PTSP dựng sống lâu hơn tôi; "leak âm thầm" nguy hơn crash; ai tiếp quản quadrant khi tôi rời |
| **Tư duy** | Procedural + clarify-first: bắt chước pattern ingest/executor/scorer đúng; hỏi rõ đề trước khi code | Decomposition + trade-off: tự chọn chunk-size×embedding, ngưỡng scorecard; ước lượng effort; đàm phán contract | Systems + risk-first: bắt đầu từ failure-mode ("hỏi câu chỉ có ở Tenant-Y", "instructions tệ đi"); tự quyết + ghi lại |
| **Kiến thức** | Nhận diện: ingest→chunk→embed→index, node executor, trace event, golden-set, docstring-as-schema | Vận dụng: retrieval + tenant filter, canvas DAG, conditional edge, trace viewer, eval v1, EmbeddingService 2-impl | Production: permission fence fail-closed, leak-test, eval-gate chặn+rollback, cost-lineage, hitl-pause, re-index idempotent |
| **Kỹ năng** | Task định-nghĩa-rõ → PR pass review (form/interpreter-3-node/KB-stub/trace/smoke-eval) | Tự plan + build 1 quadrant trọn (KB/Workbench/interpreter/eval) production-quality qua contract | Own end-to-end: build→test(fence/gate)→monitor(cost)→document→demo→HANDOVER |

**Scaffold-fade (đề bài đổi hình):** S1 = **spec** (what + how-hint) · S2 = **goal** (what + acceptance) · S3 = **problem** (why + constraint). Nhúng thẳng vào văn phong day-goal (B3 §3.3 quy tắc 1).

---

## §3. Mốc / gate (schedule-agnostic — thứ trong tuần, pin ngày khi xếp lịch)

| Mốc | Khi | Nội dung |
|---|---|---|
| **Tuần 0** | trước Day 1 | Mentor dựng kit + provisioning (Callisto Handbook synthetic seed, EmbeddingService stub, CI fixtures) + phát lộ trình OJT + rubric (DEC-E4) |
| **Day 1** | **[T2] tuần 1** | Kickoff S1 |
| Mid-sprint pulse S1 | [T6] tuần 1 | 15'/người, advisory không vào điểm + weekly demo đầu |
| **GATE-1 (S1)** | **[T6] Day 10** | **Walking-skeleton a→z xâu-kim CẢ 4 quadrant** (GATE CỨNG) + teach-back "vì sao fence/eval-gate là luật" |
| Mid-sprint pulse S2 | [T6] tuần 3 | advisory + weekly demo |
| **GATE-2 (S2, giữa kỳ)** | **[T6] Day 20** | Canvas 6 node + KB thật + trace viewer + eval v1 + integrate lần đầu + **go/no-go per-candidate S3** |
| Mid-sprint pulse S3 | [T6] tuần 5 | advisory + weekly demo |
| **GATE-3 / FINAL (S3)** | **[T6] Day 30** | Demo a→z 10' (8 bước) + eval U/B/I/A 3 trục + khối 30% trust-grade + dual-score |

Nhịp tuần (B3 §3.2): T2 week-kickoff · T3–T5 build days · **T6 integration/review + weekly demo + 1:1** · **T7 WFH cách tuần = consolidation** (không feature mới). Luật **2-4-8** chống bỏ rơi (kẹt 2h ghi giả thuyết · 4h được hint · 8h mentor working-session 30').

---

## §4. Tỷ lệ individual ↔ collaborative theo sprint

| Sprint | Solo : Team | Cơ chế |
|---|---|---|
| **S1** | **70 : 30** | Warm-up SOLO song song (đo tín hiệu cá nhân sạch); **nhưng S1 xâu-kim = deliverable NHÓM** (walking-skeleton phải thông qua cả 4 quadrant) → team-load cao hơn Set A ngay từ S1 (đúng chất AgentCore Studio sống-nhờ-contract) |
| **S2** | **60 : 40** | Individual quadrant là trục chính; **contract-negotiation workshop** ngày 11 (4 người tự đàm phán recipe/trace/kb.search/scorecard) + freeze; weekly Integration Friday |
| **S3** | **50 : 50** | Trust-grade spine (fence + eval-gate + cost-lineage) = deliverable NHÓM; mỗi người chốt production-grade + handover CÁ NHÂN; **cross-handover chéo vòng tròn** |

---

## §5. Skeleton 30 ngày (1 dòng/ngày — sprint-writer mở rộng)

> Ký hiệu cognitive-target: **[NT]** nhận thức · **[TD]** tư duy · **[KT]** kiến thức · **[KN]** kỹ năng.
> Mỗi tuần ≥1 ngày [NT]/[TD]; ngày cuối tuần ≥50% integration/review + weekly demo (B3 §3.3 quy tắc 2, 4).

### Sprint 1 — Follow · macro G1–G2 · đề bài dạng **spec** · GATE CỨNG = walking-skeleton xâu-kim

| Day | Thứ | Chủ đề (1 dòng) | Cog |
|---|---|---|---|
| D1 | T2 | Onboarding + env 3.14 + NDA pledge (Callisto synthetic); teach-back bản đồ AgentCore + ranh giới engine\|recipe + 4 quadrant | [NT] |
| D2 | T3 | Đọc đề paved-path (authoring→fence→eval-gate); scaffold repo mono + phác 4 quadrant + drop-list descope-ladder (INV-7) | [NT] |
| D3 | T4 | **SWE:** form tạo agent (agent-config) · **AIE-1:** interpreter 3-node hardcode (kb-retrieve→llm-step→condition) chạy 1 case | [KN] |
| D4 | T5 | **DE:** KB stub 5 doc Callisto + `kb.search` thô (chưa fence) · **AIE-2:** smoke-eval 5 case in bảng điểm | [KN] |
| D5 | T6 | **DE:** trace event thô vào SQLite (mọi node emit); mid-sprint pulse + weekly demo + peer-review đầu tiên | [TD] |
| D6 | T2 | Xâu-kim lần 1: form→interpreter→kb.search stub→trace — 1 luồng nối được đầu-cuối (mỏng) | [KN] |
| D7 | T3 | EmbeddingService Protocol (stub local) + adapter fixtures-first; interpreter đọc agent-config từ form | [KN] |
| D8 | T4 | INV-1 skeleton: session_id resolve `{tenant,user,roles}` + `tenant_id NOT NULL`; phân biệt tag vs isolation | [NT] |
| D9 | T5 | Harden walking-skeleton: test happy+negative mỗi quadrant; smoke-eval nối vào trace | [TD] |
| D10 | **T6** | **GATE-1**: demo walking-skeleton a→z xâu-kim CẢ 4 quadrant chạy thật + teach-back "vì sao fence/eval-gate là luật" | [NT] |

### Sprint 2 — Assist · macro G3–G4 · đề bài dạng **goal** · canvas + KB thật + trace + eval v1

| Day | Thứ | Chủ đề (1 dòng) | Cog |
|---|---|---|---|
| D11 | T2 | **Contract-negotiation workshop** (freeze 4 schema: recipe · trace-event · kb.search · scorecard) + design-note tự viết | [TD] |
| D12 | T3 | **SWE:** canvas React Flow palette 6 node (fallback form+Mermaid) + recipe schema/validator/graph-lint | [KN] |
| D13 | T4 | **DE:** KB thật ingest→chunk→embed→index per-tenant (Callisto 2 tenant); **AIE-1:** retrieve qua EmbeddingService | [KN] |
| D14 | T5 | **AIE-1:** node executors đầy đủ 6 loại + chunking×embedding trade-off đo số đầu tiên | [TD] |
| D15 | T6 | **DE:** trace viewer (timeline từng node, tokens/cost) + tenant filter tại retrieve; weekly Integration Friday | [KN] |
| D16 | T2 | **AIE-2:** eval harness v1 + golden-set 30 case từ doc-factory (DE) + scorecard format | [KN] |
| D17 | T3 | INV-1 mandatory filter fail-closed tại retrieval; **T1 IDOR + T6 label-spoof pytest xanh (đầu)** | [NT] |
| D18 | T4 | **AIE-2:** LLM-judge + agreement-check vs nhãn tay (cap ≤100/ngày + cache); descope-guard exact-match | [TD] |
| D19 | T5 | Cost-lineage: cùng 1 số từ trace chảy ra UI-test; hardening + failure-mode nhìn đầu | [TD] |
| D20 | **T6** | **GATE-2**: canvas 6 node + KB thật + trace viewer + eval v1 + spine integrate lần đầu + go/no-go S3 | [NT] |

### Sprint 3 — Apply · macro G5–G6 · đề bài dạng **problem** · fence + leak + hitl + eval-gate + cost

| Day | Thứ | Chủ đề (1 dòng) | Cog |
|---|---|---|---|
| D21 | T2 | **Permission fence chunk-level TẠI RETRIEVAL** fail-closed (role→KB section); CẤM "nhờ LLM đừng nói" | [NT] |
| D22 | T3 | **Leak-test:** hỏi câu chỉ có ở Tenant-Y → refusal + audit; T1/T6 xanh CI; **leakage=0 proof** | [KN] |
| D23 | T4 | **hitl-pause node** trong playground: flow dừng chờ duyệt first-class (INV-2) | [KN] |
| D24 | T5 | **Eval-gate vào publish:** PASS scorecard mới Publish → named endpoint; sửa instructions tệ đi → gate CHẶN + rollback version | [TD] |
| D25 | T6 | **Cost dashboard mini:** cost-lineage khớp 3 surface (UI test → trace → dashboard, cùng con số); weekly Integration Friday | [NT] |
| D26 | T2 | Re-index idempotent + consent-purge (DE); polish canvas/playground trace UX (AIE-2/SWE) | [KN] |
| D27 | T3 | Hardening: error-handling ngoài happy-path, retrieval-quality số cuối, descope-ladder rehearsal | [TD] |
| D28 | T4 | Handover doc + failure-mode catalog + honest-TODO (mỗi quadrant) | [NT] |
| D29 | T5 | **Cross-handover test** (vận hành quadrant người khác 30' không hỏi tác giả) + demo rehearsal 8 bước | [TD] |
| D30 | **T6** | **FINAL GATE**: demo a→z 10' (8 bước, money-shot bước 5 fence + bước 7 gate-chặn) + eval U/B/I/A 3 trục + khối 30% + dual-score | [NT] |

---

## §6. Ghi chú cho sprint-writer

1. Nở mỗi dòng thành day-goal 6-field: `objective` (verb-first, đo được) · `cognitive-target` (vector + vì sao) · `deliverable` (artifact link được, evidence-or-it-didn't-happen) · `mentor-touchpoint` (mặc định async) · `self-check` (2–3 câu) · `eval-axis` (A&I / S&E / OQ&R).
2. S1 objective viết **spec**, S2 **goal**, S3 **problem** — không liệt kê bước ở S2/S3 (giết trục Autonomy).
3. eval-axis phủ đủ 3 trục mỗi tuần; A&I chủ yếu qua hành vi (question-batch chất lượng, tự xin review).
4. Ngày cuối tuần (D5/D10/D15/D20/D25/D30) ≥50% integration/review + **weekly demo** — không cấp goal build mới.
5. **S1 xâu-kim là GATE CỨNG** (charter R1): walking-skeleton phải chạy a→z qua CẢ 4 quadrant cuối tuần 2, mỏng-mà-thông > dày-mà-đứt. Vượt AC = gold-plating, mentor chặn.
6. Bám AC-executable LE: **fence leakage=0** (T1/T6) · **eval-gate CHẶN bản tệ + rollback** · **cost-lineage khớp 3 surface** · **hitl-pause dừng thật**. Mỗi nấc descope-ladder (KB→stub · canvas→Mermaid · judge→exact-match · dashboard→CLI) phải giữ demo 8 bước sống.

*Hết roadmap. Đọc tiếp: `umbrella-contract.md` (kiến trúc + integration contract).*
