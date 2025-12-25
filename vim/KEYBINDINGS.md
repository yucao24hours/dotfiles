# Vim キーバインド一覧

このドキュメントは `.vimrc` で定義されているキーバインドの一覧です。

## Leader キー

```vim
let mapleader = ","
```

Leader キーは `,` (カンマ) に設定されています。

---

## ファイル検索・ナビゲーション (fzf)

| キー | 機能 | 説明 |
|------|------|------|
| `Ctrl+p` | `:Files` | カレントディレクトリ配下のファイルをファジー検索 |
| `,b` | `:Buffers` | 開いているバッファ一覧を表示 |
| `,h` | `:History` | 最近開いたファイルの履歴を表示 |
| `,g` | `:GFiles` | Git管理下のファイルをファジー検索 |

---

## テキスト整列 (vim-easy-align)

| キー | モード | 機能 |
|------|--------|------|
| `ga` | ビジュアルモード | 選択範囲を整列（例: `=` で揃える） |
| `ga` | ノーマルモード | カーソル位置から整列 |

### 使用例

```
# ビジュアルモードで選択後、ga= と入力すると...
let foo = 1
let longer_name = 2

# このように揃う
let foo         = 1
let longer_name = 2
```

---

## コード補完・ナビゲーション (CoC.nvim)

### コードジャンプ

| キー | 機能 | 説明 |
|------|------|------|
| `gd` | 定義にジャンプ | 関数や変数の定義元へジャンプ |
| `gy` | 型定義にジャンプ | TypeScript等で型定義へジャンプ |
| `gi` | 実装にジャンプ | インターフェースの実装へジャンプ |
| `gr` | 参照を表示 | その変数・関数が使われている箇所を一覧表示 |
| `K` | ドキュメント表示 | カーソル位置のシンボルのドキュメント・型情報を表示 |

### リファクタリング

| キー | 機能 | 説明 |
|------|------|------|
| `,rn` | シンボルのリネーム | 変数名・関数名を一括リネーム |
| `,qf` | クイックフィックス | 不足しているimportの追加など、自動修正の提案を表示 |

### オートコンプリート

| キー | モード | 機能 |
|------|--------|------|
| `Enter` | 挿入モード | 補完候補を確定 |
| `Tab` | 挿入モード | 次の補完候補へ移動 |
| `Shift+Tab` | 挿入モード | 前の補完候補へ移動 |

---

## プラグインによる自動機能

### NERDTree

- Vim起動時に引数なしで起動した場合、自動でNERDTreeが開きます
- NERDTreeが唯一のウィンドウになると自動で終了します
- 隠しファイルを表示する設定になっています

### vim-gitgutter

- ファイル左端にGitの差分が表示されます
- 更新間隔は 100ms に設定されています

### GitHub Copilot

- インストール済み（キーバインドはCopilotのデフォルト設定）

---

## その他の設定

### 一般設定

```vim
set number           " 行番号を表示
set cursorline       " カーソル行をハイライト
set hlsearch         " 検索結果をハイライト
set expandtab        " タブをスペースに変換
set shiftwidth=2     " インデント幅2スペース
set tabstop=2        " タブ幅2スペース
set signcolumn=yes   " 左端のサイン列を常に表示
```

### ファイルタイプ別設定

- **TypeScript/JavaScript**: インデント2スペース（自動設定）
- **Markdown**: YAML front matter をサポート

---

## プラグイン一覧

インストールされているプラグイン：

- **tpope/vim-rails** - Rails開発サポート
- **vim-ruby/vim-ruby** - Ruby構文サポート
- **slim-template/vim-slim** - Slimテンプレート対応
- **arcticicestudio/nord-vim** - Nordカラースキーム
- **junegunn/fzf** / **fzf.vim** - ファジーファインダー
- **neoclide/coc.nvim** - LSP（言語サーバー）クライアント
- **github/copilot.vim** - GitHub Copilot
- **airblade/vim-gitgutter** - Git差分表示
- **junegunn/vim-easy-align** - テキスト整列
- **preservim/vim-markdown** - Markdown編集サポート
- **ntpeters/vim-better-whitespace** - 末尾の空白を可視化
- **tpope/vim-surround** - 括弧・クォートの編集
- **preservim/nerdtree** - ファイルツリー表示

---

## CoC 拡張機能

インストールされている CoC 拡張：

- **coc-tsserver** - TypeScript/JavaScript言語サーバー

詳細な設定は `~/.vim/coc-settings.json` を参照してください。
