---
id: studio.de-bai-tong-quan
type: candidate-brief
status: draft
created: 2026-07-17
set: agentcore-studio
audience: trainee
title: 'Đề bài tổng quan — AgentCore Studio: Xưởng Create→Test→Trust (giao cho 4 TTS)'
---

# ĐỀ BÀI TỔNG QUAN — AGENTCORE STUDIO
### "Xưởng Create → Test → Trust" · 4 thực tập sinh · 6 tuần (3 sprint × 2 tuần = 30 ngày) · dữ liệu synthetic 100%

> Đây là đề bài giao **thẳng cho các bạn thực tập** (DE · SWE · AIE-1 · AIE-2). Đọc file này trước,
> rồi theo `README.md` để đi tiếp xuống lộ trình 3 tuần và 30 ngày.
> Mọi con số/quy ước ở đây bám theo 4 file gốc của chương trình (charter · roadmap · umbrella-contract ·
> quyết-định-đã-chốt) — nếu thấy mâu thuẫn, **file gốc thắng**, báo mentor.

---

## 1. Đề bài tổng quan

Trong 6 tuần, 4 bạn cùng xây **AgentCore Studio** — một "xưởng" để người dùng **tạo ra agent mà không phải code lõi**: điền **form tạo agent** (chỉ dẫn + model + danh sách tool được phép), **gắn 2 tool + 1 kho tri thức (KB) có hàng rào chặn rò rỉ (fence (chặn rò rỉ tại tầng truy xuất))**, **vẽ workflow trên canvas** bằng đúng 6 loại node cho sẵn, bấm **Test** để xem **trace** (dòng thời gian từng bước + token/chi phí), chạy **eval-gate (cổng kiểm định chặn publish)** (cổng kiểm định) rồi mới được **Publish** thành một endpoint có tên. Nói ngắn: các bạn dựng trọn **vòng đời tạo → kiểm → tin** của một agent, và chứng minh mọi thứ bằng test chứ không bằng lời.

---

## 2. Định hướng

**Mục tiêu năng lực.** Sau 6 tuần, mỗi bạn sở hữu trọn một mảng ("quadrant") của một hệ thật, biết build → test → quan trắc → tài liệu → bàn giao; và cả nhóm biết **sống nhờ hợp đồng (contract)**: code của bạn là thứ người khác tiêu thụ, không phải file riêng của bạn.

**Sản phẩm cuối.** Một Mini-Studio **chạy được, không phải đồ chơi**: form + canvas 6 node + interpreter chạy workflow + Fenced-KB (ingest→embed→retrieve theo tenant) + trace sink + eval-gate + cost dashboard mini; đóng lại bằng **demo tốt nghiệp 8 bước a→z (10 phút)**.

**Thang tiến hoá qua 3 sprint** (mỗi sprint đề bài đổi hình, tự chủ tăng dần):

| Sprint | Bậc | Nghĩa | Đề bài giao dạng |
|---|---|---|---|
| S1 (tuần 1–2) | **L1 — Follow** | Bắt chước đúng pattern; hỏi rõ trước khi code | **spec** (nói rõ *what* + gợi ý *how*) |
| S2 (tuần 3–4) | **L2 — Assist** | Tự chọn phương án, tự ước lượng, đàm phán hợp đồng | **goal** (nói *what* + tiêu chí chấp nhận) |
| S3 (tuần 5–6) | **L3 — Apply** | Bắt đầu từ tình huống hỏng, tự quyết + ghi lại, bàn giao | **problem** (nói *why* + ràng buộc) |

---

## 3. Nêu vấn đề

Đội nền tảng (PTNT) cần một **xưởng chung** để các đội sản phẩm tạo agent **nhanh và an toàn**, thay vì mỗi đội tự code lại từ đầu. Ba "nỗi đau" cụ thể mà Studio phải chữa:

1. **Rò rỉ tri thức chéo tenant.** Mỗi khách hàng (tenant) có KB riêng. Nếu agent của tenant A vô tình trả lời bằng dữ liệu chỉ có ở tenant B → mất niềm tin, vi phạm cam kết. Cần một hàng rào **chặn tại tầng truy xuất**, không phải chỉ "dặn model đừng nói".
2. **Không có cổng chặn chất lượng tụt.** Ai đó sửa cấu hình agent cho tệ đi và vẫn phát hành được → chất lượng âm thầm đi xuống. Cần một **eval-gate** chặn publish khi điểm không đạt và cho **rollback**.
3. **Sửa cấu hình phải sửa code.** Đổi một chỉ dẫn, một luồng, một phạm vi KB mà phải đụng code lõi thì chậm và rủi ro. Cần tách **engine (động cơ, build một lần)** khỏi **recipe (công thức khai báo)** — đội sản phẩm chỉnh recipe, không chạm engine.

---

## 4. Input (các bạn được cấp gì)

- **Repo skeleton** mono-repo, Python **3.14**, CI đã bật, fixtures-first (chạy 100% bằng bản ghi sẵn, không phụ thuộc model thật).
- **Callisto Handbook** — bộ tài liệu **synthetic tự viết** (~40–60 doc markdown), **2 tenant** giả `ankor` / `borea`, users `alice`/`bob`/`carol`, kèm **ground-truth** (nhãn) để chấm fence + citation.
- **4 hợp đồng schema (stub)** để 4 quadrant ghép qua: recipe schema · trace-event schema · `kb.search` API · scorecard format.
- **Fixtures kiểu VCR** (bản ghi request/response), **mock gateway/embedding** (`EmbeddingService` Protocol 2 impl: stub local + gateway), **mock tool** nghiệp vụ (rule-verdict, matching) — Tier-1 clone, không gọi hệ thật.

---

## 5. Output (sản phẩm bàn giao cuối — ngắn gọn)

Một **Studio chạy được** + **demo tốt nghiệp 8 bước a→z** (10 phút):

1. Mở Workbench → tạo agent **"Payment-Doc Checker"** bằng **form** (không code).
2. Gắn **2 tool** (rule-verdict + matching) + **1 KB** scope tenant.
3. Vẽ flow trên canvas: **kb-retrieve → llm-step → condition → tool-call**.
4. Bấm **Test** → **trace** từng node + token/chi phí **live**.
5. **Money-shot #1:** hỏi câu đáp án **chỉ có trong KB tenant Y** → agent **từ chối + ghi audit**, không bịa (fence proof, **leakage = 0**).
6. Chạy **Eval** → scorecard **30 golden case** (success + citation) → **PASS gate** → **Publish** thành endpoint có tên.
7. **Money-shot #2:** sửa chỉ dẫn cho **tệ đi** → re-eval → **gate CHẶN** → **rollback** về version cũ.
8. **hitl-pause node** dừng flow chờ người duyệt trong playground.

> Xuyên suốt cả 8 bước: **không một dòng code lõi nào bị chạm** khi dựng agent.

---

## 6. Ngữ cảnh doanh nghiệp

Nhóm các bạn đóng vai **PTNT — đội nền tảng**: xây AgentCore một lần rồi **bàn giao cho các đội sản phẩm** (ví dụ PTSP) dùng qua **recipe** — cấu hình khai báo, không cần viết code lõi.

**Ranh giới engine | recipe (khắc thành luật):**

| | **Engine (PTNT — build một lần)** | **Recipe (PTSP — khai báo, zero code)** |
|---|---|---|
| Nội dung | schema/validator · interpreter · fence · trace · gate | agent-config · DAG 6-node · kb-binding · golden-set · ngưỡng scorecard |

Đội sản phẩm chỉ chỉnh **recipe** (chỉ dẫn, luồng node, phạm vi KB, ngưỡng gate); **engine không đổi**. Đây là bài học lõi: *"động cơ xây một lần, công thức khai báo nhiều lần"*.

**Vì sao NDA / synthetic:** dữ liệu **100% do các bạn tự viết** (Callisto Handbook), **không PII**, không tên dự án/đối tác thật, mọi hệ đích chỉ là **stub** (`*.mock.local`), mọi identifier **sinh mới**. Vi phạm NDA là **cổng pass/fail**, không phải trừ điểm. Lý do: được học trên hệ thật-về-cấu-trúc mà không chạm dữ liệu thật.

---

## 7. Bốn vai & quadrant (ai sở hữu mảnh nào)

Mỗi bạn **own end-to-end 1 quadrant**, cộng tác qua **contract + PR review** — không "làm chung một file".

| Vai | Quadrant sở hữu | Bút hợp đồng (bạn viết) |
|---|---|---|
| **DE** *(flagship kép — lát rộng nhất)* | **KB pipeline** (doc-factory + ground-truth, chunk/embed/index/fence-data, consent-purge, re-index idempotent) **+ obs/eval data** (trace sink, cost table, golden-set từ chính doc-factory) | **trace-event schema** + **`kb.search` API** |
| **SWE** | **Workbench UI** (form + canvas) + recipe schema/validator/graph-lint + publish flow + **Tenant-Wall (INV-1)** | **recipe schema** |
| **AIE-1** | **Interpreter + node executors** (6 loại node) + chất lượng truy xuất (chunking × embedding trade-off có số) | *(tiêu thụ `kb.search` + EmbeddingService)* |
| **AIE-2** | **Eval harness + LLM-judge** (agreement-check vs nhãn tay, cap ≤100 call/ngày, cache) + playground trace UX | **scorecard format** |

*(Bảng ownership chuẩn đầy đủ ở `umbrella-contract.md §2` — nếu lệch, file đó thắng.)*

---

## 8. Luật chơi chung

- **6 node-type đóng — CẤM thêm:** `kb-retrieve` · `llm-step` · `condition` · `tool-call` · `hitl-pause` · `end`. Không DSL turing-complete.
- **Fence phải nằm TẠI RETRIEVAL** (chunk-level, fail-closed). **Cấm** kiểu "nhờ LLM đừng nói" — leak-test (T1 IDOR + T6 label-spoof) sẽ bắt. **leakage = 0** là tiêu chí cứng.
- **4 hợp đồng schema đóng băng cuối tuần 2** (recipe · trace-event · `kb.search` · scorecard). Đổi sau đó = **mini-RFC + 4/4 chữ ký**. Integration **chỉ qua 4 contract**.
- **Fixtures-first:** CI chạy 100% bản ghi sẵn; tiêu chí chấm **không phụ thuộc IQ của model** — chấm pipeline / fence / state / trace / gate.
- **Demo tích hợp mỗi thứ Sáu** (weekly Integration Friday): 4 quadrant ghép **thật** với nhau, không stub lẫn nhau.
- **Descope-ladder** (viết sẵn Day 1 — khi kẹt, được cắt **theo danh sách**, không cắt tùy hứng; mỗi nấc tụt **demo 8 bước vẫn sống**):
  1. KB thật → **stub tĩnh 5 doc**
  2. Canvas React Flow → **form + Mermaid**
  3. LLM-judge → **exact-match** scorer
  4. Cost dashboard → **bảng CLI**
- **Luật 2-4-8 (chống kẹt một mình):** kẹt 2h → ghi giả thuyết · 4h → được hint · 8h → mentor ngồi cùng 30'.

---

## 9. Đích đến — "hoàn thành" nghĩa là gì (Definition of Done)

Các mốc gate đóng mỗi sprint. Đây là **đích để các bạn nhắm**, không phải bảng chấm điểm:

| Gate | Khi | "Hoàn thành" = |
|---|---|---|
| **GATE-1 (S1)** | **Day 10** | **Walking-skeleton a→z xâu-kim qua CẢ 4 quadrant** (mỏng mà thông — GATE CỨNG): form tạo agent → interpreter 3-node hardcode → KB stub 5 doc → trace vào SQLite → smoke-eval 5 case in bảng điểm. 1 luồng chạy hết cỡ, PR merge qua review. |
| **GATE-2 (S2)** | **Day 20** | Canvas 6 node (hoặc fallback form+Mermaid) + KB thật (ingest→embed→retrieve + tenant filter) + trace viewer + eval v1 + **spine 4 quadrant ghép happy-path lần đầu**. **4 contract đã freeze.** |
| **GATE-3 / FINAL (S3)** | **Day 30** | **Demo a→z 10' (8 bước)** chạy thật — money-shot fence (bước 5) + gate-chặn (bước 7); **leakage = 0**; eval-gate **chặn bản tệ + rollback**; **cost-lineage khớp 3 surface**; **hitl-pause dừng thật**; handover doc + **cross-handover test** (vận hành quadrant người khác 30' không hỏi tác giả). |

> **Nguyên tắc vàng:** *mỏng-mà-thông > dày-mà-đứt*. Vượt AC (gold-plating) sẽ bị mentor chặn — làm đúng nhịp demo, đừng đánh bóng phần không ai xem.

---

*Đọc tiếp: `README.md` (điều hướng) · `roadmap-3-sprint.md` (30 ngày) · `umbrella-contract.md` (kiến trúc + 4 contract).*
