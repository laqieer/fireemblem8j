	.syntax unified
	.set sub_8073418, 0x08073418 + 1
	.section .text.sub_805BD44, "ax", %progbits
@ RegisterBanimTerrainTmByPos @ JP 0x0805BD44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RegisterBanimTerrainTmByPos
	.thumb_func
RegisterBanimTerrainTmByPos:
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	cmp r0, #4
	bhi _0805BD8C
	lsls r0, r0, #2
	ldr r1, _0805BD60 @ =_0805BD64
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805BD60: .4byte _0805BD64
_0805BD64: @ jump table
	.4byte _0805BD78 @ case 0
	.4byte _0805BD82 @ case 1
	.4byte _0805BD8C @ case 2
	.4byte _0805BD8C @ case 3
	.4byte _0805BD78 @ case 4
_0805BD78:
	movs r2, #0x30
	cmp r3, #0
	bne _0805BD94
	movs r2, #0x21
	b _0805BD94
_0805BD82:
	movs r2, #0x30
	cmp r3, #0
	bne _0805BD94
	movs r2, #0x1d
	b _0805BD94
_0805BD8C:
	movs r2, #0x30
	cmp r3, #0
	bne _0805BD94
	movs r2, #3
_0805BD94:
	ldr r0, _0805BDB8 @ =0x080DFF70
	movs r1, #1
	rsbs r1, r1, #0
	lsls r2, r2, #1
	ldr r3, _0805BDBC @ =0x0201CF84
	adds r2, r2, r3
	movs r3, #0xf
	str r3, [sp]
	movs r3, #5
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	movs r3, #0x42
	bl sub_8073418
	add sp, #0x10
	pop {r0}
	bx r0
	.align 2, 0
_0805BDB8: .4byte 0x080DFF70
_0805BDBC: .4byte 0x0201CF84

