# Скачивание фото SUTORA в папку img рядом с index.html
# Запуск: правый клик по файлу -> Run with PowerShell (или в терминале: powershell -ExecutionPolicy Bypass -File .\download-images.ps1)
$dir = Join-Path $PSScriptRoot "img"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$urls = @(
  "https://sutora.kz/wp-content/uploads/2023/07/453a5190-scaled.jpg",
  "https://sutora.kz/wp-content/uploads/2023/07/453a5182-700x467.jpg",
  "https://sutora.kz/wp-content/uploads/2023/10/453a4776-700x467.jpg",
  "https://sutora.kz/wp-content/uploads/2023/10/453a4907-700x467.jpg",
  "https://sutora.kz/wp-content/uploads/2023/10/453a5099-700x467.jpg",
  "https://sutora.kz/wp-content/uploads/2023/10/img_2758-700x933.jpg",
  "https://sutora.kz/wp-content/uploads/2023/10/453a5643-700x467.jpg"
)
foreach ($u in $urls) {
  $name = Split-Path $u -Leaf
  Write-Host "Скачиваю $name..."
  Invoke-WebRequest -Uri $u -OutFile (Join-Path $dir $name) -Headers @{ "User-Agent" = "Mozilla/5.0" }
}
Write-Host "Готово! Все фото в папке img."
