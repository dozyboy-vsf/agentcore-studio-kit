---
id: studio.debai.day-04
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 4
week_calendar: 1
gate: false
roles:
- de
- aie-2
- aie-1
- swe
title: Ngày 4 — KB stub 5 doc + kb.search thô + smoke-eval bảng điểm
---

# Ngày 4 — KB stub 5 doc + smoke-eval 5 case
### Thứ Năm 23/07 · G2

## Mục tiêu ngày
- **DE:** hoàn tất **KB stub 5 doc Callisto** (chunk tĩnh, 2 tenant) + **`kb.search` thô** (`kb.search(query,tenant,top_k) -> [{chunk_id,text,score,tenant}]`, **CHƯA fence (chặn rò rỉ tại tầng truy xuất)** — filter tenant naive để xâu-kim).
- **AIE-2:** **smoke-eval 5 case** chạy qua interpreter → **in bảng điểm** (case_id · success · citation thô).

## Nêu vấn đề
Bảng điểm là **artifact** — "evidence-or-it-didn't-happen". `kb.search` phải trả `chunk_id` để `llm-step` trích dẫn được, nhờ đó citation mới chấm được. Golden 5 case phải có **nhãn tay**, không để LLM tự chấm LLM.

## Input
Interpreter 3-node (Day 3) + doc-factory bắt đầu (Day 3). AIE-1 hôm nay bỏ stub rỗng, nối `kb.search` thật.

## Output
`kb_stub/` 5 doc + `kb.search()` trả cited chunks; `golden/smoke_5.yaml` (5 case + expected có nhãn tay); **bảng điểm smoke-eval** (5 dòng, success + citation thô) in CLI.

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **DE** | **Bút** doc-factory KB stub 5 doc (frontmatter `tenant`/`section`) + `kb.search` thô (cited chunks, filter tenant naive); **golden 5 case** sinh từ chính doc-factory + **nhãn tay** (1 script, 2 deliverable) |
| **AIE-2** | **Bút** smoke-eval runner 5 case: chạy agent qua interpreter → so `actual` vs `expected` → **scorecard v0** (`success` + `citation_accuracy` thô) → **in bảng điểm** |
| **AIE-1** | `kb-retrieve` executor **nối `kb.search` thật của DE** (bỏ stub rỗng); `llm-step` trích `chunk_id` vào citation |
| **SWE** | Recipe thêm `kb_binding.{kb_id,scope}` (form khai KB scope tenant); wiring `recipe → interpreter` đọc kb_binding |

## Cách cộng tác
Điểm ghép hôm nay dày: **DE→AIE-1** (kb.search thật), **DE→AIE-2** (golden 5 case), **AIE-1→AIE-2** (chunk_id để chấm citation). Chuỗi này là nửa sau của skeleton.

## Ràng buộc
KB **tĩnh**, filter tenant **thô** — permission fence chunk-level để Sprint 3, đừng làm sớm. Mọi tên Callisto **synthetic mới**. Golden 5 case **nhãn tay**, không LLM tự chấm.

## Output chung / riêng
- **Chung:** một agent tạo bằng form giờ lấy được tri thức từ KB và bị chấm ra bảng điểm.
- **Riêng:** DE (KB stub + kb.search + golden) · AIE-2 (smoke-eval bảng điểm) · AIE-1 (kb-retrieve nối thật) · SWE (kb_binding).

## Xong ngày (DoD)
- [ ] `kb.search` trả `chunk_id` (citation chấm được).
- [ ] 5 case **có nhãn tay**.
- [ ] Bảng điểm 5 dòng in ra CLI (success + citation thô).
- [ ] Tên Callisto synthetic mới, NDA sạch.
- [ ] Daily-note D4.
