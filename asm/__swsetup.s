	.syntax unified
	.set __sinit, 0x080D8C7C + 1
	.set __smakebuf, 0x080D9234 + 1
	.set _free_r, 0x080D8CDC + 1
	.section .text.__swsetup, "ax", %progbits
@ __swsetup @ JP 0x080D7BEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __swsetup
	.thumb_func
__swsetup:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080D7BFC
	ldr r0, _080D7C28 @ =0x08BB8A74
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080D7BFC:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D7C0A
	adds r0, r1, #0
	bl __sinit
_080D7C0A:
	ldrh r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _080D7C64
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080D7C2C
	movs r0, #1
	rsbs r0, r0, #0
	b _080D7C96
	.align 2, 0
_080D7C28: .4byte 0x08BB8A74
_080D7C2C:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080D7C5C
	ldr r1, [r4, #0x30]
	cmp r1, #0
	beq _080D7C4A
	adds r0, r4, #0
	adds r0, #0x40
	cmp r1, r0
	beq _080D7C48
	ldr r0, [r4, #0x54]
	bl _free_r
_080D7C48:
	str r5, [r4, #0x30]
_080D7C4A:
	movs r0, #0x25
	rsbs r0, r0, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	movs r1, #0
	strh r0, [r4, #0xc]
	str r1, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [r4]
_080D7C5C:
	movs r0, #8
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_080D7C64:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _080D7C70
	adds r0, r4, #0
	bl __smakebuf
_080D7C70:
	ldrh r1, [r4, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080D7C86
	movs r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	rsbs r0, r0, #0
	str r0, [r4, #0x18]
	b _080D7C94
_080D7C86:
	movs r0, #2
	ands r0, r1
	movs r1, #0
	cmp r0, #0
	bne _080D7C92
	ldr r1, [r4, #0x14]
_080D7C92:
	str r1, [r4, #8]
_080D7C94:
	movs r0, #0
_080D7C96:
	pop {r4, r5, pc}

