	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8069A14, "ax", %progbits
@ sub_8069A14 @ JP 0x08069A14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069A14
	.thumb_func
sub_8069A14:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	ldr r1, _08069A80 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069A84 @ =0x08602538
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r6, #0
	bl GetAnimAnotherSide
	str r0, [r4, #0x5c]
	movs r5, #0
	strh r5, [r4, #0x2c]
	mov r0, r8
	strh r0, [r4, #0x2e]
	ldr r3, _08069A88 @ =0x086EA634
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldrh r1, [r0, #4]
	adds r1, #0xc
	strh r1, [r0, #4]
	strh r5, [r0, #6]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	ldr r0, _08069A8C @ =0x086EA344
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08069A90 @ =0x086E9E38
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08069A80: .4byte 0x0201774C
_08069A84: .4byte 0x08602538
_08069A88: .4byte 0x086EA634
_08069A8C: .4byte 0x086EA344
_08069A90: .4byte 0x086E9E38

