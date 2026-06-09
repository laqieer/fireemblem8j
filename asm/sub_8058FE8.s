	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8058FE8, "ax", %progbits
@ sub_8058FE8 @ JP 0x08058FE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8058FE8
	.thumb_func
sub_8058FE8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIndex
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0805900E
	movs r0, #0
	strh r0, [r4]
_0805900E:
	ldr r0, _08059030 @ =0x0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, r5
	beq _08059028
	cmp r2, #0x54
	blt _08059028
	cmp r2, #0x56
	ble _08059024
	cmp r2, #0x58
	bne _08059028
_08059024:
	movs r0, #0
	strh r0, [r4]
_08059028:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059030: .4byte 0x0203E0FC

