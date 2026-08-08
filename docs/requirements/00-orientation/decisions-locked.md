---
id: studio.decisions-locked
type: decisions
status: locked
created: 2026-07-17
set: agentcore-studio
---

# Quyết định đã chốt — AgentCore Studio "Xưởng Create→Test→Trust"

Các quyết định mở trong catalog AgentCore (§E) đã được mentor chốt qua 1 lượt phỏng vấn (2026-07-17). AgentCore Studio là **phương án thay thế (sibling) của Set A** — chọn đúng 1 set cho 1 team, không chạy song song. Bảng này là nguồn tham chiếu cho toàn bộ tài liệu AgentCore Studio.

| # | Quyết định | Chốt | Ghi chú |
|---|---|---|---|
| **D-1** | Bộ đề được chọn | **AgentCore Studio "Xưởng Create→Test→Trust"** (studio authoring trọn vòng đời: tạo→kiểm→tin) | Trong 8 bộ A–H; lý do ở bản trình sếp §7 |
| **D-2** | Bản chất deliverable | **Full 3-sprint / 30-ngày**, ngang độ sâu Set A | "3-day" ban đầu là nhầm — thực chất 3 sprint như Set A |
| **D-3** | Skew chấm | **Nghiêng Nhóm (D1·Team) + Giao hàng (D3·Delivery)** | Cách chấm chi tiết do mentor giữ — không công bố trong đề bài. |
| **D-4** | UI Workbench | **Canvas React Flow (S2) + fallback form+Mermaid** theo descope-ladder | SWE chưa React → tụt nấc, demo 8 bước vẫn sống |
| **D-5** | Model access | **Fixtures-first (Phase-1)** → Phase-2 LLM gateway thật là **tùy chọn** (khi có ZTNA+credential+quota) | CI 100% fixtures (VCR-style); model live chỉ demo qua flag. Không chặn tiến độ |
| **D-6** | Embedding | `EmbeddingService` **Protocol 2-impl** (stub local + gateway) | Hedge `/v1/embeddings` chưa verify |
| **D-7** | Setup lịch | **Schedule-agnostic**: gate cuối mỗi sprint Day 10 / Day 20 / Day 30, Day 1 = Thứ Hai | Có thể pin ngày khi batch được xếp lịch. Tuần-0 mentor dựng kit |
| **D-8** | Bản trình sếp | **Súc tích điều hành 4–6 trang**, md + pdf | Humanizer / anti-AI-tell; thuật ngữ có chú thích trong ngoặc |
| **D-9** | Đội hình | **1 DE · 1 SWE · 2 AIE**, mỗi người own 1 quadrant | DE = FLAGSHIP kép (KB + quan trắc/eval-data) |
| **D-10** | Python | **3.14** | |
| **D-11** | KB fence (chặn rò rỉ tại tầng truy xuất) | **Fence tại tầng truy xuất** (permission filter tại retrieval), **cấm** "nhờ LLM đừng nói"; leakage = 0 | KB synthetic Callisto Handbook (~40–60 doc, 2 tenant) |
| **D-12** | Contract-freeze | **4 schema đóng băng cuối S1**: recipe (SWE bút) · trace-event (DE bút) · `kb.search` API (DE bút) · scorecard (AIE-2 bút) | Đổi = mini-RFC 4 chữ ký. Weekly integration-demo thứ 6 |

## Descope-ladder tổng (viết sẵn Day 1 — cắt theo list, không cắt tùy hứng)
1. **KB** → stub tĩnh (bỏ ingest/embed thật).
2. **Canvas** → form khai báo + render Mermaid tĩnh (bỏ React Flow kéo-thả).
3. **LLM-judge** → exact-match/field-match (bỏ trọng-tài LLM).
4. **Cost dashboard** → bảng CLI (bỏ UI biểu đồ).

Mỗi nấc tụt làm demo 8 bước **vẫn sống**. Điều kiện right-sized: (a) walking-skeleton S1 là gate cứng, (b) 4 contract đóng băng, (c) mentor đủ băng thông enforce contract + weekly demo — nếu không, khuyến nghị rơi về Set F hoặc Set A.

## Điều kiện Phase-2 (tùy chọn, cần lãnh đạo duyệt)
Để chuyển embedding/llm-step từ fixtures/stub sang **LLM gateway nội bộ thật** ở Sprint 3, cần cấp trước: **ZTNA** cho 4 máy trainee tới gateway · **credential** M2M per-trainee có quota+log · **quota** token/chi phí giới hạn cho môi trường training. Nếu chưa cấp kịp → Sprint 3 vẫn chạy fixtures-first + flag, arc đào tạo **không đổi** (`EmbeddingService`/gateway Protocol giữ nguyên, chỉ đổi impl).
