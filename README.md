# karate-automationexercise

Reto Técnico para QA — Semana 7 | Sofka Technologies  
Automatización de pruebas API REST sobre [AutomationExercise](https://automationexercise.com/api) usando **Karate DSL**.

---

## Stack

| Componente | Versión |
|---|---|
| Java | 21 |
| Karate Labs Core | 2.0.0 |
| JUnit Jupiter | 5.10.2 |
| Maven Surefire Plugin | 3.2.5 |

---

## Arquitectura del proyecto

Proyecto base Maven generado en **IntelliJ IDEA**. La lógica de producción está intencionalmente vacía (`src/main/`); todo el peso funcional vive en `src/test/`.

```
karate-automationexercise/
├── pom.xml                              ← Dependencias y configuración de build
└── src/
    └── test/
        ├── java/
        │   └── automationexercise/
        │       └── AutomationExerciseTest.java   ← Test runner (JUnit 5 + Karate)
        └── resources/
            ├── karate-config.js                  ← Configuración global (baseUrl)
            └── automationexercise/
                ├── brands_get.feature            ← GET  /brandsList
                ├── user_01_create_post.feature   ← POST /createAccount
                ├── user_02_update_put.feature    ← PUT  /updateAccount
                └── user_03_delete_delete.feature ← DELETE /deleteAccount
```

### `pom.xml`
Define el `groupId` `com.sofka.qa` y declara las dos dependencias de test: `karate-core` (motor de DSL + HTTP) y `junit-jupiter` (runner). El plugin `maven-surefire` es el encargado de descubrir y ejecutar `AutomationExerciseTest` durante la fase `test`.

### `AutomationExerciseTest.java`
Punto de entrada único. Usa `Runner.path("classpath:automationexercise")` para descubrir todos los `.feature` del paquete, genera reporte HTML y valida el resultado con un assertion de JUnit.

### `karate-config.js`
Expone la variable global `baseUrl` (`https://automationexercise.com/api`) disponible en todos los escenarios sin repetición.

### Feature files
Cada archivo cubre un verbo HTTP del CRUD de usuario, más un escenario de consulta de catálogo:

| Archivo | Método | Endpoint | Tag |
|---|---|---|---|
| `brands_get.feature` | GET | `/brandsList` | `@get @smoke` |
| `user_01_create_post.feature` | POST | `/createAccount` | `@post @user` |
| `user_02_update_put.feature` | PUT | `/updateAccount` | `@put @user` |
| `user_03_delete_delete.feature` | DELETE | `/deleteAccount` | `@delete @user` |

---

## Ejecución

```bash
mvn clean test
```

El reporte HTML se genera automáticamente en `target/karate-reports/`.

