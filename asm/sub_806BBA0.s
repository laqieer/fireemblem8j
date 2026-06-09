	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set efxDarkGradoGetPieceX, 0x0806BA2C + 1
	.set efxDarkGradoGetPieceY, 0x0806BAA4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806BBA0, "ax", %progbits
@ sub_806BBA0 @ JP 0x0806BBA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BBA0
	.thumb_func
sub_806BBA0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, [sp, #0x24]
	lsls r1, r1, #0x10
	asrs r5, r1, #0x10
	adds r6, r5, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, _0806BBF4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806BBF8 @ =0x08602D54
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r7, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x14
	strh r0, [r4, #0x2e]
	cmp r5, #1
	beq _0806BC0C
	cmp r5, #1
	bgt _0806BBFC
	cmp r5, #0
	beq _0806BC02
	b _0806BC1C
	.align 2, 0
_0806BBF4: .4byte 0x0201774C
_0806BBF8: .4byte 0x08602D54
_0806BBFC:
	cmp r6, #2
	beq _0806BC14
	b _0806BC1C
_0806BC02:
	ldr r3, _0806BC08 @ =0x086CF2FC
	b _0806BC1E
	.align 2, 0
_0806BC08: .4byte 0x086CF2FC
_0806BC0C:
	ldr r3, _0806BC10 @ =0x086CF41C
	b _0806BC1E
	.align 2, 0
_0806BC10: .4byte 0x086CF41C
_0806BC14:
	ldr r3, _0806BC18 @ =0x086CF314
	b _0806BC1E
	.align 2, 0
_0806BC18: .4byte 0x086CF314
_0806BC1C:
	ldr r3, _0806BC48 @ =0x086CF434
_0806BC1E:
	mov r0, sl
	str r0, [r4, #0x44]
	mov r1, sb
	str r1, [r4, #0x48]
	mov r0, r8
	str r0, [r4, #0x4c]
	str r3, [sp]
	adds r0, r7, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r5, r0, #0
	str r5, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BC4C
	movs r0, #0x58
	b _0806BC4E
	.align 2, 0
_0806BC48: .4byte 0x086CF434
_0806BC4C:
	movs r0, #0x98
_0806BC4E:
	strh r0, [r4, #0x32]
	movs r0, #0x50
	strh r0, [r4, #0x3a]
	ldr r0, _0806BC70 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806BC7A
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BC74
	ldrh r0, [r4, #0x32]
	subs r0, #0x18
	b _0806BC78
	.align 2, 0
_0806BC70: .4byte 0x0203E11C
_0806BC74:
	ldrh r0, [r4, #0x32]
	adds r0, #0x18
_0806BC78:
	strh r0, [r4, #0x32]
_0806BC7A:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BC96
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceX
	ldrh r1, [r4, #0x32]
	adds r1, r1, r0
	b _0806BCA6
_0806BC96:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceX
	ldrh r1, [r4, #0x32]
	subs r1, r1, r0
_0806BCA6:
	strh r1, [r5, #2]
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	ldr r1, [r4, #0x44]
	ldr r2, [r4, #0x48]
	bl efxDarkGradoGetPieceY
	ldrh r1, [r4, #0x3a]
	adds r1, r1, r0
	strh r1, [r5, #4]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

