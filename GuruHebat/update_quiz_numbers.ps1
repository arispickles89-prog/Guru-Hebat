$root = 'c:\Users\user\Desktop\GuruHebat'
$files = Get-ChildItem -Path $root -Filter *.html -File
$pattern = [regex]'<b>(\d+)\.</b>'
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $updated = $pattern.Replace($content, '<span class="nomor-soal">$1.</span>')
    if ($updated -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $updated, [System.Text.UTF8Encoding]::new($false))
    }
}
