	.syntax unified
	.set sub_8009608, 0x08009608 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_80804BC, "ax", %progbits
@ sub_80804BC @ JP 0x080804BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80804BC
	.thumb_func
sub_80804BC:
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r1, [r4, #0x30]
	movs r0, #0x85
	bl sub_8014B50
	ldr r0, _080804E8 @ =0x08A22098
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	subs r2, #8
	ldr r3, _080804EC @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080804E8: .4byte 0x08A22098
_080804EC: .4byte 0x000041C0

