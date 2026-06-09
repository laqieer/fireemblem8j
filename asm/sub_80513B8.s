	.syntax unified
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.section .text.sub_80513B8, "ax", %progbits
@ sub_80513B8 @ JP 0x080513B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80513B8
	.thumb_func
sub_80513B8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	ble _080513F0
	bl GetSelectTargetCount
	cmp r0, #1
	beq _080513EC
	ldr r0, _080513E4 @ =0x0203E1C4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmn r1, r0
	beq _080513EC
	ldr r0, _080513E8 @ =sub_80513FC
	b _080513EE
	.align 2, 0
_080513E4: .4byte 0x0203E1C4
_080513E8: .4byte 0x080513FD  @ sub_80513FC
_080513EC:
	ldr r0, _080513F8 @ =sub_80519C4
_080513EE:
	str r0, [r4, #0xc]
_080513F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080513F8: .4byte 0x080519C5  @ sub_80519C4

