	.syntax unified
	.set PutAppliedBitmap, 0x080131BC + 1
	.set sub_8088CFC, 0x08088CFC + 1
	.section .text.sub_8088DE8, "ax", %progbits
@ sub_8088DE8 @ JP 0x08088DE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088DE8
	.thumb_func
sub_8088DE8:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	adds r0, r5, #0
	movs r1, #2
	adds r2, r6, #0
	bl sub_8088CFC
	ldr r0, _08088E2C @ =0x000003FF
	ands r0, r5
	adds r4, r4, r0
	mov r0, r8
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #1
	bl PutAppliedBitmap
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088E2C: .4byte 0x000003FF

