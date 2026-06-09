	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.section .text.sub_80A4CA8, "ax", %progbits
@ sub_80A4CA8 @ JP 0x080A4CA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4CA8
	.thumb_func
sub_80A4CA8:
	push {r4, r5, lr}
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A4CDC
	movs r4, #1
_080A4CB8:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080A4CD4
	ldr r0, [r1]
	cmp r0, #0
	beq _080A4CD4
	adds r0, r1, #0
	bl sub_80176AC
	bl sub_80267A0
_080A4CD4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A4CB8
	b _080A4D04
_080A4CDC:
	movs r4, #0
	ldr r0, _080A4D10 @ =0x020136E8
	ldr r0, [r0]
	cmp r4, r0
	bge _080A4D04
	movs r5, #0
_080A4CE8:
	ldr r0, _080A4D14 @ =0x08A95B10
	ldr r0, [r0]
	adds r0, r5, r0
	ldrb r0, [r0, #1]
	bl GetClassSMSId
	bl sub_80267A0
	adds r5, #0x18
	adds r4, #1
	ldr r0, _080A4D10 @ =0x020136E8
	ldr r0, [r0]
	cmp r4, r0
	blt _080A4CE8
_080A4D04:
	bl sub_8026F38
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A4D10: .4byte 0x020136E8
_080A4D14: .4byte 0x08A95B10

