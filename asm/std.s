	.syntax unified
	.section .text.std, "ax", %progbits
@ std @ JP 0x080D8B80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global std
	.thumb_func
std:
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _080D8BA8 @ =__sread
	str r1, [r0, #0x20]
	ldr r1, _080D8BAC @ =__swrite
	str r1, [r0, #0x24]
	ldr r1, _080D8BB0 @ =__sseek
	str r1, [r0, #0x28]
	ldr r1, _080D8BB4 @ =__sclose
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4, pc}
	.align 2, 0
_080D8BA8: .4byte 0x080DA2A9  @ __sread
_080D8BAC: .4byte 0x080DA2DD  @ __swrite
_080D8BB0: .4byte 0x080DA31D  @ __sseek
_080D8BB4: .4byte 0x080DA35D  @ __sclose

