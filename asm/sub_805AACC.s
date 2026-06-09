	.syntax unified
	.set InitBattleAnimFrame, 0x0805AB5C + 1
	.set sub_8052E7C, 0x08052E7C + 1
	.section .text.sub_805AACC, "ax", %progbits
@ sub_805AACC @ JP 0x0805AACC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805AACC
	.thumb_func
sub_805AACC:
	push {lr}
	ldr r0, _0805AAE4 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #4
	bhi _0805AB46
	lsls r0, r0, #2
	ldr r1, _0805AAE8 @ =_0805AAEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AAE4: .4byte 0x0203E11C
_0805AAE8: .4byte _0805AAEC
_0805AAEC: @ jump table
	.4byte _0805AB00 @ case 0
	.4byte _0805AB0A @ case 1
	.4byte _0805AB14 @ case 2
	.4byte _0805AB00 @ case 3
	.4byte _0805AB00 @ case 4
_0805AB00:
	movs r0, #6
	movs r1, #6
	bl InitBattleAnimFrame
	b _0805AB46
_0805AB0A:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	b _0805AB46
_0805AB14:
	movs r0, #8
	movs r1, #8
	bl InitBattleAnimFrame
	bl sub_8052E7C
	cmp r0, #0
	bne _0805AB38
	ldr r1, _0805AB34 @ =0x02000000
	ldr r2, [r1, #8]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #0xc]
	b _0805AB44
	.align 2, 0
_0805AB34: .4byte 0x02000000
_0805AB38:
	ldr r1, _0805AB54 @ =0x02000000
	ldr r2, [r1]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #2]
	ldr r1, [r1, #4]
_0805AB44:
	strh r0, [r1, #2]
_0805AB46:
	ldr r1, _0805AB58 @ =0x0203E14E
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_0805AB54: .4byte 0x02000000
_0805AB58: .4byte 0x0203E14E

