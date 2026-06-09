	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80612E0, "ax", %progbits
@ sub_80612E0 @ JP 0x080612E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80612E0
	.thumb_func
sub_80612E0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061320 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061324 @ =0x08600724
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _08061328 @ =0x086730E8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r6, r0, #0
	str r6, [r4, #0x60]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806132C
	ldrh r0, [r6, #2]
	subs r0, #6
	b _08061330
	.align 2, 0
_08061320: .4byte 0x0201774C
_08061324: .4byte 0x08600724
_08061328: .4byte 0x086730E8
_0806132C:
	ldrh r0, [r6, #2]
	adds r0, #6
_08061330:
	strh r0, [r6, #2]
	ldr r0, _0806134C @ =0x08672B1C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08061350 @ =0x086729B0
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806134C: .4byte 0x08672B1C
_08061350: .4byte 0x086729B0

