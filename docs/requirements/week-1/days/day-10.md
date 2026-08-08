---
id: studio.debai.day-10
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 10
week_calendar: 2
gate: true
roles:
- de
- swe
- aie-1
- aie-2
title: 'Ngày 10 — GATE-1: demo walking-skeleton a→z + teach-back'
---

# Ngày 10 — GATE-1 (walking-skeleton chạy thật)
### Thứ Sáu 31/07 · Integration/review — không build mới

## Mục tiêu ngày
**GATE-1**: demo **walking-skeleton chạy thật a→z xâu-kim CẢ 4 quadrant** —
`form → interpreter 3-node → KB stub 5 doc → trace SQLite → smoke-eval 5 case bảng điểm` —
+ **INV-1 client-khai-tenant bị ignore** + **trace timeline đọc lại đúng thứ tự**;
+ **teach-back**: *"vì sao fence (chặn rò rỉ tại tầng truy xuất)-tại-retrieval & eval-gate (cổng kiểm định chặn publish) là LUẬT — bằng lời của em"*.

## Nêu vấn đề
Câu trung tâm của gate: *"Chỉ cho tôi 1 luồng đi hết form→interpreter→KB→trace→smoke-eval — bằng chạy thật, không slide."* Đây là lúc chứng minh **mỏng-mà-thông**: spine tồn tại, chạy end-to-end, và mỗi bạn hiểu **vì sao** các luật (fence, eval-gate) tồn tại.

## Input
Toàn bộ skeleton + test + evidence-pack (đã nộp trước 24h).

## Output
Demo recording a→z; teach-back mỗi người; **4 hợp đồng ở bản v0** sẵn cho freeze ceremony Day 11.

## Giao việc hôm nay (mỗi người demo 5' mảnh mình + teach-back)
| Vai | Việc |
|---|---|
| **DE** | Demo **KB stub 5 doc + `kb.search` cited chunks** + **trace SQLite timeline đọc lại khớp** + golden 5 case |
| **SWE** | Demo **form tạo agent → recipe** + **INV-1 client-khai-tenant bị ignore** + wiring recipe→interpreter |
| **AIE-1** | Demo **interpreter 3-node hardcode** (`kb-retrieve→llm-step→tool-call`) chạy qua **EmbeddingService stub (CI 100% fixtures)** |
| **AIE-2** | Demo **smoke-eval 5 case → bảng điểm** (success + citation-accuracy từ trace) — teach-back **eval-gate là cơ chế** |

## Cách cộng tác
Demo là **một luồng chung** đi qua tay 4 người — không phải 4 demo rời. Mỗi bạn demo 5' mảnh mình **trong** luồng chung đó, rồi teach-back. Format: 5' demo chạy thật · 5' quyết định khó · 5' Q&A.

## Ràng buộc
Ngày gate — **không build mới**. Demo bằng **chạy thật**, không slide. Nhớ chỉ ra được **điểm nào skeleton sẽ gãy khi lên Sprint 2** (canvas / KB thật / fence) trước khi mentor hỏi.

## Output chung / riêng
- **Chung:** walking-skeleton a→z qua gate + 4 hợp đồng v0 sẵn cho freeze Day 11.
- **Riêng:** mỗi vai demo mảnh mình + teach-back luật mình sở hữu.

## Xong ngày (DoD)
- [ ] **1 luồng chạy thật** đi hết 4 quadrant (không slide).
- [ ] INV-1 client-khai-tenant bị ignore (demo).
- [ ] Trace timeline đọc lại đúng thứ tự.
- [ ] Teach-back "fence-tại-retrieval & eval-gate là LUẬT".
- [ ] Chỉ ra được điểm skeleton sẽ gãy khi lên Sprint 2.
- [ ] Daily-notes **10/10** đủ.
