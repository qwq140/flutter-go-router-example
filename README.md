# GoRouter 가이드
> 작성 기준 버전 : 14.8.0

`go_router`는 Flutter 애플리케이션에서 라우팅을 쉽게 관리할 수 있도록 도와주는 패키지이다.
선언형 방식으로 경로를 정의하고, URL 경로 기반으로 화면 전환을 처리할 수 있다.

## 기본 사용법
### 1. GoRouter 설정
```dart
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    //...
  ]
);
```
```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
```

### 2. 페이지 이동 메서드 설명

#### 1. **`context.go(String path)`**
- **설명:**  
  현재 경로를 새로운 경로로 **교체**한다.  
  이전 경로는 히스토리 스택에 추가되지 않는다.


- **예시:**
  ```dart
  context.go('/first');
  ```

#### 2. **`context.push(String path)`**
- **설명:**  
  새로운 경로를 히스토리 스택에 추가한다.
  뒤로 가기 버튼으로 이전 페이지로 돌아갈 수 있다.


- **예시:**
  ```dart
  context.push('/first/15');
  ```
  
#### 3. **`named route`**
- **설명:**
  경로를 입력하는 방식이 아닌 **route name**을 이용하는 방식

- **예시:**
  ```dart
  GoRoute(
     path: 'first',
     name: 'first',
     builder: (context, state) {
       return FirstScreen();
    },
  )
  ```
  **GoRoute**를 생성할 때 **name**속성을 추가할 수 있다.
  
  ```dart
  context.goNamed('first');
  ```
  **go()**를 name 형식으로 사용

  ```dart
  context.pushNamed('first');
  ```
  **push()**를 name 형식으로 사용

#### 4. **`context.pop([result])`**
- **설명:**  
  현재 페이지를 닫고 이전 페이지로 이동한다.(스택에서 현재 페이지를 제거)  
  데이터를 반환할 수 있다.


- **예시:**
  ```dart
  context.pop();
  
  context.pop('result data');
  ```

#### 5. **`context.replace(String location)`**
- **설명:**  
  현재 페이지를 새로운 페이지로 교체한다.


- **예시:**
  ```dart
  context.replace('/first');
  ```

#### 6. **`context.pushReplacement(String location)`**
- **설명:**  
  현재 페이지를 새로운 페이지로 교체한다.  
  `replace`와 다르게 전환 애니메이션이 적용된다.


- **예시:**
  ```dart
  context.pushReplacement('/first');
  ```
  

## 2. ShellRoute 와 StatefulShellRoute
### 1. ShellRoute
`ShellRoute`는 **공통 레이아웃**을 적용할 수 있도록 도와준다.    
자식 경로들은 이 레이아웃 안에서 렌더링이 된다.

```dart
        ShellRoute(
          builder: (context, state, child) {
            return ShellRouteScreen(child: child);
          },
          routes: [
            GoRoute(
              path: '/shell/search',
              name: 'search',
              builder: (context, state) {
                return SearchScreen();
              },
            ),
            GoRoute(
              path: '/shell/settings',
              name: 'settings',
              builder: (context, state) {
                return SettingsScreen();
              },
            ),
            GoRoute(
              path: '/shell/profile',
              name: 'profile',
              builder: (context, state) {
                return ProfileScreen();
              },
            ),
          ],
        ),
```
- builder의 child가 자식 라우트이다.
- 탭 이동 시 상태가 초기화 된다. (탭 전환 시 페이지 새로 생성)

### 2. StatefulShellRoute
`StatefulShellRoute`는 탭 간 전환 시 상태를 유지할 수 있게 도와준다.
```dart
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigationKey,
          builder: (context, state, navigationShell) {
            return StatefulShellRouteScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/stateful_shell/search',
                  name: 'searchV2',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: SearchScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/stateful_shell/settings',
                  name: 'settingsV2',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: SettingsScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/stateful_shell/profile',
                  name: 'profileV2',
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: ProfileScreen());
                  },
                ),
              ],
            ),
          ],
        )
```
- 탭 이동 시 상태 유지
- 내부적으로 **IndexedStack**으로 관리
- 스크롤 위치, 입력값 등이 초기화 되지 않는다.
