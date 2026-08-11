# I.N.T. — descargas y actualizaciones

Este repositorio es el **canal de descargas** de los plugins de I.N.T. Acá **no hay código**: sólo
los archivos publicados y el aviso de cuál es la última versión de cada producto. El código vive en
otros repositorios, privados.

Son **dos productos distintos**, y cada uno se baja por separado:

| | Qué es | Formatos |
|---|---|---|
| **INT-Halo** | Un visualizador para grabar videos POV de teclado: convierte lo que tocás en un juego de luces en pantalla. **No hace sonido** — convive con cualquier instrumento. | VST3 + aplicación suelta |
| **Pack de audio** | Cuatro plugins que trabajan la voz, cada uno con un botón: **INT-Tidy**, **INT-Even**, **INT-Whisper** e **INT-Spaces**. | VST3 + CLAP |

## Bajar INT-Halo

**[⬇️ Descargar INT-Halo v0.1.8](https://github.com/luchobz268-dotcom/int-updates/releases/tag/v0.1.8)**

Windows 10 u 11, 64 bits. Si preferís el plugin suelto, sin instalador, en esa misma publicación
está `INT-Halo-VST3.zip` (se descomprime en `C:\Program Files\Common Files\VST3`).

## Bajar el pack de audio

**[⬇️ Descargar el pack v0.5.0](https://github.com/luchobz268-dotcom/int-updates/releases/tag/plugins-v0.5.0)**

Los cuatro plugins en un solo instalador, y al instalarlo podés destildar los que no quieras.
Windows 10 u 11, 64 bits. Formatos VST3 y CLAP.

> **Ojo: acá los enlaces van con la ETIQUETA puesta, nunca con `releases/latest`.**
>
> Y no es una manía. Este repositorio lo comparten los dos productos: INT-Halo publica con etiquetas
> `v0.1.8` y el pack con `plugins-v0.5.0`. `releases/latest` devuelve **la publicación más reciente
> por fecha**, sin distinguir de quién es.
>
> Se vio en vivo el 2026-08-11: apenas se publicó el pack, los dos botones de esta misma página
> —que usaban `releases/latest`— pasaron a llevar al pack, incluido el que decía "Descargar
> INT-Halo". Por eso ahora cada uno nombra su etiqueta.
>
> La dirección real de cada instalador está en su propio `latest.json` (ver abajo). Ahí es donde hay
> que mirar, y es lo que hacen tanto los plugins como la web.

> Windows puede mostrar un aviso de SmartScreen la primera vez. Es porque los instaladores no están
> firmados con un certificado pago, no porque tengan algo raro. Se pasa con *Más información →
> Ejecutar de todas formas*.

## Qué son los `latest.json`

```
int-halo/latest.json      ← INT-Halo
int-plugins/latest.json   ← el pack de audio
```

Es el archivo que cada plugin consulta al abrirse para saber si hay una versión más nueva. Si la
hay, te ofrece actualizar y baja el instalador con una barra de progreso.

Lleva la versión, el enlace del instalador, su **huella `sha256`** y las novedades en castellano. La
huella no es decorativa: el plugin **verifica que el archivo que bajó coincida** antes de ejecutarlo.
Si no coincide, no lo abre. La web de descargas lee estos mismos archivos, así que la web y el
plugin no pueden anunciar versiones distintas.

Los actualiza el `scripts/publish.ps1` de cada repositorio de código. **No conviene editarlos a
mano**: si la huella o la versión quedan mal, el aviso de actualización aparece en bucle o la
actualización se rechaza.

## Enlaces

- **[vst.ineedtime.com.ar](https://vst.ineedtime.com.ar)** — la página de los plugins: qué hace cada
  uno, las 23 escenas de INT-Halo y cómo empezar.
- **[ineedtime.com.ar](https://ineedtime.com.ar)** — el sello colaborativo I.N.T., la otra mitad de
  la marca.
- **[Todas las versiones](https://github.com/luchobz268-dotcom/int-updates/releases)** — el historial
  completo de los dos productos.
