# INT-Halo - instalador de 1 linea.
#
# Uso (PowerShell):
#   irm https://raw.githubusercontent.com/luchobz268-dotcom/int-updates/main/int-halo/install.ps1 | iex
#
# Baja el ultimo INT-Halo-Setup.exe de la Release publica y lo corre.
# NOTA: el one-liner funciona una vez que exista el repo PUBLICO "int-updates"
# con al menos una Release (el codigo sigue privado en "int-plugins").

$ErrorActionPreference = 'Stop'

# La direccion sale de int-halo/latest.json, NO de releases/latest.
#
# POR QUE. El repo int-updates lo comparten DOS productos con etiquetas distintas: v... para
# INT-Halo y plugins-v... para el pack de audio. "releases/latest" devuelve la publicacion mas
# reciente POR FECHA, sin distinguir de quien es. Desde que se publico el pack (11/08/2026) esta
# linea bajaba un 404: la etiqueta mas nueva es plugins-v0.5.0, que no contiene INT-Halo-Setup.exe.
#
# latest.json trae la direccion ya resuelta a la etiqueta correcta, y es la MISMA fuente que consulta
# el plugin para autoactualizarse: asi el instalador de una linea y el aviso de version nueva no
# pueden decir cosas distintas.
$canal = 'https://raw.githubusercontent.com/luchobz268-dotcom/int-updates/main/int-halo/latest.json'
$out   = Join-Path $env:TEMP 'INT-Halo-Setup.exe'

Write-Host 'Buscando la ultima version...' -ForegroundColor Cyan
$info = Invoke-RestMethod -Uri $canal -TimeoutSec 30

$url = $info.url
# Se comprueba de donde viene antes de bajar y ejecutar nada: este script corre con "irm | iex", asi
# que una direccion cualquiera en ese JSON seria ejecutar codigo arbitrario en la maquina del usuario.
if (-not ($url -like 'https://github.com/luchobz268-dotcom/int-updates/releases/download/*')) {
    throw "La direccion de descarga no es la esperada: $url"
}

Write-Host "Descargando INT-Halo $($info.version)..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $out

# Se comprueba la huella que declara el canal. Si no coincide, el archivo se bajo mal o lo cambiaron
# en el camino, y en cualquiera de los dos casos NO se ejecuta.
if ($info.sha256) {
    $hash = (Get-FileHash $out -Algorithm SHA256).Hash.ToLower()
    if ($hash -ne $info.sha256.ToLower()) {
        Remove-Item $out -Force -ErrorAction SilentlyContinue
        throw "El archivo bajado no coincide con la huella publicada. No se ejecuta."
    }
}

# El instalador PIDE ADMINISTRADOR: el VST3 va a C:\Program Files\Common Files\VST3, que es la unica
# carpeta que escanean los DAWs. Windows va a mostrar el cartel de permiso, es normal.
Write-Host 'Ejecutando el instalador (Windows te va a pedir permiso de administrador)...' -ForegroundColor Cyan
Start-Process -FilePath $out -Wait

Write-Host 'Listo. Si no aparecio, ejecuta manualmente:' $out -ForegroundColor Green
