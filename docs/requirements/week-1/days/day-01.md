---
id: studio.debai.day-01
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 1
week_calendar: 1
gate: false
roles:
- de
- swe
- aie-1
- aie-2
title: 'Ngày 1 — Kickoff: đứng được trong Xưởng'
---

# Ngày 1 — Kickoff: đứng được trong Xưởng
### Thứ Hai 20/07 · macro-goal G1

## Mục tiêu ngày
Hoàn tất onboarding 100%; dựng env **Python 3.14** chạy `pytest` **xanh** trên kit tuần-0; **ký NDA pledge** (Callisto synthetic-only); **teach-back 10'/người** — mỗi bạn nhận **1 quadrant** và vẽ được ranh giới **engine | recipe**.

## Nêu vấn đề
Trước khi viết dòng code nào, phải hiểu mình đứng ở đâu: đâu là **engine** (động cơ PTNT build một lần: schema/interpreter/fence (chặn rò rỉ tại tầng truy xuất)/trace/gate) và đâu là **recipe** (công thức khai báo PTSP: agent-config/DAG/kb-binding/golden-set/ngưỡng). Nhầm ranh giới này là nhầm cả tuần.

## Input
Kit tuần-0 + Callisto seed + fixtures CI mentor đã dựng sẵn. Chưa viết code mới — hôm nay dùng đồ có sẵn.

## Output
`python --version` = 3.14 + `pytest` xanh (screenshot); NDA pledge đã ký + secret-scan pre-commit bật; artifact teach-back (slide/whiteboard) 1 quadrant/người; **daily-note D1**.

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **DE** | Teach-back **KB pipeline** (ingest→chunk→embed→index + fence-data + golden-set); clone repo, chạy Callisto seed + fixtures; đọc `kb.search` + trace-event trong umbrella §3.2/§3.3 |
| **SWE** | Teach-back **Workbench/recipe** (form→recipe khai báo, zero code lõi) + **ranh giới engine\|recipe made literal**; đọc recipe schema §3.1 + fence luật §1 |
| **AIE-1** | Teach-back **interpreter + 6 node-type đóng** (kb-retrieve·llm-step·condition·tool-call·hitl-pause·end — CẤM node lạ); đọc **EmbeddingService Protocol** §3.5 |
| **AIE-2** | Teach-back **eval-gate (cổng kiểm định chặn publish) là cơ chế** (PASS scorecard mới Publish; FAIL→chặn+rollback) + trace playground; đọc scorecard §3.4 |

## Cách cộng tác
Hôm nay là **kickoff sync sáng** cả team — đọc lộ trình + luật chơi cùng nhau. Chưa ghép code; nhưng mỗi người phải nắm quadrant của mình **và** biết 3 người kia giữ gì (để tuần này ghép qua hợp đồng, không "làm chung 1 file").

## Ràng buộc
Env đúng **Python 3.14**. NDA là **cổng pass/fail** — Callisto synthetic, 0 PII, identifier sinh mới. Chưa code capability mới.

## Output chung / riêng
- **Chung:** cả team qua onboarding, môi trường chạy, luật chơi thống nhất.
- **Riêng:** mỗi bạn 1 artifact teach-back đúng quadrant mình sở hữu.

## Xong ngày (DoD)
- [ ] `pytest` xanh trên env 3.14 (screenshot).
- [ ] NDA pledge ký + secret-scan pre-commit bật.
- [ ] Teach-back 1 quadrant/người xong.
- [ ] Nói được **1 lý do** fence-tại-retrieval là luật.
- [ ] Daily-note D1.
