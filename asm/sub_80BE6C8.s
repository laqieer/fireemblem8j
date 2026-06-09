	.syntax unified
	.set MapUnitC_SetGfxNeedsUpdate, 0x080BFED4 + 1
	.section .text.sub_80BE6C8, "ax", %progbits
@ sub_80BE6C8 @ JP 0x080BE6C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE6C8
	.thumb_func
sub_80BE6C8:
	push {r4, lr}
	ldr r3, [r0, #0x44]
	movs r1, #0x2a
	adds r1, r1, r3
	mov ip, r1
	ldrb r1, [r1]
	movs r4, #1
	orrs r1, r4
	movs r2, #6
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	ldr r2, [r3, #0x4c]
	adds r2, #0x31
	ldrb r3, [r2]
	movs r1, #3
	orrs r1, r3
	strb r1, [r2]
	ldr r0, [r0, #0x4c]
	movs r1, #1
	rsbs r1, r1, #0
	bl MapUnitC_SetGfxNeedsUpdate
	ldr r2, _080BE714 @ =0x03003020
	ldrb r0, [r2, #1]
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BE714: .4byte 0x03003020

