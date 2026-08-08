---
id: studio.debai.day-07
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 7
week_calendar: 2
gate: false
roles:
- aie-1
- de
- swe
- aie-2
title: Ngày 7 — EmbeddingService Protocol (stub) + CI 100% fixtures
---

# Ngày 7 — EmbeddingService Protocol + CI fixtures
### Thứ Ba 28/07 · G2

## Mục tiêu ngày
Cắm **EmbeddingService Protocol (stub local)** + adapter **fixtures-first**: `llm-step`/`kb-retrieve` gọi qua `EmbeddingService.embed(texts)->[vector]` (impl **stub local từ fixtures**, không gọi model thật); interpreter **đọc `agent_config` từ form** đầy đủ (instructions/model/tool_whitelist chảy vào executor). **CI chạy 100% fixtures**.

## Nêu vấn đề
Đây là **seam Protocol 2-impl**: hôm nay chỉ bật stub, nhưng phải sạch để sau này swap gateway thật **không phải sửa interpreter**. Và luật vàng: **AC không phụ thuộc IQ của LLM** — chấm pipeline/trace, không chấm chất lượng câu trả lời.

## Input
Spine xâu-kim từ Day 6. Hôm nay chèn Protocol vào chỗ đang gọi model/embed.

## Output
`EmbeddingService` Protocol + `StubEmbedding` (fixtures) adapter; interpreter đọc `agent_config` đầy đủ; **CI xanh 100% fixtures** (không cần model/network).

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **AIE-1** | **Bút** `EmbeddingService` Protocol + `StubEmbedding` (fixtures-first); interpreter đọc `agent_config` (instructions vào prompt, tool_whitelist vào tool-call) |
| **DE** | Cấp **fixtures embed/chunk** cho stub (recorded vector Callisto); đảm bảo `kb.search` dùng **cùng** fixtures |
| **SWE** | Form → `agent_config` **đủ 3 field** (instructions/model/tool_whitelist) chảy vào recipe → interpreter |
| **AIE-2** | Đảm bảo smoke-eval **deterministic qua fixtures** (chạy lại ra **cùng** bảng điểm — golden fixture) |

## Cách cộng tác
AIE-1 định nghĩa Protocol; DE cấp fixtures để stub dùng; AIE-2 xác nhận toàn luồng deterministic (chạy 2 lần ra cùng số). Đây là điều kiện để CI đứng vững — không flaky do model.

## Ràng buộc
2-impl seam nhưng tuần này **chỉ bật stub**; gateway thật để Phase-2 (flag). CI **KHÔNG** được gọi network/model thật.

## Output chung / riêng
- **Chung:** CI xanh 100% fixtures — cả nhóm chạy lại luôn ra cùng kết quả.
- **Riêng:** AIE-1 (Protocol + stub) · DE (fixtures) · SWE (agent_config đủ field) · AIE-2 (eval deterministic).

## Xong ngày (DoD)
- [ ] Đổi `StubEmbedding`→`GatewayEmbedding` **không phải sửa interpreter** (Protocol sạch).
- [ ] CI **không** gọi network/model thật.
- [ ] Interpreter đọc `agent_config` đủ 3 field.
- [ ] smoke-eval chạy lại ra **cùng** bảng điểm.
- [ ] Daily-note D7.
