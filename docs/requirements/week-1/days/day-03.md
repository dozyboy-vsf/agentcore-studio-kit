---
id: studio.debai.day-03
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 3
week_calendar: 1
gate: false
roles:
- swe
- aie-1
- de
- aie-2
title: Ngày 3 — Form tạo agent + interpreter 3-node hardcode, PR đầu tiên
---

# Ngày 3 — Form + interpreter 3-node, PR #1
### Thứ Tư 22/07 · G2

## Mục tiêu ngày
- **SWE:** dựng **form tạo agent** → xuất `recipe.agent_config` (instructions/model/tool_whitelist).
- **AIE-1:** dựng **interpreter 3-node hardcode** (`kb-retrieve → llm-step → tool-call`) + node-executor chạy **1 case** synthetic, in trạng thái cuối; **mở PR đầu tiên**.

## Nêu vấn đề
Đây là hai mắt xích "chạy" đầu tiên của skeleton. Bẫy lớn: **generalize quá đà** interpreter thành DSL / import LangGraph-Camunda. Learning-goal là **tự viết** interpreter mini, bắt chước **đúng** pattern node-executor — không phình node, không config động.

## Input
Interface v0 từ Day 2 (recipe + node-executor). `kb.search` của DE hôm nay còn là stub tạm (trả rỗng).

## Output
Form → `recipe.yaml` (agent_config) chạy được; `interpreter/` + 3 node-executor hardcode; 1 case chạy CLI in state/output cuối; **PR #1** mở (bắt đầu vòng review).

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **SWE** | **Bút** form tạo agent → xuất `recipe.agent_config`; wiring `recipe → interpreter` entry |
| **AIE-1** | **Bút** interpreter 3-node hardcode + executor: `kb-retrieve` (gọi `kb.search` **stub tạm** trả rỗng), `llm-step` (qua LLM **stub fixture** trả `{answer, tokens}`), `tool-call` (dispatch stub whitelist) |
| **DE** | Cấp **`kb.search` stub signature** (chưa có doc) để AIE-1 wiring; bắt đầu **doc-factory** 5 doc Callisto (2 tenant `ankor`/`borea`) |
| **AIE-2** | Phác **smoke-eval runner** skeleton (đọc case → chạy agent → so `expected` → in success) — chờ interpreter để nối |

## Cách cộng tác
AIE-1 **chờ** signature `kb.search` của DE để wiring (dù còn trả rỗng). SWE **chờ** shape `recipe` để form xuất đúng. Ai chờ ai đều **qua interface v0**, không gọi thẳng vào bụng code.

## Ràng buộc
Chưa canvas, chưa validator động — chỉ **form + chuỗi node hardcode**. Cap **6 node-type đóng**, hôm nay hardcode 3. **CẤM** DSL turing-complete / import LangGraph-Camunda.

## Output chung / riêng
- **Chung:** PR #1 mở, bắt đầu văn hoá review.
- **Riêng:** SWE (form→recipe) · AIE-1 (interpreter 3-node chạy 1 case) · DE (doc-factory bắt đầu) · AIE-2 (runner skeleton).

## Xong ngày (DoD)
- [ ] Form xuất `agent_config` **đúng shape recipe v0**.
- [ ] 3 node chạy **đúng thứ tự** `kb-retrieve→llm-step→tool-call`, in state cuối.
- [ ] Node-executor có **docstring mô tả input/output**.
- [ ] PR #1 mở.
- [ ] Daily-note D3.
