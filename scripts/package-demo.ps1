# SWEET PICK デモ配布パッケージ作成（完全オフライン版）
# 使い方: demo-implementation フォルダで
#   powershell -ExecutionPolicy Bypass -File scripts/package-demo.ps1
#
# 軽量版（Node.js 同梱なし）:
#   powershell -ExecutionPolicy Bypass -File scripts/package-demo.ps1 -SkipNode

param(
  [switch]$SkipNode
)

$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Set-Location $Root

$NodeVersion = "20.18.3"
$NodeZipName = "node-v$NodeVersion-win-x64.zip"
$NodeUrl = "https://nodejs.org/dist/v$NodeVersion/$NodeZipName"

function Ensure-PortableNode {
  param([string]$TargetNodeDir)

  $CacheDir = Join-Path $Root ".cache\node"
  $CacheZip = Join-Path $CacheDir $NodeZipName

  if (-not (Test-Path $CacheDir)) {
    New-Item -ItemType Directory -Force -Path $CacheDir | Out-Null
  }

  if (-not (Test-Path $CacheZip)) {
    Write-Host "Downloading portable Node.js v$NodeVersion ..." -ForegroundColor Yellow
    try {
      Invoke-WebRequest -Uri $NodeUrl -OutFile $CacheZip -UseBasicParsing
    } catch {
      Write-Host "Invoke-WebRequest failed, trying curl.exe ..." -ForegroundColor Yellow
      curl.exe -fsSL -o $CacheZip $NodeUrl
      if ($LASTEXITCODE -ne 0) { throw "Node.js download failed: $_" }
    }
  } else {
    Write-Host "Using cached Node.js ($CacheZip)" -ForegroundColor DarkGray
  }

  $TempExtract = Join-Path $CacheDir "extract-$NodeVersion"
  if (Test-Path $TempExtract) { Remove-Item $TempExtract -Recurse -Force }
  Expand-Archive -Path $CacheZip -DestinationPath $TempExtract -Force

  $ExtractedFolder = Get-ChildItem $TempExtract -Directory | Select-Object -First 1
  if (-not $ExtractedFolder) { throw "Invalid Node.js archive layout" }

  if (Test-Path $TargetNodeDir) { Remove-Item $TargetNodeDir -Recurse -Force }
  Copy-Item $ExtractedFolder.FullName $TargetNodeDir -Recurse -Force

  $NodeExe = Join-Path $TargetNodeDir "node.exe"
  if (-not (Test-Path $NodeExe)) { throw "node.exe not found in portable runtime" }

  Remove-Item $TempExtract -Recurse -Force
  Write-Host "Portable Node.js ready: $NodeExe" -ForegroundColor Green
}

Write-Host "== SWEET PICK demo package (offline) ==" -ForegroundColor Cyan
Write-Host "Building..." -ForegroundColor Yellow
npm run build
if ($LASTEXITCODE -ne 0) { throw "build failed" }

$PackageName = if ($SkipNode) { "sweet-pick-demo" } else { "sweet-pick-demo-offline" }
$OutDir = Join-Path $Root "dist\$PackageName"
$AppDir = Join-Path $OutDir "app"
$NodeDir = Join-Path $OutDir "node"

if (Test-Path $OutDir) { Remove-Item $OutDir -Recurse -Force }
New-Item -ItemType Directory -Force -Path $AppDir | Out-Null

Write-Host "Copying standalone server..." -ForegroundColor Yellow
Copy-Item ".next\standalone\*" $AppDir -Recurse -Force
New-Item -ItemType Directory -Force -Path (Join-Path $AppDir ".next\static") | Out-Null
Copy-Item ".next\static\*" (Join-Path $AppDir ".next\static") -Recurse -Force
Copy-Item "public" (Join-Path $AppDir "public") -Recurse -Force

if (-not $SkipNode) {
  Ensure-PortableNode -TargetNodeDir $NodeDir
}

if ($SkipNode) {
  $BatContent = @'
@echo off
chcp 65001 >nul
title SWEET PICK Demo
cd /d "%~dp0app"

where node >nul 2>&1
if errorlevel 1 (
  echo.
  echo [ERROR] Node.js が見つかりません。
  echo Node.js 20 以上をインストールするか、オフライン版 ZIP をご利用ください。
  echo.
  pause
  exit /b 1
)
set "NODE=node"
'@
} else {
  $BatContent = @'
@echo off
chcp 65001 >nul
title SWEET PICK Demo (Offline)
cd /d "%~dp0app"

set "NODE=%~dp0node\node.exe"
if not exist "%NODE%" (
  echo.
  echo [ERROR] 同梱の Node.js が見つかりません。
  echo フォルダ構成が壊れている可能性があります。ZIP を再解凍してください。
  echo.
  pause
  exit /b 1
)
'@
}

$BatContent += @'

set PORT=3000
set HOSTNAME=127.0.0.1

echo.
echo ========================================
echo   SWEET PICK デモサーバー起動中...
echo ========================================
echo.
echo   アプリ:     http://localhost:3000/
echo   宣伝ページ: http://localhost:3000/promo/index.html
echo.
echo   停止: このウィンドウを閉じる
echo ========================================
echo.

start "" "http://localhost:3000/promo/index.html"
"%NODE%" server.js
pause
'@

Set-Content -Path (Join-Path $OutDir "起動.bat") -Value $BatContent -Encoding UTF8

if ($SkipNode) {
  $Readme = @'
SWEET PICK デモ配布パッケージ（軽量版）
======================================

【必要なもの】
  - Windows 10/11
  - Node.js 20 以上（https://nodejs.org/ からインストール）

【起動方法】
  1. ZIP を解凍
  2. 「起動.bat」をダブルクリック

【URL】
  - アプリ本体:   http://localhost:3000/
  - 宣伝ページ:   http://localhost:3000/promo/index.html
'@
} else {
  $Readme = @"
SWEET PICK デモ配布パッケージ（完全オフライン版）
==============================================

【必要なもの】
  - Windows 10/11 のみ
  - Node.js のインストール不要
  - インターネット接続不要（オフラインで動作）

【起動方法】
  1. sweet-pick-demo-offline.zip を任意の PC にコピー
  2. ZIP を解凍（右クリック → すべて展開）
  3. 「起動.bat」をダブルクリック
  4. ブラウザが自動で開きます

【URL】
  - アプリ本体:   http://localhost:3000/
  - 宣伝ページ:   http://localhost:3000/promo/index.html

【同梱内容】
  - SWEET PICK アプリ（モックデータ・ログイン不要）
  - 宣伝用 HTML（自動デモ・画面スクショ）
  - Portable Node.js v$NodeVersion（同梱 runtime）

【停止方法】
  - 起動.bat の黒いウィンドウを閉じる

【トラブルシューティング】
  - ポート 3000 が使用中の場合:
      起動.bat をメモ帳で開き PORT=3001 等に変更
  - ファイアウォール警告 → 「アクセスを許可」
  - ウイルス対策ソフトが node.exe をブロックする場合:
      このフォルダを除外設定に追加

【再パッケージ（開発者向け）】
  demo-implementation フォルダで:
    npm run package:demo
"@
}

Set-Content -Path (Join-Path $OutDir "README.txt") -Value $Readme -Encoding UTF8

if ($SkipNode) {
  $UsageMd = @'
# SWEET PICK デモ — 使い方（軽量版）

Node.js 20 以上のインストールが必要です。

## 起動手順

1. ZIP を解凍する
2. **起動.bat** をダブルクリックする

## URL

| 用途 | URL |
|------|-----|
| 宣伝ページ | http://localhost:3000/promo/index.html |
| アプリ本体 | http://localhost:3000/ |

## Node.js のインストール

https://nodejs.org/ から LTS 版をインストールしてください。
'@
} else {
  $UsageMd = @"
# SWEET PICK デモ — 使い方

完全オフライン版の配布パッケージです。**Node.js のインストール不要**、**インターネット接続不要**で動作します。

---

## 必要なもの

- **OS:** Windows 10 または Windows 11
- **その他:** 特になし（開発ツール・npm・VS Code は不要）

---

## フォルダ構成

``````
sweet-pick-demo-offline/
├── 起動.bat       … ダブルクリックでデモを開始
├── 使い方.md      … このファイル
├── README.txt     … 簡易説明（テキスト版）
├── node/          … 同梱の Portable Node.js（触らなくて OK）
└── app/           … SWEET PICK アプリ本体（触らなくて OK）
``````

---

## 起動手順

1. ``sweet-pick-demo-offline.zip`` を任意の PC にコピーする
2. ZIP を解凍する（右クリック → **すべて展開**）
3. 解凍したフォルダ内の **``起動.bat``** をダブルクリックする
4. 黒いウィンドウが開き、ブラウザが自動で宣伝ページを表示する

---

## アクセス URL

| 用途 | URL |
|------|-----|
| **宣伝ページ**（説明・デモ用） | http://localhost:3000/promo/index.html |
| **アプリ本体**（実際の操作） | http://localhost:3000/ |

宣伝ページの「アプリを開く」ボタンからも本体に移動できます。

---

## デモのおすすめ操作

1. 宣伝ページで **デモプレイヤー**（自動再生）を見せる
2. アプリ本体を開き、**「ポテチ」** で検索
3. **季節限定 さくらポテチ** をタップ → 期間限定バッジを確認
4. **お気に入りに追加** → 下部タブの「お気に入り」で確認
5. ヘッダーで **コンビニ ↔ デパ地下** を切り替え

---

## 停止方法

``起動.bat`` で開いた **黒いコマンドウィンドウを閉じる** とサーバーが停止します。

---

## トラブルシューティング

### ポート 3000 が使用中と表示される

1. ``起動.bat`` をメモ帳で開く
2. ``set PORT=3000`` を ``set PORT=3001`` などに変更して保存
3. ブラウザでは ``http://localhost:3001/`` にアクセス

### ファイアウォールの警告

Windows が「アクセスを許可しますか？」と聞いた場合は **許可** を選んでください。

### ウイルス対策ソフトがブロックする

同梱の ``node\node.exe`` が誤検知されることがあります。  
このフォルダをウイルス対策ソフトの **除外リスト** に追加してください。

### ブラウザが自動で開かない

手動で http://localhost:3000/promo/index.html を開いてください。

### 「同梱の Node.js が見つかりません」と表示される

ZIP の解凍が不完全な可能性があります。``node`` フォルダごと再度解凍してください。

---

## 同梱内容

- **SWEET PICK** — お菓子トレンド検索アプリ（モックデータ・ログイン不要）
- **宣伝用 HTML** — 画面スクショ付きの説明ページ・自動デモ
- **Portable Node.js v$NodeVersion** — サーバー起動用ランタイム

---

## 再パッケージ（開発者向け）

``````powershell
cd demo-implementation
npm run package:demo
``````
"@
}

Set-Content -Path (Join-Path $OutDir "使い方.md") -Value $UsageMd -Encoding UTF8

$ZipPath = Join-Path $Root "dist\$PackageName.zip"
if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }
Write-Host "Creating zip (this may take a minute)..." -ForegroundColor Yellow
Compress-Archive -Path $OutDir -DestinationPath $ZipPath -Force

$ZipSize = [math]::Round((Get-Item $ZipPath).Length / 1MB, 1)
Write-Host ""
Write-Host "Done!" -ForegroundColor Green
Write-Host "  Folder: $OutDir"
Write-Host "  Zip:    $ZipPath ($ZipSize MB)"
Write-Host ""
if ($SkipNode) {
  Write-Host "Light package: Node.js must be installed on target PC." -ForegroundColor Cyan
} else {
  Write-Host "Offline package: No install required on target PC." -ForegroundColor Cyan
}
