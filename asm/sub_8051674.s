	.syntax unified
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_8051674, "ax", %progbits
@ sub_8051674 @ JP 0x08051674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051674
	.thumb_func
sub_8051674:
	push {r4, lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	ble _080516CC
	ldr r2, _08051698 @ =0x0203E1C4
	ldrh r3, [r2]
	movs r4, #0
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _080516A0
	ldr r0, _0805169C @ =0x0203E1C0
	ldrh r0, [r0]
	b _080516AE
	.align 2, 0
_08051698: .4byte 0x0203E1C4
_0805169C: .4byte 0x0203E1C0
_080516A0:
	ldrh r3, [r2, #2]
	movs r4, #2
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _080516B4
	ldr r0, _080516D4 @ =0x0203E1C0
	ldrh r0, [r0, #2]
_080516AE:
	strh r0, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2e]
_080516B4:
	ldr r0, _080516D8 @ =sub_80516DC
	str r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x74
	bl sub_8073E74
	movs r0, #0x74
	movs r1, #0x78
	movs r2, #0
	bl sub_8073F94
_080516CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080516D4: .4byte 0x0203E1C0
_080516D8: .4byte 0x080516DD  @ sub_80516DC

