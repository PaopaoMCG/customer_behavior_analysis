# Análisis del comportamiento de compra de los clientes
## Resumen del proyecto

Este proyecto analiza el comportamiento de compra de los clientes utilizando Python, PostgreSQL, SQL y Tableau. El objetivo era transformar los datos transaccionales sin procesar en información empresarial útil mediante la limpieza de datos, el análisis exploratorio de datos (EDA), la integración de bases de datos, el análisis empresarial basado en SQL y el desarrollo de paneles de control.

El proyecto sigue un flujo de trabajo analítico completo, desde la preparación de los datos hasta la elaboración de informes empresariales y la visualización.

## Conjunto de datos

El conjunto de datos contiene información demográfica de los clientes, su comportamiento de compra, sus preferencias de productos y los detalles de las transacciones.

## Herramientas y tecnologías
- Python
    - Pandas
    - NumPy
    - Matplotlib
- PostgreSQL
- SQL
- Tableau Public
- Visual Studio Code

## Project Workflow
### 1. Carga de datos

El conjunto de datos se importó a Python utilizando Pandas para su análisis y preparación.

### 2. Análisis exploratorio de datos (EDA)

La exploración inicial incluyó:

- Revisión de la estructura del conjunto de datos
- Detección de valores perdidos
- Validación de los tipos de datos
- Análisis de la distribución
- Exploración de variables

### 3. Limpieza y preparación de datos

Se llevaron a cabo las siguientes transformaciones:

- Se estandarizaron los nombres de las columnas utilizando el formato «snake_case».
- Se sustituyeron los valores perdidos en «review_rating» por la mediana de las valoraciones dentro de cada categoría de producto.
- Se creó una variable «age_group» para segmentar a los clientes por edad.
- Se convirtieron las categorías de frecuencia de compra en una variable numérica («purchase_frequency_days»).
- Se identificó la redundancia entre «discount_applied» y «promo_code_used».
- Se eliminó la columna redundante «promo_code_used».

### 4. Integración con PostgreSQL

El conjunto de datos depurado se cargó en PostgreSQL para realizar análisis de negocio basados en SQL.

### 5. Análisis de negocio con SQL

Se respondieron preguntas de negocio mediante consultas SQL, entre las que se incluyen:

- Comparación de ingresos por género.
- Identificación de clientes con alto gasto que utilizan descuentos.
- Productos mejor valorados.
- Comportamiento de gasto por método de envío.
- Impacto de las suscripciones en el gasto.
- Uso de códigos de descuento por producto.
- Segmentación de la fidelidad de los clientes.
- Productos más vendidos por categoría.
- Adopción de las suscripciones entre los clientes habituales.
- Contribución a los ingresos por grupo de edad.

### 6. Desarrollo de dashboard

El dashboard final se creó en Tableau para ofrecer una visión interactiva de las métricas empresariales clave y del comportamiento de los clientes.

## Dashboard
### Indicadores clave de rendimiento (KPI)
- Total de clientes
- Ingresos totales
- Importe medio de compra
- Puntuación media de las reseñas

### Visualizaciones
- Distribución de las suscripciones de los clientes
- Ingresos por categoría de producto
- Ventas por categoría de producto
- Ingresos por grupo de edad
- Ventas por grupo de edad

## Conclusiones principales
### Segmentación de clientes
- Los clientes masculinos generaron más del doble de ingresos que las clientas.
- Los clientes fieles representaron el segmento de clientes más numeroso.

### Programa de suscripción
- Los suscriptores no gastaron significativamente más que los no suscriptores.
- La mayoría de los compradores habituales no estaban inscritos en el programa de suscripción, lo que indica una oportunidad para mejorar la adopción de la suscripción.

### Rendimiento de los productos
- Los guantes, las sandalias y las botas recibieron las puntuaciones medias más altas en las reseñas.
- El volumen de compras y las valoraciones de los clientes no siempre coincidían, lo que pone de relieve la importancia de evaluar múltiples métricas de rendimiento.

### Factores que impulsan los ingresos
- Los clientes jóvenes adultos generaron la mayor contribución a los ingresos.
- Los ingresos se distribuyeron de forma relativamente equilibrada entre los distintos grupos de edad, lo que sugiere la existencia de múltiples segmentos de clientes valiosos.

## Estructura del proyecto
customer-shopping-analysis/ │ ├── data/ │ └── customer_shopping_behavior.csv │ ├── notebooks/ │ └── customer_analysis.ipynb │ ├── sql/ │ └── business_queries.sql │ ├── dashboard/ │ └── tableau_dashboard.png │ ├── reports/ │ └── business_report.pdf │ └── README.md
