	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804987C, "ax", %progbits
@ sub_804987C @ JP 0x0804987C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804987C
	.thumb_func
sub_804987C:
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080498A0 @ =0x085D4110
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080498A0: .4byte 0x085D4110

