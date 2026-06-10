	.syntax unified
	.section .text.CountAvailableBlueUnits, "ax", %progbits
@ CountAvailableBlueUnits @ JP 0x08018D04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CountAvailableBlueUnits
	.thumb_func
CountAvailableBlueUnits:
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r2, #1
	ldr r6, _08018D40 @ =0x085C2A50
	movs r5, #0xff
	ldr r4, _08018D44 @ =0x0001000C
_08018D10:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018D32
	ldr r0, [r1]
	cmp r0, #0
	beq _08018D32
	ldr r0, [r1, #0xc]
	ands r0, r4
	cmp r0, #0
	bne _08018D32
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08018D32:
	adds r2, #1
	cmp r2, #0x3f
	ble _08018D10
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018D40: .4byte 0x085C2A50
_08018D44: .4byte 0x0001000C

