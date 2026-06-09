	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8031530, 0x08031530 + 1
	.section .text.sub_80862D4, "ax", %progbits
@ sub_80862D4 @ JP 0x080862D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80862D4
	.thumb_func
sub_80862D4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	cmp r0, #0x72
	bne _08086344
	movs r0, #0x72
	bl sub_8031530
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080862F6
_080862F2:
	movs r0, #0x74
	b _08086346
_080862F6:
	movs r7, #1
_080862F8:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _0808633E
	ldr r0, [r6]
	cmp r0, #0
	beq _0808633E
	ldr r0, [r6, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0808633E
	movs r5, #0
	b _08086328
_08086318:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x72
	beq _080862F2
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08086328:
	cmp r5, #4
	bhi _0808633E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0
	bne _08086318
_0808633E:
	adds r7, #1
	cmp r7, #0x3f
	ble _080862F8
_08086344:
	mov r0, r8
_08086346:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

