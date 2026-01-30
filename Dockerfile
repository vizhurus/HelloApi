# 1. Базовый образ Python 3.12
FROM python:3.12-slim

# 2. Рабочая директория в контейнере
WORKDIR /app

# 3. Копируем pyproject.toml и uv.lock (зависимости)
COPY pyproject.toml uv.lock ./

# 4. Устанавливаем uv и зависимости через uv
RUN pip install uv && uv pip install --system --no-cache

# 5. Копируем код приложения
COPY app app

# 6. Открываем порт 8000
EXPOSE 8000

# 7. Команда запуска
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
