# System_Hacking

`I'll share the link  i heard in the youtube lecture `

- ### Link : [Youtube](https://www.youtube.com/watch?v=PsXXjNL_ogc&list=PLRx0vPvlEmdAXwJnNtKIVeC27UmwljRYA&index=4)

---
> Assembly language   
```
// helloworld.s
section  .data
        msg db "hello world"

section .text
        global_start

_start:
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, 12
        syscall
        mov rax, 60
        mov rdi, 0
        syscall
```
어셈블리어란, 우리가 흔히 사용하고 있는 C, C++, python 등 고급 코드를 실행하기 위해 컴파일을 하게 되는데 그때 컴파일러를 통해 생성되는 코드이다. 이 코드는 기계 즉, CPU가 이해할 수 있는 형태로 번역되는 것이다.

* 위 어셈블리어를 실행하기 위해서 Kali LINUX에서는 `nasm -f elf64 -o helloworld.o helloworld.s` 를 통해 'hellworld.o' 라는 목적 코드로 변형시키면 실행 프로그램이 생성된다.

> Register & System call   

64비트 환경에서 컴퓨터는 시스템 구조, 레지스터를 어떻게 불러오는지에 대해 MICROSOFT사에서 자세히 설명해두었다. 어셈블리어에서 이용하는 레지스터의 이름과 메모리는 어떻게 되는지 자세히 알고싶으면 확인해보길 바랍니다. 
[MICROSOFT](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture)

* rax : 가장 중요한 레지스터 중 하나, 시스템 콜의 실질적인 번호, 함수의 결과가 담기는 곳
* rbx : 베이스 레지스터, 메모리 주소를 지정해주는 곳
* rcx : 카운터 레지스터, 반복문에 주로 사용
* rdx : 데이터 레지스터, 연산수행    
  __<위 4개의 레지스터를 통틀어 데이터 레지스터라 칭함.>__
* rsi : 메모리를 이동하거나 비교할 때 출발지 주소
* rdi : 메모리를 이동하거나 비교할 때 목적지 주소
* rbp : 함수의 파라미터나 변수의 주소
* rsp : 스택에 대한 삽입 및 삭제 명령에 의해서 변경되는 top의 주소   

Syscall 같은 경우는 Google에 __64bit system call table__ 을 검색하면 자세히 설명되어있다.
 
> Memory 
 
[memory_image] 추가할 예정
사진은 운영체제 32bit 기준의 메모리이다. 64bit의 메모리 크기는 2^64-1이다

Stack 영역 : 선입선출의 개념(FIFO), 함수 및 함수 지역변수 등 호출할 때마다 정보가 쌓인다.   
Heap 영역 : 동적으로 할당되는 변수, C언어의 malloc()함수과 같은 것으로 할당 할 때 저장되는 공간   
BSS 영역 : 프로그램에서 사용될 변수들이 실제로 위치하는 영역, 초기화하지 않은 변수   
Data 영역 : 초기화가 이루어진 변수이고, 위 어셈블리어 코드중 `section .data`가 이 영역이다.  
Text 영역 : 우리가 작성한 소스 코드, 시스템이 알아들을 수 있는 실질적인 명령어이고, 컴파일러가 만들어 놓은 기계어 코드이고, 위 어셈블리어 코드중 `global_start`로부터 `_start:`의 코드가 하나씩 들어가게 된다.

[compiling_image]  
리눅스는 기본적으로 프로그램을 실행할 때 스택영역에 다양한 취약점이 있다는 것을 알고 있기 때문에 기본적인 방어체계마련하는데 이러한 것을 다 끈상태로 컴파일을 하도록 만들어주는 명령어이다.
`stack-boundary=4`를 통해 64bit 운영체제버전으로 컴파일할 수 있게한다. sum.c의 파일을 sum.a의 어셈블리어 코드로 바꿔줄 수 있게 한다.
