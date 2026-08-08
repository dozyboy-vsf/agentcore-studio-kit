---
id: studio.debai.tim-hieu-truoc
type: onboarding
audience: TTS
created: 2026-07-17
---

# Đọc trước tiên — Bối cảnh · Đề bài tổng quan · Việc cần tìm hiểu

File này giúp 4 bạn nắm nhanh **mình sắp làm gì** và **cần tự tìm hiểu khái niệm nào** trước Ngày 1. Đọc xong file này → đọc [`00-brief-overview.md`](https://github.com/AI20K-VGR/ai20k-batch2-requirements/blob/main/00-orientation/brief-overview.md) (bản đầy đủ) → đề bài từng [tuần](https://github.com/AI20K-VGR/ai20k-batch2-requirements/blob/main/week-1/README.md) → từng [ngày](days/).

---

## 1. Bối cảnh (context)

- **Ai:** 4 thực tập sinh — 1 **Data Engineer (DE)** · 1 **Software Engineer (SWE)** · 2 **AI Engineer (AIE-1, AIE-2)**. Mentor shadow-working (làm cùng, quan sát) + là người chấm.
- **Bao lâu:** 6 tuần = **3 sprint × 2 tuần = 30 ngày**. Thang năng lực đi lên: **L1 Follow → L2 Assist → L3 Apply**. Ba mốc nghiệm thu (gate): **Day 10 / Day 20 / Day 30**.
- **Vị trí trong bức tranh lớn:** **PTNT** là đội nền tảng, xây một lõi chung (**AgentCore**) để **bàn giao cho các đội sản phẩm** (ví dụ PTSP) dùng — thay vì mỗi đội tự code lại agent từ đầu. Các đội đó dùng bằng **recipe** (cấu hình khai báo), không cần chạm code lõi.
- **Ràng buộc NDA:** dữ liệu **100% synthetic/mock** (bộ tài liệu giả *Callisto Handbook*, 2 tenant `ankor`/`borea`), **không PII**, hệ thật chỉ xuất hiện dạng **stub**. Python **3.14**.

---

## 2. Đề bài tổng quan (mình xây cái gì)

Xây **AgentCore Studio** — một "xưởng" tạo agent **trọn vòng đời tạo → kiểm → tin**:

> tạo agent bằng **form** → gắn **2 tool + 1 KB có fence (chặn rò rỉ tại tầng truy xuất)** → vẽ **workflow trên canvas** → bấm **Test** xem **trace** → qua **eval-gate (cổng kiểm định chặn publish)** mới được **Publish**.

- **Nỗi đau đang giải:** (1) KB rò rỉ chéo tenant — đội A hỏi trúng dữ liệu đội B; (2) không có cổng chặn chất lượng tụt trước khi phát hành; (3) đổi hành vi agent phải sửa code thay vì sửa cấu hình.
- **Input được cấp:** repo skeleton, *Callisto Handbook* (2 tenant), **4 hợp đồng schema** stub (recipe · trace-event · `kb.search` · scorecard), **fixtures** ghi sẵn (VCR), mock gateway/embedding, mock tool.
- **Output cuối (đích ngắm):** 1 Studio chạy được + **demo tốt nghiệp 8 bước a→z**: form → gắn tool+KB → vẽ flow → Test/trace → hỏi câu chỉ có trong KB *Tenant-Y* khi đang ở *Tenant-X* → **fence refusal** (không hallucinate) → chạy **Eval 30 golden** PASS → **Publish** → sửa cấu hình cho tệ đi → **eval-gate CHẶN** → **rollback** → **hitl-pause**. Cả 8 bước **không chạm dòng code lõi nào** (ranh giới engine|recipe thành sự thật).
- **Ai giữ mảnh nào (quadrant):** **DE** = KB pipeline + quan trắc/eval-data (flagship kép) · **SWE** = Workbench UI + hợp đồng recipe + Tenant-Wall · **AIE-1** = bộ thông dịch (interpreter) + truy xuất + fence · **AIE-2** = kiểm định (eval) + trọng tài LLM. Bốn mảnh cắm vào **cùng 1 luồng** qua 4 hợp đồng schema.

---

## 3. Việc cần tìm hiểu (task pre-work)

Mỗi gạch đầu dòng = 1 khái niệm **tự research trước**. Thuật ngữ giữ nguyên (để search), kèm chú thích ngắn.

### 3.1. Lõi chung — cả 4 bạn phải nắm
- **engine | recipe boundary** — tách "động cơ" (code lõi, viết 1 lần) khỏi "công thức" (file khai báo: agent-config + workflow DAG + KB-binding + golden-set). Đích: đổi hành vi = sửa YAML, **không đụng code lõi**.
- **walking-skeleton** — cuối Tuần 1 phải có 1 luồng chạy xuyên a→z (mỏng nhưng thông cả 4 mảnh) rồi mới đắp thịt. Đây là **gate cứng**.
- **fixtures-first (VCR-style)** — CI chạy 100% trên response ghi sẵn; model thật chỉ bật lúc demo qua flag. Điểm chấm là pipeline/fence/trace, **không phải IQ của LLM**.
- **contract-freeze + mini-RFC** — 4 hợp đồng schema đóng băng cuối Tuần 1; muốn đổi phải mini-RFC + 4/4 duyệt. Tích hợp **chỉ** qua 4 hợp đồng. Demo tích hợp mỗi **thứ Sáu**.
- **descope-ladder** — danh sách cắt-giảm viết sẵn Ngày 1 (KB→stub · canvas→Mermaid · LLM-judge→exact-match · dashboard→CLI). Kẹt thì cắt theo thang, không cắt tùy hứng.
- **INV-1 Tenant-Wall** — `session_id` resolve `{tenant, user, roles}` ở **server** (client tự khai tenant = bỏ qua); mọi query filter theo tenant, **fail-closed**. Chống **T1 IDOR** (đọc chéo tài nguyên) + **T6 label-spoof** (giả nhãn tenant).
- **HITL / hitl-pause node** — điểm **dừng-chờ-người** duyệt là trạng thái first-class (`running → waiting_human → resumed`), không phải retry/poll.

### 3.2. SWE — Workbench + hợp đồng + Tenant-Wall
- **recipe schema + validator + graph-lint** — định nghĩa & kiểm hợp lệ file recipe; bắt DAG sai **trước** khi chạy.
- **React Flow canvas** (fallback **form + Mermaid**) — UI kéo-thả vẽ workflow (palette đóng 6 node-type).
- **publish flow + eval-gate wiring + version/rollback** — nối cổng kiểm định vào nút Publish; fail thì chặn + quay lại version cũ (version cũ giữ nguyên).

### 3.3. DE (flagship kép) — KB pipeline + quan trắc/eval-data
- **chunk → embed → index per-tenant** — cắt tài liệu thành đoạn, vector hoá (embedding), dựng index **tách theo tenant**.
- **fence-data tại-retrieval** — chặn rò rỉ **ngay tầng truy xuất** (`kb.search` lọc theo `role → section`), **không** trả hết rồi nhờ LLM "đừng nói". Đích: **leakage = 0**.
- **re-index idempotent + consent-purge** — chạy lại không nhân bản chunk; xoá doc theo yêu cầu → verify index sạch (0 rò).
- **event-sourcing / trace sink + cost table + golden-set** — nhật ký sự kiện **dựng lại được** (rebuild-verify); bảng chi phí; bộ **ca vàng** có ground-truth (nhãn đúng-sai chuẩn).

### 3.4. AIE-1 — Interpreter + truy xuất + fence executor
- **interpreter + node executors (6 node-type)** — máy chạy workflow từng node, có **checkpoint** (lưu điểm để resume).
- **retrieval quality (chunking × embedding trade-off)** — đo bằng **số**: kích thước chunk / model embedding nào cho recall (độ bao phủ) tốt hơn.
- **EmbeddingService Protocol (2-impl)** — 1 interface, 2 bản (stub local ↔ gateway); đổi impl không đổi lời gọi.
- **citation-accuracy** — câu trả lời phải **trích đúng** chunk nguồn (chống bịa).

### 3.5. AIE-2 — Kiểm định + trọng tài LLM
- **eval harness + scorecard** — chạy golden-set → bảng điểm PASS/FAIL.
- **LLM-judge + agreement-check** — dùng LLM chấm, nhưng **đối chiếu với nhãn tay** (cap ≤100 lượt/ngày + cache) để không "tin judge mù".
- **eval-gate** — scorecard dưới ngưỡng → **chặn publish** (kiểu exit-code CI), không cảnh báo suông.
- **cost-lineage 3-surface** — cùng 1 con số `cost` chảy qua UI test → trace → dashboard; **lệch = fail**.

---

> **Gợi ý cách tìm hiểu:** với mỗi thuật ngữ, tìm (1) định nghĩa 1 câu, (2) 1 ví dụ tối giản, (3) 1 cái bẫy hay gặp. Ngày 1 sẽ có buổi **teach-back**: mỗi bạn giải thích lại quadrant của mình + 2–3 khái niệm lõi chung cho cả nhóm.
