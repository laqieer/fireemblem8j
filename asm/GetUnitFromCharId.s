	.syntax unified
	.section .text.GetUnitFromCharId, "ax", %progbits
@ GetUnitFromCharId @ JP 0x08017FB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnitFromCharId
	.thumb_func
GetUnitFromCharId:
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _08017FD8 @ =0x085C2A50
	movs r4, #0xff
_08017FBA:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08017FDC
	ldr r0, [r1]
	cmp r0, #0
	beq _08017FDC
	ldrb r0, [r0, #4]
	cmp r0, r3
	bne _08017FDC
	adds r0, r1, #0
	b _08017FE4
	.align 2, 0
_08017FD8: .4byte 0x085C2A50
_08017FDC:
	adds r2, #1
	cmp r2, #0xff
	ble _08017FBA
	movs r0, #0
_08017FE4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

