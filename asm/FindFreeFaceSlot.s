	.syntax unified
	.section .text.FindFreeFaceSlot, "ax", %progbits
@ FindFreeFaceSlot @ JP 0x08005478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FindFreeFaceSlot
	.thumb_func
FindFreeFaceSlot:
	push {lr}
	movs r1, #0
	ldr r2, _08005488 @ =0x03004920
_0800547E:
	ldr r0, [r2]
	cmp r0, #0
	bne _0800548C
	adds r0, r1, #0
	b _08005498
	.align 2, 0
_08005488: .4byte 0x03004920
_0800548C:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _0800547E
	movs r0, #1
	rsbs r0, r0, #0
_08005498:
	pop {r1}
	bx r1

