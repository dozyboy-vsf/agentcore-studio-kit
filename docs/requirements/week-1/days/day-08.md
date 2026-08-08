---
id: studio.debai.day-08
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 8
week_calendar: 2
gate: false
roles:
- swe
- de
- aie-1
- aie-2
title: 'Ngày 8 — INV-1 skeleton: client tự khai tenant bị bỏ qua'
---

# Ngày 8 — INV-1 skeleton (Tenant-Wall)
### Thứ Tư 29/07 · G2

## Mục tiêu ngày
Cắm **INV-1 skeleton** (SWE own, cả team consume): middleware **resolve `{tenant,user,roles}` từ `session_id` server-side**; mọi case/trace/kb.search mang **`tenant_id NOT NULL`** + **mandatory filter**; **client tự khai tenant = BỊ BỎ QUA**. Phân biệt **tag (nhãn mềm) vs isolation (fail-closed filter)**.

## Nêu vấn đề
Đây là **nền** của fence (chặn rò rỉ tại tầng truy xuất) chunk-level (Sprint 3). Bài học cốt lõi: **tag ≠ isolation**. "Nhờ LLM đừng nói" là fake fence; isolation thật là **fail-closed filter** dựa trên danh tính resolve **server-side**, không tin client tự khai.

## Input
Spine + Protocol (Day 6–7). Hôm nay chèn lớp danh tính vào mọi query.

## Output
Middleware resolve tenant từ session; `kb.search`/trace query mang **mandatory `tenant_id` filter**; demo **client-khai-tenant bị ignore**; ghi chú **tag-vs-isolation** (1 đoạn).

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **SWE** | **Bút** INV-1 middleware (session → resolve `{tenant,user,roles}` server-side + mandatory filter fail-closed); `tenant_id NOT NULL` |
| **DE** | `kb.search` + trace store **áp tenant filter server-side** (client khai tenant bị bỏ qua); chuẩn bị `section_role` field (chưa filter — để Sprint 3) |
| **AIE-1** | Interpreter **truyền `session` context** (không truyền tenant do client khai); executor không tự set tenant |
| **AIE-2** | smoke-eval **chạy đúng tenant scope** (case ankor không thấy chunk borea); ghi vào bảng điểm |

## Cách cộng tác
SWE giữ bút middleware; cả team **consume**: DE áp filter data-plane, AIE-1 truyền session không truyền tenant client, AIE-2 kiểm tenant scope trong eval. Đây là floor chung — ai cũng phải tuân.

## Ràng buộc
Chưa cần test T1 IDOR / T6 label-spoof (để Sprint 2); chưa fence chunk-level (để Sprint 3). Hôm nay chỉ cần **đúng pattern**: server-side resolve + mandatory filter fail-closed.

## Output chung / riêng
- **Chung:** danh tính tenant do server quyết, client không lách được.
- **Riêng:** SWE (middleware) · DE (filter data-plane + section_role field) · AIE-1 (truyền session) · AIE-2 (eval đúng scope).

## Xong ngày (DoD)
- [ ] Client gửi `tenant=borea` khi session là `ankor` → `kb.search` **chỉ** trả ankor.
- [ ] `tenant_id NOT NULL` + mandatory filter fail-closed.
- [ ] Giải thích được vì sao "nhờ LLM đừng nói" là **fake fence**.
- [ ] Ghi chú tag-vs-isolation (1 đoạn).
- [ ] Daily-note D8.
