	.syntax unified
	.section .text.HidePlayerUnits, "ax", %progbits
@ HidePlayerUnits @ JP 0x08018C94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HidePlayerUnits
	.thumb_func
HidePlayerUnits:
	push {r4, r5, r6, r7, lr}
	movs r3, #1
	ldr r7, _08018CD0 @ =0x085C2A50
	movs r6, #0xff
	movs r5, #4
	movs r4, #1
_08018CA0:
	adds r0, r3, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	cmp r2, #0
	beq _08018CC2
	ldr r0, [r2]
	cmp r0, #0
	beq _08018CC2
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _08018CC2
	orrs r1, r4
	str r1, [r2, #0xc]
_08018CC2:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018CA0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018CD0: .4byte 0x085C2A50

