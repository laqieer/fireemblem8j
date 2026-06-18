	.syntax unified
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_8018DC8, "ax", %progbits
@ ClearCutsceneUnits @ JP 0x08018DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearCutsceneUnits
	.thumb_func
ClearCutsceneUnits:
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018E00 @ =0x085C2A50
_08018DCE:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _08018E0E
	ldr r0, [r2]
	cmp r0, #0
	beq _08018E0E
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08018E0E
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08018E08
	ldr r0, _08018E04 @ =0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0xc]
	b _08018E0E
	.align 2, 0
_08018E00: .4byte 0x085C2A50
_08018E04: .4byte 0xFFBFFFFF
_08018E08:
	adds r0, r3, #0
	bl sub_801759C
_08018E0E:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018DCE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

