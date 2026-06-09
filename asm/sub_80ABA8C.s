	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80ABA8C, "ax", %progbits
@ sub_80ABA8C @ JP 0x080ABA8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABA8C
	.thumb_func
sub_80ABA8C:
	push {r4, lr}
	sub sp, #0x28
	adds r4, r0, #0
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080ABAC4 @ =0x01000012
	mov r1, sp
	bl sub_80D6370
	mov r2, sp
	ldrb r0, [r2, #0x1c]
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x1c]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2, #0x1c]
	mov r0, sp
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x28
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080ABAC4: .4byte 0x01000012

