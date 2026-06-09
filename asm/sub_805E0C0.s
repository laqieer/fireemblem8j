	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805E0C0, "ax", %progbits
@ sub_805E0C0 @ JP 0x0805E0C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E0C0
	.thumb_func
sub_805E0C0:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0805E118 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E11C @ =0x085FF570
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x34
	strh r0, [r4, #0x2e]
	adds r0, r5, #0
	bl GetAnimPosition
	ldr r3, _0805E120 @ =0x0860DEB4
	cmp r0, #0
	bne _0805E0F0
	ldr r3, _0805E124 @ =0x0860D254
_0805E0F0:
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r0, _0805E128 @ =0x0860B53C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805E12C @ =0x0860A83C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E118: .4byte 0x0201774C
_0805E11C: .4byte 0x085FF570
_0805E120: .4byte 0x0860DEB4
_0805E124: .4byte 0x0860D254
_0805E128: .4byte 0x0860B53C
_0805E12C: .4byte 0x0860A83C

