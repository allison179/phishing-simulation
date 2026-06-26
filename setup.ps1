# SentinelDP Project Setup

$folders = @(
    "backend",
    "backend/app",
    "backend/app/api",
    "backend/app/core",
    "backend/app/database",
    "backend/app/models",
    "backend/app/schemas",
    "backend/app/services",
    "backend/app/ai",
    "backend/app/ocr",
    "backend/app/reports",
    "backend/app/utils",
    "backend/tests",

    "frontend",
    "frontend/public",
    "frontend/src",
    "frontend/src/assets",
    "frontend/src/components",
    "frontend/src/pages",
    "frontend/src/hooks",
    "frontend/src/services",
    "frontend/src/types",
    "frontend/src/utils",

    "docs",
    "uploads",
    "reports",
    "docker",

    ".github",
    ".github/workflows"
)

foreach ($folder in $folders) {
    New-Item -ItemType Directory -Force -Path $folder | Out-Null
}

$files = @(
    "README.md",
    "LICENSE",
    ".gitignore",
    "docker-compose.yml",

    "backend/Dockerfile",
    "backend/requirements.txt",

    "backend/app/main.py",
    "backend/app/__init__.py",

    "backend/app/api/__init__.py",
    "backend/app/core/__init__.py",
    "backend/app/database/__init__.py",
    "backend/app/models/__init__.py",
    "backend/app/schemas/__init__.py",
    "backend/app/services/__init__.py",
    "backend/app/ai/__init__.py",
    "backend/app/ocr/__init__.py",
    "backend/app/reports/__init__.py",
    "backend/app/utils/__init__.py",

    "frontend/package.json",
    "frontend/vite.config.ts",
    "frontend/tsconfig.json",
    "frontend/index.html",

    "frontend/src/main.tsx",
    "frontend/src/App.tsx",

    ".github/workflows/ci.yml"
)

foreach ($file in $files) {
    if (!(Test-Path $file)) {
        New-Item -ItemType File -Path $file | Out-Null
    }
}

Write-Host ""
Write-Host "====================================="
Write-Host " SentinelDP project created!"
Write-Host "====================================="