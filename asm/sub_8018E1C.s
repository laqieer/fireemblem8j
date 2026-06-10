	.syntax unified
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_8018E1C, "ax", %progbits
@ sub_8018E1C @ JP 0x08018E1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018E1C
	.thumb_func
sub_8018E1C:
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018E60 @ =0x085C2A50
_08018E22:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018E4C
	ldr r0, [r2]
	cmp r0, #0
	beq _08018E4C
	ldr r0, [r2, #0xc]
	movs r1, #0x33
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	movs r1, #0
	bl SetUnitStatus
_08018E4C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018E22
	bl RefreshEntityBmMaps
	bl sub_8027144
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018E60: .4byte 0x085C2A50

