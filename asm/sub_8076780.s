	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8076780, "ax", %progbits
@ sub_8076780 @ JP 0x08076780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076780
	.thumb_func
sub_8076780:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _08076834 @ =0x02020134
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	movs r4, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl sub_8012E84
	strh r0, [r5]
	ldr r5, _08076838 @ =0x02020136
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x90
	bl sub_8012E84
	strh r0, [r5]
	movs r2, #0x50
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	bl sub_8012E84
	adds r5, r0, #0
	movs r0, #0x2c
	ldrsh r3, [r7, r0]
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl sub_8012E84
	adds r6, r0, #0
	ldr r0, _0807683C @ =0x03004920
	ldr r1, [r0]
	movs r0, #0x50
	subs r0, r0, r5
	strh r0, [r1, #0x36]
	ldr r0, _08076840 @ =0x020165C8
	ldr r4, _08076844 @ =0x020228A8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r4, #0
	bl sub_80D636C
	adds r0, r4, #0
	movs r1, #2
	movs r2, #4
	adds r3, r6, #0
	bl sub_80737A4
	adds r0, r4, #0
	movs r1, #0x13
	movs r2, #0xc
	adds r3, r6, #0
	bl sub_80737A4
	bl sub_8001EE4
	movs r0, #7
_0807680C:
	subs r0, #1
	cmp r0, #0
	bge _0807680C
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	ble _0807682A
	movs r0, #0
	strh r0, [r7, #0x2c]
	adds r0, r7, #0
	bl sub_8002DE4
_0807682A:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076834: .4byte 0x02020134
_08076838: .4byte 0x02020136
_0807683C: .4byte 0x03004920
_08076840: .4byte 0x020165C8
_08076844: .4byte 0x020228A8

