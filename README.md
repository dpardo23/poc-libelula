# poc-libelula

![Logotipo de Libelula](./resources/images/Libelula/LogoPagosTT.png)

# Prueba de Concepto (PoC): Integración de Pasarela de Pagos Libélula (PagosNet)
Este repositorio contiene el documento LaTeX para una Prueba de Concepto (PoC) que analiza la viabilidad de integrar la pasarela de pagos boliviana "Libélula" (de PagosNet) en nuestro proyecto de software.

El objetivo de este documento es evaluar técnicamente la API de Libélula (basado en su Manual de Integración), proponer una arquitectura de integración y documentar los hallazgos para un próximo sprint.

## Estructura del Proyecto
El proyecto está organizado siguiendo las mejores prácticas de LaTeX para mantener el contenido, la configuración y los recursos separados y ordenados.

```bash
POC-LIBELULA/
├── main.tex                 # El archivo maestro que une todo el documento
├── preamble.tex             # Configuración: paquetes, metadatos, comandos
├── Makefile                 # Para compilar fácil (ej. 'make pdf')
├── .gitignore               # Para ignorar archivos auxiliares de LaTeX y de SO
|
├── sections/                # El contenido principal del documento
│   ├── 00_Portada.tex
│   ├── 01_Introduccion.tex
│   ├── 02_Vision_General_Libelula.tex
│   ├── 03_Analisis_Recursos_Dev.tex
│   ├── 04_Metodos_Pago.tex
│   ├── 05_Proceso_Integracion.tex
│   ├── 06_Consideraciones_Seguridad.tex
│   ├── 07_Analisis_Soporte_Costos.tex
│   └── 08_Conclusiones.tex
|
├── resources/               # Recursos externos al texto
│   ├── bibliography/        # PDFs de referencia y manuales de integración
│   │   ├── Manuales de Integracion/
│   │   │   └── Libelula-Manual-de-Integracion-v2.7.2Z01.pdf
│   │   └── referencias.bib  # Archivo BibTeX para citas
│   │
│   ├── code/                # Código fuente de la demo (Backend y Frontend)
│   │   ├── Backend/
│   │   │   ├── CardController.ts
│   │   │   └── ... (más archivos .ts del servidor)
│   │   └── Frontend/
│   │       ├── page.tsx
│   │       ├── globals.css
│   │       └── ... (más archivos de Next.js/React)
│   │
│   └── images/              # Recursos visuales del PoC
│       ├── Libelula/
│       │   └── LogoPagosTT.png
│       ├── Logos/
│       │   └── logoUMSS.png
│       ├── Mockups/
│       │   ├── Formulario.png
│       │   └── ... (más mockups de Figma)
│       └── Pruebas/
│           ├── Metodo de pago qr.png
│           └── ... (más capturas de la demo)
│
├── build/                   # (IGNORADO) Carpeta de salida para el PDF
└── README.md                # Instrucciones para compilar el PoC
```



## Descripción de Archivos y Directorios

### Archivos Principales (Raíz)

* **`main.tex`**: Es el "esqueleto" del documento. No contiene texto, solo la estructura. Se encarga de cargar el preámbulo e incluir (`\input{...}`) cada archivo de la carpeta `sections/` en el orden correcto.
* **`preamble.tex`**: Es el centro de configuración. Aquí se definen:
    * Los metadatos del documento (Título, Autor, Fecha).
    * Todos los paquetes (`\usepackage{...}`) necesarios (ej. `graphicx` para imágenes, `listings` para código, `geometry` para márgenes).
    * Comandos personalizados (`\newcommand{...}`) si fueran necesarios.
* **`Makefile`**: (Opcional) Un archivo para automatizar la compilación. Permite generar el PDF final simplemente ejecutando el comando `make pdf` en la terminal.
* **`.gitignore`**: Un archivo esencial para Git. Especifica qué archivos generados por LaTeX (como `.aux`, `.log`, `.pdf`, `.synctex.gz`) deben ser ignorados por el control de versiones.

### Directorios

#### `sections/`

Este es el directorio principal del contenido. Cada archivo .tex representa un capítulo o sección numerada del PoC, desde la `00_Portada.tex` hasta la `08_Conclusiones.tex`.

* **`00_Portada.tex`**: Genera la carátula principal del documento, incluyendo el logo de la universidad, el título del PoC, tu nombre y el del docente.

* **`01_Introduccion.tex`**: Define el problema (la necesidad de una pasarela en Bolivia), el propósito, los objetivos técnicos y el alcance de esta Prueba de Concepto.

* **`02_Vision_General_Libelula.tex`**: Describe qué es Libélula/Todotix SRL, su propuesta de valor (pasarela multicanal con QR, Tigo Money, etc.) y los casos de uso (pago inmediato vs. diferido).

* **`03_Analisis_Recursos_Dev.tex`**: Es el núcleo técnico. Analiza la arquitectura de la API (paradigma de "Registro de Deuda"), los endpoints principales (/registrar, /consultar_pagos) y el mecanismo de autenticación (appkey).

* **`04_Metodos_Pago.tex`**: Detalla y compara los métodos de pago que ofrece la pasarela (Tigo Money, Lula, BNB, Tarjeta y QR Simple).

* **`05_Proceso_Integracion.tex`**: Explica el flujo de integración y los campos del formulario necesarios para el endpoint de "Registro de Deuda".

* **`06_Consideraciones_Seguridad.tex`**: Evalúa los riesgos de la integración, incluyendo la seguridad de la appkey y la vulnerabilidad crítica del webhook PAGO EXITOSO (y su mitigación).

* **`07_Analisis_Soporte_Costos.tex`**: (Tu sección 7) Realiza una comparativa de costos y modelo de negocio frente a pasarelas como Stripe, y evalúa la viabilidad económica, operativa y técnica.

* **`08_Conclusiones.tex`**: (Tu sección 8) Presenta el veredicto final del PoC: viable para pagos directos (cliente a proveedor único), pero no óptimo para modelos de múltiples proveedores.



#### `resources/`

Este directorio almacena todos los archivos que *no* son texto LaTeX, pero que son necesarios para el documento.

* **`images/`**: Contiene todos los recursos gráficos, organizados por tipo:
    * `Libelula`/: Logos oficiales de la pasarela de pagos.
    * `Logos/`: Logos institucionales (ej. logoUMSS.png).
    * `Mockups/`: Exportaciones de los diseños de Figma (ej. Formulario.png).
    * `Pruebas/`: Capturas de pantalla de la demo funcional (ej. Metodo de pago qr.png).

* **`bibliography/`**: Almacena toda la documentación de referencia utilizada para el PoC.
    * `Ejemplo de Factura/`: Contiene un PDF de una factura de ejemplo (`factura_5fa65f...`).
    * `Manual General/` y `Manuales de Integracion/`: Contienen los manuales técnicos oficiales de Libélula (v2.7.2Z01) que definen la API.
    * `Mockup Formulario/`: Almacena el PDF del mockup del formulario.

* **`code/`**: Contiene el código fuente de la demo funcional desarrollada para validar la integración.
    * `Backend/`: El código del servidor (escrito en TypeScript) que se comunica de forma segura con la API de Libélula.
        * `index.ts`: Punto de entrada del servidor.
        * `libelula.ts`: Módulo que encapsula la lógica de conexión con la pasarela.
        * `cardController.ts`, `cardRoutes.ts`, `cardService.ts`: Componentes (Controlador, Rutas, Servicio) para manejar la lógica de negocio del pago.
    * `Frontend/`: El código de la interfaz de usuario (Next.js/React) que el cliente utiliza.
        * `page.tsx`: La vista principal de la demo donde el usuario inicia el pago.
        * `layout.tsx`: El layout principal de la aplicación.
        * `globals.css`: Estilos CSS globales.
        * `favicon.ico`: Icono de la pestaña del navegador.
    
## Cómo Compilar

Para generar el documento PDF `(main.pdf)` en la carpeta` build/`, asegúrate de tener una distribución de LaTeX instalada (como MiKTeX o TeX Live).

1.  Abre una terminal en el directorio raíz (`PoC_Libelula/`).
2.  Ejecuta el siguiente comando:

    ```bash
    latexmk -pdf -outdir=build main
    ```

3.  Si necesitas forzar una recompilación desde cero (especialmente después de errores), limpia la carpeta `build` primero:

    ```bash
    # (En Windows CMD)
    rmdir /s /q build
    latexmk -pdf -outdir=build main
    ```