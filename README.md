# 🌍 Flutter Tradução com IA

[![Flutter](https://img.shields.io/badge/Flutter-3.8.1+-blue.svg)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.8.1+-blue.svg)](https://dart.dev/)

## 📖 Sobre o Projeto

Este é um aplicativo Flutter que demonstra como implementar **tradução de texto usando Inteligência Artificial** seguindo os princípios da **Clean Architecture** e **SOLID**. O projeto utiliza o **Google ML Kit Translation** para realizar traduções em tempo real entre diferentes idiomas.

### 🎯 Objetivos do Projeto

- ✅ Demonstrar implementação de Clean Architecture em Flutter
- ✅ Aplicar princípios SOLID na prática
- ✅ Integrar IA para tradução de texto
- ✅ Criar uma interface intuitiva e responsiva
- ✅ Implementar injeção de dependências
- ✅ Preparar estrutura para testes unitários

## 🚀 Funcionalidades

### 🌐 Tradução Multi-idioma
- **Português** 🇧🇷
- **Inglês** 🇺🇸  
- **Espanhol** 🇪🇸

### 🎨 Interface do Usuário
- Design limpo e moderno
- Botões com bandeiras dos países
- Indicador de carregamento
- Tratamento de erros amigável
- Animações suaves

### ⚡ Performance
- Tradução em tempo real
- Interface responsiva
- Gerenciamento eficiente de estado

## 🏗️ Arquitetura do Projeto

### 📁 Estrutura de Pastas

```
lib/
├── core/                          # 🎯 Camada Core
│   ├── constants/                 # Constantes da aplicação
│   ├── data/                      # Implementações de dados
│   └── di/                        # Injeção de dependências
├── domain/                        # 🧠 Camada de Domínio
│   └── translation/
│       ├── entities/              # Entidades do negócio
│       ├── repositories/          # Interfaces dos repositórios
│       └── usecases/              # Casos de uso
├── presentation/                  # 🎨 Camada de Apresentação
│   └── home/
│       ├── view/                  # Widgets da interface
│       └── viewmodel/             # Lógica de apresentação
└── shared/                        # 🔧 Componentes compartilhados
    └── widgets/                   # Widgets reutilizáveis
```

### 🔄 Fluxo de Dados

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│ Presentation│───▶│   Domain    │◀───│    Data     │
│   (UI)      │    │ (Business)  │    │ (External)  │
└─────────────┘    └─────────────┘    └─────────────┘
```

## 🛠️ Tecnologias Utilizadas

### 📱 Framework Principal
- **Flutter 3.8.1+** - Framework de desenvolvimento multiplataforma

### 🤖 Inteligência Artificial
- **Google ML Kit Translation** - API de tradução offline

### 🏛️ Arquitetura e Padrões
- **Clean Architecture** - Separação de responsabilidades
- **SOLID Principles** - Princípios de design de software
- **MVVM Pattern** - Model-View-ViewModel

### 🔧 Gerenciamento de Estado
- **ChangeNotifier** - Gerenciamento de estado
- **GetIt** - Injeção de dependências

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 3.8.1 ou superior)
- [Dart SDK](https://dart.dev/get-dart) (versão 3.8.1 ou superior)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)

## 🚀 Como Executar o Projeto

### 1. Clone o Repositório
```bash
git clone https://github.com/seu-usuario/flutter_traducao_com_ia.git
cd flutter_traducao_com_ia
```

### 2. Instale as Dependências
```bash
flutter pub get
```

### 3. Execute o Projeto
```bash
flutter run
```

### 4. Para Build de Produção
```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🎮 Como Usar

1. **Abra o aplicativo** no seu dispositivo
2. **Veja o texto "Hello World"** na tela principal
3. **Toque em um dos botões de idioma**:
   - 🇧🇷 **Português** - Traduz para português
   - 🇺🇸 **Inglês** - Traduz para inglês  
   - 🇪🇸 **Espanhol** - Traduz para espanhol
4. **Aguarde a tradução** - Um indicador de carregamento aparecerá
5. **Veja o resultado** - O texto será traduzido instantaneamente

## 🔧 Configuração do Ambiente

### Android
- Android SDK API 21+
- Gradle 7.0+

### iOS
- iOS 11.0+
- Xcode 12.0+

## 🏗️ Princípios SOLID Aplicados

### ✅ Single Responsibility Principle (SRP)
- Cada classe tem uma única responsabilidade
- `TranslateTextUseCase` - Apenas tradução
- `HomeViewModel` - Apenas lógica da UI

### ✅ Open/Closed Principle (OCP)
- Classes abertas para extensão, fechadas para modificação
- Interfaces permitem novas implementações

### ✅ Liskov Substitution Principle (LSP)
- Implementações podem ser substituídas por suas interfaces
- `TranslatorDataSourceImpl` pode ser substituído

### ✅ Interface Segregation Principle (ISP)
- Interfaces específicas e coesas
- `TranslatorRepository` tem apenas métodos necessários

### ✅ Dependency Inversion Principle (DIP)
- Dependências de abstrações, não de implementações
- Uso de injeção de dependências com GetIt

## 🚨 Tratamento de Erros

O aplicativo implementa um sistema robusto de tratamento de erros:

- **Validação de entrada** nos Use Cases
- **Exceções específicas** para diferentes tipos de erro
- **Feedback visual** para o usuário
- **Opção de tentar novamente** em caso de falha

## 🔄 Injeção de Dependências

O projeto utiliza **GetIt** para gerenciar dependências:

```dart
// Configuração das dependências
getIt.registerLazySingleton<TranslatorDataSource>(() => TranslatorDataSourceImpl());
getIt.registerLazySingleton(() => TranslatorRepositoryImpl(getIt()));
getIt.registerLazySingleton(() => TranslateTextUseCase(getIt()));
```