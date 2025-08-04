# 🤝 Guía de Contribución

¡Gracias por querer mejorar Ultimate .gitignore! 

## 📋 Cómo contribuir

### 1. Reportar un problema
- Usa los [Issues](https://github.com/alafourcadev/ultimate-gitignore/issues)
- Busca si ya existe antes de crear uno nuevo
- Sé específico: ¿Qué herramienta? ¿Qué archivo falta?

### 2. Agregar nuevos patrones

#### Formato requerido:
```gitignore
### NombreHerramienta ###
# Comentario explicativo
patron1
patron2
```

#### Checklist:
- [ ] El patrón no existe ya
- [ ] Está en la categoría correcta
- [ ] Incluye comentario explicativo
- [ ] No es específico de proyecto

### 3. Proceso de PR

1. Fork el repo
2. Crea un branch descriptivo:
   - `add/nueva-herramienta`
   - `fix/patron-incorrecto`
   - `docs/mejora-readme`

3. Haz tus cambios
4. Commit con mensaje claro:
   ```
   Add: Soporte para Zed editor
   Fix: Patrón incorrecto para Node.js
   Docs: Mejorar instrucciones Windows
   ```

5. Push y crea el PR

## 🚫 NO agregar

- Archivos específicos de proyecto
- Patrones de negocio
- Archivos de configuración compartidos
- Secretos o credenciales (obvio)

## ✅ SÍ agregar

- Archivos de herramientas de desarrollo
- Archivos de sistema operativo
- Archivos de IDEs y editores
- Archivos temporales generales

## 📝 Estilo de código

- Usa comentarios en español o inglés
- Agrupa por categorías
- Ordena alfabéticamente dentro de cada categoría
- Un patrón por línea

¿Dudas? Abre un issue y conversamos 💬