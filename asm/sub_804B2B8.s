	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_804CFA8, 0x0804CFA8 + 1
	.section .text.sub_804B2B8, "ax", %progbits
@ sub_804B2B8 @ JP 0x0804B2B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B2B8
	.thumb_func
sub_804B2B8:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0804B334 @ =0x03001810
	mov r8, r0
	ldr r4, _0804B338 @ =0x0203DD8C
	ldrb r0, [r4, #4]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	add r0, r8
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r5, #0x2c]
	movs r1, #0
	mov sb, r1
	strb r0, [r6, #0x10]
	ldr r0, [r5, #0x30]
	strb r0, [r6, #0x11]
	ldr r0, [r5, #0x34]
	strb r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	strb r0, [r4, #0x11]
	ldr r0, _0804B33C @ =0x03001830
	mov r8, r0
	ldr r1, [r0]
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r2, #6
	movs r3, #5
	bl sub_804CFA8
	mov r0, r8
	ldr r1, [r0, #4]
	mov r0, sb
	str r0, [sp]
	str r0, [sp, #4]
	str r5, [sp, #8]
	adds r0, r4, #0
	movs r2, #8
	movs r3, #5
	bl sub_804CFA8
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B334: .4byte 0x03001810
_0804B338: .4byte 0x0203DD8C
_0804B33C: .4byte 0x03001830

