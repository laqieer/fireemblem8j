	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8065C9C, "ax", %progbits
@ sub_8065C9C @ JP 0x08065C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065C9C
	.thumb_func
sub_8065C9C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08065CF4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065CF8 @ =0x086016B0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x28
	strh r0, [r4, #0x2e]
	ldr r3, _08065CFC @ =0x0875DE94
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	strh r1, [r0, #2]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldr r0, _08065D00 @ =0x0875D358
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08065D04 @ =0x0875CEFC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065CF4: .4byte 0x0201774C
_08065CF8: .4byte 0x086016B0
_08065CFC: .4byte 0x0875DE94
_08065D00: .4byte 0x0875D358
_08065D04: .4byte 0x0875CEFC

