	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806D9A4, "ax", %progbits
@ sub_806D9A4 @ JP 0x0806D9A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D9A4
	.thumb_func
sub_806D9A4:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0806D9E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D9E4 @ =0x08603174
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806D9E8 @ =0x087179FC
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806D9EC
	movs r0, #0x58
	b _0806D9EE
	.align 2, 0
_0806D9E0: .4byte 0x0201774C
_0806D9E4: .4byte 0x08603174
_0806D9E8: .4byte 0x087179FC
_0806D9EC:
	movs r0, #0x98
_0806D9EE:
	strh r0, [r4, #2]
	movs r0, #0x54
	strh r0, [r4, #4]
	ldr r0, _0806DA10 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806DA1A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806DA14
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806DA18
	.align 2, 0
_0806DA10: .4byte 0x0203E11C
_0806DA14:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_0806DA18:
	strh r0, [r4, #2]
_0806DA1A:
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _0806DA2A
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _0806DA36
_0806DA2A:
	ldrh r1, [r4, #8]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #8]
_0806DA36:
	movs r0, #0x14
	strh r0, [r4, #0xa]
	bl AnimSort
	ldr r0, _0806DA58 @ =0x08716918
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	ldr r0, _0806DA5C @ =0x08716FC4
	movs r1, #0x20
	bl sub_805679C
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806DA58: .4byte 0x08716918
_0806DA5C: .4byte 0x08716FC4

