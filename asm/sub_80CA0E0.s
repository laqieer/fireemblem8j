	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CA0E0, "ax", %progbits
@ sub_80CA0E0 @ JP 0x080CA0E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA0E0
	.thumb_func
sub_80CA0E0:
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _080CA120 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, _080CA124 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080CA120: .4byte 0x01000008
_080CA124: .4byte 0x03003020

