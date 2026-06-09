	.syntax unified
	.section .text.GetForceDisabledMenuItems, "ax", %progbits
@ GetForceDisabledMenuItems @ JP 0x08050488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetForceDisabledMenuItems
	.thumb_func
GetForceDisabledMenuItems:
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r1, r0, #0
	ldr r2, _080504A8 @ =0x03001868
	ldr r5, _080504AC @ =sub_80501C4
	adds r3, r2, #4
_08050494:
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080504B0
	ldr r0, [r3]
	cmp r0, r5
	bne _080504B0
	ldrh r0, [r2]
	b _080504B2
	.align 2, 0
_080504A8: .4byte 0x03001868
_080504AC: .4byte 0x080501C5  @ sub_80501C4
_080504B0:
	movs r0, #0
_080504B2:
	strb r0, [r1]
	adds r1, #1
	adds r2, #8
	adds r3, #8
	adds r4, #1
	cmp r4, #0xf
	ble _08050494
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

