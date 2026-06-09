	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_808E75C, 0x0808E75C + 1
	.set sub_808EA4C, 0x0808EA4C + 1
	.set sub_808EBE8, 0x0808EBE8 + 1
	.section .text.sub_808F1C4, "ax", %progbits
@ sub_808F1C4 @ JP 0x0808F1C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F1C4
	.thumb_func
sub_808F1C4:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _0808F208 @ =0x0202BCAC
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808F20C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _0808F210
	cmp r1, #0
	beq _0808F210
	adds r0, r4, #0
	bl sub_808EBE8
	movs r0, #0
	str r0, [r4, #0x58]
	b _0808F2B8
	.align 2, 0
_0808F208: .4byte 0x0202BCAC
_0808F20C: .4byte 0x0202E4D4
_0808F210:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0808F2B8
	ldr r0, _0808F260 @ =0x085C29C8
	bl Proc_Find
	cmp r0, #0
	bne _0808F2B8
	ldr r0, _0808F264 @ =0x08A73964
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _0808F23E
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808F254
_0808F23E:
	ldr r0, _0808F268 @ =0x08A73A9C
	bl Proc_Find
	cmp r0, #0
	beq _0808F26C
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808F26C
_0808F254:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _0808F2B8
	adds r0, #1
	str r0, [r4, #0x58]
	b _0808F2B8
	.align 2, 0
_0808F260: .4byte 0x085C29C8
_0808F264: .4byte 0x08A73964
_0808F268: .4byte 0x08A73A9C
_0808F26C:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _0808F2B8
	cmp r0, #8
	bne _0808F28A
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808EA4C
	b _0808F2B8
_0808F28A:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _0808F2A2
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _0808F2A8
_0808F2A2:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_0808F2A8:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_808E75C
_0808F2B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

