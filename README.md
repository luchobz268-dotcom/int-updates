# INT-Halo — descargas y actualizaciones

Este repositorio es el **canal de descargas** de [INT-Halo](https://github.com/luchobz268-dotcom/int-plugins),
un visualizador para grabar videos POV de teclado: convierte lo que tocás en un juego de luces en
pantalla. **No hace sonido** — convive con cualquier instrumento en FL Studio o en cualquier DAW, y
también funciona solo, sin DAW.

Acá **no hay código**: sólo los archivos publicados y el aviso de cuál es la última versión. El código
vive en otro repositorio, privado.

## Bajar INT-Halo

**[⬇️ Descargar la última versión](https://github.com/luchobz268-dotcom/int-updates/releases/latest/download/INT-Halo-Setup.exe)**

Windows 10 u 11, 64 bits. Ese enlace siempre te da la versión más nueva: GitHub lo resuelve solo, sin
que haya que tocar nada acá cuando sale una versión.

Si preferís el plugin suelto, sin instalador:
**[INT-Halo-VST3.zip](https://github.com/luchobz268-dotcom/int-updates/releases/latest/download/INT-Halo-VST3.zip)**
(descomprimilo en `C:\Program Files\Common Files\VST3`).

> Windows puede mostrar un aviso de SmartScreen la primera vez. Es porque el instalador no está
> firmado con un certificado pago, no porque tenga algo raro. Se pasa con *Más información →
> Ejecutar de todas formas*.

## Qué es `int-halo/latest.json`

Es el archivo que el plugin consulta al abrirse para saber si hay una versión más nueva. Si la hay,
te ofrece actualizar y baja el instalador con una barra de progreso.

Lleva la versión, el enlace del instalador, su **huella `sha256`** y las novedades en castellano. La
huella no es decorativa: el plugin **verifica que el archivo que bajó coincida** antes de ejecutarlo.
Si no coincide, no lo abre.

Lo actualiza `scripts/publish.ps1` del repositorio de código. **No conviene editarlo a mano**: si la
huella o la versión quedan mal, el aviso de actualización aparece en bucle o la actualización se
rechaza.

## Enlaces

- **[Página de INT-Halo](https://int-plugins-web.vercel.app)** — qué hace, las 23 escenas y cómo empezar.
  (Cuando esté el dominio propio `ineedtime.com.ar`, hay que cambiar este enlace.)
- **[Todas las versiones](https://github.com/luchobz268-dotcom/int-updates/releases)** — el historial completo.
