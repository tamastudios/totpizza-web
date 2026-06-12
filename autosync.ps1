# ============================================================
# autosync.ps1 — Sube automáticamente los cambios de la web
# de TOT PIZZA a GitHub.
#
# Se ejecuta desde el Programador de tareas de Windows.
# Si no hay cambios, no hace nada.
# ============================================================
$repo = "C:\Users\nilar\Desktop\Claude\TotPizza"
Set-Location $repo

# ¿Hay cambios?
$changes = git status --porcelain
if (-not $changes) { exit 0 }

# Commit con fecha y hora
$stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git add -A
git commit -m "Actualizacion web - $stamp"

# Subir a GitHub (si el remoto está configurado)
$remote = git remote
if ($remote -contains "origin") {
    git push origin master
}
