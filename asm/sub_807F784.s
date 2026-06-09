	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807F784, "ax", %progbits
@ sub_807F784 @ JP 0x0807F784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F784
	.thumb_func
sub_807F784:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x44
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	lsls r1, r1, #0x10
	ldr r0, _0807F7A4 @ =0xFFFF0000
	cmp r1, r0
	bne _0807F79E
	adds r0, r2, #0
	bl sub_8002DE4
_0807F79E:
	pop {r0}
	bx r0
	.align 2, 0
_0807F7A4: .4byte 0xFFFF0000

