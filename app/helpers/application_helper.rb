module ApplicationHelper
  ICONS = {
    "layout-grid" => "M3 3h7v7H3zm11 0h7v7h-7zM3 14h7v7H3zm11 0h7v7h-7z",
    "users" => "M16 19v-1a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v1M12 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM20 19v-1a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75",
    "calendar-days" => "M8 2v4M16 2v4M3 10h18M5 5h14a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2z",
    "stethoscope" => "M6 3v7a6 6 0 0 0 12 0V3M8 3v7m8-7v7m-8 0h8M8 21h8M10 18a2 2 0 0 0 4 0",
    "file-medical" => "M14 2H7a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8zm0 0v6h6M9 13h6M9 17h6",
    "pill" => "M8 8c-3.3 0-6 2.7-6 6s2.7 6 6 6 6-2.7 6-6-2.7-6-6-6zm9-5c-2.2 0-4 1.8-4 4v7.5c0 2.5 2 4.5 4.5 4.5S22 17 22 14.5V7c0-2.2-1.8-4-4-4zM10 14h8",
    "briefcase-medical" => "M9 7V5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v2M4 18a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm5-8h6",
    "receipt-text" => "M4 4h16v18l-2-2-2 2-2-2-2 2-2-2-2 2-2-2-2 2V4zM8 8h8M8 12h8",
    "user-round-cog" => "M12 5a3 3 0 1 0 0 6 3 3 0 0 0 0-6zm-7 15v-1a4 4 0 0 1 4-4h6a4 4 0 0 1 4 4v1M19.5 17.5l2 2M21.5 17.5l-2 2M12 14c2.3 0 4.5 1.5 5.2 3.6",
    "chart-column" => "M3 20h18M7 16v-4m5 4V8m5 8v-6",
    "settings" => "M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83M12 7a5 5 0 1 1 0 10 5 5 0 0 1 0-10z",
    "search" => "M11 4a7 7 0 1 1 0 14 7 7 0 0 1 0-14zm9 20-4.35-4.35",
    "menu" => "M3 6h18M3 12h18M3 18h18",
    "plus" => "M12 5v14M5 12h14",
    "calendar-days" => "M8 2v4M16 2v4M3 10h18M5 5h14a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V7a2 2 0 0 1 2-2z",
    "default" => "M12 2v20M2 12h20"
  }.freeze

  def lucide_icon(name, size: 16, classes: "")
    icon = ICONS.fetch(name.to_s, ICONS["default"])
    raw %(<svg xmlns="http://www.w3.org/2000/svg" width="#{size}" height="#{size}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" class="#{classes}">#{icon}</svg>)
  end
end
