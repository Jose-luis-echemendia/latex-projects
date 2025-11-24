# 📋 Correcciones y Mejoras en la Introducción

## ✅ Correcciones Realizadas

### 1. 📚 **Referencias Bibliográficas Corregidas**

Todas las referencias han sido convertidas al formato LaTeX correcto usando `\citep{}`:

- ❌ `(Apel et al., 2013)` → ✅ `\citep{apel2013feature}`
- ❌ `(Guzmán-Luján et al., 2022)` → ✅ `\citep{guzman2022variabilidad}`
- ❌ `(Bates, 2019)` → ✅ `\citep{bates2019teaching}`
- ❌ `(Sánchez et al., 2020)` → ✅ `\citep{sanchez2020metodologia}`

---

### 2. 🔤 **Palabras en Inglés en Cursiva**

Todas las palabras y términos en inglés ahora están en cursiva usando `\textit{}`:

- `backend` → `\textit{backend}`
- `SOLAR` → `\textit{SOLAR}`
- `micro-learning` → `\textit{micro-learning}`
- `flipped classroom` → `\textit{flipped classroom}`
- `ad-hoc` → `\textit{ad-hoc}`
- `pure::variants` → `\textit{pure::variants}`
- `FeatureIDE` → `\textit{FeatureIDE}`

---

### 3. 🔠 **Acrónimos Gestionados con LaTeX**

Todos los acrónimos ahora usan el sistema `\ac{}`:

| Término Original                                   | Formato LaTeX | Primera Aparición                                      |
| -------------------------------------------------- | ------------- | ------------------------------------------------------ |
| TIC (Tecnologías de la Información y Comunicación) | `\ac{TIC}`    | "Tecnologías de la Información y Comunicación (TIC)"   |
| SPL                                                | `\ac{SPL}`    | "Líneas de Productos de Software (SPL)"                |
| SPLE                                               | `\ac{SPLE}`   | "Ingeniería de Líneas de Productos de Software (SPLE)" |
| FM (Feature Models)                                | `\ac{FM}`     | "Modelos de Características (FM)"                      |
| MOOCs                                              | `\ac{MOOC}`   | "Massive Open Online Course (MOOC)"                    |

**Archivo actualizado:** `acronyms.tex`

---

### 4. 📖 **Glosario Creado**

Se ha creado un nuevo archivo `glossary.tex` con definiciones de términos técnicos importantes:

**Términos incluidos:**

1. **Variabilidad Curricular** - Definición de la capacidad de personalización de planes de estudio
2. **Modelos de Características** - Explicación de Feature Models
3. **Líneas de Productos de Software** - Concepto de SPL
4. **Líneas de Productos Educativos** - Aplicación al dominio educativo
5. **Backend** - Definición técnica del concepto
6. **Ad-hoc** - Explicación de soluciones específicas
7. **Flipped Classroom** - Metodología del aula invertida
8. **Micro-learning** - Estrategia de aprendizaje en unidades pequeñas
9. **Gamificación** - Uso de mecánicas de juegos en educación

**Ubicación en el documento:**

```
main.tex incluye:
    ├─ annexes.tex
    ├─ acronyms.tex
    ├─ glossary.tex      ← NUEVO
    └─ bibliographic_references.tex
```

---

## 📦 Archivos Modificados

1. **`introduction.tex`**

   - ✅ Referencias corregidas a formato `\citep{}`
   - ✅ Palabras en inglés en cursiva
   - ✅ Acrónimos con sistema `\ac{}`

2. **`acronyms.tex`**

   - ✅ Agregados: TIC, SPLE, FM, MOOC

3. **`glossary.tex`** ← **NUEVO**

   - ✅ 9 términos técnicos definidos

4. **`main.tex`**
   - ✅ Incluido `\input{glossary}` después de acrónimos

---

## 🎯 Cómo Usar los Acrónimos

### Primera vez que aparece:

```latex
\ac{SPL}  → "Líneas de Productos de Software (SPL)"
```

### Siguientes veces:

```latex
\ac{SPL}  → "SPL"
```

### Forzar forma completa:

```latex
\acf{SPL}  → "Líneas de Productos de Software (SPL)"
```

### Solo la sigla:

```latex
\acs{SPL}  → "SPL"
```

---

## 📝 Estructura del Glosario

El glosario usa el entorno `description` con estilo personalizado:

```latex
\begin{description}[style=nextline,leftmargin=0pt]
    \item[Término]
    Definición del término...
\end{description}
```

---

## ✨ Beneficios de los Cambios

1. **Referencias uniformes** - Todas siguen el estándar LaTeX
2. **Formato consistente** - Palabras en inglés claramente identificadas
3. **Gestión automática** - Los acrónimos se expanden automáticamente
4. **Mejor comprensión** - El glosario ayuda a lectores no familiarizados
5. **Profesionalismo** - El documento sigue estándares académicos

---

## 🚀 Próximos Pasos

1. Compilar el documento para verificar que todo funciona
2. Revisar que todas las referencias bibliográficas existan en `bibliographic_references.bib`
3. Verificar que los acrónimos aparezcan correctamente en su primera mención
4. Revisar el glosario y agregar más términos si es necesario

---

## 📚 Referencias que Deben Existir en bibliographic_references.bib

Asegúrate de que estas entradas existan:

- `apel2013feature`
- `guzman2022variabilidad`
- `bates2019teaching`
- `sanchez2020metodologia`
- `gomez2023`
- `unesco2022`

✅ **Todas estas referencias ya existen en tu archivo `bibliographic_references.bib`**
