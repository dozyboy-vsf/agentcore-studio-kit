---
id: studio.debai.day-02
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 2
week_calendar: 1
gate: false
roles:
- de
- swe
- aie-1
- aie-2
title: Ngày 2 — Đọc đề, scaffold 4 quadrant, hỏi rõ trước khi code
---

# Ngày 2 — Đọc đề, scaffold, hỏi rõ
### Thứ Ba 21/07 · G1→G2

## Mục tiêu ngày
Đọc đề **paved-path trọn vòng đời** (authoring→fence (chặn rò rỉ tại tầng truy xuất)→eval-gate (cổng kiểm định chặn publish)); **scaffold repo mono** phác **4 quadrant** (package/folder mỗi owner); viết **drop-list descope-ladder 4 nấc**; gửi **question-batch ≥3 câu** làm rõ đề; khai **4 interface v0** (chưa freeze).

## Nêu vấn đề
Hợp đồng là **hiến pháp** — 4 quadrant chỉ ghép được nếu interface rõ từ đầu. Và luật tuần này: **hỏi rõ (clarify-first) trước khi code**. Viết descope-ladder sẵn hôm nay để khi kẹt được cắt **theo danh sách**, không cắt tùy hứng.

## Input
Output Day 1 (env + hiểu quadrant) + 4 file gốc (charter · roadmap · umbrella-contract).

## Output
Repo scaffold tree 4 quadrant (đã push); **DESCOPE.md** (4 nấc: KB→stub · canvas→form+Mermaid · judge→exact-match · dashboard→CLI); 4 interface v0 stub (recipe/trace-event/kb.search/scorecard); **question-batch** gửi mentor; daily-note D2.

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **DE** | **Bút v0** `trace-event` interface + `kb.search(query,tenant,top_k)` signature; phác schema doc Callisto (frontmatter tenant/section) + bảng chunk/index |
| **SWE** | **Bút v0** `recipe` interface (`agent_config` tối thiểu) + skeleton package `workbench/`; phác form field |
| **AIE-1** | Phác **interpreter loop** + node-executor interface (`execute(node, ctx) -> ctx'`); chọn định dạng **fixture VCR-style** cho `llm-step` |
| **AIE-2** | **Bút v0** `scorecard` interface (`{case_id, expected, actual, success, citation_accuracy}`); chốt shape **5 smoke-case cùng DE** (ai cấp `expected`) |

## Cách cộng tác
Điểm ghép hôm nay là **tên interface phải khớp** umbrella §3. DE và AIE-2 ngồi cùng chốt shape 5 smoke-case (DE cấp `expected` có nhãn tay). Scaffold phải tách **đúng owner** — mỗi quadrant một folder, không lẫn.

## Ràng buộc
Bám **6 node-type đóng**, CẤM thêm. 4 interface mới ở **v0** (draft), chưa freeze. Mỗi nấc descope phải giữ **walking-skeleton vẫn sống**.

## Output chung / riêng
- **Chung:** repo scaffold 4 quadrant + DESCOPE.md + question-batch gửi mentor.
- **Riêng:** mỗi bút giữ interface v0 của mình (DE giữ 2: trace-event + kb.search).

## Xong ngày (DoD)
- [ ] Scaffold 4 quadrant push, tách đúng owner.
- [ ] DESCOPE.md 4 nấc viết sẵn.
- [ ] 4 interface v0 tên khớp umbrella §3.
- [ ] Question-batch ≥3 câu gửi mentor **trước khi** code.
- [ ] Daily-note D2.
