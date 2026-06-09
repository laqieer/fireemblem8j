	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806ABE8, "ax", %progbits
@ sub_806ABE8 @ JP 0x0806ABE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806ABE8
	.thumb_func
sub_806ABE8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0806AC44 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806AC48 @ =0x08602918
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0x34
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r3, _0806AC4C @ =0x086101B4
	cmp r0, #0
	bne _0806AC18
	ldr r3, _0806AC50 @ =0x0860F5FC
_0806AC18:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _0806AC54 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806AC5E
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806AC58
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _0806AC72
	.align 2, 0
_0806AC44: .4byte 0x0201774C
_0806AC48: .4byte 0x08602918
_0806AC4C: .4byte 0x086101B4
_0806AC50: .4byte 0x0860F5FC
_0806AC54: .4byte 0x0203E11C
_0806AC58:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _0806AC72
_0806AC5E:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806AC6E
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _0806AC72
_0806AC6E:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_0806AC72:
	strh r0, [r4, #2]
	ldr r0, _0806AC90 @ =0x0860C640
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806AC94 @ =0x0860A83C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806AC90: .4byte 0x0860C640
_0806AC94: .4byte 0x0860A83C

