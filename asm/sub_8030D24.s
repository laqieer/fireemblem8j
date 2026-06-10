	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8030D24, "ax", %progbits
@ sub_8030D24 @ JP 0x08030D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030D24
	.thumb_func
sub_8030D24:
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _08030D48 @ =0x0202BCAC
	movs r5, #1
	ldrsb r5, [r4, r5]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08030D4C @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl sub_80D6370
	strb r5, [r4, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030D48: .4byte 0x0202BCAC
_08030D4C: .4byte 0x01000020

