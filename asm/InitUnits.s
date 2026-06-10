	.syntax unified
	.set sub_801759C, 0x0801759C + 1
	.section .text.InitUnits, "ax", %progbits
@ InitUnits @ JP 0x0801756C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitUnits
	.thumb_func
InitUnits:
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _08017598 @ =0x085C2A50
	movs r6, #0xff
_08017574:
	adds r0, r5, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r4, [r0]
	cmp r4, #0
	beq _0801758A
	adds r0, r4, #0
	bl sub_801759C
	strb r5, [r4, #0xb]
_0801758A:
	adds r5, #1
	cmp r5, #0xff
	ble _08017574
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017598: .4byte 0x085C2A50

