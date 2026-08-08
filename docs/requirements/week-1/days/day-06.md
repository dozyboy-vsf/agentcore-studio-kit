---
id: studio.debai.day-06
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 6
week_calendar: 2
gate: false
roles:
- swe
- aie-1
- de
- aie-2
title: 'Ngày 6 — Xâu-kim lần 1: nối 1 luồng đầu-cuối qua cả 4 quadrant'
---

# Ngày 6 — Xâu-kim lần 1
### Thứ Hai 27/07 · Week-2 kickoff · G2

## Mục tiêu ngày
**Xâu-kim lần 1**: nối **1 luồng đầu-cuối (mỏng)** qua CẢ 4 quadrant —
`form (recipe) → interpreter 3-node → kb-retrieve gọi kb.search → mọi node emit trace SQLite → smoke-eval đọc trace in bảng điểm`. Một luồng **nối được đầu-cuối**, chưa cần đẹp.

## Nêu vấn đề
Đây là ngày quan trọng nhất của tuần: chứng minh **spine tồn tại**. Bẫy cần diệt: các mảnh vẫn **mock lẫn nhau** để né tích hợp. Cấm — 4 quadrant phải ghép **thật** qua interface v0, chỉ hệ đích ngoài mới stub.

## Input
Toàn bộ mảnh Day 3–5 (form, interpreter, kb.search, trace, smoke-eval). Hôm nay gỡ hardcode, nối thật.

## Output
1 luồng chạy: form → recipe → interpreter → kb.search → trace SQLite → smoke-eval bảng điểm — **end-to-end 1 lần chạy** (log/recording); ghi lại **điểm gãy** còn sót.

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **SWE** | Recipe từ form **feed vào interpreter entry** đầy đủ (agent_config + kb_binding); gỡ hardcode case tay |
| **AIE-1** | Interpreter **đọc `recipe`** (không hardcode node list nữa — đọc `dag` 3-node từ recipe), chạy qua kb.search + trace |
| **DE** | `kb.search` + trace sink **nhận call thật** từ interpreter (không stub rỗng); kiểm citation ra `chunk_id` |
| **AIE-2** | smoke-eval **chạy trên luồng thật** (không mock agent); in **N/5 pass** vào bảng điểm |

## Cách cộng tác
Hôm nay **tất cả ghép vào nhau cùng lúc**. Ai còn stub người khác phải gỡ. Nếu một mắt xích gãy, cả spine đứng — nên ưu tiên **thông trước, đẹp sau**. Ghi rõ điểm gãy còn lại để tuần này xử tiếp.

## Ràng buộc
Ghép **thật** qua interface v0, **không mock lẫn nhau** ngoài mock boundary (chỉ hệ đích ngoài mới stub). Vẫn 3-node, chưa thêm node.

## Output chung / riêng
- **Chung:** **walking-skeleton spine đầu tiên tồn tại** — 1 luồng chạy hết 4 quadrant.
- **Riêng:** mỗi vai gỡ stub của mình, nhận call thật từ mắt xích trước.

## Xong ngày (DoD)
- [ ] 1 luồng đi **hết 4 quadrant** (form→interpreter→KB→trace→eval).
- [ ] **Không còn** mảnh nào mock lẫn nhau để né integration.
- [ ] citation ra `chunk_id` thật; smoke-eval in N/5 pass.
- [ ] Điểm gãy còn lại được ghi.
- [ ] Daily-note D6.
