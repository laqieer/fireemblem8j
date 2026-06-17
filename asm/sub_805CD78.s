	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_805CF64, 0x0805CF64 + 1
	.section .text.sub_805CD78, "ax", %progbits
@ sub_805CD78 @ JP 0x0805CD78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CD78
	.thumb_func
sub_805CD78:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805CDBC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CDC0 @ =0x085FF2D0
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r1, _0805CDC4 @ =0x08604E24
	ldr r2, _0805CDC8 @ =0x08604A8C
	ldr r3, _0805CDCC @ =0x08604E80
	ldr r0, _0805CDD0 @ =0x08604AE8
	str r0, [sp]
	adds r0, r4, #0
	bl sub_80564F0
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CDD4
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805CDD8
	.align 2, 0
_0805CDBC: .4byte 0x0201774C
_0805CDC0: .4byte 0x085FF2D0
_0805CDC4: .4byte 0x08604E24
_0805CDC8: .4byte 0x08604A8C
_0805CDCC: .4byte 0x08604E80
_0805CDD0: .4byte 0x08604AE8
_0805CDD4:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805CDD8:
	strh r0, [r5, #2]
	ldr r0, _0805CDE8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805CDEC
	movs r0, #0x23
	b _0805CDEE
	.align 2, 0
_0805CDE8: .4byte 0x0203E11C
_0805CDEC:
	movs r0, #0xa
_0805CDEE:
	strh r0, [r6, #0x2e]
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_805CF64
	str r0, [r6, #0x64]
	ldr r0, _0805CE14 @ =0x08604784
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805CE18 @ =0x08604384
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CE14: .4byte 0x08604784
_0805CE18: .4byte 0x08604384

