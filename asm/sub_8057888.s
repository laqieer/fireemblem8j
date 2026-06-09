	.syntax unified
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8057888, "ax", %progbits
@ sub_8057888 @ JP 0x08057888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057888
	.thumb_func
sub_8057888:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080578B4 @ =0x085E3F14
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x44]
	movs r1, #0
	str r1, [r4, #0x50]
	str r1, [r4, #0x4c]
	ldr r0, _080578B8 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	blt _080578F6
	cmp r0, #3
	ble _080578BC
	cmp r0, #4
	beq _080578E4
	b _080578F6
	.align 2, 0
_080578B4: .4byte 0x085E3F14
_080578B8: .4byte 0x0203E11C
_080578BC:
	ldr r0, _080578E0 @ =0x0203E100
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	bne _080578D0
	bl GetBanimDragonStatusType
	cmp r0, #0
	bne _080578D0
	str r5, [r4, #0x4c]
_080578D0:
	ldr r0, _080578E0 @ =0x0203E100
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #1
	bne _080578F6
	str r0, [r4, #0x50]
	b _080578F6
	.align 2, 0
_080578E0: .4byte 0x0203E100
_080578E4:
	cmp r5, #0
	bne _080578F0
	str r1, [r4, #0x4c]
	movs r0, #1
	str r0, [r4, #0x50]
	b _080578F6
_080578F0:
	movs r0, #1
	str r0, [r4, #0x4c]
	str r1, [r4, #0x50]
_080578F6:
	pop {r4, r5}
	pop {r0}
	bx r0

