# Arquitetura do Projeto - Flutter Tradução com IA

## Visão Geral

Este projeto implementa o **Clean Architecture** com princípios **SOLID** para criar um aplicativo de tradução usando Google ML Kit.

## Estrutura de Camadas

### 📁 **Presentation Layer** (`lib/presentation/`)
- **Responsabilidade**: Interface do usuário e lógica de apresentação
- **Componentes**:
  - `home_view.dart`: Widget da tela principal
  - `home_view_model.dart`: ViewModel com lógica de negócio da UI
- **Dependências**: Apenas para Domain Layer (Use Cases)

### 📁 **Domain Layer** (`lib/domain/`)
- **Responsabilidade**: Regras de negócio e entidades
- **Componentes**:
  - `entities/`: Entidades do domínio
  - `repositories/`: Interfaces dos repositórios
  - `usecases/`: Casos de uso da aplicação
- **Dependências**: Nenhuma (camada mais interna)

### 📁 **Data Layer** (`lib/core/data/`)
- **Responsabilidade**: Implementação de repositórios e fontes de dados
- **Componentes**:
  - `translator_data_source.dart`: Interface e implementação da fonte de dados
  - `translator_repository_impl.dart`: Implementação do repositório
- **Dependências**: Domain Layer (implementa interfaces)

### 📁 **Core** (`lib/core/`)
- **Responsabilidade**: Configurações e utilitários compartilhados
- **Componentes**:
  - `constants/`: Constantes da aplicação
  - `di/`: Injeção de dependências
- **Dependências**: Todas as camadas

## Princípios SOLID Aplicados

### ✅ **Single Responsibility Principle (SRP)**
- Cada classe tem uma única responsabilidade
- `TranslateTextUseCase`: Apenas tradução
- `HomeViewModel`: Apenas lógica da UI
- `TranslatorDataSource`: Apenas acesso a dados

### ✅ **Open/Closed Principle (OCP)**
- Classes abertas para extensão, fechadas para modificação
- Interface `TranslatorDataSource` permite novas implementações
- Interface `TranslatorRepository` permite diferentes estratégias

### ✅ **Liskov Substitution Principle (LSP)**
- Implementações podem ser substituídas por suas interfaces
- `TranslatorDataSourceImpl` pode ser substituído por qualquer implementação

### ✅ **Interface Segregation Principle (ISP)**
- Interfaces específicas e coesas
- `TranslatorRepository` tem apenas métodos necessários
- `TranslatorDataSource` tem apenas métodos de tradução

### ✅ **Dependency Inversion Principle (DIP)**
- Dependências de abstrações, não de implementações
- `HomeViewModel` depende de `TranslateTextUseCase` (abstração)
- `TranslateTextUseCase` depende de `TranslatorRepository` (interface)

## Clean Architecture

### 🔄 **Fluxo de Dependências**
```
Presentation → Domain ← Data
     ↓           ↑        ↑
   ViewModel   UseCase  Repository
     ↓           ↑        ↑
     UI      Entities  DataSource
```

### 📋 **Regras Aplicadas**
1. **Dependência Unidirecional**: Presentation → Domain ← Data
2. **Inversão de Dependência**: Uso de interfaces
3. **Separação de Responsabilidades**: Cada camada tem função específica
4. **Independência de Frameworks**: Domain não depende de Flutter

## Injeção de Dependências

### 🎯 **GetIt Configuration**
```dart
// Data Layer
getIt.registerLazySingleton<TranslatorDataSource>(() => TranslatorDataSourceImpl());

// Domain Layer  
getIt.registerLazySingleton(() => TranslatorRepositoryImpl(getIt()));
getIt.registerLazySingleton(() => TranslateTextUseCase(getIt()));
```

### 🔧 **Benefícios**
- Baixo acoplamento
- Facilita testes unitários
- Gerenciamento centralizado de dependências

## Tratamento de Erros

### 🚨 **Estratégia Implementada**
1. **Validação de Entrada**: Use Cases validam parâmetros
2. **Exceções Específicas**: `TranslationException` para erros de tradução
3. **Tratamento Hierárquico**: ViewModel trata diferentes tipos de erro
4. **Feedback ao Usuário**: UI mostra mensagens apropriadas

## Testabilidade

### 🧪 **Estrutura Preparada para Testes**
- Interfaces permitem mocks
- Injeção de dependências facilita testes
- Separação de responsabilidades permite testes unitários
- ViewModel pode ser testado independentemente