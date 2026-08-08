---
id: studio.debai.day-09
type: candidate-brief-day
status: draft
set: agentcore-studio
sprint: 1
day: 9
week_calendar: 2
gate: false
roles:
- de
- swe
- aie-1
- aie-2
title: 'Ngày 9 — Harden: test happy + negative mỗi quadrant + soạn evidence-pack'
---

# Ngày 9 — Harden + chuẩn bị gate
### Thứ Năm 30/07 · G2

## Mục tiêu ngày
**Harden walking-skeleton**: mỗi quadrant viết **test happy-path + ≥1 negative**; **smoke-eval nối vào trace** (đọc citations từ trace chấm citation-accuracy — một nguồn số); rà **daily-notes D1–D9** liền mạch; **soạn evidence-pack** cho gate (nộp **trước 24h**).

## Nêu vấn đề
Skeleton chạy được chưa đủ — phải chứng minh nó **không gãy im lặng**. Test negative phải bắt lỗi **thật** (không phải test giả). Và evidence-pack phải đủ để mentor chấm **không cần hỏi**.

## Input
Spine hardened từ Day 6–8. Hôm nay bọc test + gom bằng chứng.

## Output
Test suite **happy + ≥1 negative/quadrant xanh**; smoke-eval **đọc citations từ trace** (không tự tính rời); daily-notes 9/10 đủ; **evidence-pack draft** (demo script a→z + PR links + CI/test output + bảng điểm).

## Giao việc hôm nay
| Vai | Việc |
|---|---|
| **DE** | Test **trace ordering (0-gap) + rebuild-read** + `kb.search` **tenant-mismatch trả rỗng**; golden 5 case ổn định |
| **SWE** | Test **form→recipe valid** + recipe thiếu field **bị reject**; harden INV-1 middleware (client-khai-tenant ignore) |
| **AIE-1** | Test interpreter **3-node deterministic qua fixture** (negative: fixture thiếu → fail **rõ**, không nuốt lỗi) |
| **AIE-2** | Test **smoke-eval nối trace** (citation-accuracy từ `citations` trace) + bảng điểm **có số ổn định** chạy lại |

## Cách cộng tác
Mỗi vai tự bọc test quadrant mình, nhưng smoke-eval của AIE-2 phải lấy citation **từ trace của DE** (một nguồn số, không tính rời). Cả nhóm gom bằng chứng vào **một** evidence-pack chung.

## Ràng buộc
Test negative phải **bắt lỗi thật**. Evidence-pack nộp **trước 24h** trước gate (31/07). Không thêm feature mới — chỉ harden.

## Output chung / riêng
- **Chung:** test suite xanh + evidence-pack draft + daily-notes liền mạch.
- **Riêng:** mỗi vai test happy + ≥1 negative có nghĩa cho quadrant mình.

## Xong ngày (DoD)
- [ ] Test negative **bắt lỗi thật** (không phải test giả).
- [ ] smoke-eval lấy citation **từ trace** (một nguồn số).
- [ ] Bảng điểm chạy lại ra **cùng** số.
- [ ] Evidence-pack đủ để mentor chấm không cần hỏi.
- [ ] Daily-note D9.
