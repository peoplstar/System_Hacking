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