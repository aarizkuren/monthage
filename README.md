# 📅 Monthage

Una pequeña app para macOS que muestra en la barra de menú qué porcentaje del mes ha transcurrido.

![Monthage Screenshot](screenshot.png)

## ¿Por qué?

Para saber cómo vas de tiempo vs. tu consumo de suscripciones (IA, datos, etc.). Si has consumido el 60% de tu cuota y estás en el 82% del mes... vas justo.

## Requisitos

- macOS 13.0 o superior

## Instalación

### Opción 1: Descargar release

1. Ve a [Releases](../../releases) y descarga el último `Monthage.app.zip`
2. Descomprime y arrastra `Monthage.app` a Aplicaciones
3. Si macOS bloquea la app: Preferencias del Sistema → Privacidad → Permitir

### Opción 2: Compilar desde código

```bash
git clone https://github.com/tuusuario/monthage.git
cd monthage
swift build -c release
open .build/release/Monthage
```

## Uso

- El icono aparece en la barra de menú: `📅 67%`
- Click para ver: mes actual, % transcurrido, días restantes
- Cmd+Q para salir

## Características

- Actualiza cada hora automáticamente
- Sin icono en el dock (solo menú)
- Dark mode compatible
- Lista para futuras integraciones con APIs (Anthropic, OpenAI, etc.)

## Licencia

MIT © [Tu Nombre](https://github.com/tuusuario)
