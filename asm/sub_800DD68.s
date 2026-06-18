	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_800DD68, "ax", %progbits
@ Event0D_AsmCall @ JP 0x0800DD68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event0D_AsmCall
	.thumb_func
Event0D_AsmCall:
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x38]
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	ldrh r2, [r0, #4]
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	orrs r2, r0
	cmp r1, #1
	bne _0800DD90
	ldrh r0, [r3, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800DD90
	movs r0, #0
	b _0800DD98
_0800DD90:
	adds r0, r3, #0
	bl sub_80D65C4
	movs r0, #2
_0800DD98:
	pop {r1}
	bx r1

