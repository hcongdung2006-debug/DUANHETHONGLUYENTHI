@echo off
chcp 65001 >nul
title SmartExam Frontend Demo
echo ===================================================
echo     DỰ ÁN SMARTEXAM MVP - KHỞI ĐỘNG NHANH
echo ===================================================
echo.
echo [*] Đang khởi động máy chủ Web nội bộ trên cổng 5500...
echo [*] Mở trình duyệt tại: http://localhost:5500
echo.
echo - Tài khoản Sinh viên: student@smartexam.vn / demo123 (hoặc bấm nút "Dùng Sinh viên")
echo - Tài khoản Admin:     admin@smartexam.vn / admin123 (hoặc bấm nút "Dùng Admin")
echo.
echo [!] GIỮ CỬA SỔ NÀY TRONG KHI ĐANG DÙNG. Đóng cửa sổ để dừng web.
echo ===================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "$listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://127.0.0.1:5500/'); $listener.Start(); Start-Process 'http://localhost:5500'; $dist = '%~dp0dist'; while ($listener.IsListening) { $context = $listener.GetContext(); $req = $context.Request; $res = $context.Response; $urlPath = $req.Url.AbsolutePath.TrimStart('/'); if ([string]::IsNullOrEmpty($urlPath)) { $urlPath = 'index.html' }; $filePath = Join-Path $dist $urlPath; if (Test-Path $filePath -PathType Leaf) { $bytes = [System.IO.File]::ReadAllBytes($filePath); $ext = [System.IO.Path]::GetExtension($filePath).ToLower(); $res.ContentType = switch ($ext) { '.html' { 'text/html; charset=utf-8' } '.js' { 'application/javascript; charset=utf-8' } '.mjs' { 'application/javascript; charset=utf-8' } '.css' { 'text/css; charset=utf-8' } '.json' { 'application/json' } '.png' { 'image/png' } default { 'application/octet-stream' } }; $res.ContentLength64 = $bytes.Length; $res.OutputStream.Write($bytes, 0, $bytes.Length) } else { $res.StatusCode = 404 }; $res.Close() }"
pause
