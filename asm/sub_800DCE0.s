	.syntax unified
	.set Event09_Goto, 0x0800DC08 + 1
	.section .text.sub_800DCE0, "ax", %progbits
@ sub_800DCE0 @ JP 0x0800DCE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DCE0
	.thumb_func
sub_800DCE0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r5, #0xf
	ands r5, r1
	ldrh r3, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _0800DD0C @ =0x030004B0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r3, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r2, [r0]
	cmp r5, #5
	bhi _0800DD5E
	lsls r0, r5, #2
	ldr r1, _0800DD10 @ =_0800DD14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800DD0C: .4byte 0x030004B0
_0800DD10: .4byte _0800DD14
_0800DD14: @ jump table
	.4byte _0800DD2C @ case 0
	.4byte _0800DD32 @ case 1
	.4byte _0800DD38 @ case 2
	.4byte _0800DD3E @ case 3
	.4byte _0800DD44 @ case 4
	.4byte _0800DD4A @ case 5
_0800DD2C:
	cmp r3, r2
	beq _0800DD4E
	b _0800DD5A
_0800DD32:
	cmp r3, r2
	bne _0800DD4E
	b _0800DD5A
_0800DD38:
	cmp r3, r2
	bge _0800DD4E
	b _0800DD5A
_0800DD3E:
	cmp r3, r2
	bgt _0800DD4E
	b _0800DD5A
_0800DD44:
	cmp r3, r2
	ble _0800DD4E
	b _0800DD5A
_0800DD4A:
	cmp r3, r2
	bge _0800DD5A
_0800DD4E:
	adds r0, r4, #0
	bl Event09_Goto
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _0800DD60
_0800DD5A:
	movs r0, #0
	b _0800DD60
_0800DD5E:
	movs r0, #6
_0800DD60:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

