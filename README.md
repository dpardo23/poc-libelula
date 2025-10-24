# poc-libelula

# Prueba de Concepto (PoC): Integración de Pasarela de Pagos Libélula (PagosNet)
Este repositorio contiene el documento LaTeX para una Prueba de Concepto (PoC) que analiza la viabilidad de integrar la pasarela de pagos boliviana "Libélula" (de PagosNet) en nuestro proyecto de software.

El objetivo de este documento es evaluar técnicamente la API de Libélula, proponer una arquitectura de integración y estimar el esfuerzo requerido para su implementación en un próximo sprint.

## Estructura del Proyecto
El proyecto está organizado siguiendo las mejores prácticas de LaTeX para mantener el contenido, la configuración y los recursos separados y ordenados.

PoC_Libelula_Integration/
├── main.tex                              # El archivo maestro que une todo el documento
├── preamble.tex                          # Configuración: paquetes, metadatos, comandos
├── Makefile                              # (Opcional) Para compilar fácil (ej. 'make pdf')
├── .gitignore                            # Para ignorar archivos auxiliares de LaTeX (aux, log)
|
├── sections/                             # "Carpetas para cada título" (el contenido)
│   ├── 00_Resumen_Ejecutivo.tex
│   ├── 01_Introduccion.tex               # El problema: necesidad de una pasarela en Bolivia
│   ├── 02_Contexto_Mercado.tex           # Por qué otras (Stripe, etc.) no son viables
│   ├── 03_Analisis_Libelula.tex          # Qué es, quién es PagosNet, servicios
│   ├── 04_Arquitectura_API.tex           # El "core" del PoC: Endpoints, Auth, Flujo de Pago
│   ├── 05_Propuesta_Integracion.tex      # Cómo se integraría en *nuestro* proyecto
│   ├── 06_Prueba_Concepto.tex            # Resultados del "código" (si se hizo un script)
│   ├── 07_Analisis_Viabilidad.tex        # Estimación, riesgos, esfuerzo (para el Sprint)
│   ├── 08_Conclusion_Recomendacion.tex
│   └── 09_Apendices.tex
|
├── resources/                            # Recursos externos al texto
│   ├── images/                           # Diagramas, screenshots
│   │   ├── logo_empresa.png
│   │   ├── logo_libelula.png
│   │   ├── flujo_pago_qr.png             # Diagrama de secuencia (MUY importante)
│   │   └── arquitectura_integracion.png
│   │
│   ├── code/                             # Snippets de código que se importan al .tex
│   │   ├── ejemplo_request_token.json
│   │   ├── ejemplo_request_pago.js
│   │   └── ejemplo_webhook_php.php
│   │
│   └── bib/                              # Bibliografía
│       └── referencias.bib               # Enlaces a la documentación oficial de PagosNet, etc.
│
└── README.md                             # Instrucciones para compilar el PoC

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

Este es el directorio principal del contenido. Cada archivo `.tex` representa un capítulo o sección del PoC. Están numerados para asegurar un orden lógico de inclusión en `main.tex`.

* **`00_Resumen_Ejecutivo.tex`**: Un resumen de alto nivel del PoC, sus hallazgos y recomendaciones (para stakeholders).
* **`01_Introduccion.tex`**: Define el problema a resolver (la falta de pasarelas viables en Bolivia) y el objetivo de este PoC.
* **`02_Contexto_Mercado.tex`**: Breve análisis de por qué otras pasarelas internacionales (Stripe, PayPal) no son una solución viable en el contexto boliviano.
* **`03_Analisis_Libelula.tex`**: Investigación sobre la empresa (PagosNet), los servicios que ofrece Libélula (QR Simple, Tarjetas, Tigo Money, etc.) y su modelo de negocio.
* **`04_Arquitectura_API.tex`**: El núcleo técnico. Detalla los *endpoints* de la API, el flujo de autenticación, el proceso de registro de una transacción y (muy importante) el manejo de *webhooks* para confirmaciones de pago.
* **`05_Propuesta_Integracion.tex`**: El "mapa" de cómo Libélula se conectaría a *nuestro* proyecto. Incluye cambios necesarios en el *backend*, *frontend* y modelo de base de datos.
* **`06_Prueba_Concepto.tex`**: Muestra los resultados de las pruebas técnicas realizadas (ej. scripts que consumieron la API de *sandbox*, si aplica).
* **`07_Analisis_Viabilidad.tex`**: Análisis de riesgos, dependencias y una estimación de esfuerzo (ej. *story points* o días-hombre) para la implementación real post-PoC.
* **`08_Conclusion_Recomendacion.tex`**: Veredicto final. ¿Es Libélula la solución adecuada? ¿Se recomienda proceder con la integración en el sprint?
* **`09_Apendices.tex`**: Información extra, como tablas de comisiones detalladas, flujos de error, etc.

#### `resources/`

Este directorio almacena todos los archivos que *no* son texto LaTeX, pero que son necesarios para el documento.

* **`images/`**: Contiene todos los recursos gráficos.
    * `flujo_pago_qr.png`: Diagramas de secuencia o flujo de datos (creados en herramientas como diagrams.net o similares) que explican visualmente la interacción.
    * `arquitectura_integracion.png`: Un diagrama que muestra cómo se conecta nuestro sistema con la API de Libélula.
    * Logos y capturas de pantalla relevantes.
* **`code/`**: Contiene *snippets* de código fuente que se insertan en el documento. Es una práctica más limpia que pegar código directamente en el `.tex`. Se usan con el paquete `listings` (`\lstinputlisting{...}`).
* **`bib/`**: Contiene la base de datos bibliográfica (`.bib`).
    * `referencias.bib`: Se usa para citar fuentes de manera profesional, principalmente la documentación oficial de la API de PagosNet/Libélula.

## Cómo Compilar

Para generar el documento PDF, asegúrate de tener una distribución de LaTeX instalada (como TeX Live, MiKTeX o MacTeX).

1.  Abre una terminal en el directorio raíz (`PoC_Libelula_Integration/`).
2.  Ejecuta el compilador. `pdflatex` es el estándar.

    ```bash
    pdflatex main.tex
    ```

3.  Si tienes bibliografía (`.bib`) y citas, necesitarás ejecutar la secuencia completa para resolver las referencias:

    ```bash
    pdflatex main.tex
    bibtex main
    pdflatex main.tex
    pdflatex main.tex
    ```

4.  **(Opcional) Usando el Makefile:**
    Si tienes `make` instalado, simplemente ejecuta:

    ```bash
    make pdf
    ```