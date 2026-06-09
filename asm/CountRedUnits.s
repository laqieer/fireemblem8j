	.syntax unified
	.section .text.CountRedUnits, "ax", %progbits
@ CountRedUnits @ JP 0x08018D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CountRedUnits
	.thumb_func
CountRedUnits:
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r2, #0x81
	ldr r6, _08018D84 @ =0x085C2A50
	movs r5, #0xff
	movs r4, #4
_08018D54:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018D76
	ldr r0, [r1]
	cmp r0, #0
	beq _08018D76
	ldr r0, [r1, #0xc]
	ands r0, r4
	cmp r0, #0
	bne _08018D76
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08018D76:
	adds r2, #1
	cmp r2, #0xbf
	ble _08018D54
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018D84: .4byte 0x085C2A50

