section .data
	STAR db '*'
	EMPTY db 0x0a ;줄바꿈
section .text
	global _start

_start:
	mov rax, 1 ; WRITE 시스템콜
	mov rdi, 1 ; 기본 출력 모드
	mov rdx, 1 ; 출력 길이 설정 (한글자 출력)
	mov r10, 0 ; 반복문의 인덱스 역할
	mov r9, [rsp + 16] ; 현재 입력이 된 문자열을 찾는다. 

	cmp r9, 0 ; 입력이 없는 경우 r9에는 0이 담긴다.
	je _done ; 실행종료 프로그램 호출

	mov cl, [r9] ; r9의 가장 앞 한 바이트만 cl에 저장
	movzx r9, cl ; 문자형태의 cl를 r9에 저장
	sub r9, 0x30 ; 인덱스

	mov r8, r9
	xor r9, r9 ; 초기화
	call _syscall ; 새로운 syscall의 함수

_small:
	cmp r10, r9
	je _up
	mov rsi, STAR ; 별 출력
	syscall
	mov rax, 1 ; WRITE 시스템콜 설정
	inc r10 
	jmp _small ; 다시 출력
_up:
	cmp r9, r8 ; i == n인 경우
	je _down
	mov rsi, EMPTY ; 줄바꿈 출력
	syscall 
	mov rax, 1 ; WRTIE 시스템 콜 설정
	mov r10, 0
	add r9, 1
	jmp _small

_down:
	cmp r9, 0
	je _done;
	mov rsi, EMPTY 
	syscall
	mov rax, 1
	mov r10, 0
	sub r9, 1
	jmp _big

_big:
	cmp r10, r9
	je _down
	mov rsi, STAR
	syscall
	mov rax, 1
	inc r10
	jmp _big

_done:
	mov rax, 60
	mov rdi, 0
	syscall

_syscall:
	syscall
	ret
