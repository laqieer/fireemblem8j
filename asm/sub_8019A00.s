	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8019AE0, 0x08019AE0 + 1
	.set sub_8019BAC, 0x08019BAC + 1
	.section .text.sub_8019A00, "ax", %progbits
@ sub_8019A00 @ JP 0x08019A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019A00
	.thumb_func
sub_8019A00:
	push {r4, r5, lr}
	ldr r2, _08019A30 @ =0x0202BCAC
	ldrh r4, [r2, #0xc]
	movs r0, #0xc
	ldrsh r3, [r2, r0]
	ldrh r0, [r2, #0x10]
	movs r5, #0x10
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019A44
	cmp r3, r1
	ble _08019A34
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A44
	movs r0, #0xf
	bl sub_8019AE0
	b _08019A44
	.align 2, 0
_08019A30: .4byte 0x0202BCAC
_08019A34:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A44
	movs r0, #0
	bl sub_8019AE0
_08019A44:
	ldr r2, _08019A74 @ =0x0202BCAC
	ldrh r4, [r2, #0xe]
	movs r5, #0xe
	ldrsh r3, [r2, r5]
	ldrh r0, [r2, #0x12]
	movs r5, #0x12
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019A88
	cmp r3, r1
	ble _08019A78
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A88
	movs r0, #0xa
	bl sub_8019BAC
	b _08019A88
	.align 2, 0
_08019A74: .4byte 0x0202BCAC
_08019A78:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019A88
	movs r0, #0
	bl sub_8019BAC
_08019A88:
	ldr r4, _08019ADC @ =0x0202BCAC
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #4
	ldrh r2, [r4, #0xe]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl BG_SetPosition
	ldrb r1, [r4, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08019AD4
	ldrh r0, [r4, #0x24]
	lsls r0, r0, #4
	ldrh r1, [r4, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r0, r0, #4
	ldrh r2, [r4, #0xe]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl BG_SetPosition
_08019AD4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019ADC: .4byte 0x0202BCAC

