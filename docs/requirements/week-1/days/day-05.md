---
id: studio.debai.day-05
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 5
week_calendar: 1
gate: false
roles:
- de
- swe
- aie-1
- aie-2
title: 'Ngày 5 — Trace vào SQLite + weekly demo #1 + peer-review'
---

# Ngày 5 — Trace SQLite + demo tích hợp đầu tiên
### Thứ Sáu 24/07 · Integration/review day (≥50% review, không cấp goal build mới)

## Mục tiêu ngày
- **DE:** **trace event thô vào SQLite** — **mọi node emit** `{event_id, run_id, agent_id, tenant, node_id, node_type, ts, tokens, cost}`; reader in **timeline đúng thứ tự** cho 1 run.
- Cả team: **peer-review chéo PR đầu tiên** + **weekly demo #1**.

## Nêu vấn đề
Trace là **first-class** — mọi node phải emit một event, không phải log rời rạc. Đây là "mặt quan sát được" của skeleton: nếu không đọc lại được timeline thì không ai chứng minh được luồng đã chạy.

## Input
Interpreter + kb.search + smoke-eval (Day 3–4). Hôm nay gắn trace xuyên qua tất cả.

## Output
`trace.sqlite` sinh khi chạy run; `trace` reader in **timeline node đúng thứ tự** (monotonic `ts`, 0-gap); **comment peer-review** trên PR chéo; **recording weekly demo #1**.

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **DE** | **Bút** trace sink SQLite (mọi node emit) + `trace` reader (timeline in-order); review PR SWE (recipe shape) |
| **SWE** | Gắn **emit-trace hook** vào interpreter loop (mỗi node → 1 event); review PR AIE-2 (scorecard) |
| **AIE-1** | Node-executor **populate** `tokens`/`node_type`/`outputs` vào trace event; review PR DE (kb.search) |
| **AIE-2** | Scorecard **đọc trace** để lấy `citations` chấm citation-accuracy; nạp smoke-5 vào demo; review PR AIE-1 (interpreter) |

## Cách cộng tác
Hôm nay **ít build, nhiều ghép + review**. Trace là điểm hội tụ: SWE gắn hook, AIE-1 đổ dữ liệu vào, DE sink + đọc lại, AIE-2 tiêu thụ để chấm. **Review chéo vòng tròn** — mỗi người review PR của một người khác, bắt ≥1 vấn đề thật.

## Ràng buộc
Trace SQLite **thô** — cost-lineage 3-surface để Sprint 3. Ngày review: **không cấp goal build mới**, tập trung ghép + đọc code nhau.

## Output chung / riêng
- **Chung:** trace xuyên suốt + weekly demo #1 chạy thật + peer-review chéo có chất.
- **Riêng:** DE (trace sink + reader) · SWE (emit hook) · AIE-1 (populate trace) · AIE-2 (đọc trace chấm citation).

## Xong ngày (DoD)
- [ ] **Mọi node** của 1 run emit event (không sót node).
- [ ] Timeline đọc lại **đúng thứ tự + 0-gap**.
- [ ] Mỗi người review PR người khác, bắt **≥1 vấn đề thật**.
- [ ] Weekly demo #1 chạy thật (recording).
- [ ] Daily-note D5.
