---
id: studio.debai.tuan-1
type: candidate-brief
status: draft
created: 2026-07-17
set: agentcore-studio
tuan: 1
sprint: 1
audience: trainee
title: 'Đề bài TUẦN 1 — AgentCore Studio: Đứng được trong Xưởng + Walking-skeleton
  xâu-kim a→z (Day 1–10)'
---

# ĐỀ BÀI TUẦN 1 — "ĐỨNG ĐƯỢC TRONG XƯỞNG + XÂU KIM A→Z"
### Sprint 1 · nấc **Follow (làm-theo)** · Day 1 = Thứ Hai **20/07** → Gate Day 10 = Thứ Sáu **31/07**

> Đây là đề bài giao **thẳng cho 4 bạn** (DE · SWE · AIE-1 · AIE-2). Đọc `00-brief-overview.md` trước,
> rồi vào file này để nắm nhịp tuần, cuối cùng mỗi ngày mở `days/day-0N.md` để làm.
> Mọi con số/quy ước bám 4 file gốc — nếu thấy lệch, **file gốc thắng**, báo mentor.

---

## 1. Định hướng tuần

Tuần này các bạn làm **một việc duy nhất, làm cho xong**: dựng một **walking-skeleton** — bộ xương biết đi — của AgentCore Studio, **xâu kim qua CẢ 4 quadrant**. "Mỏng mà thông" chứ không "dày mà đứt": một luồng chạy hết cỡ từ đầu tới cuối, đi qua tay cả 4 người, còn hơn 4 mảnh đẹp mà rời rạc.

Bậc năng lực tuần 1 là **Follow** — bắt chước **đúng** pattern chuẩn (ingest→chunk→embed / node-executor / scorer), và **hỏi rõ đề trước khi code**. Chưa cần sáng tạo kiến trúc; cần đúng nhịp, đúng hợp đồng, chạy thật.

Cuối tuần, mỗi bạn sở hữu **1 quadrant** của một hệ thật-về-cấu-trúc, và cả nhóm chứng minh được: **một agent tạo bằng form có thể chạy qua interpreter, lấy tri thức từ KB, ghi lại vết (trace), và bị chấm điểm bằng eval** — tất cả trên fixtures, không cần model thật.

---

## 2. Nêu vấn đề trọng tâm

Cái khó của tuần 1 **không phải** viết được nhiều code — mà là **nối được kim** qua 4 mảnh do 4 người khác nhau giữ. Bốn cạm bẫy hay giết fresh-grad:

1. **Không xâu được kim** → mỗi người đào sâu quadrant của mình, tới cuối tuần 4 mảnh không ghép được. Đây là **cách trượt số 1**. Spine phải tồn tại và chạy end-to-end.
2. **Code trước khi hiểu đề** → làm lệch hợp đồng, phải làm lại. Luật tuần này: **hỏi rõ (question-batch) trước, code sau**.
3. **Over-engineer sớm** → dựng vector-DB thật, DSL, LLM-judge ngay tuần 1. Tuần này **chỉ cần bản mỏng**: KB stub 5 doc, interpreter 3-node hardcode, smoke-eval 5 case. Làm sớm phần của Sprint sau = bị chặn.
4. **Mock lẫn nhau để né tích hợp** → 4 quadrant giả vờ ghép. Cấm: 4 mảnh phải ghép **thật** với nhau, chỉ hệ đích bên ngoài mới stub.

---

## 3. Input đầu tuần (các bạn được cấp gì)

- **Repo skeleton** mono-repo, Python **3.14**, CI đã bật, fixtures-first (chạy 100% bằng bản ghi sẵn).
- **Kit tuần-0** + **Callisto seed** + **EmbeddingService stub** + **CI fixtures** mentor đã dựng sẵn — **không ai khởi động từ trang trắng**.
- **Callisto Handbook** (bộ tài liệu synthetic tự viết) làm nguồn KB, 2 tenant giả `ankor` / `borea`.
- **4 hợp đồng schema (stub v0)** để 4 quadrant ghép qua: recipe · trace-event · `kb.search` · scorecard.
- **Fixtures kiểu VCR** (bản ghi request/response) + mock tool nghiệp vụ (Tier-1 clone, không gọi hệ thật).

---

## 4. Output cuối tuần — điều kiện qua **Gate Day 10**

Cuối Day 10, nhóm demo **walking-skeleton chạy thật a→z** (bằng chạy thật, không slide):

```
form tạo agent  →  interpreter 3-node hardcode  →  KB stub 5 doc  →  trace vào SQLite  →  smoke-eval 5 case in bảng điểm
 (SWE)              (kb-retrieve→llm-step→tool-call, AIE-1)   (DE)          (DE)                (AIE-2)
```

Qua gate khi **tất cả** đúng:
- Một luồng đi **hết 4 quadrant**, chạy thật, PR đã merge qua review.
- Trace **đọc lại được** đúng thứ tự (0-gap) cho 1 run.
- **INV-1 skeleton**: client tự khai tenant **bị bỏ qua** (server-side quyết tenant).
- **CI xanh 100% fixtures** — không cần model/network thật.
- **Teach-back**: mỗi bạn nói được (bằng lời của mình) **vì sao fence (chặn rò rỉ tại tầng truy xuất)-tại-retrieval và eval-gate (cổng kiểm định chặn publish) là LUẬT**, không phải tính năng thêm.

> Format gate: evidence-pack nộp **trước 24h** + **15'/người** (5' demo chạy thật · 5' quyết định khó · 5' Q&A).

---

## 5. Giao việc theo vai (nhiệm vụ chính cả tuần)

| Vai | Sở hữu quadrant | Nhiệm vụ chính TUẦN 1 | Bút hợp đồng |
|---|---|---|---|
| **DE** *(lát rộng nhất)* | KB pipeline + obs/eval data | **KB stub 5 doc Callisto** (2 tenant) + `kb.search` thô trả cited chunks · **trace sink SQLite** (mọi node emit) + reader in timeline · **golden-set 5 case** có nhãn tay (1 doc-factory nuôi cả KB lẫn golden-set) · cấp cột `tenant`/`section_role` NOT NULL cho INV-1 | **trace-event schema** + **`kb.search` API** |
| **SWE** | Workbench UI + recipe + INV-1 | **Form tạo agent** (instructions/model/tool_whitelist) → sinh `recipe.agent_config` · phác recipe schema thô · gắn emit-trace hook vào interpreter loop · **INV-1 middleware skeleton** (session → resolve tenant server-side, client khai bị bỏ qua) | **recipe schema** |
| **AIE-1** | Interpreter + node executors | **Interpreter 3-node hardcode** `kb-retrieve→llm-step→tool-call` + node-executor chạy 1 case · nối `kb-retrieve` vào `kb.search` thật của DE · **EmbeddingService Protocol + StubEmbedding** (fixtures-first) · interpreter đọc `agent_config` từ recipe | *(tiêu thụ `kb.search` + EmbeddingService)* |
| **AIE-2** | Eval harness + scorecard | **Smoke-eval 5 case** chạy qua interpreter → **in bảng điểm** (success + citation thô) · phác scorecard format v0 · scorecard **đọc citations từ trace** (một nguồn số) · đảm bảo smoke-eval deterministic qua fixtures | **scorecard format** |

> Chi tiết từng ngày trong `days/day-0N.md`. Bảng này là bức tranh cả tuần, không thay cho việc đọc từng ngày.

---

## 6. Cách thức cộng tác

**4 hợp đồng schema — ai giữ bút cái nào** (ở tuần 1 mỗi bút dựng bản **v0 dùng được** để xâu-kim, **chưa đóng băng**):

| Hợp đồng | Bút | Bản v0 tuần 1 |
|---|---|---|
| **recipe schema** | SWE | `agent_config` (instructions/model/tool_whitelist) đủ cho form-create |
| **trace-event schema** | DE | `{event_id, run_id, agent_id, tenant, node_id, node_type, ts, tokens, cost}` vào SQLite |
| **`kb.search` API** | DE | `kb.search(query, tenant, top_k) -> [{chunk_id, text, score, tenant}]` (chưa fence) |
| **scorecard format** | AIE-2 | `{case_id, expected, actual, success, citation_accuracy}` + aggregate |

**Nhịp tích hợp:**
- **Integration CHỈ qua 4 hợp đồng trên** — không ai gọi thẳng vào bụng code người khác.
- Nhịp tuần: **T2 kickoff · T3–T5 build · T6 tích hợp + weekly demo + peer-review chéo**.
- **Xâu-kim lần 1 ở Day 6** (đầu tuần 2): nối 1 luồng đầu-cuối qua cả 4 quadrant — mỏng, chưa đẹp, nhưng **thông**.
- **Demo thứ Sáu (Day 5, Day 10):** 4 quadrant ghép **thật** với nhau; Day 10 là gate.

---

## 7. Ràng buộc (đọc kỹ — vi phạm là chặn, không phải trừ điểm)

- **Fixtures-first:** CI chạy 100% bản ghi sẵn; tiêu chí chấm **không phụ thuộc IQ của model** (chấm pipeline/trace/state/gate).
- **Contract v0 tuần này → freeze ở Day 11:** đừng đóng băng sớm; nhưng bản v0 phải **dùng được** để ghép.
- **6 node-type đóng — CẤM thêm:** tuần này chỉ hardcode 3 node. Cấm DSL turing-complete, cấm import LangGraph/Camunda.
- **NDA synthetic 100%:** dùng Callisto tự viết, 0 PII, 0 tên thật, identifier sinh mới; secret-scan pre-commit bật.
- **Chưa làm (để Sprint sau, làm sớm = bị chặn):** canvas React Flow · KB thật ingest→embed · fence chunk-level + leak-test · eval-gate CHẶN + rollback · LLM-judge · cost dashboard 3-surface.
- **Python 3.14.** Kẹt >2h → ghi giả thuyết; >4h → xin hint; >8h → mentor ngồi cùng 30' (đừng kẹt một mình).

---

## 8. Output chung / Output riêng

**Output chung (cả nhóm bàn giao):**
- Walking-skeleton chạy a→z qua CẢ 4 quadrant (form→interpreter→KB→trace→smoke-eval) — 1 luồng chạy thật, PR merge.
- CI xanh 100% fixtures; test happy + ≥1 negative mỗi quadrant.
- **4 hợp đồng ở bản v0** sẵn sàng cho freeze ceremony Day 11.
- Evidence-pack + demo recording + daily-notes 10/10.

**Output riêng mỗi vai:**
- **DE:** KB stub 5 doc + `kb.search` cited chunks · trace sink SQLite + reader timeline · golden-set 5 case nhãn tay.
- **SWE:** Form tạo agent → recipe · INV-1 middleware skeleton (client-khai-tenant bị ignore).
- **AIE-1:** Interpreter 3-node hardcode chạy qua EmbeddingService stub (CI 100% fixtures).
- **AIE-2:** Smoke-eval 5 case → bảng điểm (success + citation từ trace) · scorecard format v0.

---

## 9. Lộ trình 10 ngày

| Ngày | Thứ/Ngày | Mục tiêu | Chi tiết |
|---|---|---|---|
| **Day 1** | T2 20/07 | Onboarding + env 3.14 + NDA + teach-back 1 quadrant/người | [`days/day-01.md`](./days/day-01.md) |
| **Day 2** | T3 21/07 | Đọc đề + scaffold repo 4 quadrant + descope-ladder + question-batch + 4 interface v0 | [`days/day-02.md`](./days/day-02.md) |
| **Day 3** | T4 22/07 | Form tạo agent + interpreter 3-node hardcode chạy 1 case + PR #1 | [`days/day-03.md`](./days/day-03.md) |
| **Day 4** | T5 23/07 | KB stub 5 doc + `kb.search` thô + smoke-eval 5 case in bảng điểm | [`days/day-04.md`](./days/day-04.md) |
| **Day 5** | T6 24/07 | Trace vào SQLite (mọi node emit) + reader timeline · weekly demo #1 · peer-review | [`days/day-05.md`](./days/day-05.md) |
| **Day 6** | T2 27/07 | **Xâu-kim lần 1** — nối 1 luồng đầu-cuối qua cả 4 quadrant | [`days/day-06.md`](./days/day-06.md) |
| **Day 7** | T3 28/07 | EmbeddingService Protocol (stub local) + CI 100% fixtures | [`days/day-07.md`](./days/day-07.md) |
| **Day 8** | T4 29/07 | INV-1 skeleton — client tự khai tenant bị bỏ qua (tag vs isolation) | [`days/day-08.md`](./days/day-08.md) |
| **Day 9** | T5 30/07 | Harden — test happy + ≥1 negative/quadrant · soạn evidence-pack | [`days/day-09.md`](./days/day-09.md) |
| **Day 10** | T6 31/07 | **GATE-1** — demo walking-skeleton a→z + teach-back | [`days/day-10.md`](./days/day-10.md) |

---

## 10. Checklist qua Gate Day 10

- [ ] **Xâu-kim a→z**: 1 luồng chạy thật đi hết form → interpreter 3-node → KB stub 5 doc → trace SQLite → smoke-eval bảng điểm.
- [ ] **Form tạo agent → recipe** (`agent_config`), zero code lõi chạm khi tạo agent.
- [ ] **Interpreter 3-node hardcode** `kb-retrieve→llm-step→tool-call` chạy qua executor.
- [ ] **KB stub 5 doc + `kb.search` cited chunks** (trả `chunk_id`, citation chấm được).
- [ ] **Trace SQLite** — mọi node emit + reader in timeline đúng thứ tự (0-gap).
- [ ] **Smoke-eval 5 case → bảng điểm** (success + citation-accuracy từ trace); golden 5 case nhãn tay.
- [ ] **CI 100% fixtures** — pipeline/trace/eval xanh không cần model/network.
- [ ] **INV-1 skeleton** — demo client-khai-tenant bị ignore (server-side resolve).
- [ ] **Test happy + ≥1 negative/quadrant** có nghĩa; **PR merge qua review** (không DSL/LangGraph).
- [ ] **Teach-back** "vì sao fence-tại-retrieval & eval-gate là LUẬT — bằng lời của em".
- [ ] **Daily-notes 10/10** + evidence-pack nộp trước 24h.
- [ ] **NDA sạch** — Callisto synthetic, 0 PII, secret-scan xanh.

---

*Đọc tiếp mỗi ngày: `days/day-01.md` … `days/day-10.md`. Tra hợp đồng chính xác: `../00-orientation/umbrella-contract.md §3`.*
</content>
</invoke>
