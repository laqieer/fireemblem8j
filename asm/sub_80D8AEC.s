	.syntax unified
	.set __sinit, 0x080D8C7C + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.set sub_80D9188, 0x080D9188 + 1
	.section .text.sub_80D8AEC, "ax", %progbits
@ sub_80D8AEC @ JP 0x080D8AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D8AEC
	.thumb_func
sub_80D8AEC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080D8B08
	ldr r0, _080D8B00 @ =0x08BB8A74
	ldr r0, [r0]
	ldr r1, _080D8B04 @ =sub_80D8AEC
	bl sub_80D9188
	b _080D8B7E
	.align 2, 0
_080D8B00: .4byte 0x08BB8A74
_080D8B04: .4byte sub_80D8AEC
_080D8B08:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _080D8B14
	ldr r0, _080D8B48 @ =0x08BB8A74
	ldr r0, [r0]
	str r0, [r4, #0x54]
_080D8B14:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _080D8B22
	adds r0, r1, #0
	bl __sinit
_080D8B22:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080D8B7C
	ldr r6, [r4, #0x10]
	cmp r6, #0
	beq _080D8B7C
	ldr r0, [r4]
	subs r5, r0, r6
	str r6, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080D8B5A
	ldr r0, [r4, #0x14]
	b _080D8B5C
	.align 2, 0
_080D8B48: .4byte 0x08BB8A74
_080D8B4C:
	movs r0, #0x40
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	b _080D8B7E
_080D8B5A:
	movs r0, #0
_080D8B5C:
	str r0, [r4, #8]
	cmp r5, #0
	ble _080D8B7C
_080D8B62:
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0x24]
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80D65C8
	adds r1, r0, #0
	cmp r1, #0
	ble _080D8B4C
	adds r6, r6, r1
	subs r5, r5, r1
	cmp r5, #0
	bgt _080D8B62
_080D8B7C:
	movs r0, #0
_080D8B7E:
	pop {r4, r5, r6, pc}

