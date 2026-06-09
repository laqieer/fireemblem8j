	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806BE8C, "ax", %progbits
@ sub_806BE8C @ JP 0x0806BE8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806BE8C
	.thumb_func
sub_806BE8C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	adds r5, r3, #0
	ldr r4, [sp, #0x20]
	ldr r1, _0806BEEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806BEF0 @ =0x08602D84
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	str r6, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r4, [r7, #0x2e]
	str r5, [r7, #0x44]
	str r0, [r7, #0x48]
	ldr r3, _0806BEF4 @ =0x086CFA70
	ldr r2, _0806BEF8 @ =0x086CF994
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r7, #0x60]
	movs r0, #0x68
	strh r0, [r4, #2]
	mov r0, r8
	strh r0, [r4, #4]
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BEFC
	ldrh r0, [r4, #2]
	mov r1, sb
	subs r0, r0, r1
	b _0806BF00
	.align 2, 0
_0806BEEC: .4byte 0x0201774C
_0806BEF0: .4byte 0x08602D84
_0806BEF4: .4byte 0x086CFA70
_0806BEF8: .4byte 0x086CF994
_0806BEFC:
	ldrh r0, [r4, #2]
	add r0, sb
_0806BF00:
	strh r0, [r4, #2]
	ldr r0, _0806BF1C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806BF26
	ldr r0, [r7, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806BF20
	ldrh r0, [r4, #2]
	subs r0, #0x18
	b _0806BF24
	.align 2, 0
_0806BF1C: .4byte 0x0203E11C
_0806BF20:
	ldrh r0, [r4, #2]
	adds r0, #0x18
_0806BF24:
	strh r0, [r4, #2]
_0806BF26:
	ldrh r0, [r4, #2]
	strh r0, [r7, #0x32]
	ldrh r0, [r4, #4]
	strh r0, [r7, #0x3a]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

