	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805E24C, "ax", %progbits
@ sub_805E24C @ JP 0x0805E24C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E24C
	.thumb_func
sub_805E24C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, _0805E2A8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E2AC @ =0x085FF5A0
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
	ldr r3, _0805E2B0 @ =0x086101B4
	cmp r0, #0
	bne _0805E27C
	ldr r3, _0805E2B4 @ =0x0860F5FC
_0805E27C:
	str r3, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	ldr r0, _0805E2B8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0805E2C2
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E2BC
	ldrh r0, [r4, #2]
	adds r0, #0x10
	b _0805E2D6
	.align 2, 0
_0805E2A8: .4byte 0x0201774C
_0805E2AC: .4byte 0x085FF5A0
_0805E2B0: .4byte 0x086101B4
_0805E2B4: .4byte 0x0860F5FC
_0805E2B8: .4byte 0x0203E11C
_0805E2BC:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	b _0805E2D6
_0805E2C2:
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E2D2
	ldrh r0, [r4, #2]
	adds r0, #0x48
	b _0805E2D6
_0805E2D2:
	ldrh r0, [r4, #2]
	subs r0, #0x48
_0805E2D6:
	strh r0, [r4, #2]
	ldr r0, _0805E2F4 @ =0x0860B53C
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805E2F8 @ =0x0860A83C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E2F4: .4byte 0x0860B53C
_0805E2F8: .4byte 0x0860A83C

