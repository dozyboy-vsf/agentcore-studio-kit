> **Repo `ai20k-batch2-requirements`** — đề bài cho 4 TTS AI20K Batch 2 (read-only). Mentor đẩy dần theo ngày. Nguồn sự thật nội bộ do mentor giữ; bản này là bản student-safe.

---
id: studio.de-bai-ung-vien.readme
type: navigation
status: draft
created: 2026-07-17
set: agentcore-studio
audience: trainee
title: "Đề bài ứng viên — điều hướng (tổng quan → 3 tuần → 30 ngày)"
---

# ĐỀ BÀI ỨNG VIÊN — AGENTCORE STUDIO ("Xưởng Create→Test→Trust")

Chào 4 bạn thực tập. Đây là **cửa vào** của toàn bộ đề bài. Đọc theo thứ tự dưới, đừng nhảy cóc.

---

## 1. Đọc theo thứ tự nào

| Bước | Đọc gì | Để làm gì |
|---|---|---|
| **0** | [`pre-reading.md`](00-orientation/pre-reading.md) | **Đọc đầu tiên (pre-work).** Bối cảnh + đề bài tổng quan (rút gọn) + **danh sách khái niệm cần tự tìm hiểu** trước Ngày 1 (theo quadrant, có chú thích). Ngày 1 có teach-back. |
| **1** | [`00-brief-overview.md`](00-orientation/brief-overview.md) | Hiểu **toàn cảnh 6 tuần** (bản đầy đủ): xây cái gì, vì sao, ai sở hữu mảnh nào, luật chơi, đích đến. |
| **2** | [`00-orientation/roadmap-3-sprint.md`](00-orientation/roadmap-3-sprint.md) | Bức tranh **3 sprint × 2 tuần** + **skeleton 30 ngày** (1 dòng/ngày) + các mốc gate Day 10/20/30. |
| **3** | [`00-orientation/umbrella-contract.md`](00-orientation/umbrella-contract.md) | **Kiến trúc lõi** + **4 hợp đồng schema** bạn ghép qua. Tra khi cần biết interface chính xác. |
| **4** | [`00-orientation/charter.md`](00-orientation/charter.md) | **Hiến pháp chương trình**: engine\|recipe boundary, demo 8 bước, các quyết định đã chốt (coi như luật). |

> Sau khi nắm tổng quan, mỗi ngày bạn làm việc theo **day-goal** trong roadmap (sprint-writer sẽ nở mỗi dòng
> thành day-goal đầy đủ). File tổng quan cho bạn *đích*; roadmap cho bạn *nhịp*.

---

## 2. Ba tầng đề bài (tổng quan → 3 tuần → 30 ngày)

```
00-brief-overview.md   ── toàn cảnh 6 tuần: cái gì / vì sao / ai / luật / đích
        │
        ▼
roadmap 3 sprint         ── 3 chặng: Follow → Assist → Apply, mỗi chặng 1 macro-goal đôi (G1..G6)
        │
        ▼
skeleton 30 ngày         ── việc từng ngày (D1..D30), gate ở D10 / D20 / D30
```

- **Tầng tổng quan** = *why + what* của cả chương trình.
- **Tầng 3 tuần (sprint)** = mỗi 2 tuần một bậc năng lực; đề bài **đổi hình** theo bậc:
  - **S1 Follow** → đề dạng **spec** (nói rõ *what* + gợi ý *how*).
  - **S2 Assist** → đề dạng **goal** (nói *what* + tiêu chí chấp nhận; **không** liệt kê bước).
  - **S3 Apply** → đề dạng **problem** (nói *why* + ràng buộc; bạn tự thiết kế đường đi).
- **Tầng 30 ngày** = việc cụ thể mỗi ngày + gate cuối mỗi sprint.

---

## 3. Cách đọc một ngày (day-goal có 6 phần)

Mỗi ngày trong roadmap sẽ được diễn giải thành 6 trường:

| Trường | Nghĩa |
|---|---|
| **objective** | Mục tiêu, bắt đầu bằng động từ, **đo được**. |
| **cognitive-target** | Hôm nay rèn vector nào: `[NT]` nhận thức · `[TD]` tư duy · `[KT]` kiến thức · `[KN]` kỹ năng — và *vì sao*. |
| **deliverable** | Sản phẩm **link được / chạy được** ("evidence-or-it-didn't-happen"). |
| **mentor-touchpoint** | Điểm chạm mentor (mặc định **async** — bạn chủ động). |
| **self-check** | 2–3 câu tự kiểm trước khi coi là xong. |
| **eval-axis** | Trục tự đánh giá (A&I / S&E / OQ&R). |

---

## 4. Quy ước & ký hiệu

- **Quadrant** = mảng bạn sở hữu end-to-end (DE · SWE · AIE-1 · AIE-2). Xem tổng quan §7.
- **Vai:** **DE** = Data Engineer · **SWE** = Software Engineer · **AIE-1/AIE-2** = AI Engineer.
- **engine | recipe:** engine = động cơ PTNT build một lần; recipe = công thức khai báo, zero code lõi.
- **6 node-type đóng:** `kb-retrieve · llm-step · condition · tool-call · hitl-pause · end` — **cấm thêm**.
- **fence:** hàng rào chặn rò rỉ KB, đặt **tại retrieval** (không "nhờ LLM đừng nói"). **leakage = 0** là luật.
- **eval-gate:** cổng kiểm định; **FAIL → chặn Publish + rollback**.
- **trace / cost-lineage:** dòng thời gian từng node + token/chi phí; **cùng 1 con số** chảy ra 3 surface (UI test → trace → dashboard).
- **contract (4 hợp đồng):** recipe · trace-event · `kb.search` · scorecard — **freeze cuối tuần 2**, đổi = mini-RFC 4 chữ ký.
- **fixtures-first:** CI chạy 100% bản ghi sẵn; **không** phụ thuộc IQ model.
- **descope-ladder:** danh sách 4 nấc được phép cắt khi kẹt (KB→stub · canvas→Mermaid · judge→exact-match · dashboard→CLI); mỗi nấc **demo 8 bước vẫn sống**.
- **Gate:** **Day 10** (walking-skeleton — GATE CỨNG) · **Day 20** (canvas + KB thật + integrate lần đầu) · **Day 30** (demo a→z + bàn giao).
- **Nhịp tuần:** T2 kickoff · T3–T5 build · **T6 integration + weekly demo + 1:1** · T7 (cách tuần) WFH consolidation, không feature mới.
- **Luật 2-4-8:** kẹt 2h → ghi giả thuyết · 4h → xin hint · 8h → mentor ngồi cùng 30'. **Đừng kẹt một mình quá 2h.**

---

## 5. Ba điều nhớ nằm lòng

1. **Mỏng-mà-thông > dày-mà-đứt.** Walking-skeleton phải xâu-kim qua cả 4 quadrant trước, đẹp sau.
2. **Code của bạn là hợp đồng người khác dùng.** Giữ contract sạch; đổi contract phải có 4 chữ ký.
3. **Chứng minh bằng test, không bằng lời.** fence=0 rò rỉ, gate chặn được bản tệ, cost khớp 3 surface — đều phải xanh CI.

---

*Nguồn sự thật: `00-orientation/charter.md` · `00-orientation/roadmap-3-sprint.md` · `00-orientation/umbrella-contract.md` · `00-orientation/decisions-locked.md`. Nếu tài liệu này lệch nguồn gốc, **nguồn gốc thắng** — báo mentor.*
